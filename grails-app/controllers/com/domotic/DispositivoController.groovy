package com.domotic



import static org.springframework.http.HttpStatus.*
import com.domotic.manager.CommunicationManager
import com.domotic.manager.CommunicationManager.MESSAGE_TYPE;

import grails.converters.JSON
import grails.transaction.Transactional
import com.domotic.valueobjects.ApplicationMessages

@Transactional(readOnly = true)
class DispositivoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dispositivo.list(params), model:[dispositivoInstanceCount: Dispositivo.count()]
    }

    def show(Dispositivo dispositivoInstance) {
        respond dispositivoInstance
    }

    def create() {
        respond new Dispositivo(params)
    }

    @Transactional
    def save(Dispositivo dispositivoInstance) {
        if (dispositivoInstance == null) {
            notFound()
            return
        }
		
		EstadoDispositivo estado = new EstadoDispositivo()
		estado.estado=0
		estado.tipoDeFuncionamiento=0
		estado.temperatura=-1
		estado.save flush:true
		println estado.id
		dispositivoInstance.estado=estado
		dispositivoInstance.validate()

        if (dispositivoInstance.hasErrors()) {
            respond dispositivoInstance.errors, view:'create'
            return
        }
		
		

        dispositivoInstance.save flush:true
		dispositivoInstance.estadoDispositivoURL =
		g.createLink(controller:"dispositivo", action:"estadoDispositivo", id:dispositivoInstance.id, absolute:"true")
		
		dispositivoInstance.actualizaEstadoDispositivoURL=
		g.createLink(controller:"dispositivo", action:"actualizaEstadoDispositivo", id:dispositivoInstance.id, absolute:"true")

		dispositivoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dispositivo.label', default: 'Dispositivo'), dispositivoInstance.id])
                redirect dispositivoInstance
            }
            '*' { respond dispositivoInstance, [status: CREATED] }
        }
    }

    def edit(Dispositivo dispositivoInstance) {
        respond dispositivoInstance
    }

    @Transactional
    def update(Dispositivo dispositivoInstance) {
        if (dispositivoInstance == null) {
            notFound()
            return
        }

        if (dispositivoInstance.hasErrors()) {
            respond dispositivoInstance.errors, view:'edit'
            return
        }

        dispositivoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Dispositivo.label', default: 'Dispositivo'), dispositivoInstance.id])
                redirect dispositivoInstance
            }
            '*'{ respond dispositivoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Dispositivo dispositivoInstance) {

        if (dispositivoInstance == null) {
            notFound()
            return
        }

        dispositivoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Dispositivo.label', default: 'Dispositivo'), dispositivoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dispositivo.label', default: 'Dispositivo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def status() {
		Dispositivo device = findDevice()
		if(device){
			JSON.use('deep') {
				render device as JSON
			}
		}
		else if(user.dispositivos.find {it.id==new Integer(params.id)}==null){
			def resp = ApplicationMessages.DEVICE_NOT_ASSOCIATED_TO_USER
			render resp as JSON
		}
	}
	
	def estadoDispositivo(){
		Dispositivo device = findDevice()
		if(device){
			JSON.use('deep') {
				render device.estado as JSON
			}
		}
		else if(user.dispositivos.find {it.id==new Integer(params.id)}==null){
			def resp = ApplicationMessages.DEVICE_NOT_ASSOCIATED_TO_USER
			render resp as JSON
		}
		
	}
	
	def actualizaEstadoDispositivo() {
		Dispositivo device = findDevice()
		if(device){
			CommunicationManager commManager = device.getCommManager()
			def json = request.JSON
			def messageType = null
			def estado = null
			if(json.messageType=="update"){
				messageType=CommunicationManager.MESSAGE_TYPE.UPDATE_STATUS
			}
			else if(json.messageType=="send"){
				messageType=CommunicationManager.MESSAGE_TYPE.SEND_COMMAND
				estado = new EstadoDispositivo(estado:json.estado,
					tipoDeFuncionamiento:json.tipoFunc,temperatura:json.temperatura)
			} 
			else{
				def resp = ApplicationMessages.INVALID_UPDATE_STATUS
				render resp as JSON
			}
			
			LogRequest logRequest = generateLogRequest(request.user,device,estado, 
				messageType)
			
			String message = commManager.createMessage(logRequest, estado, 
				messageType)
			
			if(commManager.sendMessage(message, device.direccion)){
				logRequest.save flush:true
				def resp = ApplicationMessages.SUCCESS_REPLY
				resp.putAt("checkURL", g.createLink(controller:"logRequest", action:"check", id:logRequest.communicationId, absolute:"true"))
				render resp as JSON
			}
			else{
				def resp = ApplicationMessages.ERROR_SENDING_SMS
				render resp as JSON
			}
		}
		else if(user.dispositivos.find {it.id==new Integer(params.id)}==null){
			def resp = ApplicationMessages.DEVICE_NOT_ASSOCIATED_TO_USER
			render resp as JSON
		}
	}
	
	protected Dispositivo findDevice(){
		def user = request.user
		if (user && user.dispositivos.find {it.id==new Integer(params.id)}!=null){
			def device = user.dispositivos.find {it.id==new Integer(params.id)}
			return device	
		}
		
	}
	
	protected LogRequest generateLogRequest(User user, Dispositivo dispositivo, EstadoDispositivo estado, 
		MESSAGE_TYPE messageType){
		LogRequest req = new LogRequest()
		req.latest=1
		req.timeStamp=new Date()
		req.statusRequest=LogRequest.STATUS_REQUEST.PENDING
		req.user=user
		req.dispositivo=dispositivo
		if(messageType==MESSAGE_TYPE.SEND_COMMAND){
			req.estado=estado.estado
			req.temperatura=estado.temperatura
			req.tipoDeFuncionamiento=estado.tipoDeFuncionamiento
		}
		req.communicationId = getNextCommId()
		
		return req
	}
	
	private Integer getNextCommId(){
		Integer res = 0
		LogRequest[] latest = LogRequest.list(max:1, offset:0, sort:"communicationId", order:"desc")
		if(latest)
			res = ((latest[0]).communicationId)+1
		
		return res
	}
}

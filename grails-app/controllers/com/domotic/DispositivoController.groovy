package com.domotic



import static org.springframework.http.HttpStatus.*
import com.domotic.manager.CommunicationManager
import com.domotic.manager.CommunicationManager.MESSAGE_TYPE;

import grails.converters.JSON
import grails.transaction.Transactional
import com.domotic.valueobjects.ApplicationMessages
import com.domotic.manager.web.RestClientManager
import grails.util.Environment

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
		estado.temperatura=10
		estado.save flush:true
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
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'dispositivo.label', default: 'Dispositivo'),
					dispositivoInstance.id
				])
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
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Dispositivo.label', default: 'Dispositivo'),
					dispositivoInstance.id
				])
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
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Dispositivo.label', default: 'Dispositivo'),
					dispositivoInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'dispositivo.label', default: 'Dispositivo'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def status() {
		Dispositivo device = findDevice(false)
		if(device){
			JSON.use('deep') { render device as JSON }
		}
		else if(user.dispositivos.find {it.id==new Integer(params.id)}==null){
			def resp = ApplicationMessages.DEVICE_NOT_ASSOCIATED_TO_USER
			render resp as JSON
		}
	}

	def estadoDispositivo(){
		Dispositivo device = findDevice(false)
		if(device){
			JSON.use('deep') { render device.estado as JSON }
		}
		else if(user.dispositivos.find {it.id==new Integer(params.id)}==null){
			def resp = ApplicationMessages.DEVICE_NOT_ASSOCIATED_TO_USER
			render resp as JSON
		}
	}

	@Transactional
	def actualizaEstadoDispositivo() {

		Dispositivo device = findDevice(false)
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
			log.error "Environment: "+Environment.current
			println "Environment: "+Environment.current==Environment.DEVELOPMENT
			if(commManager.sendMessage(message, device.direccion, Environment.current == Environment.DEVELOPMENT)){
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
		else{
			def resp = ApplicationMessages.DEVICE_NOT_FOUND
			render resp as JSON
		}
	}

	def actualizaEstadoDispositivoWeb(){
		def json = request.JSON
		println json
		Dispositivo device = findDevice(true)
		if(device){
			def estado = json.estado
			def tipoFunc = json.tipoFunc
			if(sameStatus(estado, tipoFunc, new Integer(json.temperatura), device)){
				def resp = ApplicationMessages.SAME_REPLY
				render resp as JSON
			}
			else{
				def parameters = ["userName":session.user.userName, "password":session.user.password,
					"messageType":"send", "estado":estado,
					"tipoFunc":tipoFunc,"temperatura":json.temperatura]
				def resp = RestClientManager.getResponseFromService(device.actualizaEstadoDispositivoURL,
						parameters)
				if(resp.status=="error"){
					render resp as JSON
				}
				else{
					def respWeb = ApplicationMessages.SUCCESS_REPLY
					respWeb.putAt("checkURL", resp.checkURL)
					render respWeb as JSON
				}
			}
		}
		else{
			def resp = ApplicationMessages.DEVICE_NOT_FOUND
			render resp as JSON
		}
	}

	def checkStatusWeb(){
		Thread.sleep(10000)
		def json = request.JSON
		def parametersCheck = ["userName":session.user.userName, "password":session.user.password]
		def respWeb = ApplicationMessages.SUCCESS_REPLY

		def checkResp = RestClientManager.getResponseFromService(json.checkURL,
				parametersCheck)
		if(checkResp.status=="error"){
			render checkResp as JSON
		}
		else{
			def logRequest = new LogRequest()
			logRequest.properties=checkResp
			if(checkResp.statusRequest.name==LogRequest.STATUS_REQUEST.REPLIED.name()){
				respWeb = [status: "success"]
				respWeb.putAt("estado",logRequest.estado)
				respWeb.putAt("tipoDeFunc",logRequest.tipoDeFuncionamiento)
				respWeb.putAt("temperatura",logRequest.temperatura)
				respWeb.putAt("lastUpdate",g.formatDate(date:logRequest.timeStamp, format:"dd-MM-yyyy HH:mm:ss"))
			}
			else {
				respWeb = ApplicationMessages.WAIT_REPLY
			}
			render respWeb as JSON
		}
	}

	protected Dispositivo findDevice(Boolean inSession){
		def user = request.user
		if(inSession)
			user = session.user
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

	private Boolean sameStatus(Boolean estado, Boolean tipoFunc, Integer temperatura,
			Dispositivo device){
		return device.estado.estado==estado && device.estado.tipoDeFuncionamiento==tipoFunc && device.estado.temperatura==temperatura
	}
}

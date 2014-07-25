package com.domotic



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional
import com.domotic.valueobjects.ApplicationMessages

@Transactional(readOnly = true)
class LogRequestController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LogRequest.list(params), model:[logRequestInstanceCount: LogRequest.count()]
    }

    def show(LogRequest logRequestInstance) {
        respond logRequestInstance
    }

    def create() {
        respond new LogRequest(params)
    }

    @Transactional
    def save(LogRequest logRequestInstance) {
        if (logRequestInstance == null) {
            notFound()
            return
        }

        if (logRequestInstance.hasErrors()) {
            respond logRequestInstance.errors, view:'create'
            return
        }

        logRequestInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'logRequest.label', default: 'LogRequest'), logRequestInstance.id])
                redirect logRequestInstance
            }
            '*' { respond logRequestInstance, [status: CREATED] }
        }
    }

    def edit(LogRequest logRequestInstance) {
        respond logRequestInstance
    }

    @Transactional
    def update(LogRequest logRequestInstance) {
        if (logRequestInstance == null) {
            notFound()
            return
        }

        if (logRequestInstance.hasErrors()) {
            respond logRequestInstance.errors, view:'edit'
            return
        }

        logRequestInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LogRequest.label', default: 'LogRequest'), logRequestInstance.id])
                redirect logRequestInstance
            }
            '*'{ respond logRequestInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LogRequest logRequestInstance) {

        if (logRequestInstance == null) {
            notFound()
            return
        }

        logRequestInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LogRequest.label', default: 'LogRequest'), logRequestInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	def check() {
		def user = request.user
		LogRequest logRequest = LogRequest.find ("from LogRequest where latest=1 and communicationId="+params.id)
		if(logRequest){
			if(logRequest.user.id==user.id){
				render logRequest as JSON
			}
			else{
				def resp = ApplicationMessages.REQUEST_NOT_FOR_USER
				render resp as JSON
			}
					
		}
		else{
			def resp = ApplicationMessages.REQUEST_NOT_FOUND
			render resp as JSON
		}
		
	}
	
	def receiveSMSReply(){
		def body = request.getParameter("Body")
		println body
		def jsonBody = JSON.parse(body)
		def commId = jsonBody.Id
		println commId
		def status = jsonBody.status
		def temperatura = jsonBody.temperatura
		def tipoDeFuncionamiento = jsonBody.tipoDeFuncionamiento
		LogRequest logRequest = LogRequest.find ("from LogRequest where latest=1 and communicationId="+commId)
		if(logRequest){
			if(logRequest.statusRequest==LogRequest.STATUS_REQUEST.PENDING){
				logRequest.latest=0
				logRequest.save flush:true
				def logRequest2 = new LogRequest()
				logRequest2.properties = logRequest.properties
				logRequest2.statusRequest=LogRequest.STATUS_REQUEST.REPLIED
				logRequest2.latest=1
				logRequest2.estado=status
				logRequest2.temperatura=temperatura
				logRequest2.tipoDeFuncionamiento=tipoDeFuncionamiento
				logRequest.dispositivo.statusRequest=Dispositivo.WEB_STATUS_REQUEST.OK
				logRequest2.save flush:true
				logRequest.dispositivo.estado.estado=status
				logRequest.dispositivo.estado.tipoDeFuncionamiento=tipoDeFuncionamiento
				logRequest.dispositivo.estado.temperatura=temperatura
				logRequest.dispositivo.estado.lastUpdate= new Date()
				logRequest.dispositivo.estado.save flush:true
				logRequest.dispositivo.save flush:true
			}
		}
		render "</Response>"
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'logRequest.label', default: 'LogRequest'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

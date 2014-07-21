package com.domotic



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstadoDispositivoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoDispositivo.list(params), model:[estadoDispositivoInstanceCount: EstadoDispositivo.count()]
    }

    def show(EstadoDispositivo estadoDispositivoInstance) {
        respond estadoDispositivoInstance
    }

    def create() {
        respond new EstadoDispositivo(params)
    }

    @Transactional
    def save(EstadoDispositivo estadoDispositivoInstance) {
        if (estadoDispositivoInstance == null) {
            notFound()
            return
        }

        if (estadoDispositivoInstance.hasErrors()) {
            respond estadoDispositivoInstance.errors, view:'create'
            return
        }

        estadoDispositivoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoDispositivo.label', default: 'EstadoDispositivo'), estadoDispositivoInstance.id])
                redirect estadoDispositivoInstance
            }
            '*' { respond estadoDispositivoInstance, [status: CREATED] }
        }
    }

    def edit(EstadoDispositivo estadoDispositivoInstance) {
        respond estadoDispositivoInstance
    }

    @Transactional
    def update(EstadoDispositivo estadoDispositivoInstance) {
        if (estadoDispositivoInstance == null) {
            notFound()
            return
        }

        if (estadoDispositivoInstance.hasErrors()) {
            respond estadoDispositivoInstance.errors, view:'edit'
            return
        }

        estadoDispositivoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EstadoDispositivo.label', default: 'EstadoDispositivo'), estadoDispositivoInstance.id])
                redirect estadoDispositivoInstance
            }
            '*'{ respond estadoDispositivoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoDispositivo estadoDispositivoInstance) {

        if (estadoDispositivoInstance == null) {
            notFound()
            return
        }

        estadoDispositivoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EstadoDispositivo.label', default: 'EstadoDispositivo'), estadoDispositivoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoDispositivo.label', default: 'EstadoDispositivo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

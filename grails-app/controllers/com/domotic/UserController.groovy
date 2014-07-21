package com.domotic



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional
import com.domotic.valueobjects.ApplicationMessages

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }
		
        userInstance.save flush:true
		
		userInstance.listDispositivosURL =
		g.createLink(controller:"user", action:"listaDispositivos", id:userInstance.id, absolute:"true")

		userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def login() {
		def user = request.user
		if (user){			
			JSON.use('deep') {
			    render user as JSON
			}
		}
	}
	
	def listaDispositivos() {
		def user = request.user
		if (user){
			if(user.id==params.id){
				JSON.use('deep') {
					render user.dispositivos as JSON
				}
			}
			else{
				def resp = ApplicationMessages.USER_PASSWORD_NOT_ID
				render resp as JSON
			}
		}
		
	}
	
	def loginWeb(User userInstance) {
		if(!userInstance)
			render view:"loginWeb"
		else{
			def user = User.findWhere(userName:userInstance.userName,
				password:userInstance.password)
			if (user){
				session.user=user
				redirect (view:"index.gsp")
			}
			else{
				flash.message = "Nombre de usuario o contrase–a incorrecta"
				redirect(controller:'user',action:'loginWeb')
			}
		}	
	}
	
	def logoutWeb() {
		session.invalidate()
		redirect(controller:'user', action:'loginWeb')
	}
	
	def indexWeb() {
		render view:"index"
	}
	
	def indexAdmin() {
		render view:"indexAdmin"
	}
	
	def renderError(){
		render request.error
	}
}

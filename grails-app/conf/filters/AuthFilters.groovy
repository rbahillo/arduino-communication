package filters

import com.domotic.User;

import grails.converters.JSON
import com.domotic.valueobjects.ApplicationMessages

class AuthFilters {

	def filters = {
		authRESTFilter(controller:'user|dispositivo|logRequest',
		action:'login|listaDispositivos|status|estadoDispositivo|actualizaEstadoDispositivo|check') {
			before = {
				def json = request.JSON
				def user = User.findWhere(userName:json.userName,
				password:json.password)
				if (user){
					request.user=user
				}
				else{
					request.error=ApplicationMessages.USER_PASSWORD_NOT_VALID as JSON
					forward(controller: "user", action:"renderError")
					return false
				}
			}
		}

		authWebFilter(controller:'user|dispositivo|logRequest|price',
		action:'index|show|create|save|update|delete|indexWeb|indexAdmin|actualizaEstadoDispositivoWeb') {
			before = {
				if(!session.user) {
					// i.e. user not logged in
					flash.message="Usuario no logado o sin permisos"
					redirect(controller:'user', action:'loginWeb')
					return false
				}
			}
			after = {
				session.user=User.findWhere(userName:session.user.userName, password:session.user.password)
			}
		}

		authWebAdminFilter(controller:'user|dispositivo|logRequest|price',
		action:'show|create|save|update|delete|indexAdmin') {
			before = {
				User user = session.user
				if(!user.admin){
					// i.e. user not logged in
					redirect(controller:'user',action:'indexWeb')
					return false
				}
			}
		}
	}
}

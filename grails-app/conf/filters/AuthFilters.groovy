package filters

import com.domotic.User;

import grails.converters.JSON
import com.domotic.valueobjects.ApplicationMessages

class AuthFilters {

    def filters = {
        authFilter(controller:'user|dispositivo|logRequest', 
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
    }
}

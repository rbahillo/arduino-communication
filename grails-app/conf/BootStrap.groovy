import grails.util.Environment;

import com.domotic.Dispositivo
import com.domotic.EstadoDispositivo;
import com.domotic.User
import com.domotic.Price

class BootStrap {
	
	User u = null
	Dispositivo d = null
	EstadoDispositivo ed = null
	Price price = null

    def init = { servletContext ->
		
		environments {
			development {
				ed=new EstadoDispositivo(estado:false,tipoDeFuncionamiento:false,temperatura:10, lastUpdate:new Date())
				d=new Dispositivo(tipoDeComunicacion:Dispositivo.COMMUNICATIONS_TYPE.SMS,nombreDeDispositivo:"Aire La Adrada"
								,tipoDeDispositivo:Dispositivo.DEVICE_TYPE.AIRE,direccion:"+34672289728",estado:ed,
								estadoDispositivoURL:"http://localhost:8080/arduino-communcation/dispositivo/estadoDispositivo/1/"
								,actualizaEstadoDispositivoURL:"http://localhost:8080/arduino-communcation/dispositivo/actualizaEstadoDispositivo/1/"
								,statusRequest:Dispositivo.WEB_STATUS_REQUEST.OK, usaTarifaHoraria:true)
				if(!User.count()){
					u=new User(admin:true,userName:"ricky",password:"Opodo123",
						listDispositivosURL:"http://localhost:8080/arduino-communcation/user/listaDispositivos/1/")
					u.addToDispositivos(d)
					ed.save flush:true
					d.save flush:true
					u.save flush:true
				}
				if(!Price.count()){
					Date date = new Date()
					Map prices = ["0":"100", "1":"101", "2":"101"]
					price = new Price (date: date, prices: prices)
					price.save flush:true
				}
			}
			production{
				if(!User.count()){
					u=new User(admin:true,userName:"ricky",password:"Opodo123",
						listDispositivosURL:"http://arduino-communication.herokuapp.com/arduino-communcation/user/listaDispositivos/1/")
					u.save flush:true
				}
			}
		}
    }
    def destroy = {
    }
}

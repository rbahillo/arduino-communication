import grails.util.Environment;

import com.domotic.Dispositivo
import com.domotic.EstadoDispositivo;
import com.domotic.User

class BootStrap {
	
	User u = null
	Dispositivo d = null
	EstadoDispositivo ed = null

    def init = { servletContext ->
		
		environments {
			
				ed=new EstadoDispositivo(estado:false,tipoDeFuncionamiento:false,temperatura:-1, lastUpdate:new Date())
				d=new Dispositivo(tipoDeComunicacion:Dispositivo.COMMUNICATIONS_TYPE.SMS,nombreDeDispositivo:"Aire La Adrada"
								,tipoDeDispositivo:Dispositivo.DEVICE_TYPE.AIRE,direccion:"+34672289728",estado:ed,
								estadoDispositivoURL:"http://localhost:8080/arduino-communcation/dispositivo/estadoDispositivo/1/"
								,statusRequest:Dispositivo.WEB_STATUS_REQUEST.OK)
				if(!User.count()){
					u=new User(admin:true,userName:"ricky",password:"Opodo123",
						listDispositivosURL:"http://localhost:8080/arduino-communcation/user/listaDispositivos/1/")
					u.addToDispositivos(d)
					ed.save flush:true
					d.save flush:true
					u.save flush:true
				}
		}
    }
    def destroy = {
    }
}

package com.domotic

import com.domotic.manager.CommunicationManager
import com.domotic.manager.SMSCommunicationManager
import com.domotic.manager.WifiCommunicationManager

class Dispositivo {
	
	enum COMMUNICATIONS_TYPE {
		WIFI, SMS
	}
	
	COMMUNICATIONS_TYPE tipoDeComunicacion
	
	String nombreDeDispositivo
	
	enum DEVICE_TYPE{
		AIRE, CALENTADOR, ENCHUFE
	}
	
	DEVICE_TYPE tipoDeDispositivo
	
	String direccion
	
	EstadoDispositivo estado
	
	String estadoDispositivoURL = ""
	
	String actualizaEstadoDispositivoURL = ""

    static constraints = {
		estadoDispositivoURL nullable:true
		actualizaEstadoDispositivoURL nullable:true
		
    }
	
	static transients = ['getCommManager']
	
	public CommunicationManager getCommManager(){
		if(tipoDeComunicacion==COMMUNICATIONS_TYPE.SMS)
			return new SMSCommunicationManager();
		else
			return new WifiCommunicationManager();
		
	}
}

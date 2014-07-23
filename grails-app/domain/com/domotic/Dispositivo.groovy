package com.domotic

import com.domotic.LogRequest.STATUS_REQUEST;
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
	
	enum WEB_STATUS_REQUEST{
		PENDING, OK, ERROR
	}
	
	WEB_STATUS_REQUEST statusRequest

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

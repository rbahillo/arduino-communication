package com.domotic.manager

import com.domotic.Dispositivo;
import com.domotic.EstadoDispositivo;
import com.domotic.LogRequest;
import com.domotic.manager.CommunicationManager.MESSAGE_TYPE;

class WifiCommunicationManager extends CommunicationManager {

	@Override
	public Boolean sendMessage (Dispositivo device,EstadoDispositivo newEstado, LogRequest logRequest, MESSAGE_TYPE messageType,Boolean test){

		String estado = (newEstado.estado) ? "1" : "0"
		String tipo = (newEstado.tipoDeFuncionamiento) ? "1" : "0"
		String urlString = device.direccion+"/"+logRequest.communicationId+"/"+device.id+"/"+
				estado+"/"+tipo+"/"+
				newEstado.temperatura.round()
		println urlString
		def url = new URL(urlString)
		HttpURLConnection connection = (HttpURLConnection) url.openConnection()
		connection.setRequestMethod("GET")
		// connection.setConnectTimeout(10000)
		connection.connect()
		if (connection.responseCode == 200 || connection.responseCode == 201) {
			def logRequest2 = new LogRequest()
			logRequest2.properties = logRequest.properties
			logRequest2.statusRequest=LogRequest.STATUS_REQUEST.REPLIED
			logRequest2.latest=1
			logRequest2.estado=newEstado.estado
			logRequest2.temperatura=newEstado.temperatura
			logRequest2.tipoDeFuncionamiento=newEstado.tipoDeFuncionamiento
			logRequest.dispositivo.statusRequest=Dispositivo.WEB_STATUS_REQUEST.OK
			logRequest.latest=0
			logRequest2.save flush:true
			device.estado.estado=newEstado.estado
			device.estado.tipoDeFuncionamiento=newEstado.tipoDeFuncionamiento
			device.estado.temperatura=newEstado.temperatura
			device.estado.lastUpdate= new Date()
			device.estado.save flush:true
			device.save flush:true
		}
		return true
	}

}

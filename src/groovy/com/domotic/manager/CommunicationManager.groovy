package com.domotic.manager

import grails.transaction.Transactional;

import com.domotic.EstadoDispositivo
import com.domotic.LogRequest
import com.domotic.User;


abstract class CommunicationManager {
	
	static final enum MESSAGE_TYPE {UPDATE_STATUS, SEND_COMMAND}
	
	//@Transactional
	public String createMessage(LogRequest logRequest, EstadoDispositivo dispositivo, MESSAGE_TYPE messageType){
		String message = new String()
		if(messageType==MESSAGE_TYPE.SEND_COMMAND){
			message+="messageType:new_status,"
			message+="status:"+dispositivo.estado+","
			message+="temperatura:"+dispositivo.temperatura+","
			message+="tipoDeFuncionamiento:"+dispositivo.tipoDeFuncionamiento+","
		} else if (messageType==MESSAGE_TYPE.UPDATE_STATUS){
			message+="messageType:get_status"
		}
		
		message="Id:"+logRequest.communicationId+","+message
		
		
		return message;
	}
	
	abstract public Boolean sendMessage (String message, String address, Boolean test);
	
	

}

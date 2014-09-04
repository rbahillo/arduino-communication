package com.domotic.manager

import grails.transaction.Transactional;

import com.domotic.EstadoDispositivo
import com.domotic.Dispositivo
import com.domotic.LogRequest
import com.domotic.User;


abstract class CommunicationManager {
	
	static final enum MESSAGE_TYPE {UPDATE_STATUS, SEND_COMMAND}
	
	//@Transactional
	
	abstract public Boolean sendMessage (Dispositivo device, EstadoDispositivo estado, LogRequest logRequest, MESSAGE_TYPE messageType,Boolean test);
	
	

}

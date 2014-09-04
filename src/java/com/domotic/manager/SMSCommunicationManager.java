package com.domotic.manager;

import java.util.*; 

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.domotic.Dispositivo;
import com.domotic.EstadoDispositivo;
import com.domotic.LogRequest;
import com.domotic.manager.CommunicationManager.MESSAGE_TYPE;
import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*; 

public class SMSCommunicationManager extends CommunicationManager {

	public static final String ACCOUNT_SID = "AC9e366d385e24ee440ecfd045182a22c7";
	public static final String AUTH_TOKEN = "2e60fb8c970ed5e37f918a2612fcd086";
	
	   

	@Override
	public Boolean sendMessage (Dispositivo device,EstadoDispositivo estado, LogRequest logRequest, MESSAGE_TYPE messageType,Boolean test){
		
		String message = createMessage(logRequest, estado, messageType);
		Boolean res = true;
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
	
		// Build the parameters
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("From", "+34983060598"));
		params.add(new BasicNameValuePair("To", device.getDireccion()));
		params.add(new BasicNameValuePair("Body", message));
		//System.out.println(message);
		MessageFactory messageFactory = client.getAccount().getMessageFactory();
		Message twiloMessage;
		try {
			if(!test)
				twiloMessage = messageFactory.create(params);
		} catch (TwilioRestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res = false;
		}
		return res;
		
	}
	
	private String createMessage(LogRequest logRequest, EstadoDispositivo dispositivo, MESSAGE_TYPE messageType){
		String message = new String();
		if(messageType==MESSAGE_TYPE.SEND_COMMAND){
			message+="messageType:new_status,";
			message+="status:"+dispositivo.getEstado()+",";
			message+="temperatura:"+dispositivo.getTemperatura()+",";
			message+="tipoDeFuncionamiento:"+dispositivo.getTipoDeFuncionamiento()+",";
		} else if (messageType==MESSAGE_TYPE.UPDATE_STATUS){
			message+="messageType:get_status";
		}
		
		message="Id:"+logRequest.getCommunicationId()+","+message;
		
		
		return message;
	}

}

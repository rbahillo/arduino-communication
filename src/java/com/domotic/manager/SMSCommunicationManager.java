package com.domotic.manager;

import java.util.*; 

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*; 

public class SMSCommunicationManager extends CommunicationManager {

	public static final String ACCOUNT_SID = "AC9e366d385e24ee440ecfd045182a22c7";
	public static final String AUTH_TOKEN = "2e60fb8c970ed5e37f918a2612fcd086";
	
	   

	@Override
	public Boolean sendMessage(String message, String address, Boolean test) {
		
		Boolean res = true;
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
	
		// Build the parameters
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("From", "+34983060598"));
		params.add(new BasicNameValuePair("To", address));
		params.add(new BasicNameValuePair("Body", message));
	
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

}

package com.domotic.manager.web

import org.codehaus.groovy.grails.web.json.JSONObject

class RestClientManager {
	
	
	public static JSONObject getResponseFromService(String service, Map parameters){
		
		def rest = new grails.plugins.rest.client.RestBuilder()
		def resp = rest.post(service){
			contentType "application/json"
			json {
				parameters
			}
		}
		return resp.json
		
	}

}

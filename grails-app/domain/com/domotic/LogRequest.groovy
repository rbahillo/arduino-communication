package com.domotic

class LogRequest {
	
	Integer communicationId
	
	Integer latest
	
	Date timeStamp
	
	enum STATUS_REQUEST{
		PENDING, REPLIED, ERROR
	}
	
	STATUS_REQUEST statusRequest
	
	Boolean estado
	
	Boolean tipoDeFuncionamiento //0-> Calor; 1 -> Frio
	
	Double temperatura
	
	User user
	
	Dispositivo dispositivo

    static constraints = {
		communicationId unique:'latest'
		estado nullable:true
		tipoDeFuncionamiento nullable: true
		temperatura nullable: true
    }
	
}

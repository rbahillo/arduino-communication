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
	
	static mapping = {
		sort timeStamp: "desc" // or "asc"
	}

	public Integer getCommunicationId() {
		return communicationId;
	}
	public void setCommunicationId(Integer communicationId) {
		this.communicationId = communicationId;
	}	
	
	
}

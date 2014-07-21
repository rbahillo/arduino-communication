package com.domotic

class User {
	
	String userName
	
	String password
	
	Boolean admin
	
	String listDispositivosURL
	
	static hasMany = [dispositivos: Dispositivo]

    static constraints = {
		listDispositivosURL nullable: true
    }
	
}

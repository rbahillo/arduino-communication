package com.domotic.scheduler



class KeepAliveJob {
    static triggers = {
		cron name: 'keepAlive', cronExpression: "* 59 * * * ?"
		//simple name: 'mySimpleTrigger', startDelay: 10000, repeatInterval: 100000
	}

    def execute() {
       def url = "http://arduino-communication.herokuapp.com/"
 
		new URL(url).withReader ("UTF-8") {
			print "Accesing heroku app" 
		}
    }
}

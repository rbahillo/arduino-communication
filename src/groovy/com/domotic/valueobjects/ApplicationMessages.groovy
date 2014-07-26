package com.domotic.valueobjects

class ApplicationMessages {
	
	static final USER_PASSWORD_NOT_VALID = [status: "error", errorCode:"1", errorDescription:"User or password not valid"]
	static final DEVICE_NOT_ASSOCIATED_TO_USER =  [status: "error", errorCode:"2", errorDescription:"Device not asociated to the user"]
	static final USER_PASSWORD_NOT_ID = [status: "error", errorCode:"3", errorDescription:"User and password not valid for the userid"]
	static final ERROR_SENDING_SMS = [status: "error", errorCode:"4", errorDescription:"Error sending the sms"]
	static final REQUEST_NOT_FOR_USER = [status: "error", errorCode:"5", errorDescription:"Request not authorised for this user"]
	static final REQUEST_NOT_FOUND = [status: "error", errorCode:"6", errorDescription:"Request not found"]
	static final INVALID_UPDATE_STATUS = [status: "error", errorCode:"7", errorDescription:"Invalid update option"]
	static final DEVICE_NOT_FOUND = [status: "error", errorCode:"8", errorDescription:"Device not found"]
	
	static final SUCCESS_REPLY = [status: "success"]
	static final SAME_REPLY = [status: "same"]
	static final TIMEOUT_REPLY = [status: "timeout"]
	static final WAIT_REPLY = [status: "wait"]

}

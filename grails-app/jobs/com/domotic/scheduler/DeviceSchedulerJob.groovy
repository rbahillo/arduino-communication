package com.domotic.scheduler

import com.domotic.Price
import com.domotic.Dispositivo
import com.domotic.manager.web.RestClientManager



class DeviceSchedulerJob {
    static triggers = {
		cron name: 'deviceScheduler', cronExpression: "0 55 * * * ?" //s m h D M W Y
		//simple name: 'mySimpleTrigger', startDelay: 10000, repeatInterval: 100000
	}
	def group = "Prices"
	def description = "Schedule devices based on prices"

    def execute() {
		print "Starting Device Scheduler"
		def price = findPrice(new Date())
		def nextPriceData = price
		def hour =  new Date().hours
		def nextHour = hour+1
		if(nextHour>23){
			nextHour=0
			nextPriceData = findPrice(new Date()+1)
		}
		if(price!=null && nextPriceData!=null){
			
			def currentPrice = price.prices.get(hour.toString())
			def nextPrice = nextPriceData.prices.get((nextHour).toString())
			
			
			def newStatus = "same"
			def maxTimeOn = getMaximumTimeOn(nextHour+1, nextPriceData)
			if(isGreen(currentPrice, price.allowOrange()) && !isGreen(nextPrice, price.allowOrange())){
				newStatus="off"
			}
			else if(!isGreen(currentPrice, price.allowOrange()) && isGreen(nextPrice, price.allowOrange())){
				newStatus="on"
			}
			if(!newStatus.equalsIgnoreCase("same"))
				processNewStatus(newStatus, maxTimeOn)
		}
		
    }
	
	def Price findPrice(date){
		def hour = date.hours
		date.clearTime()
		Price price = Price.find{ date == date }
		return price
	}
	
	def Boolean isGreen(price, allowOrange){
		def doublePrice = new Double(price)
		return (doublePrice<Price.GREEN || (allowOrange && doublePrice<Price.ORANGE))
	}
	
	def processNewStatus(newStatus, maxTimeOn){
		Dispositivo.findAll().each { device -> 
			if(device.usaTarifaHoraria && device.minimumTimeOn<=maxTimeOn)
				updateStatus(device, newStatus)
		}
	}
	
	def updateStatus(device, newStatus){
		print "updating "+device.nombreDeDispositivo+" a "+newStatus
		def estado = newStatus.equalsIgnoreCase("on")
		def parameters = ["userName":"scheduler", "password":"scheduler",
			"messageType":"send", "estado":estado,
			"tipoFunc":device.estado.tipoDeFuncionamiento,"temperatura":device.estado.temperatura]
		def resp = RestClientManager.getResponseFromService(device.actualizaEstadoDispositivoURL,
				parameters)
		print resp
	}
	
	def Integer getMaximumTimeOn(nextHour, nextPriceData){
		def maxTimeOn=1
		def noOff = true
		def numDays = 0
		while (noOff || numDays>1){
			if(nextHour>23){
				nextHour=0
				nextPriceData = findPrice(new Date()+numDays+1)
				numDays++
			}
			def currentPrice = nextPriceData.prices.get(nextHour.toString())
			if(isGreen(currentPrice, nextPriceData.allowOrange())){
				maxTimeOn++
			}
			else{
				noOff=false
			}
			nextHour++
		}
		println maxTimeOn
		return maxTimeOn
	}
}

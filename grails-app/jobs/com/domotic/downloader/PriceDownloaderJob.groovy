package com.domotic.downloader

import com.domotic.manager.web.RestClientManager
import com.domotic.Price



class PriceDownloaderJob {
	static triggers = {
		cron name: 'downloader', cronExpression: "0 0 23 * * ?"
		//simple name: 'mySimpleTrigger', startDelay: 100000, repeatInterval: 100000
	}
	def group = "Prices"
	def description = "Downloader of prices"
	def execute(){
		def today = new Date() 
		def tomorrow = today + 1
		def parameters = null
		def url = "http://www.tarifaluzhora.es/ajax/daily?date="+tomorrow.format("yyyy-MM-dd")
		print url
		def resp = RestClientManager.getResponseFromService(
				url,
				parameters)
		def hour = 0
		def prices = new HashMap()
		resp.DayTime.ragbars.values.each{
			prices.put(new Integer(hour).toString(), new Double(it).toString())
			hour=hour+1
		}
		Price price = new Price (date: tomorrow, prices: prices)
		price.save flush:true
	}
}
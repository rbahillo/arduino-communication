package com.domotic.downloader



class PriceDownloaderJob {
	static triggers = {
		cron name: 'myTrigger', cronExpression: "* 1 * * * ?"
	}
	def group = "MyGroup"
	def description = "Example job with Cron Trigger"
	def execute(){
		print "Job run!"
	}
}

package com.domotic

import org.grails.databinding.BindingFormat

class Price {
	
	@BindingFormat('yyyy-MM-dd')
	Date date
	
	Map prices

    static constraints = {
		date unique: true
    }
}

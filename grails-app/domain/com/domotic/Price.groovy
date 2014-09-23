package com.domotic

import org.grails.databinding.BindingFormat

class Price {
	
	public static int GREEN = 120;
	
	public static int ORANGE = 135;
	
	
	@BindingFormat('yyyy-MM-dd')
	Date date
	
	Map prices

    static constraints = {
		date unique: true
    }
	
	static mapping = {
		sort date: "desc" // or "asc"
	}
	
	public Boolean allowOrange(){
		def map = prices.sort { a, b -> ((new Integer(a.key)) > (new Integer(b.key))?1:0) }
		def result = false
		if(!twoHourWithSameColor(map, "green", 10, 23)){
			if(twoHourWithSameColor(map, "orange", 10, 23)){
				return true
			}
		}
		return result;
	}
	
	private Boolean twoHourWithSameColor(Map map, String color, int initialTime, int endTime){
		def previousMatchesColor = false;
		def result = false 
		for ( e in map ) {
			if(new Integer(e.key)>=initialTime && new Integer(e.key)<=endTime){
				def currentColor = getCurrentColor(new Double(e.value))
				if(color.equalsIgnoreCase(currentColor)){
					if(previousMatchesColor){ result=true;break;} //Dos iguales terminamos
					else previousMatchesColor=true
				}
				else
					previousMatchesColor=false
			}
		}
		return result
	}
	
	private String getCurrentColor(Double value){
		if(value<GREEN)
			return "green"
		else if	(value<ORANGE)
			return "orange"
		else return "red"	
	}
	
}

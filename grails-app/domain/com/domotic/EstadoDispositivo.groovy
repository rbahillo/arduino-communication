package com.domotic

class EstadoDispositivo {
	
	Boolean estado
	
	Boolean tipoDeFuncionamiento //0-> Calor; 1 -> Frio
	
	Double temperatura
	
	Date lastUpdate
	
    static constraints = {
		estado nullable:true
		tipoDeFuncionamiento nullable: true
		temperatura nullable: true
		lastUpdate nullable: true
    }
}

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

	public Boolean getEstado() {
		return estado;
	}
	public void setEstado(Boolean estado) {
		this.estado = estado;
	}
	public Boolean getTipoDeFuncionamiento() {
		return tipoDeFuncionamiento;
	}
	public void setTipoDeFuncionamiento(Boolean tipoDeFuncionamiento) {
		this.tipoDeFuncionamiento = tipoDeFuncionamiento;
	}
	public Double getTemperatura() {
		return temperatura;
	}
	public void setTemperatura(Double temperatura) {
		this.temperatura = temperatura;
	}	
	
}

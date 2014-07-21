<%@ page import="com.domotic.EstadoDispositivo" %>



<div class="fieldcontain ${hasErrors(bean: estadoDispositivoInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="estadoDispositivo.estado.label" default="Estado" />
		
	</label>
	<g:checkBox name="estado" value="${estadoDispositivoInstance?.estado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: estadoDispositivoInstance, field: 'tipoDeFuncionamiento', 'error')} ">
	<label for="tipoDeFuncionamiento">
		<g:message code="estadoDispositivo.tipoDeFuncionamiento.label" default="Tipo De Funcionamiento" />
		
	</label>
	<g:checkBox name="tipoDeFuncionamiento" value="${estadoDispositivoInstance?.tipoDeFuncionamiento}" />

</div>

<div class="fieldcontain ${hasErrors(bean: estadoDispositivoInstance, field: 'temperatura', 'error')} ">
	<label for="temperatura">
		<g:message code="estadoDispositivo.temperatura.label" default="Temperatura" />
		
	</label>
	<g:field name="temperatura" value="${fieldValue(bean: estadoDispositivoInstance, field: 'temperatura')}"/>

</div>


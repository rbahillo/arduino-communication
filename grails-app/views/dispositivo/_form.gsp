<%@ page import="com.domotic.Dispositivo" %>



<div class="fieldcontain ${hasErrors(bean: dispositivoInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="dispositivo.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${dispositivoInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="dispositivo.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${com.domotic.EstadoDispositivo.list()}" optionKey="id" required="" value="${dispositivoInstance?.estado?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoInstance, field: 'estadoDispositivoURL', 'error')} required">
	<label for="estadoDispositivoURL">
		<g:message code="dispositivo.estadoDispositivoURL.label" default="Estado Dispositivo URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estadoDispositivoURL" required="" value="${dispositivoInstance?.estadoDispositivoURL}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoInstance, field: 'nombreDeDispositivo', 'error')} required">
	<label for="nombreDeDispositivo">
		<g:message code="dispositivo.nombreDeDispositivo.label" default="Nombre De Dispositivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreDeDispositivo" required="" value="${dispositivoInstance?.nombreDeDispositivo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoInstance, field: 'tipoDeComunicacion', 'error')} required">
	<label for="tipoDeComunicacion">
		<g:message code="dispositivo.tipoDeComunicacion.label" default="Tipo De Comunicacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoDeComunicacion" from="${com.domotic.Dispositivo$COMMUNICATIONS_TYPE?.values()}" keys="${com.domotic.Dispositivo$COMMUNICATIONS_TYPE.values()*.name()}" required="" value="${dispositivoInstance?.tipoDeComunicacion?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoInstance, field: 'tipoDeDispositivo', 'error')} required">
	<label for="tipoDeDispositivo">
		<g:message code="dispositivo.tipoDeDispositivo.label" default="Tipo De Dispositivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoDeDispositivo" from="${com.domotic.Dispositivo$DEVICE_TYPE?.values()}" keys="${com.domotic.Dispositivo$DEVICE_TYPE.values()*.name()}" required="" value="${dispositivoInstance?.tipoDeDispositivo?.name()}" />

</div>


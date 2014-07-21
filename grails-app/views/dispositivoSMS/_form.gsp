<%@ page import="com.domotic.DispositivoSMS" %>



<div class="fieldcontain ${hasErrors(bean: dispositivoSMSInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="dispositivoSMS.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${dispositivoSMSInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoSMSInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="dispositivoSMS.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${com.domotic.EstadoDispositivo.list()}" optionKey="id" required="" value="${dispositivoSMSInstance?.estado?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoSMSInstance, field: 'estadoDispositivoURL', 'error')} required">
	<label for="estadoDispositivoURL">
		<g:message code="dispositivoSMS.estadoDispositivoURL.label" default="Estado Dispositivo URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estadoDispositivoURL" required="" value="${dispositivoSMSInstance?.estadoDispositivoURL}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoSMSInstance, field: 'nombreDeDispositivo', 'error')} required">
	<label for="nombreDeDispositivo">
		<g:message code="dispositivoSMS.nombreDeDispositivo.label" default="Nombre De Dispositivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreDeDispositivo" required="" value="${dispositivoSMSInstance?.nombreDeDispositivo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoSMSInstance, field: 'tipoDeComunicacion', 'error')} required">
	<label for="tipoDeComunicacion">
		<g:message code="dispositivoSMS.tipoDeComunicacion.label" default="Tipo De Comunicacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoDeComunicacion" from="${com.domotic.Dispositivo$COMMUNICATIONS_TYPE?.values()}" keys="${com.domotic.Dispositivo$COMMUNICATIONS_TYPE.values()*.name()}" required="" value="${dispositivoSMSInstance?.tipoDeComunicacion?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: dispositivoSMSInstance, field: 'tipoDeDispositivo', 'error')} required">
	<label for="tipoDeDispositivo">
		<g:message code="dispositivoSMS.tipoDeDispositivo.label" default="Tipo De Dispositivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoDeDispositivo" from="${com.domotic.Dispositivo$DEVICE_TYPE?.values()}" keys="${com.domotic.Dispositivo$DEVICE_TYPE.values()*.name()}" required="" value="${dispositivoSMSInstance?.tipoDeDispositivo?.name()}" />

</div>


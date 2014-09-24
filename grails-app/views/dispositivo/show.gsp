
<%@ page import="com.domotic.Dispositivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dispositivo.label', default: 'Dispositivo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dispositivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="adminHeader"/>
		<div id="show-dispositivo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dispositivo">
			
				<g:if test="${dispositivoInstance?.nombreDeDispositivo}">
				<li class="fieldcontain">
					<span id="nombreDeDispositivo-label" class="property-label"><g:message code="dispositivo.nombreDeDispositivo.label" default="Nombre De Dispositivo" /></span>
					
						<span class="property-value" aria-labelledby="nombreDeDispositivo-label"><g:fieldValue bean="${dispositivoInstance}" field="nombreDeDispositivo"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${dispositivoInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="dispositivo.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${dispositivoInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoInstance?.tipoDeComunicacion}">
				<li class="fieldcontain">
					<span id="tipoDeComunicacion-label" class="property-label"><g:message code="dispositivo.tipoDeComunicacion.label" default="Tipo De Comunicacion" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeComunicacion-label"><g:fieldValue bean="${dispositivoInstance}" field="tipoDeComunicacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoInstance?.tipoDeDispositivo}">
				<li class="fieldcontain">
					<span id="tipoDeDispositivo-label" class="property-label"><g:message code="dispositivo.tipoDeDispositivo.label" default="Tipo De Dispositivo" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeDispositivo-label"><g:fieldValue bean="${dispositivoInstance}" field="tipoDeDispositivo"/></span>
					
				</li>
				</g:if>
				
				
				<li class="fieldcontain">
					<span id="usaTarifaHoraria-label" class="property-label"><g:message code="dispositivo.usaTarifaHoraria.label" default="Usa Tarifa Horaria" /></span>
					
						<span class="property-value" aria-labelledby="usaTarifaHoraria-label"><g:formatBoolean boolean="${dispositivoInstance.usaTarifaHoraria}"/></span>
					
				</li>
				
				
				<g:if test="${dispositivoInstance?.statusRequest}">
				<li class="fieldcontain">
					<span id="statusRequest-label" class="property-label"><g:message code="dispositivo.statusRequest.label" default="Estado Web" /></span>
					
						<span class="property-value" aria-labelledby="statusRequest-label"><g:fieldValue bean="${dispositivoInstance}" field="statusRequest"/></span>
					
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="minimumTimeOn-label" class="property-label"><g:message code="dispositivo.minimumTimeOn.label" default="Tiempo Minimo On" /></span>
					
						<span class="property-value" aria-labelledby="minimumTimeOn-label"><g:fieldValue bean="${dispositivoInstance}" field="minimumTimeOn"/></span>
					
				</li>
				
				<g:if test="${dispositivoInstance?.estado}">
				<h1><g:message code="estadoDispositivo.label" default="Estado De Dispositivo" /></h1>
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="estadoDispositivo.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:formatBoolean boolean="${dispositivoInstance?.estado?.estado}" /></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="tipoDeFuncionamiento-label" class="property-label"><g:message code="estadoDispositivo.tipoDeFuncionamiento.label" default="Tipo De Funcionamiento" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeFuncionamiento-label"><g:formatBoolean boolean="${dispositivoInstance?.estado?.tipoDeFuncionamiento}" /></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="temperatura-label" class="property-label"><g:message code="estadoDispositivo.temperatura.label" default="Temperatura" /></span>
					
						<span class="property-value" aria-labelledby="temperatura-label"><g:fieldValue bean="${dispositivoInstance?.estado}" field="temperatura"/></span>
					
				</li>
				
				</g:if>
			
			</ol>
			<g:form url="[resource:dispositivoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${dispositivoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

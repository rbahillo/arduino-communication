
<%@ page import="com.domotic.DispositivoSMS" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dispositivoSMS.label', default: 'DispositivoSMS')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dispositivoSMS" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dispositivoSMS" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dispositivoSMS">
			
				<g:if test="${dispositivoSMSInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="dispositivoSMS.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${dispositivoSMSInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoSMSInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="dispositivoSMS.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estadoDispositivo" action="show" id="${dispositivoSMSInstance?.estado?.id}">${dispositivoSMSInstance?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoSMSInstance?.estadoDispositivoURL}">
				<li class="fieldcontain">
					<span id="estadoDispositivoURL-label" class="property-label"><g:message code="dispositivoSMS.estadoDispositivoURL.label" default="Estado Dispositivo URL" /></span>
					
						<span class="property-value" aria-labelledby="estadoDispositivoURL-label"><g:fieldValue bean="${dispositivoSMSInstance}" field="estadoDispositivoURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoSMSInstance?.nombreDeDispositivo}">
				<li class="fieldcontain">
					<span id="nombreDeDispositivo-label" class="property-label"><g:message code="dispositivoSMS.nombreDeDispositivo.label" default="Nombre De Dispositivo" /></span>
					
						<span class="property-value" aria-labelledby="nombreDeDispositivo-label"><g:fieldValue bean="${dispositivoSMSInstance}" field="nombreDeDispositivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoSMSInstance?.tipoDeComunicacion}">
				<li class="fieldcontain">
					<span id="tipoDeComunicacion-label" class="property-label"><g:message code="dispositivoSMS.tipoDeComunicacion.label" default="Tipo De Comunicacion" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeComunicacion-label"><g:fieldValue bean="${dispositivoSMSInstance}" field="tipoDeComunicacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dispositivoSMSInstance?.tipoDeDispositivo}">
				<li class="fieldcontain">
					<span id="tipoDeDispositivo-label" class="property-label"><g:message code="dispositivoSMS.tipoDeDispositivo.label" default="Tipo De Dispositivo" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeDispositivo-label"><g:fieldValue bean="${dispositivoSMSInstance}" field="tipoDeDispositivo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:dispositivoSMSInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${dispositivoSMSInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

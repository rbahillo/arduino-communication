
<%@ page import="com.domotic.LogRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'logRequest.label', default: 'LogRequest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-logRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="adminHeader"/>
		<div id="show-logRequest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list logRequest">
			
				<g:if test="${logRequestInstance?.communicationId}">
				<li class="fieldcontain">
					<span id="communicationId-label" class="property-label"><g:message code="logRequest.communicationId.label" default="Communication Id" /></span>
					
						<span class="property-value" aria-labelledby="communicationId-label"><g:fieldValue bean="${logRequestInstance}" field="communicationId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="logRequest.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:formatBoolean boolean="${logRequestInstance?.estado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.tipoDeFuncionamiento}">
				<li class="fieldcontain">
					<span id="tipoDeFuncionamiento-label" class="property-label"><g:message code="logRequest.tipoDeFuncionamiento.label" default="Tipo De Funcionamiento" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeFuncionamiento-label"><g:formatBoolean boolean="${logRequestInstance?.tipoDeFuncionamiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.temperatura}">
				<li class="fieldcontain">
					<span id="temperatura-label" class="property-label"><g:message code="logRequest.temperatura.label" default="Temperatura" /></span>
					
						<span class="property-value" aria-labelledby="temperatura-label"><g:fieldValue bean="${logRequestInstance}" field="temperatura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.dispositivo}">
				<li class="fieldcontain">
					<span id="dispositivo-label" class="property-label"><g:message code="logRequest.dispositivo.label" default="Dispositivo" /></span>
					
						<span class="property-value" aria-labelledby="dispositivo-label"><g:link controller="dispositivo" action="show" id="${logRequestInstance?.dispositivo?.id}">${logRequestInstance?.dispositivo?.nombreDeDispositivo}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.latest}">
				<li class="fieldcontain">
					<span id="latest-label" class="property-label"><g:message code="logRequest.latest.label" default="Latest" /></span>
					
						<span class="property-value" aria-labelledby="latest-label"><g:fieldValue bean="${logRequestInstance}" field="latest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.statusRequest}">
				<li class="fieldcontain">
					<span id="statusRequest-label" class="property-label"><g:message code="logRequest.statusRequest.label" default="Status Request" /></span>
					
						<span class="property-value" aria-labelledby="statusRequest-label"><g:fieldValue bean="${logRequestInstance}" field="statusRequest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.timeStamp}">
				<li class="fieldcontain">
					<span id="timeStamp-label" class="property-label"><g:message code="logRequest.timeStamp.label" default="Time Stamp" /></span>
					
						<span class="property-value" aria-labelledby="timeStamp-label"><g:formatDate date="${logRequestInstance?.timeStamp}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${logRequestInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="logRequest.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${logRequestInstance?.user?.id}">${logRequestInstance?.user?.userName}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:logRequestInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${logRequestInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

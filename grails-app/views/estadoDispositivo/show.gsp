
<%@ page import="com.domotic.EstadoDispositivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estadoDispositivo.label', default: 'EstadoDispositivo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-estadoDispositivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="adminHeader"/>
		<div id="show-estadoDispositivo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list estadoDispositivo">
			
				<g:if test="${estadoDispositivoInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="estadoDispositivo.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:formatBoolean boolean="${estadoDispositivoInstance?.estado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoDispositivoInstance?.tipoDeFuncionamiento}">
				<li class="fieldcontain">
					<span id="tipoDeFuncionamiento-label" class="property-label"><g:message code="estadoDispositivo.tipoDeFuncionamiento.label" default="Tipo De Funcionamiento" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeFuncionamiento-label"><g:formatBoolean boolean="${estadoDispositivoInstance?.tipoDeFuncionamiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoDispositivoInstance?.temperatura}">
				<li class="fieldcontain">
					<span id="temperatura-label" class="property-label"><g:message code="estadoDispositivo.temperatura.label" default="Temperatura" /></span>
					
						<span class="property-value" aria-labelledby="temperatura-label"><g:fieldValue bean="${estadoDispositivoInstance}" field="temperatura"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:estadoDispositivoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${estadoDispositivoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="com.domotic.Dispositivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dispositivo.label', default: 'Dispositivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dispositivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="adminHeader"/>
		<div id="list-dispositivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombreDeDispositivo" title="${message(code: 'dispositivo.nombreDeDispositivo.label', default: 'Nombre De Dispositivo')}" />
						
						<g:sortableColumn property="direccion" title="${message(code: 'dispositivo.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="tipoDeComunicacion" title="${message(code: 'dispositivo.tipoDeComunicacion.label', default: 'Tipo De Comunicacion')}" />
					
						<g:sortableColumn property="tipoDeDispositivo" title="${message(code: 'dispositivo.tipoDeDispositivo.label', default: 'Tipo De Dispositivo')}" />
						
						<g:sortableColumn property="statusRequest" title="${message(code: 'dispositivo.statusRequest.label', default: 'Estado Web')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dispositivoInstanceList}" status="i" var="dispositivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dispositivoInstance.id}">${fieldValue(bean: dispositivoInstance, field: "nombreDeDispositivo")}</g:link></td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "tipoDeComunicacion")}</td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "tipoDeDispositivo")}</td>
						
						<td>${fieldValue(bean: dispositivoInstance, field: "statusRequest")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dispositivoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

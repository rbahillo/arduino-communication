
<%@ page import="com.domotic.EstadoDispositivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estadoDispositivo.label', default: 'EstadoDispositivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estadoDispositivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="adminHeader"/>
		<div id="list-estadoDispositivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="estado" title="${message(code: 'estadoDispositivo.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="tipoDeFuncionamiento" title="${message(code: 'estadoDispositivo.tipoDeFuncionamiento.label', default: 'Tipo De Funcionamiento')}" />
					
						<g:sortableColumn property="temperatura" title="${message(code: 'estadoDispositivo.temperatura.label', default: 'Temperatura')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${estadoDispositivoInstanceList}" status="i" var="estadoDispositivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${estadoDispositivoInstance.id}">${fieldValue(bean: estadoDispositivoInstance, field: "estado")}</g:link></td>
					
						<td><g:formatBoolean boolean="${estadoDispositivoInstance.tipoDeFuncionamiento}" /></td>
					
						<td>${fieldValue(bean: estadoDispositivoInstance, field: "temperatura")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estadoDispositivoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

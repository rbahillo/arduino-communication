
<%@ page import="com.domotic.LogRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'logRequest.label', default: 'LogRequest')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-logRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-logRequest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="communicationId" title="${message(code: 'logRequest.communicationId.label', default: 'Communication Id')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'logRequest.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="tipoDeFuncionamiento" title="${message(code: 'logRequest.tipoDeFuncionamiento.label', default: 'Tipo De Funcionamiento')}" />
					
						<g:sortableColumn property="temperatura" title="${message(code: 'logRequest.temperatura.label', default: 'Temperatura')}" />
					
						<th><g:message code="logRequest.dispositivo.label" default="Dispositivo" /></th>
					
						<g:sortableColumn property="latest" title="${message(code: 'logRequest.latest.label', default: 'Latest')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${logRequestInstanceList}" status="i" var="logRequestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${logRequestInstance.id}">${fieldValue(bean: logRequestInstance, field: "communicationId")}</g:link></td>
					
						<td><g:formatBoolean boolean="${logRequestInstance.estado}" /></td>
					
						<td><g:formatBoolean boolean="${logRequestInstance.tipoDeFuncionamiento}" /></td>
					
						<td>${fieldValue(bean: logRequestInstance, field: "temperatura")}</td>
					
						<td>${fieldValue(bean: logRequestInstance, field: "dispositivo")}</td>
					
						<td>${fieldValue(bean: logRequestInstance, field: "latest")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${logRequestInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

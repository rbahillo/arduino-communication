
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
		<g:applyLayout name="adminHeader"/>
		<div id="list-logRequest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="communicationId" title="${message(code: 'logRequest.communicationId.label', default: 'Communication Id')}" />
						
						<g:sortableColumn property="latest" title="${message(code: 'logRequest.latest.label', default: 'Latest')}" />
					
						<th><g:message code="logRequest.dispositivo.label" default="Dispositivo" /></th>
						
						<th><g:message code="logRequest.user.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${logRequestInstanceList}" status="i" var="logRequestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${logRequestInstance.id}">${fieldValue(bean: logRequestInstance, field: "communicationId")}</g:link></td>
						
						<td>${fieldValue(bean: logRequestInstance, field: "latest")}</td>
					
						<g:set var="dispositivo" value="${logRequestInstance.dispositivo}" />
						<td>${fieldValue(bean: dispositivo, field: "nombreDeDispositivo")}</td>
						
						<g:set var="user" value="${logRequestInstance.user}" />
						<td>${fieldValue(bean: user, field: "userName")}</td>
						
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

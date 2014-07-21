
<%@ page import="com.domotic.DispositivoSMS" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dispositivoSMS.label', default: 'DispositivoSMS')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dispositivoSMS" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dispositivoSMS" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="direccion" title="${message(code: 'dispositivoSMS.direccion.label', default: 'Direccion')}" />
					
						<th><g:message code="dispositivoSMS.estado.label" default="Estado" /></th>
					
						<g:sortableColumn property="estadoDispositivoURL" title="${message(code: 'dispositivoSMS.estadoDispositivoURL.label', default: 'Estado Dispositivo URL')}" />
					
						<g:sortableColumn property="nombreDeDispositivo" title="${message(code: 'dispositivoSMS.nombreDeDispositivo.label', default: 'Nombre De Dispositivo')}" />
					
						<g:sortableColumn property="tipoDeComunicacion" title="${message(code: 'dispositivoSMS.tipoDeComunicacion.label', default: 'Tipo De Comunicacion')}" />
					
						<g:sortableColumn property="tipoDeDispositivo" title="${message(code: 'dispositivoSMS.tipoDeDispositivo.label', default: 'Tipo De Dispositivo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dispositivoSMSInstanceList}" status="i" var="dispositivoSMSInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dispositivoSMSInstance.id}">${fieldValue(bean: dispositivoSMSInstance, field: "direccion")}</g:link></td>
					
						<td>${fieldValue(bean: dispositivoSMSInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: dispositivoSMSInstance, field: "estadoDispositivoURL")}</td>
					
						<td>${fieldValue(bean: dispositivoSMSInstance, field: "nombreDeDispositivo")}</td>
					
						<td>${fieldValue(bean: dispositivoSMSInstance, field: "tipoDeComunicacion")}</td>
					
						<td>${fieldValue(bean: dispositivoSMSInstance, field: "tipoDeDispositivo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dispositivoSMSInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>


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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dispositivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="direccion" title="${message(code: 'dispositivo.direccion.label', default: 'Direccion')}" />
					
						<th><g:message code="dispositivo.estado.label" default="Estado" /></th>
					
						<g:sortableColumn property="estadoDispositivoURL" title="${message(code: 'dispositivo.estadoDispositivoURL.label', default: 'Estado Dispositivo URL')}" />
					
						<g:sortableColumn property="nombreDeDispositivo" title="${message(code: 'dispositivo.nombreDeDispositivo.label', default: 'Nombre De Dispositivo')}" />
					
						<g:sortableColumn property="tipoDeComunicacion" title="${message(code: 'dispositivo.tipoDeComunicacion.label', default: 'Tipo De Comunicacion')}" />
					
						<g:sortableColumn property="tipoDeDispositivo" title="${message(code: 'dispositivo.tipoDeDispositivo.label', default: 'Tipo De Dispositivo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dispositivoInstanceList}" status="i" var="dispositivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dispositivoInstance.id}">${fieldValue(bean: dispositivoInstance, field: "direccion")}</g:link></td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "estadoDispositivoURL")}</td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "nombreDeDispositivo")}</td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "tipoDeComunicacion")}</td>
					
						<td>${fieldValue(bean: dispositivoInstance, field: "tipoDeDispositivo")}</td>
					
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


<%@ page import="com.domotic.Price" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'price.label', default: 'Price')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-price" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="adminHeader"/>
		<div id="show-price" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list price">
			
				<g:if test="${priceInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="price.date.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${priceInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${priceInstance?.prices}">
				<li class="fieldcontain">
					<span id="prices-label" class="property-label">
						<g:each status="i" var="price" in="${priceInstance.prices}">
						    <p>Hora: ${price.key}</p>
						    <p>Precio: ${price.value}</p>
						</g:each>
					</span>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:priceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

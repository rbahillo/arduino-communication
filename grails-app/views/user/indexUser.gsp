
<%@ page import="com.domotic.User" %>
<%@ page import="grails.converters.JSON"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${assetPath(src: 'jquery-ui-1.11.css')} ">
		<g:javascript library="jquery" />
        
        <jqui:resources theme="darkness" />
        <script type="text/javascript">
        $(document).ready(function()
        {
          $("#accordion").accordion({ animate: 200 });
        })
    </script>
		
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:applyLayout name="generalHeader"/>
		<div id="accordion">
			<g:each in="${session.user.dispositivos}">
			    <h3>${it.nombreDeDispositivo}</h3>
			    <div>
				    <p>
				    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
				    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
				    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
				    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
				    </p>
				  </div>
			</g:each>
			<g:each in="${session.user.dispositivos}">
			    <h3>${it.nombreDeDispositivo}</h3>
			    <div>
				    <p>
				    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
				    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
				    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
				    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
				    </p>
				  </div>
			</g:each>
		</div>
	</body>
</html>		
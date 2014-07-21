<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></li>
		
		<g:if test="${session.user.admin}">
		     <li style="float: right"><g:link class="admin" controller="user" action="indexAdmin">
				<g:message code="web.admin"/>
			</g:link></li>
		</g:if>	
	</ul>
</div>
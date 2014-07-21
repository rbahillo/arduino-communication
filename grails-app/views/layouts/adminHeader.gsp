<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></li>
		<li><g:link class="list" action="index">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link></li>
		<li><g:link class="create" action="create">
				<g:message code="default.new.label" args="[entityName]" />
			</g:link></li>
			
		<li style="float: right"><g:link class="admin" controller="user" action="indexAdmin">
				<g:message code="web.admin"/>
			</g:link></li>
	</ul>
</div>
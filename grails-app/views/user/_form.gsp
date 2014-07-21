<%@ page import="com.domotic.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'admin', 'error')} ">
	<label for="admin">
		<g:message code="user.admin.label" default="Admin" />
		
	</label>
	<g:checkBox name="admin" value="${userInstance?.admin}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dispositivos', 'error')} ">
	<label for="dispositivos">
		<g:message code="user.dispositivos.label" default="Dispositivos" />
		
	</label>
	<g:select name="dispositivos" from="${com.domotic.Dispositivo.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.dispositivos*.nombreDeDispositivo}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${userInstance?.userName}"/>

</div>


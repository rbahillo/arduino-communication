<%@ page import="com.domotic.LogRequest" %>



<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'communicationId', 'error')} required">
	<label for="communicationId">
		<g:message code="logRequest.communicationId.label" default="Communication Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="communicationId" type="number" value="${logRequestInstance.communicationId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="logRequest.estado.label" default="Estado" />
		
	</label>
	<g:checkBox name="estado" value="${logRequestInstance?.estado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'tipoDeFuncionamiento', 'error')} ">
	<label for="tipoDeFuncionamiento">
		<g:message code="logRequest.tipoDeFuncionamiento.label" default="Tipo De Funcionamiento" />
		
	</label>
	<g:checkBox name="tipoDeFuncionamiento" value="${logRequestInstance?.tipoDeFuncionamiento}" />

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'temperatura', 'error')} ">
	<label for="temperatura">
		<g:message code="logRequest.temperatura.label" default="Temperatura" />
		
	</label>
	<g:field name="temperatura" value="${fieldValue(bean: logRequestInstance, field: 'temperatura')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'dispositivo', 'error')} required">
	<label for="dispositivo">
		<g:message code="logRequest.dispositivo.label" default="Dispositivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dispositivo" name="dispositivo.id" from="${com.domotic.Dispositivo.list()}" optionKey="id" optionValue="nombreDeDispositivo" required="" value="${logRequestInstance?.dispositivo?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'latest', 'error')} required">
	<label for="latest">
		<g:message code="logRequest.latest.label" default="Latest" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latest" type="number" value="${logRequestInstance.latest}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'statusRequest', 'error')} required">
	<label for="statusRequest">
		<g:message code="logRequest.statusRequest.label" default="Status Request" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="statusRequest" from="${com.domotic.LogRequest$STATUS_REQUEST?.values()}" keys="${com.domotic.LogRequest$STATUS_REQUEST.values()*.name()}" required="" value="${logRequestInstance?.statusRequest?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'timeStamp', 'error')} required">
	<label for="timeStamp">
		<g:message code="logRequest.timeStamp.label" default="Time Stamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="timeStamp" precision="day"  value="${logRequestInstance?.timeStamp}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: logRequestInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="logRequest.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.domotic.User.list()}" optionKey="id" optionValue="userName" required="" value="${logRequestInstance?.user?.id}" class="many-to-one"/>

</div>


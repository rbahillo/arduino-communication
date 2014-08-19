<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>User Login</title>
</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="errors" role="status">${flash.message}</div>
			</g:if>
		<g:form url="[resource:userInstance, action:'loginWeb']" method="POST" >
			<div class="dialog">
				
				<table class="userForm">
					<tr class='prop'>
						<td valign='top' style='text-align: left;' width='20%'><label
							for='email'>Nombre de Usuario:</label></td>
						<td valign='top' style='text-align: left;' width='80%'><input
							id=userName type='text' name='userName' value='${user?.userName}' /></td>
					</tr>
					<tr class='prop'>
						<td valign='top' style='text-align: left;' width='20%'><label
							for='password'>Password:</label></td>
						<td valign='top' style='text-align: left;' width='80%'><input
							id="password" type='password' name='password'
							value='${user?.password}' /></td>
					</tr>

				</table>
			</div>
			<fieldset class="buttons">
					<g:actionSubmit class="login" action="loginWeb" value="${message(code: 'default.button.login.label', default: 'Login')}" />
				</fieldset>
		</g:form>
	</div>
</body>
</html>

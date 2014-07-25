
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
		<g:javascript src="toggles.js" />
		<link rel="stylesheet" href="${assetPath(src: 'toggles.css')} ">
		
        
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
			<g:each status="i" var="dispositivo" in="${session.user.dispositivos}">
			    <h3>
			    	<div id="nombre${i} }" >
			    		${dispositivo.nombreDeDispositivo} 
			    	</div>
				    <g:if test="${dispositivo.estado.lastUpdate}" style="float:left">
				    	<div id="updated${i}">
				    		(Actualizado: <g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${dispositivo.estado.lastUpdate}"/>)
				    	</div>
				    </g:if>
			    </h3>
			    <div>
			    	<div style="width:300px;float: left">
				    	<div style="width:100%">
					    	<p>
							  <label for="temperature">Temperatura:</label>
							  <input type="text" id="temperatura${i}" readonly style="border:0; color:#f6931f; font-weight:bold;width:100px">
							</p>
						    <div id="slider${i}" style="height:10px;width:200px"></div>
					    </div>
					    <div>
						    <div style="height:10px;width:40px;margin:10px 10px 10px 0px;float: left;font-size: smaller;">
								10
							</div>
							<div style="height:10px;width:35px;margin:10px 10px 10px 0px;float: left;font-size: smaller;">
								18
							</div>
							<div style="height:10px;width:40px;margin:10px 10px 10px 0px;float: left;font-size: smaller;">
								25
							</div>
							<div style="height:10px;width:35px;margin:10px 10px 10px 0px;float: left;font-size: smaller;">
								33
							</div>
							<div style="height:10px;width:40px;margin:10px 10px 10px 0px;float: left;font-size: smaller;">
								40
							</div>
						</div>
					</div>
					<div class="estado${i}" style="width:200px;float: left;margin-top:25px">
						<div style="float: left;">
					    	<p>
							  <label for="encendido">Estado:</label>
							</p>
					    </div>
					    <div class="toggle-iphone" style="margin:3px 0px 0px 5px;float: left;">
						    <div id="estado" class="toggle" style="height:22px;width:70px;" data-checkbox="estadoCheck${i}">	
							</div>
						</div>
						<input type="checkbox" disabled="disabled" class="estadoCheck${i}" style="display:none">
						
					</div>
					<div class="modo${i}" style="width:200px;float: left;margin-top:25px">
						<div style="float: left;">
					    	<p>
							  <label for="mode">Modo:</label>
							</p>
					    </div>
					    <div class="toggle-iphone" style="margin:3px 0px 0px 5px;float: left;">
						    <div class="toggle" style="height:22px;width:80px;">	
							</div>
						</div>
						<input type="checkbox" disabled="disabled" class="modoCheck${i}" style="display:none">
						
					</div>
					<g:set var="label" value="Actualizar" />
					<g:set var="style" value="width:70px;height:30px;font-size:62.5%;padding-left:7px" />
					<g:set var="butonStatus" value="false" />
					<g:if test="${ dispositivo.statusRequest == com.domotic.Dispositivo.WEB_STATUS_REQUEST.PENDING}">
						<g:set var="label" value="Actualizando" />
						<g:set var="style" value="width:90px;height:30px;font-size:62.5%;padding-left:7px" />
						<g:set var="butonStatus" value="true" />
					</g:if>
					<div style="float: left;margin-top:25px;margin-left:80px">
						<input id="submit${i}" type="submit" value="${label}" 
							style="${style}">
					</div>
					<g:set var="hide" value="display:none"/>
					<g:if test="${ dispositivo.statusRequest == com.domotic.Dispositivo.WEB_STATUS_REQUEST.ERROR}">
						<g:set var="hide" value=""/>
					</g:if>
					<span id="warning${i}" class="ui-icon ui-icon-circle-close" style="margin:30px 0px 0px 10px;float: left;${hide}"></span>
				   	<script>
					  $(function() {
					    $( "#slider${i}" ).slider({
					      orientation: "horizontal",
					      range: "min",
					      min: 10,
					      max: 40,
					      value: ${dispositivo.estado.temperatura},
					      slide: function( event, ui ) {
					        $( "#temperatura${i}" ).val( ui.value );
					      }
					    });
					    $( "#temperatura${i}" ).val( $( "#slider${i}" ).slider( "value" ) );
					    $('.estado${i} .toggle').toggles({on:${dispositivo.estado.estado}, checkbox:$('.estadoCheck${i}')});
					    $('.modo${i} .toggle').toggles({text:{on:'Frio',off:'Calor'}, on:${dispositivo.estado.tipoDeFuncionamiento}, checkbox:$('.modoCheck${i}')});
					    $( "#submit${i}" )
					      .button()
					      .click(function( event ) {
					    	  event.preventDefault();
					        	$( "#submit${i}" ).css("width", "90px")
					        	$( "#submit${i}" ).button( "option", "label", "Actualizando" );
					        	$( "#submit${i}" ).button( "option", "disabled", true );
					        	var parametros = {
					        				"temperatura" : $( "#temperatura${i}" ).val(),
					        				"estado" : $( ".estadoCheck${i}" ).val(),
					        				"tipoFunc": $( ".modoCheck${i}" ).val()
					        				};	
		        				var url = '<g:createLink controller="dispositivo" action="actualizaEstadoDispositivoWeb" id="${dispositivo.id}"/>'
		        					$.ajax({
			        				    type: "POST",
			        				    url: url,
			        				    contentType: "application/json; charset=utf-8",
			        				    dataType: "json",
			        				    data: JSON.stringify(parametros),
			        				    success: function(data) {
							        		if(data["status"]=="error"){
							        		}
							        		else {
								        		if(data["status"]=="timeout"){
								        			$( "#warning${i}" ).css({"display":"block"})
							        			}	
								        		else{
									        		if(data["lastUpdate"]!=null){
									        			$( "#updated${i}" ).html('Actualizado: ('+data["lastUpdate"]+')')
									        		}
									        	}
								        		$( "#temperatura${i}" ).val(data["temperatura"])
							        			$( "#slider${i}" ).slider( { value: data["temperatura"] } )
							        			$('.estado${i} .toggle').toggles({on:data["estado"]})
							        			$('.estadoCheck${i}').prop('checked', data["estado"])
							        			$('.modo${i} .toggle').toggles({on:data["tipoDeFunc"]})
							        			$('.modoCheck${i}').prop('checked', data["tipoDeFunc"])
								        		$( "#submit${i}" ).css("width", "70px")				        		
								        		$( "#submit${i}" ).button( "option", "label", "Actualizar" );
								        		$( "#submit${i}" ).button( "option", "disabled", false );
							        		}
				        				}
						        		});			        				
		        						        	
				        		return false
					      });
					    $( "#submit${i}" ).button( "option", "disabled", ${butonStatus} );
					  });
					 
					  </script>
				</div>
			</g:each>
		</div>
	</body>
</html>		
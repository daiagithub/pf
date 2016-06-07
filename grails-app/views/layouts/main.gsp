<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Grails" /></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
	<asset:stylesheet src="application.css" />
	<asset:javascript src="application.js" />
	<asset:stylesheet src="datepicker.css" />
	<asset:javascript src="bootstrap-datepicker.js" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<g:layoutHead />
	
	<style>
		body {
			padding-top: 50px;
		}
		
		.starter-template {
			padding: 40px 15px;
			text-align: center;
		}
	</style>
</head>
<body style="background-color: #f5f5f5">

	<nav class="navbar navbar-inverse navbar-fixed-top"> 
		<div class="container" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${createLink(uri: '/')}">Classic Marup</a>				
			</div>

			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<sec:ifLoggedIn>

						<li class="dropdown">
			              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><sec:username /> <span class="caret"></span></a>
			              <ul class="dropdown-menu">			               
			              </ul>
			            </li>						      
		       		</sec:ifLoggedIn>            		
          		</ul>

          		<form class="navbar-form navbar-right">
            		<input type="text" class="form-control" placeholder="Search...">
          		</form>
			</div>
		</div>
	</nav>

	<div class="container" >
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar"></div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="text-align: center;">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
			</div>     
		</div>
		
	 <div class="row">
		<div class="col-sm-3 col-md-2 sidebar" style="top: 60px; ">
          	<ul class="nav nav-sidebar">
            	<!--<li class="${controllerName == 'home' ? 'active' : ''}"><a href="${createLink(uri: '/')}">Home <span class="sr-only">(current)</span></a></li>-->
            	<li class="${controllerName in ['home', 'slotSelection', 'marup'] ? 'active' : ''}"><a href="${createLink(uri: '/')}">Marups</a></li>
            	
          	</ul>

          	<ul class="nav nav-sidebar">
          		<div class="cap-header-sm">WHAT I CREATED</div>
            	<g:each var="marup" in="${userCreatedMarupInstanceList}">
            		<li><a href="#" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap">
            			#${marup.id} (${marup.installment ? "Rs " + marup.installment : ""}
								${marup.drawCycle?:""} 
								${marup.noOfParticipants? " x " + marup.noOfParticipants :""}
								${marup.interest? " @" + marup.interest :""}
            		</a></li>
            	</g:each>
            	<!--
            	<li><a href="">One more nav</a></li>
            	-->
          	</ul>

          	<ul class="nav nav-sidebar">
          		<div class="cap-header-sm">WHAT I AM INTERESTED</div>
          		<g:each var="marup" in="${userInteractedMarupInstanceList}">
            		<li><a href="#" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap">
            			#${marup.id} (${marup.installment ? "Rs " + marup.installment : ""}
								${marup.drawCycle?:""} 
								${marup.noOfParticipants? " x " + marup.noOfParticipants :""}
								${marup.interest? " @" + marup.interest :""}
            		</a></li>
            	</g:each> 
          		           	
          	</ul>
         
        	<ul class="nav nav-sidebar">           
            	<li><a href="">Settings</a></li>
          	</ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 10px; padding-bottom: 20px; background-color: #fff; border: 1px solid #eee; left:">
			<g:layoutBody />
		</div>

		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />
		</div>
		</div>
	</div>
	<!-- /container -->
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Browser Not Support</title>
<jsp:include page="googleAnalytics.jsp" />

<!-- build:css ../assets/bootstrap.min.css -->
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<!-- /build -->
<!-- build:css ../assets/404-page.min.css -->
<link rel="stylesheet" type="text/css"
	href="../css/404-page.css?version=${properties['application.version']}">
<!-- /build -->

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>

</head>

<body>

	<jsp:include page="googleAnalyticsbody.jsp" />

	<div class="main col-lg-12">
		<div class="header col-lg-12">
			<div class="content col-lg-12">
				<img src="${sessionScope.logo}" alt="logo-image">
				<h1>Incompatible Browser</h1>
				<p>
					<spring:message code="label.browser.message" />
				</p>
				<p>
					<strong><h4>
							<spring:message code="label.browser.message.continue" />
							<a href="login?disableBrowserCheck=true" class="goToLogin"> <spring:message
									code="label.browser.message.click" /></a>
						</h4></strong>
				</p>
			</div>
		</div>

		<div id="browsersContainer" class="content browser col-lg-12"></div>
	</div>




</body>
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5VTJN7Q"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script type="text/javascript">
	$(document).ready(function(e){
		var supportedBrowser=JSON.parse('${supportedBrowsers}');
		//console.log(supportedBrowser);
		//console.log( Object.keys(supportedBrowser).length);
		
		
		$("#browsersContainer").empty();
		var _tempMarkup ="";
		 for(var i = 0; i < Object.keys(supportedBrowser).length; i++ ){
			//console.log('browserdescription'+supportedBrowser[i].browserDescription);
			_tempMarkup += '<div class="col-sm-3">';
			_tempMarkup += '<img src="../images/'+supportedBrowser[i].browserDescription+'.png"  alt="logo-image">';
			_tempMarkup += '<h2 class="firefoxHead">'+supportedBrowser[i].browserDescription+' '+supportedBrowser[i].supportedVersion+'+</h2>';
			_tempMarkup += '<div class="download"><a class="browserlink" data-track="Mozilla Firefox" target="_blank" href="'+supportedBrowser[i].downloadLocation+'">DOWNLOAD</a></div>';
			_tempMarkup += '</div>';
			
			//console.log('endof loop');
		} 
		 //console.log('markup');
		$("#browsersContainer").html(_tempMarkup);
	});		
	</script>
</html>



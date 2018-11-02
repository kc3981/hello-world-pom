<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Sign-up</title>


<jsp:include page="googleAnalytics.jsp" />

<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/sign-up.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/signup-layout.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/signup-style.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/signup-responsive.css?version=${properties['application.version']}">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>
<!--- Bootstrap Multiselect Plugin -->

</head>
<fmt:setLocale value='en' />
<fmt:setBundle basename='messages' />
<input type="hidden" id="languageId" value="1" />

<body>
	<jsp:include page="googleAnalyticsbody.jsp" />

	<div class="bottom-section">
		<div
			class="main-container col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
			<div class="register-notify">
				<span></span>
				<p>
					<spring:message code="message.register.done" />
				</p>

				<p id="success-register">${result}</p>

				<a class="success-close-button" href="javacript:;"><spring:message
						code="message.register.close" /></a>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="overlay-footer">
				<c:forEach var="item"
					items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
					<ul>
						<li class="nav_first"><a id="${item.key}"
							class="nav_a languageClick" href="#">${item.value}</a></li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>

	</div>

	<!--<div class="main">
			<button class="forgot-password-button" id="password-button">Sign In</button>
		</div>-->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" 
		type="text/javascript"></script>
	<script
		src="../js/jquery.nicescroll.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/login.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer></script>


</body>
</html>

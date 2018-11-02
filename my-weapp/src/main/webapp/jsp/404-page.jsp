<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404 - <spring:message code="msg.sserror" /></title>
<!-- build:css ../assets/bootstrap.min.css -->
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<!-- /build -->
<!-- build:css ../assets/404-page.min.css -->
<link rel="stylesheet" type="text/css"
	href="../css/404-page.css?version=${properties['application.version']}">
<!-- /build -->
<jsp:include page="googleAnalytics.jsp" />
</head>

<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<div class=" main col-lg-12">
		<div class="header col-lg-12">
			<span>4</span> <img src="../images/overlay-logo.png" alt="logo-image">
			<span>4</span>

			<h3>
				<spring:message code="label.page.not.found" />
			</h3>
		</div>

		<div class="content col-lg-12">
			<h2>
				<spring:message code="label.page.contact.customer" />
			</h2>
		</div>
	</div>
</body>
</html>
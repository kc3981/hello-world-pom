<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="label.page.under.construction" /></title>


<jsp:include page="googleAnalytics.jsp" />

<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/construction-page.css?version=${properties['application.version']}">

</head>

<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<div class=" main col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="header col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h1>
				<img src="../images/overlay-logo.png" alt="logo-image">
			</h1>
			<h3>
				<spring:message code="label.page.coming.soon" />
			</h3>
		</div>

		<div class="content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2>
				<spring:message code="label.page.this.construction" />
			</h2>
		</div>
	</div>
</body>
</html>
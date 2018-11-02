<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${properties['global.page.title']}</title>
<jsp:include page="googleAnalytics.jsp" />

<link rel="stylesheet"
	href="${properties['base.url']}/gensuite/css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="${properties['base.url']}/gensuite/css/global-error-page.css?version=${properties['application.version']}">

</head>

<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<div class=" main col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="header col-lg-12 col-md-12 col-sm-12 col-xs-12">

			<h1>
				<img src="${properties['base.url']}/${properties['default.logo']}"
					alt="logo-image">
			</h1>
			<h3>
				<spring:message code="label.globalErrorText" />
			</h3>
		</div>

		<div class="content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2>
				<spring:message code="label.quote.error.message" />
			</h2>

			<br>
			<h2>
				<spring:message code="label.global.click" />
				<a href="homepage"><spring:message code="label.global.here" /></a>
				<spring:message code="label.global.tostartover" />
			</h2>
		</div>
	</div>
</body>
</html>
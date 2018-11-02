<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${properties['global.page.title']}</title>
<link rel="shortcut icon" href="../images/favicon.ico" 	type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
<jsp:include page="googleAnalytics.jsp" />

<link rel="stylesheet"
	href="${properties['base.url']}/gensuite/css/bootstrap.min.css?version=${properties['application.version']}">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html, body {
	background: #fff;
	color: #000;
}

h1 img {
	padding-top: 100px;
}

h2 {
	font-size: 20px;
	color: #000;
}

a:link, a:visited {
	font-size: 20px;
	color: #2095F3;
}

.main {
	text-align: center;
	padding: 0px;
}

.header {
	border-top: 35px solid #ec9d00;
}

.concurentError h3 {
	margin: 3% 10px;
	color: #D64C00;
	font-size: 40px;
	font-weight: bold;
}

.concurentError .h2 {
	margin: 10px;
}
</style>
</head>

<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<div
		class=" main col-lg-12 col-md-12 col-sm-12 col-xs-12 concurentError">
		<div class="header col-lg-12 col-md-12 col-sm-12 col-xs-12">

			<h1>
				<img src="${properties['base.url']}/${properties['default.logo']}"
					alt="logo-image">
			</h1>
			<h3>
				<spring:message code="label.concurrentError" />
			</h3>
		</div>

		<div class="content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2>
				<spring:message code="label.concurrentsession.errormessage" />
			</h2>

			<h2>
				<spring:message code="label.sessionexpired" />
				<spring:message code="msg.sserror.click" />
				<a href="logout"> <spring:message code="msg.sserror.here" />
				</a>
				<spring:message code="label.tologin" />
			</h2>
		</div>
	</div>
</body>
</html>
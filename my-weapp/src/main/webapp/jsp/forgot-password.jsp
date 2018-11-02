<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<jsp:include page="googleAnalytics.jsp" />

<!-- CSS -->
<!-- build:css ../assets/globalstyles.min.css -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>
<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/intlTelInput.css?version=${properties['application.version']}">
<!-- /build -->
<!-- build:css ../assets/intlTelInput.min.css -->
<!-- /build -->
<!-- Added for BU theme -->
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>
<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/apple-touch-icon-57-precomposed.png"> -->
<!-- Javascript Library-->
<!-- build:js  ../assets/globalscripts.js -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<!-- Js library plugin -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.4/jquery.i18n.js?version=${properties['application.version']}" defer></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/module-error-handler.js?version=${properties['application.version']}"></script>
<!--  /build -->

<script
	src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/5.8.7/js/intlTelInput.min.js?version=${properties['application.version']}" defer></script>
<!-- Custom Js file for Functionality -->
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<style type="text/css">
.fgtPwd h3 {
	margin-left: 0px !important;
}
</style>
</head>
<body>
	 <%@ include file="googleAnalyticsbody.jsp" %>
	<input type="hidden" id="language_id_"
		value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
	<div class="login-container">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 overlay-header">
			<div class="overlay-header-wrapper">
				<div class="overlay-header-content">
					<h1>
						<img id="loginlogo" alt="Logo" src="${sessionScope.logo}">
						<!-- <img id="loginlogo" alt="Logo" src="http://10.1.71.60:8080/gensuite-logo/rrg-logo.png"> -->
					</h1>
					<h2><spring:message code="label.forgotemailid.title" /></h2>
				</div>
			</div>
		</div>
		<div
			class="col-lg-12 col-md-12 col-sm-12 col-xs-12 login-content overlay-content fgtPwd">
			<%-- <h3><spring:message code="label.forgotemailid.title" /></h3> --%>
			<div class="signin-section">
				<div
					class="col-lg-6 col-lg-offset-3 col-xs-offset-0 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">
					<%-- <p><spring:message code="label.forgotemailid.password"/></p> --%>
					<form id="forgot-password-form">
						<div class="form-group">
							<input type="email" name="email" class="form-control input-valid"
								maxlength="50"
								placeholder='<spring:message code="msg.forgot.email.id"/>' />
						</div>
						<!-- <p><spring:message code="label.forgot.or"/></p>-->
						<!--<div class="form-group">
                                <input type="text" name="phone" id="phone-forgotpassword" data-number="" class="form-control input-valid" />									                          							
                            </div> -->
						<div>
							<p class="validation-message"></p>
							<!--Fix for NREV-1743, done by Kameshwari  -->
							<a href="${properties['gensuite.login.url']}"
								class="green-button prev back-link"> <spring:message
									code="label.page.back" />
							</a> <a href="#0" data-toggle="modal"
								id="forgot-password-submit"
								class="green-button next continue-link"><spring:message
									code="label.page.continue" /></a>

						</div>
						<c:choose>
							<c:when
								test="${properties['show.login.language'] == 'true' && fn:length(sessionScope['scopedTarget.genericUserProperties'].allLanguages) gt 1}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="overlay-footer">
										<p class="nopadding">
											<spring:message code="label.gensuite.offerd" />
											:
										</p>
										<ul>
											<c:forEach var="item"
												items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
												<li class=""><a id="${item.key}"
													class="nav_a languageClick" href="#">${item.value}</a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="lang" id="lang" value="false" />
							</c:otherwise>
						</c:choose>
					</form>

				</div>
			</div>

			<input type="hidden"
				value="${sessionScope['scopedTarget.genericUserProperties'].languageDescription}"
				id="activeLanguage">
			<!-- Password Sent Modal Window -->
			<div class="modal nopadding" id="password-sent-modal">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 overlay-header">
						<div class="overlay-header-content">
					    <h1><img id="loginlogo" alt="Logo" src="${sessionScope.logo}"></h1>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 overlay-content">
					<%-- <h3><spring:message code="label.forgotemailid.title" /></h3> --%>
					<div class="signin-section">
						<div
							class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 col-xs-offset-0">
							<img src="../images/overlay-remember.png">
							<p>
								<spring:message code="label.email.message.done" />
							</p>
							<p>
								<spring:message code="label.email.message.body" />
								<span id="emailforgot"><spring:message
										code="label.email.message.emailId" /></span>
							</p>
							<!-- Start Rajesh: Changed from storefron to gensuite to land it to login lage -->
							<a class="green-button next"
								href="${properties['gensuite.login.url']}?forceLogin=true"><spring:message
									code="label.email.message.Continue.login" /></a>
							<!-- END Rajesh: Changed from storefron to gensuite to land it to login lage -->
						</div>
					</div>
				</div>

			</div>
			<!-- Password Sent Modal Window End -->
		</div>
	</div>


	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>
	<script src="../js/module-login.js" defer type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var loginObj =  new Systems.Classes.forgotPassword().bindEvents();
		});
	</script>
</body>
</html>
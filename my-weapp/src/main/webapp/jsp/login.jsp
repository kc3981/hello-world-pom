<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<!-- CSS -->
<!-- build:css ../assets/globalstyles.min.css -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
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
<!-- /build -->
<link rel="stylesheet" type="text/css" href="../css/theme.css">

<jsp:include page="googleAnalytics.jsp" />

<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico"
	type="image/x-icon">
<!-- <link rel="icon" href="../images/favicon.ico" type="image/x-icon"> -->

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
<!-- build:js ../assets/globalscripts.js -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<!-- script src="../js/jquery-2.1.0.min.js" type="text/javascript"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<!--19-01-2016  5.5.1.0_EH_ajax_error_msg.-->
<script
	src="../js/module-error-handler.js?version=${properties['application.version']}" ></script>
<!--  /build -->

</head>
<style>

body{

    background: #ABB4B8;
}


.fa.fa-times {
	top: 5px;
}
#loginUser,#register{		
	min-width: 120px;
	width:120px;
}

#loginUser,#register{		
	min-width: 120px;
	width:120px;
}

@media (min-width: 300px) and (max-width: 500px){
	#loginUser{
		float:none !important;	
	}
	
}

@media (max-width: 400px){
	.login-card{
		padding: 20px;
	}
}

.btnLogin, .btn.focus, .btn:focus, .btn:hover{
    	color: #fff;
}

</style>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<input type="hidden" id="language_id_" value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
	<!-- New login template begin-->
	<!-- Container Fluid-->
	<div class="container login-container-genalpha">	
			<!-- Login Card-->
			<div class="row login-card">
				<!-- Language Selector Row-->
				<div class="row nopadding">
					<!-- Language Selector-->
					<div class="col-md-6 nopadding"></div>
					<div class="col-md-6 nopadding login_language_block">
					<c:choose>
					<c:when test="${properties['show.login.language'] == 'true' && fn:length(sessionScope['scopedTarget.genericUserProperties'].allLanguages) gt 1}">
						<div class="dropdown language-selector center-block">
							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
									${sessionScope['scopedTarget.genericUserProperties'].languageDescription}
								<span class="caret"></span>
							</button>			
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">	
								<c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
										<li class="">
											<a id="${item.key}" class="nav_a languageClick" href="#">${item.value}</a>
											<input type="hidden" name="lang" id="lang" value="true" />
										</li>											
								</c:forEach>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="lang" id="lang" value="false" />
					</c:otherwise>
				</c:choose>	
					</div>
					<!-- End Language Selector-->
				</div>
				<!-- End Language Selector Row-->
				<!-- Login Controls Row-->
				<div class="row nopadding">
					<div class="col-md-6 col-xs-12 nopadding">					
					<c:choose>
					    <c:when test="${not empty sessionScope.logo}">
					        <img class="loginlogo center-block" id="loginlogo" alt="Logo" src="${sessionScope.logo}">
					    </c:when>
					    <c:otherwise>
					       <img class="loginlogo center-block" id="loginlogo" alt="Logo" src="${properties['base.url']}/${properties['default.logo']}">
					    </c:otherwise>
					</c:choose>	
					</div>
					<div class="col-md-6 col-xs-12 nopadding">
						<div class="password-box">
							<!-- Form Input -->
							<form>
								<div class="form-group">
									<input type="text" class="form-control" name="username" id="Username" placeholder="<spring:message code="label.login.username"/>" />
								</div>
								<div class="form-group password-group">
									<input type="password" class="form-control" name="password" id="Password" placeholder="<spring:message code="label.login.password"/>">
								</div>
								<!-- Remember Me -->
								<div class="form-group remember-me">
									<div class="col-md-6 col-sm-6 col-xs-12 remember-user nopadding ">
										<input type="checkbox" id="remember-me" /> 
										<label for="remember-me"><spring:message code="label.login.rememberme" /></label>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12 nopadding">
										<a class="pull-right forgot-password" href="forgot-password"><spring:message code="label.login.forgot" /></a>
									</div>
								</div>		
									<!-- End Remember Me -->				
								<div class="form-group">								
									<div class="col-md-6 col-sm-6 col-xs-12 nopadding">
										<button type="submit" id="loginUser" class="btn btnLogin">
											<spring:message code="message.login" />
										</button>
									</div>		
									<div class="col-md-6 col-sm-6 col-xs-12 nopadding">
										<a href="register-page" id="register" class="btn btnLogin pull-right">
											<spring:message code="label.register.register" />
										</a>
									</div>	
								</div>
								<div class="form-group text-center">
									<span class="termslabel"><small id="termsandconditions"><spring:message code="login.terms_of_service.message" /><a class="forgot-password" href="termsandconditions" target="_blank"><spring:message code="login.terms_of_service" /></a></small><c:if test="${privacyPolicyUrl!=null}"><small><spring:message code="label.and"/><a class="forgot-password" href="${privacyPolicyUrl}"  target="_blank" class="" ><spring:message code="label.privacy.policy"/></a></small></c:if>.
         							</span>
								</div>								
								<div class="form-group">
									<p class="error-login validation-message" hidden=""></p>
									<p class=" validation-message tcmsg" hidden="false">
										In order to use our services you must agree to Terms of Service
									</p>
								</div>
								<c:if test="${isGuestAccessAllowed}">
									<div class="form-group">
										<div class="continue-as-guest text-center">
												<a  id="guestLogin"  href="javascript:void(0)"  class=""><spring:message code="message.button.guest.continue" /></a>
										</div>
									</div>
								</c:if>
							</form>
						</div>
					</div>
				</div>
				<!-- End Login Controls Row-->
			</div>
			<!-- End Login Card-->
</div>
		<!-- End Container Fluid-->
	
	
	<!-- New login template end-->
	
		<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>
	<!-- 14.1.2016  5.5.1.0_EH_Checking_product_catalog_check_for_guest_user_using_feature_access_map_added-->
	<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content custom-modal-content">
				<div class="modal-header custom-modal-header">
					<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
					<h4 class="modal-title custom-modal-title">
						<spring:message code="label.bulkpartupload.information" />
					</h4>
				</div>
				<div class="modal-body custom-modal-body"></div>
				<div class='modal-footer custom-modal-footer'></div>
			</div>
		</div>
	</div>
</body>
<!-- Js library plugin -->
<!-- build:remove -->
<script type="text/javascript" src="../js/jquery.i18n.properties.js?version=${properties['application.version']}"></script>
<!-- Custom Js file for Functionality -->
<script src="../js/bootstrap.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/intlTelInput.min.js?version=${properties['application.version']}"></script>
<!--  /build -->

<script type="text/javascript">
	var productCatalogfeature_msg = "<spring:message code='message.productc.catalog.feature' javaScriptEscape='true'/>";
</script>
<script src="../js/module-login.js?version=${properties['application.version']}" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var loginObj =  new Systems.Classes.userLogin();
		loginObj.bindEvents();
	});
</script>
</html>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
<link rel="stylesheet" type="text/css" href="../css/theme.css">	

<!-- /build -->
<!-- build:css ../assets/intlTelInput.min.css -->
<!-- /build -->
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
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->
<!-- Javascript Library-->
<!-- build:js  ../assets/globalscripts.js -->

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.4/jquery.i18n.js?version=${properties['application.version']}" defer></script>


<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}" 
	type="text/javascript"></script>

<!-- /build -->

<script
	src="../js/module-error-handler.js?version=${properties['application.version']}" ></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/5.8.7/js/intlTelInput.min.js?version=${properties['application.version']}" defer></script>
<style type="text/css">
div#registered-modal>.modal-backdrop {
	opacity: 0;
}
</style>
</head>

<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<input type="hidden" id="language_id_"
		value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
	<div class="login-container rrgRegister">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 overlay-header">
			<div class="overlay-header-wrapper">

				<div class="overlay-header-content">
					<h1>
						<img id="loginlogo" alt="Logo" src="${sessionScope.logo}">
					</h1>
					<h2>Register</h2>
				</div>

				<%-- <div class="overlay-header-content">
                    <h1><img src="${sessionScope.logo}" alt=""></h1>
                    <h2><spring:message code="label.register.register" /></h2>
                </div> --%>

			</div>
		</div>
		<div
			class="col-lg-12 col-md-12 col-sm-12 col-xs-12 login-content overlay-content"
			style="height: auto !important">
			<h3 class="hidden-xs">&nbsp;</h3>
			<div class="signin-section">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin: auto;text-align: center;">
					<form id="register-form">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
							<div class="row form-group">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="text" class="form-control input-valid clearable"
										id="firstName" name="firstName" maxlength="50"
										placeholder='<spring:message code="label.register.firstName" />' />
									<span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="text" class="form-control input-valid clearable"
										id="lastName" maxlength="50"
										placeholder='<spring:message code="label.register.lastName" />' />
									<span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="text" class="form-control input-valid clearable"
										name="user_name" id="user_name" maxlength="50"
										placeholder='<spring:message code="label.register.userName" />' />
									<span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="email" class="form-control input-valid clearable"
										id="email_register" maxlength="50"
										placeholder='<spring:message code="label.register.emailId" />' />
									<span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="password"
										class="form-control input-valid clearable"
										id="password_register"
										placeholder='<spring:message code="label.register.password" />' />
									<span class="check-pending"></span>
									<p class="validation-message"></p>
									<a class="help-button" href="javascript:;"
										data-toggle="tooltip" data-placement="bottom"
										title='<spring:message code="label.register.password.warnings" />'>?</a>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="password"
										class="form-control input-valid clearable"
										placeholder='<spring:message code="label.register.confirm.password" />'
										id="confirm_password_register" /> <span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding"
									id="international-phone">
									<span class="input-group-addon aria-code"><i
										class="flag-ico" title="United States: +1"></i></span> 
										<input type="text" class="form-control input-valid clearable"
										id="phone_register" data-country-code="" data-number=""
										name="phone" /> <span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="text" class="form-control input-valid clearable"
										id="companyName" maxlength="50"
										placeholder='<spring:message code="label.register.company.name" />' />
									<span class="check-pending"></span>
									<p class="validation-message"></p>
								</div>

							</div>

							<div class="row form-group">
							<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
									<input type="text" class="form-control clearable"
										id="customerAccount" maxlength="50"
										placeholder='<spring:message code="label.customeraccount" />' /><br
										class="hidden-xs">
								</div>
									<%-- <textarea class="form-control clearable" id="address"
										maxlength="500"
										placeholder='<spring:message code="label.address" />'></textarea> --%>
										<%-- <c:if test="${addressFieldIsRequired}"> --%>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
									
								
								<%-- </c:if> --%>
									<c:choose>
									    <c:when test="${addressFieldIsRequired==true}">
									       <textarea class="form-control input-valid clearable"
												id="address"
												maxlength="500"
												placeholder='<spring:message code="label.address" />'></textarea>
											<span class="check-pending"></span>
											<p class="validation-message"></p>
											<input type="hidden" id="addressRequired" value="true" />
									    </c:when>    
									    <c:otherwise>
									        <textarea class="form-control clearable" id="address"
											maxlength="500"
											placeholder='<spring:message code="label.address" />'></textarea>
									    </c:otherwise>
									</c:choose>	
								</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
								
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
									<textarea class="form-control  clearable" style="height: 155px !important"
										 id="notes" maxlength="500"
										placeholder='<spring:message code="label.notes" />'></textarea>
									</div>
												
								</div>
							</div>
							<div class="row form-group">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<dl class="multiselect-list input-valid clearable">
										<dt class="nopadding">
											<a href="javascript:;"> <span
												class="multiselect-title pull-left"><spring:message
														code="label.register.brand.approval" /></span>
												<p class="selected-items pull-left"></p> <span
												class="down-arrow"></span>
											</a>
										</dt>
										<dd class="nopadding">
											<div class="mutliSelect"></div>
										</dd>
									</dl>
									<span class="check-pending"></span>
									<p class="validation-message"></p>
									<a class="help-button" href="javascript:;"
										data-toggle="tooltip" data-placement="bottom"
										title='<spring:message code="message.register.brand.approval" />'>?</a>
								</div>

								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
									<%--  <label class="control-label col-lg-5 col-md-4 col-sm-4 charges-label nopadding-xs">
                                    <spring:message code="label.register.select.language" /></label> --%>
									<div class="dropdown select-btn">

										<!--   <c:choose>
                                    <c:when test="${sessionScope['scopedTarget.genericUserProperties'].languageDescription eq null}">
                                      <button aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="dropdownMenu" type="button" class="btn btn-default dropdown-toggle ">
                                        Select Language
                                        <span class="down-arrow"></span>
                                      </button>
                                    </c:when>
                                    <c:otherwise> -->

										<button aria-expanded="true" aria-haspopup="true"
											data-toggle="dropdown" data-default="true" id="dropdownMenu"
											type="button" class="btn btn-default dropdown-toggle ">
											<spring:message code="label.register.select.language" />
											<span class="down-arrow"></span>
										</button>

										<!--  </c:otherwise>
                                    </c:choose> -->

										<ul aria-labelledby="dropdownMenu"
											class="dropdown-menu select-btn-menu" id="languageList">
											<c:forEach var="item"
												items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
												<li class=""><a id="${item.key}" class="nav_a" href="#">${item.value}</a></li>
											</c:forEach>
										</ul>

									</div>
									<span class="check-pending"></span>
									<p class="validation-message"></p>
									<%--  <button aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="dropdownMenu" type="button" class="btn btn-default dropdown-toggle ">
                                    <spring:message code="label.register.select.language" />
                                    <span class="caret"></span>
                                  </button> --%>

									<!-- <select name="language" id="languageList" class="form-control selectBtn language">
                                            <c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
                                                <option value="${item.key}">${item.value}</option>
                                             </c:forEach>
                                    </select> -->
									<a class="help-button" href="javascript:;"
										data-toggle="tooltip" data-placement="bottom"
										title='<spring:message code="label.register.defaultlanguage" />'>?</a>
								</div>
							</div>

							<c:choose>
								<c:when
									test="${properties['show.register.terms.service'] == 'true'}">
									<div
										class="wrapDetail col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
										<input type="checkbox" id="tnc-checkbox" /> <label><spring:message
												code="label.Iagreeto" /><a href="#" id="termsandconditions">
												<spring:message code="message.register.terms" /></a><c:if test="${privacyPolicyUrl!=null}"><spring:message code="label.and"/><a href="${privacyPolicyUrl}"  target="_blank" class=""><spring:message code="label.privacy.policy" /></a></c:if>	
										</label> <input type="hidden" name="terms" id="terms" value="true" />
									</div>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="terms" id="terms" value="false" />
								</c:otherwise>
							</c:choose>

							<div class="row rev-inlineblock column-paddings">
								<p id="error" class="validation-message" style="display: none"></p>
								<div class="terms" style="display: none;">

									<input type="checkbox" id="agree-terms" value="1" checked /> <label
										for="agree-terms"><spring:message
											code="message.register.agree" /> <a href="javascript:;"
										id="termsAndCond"><spring:message
												code="message.register.terms" /></a></label>
												
										
									<p class="validation-message" style="display: none">
										<spring:message code="message.register.warnings.terms" />
									</p>

								</div>
								<!--Fix for NREV-1743, done by Kameshwari  -->
								<a
									href="${properties['gensuite.login.url']}"
									class="green-button prev back-link"><spring:message
										code="message.register.back" /></a> <a href="#"
									data-toggle="modal" id="register-submit"
									class="green-button next continue-link"><spring:message
										code="label.register.register" /></a>
							</div>

							<div class="form-group">
								<p class="error-login validation-message" hidden></p>
								<p class=" validation-message tcmsg" hidden>
									<spring:message code="message.register.warnings.terms" />
								</p>
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
													<input type="hidden" name="lang" id="lang" value="true" />
												</c:forEach>
											</ul>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="lang" id="lang" value="false" />
								</c:otherwise>
							</c:choose>

						</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	</div>





	<div class="pageLoader" style="display: none">
		<div calss="loader-content">
			<h4>
				<spring:message code="message.register.loading" />
			</h4>
			<div class="loader"></div>
		</div>
	</div>

	<!-- Registered Modal Window -->
	<div class="modal fade nopadding" id="registered-modal"
		aria-hidden="true">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 overlay-header">

			<div class="overlay-header-content">
				<h1>
					<img id="loginlogo" alt="Logo" src="${sessionScope.logo}">
				</h1>
				<h2>Registered</h2>
			</div>

			<%-- <div class="overlay-header-content">
                    <h1><img src="${sessionScope.logo}" alt=""></h1>
                    <h2><spring:message code="message.register.registered" /></h2>
                </div> --%>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 overlay-content">
			<%-- <h3><spring:message code="label.register.register" /></h3> --%>
			<div class="signin-section">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 col-xs-offset-0">
					<img src="../images/overlay-remember.png">
					<p>
						<spring:message code="message.register.done" />
					</p>
					<p id="success">
						<spring:message code="message.register.asv.success" />
					</p>
					<!--<p>Your Password has been sent to your registered email address john.smith@blah.com</p>-->
					<c:if test="${isGuestAccessAllowed}">
						<a class="green-button green-button-width next"
							href="guestlogin?promptContinueGuest=true&forceGuest=true"><spring:message
								code="message.button.guest.continue" /></a>
					</c:if>
					<a class="green-button green-button-width next"
						href="${properties['extrenal.link.url']}"><spring:message
							code="message.button.external.link" />
						${properties['extrenal.link.button.name']}</a>
				</div>
			</div>
		</div>
		<input type="hidden"
			value="${sessionScope['scopedTarget.genericUserProperties'].languageDescription}"
			id="activeLanguage"> <input type="hidden"
			name="baseUrlRegister" value="${properties['base.url']}"
			id="baseUrlRegister">

	</div>
	<!-- Registered Modal Window End -->

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
			</div>
		</div>
	</div>
	</div>


	<!-- Javascript Plugins -->
	<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
	<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
	<script
		src="../js/jquery.mobile.custom.min.js?version=${properties['application.version']}"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/module-login.js?version=${properties['application.version']}"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var registerObj =  new Systems.Classes.userRegister();
			registerObj.bindEvents();
			$("#termsandconditions").click(function() {
				var brandValues="";
				$('p.selected-items span').each(function(){
					brandValues+=$(this).data('title')+",";
				});
				if(brandValues==""){
					$('.modal-body').text("<spring:message code="label.message.one.brand" />");
	    			$("#myModal").show();	
					return false;
				}
				window.open("termsandconditions?selectedorganizations="+brandValues);
			});
	
	});
		
		 $(".custom-close").click(function(){
			   $("#myModal").hide();
			});
	</script>
</body>
</html>
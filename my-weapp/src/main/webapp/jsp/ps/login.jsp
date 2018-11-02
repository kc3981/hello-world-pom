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
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="store-styles.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../css/ps/framework-fix.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/ps/login.css?version=${properties['application.version']}">

<!-- Can add any specific styles to this page only here. -->
</head>
<body class="">
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<jsp:include page="loader.jsp" />
	<input type="hidden" id="language_id_" value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
	<div id="content" class="d-none p-2">
		<div class="row no-gutters">
			<div class="col-4 d-none d-sm-block">
				<jsp:include page="themed-side.jsp" />
			</div>
			<div class="col-12 col-sm-8 px-3 flex-content-wrapper">
				<div class="row no-gutters flex-shrink-0">
					<div class="col-12 d-flex justify-content-center">
						<label class="mt-2"> <span class="mr-lg-2"><spring:message code="label.dont.have.account" /></span> 
							<a class="font-weight-semi-bold" href="register-page"> <spring:message
									code="label.register.register" />
						</a>
						</label>
					</div>
				</div>
				<div class="d-flex flex-column flex-shrink-0">
					<div class="row no-gutters">
						<div class="col-12 form-group mx-auto justify-content-center mb-4">
							<div class="branding-logo mt-5 mb-4 mx-auto"></div>
						</div>
					</div>
					<div class="row no-gutters">
						<jsp:include page="brands.jsp" />
					</div>
					<div class="row no-gutters">
						<form class="col-12">
							<div class="form-row justify-content-center">
								<div class="col-12 col-lg-6 form-group">
									<label for="email"><spring:message
											code="label.register.emailIduserName" /><span
										class="required-star">*</span></label> <input type="email"
										class="form-control" id="Username" maxlength="50" />
								</div>
							</div>
							<div class="form-row justify-content-center">

								<div class="col-12 col-lg-6 form-group">
									<div id="show_hide_password">
										<label for="password" class="font-weight-bold input-label"><spring:message
												code="label.register.password" /><span
											class="required-star">*</span></label> <a
											class="link-inverse float-right" href=""> <i
											class="fa fa-eye-slash" aria-hidden="true"></i> <span
											class="font-size-sm" id="passwordShowHide"><spring:message
													code="label.show" /></span>
										</a>
										<div class="input-group">
											<input type="password" class="form-control" id="Password" />
										</div>
									</div>
									<div class="d-flex justify-content-end mt-2 ">
										<a class="font-size-sm forgot-password float-right"
											href="forgot-password"><spring:message
												code="label.login.forgot" /></a>
									</div>

								</div>
							</div>
							<div class="form-row justify-content-center mb-3 mt-5">
								<button type="submit" id="loginUser"
									class="btn btn-rounded btn-action waves-effect">
									<spring:message code="message.login" />
								</button>
							</div>
							<div class="form-row justify-content-center ">
								<p class="error-login text-danger text-center"></p>
							</div>
							<c:if test="${isGuestAccessAllowed}">
								<div class="form-row justify-content-center mb-5">
									<div class="continue-as-guest text-center">
										<a id="guestLogin"
											href="guestlogin?promptContinueGuest=true&forceGuest=true"
											class=""><spring:message
												code="message.button.guest.continue" /></a>
									</div>
								</div>
							</c:if>
						</form>
					</div>
				</div>
				<div class="d-flex flex-column flex-shrink-0">
					<div class="row no-gutters mt-5">
						<div class="col-12 mt-5 text-center">
							<jsp:include page="language.jsp" />
						</div>
					</div>

					<div class="row no-gutters mt-4">
						<c:choose>
							<c:when
								test="${properties['show.register.terms.service'] == 'true'}">
								<div class="col-12 justify-content-center">
									<label class="font-size-sm form-row justify-content-center"><spring:message
											code="label.signing.agree" /> &nbsp;<a
										href="termsandconditions" target="_blank"
										id="termsandconditions"> <spring:message
												code="message.register.terms" />
									</a> <c:if test="${privacyPolicyUrl!=null}">
									&nbsp;<spring:message code="label.and" />&nbsp; 
									<a href="${privacyPolicyUrl}" target="_blank" class=""><spring:message
													code="label.privacy.policy" /></a>
										</c:if> </label> <input type="hidden" name="terms" id="terms" value="true" />
								</div>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="terms" id="terms" value="false" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="modal.jsp"%>
</body>
<%@ include file="store-scripts.jsp"%>
<script
	src="../js/ps/login.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/ps/emailvalidate.js?version=${properties['application.version']}"
	type="text/javascript"></script>
</html>

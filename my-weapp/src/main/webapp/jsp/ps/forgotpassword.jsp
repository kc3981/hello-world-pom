<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="store-styles.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/ps/framework-fix.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/ps/login.css?version=${properties['application.version']}">
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
			<div class="col-12 d-flex justify-content-center invisible">
				<label class="mt-0"> <span class="mr-lg-2"><spring:message code="label.dont.have.account" /></span> 
					<a class="font-weight-semi-bold" href="register-page"> <spring:message
							code="label.register.register" />
				</a>
				</label>
			</div>
	</div>
      <div class="d-flex flex-column flex-shrink-0">
        <div class="row no-gutters">
          <div class="col-12 form-group mx-auto justify-content-center mb-4">
              <div class="branding-logo mb-4 mx-auto"></div>
          </div>
        </div>

        <div class="row no-gutters">
          <jsp:include page="brands.jsp" />
        </div>
        <div class="row no-gutters mt-3 mb-5">
          <form id="forgot-password-form" class="col-12" action="forgotPassword" method="post" onsubmit="return validate()" novalidate>
            <div class="form-row justify-content-center">
              <div class="col-12 col-lg-6 form-group mb-3">
                <h1 class="titles m-0">
                  <spring:message code="label.forgot.your.password" />
                </h1>
              </div>
            </div>
            <div class="form-row justify-content-center">
              <div class="col-12 col-lg-6 form-group mb-4">
                <p>
                  <spring:message code="label.never.fear" />
                </p>
              </div>
            </div>
            <div class="form-row justify-content-center">
              <div class="col-12 col-lg-6 form-group">
                <label for="email_forgot"><spring:message code="label.register.emailId" /></label> <input type="email" class="form-control"
                  id="email_forgot" name="email" maxlength="200" required />
              </div>

            </div>
            <div class="form-row justify-content-center mb-5 mt-4">
            	<div class="col-12 col-lg-6 form-group d-flex justify-content-end align-items-center">
             		<a class="mr-4 p-3" href="${sessionScope.loginUrl}"> <spring:message code="label.back.to.login" /> <spring:message code="message.login" />
              		</a>
              		<button id="forgot-password-submit" type="submit" class="btn btn-rounded waves-effect btn-action">
                		<spring:message code="label.send.password" />
              		</button>
            	</div>
           	</div>
          </form>
        </div>
       </div>
       <div class="d-flex flex-column flex-shrink-0">

        <div class="row no-gutters mt-5">
          <div class="col-12 text-center">
            <jsp:include page="language.jsp" />
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="store-scripts.jsp"%>
  <script src="../js/ps/forgotpass.js?version=${properties['application.version']}" type="text/javascript"></script>
  <script src="../js/ps/emailvalidate.js?version=${properties['application.version']}" type="text/javascript"></script>
</body>
</html>
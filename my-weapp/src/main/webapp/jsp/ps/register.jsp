<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="store-styles.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/ps/framework-fix.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/ps/intlTelInput.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/ps/multiple-select.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/ps/register.css?version=${properties['application.version']}">
</head>
<body class="">
  <jsp:include page="../googleAnalyticsbody.jsp" />
  <jsp:include page="loader.jsp" />
  <div id="content" class="d-none p-3">
    <div class="row no-gutters mt-3">
      <div class="col-4 d-none d-sm-block">
        <jsp:include page="themed-side.jsp" />
      </div>

	 <div class="col-12 col-sm-8 pl-0 pl-sm-4 pl-md-5">
		<div class="d-flex flex-lg-row flex-sm-column justify-content-lg-between mt-sm-0 no-gutters row">
			<div>
				<a class="branding-logo branding-logo mx-md-0" href="${properties['default.landing.page']}"></a>
			</div>	
			<div class="mt-3 mt-lg-0">
	  			<label class="d-flex align-items-center mr-xl-5">
	       		<span class="mr-lg-2"><spring:message code="label.already.have.account" /></span>
				<a class="ml-2 font-weight-semi-bold" href="${sessionScope.loginUrl}?forceLogin=true" > 
				<spring:message code="message.login" />
		     	</a>
		   		</label>
		 	</div>          
		</div>
        <div class="row no-gutters mb-3">
          <jsp:include page="brands.jsp" />
        </div>

        <div class="row no-gutters mt-5">
          <div class="col-12 col-lg-6 ">
            <h1 class="titles mb-5">
              <spring:message code="label.register.account" />
            </h1>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-12 col-lg-6 ">
             <jsp:include page="language.jsp" />
          </div>
        </div>            
        <div class="row no-gutters mt-3">
          <form id="register-form" class="col-12 max-width-form">
            <div class="form-row">
              <div class="col-12 col-lg-6 form-group">
                <label for="firstName"><spring:message code="label.register.firstName" /><span class="required-star">*</span></label>
                <input type="text" class="form-control" id="firstName" name="firstName" maxlength="50" />
              </div>
              <div class="col-12 col-lg-6 form-group">
                <label for="lastName"><spring:message code="label.register.lastName" /><span class="required-star">*</span></label> 
                <input type="text" class="form-control " id="lastName" maxlength="50" />
              </div>
            </div>
            <div class="form-row">
              <div class="col-12 col-lg-6 form-group">
                <label for="email"><spring:message code="label.register.emailIduserName" /><span class="required-star">*</span></label> 
                <input type="email" class="form-control" id="email_register" maxlength="50" />
              </div>
              <div class="col-12 col-lg-6 form-group" id="show_hide_password">
                <label for="password"><spring:message code="label.register.password" /><span class="required-star">*</span></label> 
                <a class="link-inverse float-right" href="">
                    <i class="fa fa-eye-slash" aria-hidden="true"></i>
                  <span class="font-size-sm" id="passwordShowHide"><spring:message code="label.show" /></span>

                </a>
                <div class="input-group">
                  <input type="password" class="required form-control" id="password_register" />

                  <ul class="dropdown-menu p-3" id="error-info-password">
                    <li class="font-size-sm" id="min-8-char"><i class="fa fa-check-circle pr-1" aria-hidden="true"></i> 
                      <spring:message code="label.minimuim.8char" /></li>
                    <li class="font-size-sm" id="one-number"><i class="fa fa-check-circle pr-1" aria-hidden="true"></i> 
                      <spring:message code="label.mustinclude.1number" /></li>
                    <li class="font-size-sm" id="one-special"><i class="fa fa-check-circle pr-1" aria-hidden="true"></i> 
                      <spring:message code="label.mustinclude.1specialchar" /></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="form-row">
              <c:choose>
                <c:when test="${systemConfigMap['register.show.phonenumber']==true}">
                  <div class="col-12 col-lg-6 form-group" id="international-phone">
                    <label for="number"><spring:message code="label.register.phone" /><span class="required-star">*</span></label>
                      <span class="input-group-addon aria-code"><i class="flag-ico" title="United States: +1"></i></span> 
                      <input type="tel" class="form-control" id="phone_register" name="phone" data-country-code="" data-number="" />
                  </div>
                  <input type="hidden" id="phoneNumberRequired" value="true" />
                </c:when>
              </c:choose>
              <c:choose>
                <c:when test="${systemConfigMap['register.show.companyname']==true}">
                  <div class="col-12 col-lg-6 form-group">
                    <label for="number"><spring:message code="label.register.company.name" /><span class="required-star">*</span></label>
                    <input type="text" class="form-control" id="companyName" maxlength="50" />
                  </div>
                </c:when>
              </c:choose>
              <c:choose>
                <c:when test="${systemConfigMap['register.show.customeraccount']==true}">
                  <div class="col-12 col-lg-6 form-group">
                    <label for="customerAccount"><spring:message code="label.customeraccount" /></label> 
                    <input type="text" class="form-control" id="customerAccount" maxlength="50" />
                  </div>
                </c:when>
              </c:choose>

              <div id="organizationIdDiv" class="col-12 col-lg-6 form-group">
              <label for="selectOrganization"><spring:message code="select.brands.foraccess.approval" /><span class="required-star p-0">*</span></label>
                 <select id="organization" class="form-control" multiple="multiple">
                </select>
              </div>
            </div>
            <c:choose>
              <c:when test="${systemConfigMap['register.show.address']==true}">
                <div class="form-row">

                  <div class="col form-group">
                    <label for="address"><spring:message code="label.address" /></label>
                    <c:choose>
                      <c:when test="${addressFieldIsRequired==true}">
                        <textarea class="form-control" id="address" maxlength="500"></textarea>
                        <input type="hidden" id="addressRequired" value="true" />
                      </c:when>
                      <c:otherwise>
                        <textarea class="form-control" id="address" maxlength="500"></textarea>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </c:when>
            </c:choose>            
            <c:choose>
              <c:when test="${systemConfigMap['register.show.notes']==true}">
                <div class="form-row">
                  <div class="col form-group">
                    <label for="notes"><spring:message code="label.notes" /></label>
                    <textarea class="form-control" id="notes" maxlength="500"></textarea>
                  </div>
                </div>
              </c:when>
            </c:choose>
            <div class="form-row">
              <div class="col form-group">
                <p class="validation-message alert-danger tcmsg" style="display:none">
                  <spring:message code="message.register.warnings.terms" />
                </p>
                <p id="error" class="validation-message alert-danger" style="display: none"></p>
              </div>
            </div>
            <div class="form-row mt-4 mb-2">
              <div class="col-12">
                <c:choose>
                  <c:when test="${properties['show.register.terms.service'] == 'true'}">
                    <div class="checkbox p-0">
                      <input type="checkbox" id="tnc-checkbox" class=""> 
                      <label class="checkbox-label font-size-sm" for="tnc-checkbox"><spring:message code="label.Iagreeto" /> 
                        <a href="#" id="termsandconditions"> <spring:message code="message.register.terms" /></a> 
                        <c:if test="${privacyPolicyUrl!=null}">
                            <spring:message code="label.and" />
                            <a href="${privacyPolicyUrl}" target="_blank" class="">
                            <spring:message code="label.privacy.policy" /></a>
                          </c:if> 
                        </label> 
                        <input type="hidden" name="terms" id="terms" value="true" />
                    </div>
                  </c:when>
                  <c:otherwise>
                    <input type="hidden" name="terms" id="terms" value="false" />
                  </c:otherwise>
                </c:choose>
              </div>
              <div class="col-12  form-group">
                <div class="checkbox p-0">
                  <input type="checkbox" class="" id='tradeshow'> 
                  <label class="checkbox-label font-size-sm" for="tradeshow"><spring:message code="label.receive.updates" /></label>
                </div>
              </div>
            </div>
            <div>
              <button id="register-submit" class="btn btn-rounded waves-effect btn-action">
                <spring:message code="label.submit.registration" />
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="store-scripts.jsp"%>
  <script src="../js/ps/intlTelInput.min.js?version=${properties['application.version']}"></script>
  <script src="../js/ps/multiple-select.js?version=${properties['application.version']}"></script>
  <script src="../js/ps/emailvalidate.js?version=${properties['application.version']}" type="text/javascript"></script>
  <script src="../js/ps/phonevalidate.js?version=${properties['application.version']}" type="text/javascript"></script>
  <script src="../js/ps/register.js?version=${properties['application.version']}" type="text/javascript"></script>
</body>
</html>
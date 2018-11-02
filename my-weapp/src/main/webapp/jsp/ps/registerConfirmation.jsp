<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
  content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="store-styles.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/ps/framework-fix.css?version=${properties['application.version']}">
</head>
<body>
<jsp:include page="../googleAnalyticsbody.jsp" />
<div id="content">
  <div class="row no-gutters mt-4 px-3">
    <div class="col-4 d-none d-sm-block">
      <jsp:include page="themed-side.jsp" />
    </div>
    <div class="col-12 col-sm-8 pl-0 pl-sm-4 pl-md-5">
      <div class="row no-gutters">
        <div class="col-8">
          <div class="branding-logo branding-logo mx-auto mx-md-0">
          </div>  
        </div>
        
      </div>
      
      <div class="row no-gutters mb-3">
        <jsp:include page="brands.jsp" />
      </div>
  
      <div class="row no-gutters mt-5">
        <div class="col-12 ">
          <h1 class="titles mb-3"><spring:message code="thanks.registration.successmsg" /></h1>
        </div>
      </div>
          
          <div class="row no-gutters mt-2 max-width-form">
            <div class="col-12 col-sm-12 alert-genalpha">
              <p class="mb-2 pt-3 px-3" ><spring:message code="received.yourinfo.forapproval" /></p>
              <p class="font-weight-semi-bold pt-3 px-3"><a href="guestlogin?promptContinueGuest=true&forceGuest=true" ><spring:message code="continue.as.guest" /><i class="fa fa-arrow-right px-2" aria-hidden="true"></i></a></p>
            </div>
          </div>
          
          <div class="row no-gutters mt-5">
                <p><spring:message code="reachout.us.oncontactus" /></p>
          </div>
           <div class="row no-gutters">
            <a href="contactus" class="font-weight-semi-bold"><spring:message code="label.contactus" /></a>
           </div>       
    </div>
  </div>  
</div>

<%@ include file="store-scripts.jsp" %>
</body> 
</html>
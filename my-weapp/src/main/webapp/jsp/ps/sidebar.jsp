<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Sidebar navigation -->
<div id="slide-out" class="side-nav branding-sidebar light-blue-skin">
  <ul class="custom-scrollbar">
    <li>
     <div class="side-bar-logo-wrapper waves-light">
       <div class="branding-logo-sidebar img-fluid flex-center"><a class="logo-img-link d-content" href="${properties['default.landing.page']}"></a></div>
     </div>					
    </li>
    
	<c:choose>
	<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
		<li>
		<a class="waves-effect font-weight-bold dropdown-item" href="${sessionScope.loginUrl}?forceLogin=true"><spring:message code="message.login"/></a>
		</li>
	</c:when>
	<c:otherwise>
		<li>			
			<a class="waves-effect font-weight-bold dropdown-item" href="accountsetting"><spring:message
					code="label.header.account" /></a>
		</li>
					
					<c:if test="${properties['user.application']=='STANDALONE'}">
						<sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER')">
						<li>
						<a class="waves-effect font-weight-bold dropdown-item" href="getorders"> 
							<spring:message code="label.header.historicalorder" /> </a>
						</li>
						</sec:authorize>
					</c:if>
					<c:if test="${properties['user.application']!='STANDALONE'}">
						<sec:authorize access="hasRole('ROLE_ORDER')">
						<li>
							<a class="waves-effect font-weight-bold dropdown-item"
							href="historicalorderbrand"> <spring:message
							code="label.header.order" /></a>
						</li>
						</sec:authorize>
					</c:if>
					</c:otherwise>
	</c:choose>

	<c:if test="${properties['findADealer.link.required']=='true'}">
		<li>
		<a class="waves-effect font-weight-bold dropdown-item"  href="findADealer" id="dealerLinkDiv"><spring:message code="label.header.findADealer" /></a>
		</li>
	</c:if>	            
	<sec:authorize
					access="hasRole('ROLE_DOCUMENT_REPOSITORY')">
<li>												
					<a class="waves-effect font-weight-bold dropdown-item" href="getmydocuments"><span><spring:message
								code="label.header.document" /></span></a>
</li>								
				</sec:authorize>
				<sec:authorize
					access="hasRole('ROLE_ANALYTICS') or hasRole('ROLE_ANALYTICS_ADMIN')">
<li>												
					<a class="waves-effect font-weight-bold dropdown-item" href="${properties['kibana.analitics.link']}"
						target="_blank"><spring:message code="label.footer.analytics" /></a>
</li>													
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
<li>														
					<a class="waves-effect font-weight-bold dropdown-item" href="${properties['admin.link']}" target="_blank"><spring:message
								code="label.footer.admin" /></a>
</li>								
				</sec:authorize>
    <li>
      	<a class="waves-effect font-weight-bold dropdown-item" href="contact">
		 	<spring:message code="label.header.contactus"/>
	    </a>
	</li>	
	<li>
				<a class="waves-effect font-weight-bold dropdown-item" href="#">
						<span>Privacy Notice</span>
				</a>
	</li>							
	<li>							
				
				<a class="waves-effect font-weight-bold dropdown-item" href="#">
						<span>Terms of Service</span>
				</a>
	</li>							
	<li>							
				<a class="waves-effect font-weight-bold dropdown-item" href="termsofuse" target="_blank">
					<spring:message	code="label.terms.use" ></spring:message>	
				</a>
	</li>								
				
				
  </ul>
</div>
<!--/. Sidebar navigation -->
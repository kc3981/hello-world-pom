<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- These tags begin in Store Header -->
	</div>
</main>
<footer class="footer px-sm-3 py-3">
	<div class="container-fluid">
	
		<div class="row no-gutters">
			<div class="col-1 col-sm-2">
				<c:choose>
				<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
				</c:when>
				<c:otherwise>		
				<div class="dropdown language-selector">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							${sessionScope['scopedTarget.genericUserProperties'].languageDescription}
					<span class="caret"></span>
				</button>			
				<ul class="dropdown-menu p-3" aria-labelledby="dropdownMenu1">	
					<c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
				<li class="">
					<a id="${item.key}" class="nav_a languageClick" href="#">${item.value}</a>
					<input type="hidden" name="lang" id="lang" value="true" />
				</li>											
				</c:forEach>
					</ul>
				</div>
				
				</c:otherwise>
				</c:choose>
			</div>
			<div class="col-12 col-sm-3">
					<%@ include file="newsletter.jsp"%>			
			</div>
			<div class="col-12 col-sm-7 link-list text-right">	
				<a href="contact">
		              <spring:message code="label.header.contactus"/>
	            </a>	
				<c:if test="${properties['findADealer.link.required']=='true'}">
					<a href="findADealer" id="dealerLinkDiv"><spring:message code="label.header.findADealer" /></a>
				</c:if>	            
			  <c:choose>
				<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
				</c:when>
				<c:otherwise>			
					<a href="accountsetting"><spring:message
					code="label.header.account" /></a>
					<c:if test="${properties['user.application']=='STANDALONE'}">
						<sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER')">
						<a onclick="maskingForPage()" href="getorders"> 
							<spring:message code="label.header.historicalorder" /> </a>
						</sec:authorize>
					</c:if>
					<c:if test="${properties['user.application']!='STANDALONE'}">
						<sec:authorize access="hasRole('ROLE_ORDER')">
							<a onclick="maskingForPage()"
							href="historicalorderbrand"> <spring:message
							code="label.header.order" /></a>
						</sec:authorize>
					</c:if>
					</c:otherwise>
				</c:choose>
				<a href="#">
						<span>Privacy Notice</span>
				</a>
				<a href="#">
						<span>Terms of Service</span>
				</a>
				<a href="termsofuse" target="_blank">
					<spring:message	code="label.terms.use" ></spring:message>	
				</a>
				<sec:authorize
					access="hasRole('ROLE_DOCUMENT_REPOSITORY')">
					<a href="getmydocuments"><span><spring:message
								code="label.header.document" /></span></a>
				</sec:authorize>
				<sec:authorize
					access="hasRole('ROLE_ANALYTICS') or hasRole('ROLE_ANALYTICS_ADMIN')">
					<a href="${properties['kibana.analitics.link']}"
						target="_blank"><spring:message code="label.footer.analytics" /></a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="${properties['admin.link']}" target="_blank"><spring:message
								code="label.footer.admin" /></a>
				</sec:authorize>
		</div>
		</div>
		<div class="row  no-gutters">
		  	<%@ include file="socialmedia.jsp"%>			
		</div>
		<div class="footer-row row no-gutters">
			<div class="col text-center align-items-center">
				<span class="copyright"><spring:message code="label.footer.copy.rights" />
				${properties['application.version']}
				</span>
			</div>
		</div>
	</div>
</footer>
<%@ include file="store-scripts.jsp" %>


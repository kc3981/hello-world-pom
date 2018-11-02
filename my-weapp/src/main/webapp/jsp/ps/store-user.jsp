<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="order-md-last d-none d-sm-inline-flex justify-content-end ml-2 ml-lg-3">
    <input type="hidden" id="docServerUrl" value="${properties['docserver.url']}"> 
    <input type="hidden" id="userId" value="<sec:authentication property='principal.id'></sec:authentication>">
    <input type="hidden" id="authToken" value="<sec:authentication property='principal.authToken'></sec:authentication>">
	<input type="hidden" id="language_id_" value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
	<c:choose>
	<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
	   <!-- language selection for non logged in user-->
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
		<div class="d-flex align-items-center">
			<a class="font-weight-semi-bold link-inverse" href="registerpage"><spring:message code="label.register.register"/></a>
			<a class="font-weight-semi-bold link-inverse border-left borer-light pl-3 ml-3 py-2" href="${sessionScope.loginUrl}?forceLogin=true"><spring:message code="message.login"/></a>
		</div>
		</c:when>
	<c:otherwise>
	   <sec:authorize access="isAuthenticated()">
		<div class="mt-3 logged-in d-flex-inline">		                           
		   <div class="dropdown loggedin-user">
		   	<sec:authentication property="principal.firstName" />
		    <sec:authentication property="principal.lastName" />
			  <a class="ml-2 dropdown-toggle loggedin-menu"
			   id="dropdownMenu2" data-toggle="dropdown" 
			   aria-haspopup="true" aria-expanded="false">
			   <i class="fa fa-gear"></i>
			  </a>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
			    <a class="dropdown-item" href="myaccount"><spring:message code="label.header.account"/></a>
                <a class="dropdown-item" href="changePassword"><spring:message code="label.header.password.change"/></a>
                <a class="dropdown-item" href="logout"><spring:message code="label.header.signout"/></a>
			  </div>
			</div>
	     </div>
	   </sec:authorize>
	</c:otherwise>
</c:choose>
                
</div>
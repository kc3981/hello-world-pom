<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<h1>Welcome   <sec:authorize access="isAuthenticated()">
<div class="mt-3 logged-in d-flex-wrap">		                           
   <sec:authentication property="principal.firstName" />
   <sec:authentication property="principal.lastName" />
    </div>
  </sec:authorize>
 </h1>
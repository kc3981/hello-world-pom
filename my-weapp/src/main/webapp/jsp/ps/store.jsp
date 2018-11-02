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

<%@ include file="store-styles.jsp" %>
<!-- Can add any specific styles to this page only here. -->
</head>
<body class="">
<%@ include file="sidebar.jsp" %>
<!-- header container -->
<%@ include file="store-header.jsp"%>
<!-- Begin page content -->

	<c:choose>
		<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
			<%@ include file="guestdashboard.jsp"%>
		</c:when>
		<c:otherwise>
		   <sec:authorize access="isAuthenticated()">
		   	<%@ include file="dashboard.jsp"%>
			</sec:authorize>
		</c:otherwise>
		</c:choose>

<!-- footer container -->
<%@ include file="store-footer.jsp"%>
<!-- Can add any script references for this specific page here.	 Never replicate a reference here that is already in store-footer.jsp-->
<script src="../js/ps/store.js?version=${properties['application.version']}" type="text/javascript" ></script>

</body>
</html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:choose>
	<c:when test="${properties['enable.googletagmgr.analytics'] eq true}">
		<!-- Google Tag Manager (noscript) -->
		<c:out value="${properties['googletagmgr.body.js']}" escapeXml="false" />
		<!-- End Google Tag Manager (noscript) -->
	</c:when>
</c:choose>

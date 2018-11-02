<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:choose>
	<c:when test="${properties['enable.googletagmgr.analytics'] eq true}">
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<c:out value="${properties['googletagmgr.header.js']}"
			escapeXml="false" />
		<!-- Google Tag Manager -->
		<c:out value="${properties['googletagmgr.header2.js']}"
			escapeXml="false" />
		<!-- End Google Tag Manager -->
	</c:when>
</c:choose>

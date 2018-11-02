
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
  <c:when test="${properties['show.login.language'] == 'true' && fn:length(sessionScope['scopedTarget.genericUserProperties'].allLanguages) gt 1}">
    <div class="">
      <button class="btn p-2 dropdown-toggle language" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        <i class="fa fa-globe mr-1"></i> ${sessionScope['scopedTarget.genericUserProperties'].languageCode} <span class="caret"></span>
      </button>
      <input type="hidden" id="selectedLanguage" value="${sessionScope['scopedTarget.genericUserProperties'].languageId}" />
      <ul class="dropdown-menu p-3" aria-labelledby="dropdownMenu1">
        <c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].languageDetails}">
          <li class=""><a id="${item.languageId}" class="nav_a languageClick" href="#">${item.languageDescription}</a> <input type="hidden"
            name="lang_${item.languageId}" id="lang_${item.languageId}" value="${item.languageCode}" /></li>
        </c:forEach>
      </ul>
    </div>
    <input type="hidden" name="lang" id="lang" value="true" />
  </c:when>
  <c:otherwise>
    <input type="hidden" name="lang" id="lang" value="false" />
  </c:otherwise>
</c:choose>
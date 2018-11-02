<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
</c:when>
<c:otherwise>
<sec:authorize access="hasRole('ROLE_CART')">
<!--Modal: Upload Excel-->
<!-- Central Modal Medium Info -->
<div class="modal fade" id="centralModalInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
        <!--Header-->
        <div class="modal-header">
            <p class="heading lead"><spring:message code="label.footer.bulk.upload" /></p>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" class="white-text">&times;</span>
            </button>
        </div>

        <!--Body-->
        <div class="modal-body">
            <div class="">
                <i class="fa fa-excel-file-o fa-4x mb-3 animated rotateIn"></i>
                <p><spring:message code="label.ui.orderhere.bulkupload.description" /></p>
            </div>
            <a href="downloadtemplete" class="excel-upload m-1 m-sm-3 font-weight-bold success-text">
            <i class="fa fa-download"></i> <spring:message code="label.bulkpartupload.download.template" /></a>
        </div>
		<h1>Coming Soon</h1>
        <!--Footer-->
        <div class="modal-footer justify-content-right">
            <a type="" class=""><spring:message code="label.bulkpartupload.cancel" /></a>
            <a type="button" class="btn btn-rounded waves-effect" data-dismiss="modal"><spring:message code="label.bulkpartupload.upload" /></a>
        </div>
    </div>
    <!--/.Content-->
</div>
</div>
<!-- Central Modal Medium Info-->
			
	<div class="ml-5">
	<a onclick="" tabindex="0" class="excel-upload m-1 m-sm-3 font-weight-bold" data-toggle="modal" data-target="#centralModalInfo">
	<i class="fa fa-file-excel-o"></i>		
	<spring:message code="label.footer.bulk.upload" /></a>
	</div>
</sec:authorize>
</c:otherwise>
</c:choose>


<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<jsp:include page="../googleAnalytics.jsp" />

<!-- CSS -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>


<%-- <%@ include file="../../jsp/header.jsp"%> --%>
<title>${properties['global.page.title']}</title>
<style type="text/css">
#ui-id-1 {
	position: absolute;
	z-index: 999 !important
}

#ui-id-2 {
	position: fixed;
}

ul#ui-id-1 {
	z-index: 9999999 !important;
	position: fixed;
}
</style>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">

		<form:form method="post" action="quickorderdata">
			<!-- header container having logo and navigation -->
			<header> <!-- header includes --> <%@ include
				file="../../jsp/header.jsp"%> </header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="label.home" /></a></li>
					<c:choose>
						<c:when test="${true==param.orderhere}">
							<li><a href="orderhere"><spring:message
										code="label.order.options" /></a></li>
						</c:when>
					</c:choose>
					<li class="active"><spring:message
							code="lable.quickorder.title" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings spaceTop20">
					<h3>
						<spring:message code="lable.quickorder.title" />
					</h3>
					<div class="select-organization">
						<label for="org-select" class="control-label required"><spring:message
								code="label.brand.choose" /> </label><br> <select class="form-control"
							id="org-select">
							<c:if test="${fn:length(organizationsForUser) gt 1}">
								<option value="0" selected="selected"><spring:message
										code="label.brand.choose" /></option>
							</c:if>
							<c:forEach var="item" items="${organizationsForUser}">
								<option value="${item.organizationId}">${item.organizationName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="search-part pull-left">
						<label for="keyword1" class="control-label required"><spring:message
								code="lable.selectpart" /></label><br /> <a
							class="clear-search hidden" href="#"><i style="right: 15px;"
							class="fa fa-times"></i></a> <input name="keyword" id="keyword1"
							type="text" class="form-control keyword" aria-label="Search"
							placeholder='<spring:message code="label.cart.search.for.parts"/>'>
					</div>
					<div class="add-parts pull-left">
						<label for="part-qty" class="control-label required"><spring:message
								code="label.export.quantity" /></label><br />

						<div class="spinner-control" style="margin-top: 0"
							data-ordermultiplekey="">
							<input type="text" class="total-items output" id="part-qty"
								maxlength="6" style="width: 50px; text-align: center;" value="1">
							<div class="qty">
								<a href="javascript:void(0);" class="item-increment plus-click">
									<i class="fa fa-caret-up"></i>
								</a> <a href="javascript:void(0);"
									class="item-decrement minus-click"> <i
									class="fa fa-caret-down"></i>
								</a>
							</div>
						</div>

						<input type="hidden" class="hiddenUOM" id="lblPartUOM"
							value="partUOM" />
						<p class="UOMClass"
							style="display: inline-block; margin-left: 20px; vertical-align: middle; margin-top: -15px;"></p>

						<input type="button" class="btn btn-addtocart cart-small"
							value="<spring:message code="lable.addtolist" />"
							id="add-to-table" />
						<!-- <input type="button" class="btn btn-buynow cart-small" value='<spring:message code="lable.clear"/>' id="clear-input-data" /> -->
						<!--<div class="add-parts"></div>-->
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ordPara" style="padding-left: 0">
						<p>
							<spring:message code="label.all.ordermultiples" javaScriptEscape="true" />
							<span id="lblPartMultiple"></span>
						</p>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings part-table-section">
						<div class="clearfix">
							<h3 class="pull-left">
								<spring:message code="lable.partstable.title" />
							</h3>
							<div class="pull-right part-table-controls">
								<input type="button"
									class="btn btn-addtocart cart-small not-active" style="margin-bottom: 5px;"
									value='<spring:message code="lable.item.addToCart"/>'
									id="append-to-cart" /> <input type="button"
									class="btn btn-buynow cart-small not-active" style="margin-bottom: 5px;"
									value='<spring:message code="lable.items.clear"/>'
									id="clear-all" />
							</div>
						</div>

						<table id="parts-table">
							<thead>
								<tr>
									<th data-name="PartNumber"><spring:message
											code="lable.partnumber" /></th>
									<th data-name="Description"><spring:message
											code="label.export.commercialdescription" /></th>
									<th data-name="Quantity"><spring:message
											code="label.export.quantity" /></th>
									<th data-name="UOM"><spring:message
											code="label.export.uom" /></th>
									<th data-name="Action"><spring:message
											code="lable.part.action" /></th>
									<th data-name="PartId" style="display: none;"><spring:message
											code="lable.partid" /></th>
									<th data-name="OrganizationId" style="display: none;"><spring:message
											code="lable.prgid" /></th>	
									<th data-name="mediaId" style="display: none;"></th>
								</tr>
							</thead>
							<tbody id='table-body'>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- footer container -->
			<footer> <!-- Header includes --> <%@ include
				file="../../jsp/footer.jsp"%> </footer>

			<div class="modal bs-example-modal-md" id="alertModal" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close"
								data-dismiss="modal" aria-hidden="true">
								<i class="fa fa-times"></i>
							</button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.alert" />
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<p></p>
						</div>
					</div>
				</div>
			</div>

			<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content">
								<spring:message code="lable.changeorganization" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
								class="col btn delete-ok charge-ok" href="javascript:;"><spring:message
									code="label.myaccount.ok" /></a> <input type="hidden"
								id="confirmBoxType" />
						</div>
					</div>
				</div>
			</div>

			<div class="pageLoader" style="display: none">
				<div class="loader-content">
					<h4>
						<spring:message code="label.footer.loading" />
						...
					</h4>
					<div class="loader"></div>
				</div>
			</div>
		</form:form>
	</div>
	<!-- Javascript Plugins -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/quickOrder.js?version=${properties['application.version']}" defer></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script type="text/javascript">
	//Added by Nandakishore to enable the Order Option Tab when clicked from Order Option
	var test="${param.orderhere}";
	if(test == "true"){
		$("#main-menu-list > li:nth-child(2)").addClass("active");
	}
	</script>

</body>
</html>
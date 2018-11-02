<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>


<jsp:include page="../googleAnalytics.jsp" />

<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>

<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.responsive.css?version=${properties['application.version']}">
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
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Favicon and touch icons -->
<!--  <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->
<style>
.table {
	border: none !important;
	border-top: 0 !important;
}

.tableHead, .table th {
	border-top: 0 !important;
	text-transform: capitalize !important;
}

thead {
	color: #fff;
}

table {
	margin-bottom: 30px;
	border: 1px solid #ccc;
}
/* #lineItem>tbody>tr>td:first-child{
            cursor: pointer;
        } */
table tbody td:last-child a, table tbody td:last-child a:hover {
	margin: 5px 0;
	cursor: pointer;
}

table:first {
	background: #000;
}

td a span.glyphicon {
	vertical-align: middle;
	margin-right: 5px;
	font-size: 11px;
	top: -1px;
	transition: transform 1s cubic-bezier(0.7, 0, 0.3, 1);
}

a.drawing {
	background: url(../images/drawing-tools.png) no-repeat;
}

a.application {
	background: url(../images/application1.jpg) no-repeat;
}

a.cartImg {
	background: url(../images/cart1.png) no-repeat;
	margin: 0px !important;
	display: inline-block;
}

a.drawing, a.application, a.cartImg {
	display: inline-block;
	width: 20px;
	height: 20px;
}

a.drawBtn {
	float: right;
	padding: 5px 5px 3px;
	font-size: 14px;
	background: #eee;
	/* color: #C80000; */
	border: 1px solid #ccc;
	display: none;
	cursor: pointer
}

#application-data {
	height: 400px;
	overflow-y: scroll;
}

a.applnData {
	display: none;
	margin-left: 20px !important;
	vertical-align: top;
	margin-top: 1px !important;
}

button.close {
	float: right;
	font-size: 30px;
	font-weight: 700;
	line-height: 1;
	text-shadow: 0 1px 0 #fff;
	filter: alpha(opacity = 20);
	opacity: 1;
	top: 10px;
}

button.close:hover {
	color: #fff;
}

.modal-dialog {
	width: 70%;
	position: absolute;
	right: 0;
	top: 35%;
	bottom: 0;
	left: 0;
	margin: -97px auto 0;
}

.modal-open {
	padding-right: 0 !important;
}


.dataapplication-details .modal-title {
	color: #fff;
}

.dataapplication-details .modal thead, .dataapplication-details .modal tbody
	{
	color: #333;
	border: 1px solid #ccc;
}

.dynamic {
	/*   border: 1px solid #ccc; */
	background: #fff;
}

.dynamic table {
	margin: 25px auto;
}

.dynamic td[colspan="6"] {
	background: #f2f2f2;
}

.dynamic thead {
	background: #888;
}

.dynamic-wrap {
	width: 94%;
	margin: 10px auto;
}

.dynamic tbody tr {
	background: #fff;
}

.dynamic thead th {
	font-size: 13px;
}

.dynamic tbody td {
	font-size: 12px;
	cursor: auto;
}

.lineItmHeight {
	margin-top: 4px;
	overflow-y: auto
}

.historicalOrder .inline {
	display: block;
}

.historicalOrder .section {
	display: inline-block;
	width: 100%;
	margin-bottom: 0px;
	margin-top: 5px;
}

.modal-backdrop.in {
	opacity: 0.5
}

.drawingTable th {
	color: #fff;
	font-size: 12px
}

.drawingTable tbody tr td span {
	display: inline-block;
}

.drawingTable tbody tr td a {
	font-size: 14px;
	background: #eee;
	color: #000;
	font-weight: normal;
	padding: 3px 5px;
	border: 1px solid #ccc;
}

.drawingTable tbody tr td a:hover {
	margin: 0px !important
}

#drawingModal p, #drawingModal h6 {
	color: #808080;
}

.pointerClass {
	cursor: pointer
}

#lineItem tbody tr td span.glyphicon {
	transform: rotate(0deg);
}

.arrowRotate {
	transform: rotate(180deg) !important;
}

#drawingModal {
	background: rgba(0, 0, 0, 0.5);
}
</style>
<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="https://code.google.com/p/jquery-numberformatter/downloads/detail?name=jquery.numberformatter-1.2.4.js"
	type="text/javascript"></script>
<sec:authorize access="hasRole('ROLE_DEALER_USER')" var="isDealerUser"></sec:authorize>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper dataapplication-details">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<!-- header includes -->
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<c:if test="${true == chooseBrand}">
						<li><a href="historicalorderbrand"><spring:message
									code="label.brand.choose" /> -
								${getOrderDetailsres.organizationName}</a></li>
					</c:if>
					<li><a
						href="gethistoricalorders_breadCrum?customerReference=${getOrderDetailsres.customerReference}&selectedOrganization=${getOrderDetailsres.organizationId}&selectedOrgName=${getOrderDetailsres.organizationName}&fromDate=${getOrderDetailsres.fDate}&toDate=${getOrderDetailsres.tDate}&cusName=${getOrderDetailsres.customerName}&chooseBrand=${chooseBrand}"><spring:message
								code="label.header.order" /></a></li>
					<li class="active"><spring:message code="view.label.order.no" />${getOrderDetailsres.orderNumber}</li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<!--- This is for Breadcrumbs -->

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding historicalOrder m-t-sm-17">

					<h3>
						<spring:message code="view.label.order.no" />${getOrderDetailsres.orderNumber}
						<a class="drawBtn" title="Drawing" onclick="DrawingFeature()">Drawing&nbsp;<img
							src="../images/drawing-tools.png" alt=""></a>
					</h3>

					<div class="form-inline section childCheck">

						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.order.by" />
								:
							</h5>
							<c:choose>
								<c:when test="${not empty getOrderDetailsres.orderedBy}">
									<p class="inline">${getOrderDetailsres.orderedBy.firstName}
										${getOrderDetailsres.orderedBy.lastName}</p>
								</c:when>
								<c:otherwise>
									<p class="inline">${getOrderDetailsres.contactName}</p>
								</c:otherwise>
							</c:choose>

						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.order.date" />
								:
							</h5>
							<p class="inline">
								<fmt:formatDate pattern="${dateformat}"
									value="${getOrderDetailsres.orderDate}" />
							</p>
							<%-- <p class="inline">${getOrderDetailsres.orderDate}</p> --%>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.order.status" />
								:
							</h5>
							<p class="inline">${getOrderDetailsres.orderStatus}</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding childCheck">
							<c:choose>
								<c:when test="${isDealerUser == false}">
									<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
										<h5 class="inline">
											<spring:message code="view.label.customer" />
											:
										</h5>
										<p class="inline">
											${getOrderDetailsres.customerReference} -
											${getOrderDetailsres.customerName}
										</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
										<h5 class="inline">
											<spring:message code="label.dealer.name" />
											:
										</h5>
										<p class="inline">
											${getOrderDetailsres.customerReference} -
											${getOrderDetailsres.customerName}
										</p>
									</div>
								</c:otherwise>
							 </c:choose>
							

							<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.po.number" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.customerPO}">${getOrderDetailsres.customerPO}</c:if>
									<c:if test="${empty getOrderDetailsres.customerPO}">
									</c:if>
								</p>
							</div>

							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.your.reference" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.yourReference}">
				                		${getOrderDetailsres.yourReference}
								</c:if>
									<c:if test="${empty getOrderDetailsres.yourReference}">

									</c:if>
								</p>
							</div>
							
						    

						</div>
						 <!-- Start: Added by: Harish Bakale, GPD-710, Reviewed By: Pooja HS -->
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding childCheck">
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.export.order.header.shipmentTerm" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.carrierBillingOption}">
				                		${getOrderDetailsres.carrierBillingOption}
								</c:if>
									<c:if test="${empty getOrderDetailsres.carrierBillingOption}">
                                                -
									</c:if>
								</p>
							</div>
							<!--  End: Added by: Harish Bakale, GPD-710, Reviewed By: Pooja HS -->

							<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.sales.code" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.paymentType}">
				                  				${getOrderDetailsres.paymentType}
										</c:if>
									<c:if test="${empty getOrderDetailsres.paymentType}">
				                  				-
										</c:if>
								</p>
							</div>
						</div>
					</div>

					<div class="section">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding childCheck">

						<c:if test="${isDealerUser == false}">
							<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
								<div class="">
									<h5 class="inline">
										<spring:message code="view.label.bill.to" />
										:
									</h5>
									<p class="inline">${getOrderDetailsres.billToAddressReference}
										${getOrderDetailsres.billToAddressName}</p>
								</div>
								<div class="clearfix"></div>
								<div class="address-holder">
									<p>
										<c:if test="${not empty getOrderDetailsres.billToAddressName}">
			                  				${getOrderDetailsres.billToAddressName}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressLine1}">
			                  				${getOrderDetailsres.billToAddressLine1}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressLine2}">
			                  				${getOrderDetailsres.billToAddressLine2}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressLine3}">
			                  				${getOrderDetailsres.billToAddressLine3}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressLine4}">
			                  				${getOrderDetailsres.billToAddressLine4}<br />
										</c:if>
										<c:if test="${not empty getOrderDetailsres.billToAddressCity}">
			                  				${getOrderDetailsres.billToAddressCity}&nbsp; 
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressState}">
			                  				${getOrderDetailsres.billToAddressState}&nbsp; 
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressZipCode}">
			                  				${getOrderDetailsres.billToAddressZipCode}
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddressCountry}">
			                  				,&nbsp;${getOrderDetailsres.billToAddressCountry}<br />
										</c:if>
									</p>
								</div>
							</div>
							</c:if>
							<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
								<div class="">
									<h5 class="inline">
										<spring:message code="view.label.ship.to" />
										:
									</h5>
									<p class="inline">${getOrderDetailsres.shipToAddressReference}
										${getOrderDetailsres.shipToAddressName}</p>
								</div>
								<div class="clearfix"></div>
								<div class="address-holder">
									<p>
										<c:if test="${not empty getOrderDetailsres.shipToAddressName}">
			                  				${getOrderDetailsres.shipToAddressName}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddressLine1}">
			                  				${getOrderDetailsres.shipToAddressLine1}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddressLine2}">
			                  				${getOrderDetailsres.shipToAddressLine2}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddressLine3}">
			                  				${getOrderDetailsres.shipToAddressLine3}<br />
										</c:if>
										<!--<c:if
											test="${not empty getOrderDetailsres.shipToAddressLine4}">
			                  				${getOrderDetailsres.shipToAddressLine4}<br />
										</c:if> -->
										<c:if test="${not empty getOrderDetailsres.shipToAddressCity}">
			                  				${getOrderDetailsres.shipToAddressCity}&nbsp; 
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddressState}">
			                  				${getOrderDetailsres.shipToAddressState}&nbsp;
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddressZipCode}">
			                  				${getOrderDetailsres.shipToAddressZipCode}
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddressCountry}">
			                  				,&nbsp;${getOrderDetailsres.shipToAddressCountry}<br />
										</c:if>
									</p>
								</div>
							</div>
							<div class=" form-inline col-lg-4 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.email" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.primaryEmail}">
			                  				${getOrderDetailsres.primaryEmail}
									</c:if>
									<c:if test="${empty getOrderDetailsres.primaryEmail}">

									</c:if>
								</p>
							</div>
						</div>
					</div>

					<div class="section childCheck">

						<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12" id="carrierCodeDiv">
							<h5 class="inline">
								<spring:message code="view.label.shipping.method" />
								:
							</h5>
							<p class="inline">
								<c:if
									test="${not empty getOrderDetailsres.carrierCodeDescription}">
			                  				${getOrderDetailsres.carrierCodeDescription}
									</c:if>
								<c:if test="${empty getOrderDetailsres.carrierCodeDescription}">

								</c:if>
							</p>
						</div>
						<!-- Start : Added By : Harish Bakale, GSP-1155, Reviewed By: JK -->
						<%-- <div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.reference" />
								:
							</h5>
							<p class="inline">
								<c:if
									test="${not empty getOrderDetailsres.yourReference}">
			                  				${getOrderDetailsres.yourReference}
									</c:if>
								<c:if test="${empty getOrderDetailsres.yourReference}">

								</c:if>
							</p>
						</div> --%>
						<!-- End : Added By : Harish Bakale, GSP-1155, Reviewed By: JK -->
						<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.payment.terms" />
								:
							</h5>
							<p class="inline">
								<c:choose>
									<c:when test="${not empty getOrderDetailsres.carrierBillingOption}">
										${getOrderDetailsres.carrierBillingOption}
									</c:when>
									<c:when test="${not empty getOrderDetailsres.incoTerms1}">
										${getOrderDetailsres.incoTerms1} ${getOrderDetailsres.incoTerms2}
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</p>
						</div>
						<div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
								<h5 class="inline">
									<spring:message code="label.quote.order.sales.rep" />
									:
								</h5>
								<p class="inline" id="salesRepDetails"> 
								
									<c:if test="${not empty getOrderDetailsres.salesPerson}">
			                  				${getOrderDetailsres.salesPerson}
									</c:if>
									<c:if test="${empty getOrderDetailsres.salesPerson}">

									</c:if>
								</p>
							</sec:authorize>
						</div>

					</div>
					<c:if test="${getOrderDetailsres.cartStatusId ne 34}">
					<div class="section">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding childCheck">
							<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.shipping.instructions" />
									:
								</h5>
								<!-- Start : Added By : Harish Bakale, GSP-11594, Reviewed By: Lakshmi -->
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.deliveryInstruction}">
					                  				${getOrderDetailsres.deliveryInstruction}
											</c:if>
									<c:if test="${empty getOrderDetailsres.deliveryInstruction}">

									</c:if>
								</p>
								<!-- End : Added By : Harish Bakale, GSP-1194, Reviewed By: Lakshmi -->
							</div>
							<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">

								<h5 class="inline">
									<spring:message code="view.label.ship.complete" />
									:
								</h5>
								<p class="inline" id="partialShipment">
									<c:if
										test="${getOrderDetailsres.allowPartialShipment == false}">
										<spring:message code="view.label.yes" />
									</c:if>
									<c:if test="${getOrderDetailsres.allowPartialShipment == true}">
										<spring:message code="view.label.no" />
									</c:if>
								</p>
								<br />
								<h5 class="inline">
									<spring:message code="view.label.ship.today" />
									:
								</h5>
								<p class="inline" id="shipToday">
									<c:if test="${getOrderDetailsres.isSameDayShipping == true}">
										<spring:message code="view.label.yes" />
									</c:if>
									<c:if test="${getOrderDetailsres.isSameDayShipping == false}">
										<spring:message code="view.label.no" />
									</c:if>
								</p>
							</div>
							<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">

								<h5 class="inline">
									<spring:message code="view.label.unit.down" />
									:
								</h5>
								<p class="inline" id="unitDown">
									<c:if test="${getOrderDetailsres.isMachineDown == true}">
										<spring:message code="view.label.yes" />
									</c:if>
									<c:if test="${getOrderDetailsres.isMachineDown == false}">
										<spring:message code="view.label.no" />
									</c:if>
								</p>
							</div>
							<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12" id="transportModeDiv">
								<h5 class="inline">
									<spring:message code="label.quote.order.transport.code" />
									:
								</h5>
								<p class="inline">
									<c:if
										test="${not empty getOrderDetailsres.transportModeDescription}">
			                  				${getOrderDetailsres.transportModeDescription}
			                  		</c:if>
									<c:if
										test="${empty getOrderDetailsres.transportModeDescription}">

									</c:if>
								</p>
								<br>
							</div>

						</div>
					</div>
					</c:if>


					<%-- <p>The length of the companies collection is : ${fn:length(getOrderDetailsres.shipmentList)}</p> --%>


					<div class="section">

						<c:if test="${fn:length(getOrderDetailsres.shipmentList) gt 0}">
							<div class="table-border">
								<table class="table">
									<tr class="tableHead">
										<th width="20%"><span><spring:message
													code="view.label.shipment.no" /></span>
										</td>
										<th width="20%"><span><spring:message
													code="view.label.tracking.no" /></span>
										</td>
										<th width="15%" class="text-center"><span><spring:message
													code="view.label.ship.date" /></span>
										</td>
										<th width="15%" class="text-center"><span><spring:message
													code="view.label.warehouse" /></span>
										</td>
										<%--  <th width="15%"><span><spring:message code="view.label.status"/></span></td>
                           <sec:authorize access="hasRole('ROLE_VIEW_INVOICE')">
                           		<th width="15%"><span><spring:message code="view.label.invoice"/></span></td>
                           </sec:authorize> --%>
									</tr>
									<c:forEach var="shipmentVO"
										items="${getOrderDetailsres.shipmentList}" varStatus="loop">
										<c:if test="${loop.index % 2 == 0}">
											<tr class="odd tr">
										</c:if>
										<c:if test="${loop.index % 2 != 0}">
											<tr class="even tr">
										</c:if>
										<td><a
											href="javascript:getShipmentDetails('${shipmentVO.shipmentNumber}');">${shipmentVO.shipmentNumber}</a></td>

										<td>
											<!-- Changes for CR : Displaying tracking number as hyperlink. if tracking URL is null then text will be displayed
									Changes made by Kameshwari Popuri Reviewed by Jayakumar M--> <c:choose>
												<c:when test="${not empty shipmentVO.trackingURL}">
													<c:if test="${not empty shipmentVO.trackingNumber}">
														<a href="${shipmentVO.trackingURL}" target="_blank">${shipmentVO.trackingNumber}</a>
													</c:if>
												</c:when>
												<c:otherwise>
													<c:if test="${not empty shipmentVO.trackingNumber}">
												${shipmentVO.trackingNumber}
											</c:if>
												</c:otherwise>
											</c:choose>
										</td>

										<td class="text-center"><c:if
												test="${not empty shipmentVO.shipDate}">
												<fmt:formatDate pattern="${dateformat}"
													value="${shipmentVO.shipDate}" />
											</c:if> <c:if test="${empty shipmentVO.shipDate}">
										-
									</c:if></td>

										<td class="text-center"><c:if
												test="${not empty shipmentVO.warehouse}">
										${shipmentVO.warehouse}
									</c:if> <c:if test="${empty shipmentVO.warehouse}">
										-
									</c:if></td>

										<%-- <td>
		                            <c:if test="${not empty shipmentVO.statusName}">
										${shipmentVO.statusName}
									</c:if>
		                            <c:if test="${empty shipmentVO.statusName}">
										-
									</c:if>
								</td> --%>
										<sec:authorize access="hasRole('ROLE_VIEW_INVOICE')">
											<%-- <td>
									<c:if test="${not empty shipmentVO.invoiceReference}">
										<a href="getinvoice?invoiceId=${shipmentVO.invoiceId}">${shipmentVO.invoiceReference}</a>
									</c:if>
		                            <c:if test="${empty shipmentVO.invoiceReference}">
										-
									</c:if>
								</td> --%>
										</sec:authorize>
										</tr>
									</c:forEach>
								</table>
								<div class="clearfix"></div>
							</div>
						</c:if>
						<c:if test="${getOrderDetailsres.cartStatusId ne 34}">
						<div class="childCheck" id="machine-serial">
							<c:if test="${not empty getOrderDetailsres.serialNumber}">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<h5 class="inline">
										<spring:message code="view.label.serial.no" />
										:
									</h5>
									<p class="inline">${getOrderDetailsres.serialNumber}</p>
								</div>
							</c:if>


						</div>
						</c:if>
						<div class="clearfix"></div>
					</div>


					<!-- Print the Invoice Values -->
					<sec:authorize access="hasRole('ROLE_VIEW_INVOICE')">
					<c:if test="${fn:length(getOrderDetailsres.invoiceList) gt 0}">
					<div class="section">

						
							<div class="table-border">
								<table class="table">
									<tr class="tableHead">
										<%-- <th width="20%"><span><spring:message code="view.label.shipment.no"/></span></td>
                           <th width="20%"><span><spring:message code="view.label.tracking.no"/></span></td>
                           <th width="15%" class="text-center" ><span><spring:message code="view.label.ship.date"/></span></td>
                           <th width="15%" class="text-center"><span><spring:message code="view.label.warehouse"/></span></td>--%>
										<sec:authorize access="hasRole('ROLE_VIEW_INVOICE')">
											<th width="15%"><span><spring:message
														code="view.label.invoice" /></span>
											</td>
										</sec:authorize>
										<th width="15%" class="text-center"><span><spring:message
													code="invoice.label.invoice.date" /></span>
										</td>
										<th width="15%" class="text-center"><span><spring:message
													code="invoice.label.invoice.total" /></span>
										</td>
									</tr>
									<c:forEach var="shipmentVO"
										items="${getOrderDetailsres.invoiceList}" varStatus="loop">
										<c:if test="${loop.index % 2 == 0}">
											<tr class="odd tr">
										</c:if>
										<c:if test="${loop.index % 2 != 0}">
											<tr class="even tr">
										</c:if>
										
											<td><c:if test="${not empty shipmentVO.invoiceNumber}">
													<a
														href="javascript:getInvoiceDetails('${shipmentVO.invoiceNumber}','${shipmentVO.invoiceDate}');">${shipmentVO.invoiceNumber}</a>
												</c:if> <c:if test="${empty shipmentVO.invoiceNumber}">
										-
									</c:if></td>
										
										<td class="text-center"><c:if
												test="${not empty shipmentVO.invoiceDate}">
												<fmt:formatDate pattern="${dateformat}"
													value="${shipmentVO.invoiceDate}" />
											</c:if> <c:if test="${empty shipmentVO.invoiceDate}">
										-
									</c:if></td>

										<td class="text-center"><c:if
												test="${not empty shipmentVO.invoiceGrandTotal}">
										${shipmentVO.invoiceGrandTotal}
									</c:if> <c:if test="${empty shipmentVO.invoiceGrandTotal}">
										-
									</c:if></td>

										</tr>
									</c:forEach>
								</table>
								<div class="clearfix"></div>
							</div>
						
					</div>
					</c:if>
					</sec:authorize>
					<!-- <div class="">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <div id="cart-items-hldr" class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details">
                                	<%-- shoppingCartTemplate render here SAI --%>
                              </div>  
                        </div>
                    </div> -->
					<div class="clearfix"></div>
					<c:if test="${properties['comments.section.required']==true && getOrderDetailsres.cartStatusId ne 34}">
						<div class=" section">
							<div class="clearfix">
								<div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12">
									<h5 class="inline">
										<spring:message code="view.label.comments" />
										:
									</h5>
									<p class="inline">
										<c:if test="${not empty getOrderDetailsres.comments}">
			                  				${getOrderDetailsres.comments}
									</c:if>
										<c:if test="${empty getOrderDetailsres.comments}">
			                  				-
									</c:if>
									</p>
								</div>
								<c:if test="${properties['file.attachment.required']==true}">
									<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">

										<h5 class="inline">
											<spring:message code="view.label.attached.file" />
											:
										</h5>
										<a href="javascript:void(0);" class="inline" id="attachedFile"></a>

									</div>
								</c:if>
							</div>
						</div>
					</c:if>
					<div class="clearfix"></div>
					<c:if test="${getOrderDetailsres.cartStatusId eq 34}">
						<div class=" section">
							<div class="clearfix">
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<h5 class="inline">
										<spring:message code="reason.for.return" />
										:
									</h5>
									<p class="inline">
										<c:if test="${not empty getOrderDetailsres.returnReason}">
			                  				${getOrderDetailsres.returnReason}
									</c:if>
										<c:if test="${empty getOrderDetailsres.returnReason}">
			                  				-
									</c:if>
									</p>
								</div>
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<h5 class="inline">
										<spring:message code="return.reason.detail" />
										:
									</h5>
									<p class="inline">
										<c:if test="${not empty getOrderDetailsres.returnDetails}">
			                  				${getOrderDetailsres.returnDetails}
									</c:if>
										<c:if test="${empty getOrderDetailsres.returnDetails}">
			                  				-
									</c:if>
									</p>
								</div>
							</div>
						</div>
					</c:if>
					<%-- 
	             <h5 class="inline"><spring:message code="view.label.name"/> :</h5>
                                <p class="inline">
                                	<c:if test="${not empty getOrderDetailsres.contactName}">
			                  				${getOrderDetailsres.contactName}
									</c:if>
                                	<c:if test="${empty getOrderDetailsres.contactName}">
			                  				-
									</c:if>
                                </p> 
                            
	            
	            <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
                <div class="section" id = "SALES_REP_SECTION1">
                    <div class="clearfix">
	                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                        <h5 class="inline"><spring:message code="view.label.auto.apply.charges"/> :</h5>
		                        <p class="inline" id="autoApply">
		                        	<c:if test="${empty cartDetails.autoApplyCharges}"> - </c:if>	
				                     <c:if test="${cartDetails.autoApplyCharges == true}"><spring:message code="view.label.yes"/></c:if>
				                     <c:if test="${cartDetails.autoApplyCharges == false}"><spring:message code="view.label.no"/></c:if>
		                        </p>
	                    </div>
                    </div>
                </div>
                </sec:authorize> --%>



					<div class="lineItmHeight">
						<table id="lineItem" class="" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th><spring:message code="label.quote.order.items" /></th>
									<th><spring:message code="invoice.label.description" /></th>
									<th><spring:message code="lable.partqty" /></th>
									<th><spring:message code="label.export.uom" /></th>
									<th><spring:message code="label.item.price" /></th>
									<th><spring:message code="label.currency" /></th>
									<th id="estimatedShipDate"><spring:message code="label.estimated.ship.date" /></th>
									<th><spring:message code="lable.part.action" /></th>
								</tr>
							</thead>
							<tbody>

							</tbody>

						</table>
					</div>

					<div class="quote-total">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="totalItem">
								<spring:message code="view.label.item.total.amount" />
								(<span></span> Items)
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="totalPrice">
							</h5>
						</div>
						<!--    Commented By Rajesh , enable after testing  -->
						<c:if test="${isDealerUser == false}">
						
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="freightLabel">Freight</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="freight">
							</h5>
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="taxesLabel">Taxes</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="taxes">
							</h5>
						</div>
						
						</c:if>
						
						<!--  Start: Added by: Harish Bakale, GPD-2044, Reviewed By: Rajesh C -->
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="countDiscount">
								<spring:message code="label.transport.mode.discount.amount" />
								<!-- (<span></span>
								%
								) -->
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="discount">
							</h5>
						</div>
						 <!-- End: Added by: Harish Bakale, GPD-2044, Reviewed By: Rajesh C -->
						
						<c:choose>
							<c:when test="${getOrderDetailsres.cartStatusId ne 34}">
								<div
									class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
									<h5
										class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
										id="miscellaneousLabel">Miscellaneous</h5>
									<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 "
										id="miscellaneous"></h5>
								</div>
							</c:when>
							<c:otherwise>
								<div
									class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
									<h5
										class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
										id="miscellaneousLabel">
										<spring:message code="lable.surcharge" />
									</h5>
									<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 "
										id="miscellaneous"></h5>
								</div>
							</c:otherwise>
						</c:choose>


						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"></div>

						<div class="final-total  col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-6 font20">
								<spring:message code="view.label.order.total" />
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-5 font20 grandTotal">
							</h5>
						</div>



					</div>
					<div class="quote-total">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
							id="charge-details-hldr-header"></div>
						<%-- <div id="additionalCharges">
							  <c:if test="${cartDetails.taxAmount > 0}">
							 
							<h5 class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
									<spring:message code="label.quote.sales.tax.am" />
							 <h5 class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40" id="taxVal"></h5>
						  	<h5
									class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40"
									id="taxVal">
			                  			${cartDetails.taxAmountStr} ${cartDetails.currencyCode}
							 </h5>
							  </c:if>
					</div>
					
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" id="charge-details-hldr">
                    	
                    </div>
                     <div class="final-total col-lg-12 col-md-12 col-sm-12 col-xs-12" id="charge-details-hldr-footer">
                        
                    </div> --%>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a
								<%-- href="exportOrderAsPDF?orderNumber=${getOrderDetailsres.orderNumber}&orderCompany=${getOrderDetailsres.orderCompany}&orderType=${getOrderDetailsres.orderType}&orgCode=${getOrderDetailsres.orgCode}&orderStatus=${getOrderDetailsres.orderStatus}&fDate=${getOrderDetailsres.fDate}&tDate=${getOrderDetailsres.tDate}&cusNo=${getOrderDetailsres.cusNo}&chooseBrand=${chooseBrand}" --%>
								class="blue-button" id="download-order">Download Order</a> <a
								id="getUrl" class="pull-right blue-button"><spring:message
									code="view.button.my.orders" /></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<!--  <div class="row lineItem-show" style="display: none">
                   <div class="col-sm-12">
                   <table id="partItem" class="" cellspacing="0" width="100%">
                       <thead>
                           <tr>
                               <th>PART</th>
                               <th>PART DESCRIPTION</th>
                               <th>BALLOON NUMBER</th>
                               <th>QTY</th>
                               <th>UNIT PRICE</th>
                               <th>CURRENCY</th>
                               <th>ACTION</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td>BP22.500</td>
                               <td>BACK PLATE 22 R=500</td>
                               <td>001</td>
                               <td>1</td>
                               <td>312.00</td>
                               <td>USD</td>
                               <td><a class="btn btn-success">ADD TO CART</a></td>
                           </tr>
                           <tr>
                               <td>DPM5X20</td>
                               <td>DOWEL PIN</td>
                               <td>002</td>
                               <td>1</td>
                               <td>1.40</td>
                               <td>USD</td>
                               <td><a class="btn btn-success">ADD TO CART</a></td>
                           </tr>
                           <tr>
                               <td>DPSM6X8.5</td>
                               <td>DOWEL PIN SPRING</td>
                               <td>003</td>
                               <td>8</td>
                               <td>3.83</td>
                               <td>USD</td>
                               <td><a class="btn btn-success">ADD TO CART</a></td>
                           </tr>
                       </tbody>
                   </table>
                   </div>  
               </div> -->
				</div>
			</div>
			<div class="modal fade myModal" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.vieworder.application.header" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<div class="" id="application-data">
								<table id="example"
									class="table display table-striped dataTable no-footer"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th><spring:message
													code="label.vieworder.application.characteristics" /></th>
											<th><spring:message
													code="label.vieworder.application.values" /></th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>

					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<!-- modal dialog for drawing -->
			<div class="modal bs-example-modal-md" tabindex="-1" role="dialog"
				id="drawingModal" ondragstart="return false"
				onselectstart="return false" oncopy="return false;"
				onpaste="return false;" oncut="return false;">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.vieworder.drawing.header" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<p>
								<spring:message code="label.vieworder.drawing.title" />
							</p>
							<!-- <p> Please Note, the parts list is only available in the TIF format file<p> -->

							<table class="drawingTable table-hover">
								<thead>
									<tr>
										<th><spring:message
												code="label.vieworder.drawing.drawingvalue" /></th>
										<th><spring:message code="label.vieworder.drawing.action" /></th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>

						</div>

					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<div class="modal bs-example-modal-md" id="reOrderConfirmationWindow"  data-backdrop="static" data-keyboard="false">
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
							<p class="dialog-content"></p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
					class="col btn ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal bs-example-modal-md" id="reorderProcessConfirmationWindow" data-backdrop="static" data-keyboard="false">
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
								<spring:message code="label.bulkpartupload.replace.cart.message" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
					class="col btn ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>
			<!-- footer container -->
			<footer>
				<!-- Header includes -->
				<%@ include file="../../jsp/footer.jsp"%>
			</footer>
			<div class="pageLoader" style="display: none">
				<div class="loader-content">
					<h4>
						<spring:message code="label.footer.loading" />
						...
					</h4>
					<div class="loader"></div>
				</div>
			</div>
		</form>
		<form action="getShipmentDetails" method="POST" id="get-shipment" enctype="multipart/form-data"
			hidden>
			<input type="hide" name="shipmentNumber" id="ship-shipmentNumber" />
			<input type="hide" name="objectRef" id="ship-objectRef" /> <input
				type="hide" name="organizationId" id="ship-organizationId" /> <input
				type="hidden" name="shipmentOrderListBreadcrumbs"
				id="shipmentOrderListBreadcrumbs" />
		</form>
		<!-- Added by Aniket NREV-1029 -->
		<form action="getInvoiceDetails" method="POST"
			enctype="multipart/form-data" id="get-invoice" hidden>
			<input type="hide" name="invoiceNumber" id="inv-invoiceNumber" /> <input
				type="hide" name="objectRef" id="inv-objectRef" /> <input
				type="hide" name="organizationId" id="inv-organizationId" /> <input
				type="hide" name="orderDate" id="inv-orderDate" /> <input
				type="hidden" name="invoiceOrderListBreadcrumbs"
				id="invoiceOrderListBreadcrumbs" />
		</form>

	</div>
	<script id="shoppingCartTemplate" type="text/x-jquery-tmpl">
					<div id="cart-items-hldr" class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details">
	                             <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
									{{if mediaId!=0}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img"></a>                               		
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>	
							 		{{/if}}
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="view.label.item"/> ${'${'}partNumber}</a></h4>
									<div><strong id="headerName">${'${'}partCommercialDescription}</strong></div>
									<sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
        								<div>${'${'}partEngineeringDescription}</div>
									</sec:authorize>
                                    <div class="b-label">
    									<div>${'${'}organizationName} <spring:message code="view.label.part"/></div>
    									<div><strong>${'${'}inventoryMessage}</strong></div>
                                    </div>
				    <c:if test="${properties['item.comments.section.required']==true}">
									<div class="product-comments">
										<h5><spring:message code="view.label.comments"/>: </h5>
										{{if comments}}
												<p>${'${'}comments}</p>
										{{else}}
											<p>-</p>
										{{/if}}
									</div>
									</c:if>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
        							<div class="spinner-control">
                                    	  <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:40px;text-align:center" readonly="" disabled="">
                                          <span class="unit">${'${'}uom}</span> 
                                 	</div>
        						</div>
                                 <div class="col-lg-4 col-md-4 col-sm-3 col-xs-12 nopadding">
									{{if priceMSRPStr !== "-1"}}
                                    	<div><spring:message code="view.label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
									{{/if}} 
									
									{{if priceStr !== "-1"}}
										<div><spring:message code="view.label.your.price"/>: ${'${'}priceStr} ${'${'}currencyCode}</div>
									{{/if}}
									
									{{if savedPriceStr !== "-1"}} 
										<div class="blueColor"><spring:message code="view.label.you.save"/>: ${'${'}savedPriceStr} ${'${'}currencyCode} <spring:message code="view.label.each"/></div>
									{{/if}}  
									
									{{if itemTotalAmountStr !== "-1"}}
										<div><h5><spring:message code="view.label.item.total"/>: ${'${'}itemTotalAmountStr} ${'${'}currencyCode}</h5></div> 
									{{/if}}
                                </div>
       					</div>		
				    </div>			       
       </script>

	<script id="chargeListTemplateHeader" type="text/x-jquery-tmpl">
					
           <h5 class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"><spring:message code="view.label.item.total.amount"/> (<span>${fn:length(cartDetails.cartItemList)}</span> <spring:message code="view.label.items"/>)</h5>
           <h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4"> 

			{{if cartItemList.length>0}} 
				${'${'}subtotalAmountStr} ${'${'}cartItemList[0].currencyCode}
			{{else}}
				${'${'}subtotalAmountStr} ${'${'}currencyCode}
			{{/if}}

            </h5>
                    	                 
	 </script>
	<script id="chargeListBodyTemplate" type="text/x-jquery-tmpl">
			<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
			<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode}</p>			
	 </script>
	<script id="chargeListTemplateFooter" type="text/x-jquery-tmpl">
             <h5 class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-6 font20"><spring:message code="view.label.order.total"/></h5>
             <h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-5 font20"> 
				${'${'}totalAmountStr} ${'${'}cartItemList[0].currencyCode}

             </h5>
	 </script>
	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/jquery.dataTables.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/dataTables.bootstrap.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/dataTables.responsive.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		 type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script type="text/javascript">
   
	var transportModeApplicable = 0 ;
	function handleTransportMode(){
			transportModeApplicable = '${transportModeApplicable}' ;
    	if(transportModeApplicable == 2 || transportModeApplicable == 1){
    		   $('#transportModeDiv').show();
   		}else{
		  		$('#transportModeDiv').hide();
   		}
    }
    
    var userid, authtoken;
     $(document).ready(function(e){
    	 
    	 
			if ("${getOrderDetailsres.orderStatus}" == "Return Order initiated" || "${getOrderDetailsres.orderStatus}" == "Returned") {
				$("#estimatedShipDate").hide();
			}
			
    	 var orderListBreadcrumbLink = $('.breadcrumb').find('li:nth-child(2) a').attr('href');
 	    $('#shipmentOrderListBreadcrumbs').val(orderListBreadcrumbLink);
 	    $('#invoiceOrderListBreadcrumbs').val(orderListBreadcrumbLink);
    	 //hide the page until the elements are parsed
    	 $('.historicalOrder').hide();	
    	  hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
  	      hideOrShowSalestax('${hideOrShowFields}');
	  	  var hideOrShowTransportModeFields = ${hideOrShowFields};
	      if (hideOrShowTransportModeFields["is.shipment.terms.flag.visible"] != "TRUE")
	      { 
	      	 $("#carrierCodeDiv").parent().hide();			
	      }
 	    //if the value is empty in form View(dynamic placement of elements)
	  	 /*  $('p.inline').each(function() {
	  			if ($.trim( $(this).html()).length == 0) {
	  				
	  				$(this).parent('div').remove();
	  			
	  			}
	  			
	  			
	  		}); */
	  	   //if the value is empty in form View, remove parent(dynamic placement of elements)
		  	$('.childCheck').each(function(){
		  		if($(this).children().length == 0){
		  			$(this).remove();
		  			$(this).parent('div.section').remove();
		  			
		  		}
		  	});
		    //if the value is empty in form View, remove parent(dynamic placement of elements) 
			$('div.section').each(function(){
				if($(this).children().length == 0){
					$(this).remove();
				}
			}); 

		    //show the page after the elements are parsed
		  	 $('.historicalOrder').show('fast');
		  	 handleTransportMode();
		 var encodedCustomerName = encodeURIComponent("${getOrderDetailsres.customerName}").replace(/[!'()*]/g, escape);
	 	 document.getElementById("getUrl").href= "gethistoricalorders_breadCrum?customerReference=${getOrderDetailsres.customerReference}&selectedOrganization=${getOrderDetailsres.organizationId}&selectedOrgName=${getOrderDetailsres.organizationName}&fromDate=${getOrderDetailsres.fDate}&toDate=${getOrderDetailsres.tDate}&cusName="+encodedCustomerName+"&chooseBrand=${chooseBrand}";
		 	 
    	 userid=$('#userId').val();
         authtoken = $('#authToken').val();
         var myjson = ${cartDetailsJSON} ;
         console.log(myjson);
        
      
         console.log(Object.keys(myjson).length);
         var key = Object.keys(myjson).length;
         var trHTML = "";
  
         console.log(myjson.itemList );
         var iteration = myjson.itemList;
         var iterationShipmentList = myjson.shipmentList;
     	
        $('.final-total').find('h5.grandTotal').html(myjson.orderGrandTotalStr+ ' ' + myjson.currencyCode );
  
	    	
     
         for (var i = 0; i <  Object.keys(iteration).length; i++) {
       		var description =  "";
       		if(iteration[i].description1!=null && iteration[i].description1!=undefined){
       			description = iteration[i].description1;
       		}
        	 //GPD-829 : Estimated Ship Date in Order History 
        	 var estimatedShipDate = "";
        	 if(iteration[i].estimatedShipDate!=null && iteration[i].estimatedShipDate!=undefined){					
					console.log("getOrderDetailsresShipmentListLength : " + myjson.shipmentList.length);
					estimatedShipDate = iteration[i].estimatedShipDate;
					/* for (var j = 0; j <  Object.keys(iterationShipmentList).length; j++) {
						var shipmentItems = myjson.shipmentList[j].itemList;
						for (var k = 0; k <  Object.keys(shipmentItems).length; k++) {
							
							if(myjson.shipmentList[j].itemList[k].itemNumber == iteration[i].itemNumber){
								 estimatedShipDate = "";
							}
						}
						
						
					} */
        			/* if(myjson.shipmentList.length == 0){
        				
        					 estimatedShipDate = iteration[i].estimatedShipDate;
        				
        			} */
        		
        		}
        	
        	 var newClass;
        	 if (hideOrShowTransportModeFields["estimated.ship.date.flag.visible"] == "false")
     		{	
        		 newClass = 'hide';			
     		}else{
     			newClass = '';
     		}
        	 if(iteration[i].itemNoStatus == 1){
        		if("${getOrderDetailsres.orderStatus}" == "Return Order initiated" || "${getOrderDetailsres.orderStatus}" == "Returned"){
        			$("#estimatedShipDate").hide();
        			trHTML += '<tr><td><a target="_blank" href="hopgetfullitemdetailsView?partNumber='+encodeURIComponent(iteration[i].itemNumber)+'&itemCategory=itemCategory&organizationId='+myjson.organizationId+'">' + iteration[i].itemNumber + '</a></td><td>' + description+ '</td><td>' + iteration[i].itemQty+ '</td><td>' + iteration[i].itemUnitOfMeasure+ '</td><td>' + iteration[i].itemUnitPriceTotal+ '</td><td>' +iteration[i].currencyCode + '</td><td><div class="col-md-2 pad0"><a title="Add to cart" class="cartImg"><img src="../images/cart1.png" alt="" /></a> </div></td></tr>';
        		}else{
        			trHTML += '<tr><td><a target="_blank" href="hopgetfullitemdetailsView?partNumber='+encodeURIComponent(iteration[i].itemNumber)+'&itemCategory=itemCategory&organizationId='+myjson.organizationId+'">' + iteration[i].itemNumber + '</a></td><td>' + description+ '</td><td>' + iteration[i].itemQty+ '</td><td>' + iteration[i].itemUnitOfMeasure+ '</td><td>' + iteration[i].itemUnitPriceTotal+ '</td><td>' +iteration[i].currencyCode + '</td><td class="'+newClass+'">' + estimatedShipDate + '</td><td><div class="col-md-2 pad0"><a title="Add to cart" class="cartImg"><img src="../images/cart1.png" alt="" /></a> </div></td></tr>';
        		}
        	 	
        	 }
        	 else if(iteration[i].itemNoStatus == 0){
        		 if("${getOrderDetailsres.orderStatus}" == "Return Order initiated" || "${getOrderDetailsres.orderStatus}" == "Returned"){
        			 $("#estimatedShipDate").hide();
        			 trHTML += '<tr><td>' + iteration[i].itemNumber + '</a></td><td>' + description+ '</td><td>' + iteration[i].itemQty+ '</td><td>' + iteration[i].itemUnitOfMeasure+ '</td><td>' + iteration[i].itemUnitPriceTotal+ '</td><td>' +iteration[i].currencyCode + '</td><td> <div class="col-md-2 pad0">&nbsp;</div></td></tr>'; 
        		 }else{
        			 trHTML += '<tr><td>' + iteration[i].itemNumber + '</a></td><td>' + description+ '</td><td>' + iteration[i].itemQty+ '</td><td>' + iteration[i].itemUnitOfMeasure+ '</td><td>' + iteration[i].itemUnitPriceTotal+ '</td><td>' +iteration[i].currencyCode + '</td><td class="'+newClass+'">' + estimatedShipDate + '</td><td> <div class="col-md-2 pad0">&nbsp;</div></td></tr>';
        		 }
        		  
        	 }
        	 
        	
         var modaltr= '';
         if(null != iteration[i].itemConfig){
	         for(var k = 0; k <  Object.keys(iteration[i].itemConfig).length; k++ ){
	         	modaltr += '<tr><td>'+iteration[i].itemConfig[k].nameDescription +'</td><td>'+iteration[i].itemConfig[k].valueDescription +'</td></tr>';
	         }
         }
         //drawing Icon 
          $('#example tbody').html('');
         $('#example tbody').append(modaltr);
        //drawing
          
         }        
       
        
       $("#lineItem tbody").append(trHTML);
        
       for (var i = 0; i <  Object.keys(iteration).length; i++) {
       		//Application data
    	   if(iteration[i].bApplicationData == true){
   		
   				$('a.applnData').css('display','inline-block');
   				}
       }
     	//Added for fetching orders from DB
	    document.getElementById("download-order").href = "exportOrderAsPDFListFromDB?childCartId="+myjson.childCartId;
     
       //ItemTota
       var rowTotal=$('#lineItem tbody tr').length;
	   $('#totalItem span').html(rowTotal);
	  
	   $('#freight').html(myjson.orderFreightTotalStr+ ' ' + myjson.currencyCode);
	  $('#taxes').html(myjson.orderTaxRateStr+ ' ' + myjson.currencyCode);
	  $('#miscellaneous').html(myjson.miscellaniousStr+ ' ' + myjson.currencyCode);
	  $('#discount').html(myjson.totalDiscountStr+ ' ' + myjson.currencyCode);
	 /*  $('#countDiscount').text(myjson.discountFromCoupon); */
	    
        $('#totalPrice').html(myjson.itemTotal+' '+myjson.currencyCode);
      
        
        //data tables
        $("#lineItem tbody tr td:first-child>a").on("click", function(){
           $(".dynamic").remove();
           var glyphi= $(this).children("span.glyphicon");
           glyphi.toggleClass('arrowRotate');
           if($(glyphi).hasClass("arrowRotate")){
        	   $(this).closest("tr").after(table);
           }else{
        	   $(".dynamic").remove();
           }
          
        });
        $('#application-data').DataTable( {
            "paging":   false,
            "ordering": false,
            "info":     false
        });
       	//To set the data for cartItemList and cart-items-hldr
	    $("#cart-items-hldr").html('');
	    if(myjson && myjson.cartItemList)
	    $("#shoppingCartTemplate").tmpl(myjson.cartItemList).appendTo("#cart-items-hldr");
	    
	    //alert("json.cartItemList :"+json.cartItemList.length);
	    


		 //To set the data for chargeListBodyTemplate and charge-details-hldr
 	    $("#charge-details-hldr").html('');
 	   if(myjson && myjson.chargeList) 
	    $("#chargeListBodyTemplate").tmpl(myjson.chargeList).appendTo("#charge-details-hldr");
	    //alert("json.chargeList :"+json.chargeList.length);
	    
	    
 	  	
	    
	    //Setting ChargeList Header
	    $("#charge-details-hldr-header").html('');
	    if(myjson)
	    $("#chargeListTemplateHeader").tmpl(myjson).appendTo("#charge-details-hldr-header");
	    
	     
	    //Setting ChargeList Footer
	    $("#charge-details-hldr-footer").html('');
	    if(myjson)
	    $("#chargeListTemplateFooter").tmpl(myjson).appendTo("#charge-details-hldr-footer");
	    
	   /*Commented to not to show attachment */
	   $('#attachedFile').text(typeof myjson.attachedFileName=="undefined"?'-':myjson.attachedFileName);
	    
	    $('#attachedFile').on('click', function(){
	    	var fileName = $('#attachedFile').text();
	    	window.location.href = 'exportattachedfileforquoteorder?childCartId='+myjson.childCartId+'&fileName='+fileName;
	    })
	   
	    
    });
     
  // full item details page redirect onclick line items
 	function fullItemRedirectUsingCartId(itemId, orgId, cartItemId){
		  var itemCategory=$("#headerName").text();
    	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
    	  window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId);
      }
  
	  function getShipmentDetails(shipmentNumber){
		  
		  var myjson = ${cartDetailsJSON} ;
	      console.log(myjson);
		  console.log(shipmentNumber);
		  var organizationId = myjson.organizationId;
		  $("#ship-shipmentNumber").val(shipmentNumber);
		  $("#ship-objectRef").val(JSON.stringify(myjson));
		  $("#ship-organizationId").val(organizationId);
		  $("form#get-shipment").submit();
/* 		  $.ajax({
				type : "POST",
				data : {
					"shipmentNumber": shipmentNumber,
					"objectRef":JSON.stringify(myjson),
					"organizationId": organizationId
				},
				url : "getShipmentDetails",
				success : function(response) {
					console.log(response);
					
					
				},
		  }); */
		  
	  };
	  
	  
	  
function getInvoiceDetails(invoiceNumber,orderDate){
		  
		  var myjson = ${cartDetailsJSON} ;
		  
	      console.log(myjson);
		  console.log(invoiceNumber);
		 
		 
		  var organizationId = myjson.organizationId;
		  $("#inv-invoiceNumber").val(invoiceNumber);
		  $("#inv-objectRef").val(JSON.stringify(myjson));
		  $("#inv-organizationId").val(organizationId);
		  $("#inv-orderDate").val(orderDate);
		  $("form#get-invoice").submit();
		  /* $.ajax({
				type : "POST",
				data : {
					"invoiceNumber": invoiceNumber,
					"objectRef":JSON.stringify(myjson),
					"organizationId": organizationId
				},
				url : "getInvoiceDetails",
				success : function(response) {
					console.log(response);
					
					
				},
		  }); */
		  
	  };
 	 $(document).delegate(
				'.cartImg',
				'click',
				function(e) {
				console.log('clicked');
					 $('div.pageLoader').show();
					 $("body").css("overflow", "hidden");
					e.preventDefault();
					
					   var myjson = ${cartDetailsJSON} ;
					
					//var img =$(this).parents(".search-parts-template").children("div:first-child").html();
					var partNumber =$(this).parents('td').siblings('td:first').find('a').html();
					console.log(partNumber+'partNumber');		
					var organizationName = myjson.organizationName;

					var itmQty = $(this).parents('td').siblings('td:nth-child(3)').html();

					var organizationId = myjson.organizationId;
					
					
					var dataItemVal = null;
					

					console.log('1>>>>> '+partNumber+", "+organizationName+", "+itmQty+", "+organizationId);

					//dataItemVal=$(this).parent().data('allval');
					
					console.log(dataItemVal);
					$.ajax({
						type : "POST",
						data : {
							"partNumber": partNumber,
							"organizationName":JSON.stringify(organizationName),
							"itmQty": (itmQty)?itmQty:null,
							"organizationId": organizationId,
							"dataItemVal": JSON.stringify(dataItemVal)
						},
						url : "hopaddtocart",
						success : function(response) {
							console.log(response)
	                    	getShoppingCartCount();
							if (response == '') {
								 //alert("Part is not added...");
								$('div.pageLoader').hide();
								$("body").css("overflow", "auto");
								$(".cart-popover").css({"opacity": 1});
								$(".cart-popover").show().stop().fadeOut(5000);
								/*$(".close-popup").delegate("click",function(){
									$(this).parents(".cart-popover").fadeout("fast");
								})*/
								 $(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
									$(this).css("text-decoration","none");
								}); 
								$(".cart-popover").find(".cart-popover-title").text("<spring:message code='quick.search.item' javaScriptEscape='true'/> " + partNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
							} else {
								var jsonResponse = JSON.parse(response);
								console.log(jsonResponse);
								if(typeof jsonResponse.errorMessage=="undefined"){
									$('div.pageLoader').hide();
									$("body").css("overflow", "auto");
									$(".cart-popover").css({"opacity": 1});
									$(".cart-popover").show().stop().fadeOut(5000);
									/*$(".close-popup").delegate("click",function(){
										$(this).parents(".cart-popover").fadeout("fast");
									})*/
									$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+jsonResponse.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
									$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ partNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
								}
								else{
									$('div.pageLoader').hide();
									$("body").css("overflow", "auto");
		    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
		    		    			$("#myModal").show();	
								}
								/* alert("Part is added to your cart..."); */
							}
							 
						},
						error : function(e) {
							console.log('error');
							 $('div.pageLoader').hide();
						}
					});
					/*$(".close-popup").on("click",function(){
									$(this).parents(".cart-popover").hide();
								});*/
				});
	  
	  
 	  function reorderClick(){
 		 	var myjson = ${cartDetailsJSON} ;
 		 	var orderNumber = myjson.orderNumber;
 		 	var orderCompany = myjson.orderCompany;
 		 	var orderType = myjson.orderType;
 		 	var organizationId = myjson.organizationId;
 		 	var organizationName = myjson.organizationName;
	    	var paslsGetData= {"orderNumber":orderNumber,"orderCompany": orderCompany,"orderType": orderType,"orgCode":organizationId,"orgName":organizationName};
	    	$("#reorderProcessConfirmationWindow").show();
          $("#reorderProcessConfirmationWindow").draggable({
              handle: ".modal-header"

         });
	    	console.log("paslsGetData>>> ");
	    	console.log(paslsGetData);
	    	$("#reorderProcessConfirmationWindow .ok").click(function(){
	    		   $('div.pageLoader').show();
	    		  $("#reorderProcessConfirmationWindow").hide();
	    	$.ajax({  
	            type : "Get",
	            //data : passGetData,
	            contentType: 'application/json',
	            //url : "findItemCount",
	            url : "getOrdersItemList?orderNumber="+orderNumber+"&orderCompany="+orderCompany+"&orderType="+orderType+"&orgCode="+organizationId+"&orgName="+organizationName,
	            success : function(response) {
	            	   //$('div.pageLoader').hide();
	            	   
	            	if(response){
	            		var responseData = (JSON.parse(response));
	            		console.log('chkdata'+responseData.data.itemList );
	            		if(responseData.data.itemList.length == responseData.data.itemCnt){
	            			
	            			
	            			callReordering(responseData.data.orderNumber,responseData.data);
	            			
	            			
	            		}
	            		else if(responseData.data.itemList.length != responseData.data.itemCnt){
	            			$('div.pageLoader').hide();
	            			$("#reOrderConfirmationWindow").data("reorderNo",responseData.data.orderNumber);
	            			$("#reOrderConfirmationWindow").data("object",responseData.data);
	            			var msgText= "You have "+ responseData.data.itemCnt +" Items available against "+ responseData.data.itemList.length +" Items selected in the Order, Do you want to still proceed?";
	            			$("#reOrderConfirmationWindow .dialog-content").html(msgText);
	            			$("#reOrderConfirmationWindow").show();
	            		}
	            	}
	            }
	    	});
	    	$('.modal-footer a:first-child').focus();
	    	});
	    };
          
          $(".cancel").click(function(){
	    		$("#confirmationWindow, #reOrderConfirmationWindow, #reorderProcessConfirmationWindow").hide();
	    		return false;
			});

          $("#reOrderConfirmationWindow .ok").click(function(){
     	  		$("#reOrderConfirmationWindow").hide();
     	  		callReordering($("#reOrderConfirmationWindow").data("reorderNo"), $("#reOrderConfirmationWindow").data("object"));
     	  	
     	  	});
          
          var callReordering = function(orderNo,object){
         	  	var organizationId = object.organizationId;
         	  	var iteration = object.itemList;
         	 	var organizationName = object.organizationName;
         	 	var dataItemVal = null;
         	 	 
         	 	 //$('div.pageLoader').show();
      			$.ajax({  
      				type : "POST",
      		         //data : {orderNumber:orderNo, partNumber:partNumber, organizationName:JSON.stringify(organizationName), itmQty:itmQty, organizationId:JSON.stringify(organizationId)},
      		         //contentType: 'application/json',
      		         //mimeType: 'application/json',
      		         data : {
      		        	 		"orderNumber":orderNo,
      							"organizationName":JSON.stringify(organizationName),
      							"organizationId": organizationId,
      							"dataItemVal": JSON.stringify(dataItemVal),
      							"objectRef":JSON.stringify(iteration)
      						},
      		         url : "hopreorder",
      		         success : function(response) {
      		         	if(response){
      		         		window.location.href="getshoppingdetails?reOrder=true";
      		         	}
      		         	else{
      		         		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.fail' javaScriptEscape='true'/>")
      		 				$("#myModal").show();
      		                 $("#myModal").draggable({
      		                     handle: ".modal-header"
      		                 });
      		         	}
      		         	$('div.pageLoader').hide();
      		         },  
      		         error : function(e) {   
      		         	$('div.pageLoader').hide();
      		         }  
      		  	});
      		};
   function DrawingFeature(){
	   $('div.pageLoader').show();
	   var myjson = ${cartDetailsJSON} ;
	   
	   var organizationId = myjson.organizationId;
	   var orderNumber = myjson.orderNumber;
	   console.log(organizationId+'-----'+orderNumber);
	   
	   $.ajax({
		   type: "POST",
		   data: {
			   "orderNumber": orderNumber,
			   "organizationId": organizationId
		   },
		   url: "drawingdetails",
		   success : function(response){
			   $('div.pageLoader').hide();
			 
			   if(response){
           		var responseData = (JSON.parse(response));
           		console.log('check Iterate'+responseData); 
           		
           	
           		if(responseData.data.SapDrawingArrayResponseVOList.length <=0){
           			
           		 	$('#drawingModal .modal-body').html('<p>Drawing Links not available for Selected Order</p>');
           		 	$("#drawingModal").fadeIn();
           		}else{
           			var iteration = responseData.data.SapDrawingArrayResponseVOList[0].SapDrawingResponseVOList;
           		 	$('#drawingModal .modal-body').find('table tbody').html('');
	           		for(var i=0;i < Object.keys(iteration).length;i++){
				   	$('#drawingModal .modal-body').find('table tbody').append("<tr><td>"+ responseData.data.SapDrawingArrayResponseVOList[0].SapDrawingResponseVOList[i].fileName+"</td><td><a href="+responseData.data.SapDrawingArrayResponseVOList[0].SapDrawingResponseVOList[i].fullFileName+" download='Link'> Download</a></td></tr>");
				  
           		} 
           	 	$("#drawingModal").fadeIn();
           		}
			   }
		   },
		   error: function(e){
			   $("#drawingModal").fadeOut(); 
		   }
	   });
	   
	    
	  
	   $('.custom-close').click(function(){
		   $('#drawingModal').fadeOut();
	   });
	   
	   
   }
  
  //END OF SCRIPT */
    </script>
</body>
</html>
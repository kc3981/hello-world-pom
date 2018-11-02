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
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">

<link rel="stylesheet" type="text/css"
	href="../css/searchComponent.css?version=${properties['application.version']}">

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

<style>
.table {
	border: none !important;
	border-top: 0 !important;
}

.tableHead, .table th {
	background: #FFF !important;
	border-top: 0 !important;
	text-transform: capitalize !important;
}

.tr:hover {
	background: #f2f2f2 !important;
}

thead {
	background: #646464;
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
	color: #C80000;
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

.dataapplication-details .modal-header {
	background: #c80000;
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

.dataapplication-details a.btn-success, .dataapplication-details a.btn-success:hover
	{
	background: #c80000;
	border: 1px solid #c80000;
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

.emptyCart {
	color: black;
	pointer-events: none;
	cursor: default;
}
</style>
<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}"
	defer></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<!-- GPD-51: Venkatasiva, Added for dependent country and state drop down list-->
<script type="text/javascript" src="../js/countries.js"></script>
<script type="text/javascript"
	src="../js/jquery.select-to-autocomplete.js" defer></script>
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
								${getOrderDetailsres.organization.organizationName}</a></li>
					</c:if>
					<li><a
						href="gethistoricalorders_breadCrum?customerReference=${getOrderDetailsres.customer.customerReference}&selectedOrganization=${getOrderDetailsres.organization.organizationId}&selectedOrgName=${getOrderDetailsres.organization.organizationName}&fromDate=${fDate}&toDate=${tDate}&cusName=${getOrderDetailsres.customer.customerName}&chooseBrand=${chooseBrand}"><spring:message
								code="label.header.order" /></a></li>
					<li class="active"><spring:message code="lable.return.order" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<!--- This is for Breadcrumbs -->

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding historicalOrder m-t-sm-17">

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
							<p class="inline">${getOrderDetailsres.cartStatusValue}</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding childCheck">
							<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.customer" />
									:
								</h5>
								<p class="inline">${getOrderDetailsres.customer.customerReference}-
									${getOrderDetailsres.customer.customerName}</p>
							</div>


							<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.po.number" />
									:
								</h5>
								<p class="inline">
									<c:if
										test="${not empty getOrderDetailsres.customerPurchaseOrderNumber}">${getOrderDetailsres.customerPurchaseOrderNumber}</c:if>
									<c:if
										test="${empty getOrderDetailsres.customerPurchaseOrderNumber}">
									</c:if>
								</p>
							</div>

							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.export.order.header.OrderNumber" />
									:
								</h5>
								<p class="inline">${getOrderDetailsres.orderNumber}</p>
							</div>

							<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.sales.code" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty getOrderDetailsres.paymentMethod}">
				                  				${getOrderDetailsres.paymentMethod.description}
										</c:if>
									<c:if test="${empty getOrderDetailsres.paymentMethod}">
				                  				-
										</c:if>
								</p>
							</div>

						</div>
					</div>

					<div class="section">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding childCheck">


							<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
								<div class="">
									<h5 class="inline">
										<spring:message code="view.label.bill.to" />
										:
									</h5>
									<p class="inline">${getOrderDetailsres.billToAddress.addressReference}
										${getOrderDetailsres.billToAddress.addressName}</p>
								</div>
								<div class="clearfix"></div>
								<div class="address-holder">
									<p>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressName}">
			                  				${getOrderDetailsres.billToAddress.addressName}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressLine1}">
			                  				${getOrderDetailsres.billToAddress.addressLine1}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressLine2}">
			                  				${getOrderDetailsres.billToAddress.addressLine2}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressLine3}">
			                  				${getOrderDetailsres.billToAddressLine3}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressLine4}">
			                  				${getOrderDetailsres.billToAddress.addressLine4}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressCity}">
			                  				${getOrderDetailsres.billToAddress.addressCity}&nbsp; 
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressState}">
			                  				${getOrderDetailsres.billToAddress.addressState}&nbsp; 
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressZipCode}">
			                  				${getOrderDetailsres.billToAddress.addressZipCode}
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.billToAddress.addressCountry}">
			                  				,&nbsp;${getOrderDetailsres.billToAddress.addressCountry}<br />
										</c:if>
									</p>
								</div>
							</div>
							<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
								<div class="">
									<h5 class="inline">
										<spring:message code="view.label.ship.to" />
										:
									</h5>
									<p class="inline">${getOrderDetailsres.shipToAddress.addressReference}
										${getOrderDetailsres.shipToAddress.addressName}</p>
								</div>
								<div class="clearfix"></div>
								<div class="address-holder">
									<p>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressName}">
			                  				${getOrderDetailsres.shipToAddress.addressName}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressLine1}">
			                  				${getOrderDetailsres.shipToAddress.addressLine1}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressLine2}">
			                  				${getOrderDetailsres.shipToAddress.addressLine2}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressLine3}">
			                  				${getOrderDetailsres.shipToAddress.addressLine3}<br />
										</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressCity}">
			                  				${getOrderDetailsres.shipToAddress.addressCity}&nbsp; 
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressState}">
			                  				${getOrderDetailsres.shipToAddress.addressState}&nbsp;
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressZipCode}">
			                  				${getOrderDetailsres.shipToAddress.addressZipCode}
									</c:if>
										<c:if
											test="${not empty getOrderDetailsres.shipToAddress.addressCountry}">
			                  				,&nbsp;${getOrderDetailsres.shipToAddress.addressCountry}<br />
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
									<c:if
										test="${not empty getOrderDetailsres.contact.primaryEmail}">
			                  				${getOrderDetailsres.contact.primaryEmail}
									</c:if>
									<c:if test="${empty getOrderDetailsres.contact.primaryEmail}">

									</c:if>
								</p>
							</div>
						</div>
					</div>

					<div class="section childCheck">

						<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12"
							id="carrierCodeDiv">
							<h5 class="inline">
								<spring:message code="view.label.shipping.method" />
								:
							</h5>
							<p class="inline">
								<c:if
									test="${not empty getOrderDetailsres.carrier.carrierDescription}">
			                  				${getOrderDetailsres.carrier.carrierDescription}
									</c:if>
								<c:if
									test="${empty getOrderDetailsres.carrier.carrierDescription}">

								</c:if>
							</p>
						</div>

						<!-- End : Added By : Harish Bakale, GSP-1155, Reviewed By: JK -->
						<div class=" form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.payment.terms" />
								:
							</h5>
							<p class="inline">
								<c:if
									test="${not empty getOrderDetailsres.carrierBillingOption.description}">
			                  				${getOrderDetailsres.carrierBillingOption.description}
									</c:if>
								<c:if
									test="${empty getOrderDetailsres.carrierBillingOption.description}">
			                  				-
									</c:if>
							</p>
						</div>
						<div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
								<h5 class="inline">
									<spring:message code="label.quote.order.sales.rep" />
									:
								</h5>
								<p class="inline" id="salesRepDetails">

									<c:if test="${not empty getOrderDetailsres.orderedBy}">
			                  				${getOrderDetailsres.orderedBy.firstName} ${getOrderDetailsres.orderedBy.lastName} 
									</c:if>
									<c:if test="${empty getOrderDetailsres.orderedBy}">

									</c:if>
								</p>
							</sec:authorize>
						</div> 

					</div>
					<div class="section returnReason">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<label class="required"><spring:message
									code="reason.for.return" /></label> <select style="width: 50%"
								class="form-control" id="returnReasonSelect"
								name="returnReasinOption" required>
								<option selected value="0">----- Select ------</option>
								<c:forEach items="${returnTypeVos}" var="returnType">
									<c:if test="${returnType.active}">
										<option value="${returnType.returnTypeId}">${returnType.description}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"
							id="returnComents">
							<label class="required"><spring:message
									code="return.reason.detail" /></label>
							<textarea class="form-control" rows="4" id="returnReasonDetail"
								name="returnReasonDetail" required></textarea>
						</div>
						<%-- <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<label><spring:message code="refresh.price" /></label> <span
								class="fa fa-refresh" aria-hidden="true"></span>
						</div> --%>
					</div>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<label> <input id="selectAllBox" type="checkbox"></input>
								<spring:message code="label.shoppingcart.total" />
							</label> <span class="fa fa-trash-o delete-item_new emptyCart"
								id="emptyCartButton" onClick="emptyCartDelete()"></span>
						</div>

					</div>
					<div class="lineItmHeight">
						<table id="lineItem" class="dataTable" cellspacing="0"
							width="100%">
							<thead>
								<tr>
									<th></th>
									<th><spring:message code="label.quote.order.select" /></th>
									<th><spring:message code="label.quote.order.items" /></th>
									<th><spring:message code="invoice.label.description" /></th>
									<th><spring:message code="lable.partqty" /></th>
									<th><spring:message code="label.export.uom" /></th>
									<th><spring:message code="label.item.price" /></th>
									<th><spring:message code="label.currency" /></th>
									<th><spring:message code="shipment.status" /></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="plist" items="${cartDetails}">
									<tr id="${plist.partId}">
										<td></td>
										<td><div>
												<input type="checkbox" class="ind-empty-checkbox"
													id="${plist.partId}">
											</div></td>
										<td>${plist.partNumber}</td>
										<td>${plist.partEngineeringDescription}</td>
										<td>
											<fmt:formatNumber var="itemQuantity" type="number"
													minFractionDigits="0" maxFractionDigits="0"
													value="${plist.quantity}" />
											<div
												class="spinner-control qty-change-div directorder-spinner" data-quantity="${itemQuantity}" data-partId= "${plist.partId}" data-ordermultiplekey="${plist.orderMultiple}">
												<input id="datatableQuantity" type="text" max="${itemQuantity}" class="total-items output input-qty-box"	
													value="${itemQuantity}" style="width: 40px; text-align: center;" />
												<div class="qty">
													<a href="javascript:void(0);"
														id="itemIncrement" class="item-increment plus-click"> <i
														class="fa fa-caret-up"></i>
													</a> <a href="javascript:void(0);"
														class="item-decrement minus-click"> <i
														class="fa fa-caret-down"></i>
													</a>
												</div>
											</div>
										</td>
										<td>${plist.uom}</td>
										<td class="itemValue">
										<c:choose>
											<c:when test="${isDealerUser}">${plist.itemTotalAmountStr}</c:when><c:otherwise>${plist.dealerItemTotalAmountStr}</c:otherwise>
										</c:choose>
										</td>
										<td>${plist.currencyCode}</td>
										<td>${plist.shipmentStatus}</td>
									</tr>
								</c:forEach>
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
								(<span></span> <spring:message code="label.items" />)
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="totalPrice">
							</h5>
						</div>
						<!--    Commented By Rajesh , enable after testing  -->
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="freightLabel"><spring:message code="lable.freight" /></h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="freight">
							</h5>
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="taxesLabel"><spring:message code="lable.taxes" /></h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " id="taxes">
							</h5>
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"
								id="miscellaneousLabel"><spring:message code="lable.surcharge" /></h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 "
								id="miscellaneous"></h5>
						</div>

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
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a id="returnRequest" onClick="returnRequest()" class="pull-right green-button next"><spring:message
									code="lable.return.order" /></a>
						</div>
						<div class="clearfix"></div>
					</div>


				</div>
			</div>
			
			<!-- /.modal -->


			<!-- /.modal -->

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
			<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.bulkpartupload.information" />
							</h4>
						</div>
						<div class="modal-body custom-modal-body"></div>

					</div>
				</div>
			</div>
		</form>


	</div>


	<script id="chargeListBodyTemplate" type="text/x-jquery-tmpl">
			<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
			<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode}</p>			
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
		defer type="text/javascript"></script>
	<script type="text/javascript">
		var transportModeApplicable = 0;
		var returnTypes;
		function handleTransportMode() {
			transportModeApplicable = '${transportModeApplicable}';
			if (transportModeApplicable == 2 || transportModeApplicable == 1) {
				$('#transportModeDiv').show();
			} else {
				$('#transportModeDiv').hide();
			}
		}

		var userid, authtoken;
		$(document)
				.ready(
						function(e) {
							
							var orderListBreadcrumbLink = $('.breadcrumb')
									.find('li:nth-child(2) a').attr('href');

							returnTypes = JSON.parse('${returnType}');
							console.log(returnTypes);
							userid = $('#userId').val();
							authtoken = $('#authToken').val();
							var myjson = ${cartDetailsJSON};
							console.log(myjson);
							console.log(Object.keys(myjson).length);
							var key = Object.keys(myjson).length;
							var trHTML = "";

							console.log(myjson.itemList);
							
							if("${isDealerUser}" == "true"){
								$('.final-total').find('h5.grandTotal').html(
										myjson.totalAmountStr + ' '
												+ myjson.currencyCode);
							}else{
								$('.final-total').find('h5.grandTotal').html(
										myjson.dealerTotalAmountStr + ' '
												+ myjson.currencyCode);
							}
							

							$("#lineItem tbody").append(trHTML);

						
							$("#returnReasonSelect").change(function() {
								console.log((this).value);
								var selectReturn = (this).value;
								returnTypes.forEach(function(element) {
									console.log(element);
									if (element.returnTypeId == selectReturn) {
										if (element.showReasonTextBox) {
											$("#returnComents").show();
										} else {
											$("#returnComents").hide();
										}
									}
								});
								$('.pageLoader').show();
								$.ajax({
									
									type : "POST",
							          data : {
							        	  		returnTypeId : $("#returnReasonSelect").val(),
							        	  	},
								      mimeType: 'application/json',
							          url : "refreshPriceForReturnOrderTypeChange",
							          success : function(response) {
							        	
							        	  if("${isDealerUser}" == "true"){
							        		  $('.final-total').find('h5.grandTotal').html(
								        			  response.totalAmountStr + ' '
																+ response.currencyCode);
							        	  }else{
							        		  $('.final-total').find('h5.grandTotal').html(
								        			  response.dealerTotalAmountStr + ' '
																+ response.currencyCode);
							        	  }
							        	 
							        	  if("${isDealerUser}" == "true"){
							        		  $("#totalPrice").html(response.subtotalAmountStr + ' '
														+ response.currencyCode);
							        	  }else{
							        		  $("#totalPrice").html(response.dealerSubtotalAmountStr + ' '
														+ response.currencyCode); 
							        	  }
						        	  
							        	  $('#freight').html(
							        			  response.freightAmountStr + ' '
															+ response.currencyCode);
											$('#taxes').html(
													response.taxAmountStr + ' '
															+ response.currencyCode);
											$('#miscellaneous').html(
													response.surchargeValueStr + ' '
															+ response.currencyCode);
											  $('.pageLoader').hide();
							          }
								});
							});
							$("#selectAllBox").click(
									function() {
										if ((this).checked) {
											$(".ind-empty-checkbox").prop(
													"checked", true);
											$("#emptyCartButton").addClass(
													'emptyCart');
										} else {
											$(".ind-empty-checkbox").prop(
													"checked", false);
										}
									});
							$(".ind-empty-checkbox")
									.click(
											function() {
												if (($(".ind-empty-checkbox:checked").length > 0) && ($(".ind-empty-checkbox").length != $(".ind-empty-checkbox:checked").length)) {
													$("#emptyCartButton")
															.removeClass(
																	'emptyCart');
												} else {
													$("#emptyCartButton")
															.addClass(
																	'emptyCart');
												}
											});

							
							var rowTotal = $('#lineItem tbody tr').length;
							$('#totalItem span').html(rowTotal);

							$('#freight').html(
									myjson.freightAmountStr + ' '
											+ myjson.currencyCode);
							$('#taxes').html(
									myjson.taxAmountStr + ' '
											+ myjson.currencyCode);
							if("${isDealerUser}" == "true"){
								$('#totalPrice').html(
										myjson.subtotalAmountStr + ' '
												+ myjson.currencyCode);
							}else{
								$('#totalPrice').html(
										myjson.dealerSubtotalAmountStr + ' '
												+ myjson.currencyCode);
							}
							

							//data tables
							$("#lineItem tbody tr td:first-child>a").on(
									"click",
									function() {
										$(".dynamic").remove();
										var glyphi = $(this).children(
												"span.glyphicon");
										glyphi.toggleClass('arrowRotate');
										if ($(glyphi).hasClass("arrowRotate")) {
											$(this).closest("tr").after(table);
										} else {
											$(".dynamic").remove();
										}

									});
							$('#application-data').DataTable({
								"paging" : false,
								"ordering" : false,
								"info" : false
							});
							//To set the data for cartItemList and cart-items-hldr

							//To set the data for chargeListBodyTemplate and charge-details-hldr
							$("#charge-details-hldr").html('');
							if (myjson && myjson.chargeList)
								$("#chargeListBodyTemplate").tmpl(
										myjson.chargeList).appendTo(
										"#charge-details-hldr");

							//Setting ChargeList Header
							$("#charge-details-hldr-header").html('');
							if (myjson)
								$("#chargeListTemplateHeader").tmpl(myjson).appendTo("#charge-details-hldr-header");

							//Setting ChargeList Footer
							$("#charge-details-hldr-footer").html('');
							if (myjson)
								$("#chargeListTemplateFooter").tmpl(myjson).appendTo("#charge-details-hldr-footer");

						});
		$(document).delegate(
				'.minus-click',
				'click',
				function() {
					var itemVal = $(this).parents('.spinner-control').children(
					'.total-items').val();
					var itemValOld = $(this).parents('.spinner-control')
					.children('.hiddenQty').val();
					var maxQty = $(this).parents('.spinner-control').attr('data-quantity');
					var partId = $(this).parents('.spinner-control').attr('data-partId');
					if($("#returnReasonSelect").val() == 0){
						if(itemVal == 1){
							$(this).parents('.spinner-control').children(
							'.total-items').val(parseInt(itemVal));
						}else{
							$(this).parents('.spinner-control').children(
							'.total-items').val(parseInt(itemVal)+1);
						}
						
						$('.modal-body').text('Please select return type');					
                		$("#myModal").show();	
                    	return false;
					}					
						$(this).parents('.spinner-control').children('.hiddenQty')
							.val(itemVal);

						var returnVal = validateQty(itemVal);

						if (itemValOld == 1) {
							return false;
						}
						var ordMult = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
						itemVal = getOrderMultiplesForQuantity(itemVal, partId,
							ordMult);
						refreshPrice(partId, itemVal);
				});

		$(document).delegate(
				'.plus-click',
				'click',
				function(e) {
					var itemVal = $(this).parents('.spinner-control').children(
					'.total-items').val();
					
					var maxQty = $(this).parents('.spinner-control').attr('data-quantity');
					var partId = $(this).parents('.spinner-control').attr('data-partId');
					if(itemVal > maxQty)
					{
						itemVal = maxQty;
						$(this).parents('.spinner-control').children(
						'.total-items').val(parseInt(itemVal));
						return false;
					}
					if($("#returnReasonSelect").val() == 0){
						$(this).parents('.spinner-control').children(
						'.total-items').val(parseInt(itemVal)-1);
						$('.modal-body').text('Please select return type');					
                		$("#myModal").show();	
                    	return false;
					}	
					
					if (parseInt(itemVal) > 999) {
						$(this).parents('.spinner-control').children(
								'.total-items').val("999");
						return false;
					}
					$(this).parents('.spinner-control').children('.hiddenQty')
							.val(itemVal);
					var ordMult = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
					itemVal = getOrderMultiplesForQuantity(itemVal, partId,
							ordMult);
					
					refreshPrice(partId, itemVal);
					
				});
		
		function refreshPrice (partId, itemVal){
			  $('.pageLoader').show();
			$.ajax({
				type : "POST",
		          data : { partId : partId, 
		        	  		quantity : itemVal,
		        	  		returnTypeId : $("#returnReasonSelect").val(),
		        	  	},
			      mimeType: 'application/json',
		          url : "refreshPriceForReturnOrder",
		          success : function(response) {
		        	  
		        	  $('#lineItem' + " tr").each(function (){
		        		  pId = $(this)[0].id;
		        		  row = $(this)[0];
		        		  
		        		  response.cartItemList.forEach(function(element){
		        			  if(element.partId == pId){
		        				  row.cells[6].textContent = '';
		        				  if("${isDealerUser}" == "true"){
		        					  row.cells[6].append(element.itemTotalAmountStr);
		        				  }else{
		        					  row.cells[6].append(element.dealerItemTotalAmountStr);
		        				  }
		        				  
		        			  }
		        			  if((pId == '') && (row.cells[6].textContent == '')){
		        				  row.cells[6].append('<spring:message code="label.item.price" />');
		        			  }
		        		  });
		        	  });
		        	  
		        	  console.log(response);
		        	  if("${isDealerUser}" == "true"){
		        		  $('.final-total').find('h5.grandTotal').html(
			        			  response.totalAmountStr + ' '
											+ response.currencyCode);  
		        	  }else{
		        		  $('.final-total').find('h5.grandTotal').html(
			        			  response.dealerTotalAmountStr + ' '
											+ response.currencyCode);
		        	  }
		        	  
		        	  if("${isDealerUser}" == "true"){
		        		  $("#totalPrice").html(response.subtotalAmountStr + ' '
									+ response.currencyCode);
		        	  }else{
		        		  $("#totalPrice").html(response.dealerSubtotalAmountStr + ' '
									+ response.currencyCode);
		        	  }
		        	  
		        	  $('#freight').html(
		        			  response.freightAmountStr + ' '
										+ response.currencyCode);
						$('#taxes').html(
								response.taxAmountStr + ' '
										+ response.currencyCode);
						$('#miscellaneous').html(
								response.surchargeValueStr + ' '
										+ response.currencyCode);
						  $('.pageLoader').hide();
		          }
			});
		}
		function validateQty(itemQty) {
			if (itemQty == "") {
				var msg = "<spring:message code='alert.cart.enter.qty' javaScriptEscape='true'/>";
				$('.modal-body').text(msg);
				$("#myModal").show();
				return false;
			} else if (itemQty <= 0) {
				return false;
			} else if (validateSpecialCharacterAndAlphanumeric(itemQty) == true) {
				return false;
			} else
				return true;
		}
		function getOrderMultiplesForQuantity(quantity, partId, ordMultiple) {
			var itemCount = parseFloat(quantity);
			var incFactor = parseFloat(ordMultiple);

			//itemCount = (itemCount >= 999.99) ? 999.99 : itemCount;
			var newVal = 0.0;
			if (itemCount >= 999.99) {
				newVal = (999.99 - (999.99 % incFactor));
			} else if ((itemCount % incFactor) == 0) {
				newVal = itemCount;
			} else if ((itemCount % incFactor) > 0.0) {
				newVal = (itemCount - (itemCount % incFactor)) + incFactor;
			}

			if (isNaN(itemCount) || itemCount == 0.0) {
				newVal = incFactor;
			}

			newVal = (newVal > 999.99) ? newVal - incFactor : newVal;

			if (newVal == 0.0 && incFactor != null && incFactor != 0.0
					&& itemCount != 0.0) {

				newVal = itemCount * incFactor;
			}

			return parseFloat(newVal);
		}
		$(".custom-close").click(function(){
			   $("#myModal").hide();
			});
		function emptyCartDelete(){    	 
			if($("#returnReasonSelect").val() == 0){
				$('.modal-body').text('Please select return type');					
        		$("#myModal").show();	
            	return false;
			} 	 
			var someObj = [];
			var inputElements = document.getElementsByClassName('ind-empty-checkbox');
	    	  for(var i=0; inputElements[i]; ++i){
	    	        if(inputElements[i].checked){
	    	             checkedValue = inputElements[i].id;
	    	             someObj.push(checkedValue);
	    	        }
	    	  }
	    	  $('#lineItem' + " tr").each(function (){
	    		  rowId = $(this)[0].id;  
	    		  if ( $.inArray(rowId, someObj) > -1 ) {
	    			  $(this).remove();
	    			}
	    		});
	    	  $('.pageLoader').show();
	    	  $.ajax({
	    		  type : "POST",
	    		  data : {
						partIds : JSON.stringify(someObj),
						returnTypeId : $("#returnReasonSelect").val(),
					},
				  mimeType: 'application/json',
			      url : "deleleItemForReturnOrder",
			      success: function(response){
			    	  $("#emptyCartButton").addClass('emptyCart');
			    	  if("${isDealerUser}" == "true"){
			    		  $('.final-total').find('h5.grandTotal').html(
			        			  response.totalAmountStr + ' '
											+ response.currencyCode); 
			    	  }else{
			    		  $('.final-total').find('h5.grandTotal').html(
			        			  response.dealerTotalAmountStr + ' '
											+ response.currencyCode);
			    	  }
			    	  
			    	  if("${isDealerUser}" == "true"){
			    		  $("#totalPrice").html(response.subtotalAmountStr + ' '
									+ response.currencyCode); 
			    	  }else{
			    		  $("#totalPrice").html(response.dealerSubtotalAmountStr + ' '
									+ response.currencyCode);
			    	  }
		        	  
		        	  $('#freight').html(
		        			  response.freightAmountStr + ' '
										+ response.currencyCode);
						$('#taxes').html(
								response.taxAmountStr + ' '
										+ response.currencyCode);
						$('#miscellaneous').html(
								response.surchargeValueStr + ' '
										+ response.currencyCode);
						  $('.pageLoader').hide();
			      }
	    	  });
	  	 }
		function returnRequest(){
			if( $('#lineItem tr').length == 1){
				$('.modal-body').text('<spring:message code="no.items.return" />');					
        		$("#myModal").show();	
            	return false;
			}
			if($("#returnReasonSelect").val() == 0){
				if( $('#lineItem tr').length == 1){
					$('.modal-body').text('<spring:message code="no.items.return" />');					
	        		$("#myModal").show();	
	            	return false;
				} else{
					$('.modal-body').text('<spring:message code="select.return.type" />');					
	        		$("#myModal").show();	
	            	return false;
				}	
			}
			if(($("#returnComents").is(":visible")) && ($("#returnReasonDetail").val() == "") ){
				if( $('#lineItem tr').length == 1){
					$('.modal-body').text('<spring:message code="no.items.return" />');					
	        		$("#myModal").show();	
	            	return false;
				} else{
					$('.modal-body').text('<spring:message code="provide.return.detail" />');					
	        		$("#myModal").show();	
	            	return false;
				}
			}
			window.location.href="returnOrderConfirm?returnTypeId="+$("#returnReasonSelect").val()+"&returnReason="+$("#returnReasonDetail").val();
			
		}
		//END OF SCRIPT */
	</script>
</body>
</html>
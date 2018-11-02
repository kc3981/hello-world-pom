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
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->
<style>
.table {
	background-color: transparent;
	border: none !important;
	border-top: 0 !important;
}

.tableHead, .table th {
	background: #FFF !important;
	border-top: 0 !important;
	text-transform: capitalize !important;
}

.odd {
	background-color: #F9F9F9 !important;
}

.even {
	background-color: #fff !important;
}

.tr:hover {
	background: #f2f2f2 !important;
}

thead {
	background: #646464 none repeat scroll 0 0;
	color: #fff;
}

table {
	margin-bottom: 30px;
}

table tbody tr td:first-child {
	cursor: pointer;
}

table tbody a.btn, table tbody a.btn:hover {
	/* background: #c80000;
	border: 1px solid #c80000; */
	display: block;
	margin: 5px 0;
	text-transform: uppercase;
}

table tbody tr td:nth-child(3), table tbody tr td:nth-child(5) {
	text-align: center;
	padding-left: 0;
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
	defer type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<!-- header includes -->
				<%@ include file="../../jsp/header.jsp"%>
			</header>

			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<!--- This is for Breadcrumbs -->
				<div class="breadcrumbs-list hidden-xs">
					<ul class="breadcrumb">
						<li><a href="homepage"><spring:message code="label.home" /></a></li>
						<li><a href="getorders"><spring:message
									code="view.label.orders" /></a></li>
						<li class="active"><spring:message code="view.label.order.no" />${cartDetails.orderNumber}</li>
					</ul>
				</div>
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">

					<h3>
						<spring:message code="view.label.order.no" />${cartDetails.orderNumber}</h3>

					<div class="form-inline section">

						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.order.by" />
								:
							</h5>
							<c:choose>
								<c:when test="${not empty cartDetails.orderedBy}">
									<p class="inline">${cartDetails.orderedBy.firstName}
										${cartDetails.orderedBy.lastName}</p>
								</c:when>
								<c:otherwise>
									<p class="inline">${cartDetails.contact.fullName}</p>
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
									value="${cartDetails.orderDate}" />
							</p>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.order.status" />
								:
							</h5>
							<p class="inline">${cartDetails.cartStatusValue}</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
							<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.customer" />
									:
								</h5>
								<p class="inline">
									<c:choose>
										<c:when test="${cartDetails.isGuestChildCart}">
										${cartDetails.customerName}
									</c:when>
										<c:otherwise>
										${cartDetails.customer.customerReference} - ${cartDetails.customer.customerName}
									</c:otherwise>
									</c:choose>




								</p>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.your.reference" />
									:
								</h5>
								<p class="inline">
									<c:if test="${not empty cartDetails.cartName}">
				                		${cartDetails.cartName}
								</c:if>
									<c:if test="${empty cartDetails.cartName}">
				                	 -
								</c:if>
								</p>
							</div>

							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 column-paddings">
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="">
										<h5 class="inline">
											<spring:message code="view.label.bill.to" />
											:
										</h5>
										<p class="inline">${cartDetails.billToAddress.addressReference}
											- ${cartDetails.billToAddress.addressName}</p>
									</div>
									<div class="clearfix"></div>
									<div class="address-holder">
										<p>
											<c:if
												test="${not empty cartDetails.billToAddress.addressName}">
			                  				${cartDetails.billToAddress.addressName}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressLine1}">
			                  				${cartDetails.billToAddress.addressLine1}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressLine2}">
			                  				${cartDetails.billToAddress.addressLine2}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressLine3}">
			                  				${cartDetails.billToAddress.addressLine3}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressLine4}">
			                  				${cartDetails.billToAddress.addressLine4}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressCity}">
			                  				${cartDetails.billToAddress.addressCity}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressState}">
			                  				${cartDetails.billToAddress.addressState}&nbsp; 
									</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressZipCode}">
			                  				${cartDetails.billToAddress.addressZipCode}
									</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressCountry}">
			                  				,&nbsp;${cartDetails.billToAddress.addressCountry}<br />
											</c:if>
										</p>
									</div>
								</div>
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="">
										<h5 class="inline">
											<spring:message code="view.label.ship.to" />
											:
										</h5>
										<p class="inline">${cartDetails.shipToAddress.addressReference}
											- ${cartDetails.shipToAddress.addressName}</p>
									</div>
									<div class="clearfix"></div>
									<div class="address-holder">
										<p>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressName}">
			                  				${cartDetails.shipToAddress.addressName}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressLine1}">
			                  				${cartDetails.shipToAddress.addressLine1}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressLine2}">
			                  				${cartDetails.shipToAddress.addressLine2}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressLine3}">
			                  				${cartDetails.shipToAddress.addressLine3}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressLine4}">
			                  				${cartDetails.shipToAddress.addressLine4}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressCity}">
			                  				${cartDetails.shipToAddress.addressCity}<br />
											</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressState}">
			                  				${cartDetails.shipToAddress.addressState}&nbsp;
									</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressZipCode}">
			                  				${cartDetails.shipToAddress.addressZipCode}
									</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressCountry}">
			                  				,&nbsp;${cartDetails.shipToAddress.addressCountry}<br />
											</c:if>
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h5 class="inline">
										<spring:message code="view.label.shipping.method" />
										:
									</h5>
									<p class="inline">
										<c:if
											test="${not empty cartDetails.carrier.carrierDescription}">
			                  				${cartDetails.carrier.carrierDescription}
									</c:if>
										<c:if test="${empty cartDetails.carrier.carrierDescription}">
			                  				-
									</c:if>
									</p>
									<br>

									<c:if
										test="${not empty cartDetails.transportMode.transportDescription}">
										<h5 class="inline">
											<spring:message code="label.quote.order.transport.code" />
											:
										</h5>
										<p class="inline">
											${cartDetails.transportMode.transportDescription}
											<c:if
												test="${empty cartDetails.transportMode.transportDescription}">
			                  				-
									</c:if>
										</p>
										<br>
									</c:if>

									<h5 class="inline">
										<spring:message code="view.label.payment.terms" />
										:
									</h5>
									<p class="inline">
										<c:if
											test="${not empty cartDetails.carrierBillingOption.description}">
			                  				${cartDetails.carrierBillingOption.description}
									</c:if>
										<c:if
											test="${empty cartDetails.carrierBillingOption.description}">
			                  				-
									</c:if>
									</p>
									<br>
									<sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
										<h5 class="inline saleRepApplicable">
											<spring:message code="label.quote.order.sales.rep" />
											:
										</h5>
										<p class="inline saleRepApplicable" id="salesRepDetails"></p>
									</sec:authorize>
									<h5 class="inline">
										<spring:message code="view.label.shipping.instructions" />
										:
									</h5>
									<p class="inline">
										<c:if test="${not empty cartDetails.deliveryInstructions1}">
			                  				${cartDetails.deliveryInstructions1}
									</c:if>
										<c:if test="${empty cartDetails.deliveryInstructions1}">
			                  				-
									</c:if>
									</p>
								</div>
							</div>


							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">

								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 nopadding">
									<h5 class="inline">
										<spring:message code="view.label.name" />
										:
									</h5>
									<p class="inline">
										<c:if test="${not empty cartDetails.contact.fullName}">
			                  				${cartDetails.contact.fullName}
									</c:if>
										<c:if test="${empty cartDetails.contact.fullName}">
			                  				-
									</c:if>
									</p>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 nopadding">
									<h5 class="inline">
										<spring:message code="view.label.email" />
										:
									</h5>
									<p class="inline">
										<c:if test="${not empty cartDetails.contact.primaryEmail}">
			                  				${cartDetails.contact.primaryEmail}
									</c:if>
										<c:if test="${empty cartDetails.contact.primaryEmail}">
			                  				-
									</c:if>
									</p>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<!--  <p>The length of the companies collection is : ${fn:length(shipmentVOs)}</p> -->
					<c:if test="${fn:length(shipmentVOs) gt 0}">
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
									<th width="15%"><span><spring:message
												code="view.label.status" /></span>
									</td>
									<sec:authorize access="hasRole('ROLE_VIEW_INVOICE')">
										<th width="15%"><span><spring:message
													code="view.label.invoice" /></span>
										</td>
									</sec:authorize>
								</tr>
								<c:forEach var="shipmentVO" items="${shipmentVOs}"
									varStatus="loop">
									<c:if test="${loop.index % 2 == 0}">
										<tr class="odd tr">
									</c:if>
									<c:if test="${loop.index % 2 != 0}">
										<tr class="even tr">
									</c:if>
									<td><a
										href="getshipment?shipmentId=${shipmentVO.shipmentId}">${shipmentVO.shipmentReference}</a></td>

									<td><c:if
											test="${not empty shipmentVO.carrierTrackingURL}">
											<c:if test="${not empty shipmentVO.trackingReference}">
												<a
													href="${shipmentVO.carrierTrackingURL}${shipmentVO.trackingReference}"
													target="_blank">${shipmentVO.trackingReference}</a>
											</c:if>
										</c:if> <c:if test="${empty shipmentVO.carrierTrackingURL}">
											<c:if test="${empty shipmentVO.trackingReference}">
											-
										</c:if>
										</c:if></td>

									<td class="text-center"><c:if
											test="${not empty shipmentVO.shipmentDate}">
											<fmt:formatDate pattern="${dateformat}"
												value="${shipmentVO.shipmentDate}" />
										</c:if> <c:if test="${empty shipmentVO.shipmentDate}">
										-
									</c:if></td>

									<td class="text-center"><c:if
											test="${not empty shipmentVO.plantReference}">
										${shipmentVO.plantReference}
									</c:if> <c:if test="${empty shipmentVO.plantReference}">
										-
									</c:if></td>

									<td><c:if test="${not empty shipmentVO.statusName}">
										${shipmentVO.statusName}
									</c:if> <c:if test="${empty shipmentVO.statusName}">
										-
									</c:if></td>
									<sec:authorize access="hasRole('ROLE_VIEW_INVOICE')">
										<td><c:if test="${not empty shipmentVO.invoiceReference}">
												<a href="getinvoice?invoiceId=${shipmentVO.invoiceId}">${shipmentVO.invoiceReference}</a>
											</c:if> <c:if test="${empty shipmentVO.invoiceReference}">
										-
									</c:if></td>
									</sec:authorize>
									</tr>
								</c:forEach>
							</table>
							<div class="clearfix"></div>
						</div>
					</c:if>
					<div class="" id="machine-serial">
						<c:if test="${not empty cartDetails.serialNumber}">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.serial.no" />
									:
								</h5>
								<p class="inline">${cartDetails.serialNumber}</p>
							</div>
						</c:if>

						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
								<h5 class="inline">
									<spring:message code="view.label.ship.complete" />
									:
								</h5>
								<p class="inline" id="partialShipment">
									<c:if test="${cartDetails.partialShipment == false}">
										<spring:message code="view.label.yes" />
									</c:if>
									<c:if test="${cartDetails.partialShipment == true}">
										<spring:message code="view.label.no" />
									</c:if>
								</p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
								<h5 class="inline">
									<spring:message code="view.label.ship.today" />
									:
								</h5>
								<p class="inline" id="shipToday">
									<c:if test="${cartDetails.isSameDayShipping == true}">
										<spring:message code="view.label.yes" />
									</c:if>
									<c:if test="${cartDetails.isSameDayShipping == false}">
										<spring:message code="view.label.no" />
									</c:if>
								</p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
								<h5 class="inline">
									<spring:message code="view.label.unit.down" />
									:
								</h5>
								<p class="inline" id="unitDown">
									<c:if test="${cartDetails.machineBreakdown == true}">
										<spring:message code="view.label.yes" />
									</c:if>
									<c:if test="${cartDetails.machineBreakdown == false}">
										<spring:message code="view.label.no" />
									</c:if>
								</p>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section form-inline">
						<div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.po.number" />
								:
							</h5>
							<p class="inline">
								<c:if
									test="${not empty cartDetails.customerPurchaseOrderNumber}">${cartDetails.customerPurchaseOrderNumber}</c:if>
								<c:if test="${empty cartDetails.customerPurchaseOrderNumber}"> - </c:if>
							</p>
						</div>
						<div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.sales.code" />
								:
							</h5>
							<p class="inline">
								<c:if test="${not empty cartDetails.paymentMethod.description}">${cartDetails.paymentMethod.description}</c:if>
								<c:if test="${empty cartDetails.paymentMethod.description}"> - </c:if>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- <div class="">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <div id="cart-items-hldr" class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details">
                                	<%-- shoppingCartTemplate render here SAI --%>
                              </div>  
                        </div>
                    </div>
			        <div class="clearfix"></div>
			        <div class=" section">
			            <div class="clearfix">
				             <div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12">
				                <h5 class="inline"><spring:message code="view.label.comments"/> :</h5>
				                <p class="inline">
				                	<c:if test="${not empty cartDetails.comments}">
			                  				${cartDetails.comments}
									</c:if>
                                	<c:if test="${empty cartDetails.comments}">
			                  				-
									</c:if>
								</p>	
				            </div>
				            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">

				                <h5 class="inline"><spring:message code="view.label.attached.file"/> :</h5>
				                <a href="javascript:void(0);" class="inline" id="attachedFile"></a>  

				            </div>
			   			</div>
					</div>
	            </div> -->
					<%-- <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
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


					<!--   <div class="quote-total">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" id="charge-details-hldr-header">
                        
                    </div>
                    <div id="additionalCharges">
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
                        
                    </div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                         <a href="getorders"  class="pull-right blue-button"><spring:message code="view.button.my.orders"/></a> 
                    </div>
                    <div class="clearfix"></div>
                </div> -->
					<table id="lineItem" class="" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>HOT RUNNER SERIES</th>
								<th>DESCRIPTION</th>
								<th>ORDERED QTY</th>
								<th>UNIT PRICE</th>
								<th>CURRENCY</th>
								<th>ACTION</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a>Master Series - Pico</a></td>
								<td>CUSTOM "MOLD - MASTER SYSTEM"</td>
								<td>1</td>
								<td>26,876.00</td>
								<td>USD</td>
								<td><a class="btn btn-success">Drawings</a> <a
									class="btn btn-success">Applications</a> <a
									class="btn btn-success">Re-Order</a></td>
							</tr>
							<tr>
								<td><a>Master Series - Femto</a></td>
								<td>CUSTOM "MOLD - MASTER SYSTEM"</td>
								<td>1</td>
								<td>26,876.00</td>
								<td>USD</td>
								<td><a class="btn btn-success">Applications</a> <a
									class="btn btn-success">Re-Order</a></td>
							</tr>
						</tbody>
					</table>
					<div class="row lineItem-show" style="display: none">
						<div class="col-sm-12">
							<table id="partItem" class="" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>BALLOON NUMBER</th>
										<th>PART</th>
										<th>PART DESCRIPTION</th>
										<th>QTY</th>
										<th>UNIT PRICE</th>
										<th>CURRENCY</th>
										<th>ACTION</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>001</td>
										<td>BP22.500</td>
										<td>BACK PLATE 22 R=500</td>
										<td>1</td>
										<td>312.00</td>
										<td>USD</td>
										<td><a class="btn btn-success">ADD TO CART</a></td>
									</tr>
									<tr>
										<td>002</td>
										<td>DPM5X20</td>
										<td>DOWEL PIN</td>
										<td>1</td>
										<td>1.40</td>
										<td>USD</td>
										<td><a class="btn btn-success">ADD TO CART</a></td>
									</tr>
									<tr>
										<td>003</td>
										<td>DPSM6X8.5</td>
										<td>DOWEL PIN SPRING</td>
										<td>8</td>
										<td>3.83</td>
										<td>USD</td>
										<td><a class="btn btn-success">ADD TO CART</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- footer container -->
			<footer>
				<!-- Header includes -->
				<%@ include file="../../jsp/footer.jsp"%>
			</footer>
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
				     <c:if test="${properties['comments.section.required']==true}">
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
		defer type="text/javascript"></script>
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
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script type="text/javascript">
    var userid, authtoken;
     $(document).ready(function(e){
    	userid=$('#userId').val();
        authtoken = $('#authToken').val();
    	       
        var myjson = ${cartDetailsJSON};
        console.log(myjson)
        //data tables
        $("#lineItem tbody tr td:first-child>a").on("click", function(e){
            $(this).parents("#lineItem").siblings(".lineItem-show").show();
            e.preventdefault();
        })

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
	    
	    
 	  	if(typeof myjson.quotedBy!="undefined"){
  		var salesRep = myjson.quotedBy.userId + " - " + myjson.quotedBy.firstName + " " + myjson.quotedBy.lastName;
  		$('#salesRepDetails').text(salesRep);
  		}
	    
	    //Setting ChargeList Header
	    $("#charge-details-hldr-header").html('');
	    if(myjson)
	    $("#chargeListTemplateHeader").tmpl(myjson).appendTo("#charge-details-hldr-header");
	    
	     
	    //Setting ChargeList Footer
	    $("#charge-details-hldr-footer").html('');
	    if(myjson)
	    $("#chargeListTemplateFooter").tmpl(myjson).appendTo("#charge-details-hldr-footer");
	    
	   /* Commented to not to show attachment*/
	   $('#attachedFile').text(typeof myjson.attachedFileName=="undefined"?'-':myjson.attachedFileName);
	    
	    $('#attachedFile').on('click', function(){
	    	var fileName = $('#attachedFile').text();
	    	window.location.href = 'exportattachedfileforquoteorder?childCartId='+myjson.childCartId+'&fileName='+fileName;
	    })
	    hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
	    hideOrShowSalestax('${hideOrShowFields}');
    });
     
  /* // full item details page redirect onclick line items
 	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
		  var itemCategory=$("#headerName").text();
    	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
    	  window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId);
      } */
  //END OF SCRIPT */
    </script>
</body>
</html>
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
        <script src="../https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="../https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
    <![endif]-->

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
<sec:authorize access="hasRole('ROLE_DEALER_USER')" var="isDealerUser"></sec:authorize>
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
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed ">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="label.home" /></a></li>
					<sec:authorize access="hasRole('ROLE_EDIT_QUOTE')">
						<li><a href="getquotes"><spring:message
									code="view.label.quotes" /></a></li>
					</sec:authorize>
					<li class="active"><spring:message
							code="view.label.quote.number" />${cartDetails.quoteNumber}</li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

					<h3>
						<spring:message code="view.label.quote.number" />
						${cartDetails.quoteNumber}
					</h3>

					<div class="form-inline section">

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.by" />
								:
							</h5>
							<c:choose>
								<c:when test="${not empty cartDetails.quotedBy}">
									<p class="inline">${cartDetails.quotedBy.firstName}
										${cartDetails.quotedBy.lastName}</p>
								</c:when>
								<c:otherwise>
									<p class="inline">${cartDetails.contact.fullName}</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.date" />
								:
							</h5>
							<p class="inline">
								<fmt:formatDate pattern="${dateformat}"
									value="${cartDetails.quoteCreatedDate}" />
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<c:choose>
								<c:when test="${isDealerUser == false}">
									<div
										class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
										<h5 class="inline">
											<spring:message code="view.label.customer" />
											:
										</h5>
										<c:choose>
											<c:when
												test="${not empty cartDetails.isGuestChildCart && cartDetails.isGuestChildCart}">
												<p class="inline">${cartDetails.customerName}</p>
											</c:when>
											<c:otherwise>
												<p class="inline">${cartDetails.customer.customerReference}
													- ${cartDetails.customer.customerName}</p>
											</c:otherwise>
										</c:choose>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12">
										<h5 class="inline">
											<spring:message code="label.dealer.name" />
											:
										</h5>
										<p class="inline">${cartDetails.customer.customerReference}
													- ${cartDetails.customer.customerName}</p>
									</div>
								</c:otherwise>
							</c:choose>
							
							
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
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
								<c:if test="${isDealerUser == false}">
								<div
									class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
									<div class="column-paddings">
										<h5 class="inline">
											<spring:message code="view.label.bill.to" />
											:
										</h5>
										<!-- <p class="inline">${cartDetails.billToAddress.addressReference} - ${cartDetails.billToAddress.addressName}</p> -->
									</div>
									<div class="clearfix"></div>
									<div class="column-paddings address-holder">
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
			                  				${cartDetails.billToAddress.addressZipCode},
									</c:if>
											<c:if
												test="${not empty cartDetails.billToAddress.addressCountry}">
			                  				&nbsp;${cartDetails.billToAddress.addressCountry}<br />
											</c:if>
										</p>
									</div>
								</div>
								</c:if>
								<div
									class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
									<div class="column-paddings">
										<h5 class="inline">
											<spring:message code="view.label.ship.to" />
											:
										</h5>
										<!-- <p class="inline">${cartDetails.shipToAddress.addressReference} - ${cartDetails.shipToAddress.addressName}</p> -->
									</div>
									<div class="clearfix"></div>
									<div class="column-paddings address-holder">
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
			                  				${cartDetails.shipToAddress.addressZipCode},
									</c:if>
											<c:if
												test="${not empty cartDetails.shipToAddress.addressCountry}">
			                  				&nbsp;${cartDetails.shipToAddress.addressCountry}<br />
											</c:if>
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_PAYMENTTERMS',#organizationId)">
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
									</sec:authorize>

									<h5 class="inline">
										<spring:message code="view.label.shipping.method" />
										:
									</h5>
									<p class="inline" id="carrierId">
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
											${cartDetails.transportMode.transportDescription}</p>
										<br>
									</c:if>

									<sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
										<h5 class="inline saleRepApplicable">
											<spring:message code="label.quote.order.sales.rep" />
											:
										</h5>
										<p class="inline" id="salesRepDetails"></p>
										<br />
									</sec:authorize>
									<div
										class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
										id="salesAreaDiv">
										<h5 class="inline">
											<spring:message code="label.sales.area" />
											:
										</h5>
										<p class="inline" id="salesArea"></p>
									</div>


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


							<div
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
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
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
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

							</div>
						</div>
						<div class="clearfix"></div>
					</div>

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
					<div class="">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<div id="cart-items-hldr"
								class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<%-- shoppingCartTemplate render here SAI --%>
							</div>

						</div>

						<div class="clearfix"></div>
						<c:if test="${properties['comments.section.required']==true}">
							<div class="section">
								<div class="clearfix">
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<h5>
											<spring:message code="view.label.comments" />
											:
										</h5>
										<p>
											<c:if test="${not empty cartDetails.comments}">
			                  				${cartDetails.comments}
									</c:if>
											<c:if test="${empty cartDetails.comments}">
			                  				-
									</c:if>
										</p>
									</div>
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<h5>
												<spring:message code="view.label.attached.file" />
												:
											</h5>
											<a href="javascript:void(0);" id="attachedFile"></a>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>

					</div>

					<%-- <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
                <div class="section">
                    <div class="clearfix" id = "SALES_REP_SECTION1">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="inline"><spring:message code="view.label.sales.rep"/>: </h5>
                        <p class="inline">${cartDetails.quotedBy.userId} - ${cartDetails.quotedBy.firstName} ${cartDetails.quotedBy.lastName}</p>  
                    </div>
	                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                        <h5 class="inline"><spring:message code="view.label.auto.apply.charges"/>: </h5>
		                        <p class="inline" id="autoApply">
		                        		<c:if test="${empty cartDetails.autoApplyCharges}"> - </c:if>
				                        <c:if test="${cartDetails.autoApplyCharges == true}"><spring:message code="view.label.yes"/></c:if>
				                        <c:if test="${cartDetails.autoApplyCharges == false}"><spring:message code="view.label.no"/></c:if>
		                        </p>
	                    </div>
                    </div>
                </div>
    		    </sec:authorize> --%>

					<div class="quote-total">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
							id="charge-details-hldr-header">
							<!-- chargeListTemplateHeader goes here SAI 2 -->
						</div>
						<div id="additionalCharges" style="display: none">

							<c:if
								test="${not empty cartDetails.taxAmount && cartDetails.taxAmount > 0}">
								<h5
									class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
									<spring:message code="label.quote.sales.tax.am" />
									<h5
										class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40"
										id="taxVal"></h5>
									<h5
										class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40"
										id="taxVal">${cartDetails.taxAmountStr}
										${cartDetails.currencyCode}</h5>
							</c:if>
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
							id="charge-details-hldr">
							<!-- chargeListBodyTemplate goes here SAI 2 -->
						</div>
						<div class="final-total col-lg-12 col-md-12 col-sm-12 col-xs-12"
							id="charge-details-hldr-footer">
							<!--  chargeListTemplateFooter goes here SAI 2  -->
						</div>
						<sec:authorize access="hasRole('ROLE_CART')">
							<c:if test="${isQuoteExpired}">
								<!--  //FIX for GS-642  -->
								<div
									class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
									<a href="javascript:void(0);"
										class="pull-right green-button next" id="re-quote"><spring:message
											code="view.button.requote" /></a>
								</div>
							</c:if>
							<c:if test="${not isQuoteExpired}">
								<div
									class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
									<%-- <sec:authorize access="hasRole('ROLE_ORDER')"> --%>
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_ORDER','${cartDetails.organization.organizationId}')">
										<a href="javascript:void(0);"
											class="pull-right green-button next not-active"
											id="place-order"><spring:message
												code="view.button.place.order" /></a>
									</sec:authorize>
								</div>
							</c:if>
						</sec:authorize>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>


			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.bulkpartupload.information" />
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<!-- Content for the dialog / modal goes here. -->
						</div>

					</div>
				</div>
			</div>

			<!-- custome confirm alert -->
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
							<p class="dialog-content" >
								<spring:message code="label.bulkpartupload.replace.cart.message" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
								class="col btn ok" href="javascript:;"><spring:message
									code="label.myaccount.ok" /></a>
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

	<!-- Javascript Plugins -->
	<!-- <script src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/gensuite-ui.js" type="text/javascript"></script>
    <script src="../js/custom.scripts.js" type="text/javascript"></script> -->
	<script id="shoppingCartTemplate" type="text/x-jquery-tmpl">
					<div id="cart-items-hldr" class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div id="prd_quote_list_wrap" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details xs_img_center">
	                            <div class="col-lg-2 col-sm-3">
                                 	 {{if mediaId!=0}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img"></a>                               		
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image "><p></p></a>	
							 		{{/if}}
                                </div>
                                <div class="col-lg-5 col-sm-4 pt-xs-10">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="view.label.item"/> ${'${'}partNumber}</a></h4>
									<%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
									<c:if test="${properties['display.legacy.part']}">
										<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div> 
									</c:if>
									<div><strong id="headerName">${'${'}partCommercialDescription}</strong></div>
									<sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
        								<div>${'${'}partEngineeringDescription}</div>
									</sec:authorize>
                                    <div class="b-label">
									<c:if test="${properties['display.organizationName']}">
									<div>${'${'}organizationName} <spring:message code="view.label.part"/></div>
									</c:if>
									<div><strong>${'${'}inventoryMessage}</strong></div>
									<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p>
                                    </div>
									<div class="product-comments">
										<h5><spring:message code="view.label.comments"/>: </h5>
										{{if comments}}
												<p>${'${'}comments}</p>
										{{else}}
											<p>-</p>
										{{/if}}
									</div>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2">
        							<div class="spinner-control">
                                    	  <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:50px;text-align:center" readonly="" disabled="">
                                          <span class="unit">${'${'}uom}</span> 
                                 	</div>
        						</div>
                                <div class="col-lg-2 col-md-2 nopadding">
									{{if priceMSRPStr !== "-1"}} 
                                    	<div><spring:message code="view.label.msrp"/>: <span>${'${'}priceMSRP} ${'${'}currencyCode}</span></div>
									{{/if}}
									
									{{if priceStr !== "-1"}}
										<div><spring:message code="view.label.your.price"/>: ${'${'}priceStr} ${'${'}currencyCode}</div>
									{{/if}}
									
									{{if savedPriceStr !== "-1"}} 
										<div class="blueColor"><spring:message code="view.label.you.save"/>: ${'${'}savedPrice} ${'${'}currencyCode} <spring:message code="view.label.each"/></div>
									{{/if}} 
									
									{{if itemTotalAmountStr !== "-1"}}
										<div><h5><spring:message code="view.label.item.total"/>: ${'${'}itemTotalAmount} ${'${'}currencyCode}</h5></div> 
									{{/if}}
                                </div>
       					</div>		
				    </div>			       
       </script>

	<script id="chargeListTemplateHeader" type="text/x-jquery-tmpl">
					
           <h5 class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8"><spring:message code="view.label.item.total.amount"/> (<span>${fn:length(cartDetails.cartItemList)}</span> <spring:message code="view.label.items"/>:)</h5>
           <h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4"> 
								${'${'}subtotalAmountStr} ${'${'}currencyCode}
            </h5>
                    	                 
	 </script>
	<script id="chargeListBodyTemplate" type="text/x-jquery-tmpl">
							<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
							<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode}</p>			
	 </script>
	<script id="chargeListTemplateFooter" type="text/x-jquery-tmpl">
                        	<h5 class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-6 font20"><spring:message code="view.label.quote.total"/></h5>
                        	<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-5 font20"> 
								${'${'}totalAmountStr} ${'${'}currencyCode} 
                        	</h5>
	 </script>
	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
		defer type="text/javascript"></script>
	<script
		src="../js/jquery-ui.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/bootstrap.min.js?version=${properties['application.version']}"
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
	var sWidth = $(window).width();
	if (sWidth <= 992) {
		var mql = window.matchMedia("(orientation: portrait)");
		if (mql.matches) {
			// Portrait orientation
			$("#myModal").show();
			$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
			/*alert("This page is best viewed in landscape mode for better usability");*/
		} else {
			// Landscape orientation
			$("#myModal").hide();
			/*alert("Landscape");*/
		}
		mql.addListener(function(m) {
			if (m.matches) {
				// Changed to portrait
				$("#myModal").show();
				$(".custom-modal-body")
				.text("This page is best viewed in landscape mode for better usability");
				/*alert("This page is best viewed in landscape mode for better usability");*/
			} else {
				// Changed to landscape
				$("#myModal").hide();
				/*$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
				alert("Landscape");*/
			}
		});
		
	}
    var userid, authtoken;
    var valueHideOrShow; 
     $(document).ready(function(e){
        //$(".close").text("x");
    	userid=$('#userId').val();
        authtoken = $('#authToken').val();
     	
        var myjson = ${cartDetailsJSON};
		console.log("myjson"+myjson);
		
		if(myjson.hasPlaceOrderPOCC && !myjson.isGuestChildCart){
			$('#place-order').removeClass('not-active');
		}
		if(!myjson.hasPlaceOrderPOCC){
			$('#re-quote').hide();
		}
		if(typeof myjson.carrierBillingOption!="undefined" && myjson.carrierBillingOption.description == "Prepay and Add"){
			$('#carrierId').hide();
			$('#carrierId').prev().hide();
		}
		
       	//To set the data for cartItemList and cart-items-hldr
	    $("#cart-items-hldr").html('');
	    if(myjson && myjson.cartItemList)
       	$("#shoppingCartTemplate").tmpl(myjson.cartItemList).appendTo("#cart-items-hldr");
	    
		 //To set the data for chargeListBodyTemplate and charge-details-hldr
 	    $("#charge-details-hldr").html('');
 	   	if(myjson && myjson.chargeList)
	    $("#chargeListBodyTemplate").tmpl(myjson.chargeList).appendTo("#charge-details-hldr");
	    
 	   if(typeof myjson.quotedBy!="undefined"){
 	  		var salesRep = myjson.quotedBy.userId + " - " + myjson.quotedBy.firstName + " " + myjson.quotedBy.lastName;
 	  		$('#salesRepDetails').text(salesRep);
 	  	}
		
 	   	// set sales area, changed by Ganeshan 8th Feb.
		//SUPPORT-MIL-223-170216
	    $('#salesArea').text(typeof myjson.customerSalesAreaCurrencyVo=="undefined"?"-":myjson.customerSalesAreaCurrencyVo.description);
 	   	
 	   	
	    //Setting ChargeList Header
	    $("#charge-details-hldr-header").html('');
	    if(myjson)
	    $("#chargeListTemplateHeader").tmpl(myjson).appendTo("#charge-details-hldr-header");
	    
	    //Setting ChargeList Footer
	    $("#charge-details-hldr-footer").html('');
	    if(myjson)
	    $("#chargeListTemplateFooter").tmpl(myjson).appendTo("#charge-details-hldr-footer");
	    
	    /* Commented to not to show attachment */
	    $('#attachedFile').text(typeof myjson.attachedFileName=="undefined"?'-':myjson.attachedFileName);
	    
	    $('#attachedFile').on('click', function(){
	    	var fileName = $('#attachedFile').text();
	    	window.location.href = 'exportattachedfileforquoteorder?childCartId='+myjson.childCartId+'&fileName='+fileName;
	    })  
		hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
		valueHideOrShow = ${hideOrShowFields}; 
		if (valueHideOrShow["show.order.multiples"] == "TRUE")
		{ 
			$(".order-multiples-lbl").show();
		}
		else
		{
			$(".order-multiples-lbl").hide();
		}
		 
	    $('#place-order').on('click',function(){
	     	if($(this).hasClass('not-active')){
	 		    return false;
	 		   }	
	     	window.location.href = 'quotetoorderinit?childCartId='+myjson.childCartId+'&isFromQuoteToOrder=true&organizationId='+${organizationId};
	     })
     });
     
     $('#re-quote').on('click', function(){
    	
         $('.modal-body').text("<spring:message code='label.viewquote.replace' javaScriptEscape='true'/>")
 		      $("#confirmationWindow").show();
 		            $("#confirmationWindow").draggable({
 		                handle: ".modal-header"
            });
     });
     
     
        
     // full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
	  var itemCategory=$("#headerName").text();
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
	  window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId);
     }
     
     
            
            $(".cancel").click(function(){
	    		$("#confirmationWindow").hide();
	    		return false;
			});
	    	
	    	  $(".ok").click(function(){
	    		  var myjson = ${cartDetailsJSON};
	    		  var childcartId=myjson.childCartId;
	    		  $("#confirmationWindow").hide();
	    	 		$.ajax({  
			            type : "Get",
			            data : {childCartId:childcartId},
			            contentType: 'application/json',
			            mimeType: 'application/json',
			            url : "reorder",
			            success : function(response) {
			            	if(response){
			            		getShoppingCartCount();
			            		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.success' javaScriptEscape='true'/>")
			    				$("#myModal").show();
		                        $("#myModal").draggable({
		                            handle: ".modal-header"
		                        });
			            	}
			            	else{
			            		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.fail' javaScriptEscape='true'/>")
			    				$("#myModal").show();
		                        $("#myModal").draggable({
		                            handle: ".modal-header"
		                        });
			            	}
			            },  
			            error : function(e) {   
			            }  
	    	 	   });
	    });
	    	  
	    	  $(".custom-close").click(function(){
	    	         $("#myModal").hide();
	    	      });

    </script>
</body>
</html>
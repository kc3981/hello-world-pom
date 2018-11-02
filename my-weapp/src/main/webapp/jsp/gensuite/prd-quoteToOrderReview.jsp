<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>


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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}"></script>
	
	<script type= "text/javascript" src = "../js/dealer.scripts.js" ></script>
<style>	
#promoAvailedDiv{
  display: none;
}
</style>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form id="quoteToOrderReview" method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li><a href="getquotes"><spring:message
								code="lable.quote.quotes" /></a></li>
					<li><a href="#"><spring:message
								code="view.label.quote.number" /><span id="breadcrumb-quote"></span></a></li>
					<li class="active"><spring:message
							code="label.cart.place.order" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

					<h3>
						<spring:message code="label.cart.place.order" />
						-
						<spring:message code="view.label.quote.number" />
						<span id="quoteNumber"></span>
					</h3>

					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.cart.place.order" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm" /></span></li>
					</ul>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
							<div class="form-inline col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<h5 class="inline" id="quoteToOrderCustomerDealerLabel">
									<spring:message code="label.quote.order.customer" />
									
								</h5>:
								<p class="inline" id="customerDetails"></p>
							</div>
							<div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<h5 class="inline">
									<spring:message code="label.quote.order.ponumber" />
									:
								</h5>
								<p class="inline" id="poNumber"></p>
							</div>
							<div
								class="form-static-data form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<h5 for="reference-no" class="inline">
									<spring:message code="label.quote.order.your.reference" />
									:
								</h5>
								<p class="inline" id="referenceNo"></p>
							</div>
							<div class="clearfix"></div>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 column-paddings">
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12" id="quoteToOrderBillTo">
									<div class="">
										<h5 class="inline">
											<spring:message code="label.quote.order.billto" />
											:
										</h5>
										<p class="inline" id="bill-to"></p>
									</div>
									<div class="clearfix"></div>
									<div class="address-holder">
										<p id="bill-to-addr"></p>
									</div>
								</div>
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="">
										<h5 class="inline">
											<spring:message code="label.quote.order.shipto" />
											:
										</h5>
										<p class="inline" id="ship-to"></p>
									</div>
									<div class="clearfix"></div>
									<div class="address-holder">
										<p id="ship-to-addr"></p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_PAYMENTTERMS',#organizationId)">
										<h5 class="inline" id="carrierBillingOptionLabel">
											<spring:message code="view.label.payment.terms"/>
											:
										</h5>
										<p class="inline" id="carrierBillingOption"></p>
										<br>
									</sec:authorize>
									<h5 class="inline">
										<spring:message code="label.quote.order.shipping.method" />
										:
									</h5>
									<p class="inline" id="carrierId"></p>
									<br>

									<c:if
										test="${not empty transportApplicable && transportApplicable}">
										<h5 class="inline">
											<spring:message code="label.quote.order.transport.code" />
											:
										</h5>
										<p class="inline" id="transportModeId"></p>
										<br>
									</c:if>

									<h5 class="inline">
										<spring:message code="view.label.sales.code" />
										:
									</h5>
									<p class="inline" id="salesCode">
										<spring:message code="label.createorderFromcartreview.po" />
									</p>
									<br>
									<p class="inline" id="paymentMethodId" hidden="true"></p>
									<br>
									<%-- <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')"> --%>
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_SALES_REP',#organizationId)">
										<h5 class="inline saleRepApplicable">
											<spring:message code="label.quote.order.sales.rep" />
											:
										</h5>
										<p class="inline" id="salesRepDetails"></p>
										<br>
									</sec:authorize>

									<h5 class="inline">
										<spring:message code="view.label.shipping.instructions" />
										:
									</h5>
									<p class="inline" id="shippingInst"></p>
								</div>
							</div>


							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
								<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
									<h5 class="inline">
										<spring:message code="view.label.name" />
										:
									</h5>
									<p class="inline" id="contactName"></p>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
									<h5 class="inline">
										<spring:message code="view.label.email" />
										:
									</h5>
									<p class="inline" id="contactEmail"></p>
								</div>
								<!-- SUPPORT-MIL-223-170216 -->
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 nopadding"
									id="salesAreaDiv">
									<h5 class="inline">
										<spring:message code="label.sales.area" />
										:
									</h5>
									<p class="inline" id="salesArea"></p>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					<c:out value="${renderHtml}" escapeXml="false" />

					<!--  div class="form-inline section" id="machine-serial-no">
                  	 
                    <div class="col-lg-4 col-md-4 col-sm-3 col-xs-12">
                        <h5 class="inline"><spring:message code="view.label.serial.no" /> : </h5>
                        <p class="inline" id="serialNumber"></p>
                    </div>

                    <div class="col-lg-8 col-md-8 col-sm-9 col-xs-12">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding-xs">
                            <h5 class="inline"><spring:message code="view.label.ship.complete" /> : </h5>
                            <p class="inline" id="partialShipment"></p>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding-xs">
                            <h5 class="inline"><spring:message code="view.label.ship.today" /> : </h5>
                            <p class="inline" id="shipToday"></p>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding-xs">
                            <h5 class="inline"><spring:message code="view.label.unit.down" /> : </h5>
                            <p class="inline" id="unitDown"></p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div-->

					<div class="">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<div id="cart-items-hldr"
								class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

							</div>

						</div>
						<div class="clearfix"></div>
						<c:if test="${properties['comments.section.required']==true}">
							<div class="section">
								<div class="clearfix">
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<h5 class="inline">
											<spring:message code="label.quote.order.comments" />
											:
										</h5>
										<p id="comments" class="inline"></p>
									</div>
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 attachment">
											<h5 class="inline">
												<spring:message code="view.label.attached.file" />
												:
											</h5>
											<p class="inline" id="attachedFile"></p>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
					<%-- <sec:authorize access="hasAnyRole('ROLE_CHANGE_SALES_REP','ROLE_APPLY_CHARGES')">
	                <div class="section" id="SALES_REP_SECTION">
	                    <div class="clearfix">
		                    <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
			                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                        <h5 class="inline"><spring:message code="view.label.sales.rep" /> : </h5>
			                        <p class="inline" id="salesRepDetails"></p>  
			                    </div>
		                    </sec:authorize>
		                    <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
			                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                        <h5 class="inline"><spring:message code="view.label.auto.apply.charges" /> : </h5>
			                        <p class="inline" id="autoApply"></p>  
			                    </div>
		                    </sec:authorize>
	                    </div>
	                </div>
				</sec:authorize> --%>
					<div class="quote-total">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">
								<spring:message code="label.quote.order.item.total.am" />
								(<span id="count"></span>
								<spring:message code="label.items" />
								)
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4" id="subTotal"></h5>
						</div>
						<!-- Start: Added By:Harish Bakale, GPD-2044, Reviewed by:Subbu -->
						<!-- manage Transport Mode discount coupon -->
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

							<div id="promoAvailedDiv">
								<div class="price">

									<h5
										class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8 discountPrice">
										<spring:message code="label.transport.mode.discount.amount" />
										(<span id="countDiscount"></span>
										%
										)
									</h5>

									<h5 style="text-align: right;"
										class="col-lg-2 col-md-2 col-sm-2 col-xs-4"
										id="discountGrandTotal"></h5>
								</div>
							</div>

						</div>
						<!-- Ends -->
						<!-- End: Added By:Harish Bakale, GPD-2044, Reviewed by:Subbu -->
						<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">Handling/Labor</p>
                        <p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">$98.00 </p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">Minimum Order Charge</p>
                        <p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">$28.00</p>
                    </div> -->
						<div id="chargesContainer"></div>



						<div id="additionalCharges" style="display: none">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
								<spring:message code="label.quote.sales.tax.am" />

							</h5>
							<h5
								class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right"
								id="taxVal"></h5>
						</div>


						<p class="alert-message pull-right" style="display: none;">
							<spring:message code="label.total.item.cart.msg" />
						</p>
						<input type="hidden" name="savedCardId" id="savedCardId" value="" />
						<div class="final-total col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-6 font20">
								<spring:message code="view.label.order.total" />
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-5 font20"
								id="totalAmount"></h5>
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a href="javascript:void(0);" class="pull-left green-button prev"
								id="edit-quote"><spring:message
									code="label.createorderFromcartreview.edit" /></a> <a
								href="javascript:void(0);" id="confirm-order"
								class="pull-right green-button next"><spring:message
									code="label.brand.confirm" /></a>
							<p class="taxp">
								<spring:message code="message.quote.tax.disclaimer" />
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>
		</form>
		 <form id='frmCheckOut' name='frmCheckOut' action="#" method='post'>
			<input type='hidden' id="merchant-id" name='AID' value="" /> <input
				type='hidden' id="merchant-pass" name='PWD' value="" /> <input
				type='hidden' id="merchant-name" name='Name' value="" /> <input
				type='hidden' id="merchant-add" name='Address' value="" /> <input
				type='hidden' id="merchant-email" name='Email' value="" /> <input
				type='hidden' id="merchant-amount" name='Amount' value="" /> <input
				type='hidden' id="merchant-curr" name='Currency' value="" /> <input
				type='hidden' name='TestMode' value="N" /> <input type='hidden'
				name='TransactionType' value='4'> <input type='hidden'
				name='Tokenize' value='true'>
			<input type='hidden' id="isguestuser" name='IsGuestUser' value="" />
			<input type='hidden' name='Callback' value='${properties["focus.callback"]}' />
			<input type='hidden' id="branding" name='Branding' value="" />
			<input type='hidden' id="UserId" name='UserId' value="" />
		</form>

		<!--Payment Type 4 request form //Smarter Commerce - MIL-201-->
		<form id='frmCheckOutwithquote' name='frmCheckOutwithquote' action=""
			method='post'>
			<input type='hidden' id="orgCode" name='OrganizationCode' value="" />
			<input type='hidden' id="usrName" name='UserName' value="" /> <input
				type='hidden' id="addLine1" name='AddressLine1' value="" /> <input
				type='hidden' id="addLine2" name='AddressLine2' value="" /> <input
				type='hidden' id="addLine3" name='AddressLine3' value="" /> <input
				type='hidden' id="addLine4" name='AddressLine4' value="" /> <input
				type='hidden' id="city1" name='City' value="" /> <input
				type='hidden' id="country1" name='Country' value="" /> <input
				type='hidden' id="fax1" name='Fax' value="" /> <input type='hidden'
				id="name1" name='Name' value="" /> <input type='hidden' id="phone1"
				name='Phone' value="" /> <input type='hidden' id="postalCode1"
				name='PostalCode' value="" /> <input type='hidden' id="state1"
				name='State' value="" /> <input type='hidden' id="carrierCode"
				name='CarrierCode' value="" /> <input type='hidden' id="company1"
				name='Company' value="" /> <input type='hidden' id="customerPO"
				name='CustomerPO' value="" /> <input type='hidden'
				id="quoteNumber1" name='QuoteNumber' value="" /> <input
				type='hidden' id="amount1" name='Amount' value="" /> <input
				type='hidden' id="currency1" name='Currency' value="" /> <input
				type='hidden' id="isguestuser1" name='IsGuestUser' value="" /> <input
				type='hidden' name='Callback'
				value='${properties["focus.callback"]}' />
		</form>
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
		<!-- GPD-5068 -->
	  <div class="modal bs-example-modal-md" id="warningWindow" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<!-- <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button> -->
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.warning" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content"></p>
						</div>
						<div class="modal-footer">
						 <a class="col btn ok" href="javascript:;"><spring:message
									code="label.myaccount.ok" /></a>
						</div>
					</div>
				</div>
			</div>
		
		<!-- gensuite_checkout_popup orderdetails_hldr  -->
		<div class="modal checkout_popup" id="gensuite_checkout_popup" data-backdrop="static" data-keyboard="false">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.gensuitecreditcard.popup" />
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<div class="orderdetails_hldr">
								<div class="row">
									<div class="col-md-3">
										<spring:message code="label.gensuitecreditcard.popup.card" />
									</div>
									<div class="col-md-8">
										<select class="form-control checkout_selectcard">
										</select>
									</div>
								</div>
								<div class="row mtop10">
									<div class="col-md-11">
										<button id="Checkout_btn"
											class="btn btn-buynow cart-small pull-right"
											style="height: 35px;">
											<spring:message
												code="label.gensuitecreditcard.popup.continuebutton" />
										</button>
									</div>
								</div>

							</div>
						</div>
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
						<p class="dialog-content"></p>
					</div>
					<div class="modal-footer">
						<a class="col btn cancel" href="javascript:;"><spring:message
								code="label.bulkpartupload.cancel" /></a> <a
							class="col btn ok" href="javascript:;"><spring:message
								code="label.myaccount.ok" /></a> <input type="hidden"
							id="confirmBoxType" />
					</div>
				</div>
			</div>
		</div>
		<!-- footer container -->
		<footer>
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
		<div class="paymentLoader" style="display: none">
			<div class="loader-content">
				<h4>
					<spring:message code="label.payment.loading" />
					...
				</h4>
				<div class="loader"></div>
			</div>
		</div>
	</div>

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
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script id="createQuoteTemplate" type="text/x-jquery-tmpl">

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details xs_img_center">
                                <div class="col-lg-2 col-md-2 col-sm-3">
									{{if mediaId!=0}}
                               			<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="catalog-img"></a>
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-5 col-sm-4 col-xs-12 pt-xs-10">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="search.part.partnumber"/>: ${'${'}partNumber}</a></h4>
									 <%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Rajesh --%>
									<c:if test="${properties['display.legacy.part']}">
										<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div> 
									</c:if>
                                    <div><strong>${'${'}partCommercialDescription}</strong></div>
												           <%-- <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> --%>
								   <sec:authorize access="@customSpringSecurity.hasDivisionPermission('ROLE_ENGG_DESC',#organizationId)">
                                    	<div>${'${'}partEngineeringDescription}</div>
									</sec:authorize>
									 <!-- Start: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
									{{if typeof(obsoletePartNumber) != "undefined" && obsoletePartNumber!=''}}
									<div id="cartSuperseeded"><spring:message code="search.part.superseededpartnumber" />${'${'}obsoletePartNumber} </div>
									{{/if}}
									<!--End: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
                                    <div>${'${'}organizationName}</div>
                                    <div><strong>${'${'}inventoryMessage}</strong></div> 
                                    <div class="product-comments item-comments" comment-itemId="${'${'}partId}">
                                        <h5><spring:message code="view.label.comments"/>: </h5>
                                        <p>${'${'}comments}</p>
                                    </div>
								<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2">
								<div class="spinner-control">
                                      <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:50px;text-align:center" readonly>
                                      <span class="unit pos_relative_xs">${'${'}uom}</span> 
                                 </div>
								</div>

                                <div class="col-lg-2 col-md-3 nopadding">
									{{if priceMSRP>=0 && priceMSRPStr!=priceStr}}
                                    	<div>{{if priceMSRP}}<spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span>{{/if}}</div>
									{{/if}}
                                    <div><strong><spring:message code="label.your.price"/>: ${'${'}priceStr} ${'${'}currencyCode}</strong></div>
									{{if savedPrice>=0 && priceMSRPStr!=priceStr}}
                                    	<div>{{if priceMSRP}}<spring:message code="label.save"/>: ${'${'}savedPriceStr}  ${'${'}currencyCode} <spring:message code="lable.item.each" />{{/if}}</div>
									{{/if}}
                                    <div><h5><spring:message code="label.item.total"/>: ${'${'}itemTotalAmountStr}  ${'${'}currencyCode}</h5></div>
                                </div>
                            </div>

    </script>
	<script id="chargesTemplate" type="text/x-jquery-tmpl">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" >
			<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
			<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " data-chargeId="${'${'}chargeId}">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode}</p>
		</div>
	
	</script>

	<script>
	 var userid,authtoken,userName;    
   	 var defaultPartUOM = '${properties["default.part.uom"]}';
     var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
     var ordMult;
     var valueHideOrShow;
     var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
     userName = "${sessionScope['scopedTarget.genericUserProperties'].user.userName}";
    
    $(document).ready(function(){
    	 $("#myModal").hide();
    	userid=$('#userId').val();
		authtoken = $('#authToken').val();
    	var quote = '${orderReview}';
    	var isGuestUser = '${isGuestUser}';
      	var quoteJson = JSON.parse(quote);
      	console.log(quoteJson.cartItemList);
      	var locale=${locale};
      	
      	if (window.history && window.history.state) {

        	 /*  window.history.pushState('forward', null, './#forward'); */
        	  window.history.state('forward', null, 'quotetoorderinit?childCartId='+quoteJson.childCartId+'&isFromQuoteToOrder=false&organizationId='+quoteJson.organization.organizationId);

        	  $(window).on('popstate', function() {
        	   window.location.href = 'quotetoorderinit?childCartId='+quoteJson.childCartId+'&isFromQuoteToOrder=false&organizationId='+quoteJson.organization.organizationId;
        	  });

        	}
      	
      	 if(typeof quoteJson.isGuestChildCart!="undefined" && quoteJson.isGuestChildCart){
    		$("#SALES_REP_SECTION").hide();
    	 }
      	
      	 $("#createQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
         $('#count').text(quoteJson.cartItemList.length);
         
         if(quoteJson.cartItemList.length>0){
        	 $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.cartItemList[0].currencyCode);
         }else{
        	 $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.currencyCode);
         }
         
     	var fields = JSON.parse('${hideOrShowFields}');
         if(typeof quoteJson.taxAmount!="undefined" &&  fields["show.sales.tax"] == "TRUE" && quoteJson.taxAmountStr != "-1" ){		      	  
  				$('#additionalCharges').show();
			    $('#taxVal').text(quoteJson.taxAmountStr+ " ");
			   	$('#taxVal').append(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode);
		}
         
         
        hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
 		valueHideOrShow = ${hideOrShowFields};
 		
 		//ordMult = quoteJson.cartItemList[0].orderMultiple;
     	
         if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
     	 	$(".order-multiples-lbl").show();
         }else{$(".order-multiples-lbl").hide();
         }
		 
		 console.log(quoteJson);
		 if((typeof quoteJson.chargeList)!="undefined"){
			 $("#chargesContainer").html('');
	         $("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
		 }
		 if(isDealerUser=='true'){
			 updateDealerAndBillToForQuoteToOrder();
		 }
		setDataForReview(quoteJson);
		
    	$('.total-items-review').prop('disabled','true');
    	if(typeof quoteJson.orderedBy!="undefined"){
    		var salesRep = quoteJson.orderedBy.userId + " - " + quoteJson.orderedBy.firstName + " " + quoteJson.orderedBy.lastName;
	    	$('#salesRepDetails').text(salesRep);
    	}
    	
    	/*Start: Added By:Harish Bakale, GPD-2044, Reviewed by:Subbu*/
	       if(quoteJson.discountApplicableFlag){
	    	   $('#promoAvailedDiv').show();
	           $('#countDiscount').text(quoteJson.discountFromCoupon);
	           $('#discountGrandTotal').html(quoteJson.totalDiscountStr +" "+ quoteJson.currencyCode);
	       }else{
	    	     $('#promoAvailedDiv').hide();
	       }
	      /*End: Added By:Harish Bakale, GPD-2044, Reviewed by:Subbu*/
	       
    	$('#comments').text(quoteJson.comments==""?"-":quoteJson.comments);
    	$('#autoApply').text(quoteJson.autoApplyCharges?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
    	
    	 if(quoteJson.cartItemList.length>0){
        	 $('#totalAmount').text(quoteJson.totalAmountStr+" "+quoteJson.cartItemList[0].currencyCode);
         }else{
        	 $('#totalAmount').text(quoteJson.totalAmountStr+" "+quoteJson.currencyCode);
         }
    	
    	//ERROR MESSAGE 	
    	  if($("#payment-result").val()== "true"){
        	 var msg1="<spring:message code='label.payment.fail.msg' javaScriptEscape='true'/>"
   			  var msg='${paymentResultMsg}';//As Girish suggested
        	 if(msg != ""){
   			  msg1 = msg;
   		  	}
             $('#myModal .modal-body').text(msg1);
  			$("#myModal").show();
            $("#myModal").draggable({
                handle: ".modal-header"
            });
  	    }	
    	
    	  $('#edit-quote').on('click', function(){
      		window.location.href = 'quotetoorderinit?childCartId='+quoteJson.childCartId+'&isFromQuoteToOrder=false&organizationId='+quoteJson.organization.organizationId;
      	})
   	 	hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
   	 	
   	 	var amount = 0;
		if(isGuestUser=="true")
			amount=quoteJson.totalMSRP;
		else
			amount=quoteJson.totalAmount;
   	 	
   	 $("#gensuite_checkout_popup  #Checkout_btn").on("click", function(e){
    		e.preventDefault();
 		var cardId = $('.checkout_selectcard').val();
 		if($("#paymentMethodId").val()=="2"){
			$("#merchant-amount").val(amount); 
			$("#merchant-curr").val(quoteJson.cartItemList[0].currencyCode); 
	    	$.ajax({
	            type : "Get",
	            url : 'getmerchantdetails',
	            cache: false,
	            success : function(data) {
                    $('.pageLoader').hide();
	            	var response = jQuery.parseJSON(data);
	            	console.log(response);
	            	if(response!="Merchant Details Not Found"){
	            		if(response.merchantName == "Paymetric"){
	                 		$('#quoteToOrderReview').attr("action","checkout");
	         				$('#quoteToOrderReview').submit();
	            		}else{
	            			if(cardId=="New Card"){
		            			$("#frmCheckOut").attr("action",response.paymentGatewayUrl);
	        	            	$("#merchant-id").val(response.merchantId);
	        	            	$("#branding").val(response.brand);
	        	            	$("#merchant-pass").val(response.merchantPassword);
	        	            	$("#merchant-name").val(response.merchantName);
	        	            	$("#UserId").val(userName);
	        	            	if(isGuestUser=="true")
	        	            		$("#isguestuser").val('1');
	        	            	else
	        	            		$("#isguestuser").val('0');
	        					console.log(response);
	        					$("#frmCheckOut").submit();	
		            		}else{
		            			window.location.href="authorization?organizationId="+quoteJson.organization.organizationId+"&cardId="+cardId;
		            		}
		            	}
 	            		//////////////////
	            	}else
	            	  window.location.href="createorderreviewpayment";  
	            
	            },  
	            error : function(e) {  
	            }  
	          });
	}	else if($("#paymentMethodId").val()=="4" && cardId!=null){
 			e.preventDefault();
       		var cardId = $('.checkout_selectcard').val();
       		if(cardId=="New Card"){
       			 smarterCommerceWithQuoteNumber(quoteJson);
       		}else if(quoteJson.paymentMethod.paymentMethodId==3){
       			window.location.href="authorizePaymentForSmarterCommerce?organizationId="+quoteJson.organization.organizationId+"&cardId="+cardId;
       		}else if(quoteJson.paymentMethod.paymentMethodId==4){
       			window.location.href="authorizepaymentforaftermarket?organizationId="+quoteJson.organization.organizationId+"&cardId="+cardId;
       		}
 		}else{
 			window.location.href="createorderfromquoteconfirm";
 		}
 	});
   	 	
   	 	
    	  $("#confirm-order").click(function(){       	
        		
           	//GPD-5068    		
    		//GPD-5068    			
      		console.log('shipToAddressCountry : '+quoteJson.shipToAddress.addressCountry);
      		console.log('shipToAddressState : '+quoteJson.shipToAddress.addressState);    		
      		if((quoteJson.shipToAddress.addressCountry=="US" || quoteJson.shipToAddress.addressCountry=="USA" || quoteJson.shipToAddress.addressCountry=="UNITED STATES") && quoteJson.shipToAddress.addressState=="CA"){
      	  		  $('#warningWindow .modal-body').html("<spring:message code='label.warning.message' javaScriptEscape='true'/>");
      	          $("#warningWindow").show();    	          
      		}else{
       			confirmOrder(quoteJson);  			
       		}
           		
          });
    	  
    	
          });
	
	function setDataForReview(quoteJson){
 		$('#quoteNumber').text(quoteJson.quoteNumber);
		$('#breadcrumb-quote').text(quoteJson.quoteNumber);
		$("#breadcrumb-quote").parent().attr("href","getquote?childCartId="+quoteJson.childCartId+"&organizationId="+quoteJson.organization.organizationId);
		//$('#customerDetails').text(quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
		$('#customerDetails').text(((typeof quoteJson.isGuestChildCart!="undefined") && quoteJson.isGuestChildCart)?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
		$('#poNumber').text((typeof quoteJson.customerPurchaseOrderNumber=="undefined")?" - ":quoteJson.customerPurchaseOrderNumber);
		$('#referenceNo').text(quoteJson.cartName==""?"-":quoteJson.cartName);
		$('#bill-to').text(((typeof quoteJson.billToAddress.addressReference=="undefined"))?quoteJson.billToAddress.addressName:quoteJson.billToAddress.addressReference+" - "+quoteJson.billToAddress.addressName);
		$('#ship-to').text(((typeof quoteJson.shipToAddress.addressReference=="undefined"))?quoteJson.shipToAddress.addressName:quoteJson.shipToAddress.addressReference+" - "+quoteJson.shipToAddress.addressName);
		$('#carrierId').text(typeof quoteJson.carrier=="undefined"?"-":quoteJson.carrier.carrierDescription);
		$('#transportModeId').text(typeof quoteJson.transportMode=="undefined"?"-":quoteJson.transportMode.transportDescription);
 		$('#salesCode').text(typeof quoteJson.paymentMethod=="undefined"?"-":quoteJson.paymentMethod.description);
 		$('#paymentMethodId').val(typeof quoteJson.paymentMethod=="undefined"?"-":quoteJson.paymentMethod.paymentMethodId);
		$('#carrierBillingOption').text(typeof quoteJson.carrierBillingOption=="undefined"?"-":quoteJson.carrierBillingOption.description);
		var userApplication = $('#userApplication').val();
		if(userApplication == "REVFIRE"){
			$("#carrierBillingOption").hide();
			$("#carrierBillingOptionLabel").hide();
			
		}
		if(typeof quoteJson.carrierBillingOption !="undefined" && quoteJson.carrierBillingOption.description == "Prepay and Add"){
			$('#carrierId').hide();
			//$('#transportModeId').hide();
			$('#carrierId').prev().hide();
			//$('#transportModeId').prev().hide();
		}
		$('#shippingInst').text(quoteJson.deliveryInstructions1==""?"-":quoteJson.deliveryInstructions1);
		$('#contactName').text(((quoteJson.contact.fullName=="") || (quoteJson.contact.fullName=="undefined"))?"-":quoteJson.contact.fullName);
		$('#contactEmail').text(((quoteJson.contact.primaryEmail=="") || (quoteJson.contact.primaryEmail=="undefined"))?"-":quoteJson.contact.primaryEmail);
		$('#serialNumber').text(quoteJson.serialNumber==""?"-":quoteJson.serialNumber);
		$('#partialShipment').text(quoteJson.partialShipment?"<spring:message code='label.export.no' javaScriptEscape='true'/>":"<spring:message code='label.export.yes' javaScriptEscape='true'/>");
		$('#shipToday').text(quoteJson.isSameDayShipping?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		$('#unitDown').text(quoteJson.machineBreakdown?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		$('#bill-to-addr').html(setAddress(quoteJson.billToAddress));
		$('#ship-to-addr').html(setAddress(quoteJson.shipToAddress));
		//Commented to not to show attachment
		//$('#attachedFile').html(typeof quoteJson.attachedFileName=="undefined"?'-':quoteJson.attachedFileName);
		// set sales area, changed by Ganeshan 8th Feb.
		//SUPPORT-MIL-223-170216
    	$('#salesArea').text(typeof quoteJson.customerSalesAreaCurrencyVo=="undefined"?"-":quoteJson.customerSalesAreaCurrencyVo.description);
		
    	consignmentOrderStatusInViews(quoteJson.customer.customerTypeId);
		$('#consignment-order').text(quoteJson.consignmentOrder?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		
	}
	
	  function appendCards(customerCardDetails){
    		var doc = $('.checkout_selectcard');
   			
   			doc.find('option').remove();
   			var opt = $("<option value='New Card'>New Card</option>");
   			opt.attr("selected","selected");
   		 	doc.append(opt);
   		 	if(isGuestUser=="false"){
	  	   		 	for(var i=0; i<customerCardDetails.length;i++){
	  	    			   var opt = $("<option></option>");
	  	                opt.text(customerCardDetails[i].displayValue);
	  	                opt.val(customerCardDetails[i].cardId);
	  	      	       doc.append(opt);
	  	     	    } 
   		 	}
    	}
	  //GPD-5068
	  $("#warningWindow .ok").click(function(){
   	  $("#warningWindow").hide();   	  
	  var quote = '${orderReview}';
	  var isGuestUser = '${isGuestUser}';
	  var quoteJson = JSON.parse(quote);
  	
   	  confirmOrder(quoteJson);
     });
	 function confirmOrder(quoteJson){
		  $('div.pageLoader').show(); 
		  var paymentMethodId = $("#paymentMethodId").val();
 		
 		<c:if test="${properties['user.application']=='STANDALONE'}">
   		 if((paymentMethodId == "2")){
   		//don't show popup of saved card
   			window.location.href="createorderfromquoteconfirm";
    			
   		}else{
   			window.location.href="createorderfromquoteconfirm";
   		}
   		</c:if>
   		
   		<c:if test="${properties['user.application']!='STANDALONE'}">
    		 if((paymentMethodId == "2")){
    		//don't show popup of saved card
     			$('div.pageLoader').hide(); 
     		  	if(isGuestUser=="true"){
     			$('#cartToOrderReview').attr("action","checkout");
					$('#cartToOrderReview').submit();
     			}else{
     			 customerCardDetails = quoteJson.customerCardDetails;
     			}
     			appendCards(customerCardDetails);
     			$("#gensuite_checkout_popup").show()  ;
     	
    		}else{
				//Missed during merge added for GSP-922
    			$("#confirm-order").addClass('not-active');
	            $("#confirm-order").blur();    //INC-2424 ADDED BY ANIKET : TO PREVENT DUPLICATE ORDER CREATION : REVIEWED BY JK
    			window.location.href="createorderfromquoteconfirm";
    		}
    		</c:if> 
	  }
	function setAddress(obj){
       	    var string="";
       	    string+= ((obj.addressName ===null || typeof obj.addressName==="undefined" || obj.addressName.trim() === "" )?"":obj.addressName+"<br/>");
  			string+=((obj.addressLine1===null || typeof obj.addressLine1==="undefined" || obj.addressLine1.trim()===""  )?"":obj.addressLine1+"<br/>");
  			string+=((obj.addressLine2===null || typeof obj.addressLine2==="undefined" || obj.addressLine2.trim()==="" )?"":obj.addressLine2+"<br/>");
  			string+=((obj.addressLine3===null || typeof obj.addressLine3==="undefined" || obj.addressLine3.trim()==="" )?"":obj.addressLine3+"<br/>");
  			string+=((obj.addressLine4===null || typeof obj.addressLine4==="undefined" || obj.addressLine4.trim()==="" )?"":obj.addressLine4+"<br/>");
  			string+=((obj.addressCity===null || typeof obj.addressCity==="undefined" || obj.addressCity.trim()==="" )?"":obj.addressCity+"<br/>");
  			string+=((obj.addressState===null || typeof obj.addressState==="undefined" || obj.addressState.trim()==="" )?"":obj.addressState+" ");
  			string+=((obj.addressZipCode===null || typeof obj.addressZipCode==="undefined" ||obj.addressZipCode.trim()=== ""  )?"":obj.addressZipCode);
  			if((obj.addressZipCode===null || typeof obj.addressZipCode==="undefined" ||obj.addressZipCode.trim()=== ""  ))
  				string = string.trim();
  			
  			if((obj.addressState===null || typeof obj.addressState==="undefined" || obj.addressState.trim()==="" ) && 
  					(obj.addressZipCode===null || typeof obj.addressZipCode==="undefined" ||obj.addressZipCode.trim()=== ""  ))
  				string += obj.addressCountry;
			else
  				string+=((obj.addressCountry===null || typeof obj.addressCountry==="undefined" || obj.addressCountry.trim()==="" )?"":", "+obj.addressCountry);
       	    return string; 
      }

    	//Call payment gateway 
    	
    	
        $(".custom-close").click(function(){
 		   $("#myModal, #gensuite_checkout_popup").hide();
 		});
        
     /* 	// full item details page redirect onclick line items
    	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
       	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
       		window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId,'_blank');
         } */
       
    </script>
	<script>
    /*Form sumbit for payment type 4 //Smarter Commerce - MIL-201*/
    function smarterCommerceWithQuoteNumber(quoteJson){
    	var isGuestUser = '${isGuestUser}';
    	$.ajax({
            type : "Get",
            url : 'getmerchantdetails',
            cache: false,
            success : function(data) {
               // $('.pageLoader').hide();
            	var response = jQuery.parseJSON(data);
            	console.log(response);
            	
            	if(response!="Merchant Details Not Found"){
            		$("#frmCheckOutwithquote").attr("action",response.paymentGatewayUrl); 
					$("#orgCode").val(quoteJson.organization.organizationId);   
					$("#addLine1").val(quoteJson.billToAddress.addressLine1);
					$("#addLine2").val(""); 
					$("#addLine3").val(""); 
					$("#addLine4").val(""); 
					$("#city1").val(""); 
					$("#country1").val(""); 
					$("#fax1").val(""); 
					$("#phone1").val(""); 
					$("#postalCode1").val(quoteJson.billToAddress.addressZipCode); 
					$("#state1").val(""); 
					$("#carrierCode").val(quoteJson.carrier.carrierReference); 
					$("#company1").val(quoteJson.branchPlant.companyReference); 
					$("#customerPO").val("CREDIT CARD"); 
					$("#quoteNumber1").val(quoteJson.quoteNumber);
					$("#amount1").val(quoteJson.totalAmount);
					$("#currency1").val(quoteJson.currencyCode); 
					if(isGuestUser=="true"){
						$("#isguestuser1").val('1');
						$("#usrName").val(quoteJson.contact.primaryEmail);//code change for MIL-260 / INC-565
						$("#name1").val(quoteJson.billToAddress.addressName); //code change for MIL-260 / INC-565
					}
					else{
						$("#isguestuser1").val('0');
						$("#usrName").val(quoteJson.quotedBy.email);
						$("#name1").val(quoteJson.billToAddress.addressName); 
					}
					$("#frmCheckOutwithquote").submit();	
                }else
	            	  window.location.href="createorderreviewpayment";  
	            
	            },  
	            error : function(e) {  
	            }  
	          });
    }
    </script>
	<input type="hidden" id="payment-result" value="${paymentresult}" />
	<li hidden id="payment-message"><spring:message
			code="payment.result.failure" /></li>
</body>
</html>

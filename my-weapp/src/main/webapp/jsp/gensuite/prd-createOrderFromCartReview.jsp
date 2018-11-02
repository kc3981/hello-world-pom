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
<!-- build:css ../assets/globalstyles.min.css -->
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
<!-- /build -->
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
<!--  <link rel="shortcut icon" href="images/favicon.ico">
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
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer
	type="text/javascript"></script>
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
	type="text/javascript"></script>
<script
	src="../js/hideOrShowFields.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
	
<script type= "text/javascript" src = "../js/dealer.scripts.js" ></script>

<style>	
#promoAvailedDiv{
  display: none;
}
</style>
<sec:authorize access="hasRole('ROLE_DEALER_USER')" var="isDealerUser"></sec:authorize>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form id="cartToOrderReview" method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class="active"><spring:message code="lable.order.orders" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="label.cart.place.order" />
						- <span id="brandName"></span>
					</h3>
					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.choose" /></span></li>
						<li class="divider"><span class="success"></span></li>
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
							<div class="form-inline col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<h5 class="inline" id="customer_dealer_name">
									<spring:message code="label.quote.order.customer" />
									:
								</h5>
									<p class="inline" id="customerDetails"></p>
							</div>
							<div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.createorderFromcartreview.po" />
									:
								</h5>
								<p class="inline" id="poNumber"></p>
							</div>
							<div
								class="form-static-data form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.quote.order.your.reference" />
									:
								</h5>
								<p class="inline" id="referenceNo"></p>
							</div>
							<div class="clearfix"></div>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 column-paddings">
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12"  id="billToReview">
									<div class="">
										<h5 class="inline">
											<spring:message code="label.quote.order.billto" />
											:
										</h5>
										<!-- <p class="inline" id="bill-to"></p> -->
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
										<!-- <p class="inline" id="ship-to"></p> -->
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
										<h5 class="inline">
											<spring:message code="invoice.label.terms" />
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
										<spring:message code="label.quote.order.sales.code" />
										:
									</h5>
									<p class="inline" id="salesCode">
										<spring:message code="label.quote.order.ponumber" />
									</p>
									<br>
									<p class="inline" id="paymentMethodId" hidden="true"></p>
									<br>
									<%-- <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')"> --%>
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_SALES_REP',#organizationId)">
										<!-- SUPPORT -OM-543 030216 -->
										<h5 class="inline saleRepApplicable">
											<spring:message code="label.quote.order.sales.rep" />
											:
										</h5>
										<p class="inline" id="salesRepDetails"></p>
										<br>
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
										<spring:message code="label.quote.order.shipping.inst" />
										:
									</h5>
									<p class="inline" id="shippingInst"></p>
								</div>
							</div>


							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.quote.order.name" />
									:
								</h5>
								<p class="inline" id="contactName"></p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.quote.order.email" />
									:
								</h5>
								<input type="hidden" id="ordermultiple" />
								<p class="inline" id="contactEmail"></p>
							</div>

						</div>
						<div class="clearfix"></div>
					</div>

					<c:out value="${renderHtml}" escapeXml="false" />


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
	                <div class="section" id = "SALES_REP_SECTION">
	                    <div class="clearfix">
		                    <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
			                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                        <h5 class="inline"><spring:message code="label.quote.order.sales.rep"/> : </h5>
			                        <p class="inline" id="salesRepDetails"></p>  
			                    </div>
		                    </sec:authorize>
		                    <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
			                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                        <h5 class="inline"><spring:message code="label.quote.order.auto.apply.charge"/> : </h5>
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
								<spring:message code="label.quote.order.items" />
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
						
						<div id="chargesContainer"></div>
						<div id="additionalCharges" style="display: none">

							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
								<spring:message code="label.quote.sales.tax.am" />
								<h5
									class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40"
									id="taxVal"></h5>
						</div>
						<p class="alert-message pull-right" style="display: none;">
							<spring:message code="label.total.item.cart.msg" />
						</p>
							
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
								id="edit-order"><spring:message
									code="label.createorderFromcartreview.edit" /></a> <a
								href="javascript:void(0);" id="order-confirm"
								class="pull-right green-button next"><spring:message
									code="label.createorderFromcartreview.orderconfirm" /></a>
							<p class="taxp">
								<spring:message code="message.quote.tax.disclaimer" />
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>

			<!-- gensuite_checkout_popup orderdetails_hldr  -->
			<div class="modal checkout_popup" id="gensuite_checkout_popup"  data-backdrop="static" data-keyboard="false">
				<div class="vertical-alignment-helper">
					<div class="modal-dialog vertical-align-center">
						<div class="modal-content custom-modal-content">
							<div class="modal-header custom-modal-header">
								<button type="button" class="close custom-close"
									aria-hidden="true">
									<i class="fa fa-times"></i>
								</button>
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

			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="myModal"  data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close"
								data-dismiss="modal" aria-hidden="true">
								<i class="fa fa-times"></i>
							</button>
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
			<input type="hidden" name="savedCardId" id="savedCardId" value="" />
			
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
			
			<!-- custome confirm alert -->
				<div class="modal bs-example-modal-md" id="confirmationWindow"  data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
          <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
               <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button> 
              <h4 class="modal-title custom-modal-title"><spring:message code="label.cart.confirm" /></h4>
            </div>
            <div class="modal-body confirm-modal-body">
              <!-- Content for the dialog / modal goes here. -->
                <p class="dialog-content"></p>
            </div>
            <div class="modal-footer">
                <a class="col btn cancel" href="javascript:;"><spring:message code="label.bulkpartupload.cancel" /></a>
                <a class="col btn delete-ok ok" href="javascript:;"><spring:message code="label.bulkpartupload.ok" /></a>
                <input type="hidden" id="confirmBoxType"/> 
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
		</form>
	</div>
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
			name='Tokenize' value='true'> <input type='hidden'
			id="isguestuser" name='IsGuestUser' value="" />
			<input type='hidden' id="branding" name='Branding' value="" />
			<input type='hidden' id="UserId" name='UserId' value="" />
		<!--<input type='hidden' name='Callback' value="http://shoppingcart.com/transactstatus.aspx" /><br/>-->
		<input type='hidden' name='Callback'
			value='${properties["focus.callback"]}' />
	</form>
	<!-- Javascript Plugins -->

	<script id="createQuoteTemplate" type="text/x-jquery-tmpl">

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details xs_img_center">
                                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
									{{if mediaId!=0}}
                               			<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})">
										<%--INC-2498 fix starts(Developed by : Swetha)--%>
											<img id="image" src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="catalog-img">
												{{if !isActualImage}}
													<div class="waterMarkForOrderReview">
														<span style="font-size: 8px;margin: 10px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
														<span style="font-size: 7px;margin: 12px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
													</div>
												{{/if}}
											</a>
										<%--INC-2498 fix ends--%>
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-4 col-sm-4 col-xs-12">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a></h4>
									<%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
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
                                    <div class="b-label">
									<c:if test="${properties['display.organizationName']}">
                                    <div>${'${'}organizationName} Part</div>
									</c:if>
                                    <!-- <div><strong>${'${'}availableQuantity} In Stock</strong></div> -->
								 	<div><strong>${'${'}inventoryMessage}</strong></div>
									
                                    </div>
									<p class="order-multiples-lbl"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>${'${'}orderMultiple}</p>
                                   <c:if test="${properties['item.comments.section.required']==true}">
				    <div class="product-comments item-comments" comment-itemId="${'${'}partId}">
                                        <h5><spring:message code="label.quote.order.comments" />: </h5>
                                        <p>${'${'}comments}</p>
                                    </div></c:if>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2">
								<div class="spinner-control" data-ordermultiplekey="">
                                      <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:40px;text-align:center" readonly>
                                      <span class="unit unit_2_xs">${'${'}uom}</span> 
                                 </div>
								</div>
                                <div class="col-lg-3 col-md-3 col-sm-3 nopadding">
									<c:choose>
                       		 			<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
											
											{{if priceMSRPStr !== "-1"}}
                                    			<div><spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
											{{/if}}
											{{if itemTotalMSRPStr !== "-1"}}
												<div><h5><spring:message code="label.shoppingcart.total" />: ${'${'}itemTotalMSRPStr}  ${'${'}currencyCode}</h5></div>
											{{/if}}
										</c:when>
										<c:otherwise>
											
											{{if priceMSRPStr !== "-1"}}
                                    			<div><spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
											{{/if}}
											{{if priceStr !== "-1"}}
                                    			<div><strong><spring:message code="label.item.yourPrice" />: ${'${'}priceStr} ${'${'}currencyCode}</strong></div>
											{{/if}}
											{{if savedPriceStr !== "-1"}}
                                    			<div><spring:message code="lable.item.youSave" />: ${'${'}savedPriceStr}  ${'${'}currencyCode} <spring:message code="lable.item.each" /></div>
											{{/if}}

											{{if itemTotalAmountStr !== "-1"}}
												<div><h5><spring:message code="label.shoppingcart.total" />: ${'${'}itemTotalAmountStr}  ${'${'}currencyCode}</h5></div>
											{{else}}
												{{if itemTotalMSRPStr !== "-1"}}
													<div><h5><spring:message code="label.shoppingcart.total" />: ${'${'}itemTotalMSRPStr}  ${'${'}currencyCode}</h5></div>
												{{/if}}
											{{/if}}
										</c:otherwise>
									</c:choose>

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
    var valueHideOrShow; 
    
    
    var defaultPartUOM = '${properties["default.part.uom"]}';
    var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
    var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
    userName = "${sessionScope['scopedTarget.genericUserProperties'].user.userName}";
    
    $(document).ready(function(){
    	  var ordMult ;
        $('.pageLoader').show();
        //Venkatasiva : GPD-3449
        hideOrShowTransportModeFieldsOrders('${hideOrShowFields}');
      /*  if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1){
            $('div.timeline').css({'margin':'33px 5% 7% 10%'});
          }*/
          
          //Added by Krupa
    	var searchString = '${breadcrumbsArray}';
    	$('#breadcrumbsArray').val(searchString);
    	var errorMessageFromERP = '${errorMessageFromERP}';
    
    	
		if(null !='${breadcrumbsArray}' || '${breadcrumbsArray}' != '' ){
	          var stringSplit = searchString.toString().split("$");
	          var previouspagebreadcrumb = "";
	          for(i=0;i<stringSplit.length;i++){
	           console.log(stringSplit[i]);
	           if(i !=0){
	        	   if(i==stringSplit.length-2){
	        		   previouspagebreadcrumb = previouspagebreadcrumb+","+stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
	        	   }else{
	           			previouspagebreadcrumb = previouspagebreadcrumb+","+stringSplit[i];
	        	   }
	           }else{
	        	   previouspagebreadcrumb = stringSplit[i];
	           }
	           if(stringSplit[i].indexOf('_') > 0){
	           		var name = stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
	           		var hrefLink = stringSplit[i].substring(stringSplit[i].indexOf("_")+1,stringSplit[i].length)
	           		if(hrefLink.indexOf('getfullitemdetails')==0){
	           			hrefLink = hrefLink+"&breadcrumbsArray="+previouspagebreadcrumb.toString().replace(new RegExp('#', 'g'), '%23');
	           		}
	           		//$(".breadcrumb > li:last-child()").before('<li><a href="'+hrefLink+'">'+name+'</a></li>'); 
	           }else{
	        	   $(".breadcrumb > li:last-child()").addClass("active");
	           }
	          }
		}
		// End of Added by krupa 
    	userid=$('#userId').val();
		authtoken = $('#authToken').val();
		var isGuestUser = '${isGuestUser}';
		
    	var quote = '${quoteReview}';
      	var quoteJson = JSON.parse(quote);
      	console.log(quoteJson.cartItemList);
      	var locale=${locale};
		
      	$('.total-items').val(quoteJson.cartItemList[0].quantity);
      	//Sales Rep -- SUPPORT OM-543 230216
      	if(!quoteJson.isDivisionMapped && quoteJson.isGuestChildCart){
      		$(".saleRepApplicable").hide();	
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
       	
		//Added by Ganeshan
		//SUPPORT-MIL-223-170216
      	hideOrShowFields('${hideOrShowFields}');
      	valueHideOrShow = ${hideOrShowFields};
      	
      	/*if (window.history && window.history.state) {

        	  window.history.state('forward', null, 'createorderfromcartinit?organizationId='+quoteJson.organization.organizationId+'&isFromCartBrand=false&isDivisionMapped='+quoteJson.isDivisionMapped); //+'&breadcrumbsArray='+searchString);
        	  $(window).on('popstate', function() {
        	   window.location.href = 'createorderfromcartinit?organizationId='+quoteJson.organization.organizationId+'&isFromCartBrand=false&isDivisionMapped='+quoteJson.isDivisionMapped; //+'&breadcrumbsArray='+searchString;
        	  });

        	}*/
      	
      	 $("#createQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
         $('#count').text(quoteJson.cartItemList.length);
        
         if(quoteJson.cartItemList.length>0){
           	 $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.cartItemList[0].currencyCode);
            }else{
           	 $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.currencyCode);
          }
         
		 if(typeof quoteJson.chargeList!="undefined"){
			 console.log(quoteJson.chargeList);
			 $("#chargesContainer").html('');
	         $("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
		 }
		
		setDataForReview(quoteJson);
		var fields = JSON.parse('${hideOrShowFields}');
		if(typeof quoteJson.taxAmount!="undefined" &&  fields["show.sales.tax"] == "TRUE" && quoteJson.taxAmount > 0 ){
			$('#additionalCharges').show();
	      	    $('#taxVal').text(quoteJson.taxAmount+ " ");
      	    $('#taxVal').append(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode);
		}
		
    	$('.total-items-review').prop('disabled','true');
    	if(typeof quoteJson.quotedBy!="undefined"){
    		var salesRep = quoteJson.quotedBy.userId + " - " + quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName;
    		$('#salesRepDetails').text(salesRep);
    	
    	}
    	
    	console.log('this is quotejson'+quoteJson);
    	$('#comments').text(quoteJson.comments==""?"-":quoteJson.comments);
    	$('#autoApply').text(quoteJson.autoApplyCharges?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
    	console.log(quoteJson.totalMSRPStr);
    	console.log(quoteJson.isGuestChildCart);
    	console.log(quoteJson.cartItemList.length);
       	if(quoteJson.cartItemList.length>0){
       		if( quoteJson.isGuestChildCart)
    		{
    			if(quoteJson.totalMSRPStr!="-1")
    			{
             	 	$('#totalAmount').text(quoteJson.totalMSRPStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
              	}
    			else
    			{
             	 	$('#totalAmount').text(" ");
              	}
    		}
    		else
    		{
    			if(quoteJson.totalAmountStr!="-1") 
    			{
             	 	$('#totalAmount').text(quoteJson.totalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
              	}
    			else
              	{
             		$('#totalAmount').text(" ");
              	}
    		}
         }
    	
       	
    	$("#gensuite_checkout_popup  #Checkout_btn").on("click", function(e){
       		e.preventDefault();
    		var cardId = $('.checkout_selectcard').val();
            $('.pageLoader').show();
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
        	                 		$('#cartToOrderReview').attr("action","checkout");
        	         				$('#cartToOrderReview').submit();
        	            		}else{
        	            		if(cardId=="New Card"){
        	            			$("#frmCheckOut").attr("action",response.paymentGatewayUrl);
                	            	$("#merchant-id").val(response.merchantId);
                	            	$("#merchant-pass").val(response.merchantPassword);
                	            	$("#merchant-name").val(response.merchantName);
                	            	$("#branding").val(response.brand);
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
    		}
    		else{
    			window.location.href="createorderconfirm";
    		}
    	});
       	
       	var amount = 0;
		if(isGuestUser=="true")
			amount=quoteJson.totalMSRP;
		else
			amount=quoteJson.totalAmount;
		
		if(errorMessageFromERP){
    		$("#order-confirm").css('opacity','0.5');
    		 //$("#order-confirm").addClass('disabled')
    		$('#myModal .modal-body').text(errorMessageFromERP);
			$("#myModal").show();
			$('div.pageLoader').hide(); 
    	}
		
    	//Call payment gateway 
    	$(document).on('click','#order-confirm',function(){
    		
    		 if(!errorMessageFromERP){
    			
    		console.log(quoteJson);
  
    		//GPD-5068     	
    		console.log('shipToAddressCountry : '+quoteJson.shipToAddress.addressCountry);
    		console.log('shipToAddressState : '+quoteJson.shipToAddress.addressState);
			if((quoteJson.shipToAddress.addressCountry=="US" || quoteJson.shipToAddress.addressCountry=="USA" || quoteJson.shipToAddress.addressCountry=="UNITED STATES") && quoteJson.shipToAddress.addressState=="CA"){
		  		  $('#warningWindow .modal-body').html("<spring:message code='label.warning.message' javaScriptEscape='true'/>");
		          $("#warningWindow").show();
			}else{
				confirmOrder(quoteJson);    		
			}
			
       		}
    	});
    	
    	
    	//var ordMult = quoteJson.cartItemList[0].orderMultiple;
    	//$(".order-multiples-lbl").html("<spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>"+ordMult);
    	
        if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
    	 	$(".order-multiples-lbl").show();
        }
        else{$(".order-multiples-lbl").hide();
        }
    	
    	$('#edit-order').on('click', function(){
    		window.location.href = 'createorderfromcartinit?organizationId='+quoteJson.organization.organizationId+'&isFromCartBrand=false&isDivisionMapped='+quoteJson.isDivisionMapped+"&isFromEditScreen="+true; //+'&breadcrumbsArray='+searchString;
    	})
    	hideOrShowFieldsInViews('${hideOrShowFields}'); //hide or show fields based on organization id
    	if(quoteJson.isGuestChildCart){
    		$('#SALES_REP_SECTION').hide();
    		$('#salesAreaDiv').hide();
    	}
    	
    	$('.pageLoader').hide();
    });
   
	function setDataForReview(quoteJson){
		console.log(quoteJson)
		if(quoteJson.isDivisionMapped == false){
			$('#customerDetails').text(quoteJson.customerName);	
		}
		else{
			$('#customerDetails').text(quoteJson.isGuestChildCart?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
		}
		//$('#customerDetails').text((typeof quoteJson.customer=="undefined")?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
		$('#poNumber').text((typeof quoteJson.customerPurchaseOrderNumber=="undefined")?" - ":quoteJson.customerPurchaseOrderNumber);
		$('#referenceNo').text(quoteJson.cartName==""?"-":quoteJson.cartName);
		$('#bill-to').text(((typeof quoteJson.billToAddress.addressReference=="undefined"))?quoteJson.billToAddress.addressName:quoteJson.billToAddress.addressReference+" - "+quoteJson.billToAddress.addressName);
		$('#ship-to').text(((typeof quoteJson.shipToAddress.addressReference=="undefined"))?quoteJson.shipToAddress.addressName:quoteJson.shipToAddress.addressReference+" - "+quoteJson.shipToAddress.addressName);
		$('#carrierId').text(typeof quoteJson.carrier=="undefined"?"-":quoteJson.carrier.carrierDescription);
		$('#salesCode').text(typeof quoteJson.paymentMethod=="undefined"?"-":quoteJson.paymentMethod.description);
		$('#paymentMethodId').val(typeof quoteJson.paymentMethod=="undefined"?"-":quoteJson.paymentMethod.paymentMethodId);
		$('#transportModeId').text(typeof quoteJson.transportMode=="undefined"?"-":quoteJson.transportMode.transportDescription);
  	 	$('#creditCardNumber').text(typeof quoteJson.cardDetailsVO=="undefined"?"-":quoteJson.cardDetailsVO.cardNumber);
		
  	 	/* var userApplication = $('#userApplication').val();
  	 	
  	 	if(userApplication == "REVFIRE"){
  	 		$('#carrierBillingOption').hide();
			$('#carrierBillingOption').prev().hide();
  	 	} */
  	 	
  	 	$('#carrierBillingOption').text(typeof quoteJson.carrierBillingOption=="undefined"?"-":quoteJson.carrierBillingOption.description);
		if(typeof quoteJson.carrierBillingOption !="undefined" && quoteJson.carrierBillingOption.description == "Prepay and Add"){
			$('#carrierId').hide();
			$('#carrierId').prev().hide();
		}
		
		$('#shippingInst').text(quoteJson.deliveryInstructions1==""?"-":quoteJson.deliveryInstructions1);
		$('#contactName').text(((quoteJson.contact.fullName=="") || (quoteJson.contact.fullName=="undefined"))?"-":quoteJson.contact.fullName);
		$('#contactEmail').text(((quoteJson.contact.primaryEmail=="") || (quoteJson.contact.primaryEmail=="undefined"))?"-":quoteJson.contact.primaryEmail);
		$('#serialNumber').text(quoteJson.serialNumber==""?"-":quoteJson.serialNumber);
		$('#partialShipment').text(quoteJson.partialShipment?"<spring:message code='label.export.no' javaScriptEscape='true'/>":"<spring:message code='label.export.yes' javaScriptEscape='true'/>");
		$('#shipToday').text(quoteJson.isSameDayShipping?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		$('#unitDown').text(quoteJson.machineBreakdown?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		if(isDealerUser=='true'){
			  populateDealerInfoAndShipToAddress(quoteJson);
		 }else{
				$('#bill-to-addr').html(setAddress(quoteJson.billToAddress));
				$('#ship-to-addr').html(setAddress(quoteJson.shipToAddress));
		 }
		//Commented to not to show attachment
		//$('#attachedFile').html(quoteJson.attachedFile.size>0?quoteJson.attachedFile.fileItem.fileName:'-')
		$('#brandName').text(quoteJson.organization.organizationName);
		//SUPPORT-MIL-223-170216
		$('#salesArea').text(typeof quoteJson.customerSalesAreaCurrencyVo=="undefined"? "-" : quoteJson.customerSalesAreaCurrencyVo.description);
		
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
	  	var quote = '${quoteReview}';
	  	var quoteJson = JSON.parse(quote);
  	  confirmOrder(quoteJson);
    });
	//GPD-5068
 	function confirmOrder(quoteJson){
 		$('div.pageLoader').show();
 		var paymentMethodId = $("#paymentMethodId").val();
 		if((paymentMethodId == "2")){
			//don't show popup of saved card
			 $('div.pageLoader').hide(); 
		 	if(isGuestUser=="true"){
		 		guestLoginCreditCardPayment();
			}else{
			 customerCardDetails = quoteJson.customerCardDetails;
			}
			appendCards(customerCardDetails);
			$("#gensuite_checkout_popup").show();
		
		}else{
		//Missed during merge activity added for GSP-943	
			$("#order-confirm").addClass('not-active');
        	$("#order-confirm").blur(); //INC-2424 ADDED BY ANIKET : TO PREVENT DUPLICATE ORDER : REVIEWED BY JK
			window.location.href="createorderconfirm";
		}
 	}

	   function guestLoginCreditCardPayment(){
	    	 var isGuestUser = '${isGuestUser}';
	    	 var quote = '${quoteReview}';
	       	 var quoteJson = JSON.parse(quote);
	    	 var amount=quoteJson.totalMSRP;
	    	 $("#merchant-amount").val(amount); 
				$("#merchant-curr").val(quoteJson.cartItemList[0].currencyCode); 
 		    	$.ajax({
		            type : "Get",
		            url : 'getmerchantdetails',
		            cache: false,
		            success : function(data) {
	                 $('.pageLoader').hide();
		            	var response = jQuery.parseJSON(data);
 		            	if(response!="Merchant Details Not Found"){
	 	            	$("#frmCheckOut").attr("action",response.paymentGatewayUrl);
	 	            	$("#merchant-id").val(response.merchantId);
	 	            	$("#branding").val(response.brand);
	 	            	$("#merchant-pass").val(response.merchantPassword);
	 	            	$("#merchant-name").val(response.merchantName);
	  	            	$("#AppKey").val(response.appKey);
	 	            	if(isGuestUser=="true")
	 	            		$("#isguestuser").val('1');
	 	            	else
	 	            		$("#isguestuser").val('0');
 		 				if(response.merchantName == "Paymetric"){
		                 		$('#cartToOrderReview').attr("action","checkout");
		         				$('#cartToOrderReview').submit();
		            		}else{
		            			$("#frmCheckOut").attr("action",response.paymentGatewayUrl);
	        	            	$("#merchant-id").val(response.merchantId);
	        	            	$("#branding").val(response.brand);
	        	            	$("#merchant-pass").val(response.merchantPassword);
	        	            	$("#merchant-name").val(response.merchantName);
	        					$("#frmCheckOut").submit();	
		            	}
 		            	}else
		            	  window.location.href="createorderreviewpayment";  
		            },  
		            error : function(e) {  
		            }  
		          });
			
	     }
	function setAddress(obj){
       	    var string="";
       		//GS-2490
       	    string=((typeof obj.addressReference != "undefined")?obj.addressReference + " - " :"");
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
    $(function(){
    	  if($("#payment-result").val()== "true"){
    		  var msg1="<spring:message code='label.payment.fail.msg' javaScriptEscape='true'/>"
    		 /*  
    		 var msg='${paymentResultMsg}';//As Girish suggested
     		  if(msg != ""){
    			  msg1 = msg;
    		  } */
  	    		$('#myModal .modal-body').text(msg1);
    			$("#myModal").show();
    	    }	 
    });
    $(".custom-close").click(function(){
		   $("#myModal, #gensuite_checkout_popup").hide();
	});
/*     
 // full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
   	 
		//if cart id is null bypassing the methord
	   	  if(cartItemId==""){
	   		fullItemRedirect(itemId,orgId);
	   	  	return;
	   	  }
	 
	 //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   		window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+'&isFromQuoteOrder=true &cartItemId='+cartItemId,'_blank');
     } */
    
	 history.pushState(null, "${properties['global.page.title']}", null);
     window.addEventListener('popstate', function () {
         //confirm("Navigating back will lead to loss of entered transaction data. Do you want to continue? ");
        //	var msg=confirm("Navigating back will lead to loss of entered transaction data. Do you want to continue? ")
         	//$('.modal-body').text("Navigating back will lead to loss of entered transaction data. Do you want to continue? ")
            $("#confirmationWindow").show();
        	$('.dialog-content, .confirm-modal-body').text('Navigating back will lead to loss of entered transaction data. Do you want to continue?');
        /*  if(msg){
        	 window.location.href= document.referrer;
         } */
     });
     $(function(){
    	 $(".delete-ok").click(function(){
             $('#confirmationWindow').hide();
            // window.location.href= document.referrer;
             window.history.go(-2);
    	 });
    	
    	/*  $(".cancel").click(function(){
    		 $('#confirmationWindow').hide();
    	 });  */
    	 $(".cancel").click(function(){
    	       $('#confirmationWindow,#PromoClearconfirmation').hide();
    	 });
    		
     });
    </script>
	<input type="hidden" id="payment-result" value="${paymentresult}" />
	<li hidden id="payment-message"><spring:message
			code="payment.result.failure"></spring:message></li>
</body>
</html>
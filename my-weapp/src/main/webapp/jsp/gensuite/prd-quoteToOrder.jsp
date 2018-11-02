<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style type="text/css">
/* Venkatasiva : GPD-2041 */
#checkboxes .shipValue{
	margin-left: 10px;
	margin-right: 5px;
}

.discount-message{
	float: right;font-size: 12px;font-weight: 700;
}
</style>
<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
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
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/custom.scripts.js?version=${properties['application.version']}"
	defer type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js"></script>
<script type= "text/javascript" src = "../js/dealer.scripts.js" ></script>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<!-- Added by Aniket NREV-1028 -->
		<form:form id="quoteToOrderForm" method="post"
			enctype="multipart/form-data">
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
						<span id="quoteNumber"></span> <span
							class="column-paddings required-message"> <span
							class="asterik">*</span> <spring:message
								code="label.quote.order.mandatory" /></span>
					</h3>

					<ul class="timeline">
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.cart.place.order" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm" /></span></li>
					</ul>

					<div class="section">

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.by" />
								:
							</h5>
							<p class="inline" id="quotedBy"></p>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.date" />
								:
							</h5>
							<p class="inline">
								<fmt:formatDate pattern="${dateformat}" value="${quoteDate}" />
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

							<div
								class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
								<div
									class="form-inline col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
									<h5>
									<label class="inline inline-sm" id="quoteToOrderCustomerDealerLabel"><spring:message
											code="label.quote.order.customer" /> </label>:
										</h5>
										<p class="inline inline-sm wid100Lab" id="customerDetails"></p>
								</div>
								<div
									class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
									<label for="purchase-orderno" class="control-label required"><spring:message
											code="label.quote.order.ponumber" /></label>
									<div class="input-group col-lg-7 col-md-9 col-sm-9 col-xs-12">
										<input type="text" id="purchase-orderno" class="form-control"
											name="poNumber" maxlength="22" />
									</div>
								</div>
								<div
									class="form-static-data form-group col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
									<label for="reference-no" class="control-label"><spring:message
											code="label.quote.order.your.reference" />: </label>
									<p class="inline" id="referenceNo"></p>
								</div>
							</div>

							<div
								class="col-lg-8 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div
									class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding" id="quoteToOrderBillTo">
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
									<!-- <div class="" id="endCustomer">
										<h5 class="inline">My Customer :</h5>
										<p class="inline endCustomerName" id="endCustomerName"></p>
										<br>
									</div> -->
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
							<div
								class="form-horizontal col-lg-4 col-md-12 col-sm-12 col-xs-12">
								<div class="">
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_PAYMENTTERMS',#organizationId)">
										<div class="row">
											<label id="paymentTermsLabel"
												class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 nopadding-xs charges-label required"><spring:message
													code="view.label.payment.terms" /></label>
											<div
												class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
												<%-- <sec:authorize access="hasRole('ROLE_CHANGE_PAYMENTTERMS')"> --%>
												<select class="form-control" id="carrierBillingSelect"
													name="carrierBillingOption">
													<c:forEach items="${carrierBillingOptionList}"
														var="carrierBilling">
														<option value="${carrierBilling.carrierBillingOptionId}">${carrierBilling.description}</option>
													</c:forEach>
												</select>

												<%-- <sec:authorize access="hasRole('ROLE_CHANGE_PAYMENTTERMS')"> --%>
												<%--  <sec:authorize access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_PAYMENTTERMS',#organizationId)">
                                        <select class="form-control disabled-onpermission" id="carrierBillingSelect" name="carrierBillingOption">
                                            <c:forEach items="${carrierBillingOptionList}" var="carrierBilling">
                                               <option value="${carrierBilling.carrierBillingOptionId}">${carrierBilling.description}</option>
                                            </c:forEach>
                                        </select>
                                     </sec:authorize> --%>
											</div>
										</div>
									</sec:authorize>
									<div class="row">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
												code="label.quote.order.shipping.method" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">

											<select class="form-control" id="carrierSelect"
												name="carrier">
												<option>-----
													<spring:message code="label.quote.order.select" /> ------
												</option>
												<c:forEach items="${carrierList}" var="carrier">
													<option value="${carrier.carrierId}">${carrier.carrierDescription}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="row" style="display: none;" id="transportModeDiv">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"><spring:message
												code="label.quote.order.transport.code" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<select class="form-control" name="transportMode"
												id="transportMode">
												<option>----- Select ------</option>
											</select>
										</div>
									</div>


									<div class="row">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
												code="label.quote.order.sales.code" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<select class="form-control" name="paymentMethod"
												id="salesCodeSelect">
												<c:forEach items="${paymentMethod}" var="paymentMethod">
													<c:choose>
														<c:when
															test="${defaultPayment.paymentMethodId == paymentMethod.paymentMethodId}">
															<option value="${paymentMethod.paymentMethodId}" selected>${paymentMethod.description}</option>
														</c:when>
														<c:otherwise>
															<option value="${paymentMethod.paymentMethodId}">${paymentMethod.description}</option>
														</c:otherwise>
													</c:choose>

												</c:forEach>
											</select>
										</div>
									</div>

									<div class="row">
										<%-- <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')"> --%>
										<sec:authorize
											access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_SALES_REP',#organizationId)">
											<div
												class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
												id="sales-id">
												<div
													class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
													<label
														class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
															code="label.quote.order.sales.rep" /></label>
													<div
														class="col-lg-6 col-md-7 col-sm-6 col-xs-12 column-paddings">
														<select class="form-control" id="salesRepSelect"
															name="salesRepresentative">
															<option></option>
														</select>
													</div>
												</div>
											</div>
										</sec:authorize>
									</div>



									<div class="row">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 nopadding-xs charges-label"
											for="shipping-instruction"><spring:message
												code="label.quote.order.shipping.inst" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<textarea class="form-control" rows="8"
											id="shipping-instruction" name="shippingInstruction"
											maxlength="${shippingDeliveryInstructionLimit}" placeholder="${shippingDeliveryInstructionLimitMsg}"></textarea>
										</div>
									</div>
								</div>
							</div>

							<div
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 nopadding">
									<h5 class="inline">
										<spring:message code="label.quote.order.name" />
										:
									</h5>
									<p class="inline" id="contactName"></p>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 nopadding">
									<h5 class="inline">
										<spring:message code="label.quote.order.email" />
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

										<h5>
											<spring:message code="label.quote.order.comments" />
											:
										</h5>
										<p id="comments"  class="inline"></p> <!--Fix for GSP-945	-->
									</div>
									<!--Commented to not to show attachment	-->
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<h5 class="inline">
												<spring:message code="label.quote.order.attach.file" />
												:
											</h5>
											<p id="attachedFileName" class="inline"></p>
											<input type="hidden" id="attached-fileName"
												name="attchedFileName">
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
					<%-- <sec:authorize access="hasAnyRole('ROLE_CHANGE_SALES_REP','ROLE_APPLY_CHARGES')">
                <div class="form-horizontal section chargesSection"  id = "SALES_REP_SECTION">
                	<sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" id="sales-id">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
                            <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12 required"><spring:message code="label.quote.order.sales.rep" /></label>
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                <select class="form-control" id="salesRepSelect" name="salesRepresentative">
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"></div>
                    </div>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings" id="charges-id">
                        <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12 charges-label"><spring:message code="label.quote.order.charge" /></label>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <select class="form-control" id="chargesSelect">
                            </select>
                        </div>
                    </div>

                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12" id="charge-value-id">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right currency" id="chargeSymbol"></div>
                            <div class="input-group col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
                                <input type="text" id="charge-value" class="form-control charges-val"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 btn-val-charges">
                            <a href="javascript:;" class="btn-addtocart add " id="add-charges"><spring:message code="label.quote.order.add" /></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="auto-apply-id">
                        <div class="">
                            <input type="checkbox" id="autoaply-charges" class="ctq-checkbox" name="autoApplyChecked" checked />
                            <label for="autoaply-charges" class="control-label ctq-control-label"><spring:message code="label.quote.order.auto.apply.charge" /></label>
                        </div>
                    </div>
                    </sec:authorize>
                    <!--<div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <label class="label-control col-lg-4 col-md-4 col-sm-4 col-xs-6 charges-label">Surcharge</label>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                            <select class="form-control">
                                <option>Select Surcharge</option>
                                <option>EXP - Export Charges</option>
                            </select>
                        </div>
                    </div>-->
                    <div class="clearfix"></div>
                </div>
			</sec:authorize> --%>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">
								<spring:message code="label.quote.order.item.total.am" />
								(<span id="count"></span>
								<spring:message code="label.quote.order.items" />
								)
							</h5>
							<h5
								class="col-lg-2 col-md-2 col-sm-2 col-xs-4 text-right padd-right40"
								id="subTotal"></h5>
						</div>
						<div id="chargesContainer"></div>
						<p class="alert-message pull-right" style="display: none;">
							<spring:message code="label.total.item.cart.msg" />
						</p>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div id="additionalCharges" style="display: none">

							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
								<spring:message code="label.quote.sales.tax.am" />
								<h5
									class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40"
									id="taxVal"></h5>
						</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopaddings">
							<a href="javascript:void(0)"
								class="pull-right green-button next review-order"><spring:message
									code="label.brand.review" /></a>
						</div>
						<p class="discount-message"><spring:message	code="label.discount.surcharge.message" /></p>
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
			<!-- Venkatasiva : GPD-2041 -->
			<div class="modal bs-example-modal-md" id="myModalSerialNo">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content" style="">
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
						<div class="modal-footer">
				          <button type="button" class="btn btn-primary myModalSerialNoClose" data-dismiss="modal"><spring:message
									code="label.myaccount.ok" /></button>
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

			<div class="modal bs-example-modal-md" id="confirmationWindow1" data-backdrop="static" data-keyboard="false">
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
							<a class="col btn ok1" href="javascript:;"><spring:message
									code="label.myaccount.ok" /></a> <input type="hidden"
								id="confirmBoxType" />
						</div>
					</div>
				</div>
			</div>
			<div class="modal bs-example-modal-md" id="backButtonConfirmationWindow" data-backdrop="static" data-keyboard="false">
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
							<p class="back-button-dialog-content">
								<spring:message code="lable.init.quote.back.button" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" id="backButtonCancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
								class="col btn delete-ok charge-ok" id="backButtonOk" href="javascript:;"><spring:message
									code="label.myaccount.ok" /></a> <input type="hidden"
								id="confirmBoxType" />
						</div>
					</div>
				</div>
			</div>
		</form:form>
		<!-- footer container -->
		<footer>
			<%@ include file="../../jsp/footer.jsp"%>
		</footer>
	</div>

	<script id="createQuoteTemplate" type="text/x-jquery-tmpl">

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details xs_img_center">
                                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
									{{if mediaId!=0}}
                               			<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="catalog-img"></a>
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12 pt-xs-10">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="search.part.partnumber"/>: ${'${'}partNumber}</a></h4>
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
                                        <div>${'${'}organizationName}</div>
										</c:if>
                                        <!-- <div><strong>${'${'}availableQuantity} <spring:message code="inventory.msg.instock"/></strong></div> -->
										<div><strong>${'${'}inventoryMessage}</strong></div>
										<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p>
                                    </div> 
				    <c:if test="${properties['item.comments.section.required']==true}">
                                    <div class="product-comments item-comments" comment-itemId="${'${'}partId}">
                                        <h5><spring:message code="view.label.comments"/>: </h5>
                                        <p>${'${'}comments}</p>
                                    </div>
				    </c:if>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2">
								<div class="spinner-control">
									  <!--Rajesh Chinnam : This modified to fix DME-310:Unable to edit the Quantity of parts in edit screen. This error occurrences while converting quote to order.  -->
                                      <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:40px;text-align:center" onfocus="this.blur()" readonly="readonly" >
										<span class="unit pos_relative_xs">${'${'}uom}</span> 
                                 </div>
								</div>
                                <div class="col-lg-3 col-md-3 col-sm-3 nopadding">
                                    <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalAmountStr}" />
									{{if priceMSRPStr !== "-1" && priceMSRPStr !==priceStr}} 
                                    	<div>{{if priceMSRP}}<spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span>{{/if}}</div>
									{{/if}}
									
									{{if priceStr !== "-1"}} 
										<div><spring:message code="label.your.price"/>: ${'${'}priceStr} ${'${'}currencyCode}</div>
									{{/if}}
									
									{{if savedPriceStr !== "-1" && priceMSRPStr !==priceStr}} 
                                    	<div class="blueColor"><spring:message code="label.save"/>: ${'${'}savedPriceStr} ${'${'}currencyCode} <spring:message code="lable.item.each" /></div>
									{{/if}}

									<div><h5><spring:message code="label.item.total"/>: <span class="cartItemTotal">
                                        {{if itemTotalAmountStr !== "-1"}}
                                            ${'${'}itemTotalAmountStr} ${'${'}currencyCode} 
                                        {{/if}}
                                        </span>
                                    </h5></div>
                                </div>
                            </div>


    </script>
	<script id="chargesTemplate" type="text/x-jquery-tmpl">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" >
			<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
			<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4 text-right" data-chargeId="${'${'}chargeId}" data-chargeName="${'${'}name}">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode} <i class="fa fa-trash-o remove pull-right remove-charges" ></i></p>

		</div>
	</script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script type="text/javascript">
		//Venkatasiva : GPD-2041
		var ruleMap = new Map();
		var minimumChargesApplied = false;
    	var userid,authtoken;
    	var chargesDetailsJson;
        var disablePaymentTermFlag = false;
        var POFlag = true; //PO Mandatory Field
        var removeChargeId;
        var transportModeApplicable = 0 ;
		var transportModeJson;
				   
	    var defaultPartUOM = '${properties["default.part.uom"]}';
	    var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
	    var ordMult;
	    var valueHideOrShow;
	    var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
		
		function handleTransportMode(){
 			 transportModeApplicable = '${transportModeApplicable}' ;
 			transportModeJson = JSON.parse('${transportModeMap}'); 
        	if(transportModeApplicable == 2 || transportModeApplicable == 1){
        		 $('#transportModeDiv').show(); 
       		}else{
    		  	$('#transportModeDiv').hide();
       		}
        }
		
		function dateFormat(d) {
			var date = new Date(d);
			var dd = date.getDate();
			var mm = date.getMonth() + 1; //January is 0!
			var yyyy = date.getFullYear();
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = mm + '/' + dd + '/' + yyyy;
			return today;
		}
		
		var isOrderAllowedWithPriceError = null;
		
		
		
		
		
		$(document).ready(function(){
			
			isOrderAllowedWithPriceError = '${isOrderAllowedWithPriceError}';
			//Fix for GSP-496 Back button functionality
			var previousUrl = document.referrer;
	     	var manualStateChange = true;
	     	
	     	
	     	//Venkatasiva : GPD-2041
            populateRuleMap('${transportModeRulesCheckbox}');
			
			History.pushState({},strings['global.page.title'],"./"+History.getState().url.split('web/')[1]+"&amp;state=99");
	    	History.Adapter.bind(window,'statechange',function(){	    		
			    if(manualStateChange == true){
			    	var x = previousUrl.split("/");
			    	if(x[x.length-1].startsWith( "createquoteconfirm")){
			    		$("#backButtonConfirmationWindow").show();
		        	}else{
		        		window.location.href = previousUrl;
		        	}
			    }
			    manualStateChange = true;
			});
	    	
	    	function loadBundles() {
				// var lang = document.getElementById('language_id_').value;
				$.ajax({
					type : "GET",
					async : false,
					url : "getLanguage",
					success : function(response) {
						var scriptContent = $($.parseHTML(response, document, true))
								.filter('script').text();
						$.globalEval(scriptContent);
					},
					error : function(e) {
					}
				});
			}
			
			
	    	
		
	    	 $("#backButtonCancel").click(function(){
	    		 History.pushState({},"${properties['global.page.title']}","./"+History.getState().url.split('web/')[1]+"?state=99");
	       		$("#backButtonConfirmationWindow").hide();
	   		 });
	 		 
	   		 $("#backButtonOk").click(function(){
	      		 	$("#backButtonConfirmationWindow").hide();
	      		 	window.location.href="getshoppingdetails?reOrder=true";
	      	});

 			 handleTransportMode();
 			var today = new Date();
 			var fromDate=new Date();
 	        var toDate=new Date();
 	       	var priorDate = new Date().setDate(today.getDate()-180);
   			var priorDateFormat = new Date(priorDate);
 	        fromDate=dateFormat(priorDateFormat.toISOString().substring(0, 10));
 	        toDate=dateFormat(today);
 			 
            //$(".close").text("x");
            userid=$('#userId').val();
    		authtoken = $('#authToken').val();
        	var quote = '${jsonQuote}';
          	var quoteJson = JSON.parse(quote);
          	var cusNo= '${cusNo}';
          	var organizationId = '${organizationId}';
          	var orgName = '${orgName}';
          	var cusName = '${cusName}';
          	var chooseBrand = '${chooseBrand}';
          	//bread crumb
          	$("#breadcrumb-quote").text(quoteJson.quoteNumber);$("#breadcrumb-quote").parent().attr("href","getquote?childCartId="+quoteJson.childCartId+"&organizationId="+quoteJson.organization.organizationId);
          	
          	
          	
          	console.log(quoteJson);
          	var locale=${locale};

            //setPaymentTermBasedOnSalesCode();   // If coming from Review Order screen, check if "Credit card" is selected as Payment term.
            
          	 $("#createQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
                checkAlertMessage();
	          // Zero Price issue changes 19/Oct/2015 by Ganeshan 
	             var flagForZeroPrice = false;
	             $.each(quoteJson.cartItemList, function (key, data) {
	                 console.log(data)
	                 if(data.itemTotalAmount==0 && isOrderAllowedWithPriceError == 'false'){
	                 	flagForZeroPrice = true;
	                 }
	             })
	             
	             if(flagForZeroPrice){
	     			$("#confirmationWindow1").show();
	    	    	$('.dialog-content, .confirm-modal-body').text("Zero price item exist, so you can't create a order, redirecting to editquote page");
	                $("#confirmationWindow1").draggable({
	                    handle: ".modal-header"

	       			});
	             }
	             
	             $(".ok1").click(function(){
	            	 $("#confirmationWindow1").hide();
	            	 window.location.href = "getquote?childCartId="+quoteJson.childCartId+"&organizationId="+quoteJson.organization.organizationId;
	          	});
            
            
             $('#count').text(quoteJson.cartItemList.length);
             
             if(quoteJson.cartItemList.length>0){
            	 $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.cartItemList[0].currencyCode);
            	 $('#chargeSymbol').text(quoteJson.cartItemList[0].currencyCode);
             }else{
            	 $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.currencyCode);
            	 $('#chargeSymbol').text(quoteJson.currencyCode);
             }
             
             if(typeof quoteJson.isGuestChildCart!="undefined" && quoteJson.isGuestChildCart){
        		$("#SALES_REP_SECTION").hide();
        	 }
             
             if((typeof quoteJson.chargeList)!="undefined"){
            	 $("#chargesContainer").html('');
                 $("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
             }
             
             if(isDealerUser=='true'){
    			 updateDealerAndBillToForQuoteToOrder();
    		 }
    		 
    		setDataForReview(quoteJson);
    		
    		 
           // $('#quotedBy').text(quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName);
            if(typeof quoteJson.quotedBy!="undefined")
            	$('#quotedBy').text(quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName);
            else
            	$('#quotedBy').text(quoteJson.contact.fullName);
        	//$('#quotedDate').text(quoteJson.quoteCreatedDate);
        	$('#comments').text(quoteJson.comments==""?"-":quoteJson.comments);
        	$('#autoApply').prop('checked', quoteJson.autoApplyCharges==true?false:true);
        	$('#totalAmount').text(quoteJson.totalAmount+" "+quoteJson.currencyCode);
        	
        	if(typeof quoteJson.customerPurchaseOrderNumber!="undefined"){
				$('#purchase-orderno').val(quoteJson.customerPurchaseOrderNumber);
// 				handlepo();
			} 
        	
        	if(typeof quoteJson.deliveryInstructions1!="undefined")
				$('#shipping-instruction').val(quoteJson.deliveryInstructions1);
        	
        	
        	$("#carrierSelect").val((typeof quoteJson.carrier)=="undefined"?$("#carrierSelect option:first").val():quoteJson.carrier.carrierId);
        	if((typeof quoteJson.carrierBillingOption)!="undefined"){
	       	  	$("#carrierBillingSelect").val(quoteJson.carrierBillingOption.carrierBillingOptionId);
		       	//Added during merge for GSP-935
				 if("${properties['user.application']}" == 'REV'){	
		 	       	 if(quoteJson.carrierBillingOption.carrierBillingOptionId == 1){
				    		$("#carrierSelect").parent().parent().hide();
				  		}else{
		 		    		$("#carrierSelect").parent().parent().show();
			     	  	}
		       	 }
		       
	       	 	var cboId = $("#carrierBillingSelect > option:selected").val();
	    		var transportmodeId;
				if((typeof quoteJson.transportMode)!="undefined"){
					transportmodeId = quoteJson.transportMode.transportModeId;
				}
	    		getTransportModeBasedOnShippingTerms(cboId,transportmodeId);
        	}
        	
        	/* if("${properties['user.application']}" == "REVFIRE"){
        		var cboId = $("#carrierBillingSelect > option:selected").val();
        		if((typeof quoteJson.transportMode)!="undefined"){
					transportmodeId = quoteJson.transportMode.transportModeId
				}
	    		getTransportModeBasedOnShippingTerms(cboId,transportmodeId);
        		$("#carrierSelect").parent().parent().hide();
		       		$("#carrierBillingSelect").parent().parent().hide();
        	} */
        	
        	var basicUserDetails = '${basicUserDetailsVos}';
      	  	if(basicUserDetails!=""){
				var basicUserDetailsJson = JSON.parse(basicUserDetails);
				var salesRepId=null;
				if(typeof quoteJson.quotedBy!="undefined"){
					var salesRepId = quoteJson.quotedBy.userId;
				}else{
					var salesRepId = '${loggedInUserID}';
				}
				
	    	  	appendSalesRepData(basicUserDetailsJson,salesRepId);
      	  	}
      	  	
      	  
			if(typeof quoteJson.quotedBy!="undefined"){
				var salesRepId = quoteJson.quotedBy.userId;
			}else{
				//var loggedInUserId = '${loggedInUserID}';
			}
        	
      		//set sales rep and charges list
            var chargesDetails = '${chargeDetailsVos}';
            if(chargesDetails!=""){
            	chargesDetailsJson = JSON.parse(chargesDetails);
            	appendChargesData(chargesDetailsJson);
            }

            $('div.file-list').on('click','a.remove',function(){
                
            });

            $('div.product-comments a').on('click',function(){
                $(this).parent().find('textarea').toggleClass('hidden').slideDown('1000');
            });
            
           
        	if(typeof quoteJson.paymentMethod!="undefined"){
				var paymentMethodId = quoteJson.paymentMethod.paymentMethodId;
				$('#salesCodeSelect').find('option[value="'+paymentMethodId+'"]').prop("selected",true);
			}
        	//INC-1578
        	if ($("#salesCodeSelect option:selected").val()== 2){
				 if($('#purchase-orderno').val().length==0 || $('#purchase-orderno').val().trim()==''){
					 $('#purchase-orderno').val('Credit Card');	
				 }
			}
        	//INC-1578
            if(typeof quoteJson.customerMandatoryVO!="undefined" && quoteJson.customerMandatoryVO.POFlag){ //PO Mandatory Field
                POFlag = true;
                $("#purchase-orderno").parent().siblings("label").addClass("required");
            }
            
          //Handling TransportMode option
        	transportModeApplicable = '${transportModeApplicable}';
        	transportModeMapJson = JSON.parse('${transportModeMap}'); 
        	
        	if(typeof quoteJson.carrier!="undefined" && typeof quoteJson.transportMode!="undefined"){
        		reloadDropDown(transportModeApplicable,transportModeJson,1,quoteJson.carrier.carrierId);
            	$("#transportMode").val((typeof quoteJson.transportMode)=="undefined"?$("#transportMode	 option:first").val():quoteJson.transportMode.transportModeId);
        	}

        	 //Venkatasiva : GPD-3449	    	 
	    	var hideOrShowTransportModeFieldsQuotesGuest = ${hideOrShowFields};
            if (hideOrShowTransportModeFieldsQuotesGuest["is.shipment.terms.flag.visible"] != "TRUE")
            { 
            	var cboId = $("#carrierBillingSelect > option:selected").val();
        		if((typeof quoteJson.transportMode)!="undefined"){
					transportmodeId = quoteJson.transportMode.transportModeId
				}
	    		getTransportModeBasedOnShippingTerms(cboId,transportmodeId);
        		$("#carrierSelect").parent().parent().hide();
		       	$("#carrierBillingSelect").parent().parent().hide();
            }
            
        	hideOrShowFields('${hideOrShowFields}');
        	var fields = JSON.parse('${hideOrShowFields}');
			if(typeof quoteJson.taxAmount!="undefined" &&  fields["show.sales.tax"] == "TRUE" && quoteJson.taxAmountStr !="-1" ){
				$('#additionalCharges').show();
 	      	    $('#taxVal').text(quoteJson.taxAmountStr+ " ");
	      	    $('#taxVal').append(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode);
			}
			
			valueHideOrShow = ${hideOrShowFields};
			//ordMult = quoteJson.cartItemList[0].orderMultiple;
	    	//$(".order-multiples-lbl").html('Order Multiples:'+ordMult);
	        if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
	    	 	$(".order-multiples-lbl").show();
	        }else{$(".order-multiples-lbl").hide();
	        }
	        //Venkatasiva : GPD-2041
	        $(".shipValue").change(function()
	        {
	            $(".shipValue").prop('checked',false);
	            $(this).prop('checked',true);
	            var optionValue = $(this).attr('id');
				console.log("optionValue"+optionValue);
				//$("#carrierBillingSelect").val(this.id);
				$("#transportMode").val(this.id); 
				var cboId = $("#transportMode > option:selected").val();
	   			 if (undefined != ruleMap && undefined != ruleMap.get(cboId+"_"+3) && undefined != ruleMap.get(cboId+"_"+3).get(3) && ruleMap.get(cboId+"_"+3).get(3)=="true" ){
	   					$('#machine-serial-no-label').addClass('required');
	   				}
	   			 else{
	   				 	$('#machine-serial-no-label').removeClass('required');
	   				 }
	        });
			if(typeof quoteJson.partialShipment!="undefined")
			$('#partial-shipment').prop('checked', quoteJson.partialShipment==true?false:true);
           $('#ship-today').prop('checked', quoteJson.isSameDayShipping);
           if(typeof quoteJson.machineBreakdown!="undefined")
           $('#unit-down').prop('checked', quoteJson.machineBreakdown);
        	
            // set sales area, changed by Ganeshan 8th Feb.
			//SUPPORT-MIL-223-170216
   	    	$('#salesArea').text(typeof quoteJson.customerSalesAreaCurrencyVo=="undefined"?"-":quoteJson.customerSalesAreaCurrencyVo.description);
            
   	    	if(typeof quoteJson.consignmentOrder!="undefined")
				$('#consignment-order').prop('checked', quoteJson.consignmentOrder==true?true:false);
			
			consignmentOrderStatus(quoteJson.customer.customerTypeId);
			
		$('#endCustomerName')
				.text(
					typeof quoteJson.endCustomerName == "undefined" ? $(
								'#endCustomer').hide()
								: quoteJson.endCustomerName);

        });
        
        function setDataForReview(quoteJson){
        	$('#quoteNumber').text(quoteJson.quoteNumber);
        	 /* $('#customerDetails').text(quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName); */
    		$('#customerDetails').text(((typeof quoteJson.isGuestChildCart!="undefined") && quoteJson.isGuestChildCart)
    				?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
    		//$('#poNumber').text((typeof quoteJson.customerPurchaseOrderNumber=="undefined")?" - ":quoteJson.customerPurchaseOrderNumber);
    		$('#referenceNo').text(quoteJson.cartName==""?"-":quoteJson.cartName);
    		$('#bill-to').text(((typeof quoteJson.billToAddress.addressReference=="undefined"))?quoteJson.billToAddress.addressName:quoteJson.billToAddress.addressReference+" - "+quoteJson.billToAddress.addressName);
    		$('#ship-to').text(((typeof quoteJson.shipToAddress.addressReference=="undefined"))?quoteJson.shipToAddress.addressName:quoteJson.shipToAddress.addressReference+" - "+quoteJson.shipToAddress.addressName);
    		$('#shipping-instruction').text(quoteJson.deliveryInstructions1==""?"-":quoteJson.deliveryInstructions1);
    		/* $('#carrierId').text(typeof quoteJson.carrier=="undefined"?"-":quoteJson.carrier.carrierReference);
    		$('#salesCode').text(typeof quoteJson.paymentMethod=="undefined"?"-":quoteJson.paymentMethod.description);
    		$('#carrierBillingOption').text(typeof quoteJson.carrierBillingOption=="undefined"?"-":quoteJson.carrierBillingOption.description); */
    		
    		$('#contactName').text(((quoteJson.contact.fullName=="") || (quoteJson.contact.fullName=="undefined"))?"-":quoteJson.contact.fullName);
    		$('#contactEmail').text(((quoteJson.contact.primaryEmail=="") || (quoteJson.contact.primaryEmail=="undefined"))?"-":quoteJson.contact.primaryEmail);
     		$('#serialNumber').text(quoteJson.serialNumber==""?"":quoteJson.serialNumber);
 			$('#machine-serial-no').val(quoteJson.serialNumber==""?"":quoteJson.serialNumber);


     		
    		/* $('#partialShipment').text(quoteJson.partialShipment?"<spring:message code='label.export.no' javaScriptEscape='true'/>":"<spring:message code='label.export.yes' javaScriptEscape='true'/>");
    		$('#shipToday').text(quoteJson.isSameDayShipping?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
    		$('#unitDown').text(quoteJson.machineBreakdown?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>"); */
    		//$('#unitDown').text(quoteJson.machineBreakdown?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
    		$('#bill-to-addr').html(setAddress(quoteJson.billToAddress));
    		$('#ship-to-addr').html(setAddress(quoteJson.shipToAddress));
//     		$('#attachedFileName').html(typeof quoteJson.attachedFileName=="undefined"?'-':quoteJson.attachedFileName);
    		if(typeof quoteJson.attachedFileName!="undefined"){
            	$('#attachedFileName').html(quoteJson.attachedFileName);
            	$('#attached-fileName').val(quoteJson.attachedFileName)
            }else{
            	$('#attachedFileName').html('-');
            }
    		
    		$('#consignment-order').text(quoteJson.consignmentOrder?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
    		
    	}
        //PO Mandatory Field
        function makeValidFields(obj)
        {
            if(obj != null)
                POFlag = obj.POFlag;
            else
            	//START INC-965 
        		//POFlag = false;
        		POFlag = true;
        		//END INC-965 
            
            if(POFlag)
                $("#purchase-orderno").parent().siblings("label").addClass("required");
            else
                $("#purchase-orderno").parent().siblings("label").removeClass("required");
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
        
        $('#chargesSelect').on('change', function(){
            var selectedChargeId = $('#chargesSelect :selected').val();
            var defaultAmount;
            for(var i=0; i<chargesDetailsJson.length;i++){
                if(chargesDetailsJson[i].chargeId==selectedChargeId){
                    defaultAmount = chargesDetailsJson[i].defaultAmountStr;
                    break;
                }
            }
            $('.charges-val').val(defaultAmount);
        })
     // adding selected charges
    	$('#add-charges').on('click', function(){
    		var selectedChargeId = $('#chargesSelect :selected').val();
    		var chargeAmount = $('#charge-value').val().trim();
    		var currencyCode= $('#chargeSymbol').text();
    		if($(this).hasClass('not-active')){
    			return false;
    		}
    		
    		if(selectedChargeId==""){
    			$('.modal-body').text("<spring:message code='alert.quote.order.charge.validation' javaScriptEscape='true'/>");
    			$("#myModal").show();
    			return false;
    		}
    		else if(chargeAmount==""){
    			$('.modal-body').text("<spring:message code='alert.quote.order.charge.amount.validation1' javaScriptEscape='true'/>");
    			$("#myModal").show();
    			return false;
    		}
    		else if(chargeAmount=="0"){
    			$('.modal-body').text("<spring:message code='alert.quote.order.charge.amount.validation2' javaScriptEscape='true'/>");
    			$("#myModal").show();
    			return false;
    		}
    		else if(chargeAmount<0){
    			$('.modal-body').text("<spring:message code='alert.quote.order.charge.amount.validation3' javaScriptEscape='true'/>");
    			$("#myModal").show();
    			return false;
    		}else if(validateSpecialCharacterAndAlphanumeric(chargeAmount) == true){
    			$('.modal-body').text("<spring:message code='alert.quote.order.charge.amount.validation4' javaScriptEscape='true'/>");
    			$("#myModal").show();
    			return false;
    		}
    		
    		$(this).addClass('not-active');
    		
    		$.ajax({
             type : "Get",
             data : {selectedChargeId:selectedChargeId,chargeAmount:chargeAmount,currencyCode:currencyCode},
             contentType: 'application/json',
             mimeType: 'application/json',
             url : 'setcreatequotechargedetail',
             cache: false,
             success : function(response) {
    			 console.log(response);
            	 $("#chargesContainer").html('');
            	 $("#chargesTemplate").tmpl(response.chargeList).appendTo("#chargesContainer");
            	 $("#add-charges").removeClass('not-active');
             },  
             error : function(e) {  
               
             }  
           }); 
    	})
    	
    	// remove charges
    	$(document).delegate('.remove-charges','click', function(){
	    	removeChargeId = $(this).parent().attr('data-chargeId');
	    	var chargeName = $(this).parent().attr('data-chargeName');
	    	$("#confirmationWindow").show();
	    	/* $('.dialog-content, .confirm-modal-body').text("<spring:message code='label.creteordercartinit.msg.charge' javaScriptEscape='true'/>"+chargeName); */
	    	$('.dialog-content, .confirm-modal-body').text("<spring:message code='label.creteordercartinit.msg.charge' javaScriptEscape='true'/>");
            $("#confirmationWindow").draggable({
                handle: ".modal-header"

   			});
	    	
    });
        $(".ok").click(function(){
   		 $("#confirmationWindow").hide();
   		 $.ajax({
   	            type : "Get",
               cache:false,
   	            data : "selectedChargeId=" + removeChargeId,
   	            contentType: 'application/json',
   	            mimeType: 'application/json',
   	            url : 'createquoteremovecharges',
   	            success : function(response) {
   					//console.log(response);
   					$("#chargesContainer").html('');
   					$("#chargesTemplate").tmpl(response.chargeList).appendTo("#chargesContainer");
   	            },  
   	            error : function(e) {   
   	            }  
   	          });
   	});
        
        
   	
   	$(".cancel").click(function(){
   		$("#confirmationWindow").hide();
   		return false;
   	});
     
    	function appendSalesRepData(basicUserDetailsJson,loggedInUserId){
    		$('#salesRepSelect').find('option').remove();
    		for(var i=0; i<basicUserDetailsJson.length;i++){
    			var opt = $("<option></option>");
    			if(basicUserDetailsJson[i].userId==loggedInUserId)
    				opt.attr("selected","selected");
    			opt.text(basicUserDetailsJson[i].firstName+" "+basicUserDetailsJson[i].lastName);
    			opt.val(basicUserDetailsJson[i].userId);
    			$('#salesRepSelect').append(opt);
    		 } 
     	}
    	
    	function appendChargesData(chargesDetailsJson){
    		var count = Object.keys(chargesDetailsJson).length;
    		if(count>0){
    		$('#chargesSelect').find('option').remove();
    		var blankOpt ="<spring:message code='label.quote.order.select' javaScriptEscape='true'/>"; 
    		$('#chargesSelect').append("<option>------------"+blankOpt+"------------</option>");
    		for(var i=0; i<chargesDetailsJson.length;i++){
    			var opt = $("<option></option>");
    			opt.text(chargesDetailsJson[i].name);
    			opt.val(chargesDetailsJson[i].chargeId);
    			$('#chargesSelect').append(opt);
    		 }
    		}else{
    			$(".chargesSection").children().addClass("not-active");
    			$('#autoaply-charges').prop('checked', false);
    		}
     	}
    	
    	$('.review-order').on('click', function(e){
     		var lineItemHolder = $('#cart-items-hldr');
            var disableButton = false;
            
        	var numItems = $('.cart-details').length;
        	
        	if(numItems == 0){
        		$('.modal-body').text("<spring:message code='alert.order.lineitem.validation' javaScriptEscape='true'/>")
    			$("#myModal").show();
        	}

            lineItemHolder.find('.cart-details').each(function(index){
                if($(this).find('input[type="hidden"]').val()=="-1" && isOrderAllowedWithPriceError == 'false' ){
                    disableButton = true;
                    return false;
                }
            });
            if(disableButton){
                $('.modal-body').text("<spring:message code='message.cannot.place.order.for.zero.price' javaScriptEscape='true'/>");
                    
                $("#myModal").show();
                e.preventDefault();
                return false;
            }

            var lineItemHolder = $('#cart-items-hldr');
            var disableButton = false;
            lineItemHolder.find('.cart-details').each(function(index){
                if($(this).find('input[type="hidden"]').val()=="-1" && isOrderAllowedWithPriceError == 'false'){
                    disableButton = true;
                    return false;
                }
            });
            if(disableButton){
                $('.modal-body').text("<spring:message code='message.cannot.place.order.for.zero.price' javaScriptEscape='true'/>");
                    
                $("#myModal").show();
                e.preventDefault();
                return false;
            }
            
        	var validateResult = formValidation();
        	//Venkatasiva : GPD-2041
        	if(validateResult){
        		validateResult = minimumOrderValidation(validateResult);
        	}
        	
        	if(validateResult){
        		
        		var paymentMethodId = $('#salesCodeSelect').val();
        		$.ajax({
        			type : "GET",
        			url : "checkforZeroPriceParts",
        			async: false,
        			contentType: 'application/json',
        			success : function(response) {
        				if(response == 'true' && (paymentMethodId == 2 || paymentMethodId == 3 || paymentMethodId == 4 )){
        	        		//$('.modal-body').text("<spring:message code='alert.quote.order.price.validation1' javaScriptEscape='true'/>")
        	        		$('.modal-body').text("Credit Card Payment Method is not supported for this transaction, Please choose different Payment method")
        	                $("#myModal").show();
        	                return false;
        	        	}else{
        	        		$('#quoteToOrderForm').attr("modelAttribute","quoteToOrderForm");
        	        		$('#quoteToOrderForm').attr("action","quotetoorderreview");
        					$('#quoteToOrderForm').submit();
        	        	}
        			},
        			error : function(e) {

        			}
        		});
        		
        	}
        	
        })
        
        
        function formValidation(){
			var carrier = $('#carrierSelect').val();
			var salesCode = $('#salesCodeSelect').val();
			var carrierBilling = $('#carrierBillingSelect').val();
			if(carrierBilling == 0){
				 disablePaymentTermFlag = true;
				
			}
			//INC-1578
            var poNumber =  $('#purchase-orderno').val().trim();
          
            /**
			 if(carrier===null || carrier=="" || isNaN(carrier)){
				$('.modal-body').text("<spring:message code='label.quote.order.shipping.method.validation' javaScriptEscape='true'/>")
				$("#myModal").show();
                $("#myModal").draggable({
                    handle: ".modal-header"
                });
				return false;
			}else if(POFlag && (poNumber===null || poNumber=="")){**/
            if(POFlag && (poNumber===null || poNumber=="")){
                $('.modal-body').text("<spring:message code='alert.quote.order.ponumber' javaScriptEscape='true'/>")
                $("#myModal").show();
                return false;
            }
            else if(carrier===null || carrier=="" || isNaN(carrier)){
    			$('.modal-body').text("<spring:message code='label.quote.order.shipping.method.validation' javaScriptEscape='true'/>")
    			$("#myModal").show();
    			return false;
    		}
			else if(salesCode===null || salesCode==""){
				$('.modal-body').text("<spring:message code='label.quote.order.sales.code.validation' javaScriptEscape='true'/>")
				$("#myModal").show();
                $("#myModal").draggable({
                    handle: ".modal-header"
                });
				return false;
			}
			else if(!disablePaymentTermFlag && (carrierBilling===null || carrierBilling=="")){
				$('.modal-body').text("<spring:message code='alert.quote.order.payment.term' javaScriptEscape='true'/>")
				$("#myModal").show();
                $("#myModal").draggable({
                    handle: ".modal-header"
                });
				return false;
			}
          //Venkatasiva : GPD-2041
			else if(!validateSerialNo(ruleMap)){
				return false;
			}	
				return true;	
		}
    	
    	$(".custom-close").click(function(){
 		   $("#myModal").hide();
 		  $("#myModalSerialNo").hide();
 		});
    	$(".myModalSerialNoClose").click(function(){		  
 		   $("#myModalSerialNo").hide();
 		});
    	$('#carrierSelect').on('change', function(){
    		var carrierId = $(this).val();
    		var carrierList = '${carrierListJson}';
    		var carrierlistParse = JSON.parse(carrierList);
    		
    		var checkedFlag = false;
    		for(var i=0;i<carrierlistParse.length;i++){
    			if(carrierlistParse[i].carrierId==carrierId && carrierlistParse[i].isExpedited){
    				$("#ship-today").prop( "checked", true );
    				checkedFlag = true;
    				break;
    			}
    		}
    		
    		if(!checkedFlag)
    			$("#ship-today").prop( "checked", false );
    		//Handling TransportMode option
//     		handleTransportModeDropDown(transportModeJson,this.value,transportModeApplicable); 
    		
    	});

    	  $('#salesCodeSelect').on('change', function(){
              // If Sales code = Credit card, then Payment Terms is Disabled and becomes non-mandatory field            
             // setPaymentTermBasedOnSalesCode();
 			 //INC-1578
 			 //INC-1767
              if ($("#salesCodeSelect option:selected").val()== 2 && (($('#purchase-orderno').val().length==0) || ($('#purchase-orderno').val().trim()=='') || $('#purchase-orderno').val() == 'Credit Card')){
              	//$('.creditCard').show();
              	$('#purchase-orderno').val('Credit Card');
              	//INC-1578
          		/* $("#purchase-orderno").attr("readonly", "readonly"); */
             	     	}else if(($('#purchase-orderno').val() == 'Credit Card') && $("#salesCodeSelect option:selected").val()== 1){           	     	
              		//$('.creditCard').hide();
      				$('#purchase-orderno').val('');
      				/* $("#purchase-orderno").removeAttr("readonly"); */
             	     	}
          });


    function setPaymentTermBasedOnSalesCode(){
        // If Sales code = Credit card, then Payment Terms is Disabled and becomes non-mandatory field  
        var selectedSalesCodeId = $('#salesCodeSelect').val();
        $("#salesCodeSelect > option").each(function() {
            if('Credit Card' == this.text  && selectedSalesCodeId==this.value){
                 disablePaymentTermFlag=true;
            }else{
                disablePaymentTermFlag=false;
            }
        });
        if(disablePaymentTermFlag){
            $("#carrierBillingSelect > option").each(function() {
                if($(this).val() == 0)
                    $(this).prop('selected', true);
            });
            $("#carrierBillingSelect").prop("disabled", true);
            $("label#paymentTermsLabel").removeClass("required");
        }else{
            $("#carrierBillingSelect").prop("disabled", false);
            $("label#paymentTermsLabel:not([class~='required'])").addClass("required"); // If class is not there, only then add class.
        }
        
        $("#carrierBillingSelect").trigger('change');
    }
    	
  /*   	// full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   		window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId,'_blank');
     }
    	 */

        function checkAlertMessage(){
            var showMessage = false;
            $('#cart-items-hldr .cart-details').each(function(){
              if($(this).find('input.alertFlagInput').val()== "-1" && isOrderAllowedWithPriceError == 'false'){
                showMessage = true;
               $(this).find('.cartItemTotal').text(" - ");
              }
            });

            if(showMessage){
              $('p.alert-message').show();
            }else{
              $('p.alert-message').hide();
            }
          }
      //On load check for shipment Terms
    	/*if($("#carrierBillingSelect > option:selected").text() == "Prepay and Add"){
    		console.log("Showing Prepay and Add=="+$("#carrierBillingSelect > option:selected").text());
    		$("#carrierSelect").parent().parent().hide();
    		var cboId = $("#carrierBillingSelect > option:selected").val();
    		getTransportModeBasedOnShippingTerms(cboId);
    	}else{
    		console.log("Showing carrier");
    		$("#carrierSelect").parent().parent().show();
    		var cboId = $("#carrierBillingSelect > option:selected").val();
    		getTransportModeBasedOnShippingTerms(cboId);
    		$("#transportMode").val((typeof quoteJson.transportMode)=="undefined"?$("#transportMode	 option:first").val():quoteJson.transportMode.transportModeId);
    	}*/
    	$("#carrierBillingSelect").on('change',function(){
    		var shipmentTerms = $("#carrierBillingSelect > option:selected").text();
    		var cboId = $("#carrierBillingSelect > option:selected").val();
    		if(shipmentTerms == 'Prepay and Add'){
    			$("#carrierSelect").parent().parent().hide();
     		}else{
    			$("#carrierSelect").parent().parent().show();
     		}
    		getTransportModeBasedOnShippingTerms(cboId);
			$("#carrierSelect").prop("selectedIndex", 0);

     	});
    	
    	//Venkatasiva : GPD-2042
		$("#transportMode").on('change',function(){
			$('input:checkbox').removeAttr('checked');
			//$(".shipValue").prop("checked",false);
			var optionValue =	$('#transportMode').val();
			
			//var optionValue = $(this).attr('id');
			console.log("transportMode id : "+optionValue);			
			//$("#transportMode").val(this.id);
			 $("input[value='" + optionValue + "']").prop('checked', true);
			 var cboId = $("#transportMode > option:selected").val();
			 if (undefined != ruleMap && undefined != ruleMap.get(cboId+"_"+3) && undefined != ruleMap.get(cboId+"_"+3).get(3) && ruleMap.get(cboId+"_"+3).get(3)=="true" ){
					$('#machine-serial-no-label').addClass('required');
				}
			 else{
				 	$('#machine-serial-no-label').removeClass('required');
				 }
			
		});
    </script>
</body>
</html>
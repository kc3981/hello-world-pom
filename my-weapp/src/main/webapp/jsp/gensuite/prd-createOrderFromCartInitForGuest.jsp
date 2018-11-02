<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${properties['global.page.title']}</title>

<jsp:include page="../googleAnalytics.jsp" />

<!-- CSS -->
<!-- build:css ../assets/globalstyles.min.css -->
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
<!-- <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->

<style>
div.address-holder .form-control, .input-group .form-control {
	 /*  width: 97% !important; */
}

input[id="keyword"][placeholder="Search for a Part, Product Category"] {
	width: 100% !important;
}

ul#ui-id-1 {
	position: absolute !Important;
	z-index: 999 !important;
}
.emptyCart {
    color: black;
    pointer-events: none;
    cursor: default;
}
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
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
	
<!-- GPD-51: Venkatasiva, Added for dependent country and state drop down list-->
<script type= "text/javascript" src = "../js/countries.js"></script>
<script type= "text/javascript" src = "../js/jquery.select-to-autocomplete.js" defer></script>
<!-- End -->

</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<div class="modal bs-example-modal-md" id="confirmationWindow"  data-backdrop="static" data-keyboard="false">
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
						class="col btn delete-ok charge-ok" href="javascript:;"><spring:message
							code="label.myaccount.ok" /></a> <input type="hidden"
						id="confirmBoxType" />
				</div>
			</div>
		</div>
	</div>
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form:form id="cartToOrderForm" method="post"
			enctype="multipart/form-data">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li class="active"><spring:message code="lable.order.orders" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<h3>
						<spring:message code="label.cart.place.order" />
						- <span id="brandName"></span> <span
							class="column-paddings required-message"> <span
							class="asterik">*</span> <spring:message
								code="label.quote.order.mandatory" /></span>
					</h3>

					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.choose" /></span></li>
						<li class="divider"><span class="success"></span></li>
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
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

							<div class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div class="form-inline col-lg-4 col-md-6 col-sm-6 col-xs-12 column-paddings text-right">
									<label for="customer-no"
										class="labelleftalign control-label column-paddings required"><spring:message
											code="label.quote.order.customer" /></label>
									<div class="input-group col-lg-8 col-md-8 col-sm-8 col-xs-12">
										<input type="text" id="customer-no"
											class="form-control ui-autocomplete-input"
											name="customerName" />
										<!-- <input type="hidden" id="customerVal" class="form-control" /> -->
									</div>
									<a class="tooltip_mobile tooltip_tabber help-button" data-placement="left"
										data-toggle="tooltip" href="javascript:;"
										data-original-title="<spring:message code="label.order.customer.message" />">?</a>
								</div>
								<div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12 column-paddings text-right headerinweb">
									<label for="purchase-orderno"
										class="labelleftalign control-label column-paddings required"><spring:message
											code="label.quote.order.ponumber" /></label>
									<div class="input-group col-lg-7 col-md-7 col-sm-7 col-xs-12">
										<input type="text" id="purchase-orderno"
											class="form-control placeorder-xs" name="poNumber"
											maxlength="22" />
									</div>
								</div>

								<div class="form-group col-lg-4 col-md-6 col-sm-6 col-xs-12 column-paddings text-right reference-noclear">
									<label for="reference-no" class="labelleftalign control-label column-paddings"><spring:message
											code="label.quote.order.your.reference" /></label> 
											<a
										class="help-button visible-xs pull-right"
										data-placement="left" data-toggle="tooltip"
										href="javascript:;"
										data-original-title="<spring:message code="label.order.reference.message" />">?</a>
									<input type="text" id="reference-no" class="form-control"
										name="referenceNumber" maxlength="100" /> <a
										class="help-button hidden-xs tooltip_tabber" href="javascript:;"
										data-toggle="tooltip" data-placement="left"
										title="<spring:message code="label.order.reference.message" />">?</a>
								</div>
								<div class="clearfix"></div>

							</div>

							<!-- Venkatasiva : Made common div for billToAddress and shipToAddress in billToShipToAddressDivForGuest.jsp to use in both Order and Quote pages for guest -->
							<div id="billToShipToAddress">
									<%@ include file="billToShipToAddressDivForGuest.jsp"%>
							</div>
							<!-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  pt-xs-10"> -->
							<div class="col-lg-5 col-md-9 col-sm-9 col-xs-12 column-paddings other_fileds">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
									<div class="clearfix"></div>

									<label id="paymentTermsLabel"
										class="labelleftalign control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
											code="invoice.label.terms" /></label>
									<div
										class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">
										<select class="form-control" id="carrierBillingSelect"
											name="carrierBillingOption">
											<c:forEach items="${carrierBillingOptionList}"
												var="carrierBilling">
												<option value="${carrierBilling.carrierBillingOptionId}">${carrierBilling.description}</option>
											</c:forEach>
										</select>
									</div>
									 <div class="col-lg-12 col-md-12 col-sm-12 carrier_field_mobile">
										<label
											class="labelleftalign control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"><spring:message
												code="label.quote.order.shipping.method" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">

											<select class="form-control" id="carrierSelect"
												name="carrier">
												<option>----- Select ------</option>
												<c:forEach items="${carrierList}" var="carrier">
													<option value="${carrier.carrierId}">${carrier.carrierDescription}</option>
												</c:forEach>
											</select>
										</div>
									 </div> 
									 
									<div class="col-lg-12 col-md-12 nopadding"
										style="display: none;" id="transportModeDiv">
										<label
											class="labelleftalign control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"><spring:message
												code="label.quote.order.transport.code" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<select class="form-control" name="transportMode"
												id="transportMode">
												<option>----- Select ------</option>
											</select>
										</div>
									</div>


									<div class="clearfix"></div>

									<label
										class="labelleftalign control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
											code="label.quote.order.sales.code" /></label>
									<div
										class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">
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

									<div class="clearfix"></div>

									<label
										class="labelleftalign control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"
										for="shipping-instruction"><spring:message
											code="label.quote.order.shipping.inst" /></label>
									<div
										class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">
										<textarea class="form-control" rows="8"
											id="shipping-instruction" name="shippingInstruction"
											maxlength="${shippingDeliveryInstructionLimit}" placeholder="${shippingDeliveryInstructionLimitMsg}"></textarea>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<!--  </div> -->

							<div
								class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12">

								<div
									class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings order_contact_section">


									<h5 class="labelleftalign inline contactName-label">
										<spring:message code="lable.contact.name" />
										:
									</h5>
									<div class="contactName required">
										<i>*</i>
										<p class="inline" id="contact-name"></p>
										<input class="form-control" type="text"
											placeholder="<spring:message code="label.creteordercartinit.enter.name" />"
											name="contactName" id="contactNameInput" maxlength="100">
									</div>
								</div>
								<div
									class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">


									<h5 class="labelleftalign inline contactEmail-label">
										<spring:message code="label.quote.order.email" />
										:
									</h5>
									<div class="contactEmail required">
										<i>*</i>
										<p class="inline" id="contact-email"></p>
										<input class="form-control" type="text"
											placeholder="<spring:message code="label.creteordercartinit.enter.email" />"
											name="contactEmail" id="contactEmailInput">
									</div>
								</div>
								<input type="hidden" id="newConatcExist" name="newConatcExist"
									value="true" />
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					
					<c:out value="${renderHtml}" escapeXml="false" />
					<div>
						<!-- common item list template. Added by Pooja & Reviewed by Rajesh --> 
						<%@ include file="lineItemsForQuotesOrders.jsp"%>
					</div>
					<div class="row">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<div id="cart-items-hldr"
								class="result-container col-lg-9 col-md-9 col-sm-12 col-xs-12">
								<spring:message code="label.quote.order.quick.search.order" />
							</div>

							<div class="col-lg-3 col-md-3 col-sm-8 col-xs-12">

								<div class="quick-search-popover nopadding-sm">
									<div class="quick-search-hldr">
										<div class="box-title">
											<spring:message code="label.quote.order.quick.search" />
										</div>
										<div class="input-group search-quick">
											<!--below four hidden tag used for geting docserver,sapinstaller and media url from properties file  -->
											<input type="hidden" name="docServerUrl"
												value="${properties['docserver.url']}" id="docServerUrl">
											<input type="hidden" name="sapInstalledUrl"
												value="${properties['sap.installer.link']}"
												id="sapInstalledUrl"> <input type="hidden"
												name="mediaUrl" value="${properties['media.Url']}"
												id="mediaUrl"> <input type="hidden"
												name="required3DViewerVersionUrl"
												value="${properties['threed.required.version']}"
												id="required3DViewerVersionUrl"> <input
												type="hidden" name="search_param" value="all"
												id="search_param"> <input type="hidden" id="fuzzy"
												name="fuzzy" /> <input type="hidden" name="pageNumber"
												id="pageNumber"> <input type="hidden"
												name="typedropdown" id="typedropdown" value="all" /> <a
												href="javascript:void(0)" class="clear-search hidden"><i
												class="fa fa-times" style="right: 15px;"></i></a> <input
												id="keyword1" name="keyword" type="text"
												class="form-control  keyword" aria-label="Search"
												placeholder="<spring:message code="label.cart.search.for.parts"/>">
												<input type="hidden" name="isMiniOrderDiscApplicable" id="isMiniOrderDiscApplicable" />
											<!-- <span class="input-group-addon search-glass-hldr"><i class="search-glass-ico"></i></span> -->
										</div>
										<div class="popover-content" id="quickSearchDiv">
											<div class="row cart-item">
												<div class="col-md-12 cartitem">
													<a href="javascript:void(0);" class="quicksearch-img">
														<img id="quickSearchImg" src=""> <!-- INC-2498 fix starts(Developed by : Swetha) -->
														<div class="waterMarkForQuickSearch" id="waterMarkText">
															<span style="margin: 6px; font-weight: 600;"
																class="label1FontFamily"><spring:message
																	code="label.watermark.text1" /> </span> <span
																style="font-size: 7px; font-weight: 400;"
																class="label2FontFamily"><br> <spring:message
																	code="label.watermark.text2" /></br></span>
														</div> <!-- INC-2498 fix ends -->
													</a>
												</div>
											</div>
											<div class="row cart-item">
												<div class="col-md-12 cartitemdetails">
													<h4>
														<a href="javascript:void(0);" class="quicksearch-img"><spring:message
																code="quick.search.item" /> <span id="pNumber"></span></a>
													</h4>
													<%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
													<c:if test="${properties['display.legacy.part']}">
														<div>
															<spring:message code="label.legacy.part" />
															<span id="legacyPart"></span>
														</div>
													</c:if>
													<div id="commDesc"></div>
													<%-- <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> --%>
													<sec:authorize
														access="@customSpringSecurity.hasDivisionPermission('ROLE_ENGG_DESC',#organizationId)">
														<div>
															<span id="enggDesc"></span>
														</div>
													</sec:authorize>
													<c:if test="${properties['display.organizationName']}">
													<div id="orgName"></div>
													</c:if>
													<div>&nbsp;</div>
													<input type="hidden" id="partId" /> <input type="hidden"
														id="mediaId"> <input type="hidden"
														id="organizationId"> <input type="hidden"
														id="ordermultiple" />
													<button class="btn btn-addtocart cart-small"
														id="quickSearchAdd">
														<spring:message code="quick.search.addtoorder" />
													</button>

												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<c:if test="${properties['comments.section.required']==true}">
						<div class="section">
							<div class="clearfix">
								<div class="form-group col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<label class="label-control" for="comments"><spring:message
											code="label.quote.order.comments" /></label>
									<textarea maxlength="200"  rows="4" placeholder="<spring:message code="label.quote.order.comment.limit" />"
										 id="comments" class="form-control" name="comment"></textarea>
								</div>

								<div
									class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings header-links header-links-md">
									<!--  Commented to not to show attachment-->
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="attach-file-section">
											<input id="file-upload" type="file" name="file" /> <label
												for="file-upload"><spring:message
													code="label.quote.order.attach.file" /></label>
											<div class="file-list"></div>
											<input type="hidden" id="attached-fileName"
												name="attchedFileName">
										</div>
									</c:if>
									<div class="clearfix"></div>
								</div>
							</div>
					</c:if>
				</div>
				<%-- <sec:authorize access="hasAnyRole('ROLE_CHANGE_SALES_REP','ROLE_APPLY_CHARGES')">
                <div class="form-horizontal section"  id = "SALES_REP_SECTION">
                 <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" id="sales-id">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
                            <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12 required"><spring:message code="label.quote.order.sales.rep" /></label>
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                <select class="form-control" id="salesRepSelect" name="salesRepresentative">
                                	<option></option>
                                </select>
                            </div>

                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"></div>
                      </div>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings" id="charges-id">
                        <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12"><spring:message code="label.quote.order.charge" /></label>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <select class="form-control" id="chargesSelect">
                            	
                            </select>
                        </div>
                    </div>

                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12" id="charge-value-id">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right currency" id="chargeSymbol"></div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
                                <input type="text" id="charge-value" class="form-control charges-val"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 btn-val-charges">
                            <a href="javascript:;" class="btn-addtocart add" id="add-charges"><spring:message code="label.quote.order.add" /></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="auto-apply-id">
                        <div>
                            <input type="checkbox" id="autoaply-charges" class="ctq-checkbox" name="autoApplyChecked" checked />
                            <label for="autoaply-charges" class="control-label ctq-control-label"><spring:message code="label.quote.order.auto.apply.charge" /></label>
                        </div>
                    </div>
                   </sec:authorize> 
                    <div class="clearfix"></div>
                </div>
                </sec:authorize> --%>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 paddingleft0">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8 paddingleft0">
								<spring:message code="label.quote.order.item.total.am" />
								(<span id="count"></span>
								<spring:message code="label.quote.order.items" />
								)
							</h5>
							<h5
								class="col-lg-2 col-md-2 col-sm-3 col-xs-4 text-right"
								id="subTotal"></h5>
						</div>
						<div id="chargesContainer"></div>




						<p class="alert-message pull-right" style="display: none;">
							<spring:message code="label.total.item.cart.msg" />
						</p>

						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a href="javascript:void(0)"
								class="pull-right green-button next review-order"><spring:message
									code="label.quote.order.review.order.button" /></a>
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
			<div class="modal bs-example-modal-md" id="confirmationWindow"  data-backdrop="static" data-keyboard="false">
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
	
	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="../js/jquery.multiselect.js?version=${properties['application.version']}"defer
		type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script defer
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}"></script>
		
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
		</form:form>
	</div>
	
	
	
	<script id="chargesTemplate" type="text/x-jquery-tmpl">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" >
			<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
			<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4 text-right" data-isAutoApply="${'${'}isAutoApply}" data-chargeId="${'${'}chargeId}" data-chargeName="${'${'}name}">${'${'}overriddenAmount} ${'${'}overriddenCurrencyCode}<i class="fa fa-trash-o remove pull-right remove-charges" ></i></p>
		</div>
	</script>
<!-- GPD-51: Venkatasiva -->
	<script language="javascript">
		populateCountries("billToAddressCountry", "billToStateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	</script>
	<script language="javascript">
		populateCountries("shipToAddressCountry", "shipToStateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	</script>
	<!-- End -->


	<script type="text/javascript">
		//Venkatasiva : GPD-2041
		var ruleMap = new Map();
		var minimumChargesApplied = false;
  	    var  myErrObj = new errnsp.errHandling.init();//19-01-2016  5.5.1.0_EH_ajax_error_msg.
    	var currentUpdatedQuote;
		var chargesDetailsJson;
		var userid,authtoken;
        var disablePaymentTermFlag = false;
        var POFlag = true; //PO Mandatory Field
        var removeChargeId,isAutoApply;
        var isSearch = false;
        var isQuoteOrder=false;
        
        var defaultPartUOM = '${properties["default.part.uom"]}';
        var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
        var ordMult;
        var valueHideOrShow;
        var stateList;
                
        // added by krupa
        function formBreadcrumbsArray(){
			   var itemCategory=$("#headerName").text();
			   var phrase="";
			   
			   $('.breadcrumb').find('li').each(function(){
			            // cache jquery var
			    var current = $(this);
			    var str = $(this).find('a').attr('href');
			    if(phrase=="" && str != null){
		             phrase = current.text()+"_"+str;
		        }else{
				    if(str != null){
				     phrase = phrase+","+current.text()+"_"+str;
				    }else{
				     var currentUrl = window.location.href.split("/")[window.location.href.split("/").length - 1];
				     phrase = phrase+","+ current.text();
				    }
			    }
			  });
			   return phrase;
        };
			//end of added by krupa
      var transportModeApplicable = 0 ;
		var transportModeJson;
		function handleTransportMode(){
 			transportModeApplicable = '${transportModeApplicable}';
 		  	transportModeJson =  JSON.parse('${transportModeMap}');
         	if(transportModeApplicable == 2 || transportModeApplicable == 1){
        		  	$('#transportModeDiv').show();
       		}else{
    		  	$('#transportModeDiv').hide();
       		}
       }
		 
		
        $(document).ready(function(){
            $('.pageLoader').show();
            //Venkatasiva : GPD-2041
            populateRuleMap('${transportModeRulesCheckbox}');
        	 handleTransportMode();
        	 hideOrShowFields('${hideOrShowFields}');
        	 valueHideOrShow = ${hideOrShowFields};
            //$(".close").text("x");
            var comment = $(".item-comments.product-comments>textarea").val();
            if (comment == "")
                {
                    console.log("empty");
                }
                else
                {
                    $(this).show();
                }

        	userid=$('#userId').val();
    		authtoken = $('#authToken').val();
    		
        	 if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1){
                $(".form-horizontal .control-label").css({"padding-top":"0","text-align":"left"});
             }
			
        	var quote = '${jsonQuote}';
        	console.log(quote);
      	  	var quoteJson = JSON.parse(quote);
      	  	var locale=${locale};
			console.log(quoteJson);
			console.log(locale);
			if(typeof quoteJson.cartItemList=="undefined" || quoteJson.cartItemList.length<0){
				$(".review-order").addClass("not-active");
				$('#count').text(0);
				//select all checkbox div must be hidden if length is zero. Added by Pooja.H.S & Reviewed by Rajesh
				$("#checkboxDiv").css('display','none');
			}
			else{
				//select all checkbox div must be hidden if length is zero. Added by Pooja.H.S & Reviewed by Rajesh
				if(quoteJson.cartItemList.length == 0){
					$("#checkboxDiv").css('display','none');
				}else{
					$("#checkboxDiv").css('display','visible');
				}
				$('#cart-items-hldr').html('');
				$("#editQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
                checkAlertMessage();
				// Zero Price issue changes 19/Oct/2015 by Ganeshan 
	            var flagForZeroPrice = false;
	            $.each(quoteJson.cartItemList, function (key, data) {
	                console.log(data)
	                if(data.itemTotalAmount==0){
	                	flagForZeroPrice = true;
	                }
	            })
	            
	            if(flagForZeroPrice){
	            	$(".review-order").addClass("not-active");
	            }
	            else{
	            	$(".review-order").removeClass("not-active");
	            }
				$('#count').text(quoteJson.cartItemList.length);
			}

            filterComments();
            valueHideOrShow = ${hideOrShowFields};
            if (valueHideOrShow["show.order.multiples"] == "TRUE")
            { 
            	$(".order-multiples-lbl").show();
            }
            else
            {
            	$(".order-multiples-lbl").hide();
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
            if(quoteJson.subtotalAmountStr != "-1"){
                $('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
            }else{
                $('#subTotal').text("");
            }
            
            
            $('#chargeSymbol').text((typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
            $('#brandName').text(quoteJson.organization.organizationName);
            
            //set sales rep and charges list
            var chargesDetails = '${chargeDetailsVos}';
            if(chargesDetails!=""){
            	chargesDetailsJson = JSON.parse(chargesDetails);
            	appendChargesData(chargesDetailsJson);
            }
      	  	
      	  	var basicUserDetails = '${basicUserDetailsVos}';
      	  	if(chargesDetails!=""){
				var basicUserDetailsJson = JSON.parse(basicUserDetails);
				var loggedInUserId = '${loggedInUserID}';
	    	  	appendSalesRepData(basicUserDetailsJson,loggedInUserId);
      	  	}
    	  	
      	// carrier and carrier billing option default values
			if(typeof quoteJson.carrier!="undefined"){
				var carrierId = quoteJson.carrier.carrierId;
				$('#carrierSelect').find('option[value="'+carrierId+'"]').attr("selected",true);
				
				if(typeof quoteJson.transportMode!="undefined"){
					reloadDropDown(transportModeApplicable,transportModeJson,1,carrierId);
				         	$("#transportMode").val((typeof quoteJson.transportMode)=="undefined"?$("#transportMode	 option:first").val():quoteJson.transportMode.transportModeId);

				}
			}
		
			if(typeof quoteJson.paymentMethod!="undefined"){
				var paymentMethodId = quoteJson.paymentMethod.paymentMethodId;
				$('#salesCodeSelect').find('option[value="'+paymentMethodId+'"]').attr("selected",true);
			}
			
			if(typeof quoteJson.carrierBillingOption!="undefined"){
				var carrierBillingId = quoteJson.carrierBillingOption.carrierBillingOptionId;
				$('#carrierBillingSelect').find('option[value="'+carrierBillingId+'"]').attr("selected",true);
			}
			else{
				$("#carrierBillingSelect").val($("#carrierBillingSelect option:eq(0)").val());
			}
			
			if(typeof quoteJson.cartName!="undefined")
				$('#reference-no').val(quoteJson.cartName);
			
			if(typeof quoteJson.customerPurchaseOrderNumber!="undefined"){
				$('#purchase-orderno').val(quoteJson.customerPurchaseOrderNumber);
// 			handlepo();
			} 
			
			if(typeof quoteJson.deliveryInstructions1!="undefined")
				$('#shipping-instruction').text(quoteJson.deliveryInstructions1);
			
			if(typeof quoteJson.serialNumber!="undefined")
				$('#machine-serial-no').val(quoteJson.serialNumber);
    	  	
			if(typeof quoteJson.partialShipment!="undefined")
				$('#partial-shipment').prop('checked', quoteJson.partialShipment==true?false:true);
			
			if(typeof quoteJson.isSameDayShipping!="undefined")
				$('#ship-today').prop('checked', quoteJson.isSameDayShipping==true?true:false);
			
			if(typeof quoteJson.machineBreakdown!="undefined")
				$('#unit-down').prop('checked', quoteJson.machineBreakdown==true?true:false);
			
			if(typeof quoteJson.comments!="undefined")
				$('#comments').val(quoteJson.comments);
			
			if(typeof quoteJson.attachedFile!="undefined"){
				$('#attached-fileName').val(quoteJson.attachedFile.fileItem.fileName);
				if(quoteJson.attachedFile.fileItem.fileName!="")
					$('div.file-list').html('<p>' + quoteJson.attachedFile.fileItem.fileName + "<i class='fa fa-trash-o hidden-xs remove' onclick='removeAttachedFile();'></i> </p>");
			}
			if(typeof quoteJson.customerMandatoryVO!="undefined" && quoteJson.customerMandatoryVO.POFlag){ //PO Mandatory Field
				POFlag = true;
				$("#purchase-orderno").parent().siblings("label").addClass("required");
			}
			if(typeof quoteJson.consignmentOrder!="undefined")
				$('#consignment-order').prop('checked', quoteJson.consignmentOrder==true?true:false);
			
			consignmentOrderStatus(quoteJson.customer.customerTypeId);
			
			// Bill to add button allow or not based on flag
			if(!quoteJson.billToOverriddenAllow){
				$('#div-bill-to').hide();
			}
			 
			if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
          	 	$(".order-multiples-lbl").show();
            }
            else{$(".order-multiples-lbl").hide();
            }
		 		
			if(typeof quoteJson.chargeList!="undefined"){
				$("#chargesContainer").html('');
	        	$("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
			}
			//Added by Krupa for Breadcrumbs Issue on 20-Oct-2015
	       	 var previousURL = '${previousURL}';
			        var oldURL = document.referrer;
			        var searchstring = "";
			        var searchType = "";
			        var itemNumber = "";
			        var partId = "";
			        var organizationId = "";
			        var isPromotions = "";
			        var promotionLink ="";
			        var isFromCart="";
			        var cartLink="";
			        var isFromCartBrand = '${isFromCartBrand}';
			        var isorderhere = '${param.isorderoptions}';
			        var searchString = '${breadcrumbsArray}';
			    	$('#breadcrumbsArray').val(searchString);
			    	
				if(null !='${breadcrumbsArray}' && '${breadcrumbsArray}' != '' ){
				          var stringSplit = searchString.toString().split(",");
				          console.log(stringSplit);
				          for(i=0;i<stringSplit.length;i++){
				           console.log(stringSplit[i]);
				           if(stringSplit[i].indexOf('_') > 0){
				           		var name = stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
				           		var hrefLink = stringSplit[i].substring(stringSplit[i].indexOf("_")+1,stringSplit[i].length);
				           		if(hrefLink.indexOf("getfullitemdetails") != -1){
				           			$(".breadcrumb > li:last-child()").before('<li>'+name+'</a></li>').addClass("active"); 
				           		}else{
				           			$(".breadcrumb > li:last-child()").before('<li><a href="'+hrefLink+'">'+name+'</a></li>'); 
				           		}
				           }else{
				        	   $(".breadcrumb > li:last-child()").addClass("active");
				           }
				          }
			   }else{
			       
			        if(oldURL.indexOf("getfullitemdetails") != -1 ){
			        	$("#main-menu-list > li:nth-child(11)").addClass("active");
			        	var fullitemString = oldURL.split("getfullitemdetails");
			        	var fullitemLink = fullitemString[fullitemString.length - 1];
			        	$("#main-menu-list > li:nth-child(11) a").attr("href","getfullitemdetails"+fullitemLink);
			        	if(null!=quoteJson.cartItemList && quoteJson.cartItemList!="undefined" ){
			        		itemNumber = quoteJson.cartItemList[0].partNumber;
			        		partId = quoteJson.cartItemList[0].partId;
			        		organizationId = quoteJson.cartItemList[0].organizationId;
			        	}
			        	var isfromSearch = fullitemLink.split("&")[fullitemLink.split("&").length - 2].split("=")[0];
			        	if(isfromSearch === "searchflag"){	  			        		
				        	isSearch = fullitemLink.split("&")[fullitemLink.split("&").length - 2].split("=")[1];			        
				        	$('#keyword').val(decodeURI(fullitemLink.split("&")[fullitemLink.split("&").length - 1].split("=")[1]));
							$('#typedropdown').val(fullitemLink.split("&")[fullitemLink.split("&").length - 3].split("=")[1]);
			        	}
			        }
			        else  if(oldURL.indexOf("getpromotionparts") != -1 ){
			        	$("#main-menu-list > li:nth-child(10)").addClass("active");  
			        	var promotionString = oldURL.split("/");
			        	var promotionLink = promotionString[promotionString.length - 1];
			        	$("#main-menu-list > li:nth-child(10) a").attr("href",promotionLink);
			        }
			        else if(oldURL.indexOf("getshoppingdetails") != -1 ){
			        	$("#main-menu-list li a[href*='getshoppingdetails']").parent().addClass("active");
			        }
			        
			        
			        if(previousURL.indexOf("getpromotionparts") != -1){
			        	isPromotions = true;	        	
			        	//$("#main-menu-list > li:nth-child(10)").addClass("active");  
			        	var promotionString = previousURL.split("/");
			        	 promotionLink = promotionString[promotionString.length - 1];
			        	//$("#main-menu-list > li:nth-child(10) a").attr("href",promotionLink);
			        }else if(previousURL.indexOf("getshoppingdetails") != -1){
			        	isFromCart = true;
			        	var promotionString = previousURL.split("/");
			        	 promotionLink = promotionString[promotionString.length - 1];
			        }
			        
			        console.log("Bread Crumb"+$("#main-menu-list > li.active").html());	
					$(".breadcrumb").empty();
					$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
					if(isSearch || isQuoteOrder || isPromotions || isFromCart){
						if(isSearch) {
							$(".breadcrumb > li:last-child()").after('<li><a id="breadcrumbsearch"  onclick="breadCrumb()" href="#"><spring:message code="label.whereused.search" javaScriptEscape="true" /></a></li>');
							$(".breadcrumb > li:last-child()").after('<li><a href="#" onclick="fullItemDetails_BreadCrum('+partId+','+organizationId+')"><spring:message code="quick.search.item" javaScriptEscape="true" />'+itemNumber+'</a></li>');
							$('#previousURL').val("");
							//$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#main-menu-list > li.active a").attr('href')+'">'+$("#main-menu-list > li.active a > span").text()+'</li>');
						}
						if(isQuoteOrder){
							$(".breadcrumb > li:last-child()").after('<li><a href='+oldURL+'>'+document.getElementById('hdnQuoteOrder').value+'</li>');
						}
						if(isPromotions){
							$(".breadcrumb > li:last-child()").after('<li><a href="'+promotionLink+'"><spring:message code="label.header.promotions" javaScriptEscape="true" /></a></li>');
							$(".breadcrumb > li:last-child()").after('<li><a href="#" onclick="fullItemDetails_BreadCrum('+partId+','+organizationId+')"><spring:message code="quick.search.item" javaScriptEscape="true" />'+itemNumber+'</a></li>');
							$('#previousURL').val("");
						}
						if(isFromCart){
							$(".breadcrumb > li:last-child()").after('<li><a href="'+promotionLink+'"><spring:message code="label.header.cart" javaScriptEscape="true" /></a></li>');
							$(".breadcrumb > li:last-child()").after('<li><a href="#" onclick="fullItemDetails_BreadCrum('+partId+','+organizationId+')"><spring:message code="quick.search.item" javaScriptEscape="true" />'+itemNumber+'</a></li>');
						}
	        		}else if (!isFromCartBrand){
	        			
	 			   }else{
	 				  if($("#main-menu-list > li.active a").attr('href') == undefined ){
	 					  
	 					}else{
							$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
	 					}
					}
					$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="label.cart.place.order" /></li>');
			   }	
				//Added By Nandakishore JP (For Order Options)
				if(isorderhere == 'true'){
					$(".breadcrumb > li:last-child()").before('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'"><spring:message code="label.order.options"/></li>');
				}
	       		// End of Added by Krupa for Breadcrumbs Issue on 20-Oct-2015
            $('.pageLoader').hide();
           $("#quickSearchDiv").hide();
          //Search bar
	      $("#keyword1").autocomplete({
	    		source : function(request, response) {
	    			var searchString = document.getElementById('keyword1').value;
	    			//NREV-1552 - Added by Pushpa. Reviewed by JK
	    			var escString = "searchString="+escape(searchString)+"&specificOrganization="+quoteJson.organization.organizationId+"&typeDropDown="+$("#typedropdown").val()
	    			$.ajax({
	    				type : "post",
	    				//url : "quicksearchautocomplete?searchString="+searchString+"&specificOrganization="+quoteJson.organization.organizationId+"&typeDropDown="+$("#typedropdown").val(),
	    				//data : request.term.toLowerCase(),
	    				url : "quicksearchautocomplete?"+escString,
	    				dataType : "json",
	    				contentType : 'application/json;charset=ISO-8859-1',
	    				//mimeType : 'application/json;charset=ISO-8859-1',
	    				success : function(data) {
	    					response($.map(data, function(item) {
	    						return {
	    							value : item.lable,
	    							data : item.value
	    						};
	    					}));
	    				},
	    				error: function (jqxhr, status, error) {	  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.  						    	  
	    					//alert(jqxhr.responseText);	   
	    					 $(".pageLoader").hide();
	    			            console.log( "Request Failed 123: " + err );
	    			             console.log( "Request Failed 123: " + jqxhr.responseText );
	    			             var err = jqxhr.status;
	    				          var msg = jqxhr.responseText;
	    			             myErrObj.raise(err,msg,status);
	    			 } 
	    			});
	    		},
	    		autoFocus : true,
	    		change :  function(event, ui) {
	    			$('#fuzzy').val('');
	    		},
                open:function(event) {
                    var width = $(window).width();
                    if(width >= 1025){
                      $('.ui-autocomplete').css({'width': 243 + 'px','max-height': 150 + 'px'});  
                    }
                    else{
                        $('.ui-autocomplete').css({'width': 462 + 'px','max-height': 150 + 'px'});  
                    }
                },
	    		select : function(event, ui) {
	    			$('#keyword1').val(ui.item.label);
                    $(this).prev('a.clear-search').removeClass('hidden');
                    //alert("fromui123" + ui.item.data);
                    //alert("fromui1" + ui.item.label);
	    			//quickSearch(ui.item.data,quoteJson.organization.organizationId);
	    			quickSearch(ui.item.label,quoteJson.organization.organizationId);
	    			$("#quickSearchDiv").show();
	    			return false;
	    		},
	    		minLength : 2 
	      });
            
            
            
            
            
            
            
                   
	      $('.attach-file-section > label').tooltip({'trigger':'hover','placement':'right','title':'<spring:message code="tooltip.quote.filesize" javaScriptEscape="true"/>'});
            $('#file-upload').on('change',function(e){

                if(!e.target.files) return ;

                var file_list=$('div.file-list');
                var innerHtml = "";
                var files = e.target.files;

                for(var i=0; i<files.length; i++) {
                    var f = files[i];
                    if(f.size>5120000){
                    	/* $('div.file-list').html('');
                		$("#file-upload").val(''); */
                		
                		$('.modal-body').text("<spring:message code='alert.quote.order.file.validation' javaScriptEscape='true'/>")
                		$("#myModal").show();
                    	return false;
                    }
                    else
                    	innerHtml+='<p>' + f.name + "<i class='fa fa-trash-o hidden-xs remove' onclick='removeAttachedFile();'></i> </p>";

                }
                file_list.html(innerHtml);

            });

            $('div.file-list').on('click','a.remove',function(){
                
            });

/*            $('.product-comments a').on('click',function(){
                //$(this).parent().find('textarea').fadeToggle('fast');
                $(this).parent().find('textarea').toggleClass('hidden').slideDown('1000');
            });*/
            $(document).delegate('div.product-comments>a','click',function(){
                $(this).parent().find('textarea').toggle();
            });
            
            var isFromCartBrand = '${isFromCartBrand}';
     	   	 // append billto
     	   	 if(isFromCartBrand=="false" && typeof quoteJson.billToAddress.addressName!="undefined"){
     	   		$("#bill-to-add").click();
     	   		$("#billToAddressName").val(quoteJson.billToAddress.addressName);
	     	   	$("#billToAddressCountry").val(quoteJson.billToAddress.addressCountry === null ? "-" :quoteJson.billToAddress.addressCountry);
		   		populateStates("billToAddressCountry", "billToStateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	   		
	   			$("#billToAddressLine1").val(quoteJson.billToAddress.addressLine1);
	   			$("#billToAddressLine2").val(quoteJson.billToAddress.addressLine2);
	 			$("#billToAddressLine3").val(quoteJson.billToAddress.addressLine3);
				$("#billToAddressCity").val(quoteJson.billToAddress.addressCity);
				if(typeof quoteJson.billToAddress.addressState!="undefined"){
					var stateId = $("#billToStateSelect").find('option:contains(-'+quoteJson.billToAddress.addressState+'):first').val();
					$("#billToStateSelect").val(stateId);
				} 
				$("#billToAddressState").val(quoteJson.billToAddress.addressState);
		   		$("#billToAddressZipCode").val(quoteJson.billToAddress.addressZipCode);
		   		$("#billToStateSelect").val(quoteJson.billToAddress.addressState);
     	   	 }
     	   	 
     	   	 if(isFromCartBrand=="false" && typeof quoteJson.shipToAddress.addressName!="undefined"){
     	   		//add existing values on bill to fields
     	   		$("#ship-to-add").click();
   	   			$("#shipToAddressName").val(quoteJson["shipToAddress"].addressName);
	   	   		$("#shipToAddressCountry").val(quoteJson["shipToAddress"].addressCountry === null ? "-" :quoteJson["shipToAddress"].addressCountry);
			    populateStates("shipToAddressCountry", "shipToStateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
		 
   	   			$("#shipToAddressLine1").val(quoteJson["shipToAddress"].addressLine1);
   	   			$("#shipToAddressLine2").val(quoteJson["shipToAddress"].addressLine2);
   	 			$("#shipToAddressLine3").val(quoteJson["shipToAddress"].addressLine3);
   				$("#shipToAddressCity").val(quoteJson["shipToAddress"].addressCity);
   				if(typeof quoteJson.shipToAddress.addressState!="undefined"){
					var stateId = $("#shipToStateSelect").find('option:contains(-'+quoteJson.shipToAddress.addressState+'):first').val();
					$("#shipToStateSelect").val(stateId);
				} 
   				$("#shipToAddressState").val(quoteJson["shipToAddress"].addressState);
			   	$("#shipToAddressZipCode").val(quoteJson["shipToAddress"].addressZipCode);
			   	$("#shipToStateSelect").val(quoteJson["shipToAddress"].addressState);
			   	
			   	$("#contactNameInput").val(quoteJson.contact.fullName);
		   		$("#contactEmailInput").val(quoteJson.contact.primaryEmail);
		   		$("#customer-no").val(quoteJson.customerName);
     	   	 }
     	   	 
     	   	 // override contact details
     	   	if(quoteJson.newContactExist){
     	   		$("a.contact-to-add").click();
     	   		$("#contactNameInput").val(quoteJson["contact"].fullName);
	   			$("#contactEmailInput").val(quoteJson["contact"].primaryEmail);
     	   	}
     	

        });
        
        
        function quickSearch(searchString,organizationId){
        	var locale=${locale};
        	var displayLegacyPart = '${properties['display.legacy.part']}';
	    	  $.ajax({  
	              type : "Get",
	              contentType: 'application/json;charset=ISO-8859-1',
	              mimeType: 'application/json;charset=ISO-8859-1',
	              url : "searchonparts",
	              data : {
	            	    searchString : searchString,
	            	    specificOrganization : organizationId,
					},
	              success : function(response) {  
	               console.log(response[1]);
	               var commDesc="",enggDesc="";
	               //var descriptionList = response[1].source.description;
	               if(typeof response[1]!="undefined"){
	            	   /* if(locale="en_US"){
							commDesc = response[1].source.commercialDescription_en_US;
							enggDesc = response[1].source.engineeringDescription_en_US;
						}
						else{
							commDesc = response[1].source.commercialDescription_de_DE;
							enggDesc = response[1].source.engineeringDescription_de_DE;
						} */
						commDesc = response[1].source.commDesc;
				   		enggDesc = response[1].source.enggDesc;
              		 //  enggDesc = descriptionList[].engineeringDescription;
		           	   if(response[1].source.mediaId==0){
		           		$("#quickSearchImg").hide();
	           			//NREV-1486 fix starts
           	   	   		$("#waterMarkText").hide();
           	  			//NREV-1486 fix ends
		           	   }
		           	   else{
		           		  $("#quickSearchImg").attr("src","${properties['docserver.url']}?media="+response[1].source.mediaId+"&thumbnail=true&user="+userid+"&token="+authtoken);
		           		//NREV-1486 fix starts
		           		if(!response[1].source.isActualImage){
		           			$("#waterMarkText").show();
		           		}
		           		//NREV-1486 fix ends
		           	   }
			               	 
		           	   
		           	   var hasPriceAccess = response[1].hasPriceAccess;
		           		// orderable check for add to cart button
		           	   if((response[1].source.orderable=="false") || (hasPriceAccess == "false")){
			            	   $("#quickSearchAdd").addClass('not-active');
			               }
		           	else{
		            	   $("#quickSearchAdd").removeClass('not-active');
		               }
			               
			               $("#pNumber").text(response[1].source.partNumber);
			               //Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar
			               if(displayLegacyPart){
				               if(response[1].source.legacyPartNumber == null || response[1].source.legacyPartNumber==""){
				            		$("#legacyPart").text(${properties['lable.item.none']});
				               } else {
				               		$("#legacyPart").text(response[1].source.legacyPartNumber);
				               }
			               }
			               $("#commDesc").text(commDesc);
			               $("#enggDesc").text(enggDesc);
			               $("#orgName").text(response[1].source.organizationName + " Parts");
			               $("#partId").text(response[1].source.partId);
			               $("#mediaId").text(response[1].source.mediaId);
			               $("#organizationId").text(response[1].source.organizationId);
	               }
						
	               
	              },  
	              error: function (jqxhr, status, error) {	  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.  						    	  
  					//alert(jqxhr.responseText);	   
  					 $(".pageLoader").hide();
  			            console.log( "Request Failed 123: " + err );
  			             console.log( "Request Failed 123: " + jqxhr.responseText );
  			             var err = jqxhr.status;
  				          var msg = jqxhr.responseText;
  			             myErrObj.raise(err,msg,status);
  				 } 
	             });
	    	  
	    	  
	      }
        
        
        function dropDownEvents(json){
        	 contactChange();
    	     var billToAddresses = json.billToAddresses;
    	   	 var docBillTo = $('#billtoSelect');
    	   	 var defaultBillToId = json.billToAddressId;
    	   	 
    	     var billToShipToMap = json.billToShipToMap;
    	    
    	   	 var shipToAddresses = billToShipToMap[billToAddresses[0].addressId];
    	     var docShipTo = $('#shiptoSelect');
    	     var defaultShipToId = json.shipToAddressId;
    	   	 
    	   	 // append billto
   	   	 	 appendOption(billToAddresses,docBillTo,defaultBillToId);
   	   	     $('#billToDetails').html();
 	   		 $('#billToDetails').html(setAddress(billToAddresses[0]));
    	   	 
    	   	 // append shipto
    	   	 appendOption(shipToAddresses,docShipTo,defaultShipToId);
    	   	 $('#shipToDetails').html();
    	   	 
    	   	var defaultShipTo;
    	   	for(var i=0; i<shipToAddresses.length;i++){
               if(shipToAddresses[i].addressId==defaultShipToId){
            	   defaultShipTo = shipToAddresses[i];
            	   break;
               }
    	     } 
    	   	
    	   	if(typeof defaultShipTo=="undefined"){
    	   		defaultShipTo = shipToAddresses[0];
    	   	}
    	   	
    	   	$('#shipToDetails').html(setAddress(defaultShipTo));//Fix for GS-901
    	   	
        }
        
        
        $('.contact-details').on('change', function(){
        	contactChange();
        })
        
        function contactChange(){
        	var contactName = $('.contact-details :selected').val();
            var contactEmail = $('.contact-details :selected').text();
			var nameOfContact = contactName.toString().split(",")
            $('#contact-name').text(nameOfContact[0]);
            $('#contact-email').text(contactEmail);
        }
        
        function appendOption(options,doc,defaultId){
        	doc.find('option').remove();
        	for(var i=0; i<options.length;i++){
     	    	 var opt = $("<option></option>");
                /* opt.attr("selected",elem.Selected); */
                if(options[i].addressId==defaultId)
                	opt.attr("selected","selected");
                opt.text(options[i].addressReference + " - " +options[i].addressName);
                opt.val(options[i].addressId);
      	        doc.append(opt);
     	     } 
        }
        
        function appendDataForContact(contactListJson){
        	$('.contact-details').find('option').remove();
        	if(contactListJson!=null){
        		for(var i=0; i<contactListJson.length;i++){
          	       var opt = $("<option></option>");
                     
                     if(typeof contactListJson[i].isDefaultContact!="undefined")
                     	opt.attr("selected","selected");
                     opt.text(contactListJson[i].primaryEmail);
                     opt.val(contactListJson[i].fullName + "," +contactListJson[i].primaryEmail + "," + contactListJson[i].contactReference);
                     $('.contact-details').append(opt);
          	     }
        	}
        	else{
        		var opt = $("<option></option>");
        		$('.contact-details').append(opt);
        	}
        	
        	contactChange();
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
        
        $('#shiptoSelect').on('change', function(){
        	var customerId = $('#customerVal').val();
        	var shipTo = $('#shiptoSelect').val();
        	$.ajax({  
    	        type : "GET",
    	        data : {customerId: customerId,shipTo: shipTo},
    	        url : "getcontactlistforshipto",
    	        success : function(response) {
					var responseJson = JSON.parse(response);
					console.log(responseJson.contactJson);
					appendDataForContact(responseJson.contactJson);
					$('#shipToDetails').html();
		    	   	$('#shipToDetails').html(setAddress(responseJson.addressJson));
    	        },  
    	        error : function(e) {     
    	        }  
    	    });
        })
        
        $('.review-order').on('click', function(e){
        	
        	/*item comment change*/
            $(document).delegate('textarea.comment-controller','change', function(){
            	var comment = $(this).val();
                var partId =$(this).parents('div.item-comments').attr('comment-itemId');
                itemcommentChange(partId,comment); 
              });
        	 
            /*explicitly change item quantity*/
            $(document).delegate('.input-qty-box','change', function(evt){
              var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
              var partId =$(this).parents('.qty-change-div').attr('id');
              var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
              
              quantity = getOrderMultiplesForQuantity(quantity, partId, ordMultiple);
              editQuantity(partId,quantity);
              
            });
            
            var lineItemHolder = $('#cart-items-hldr');
            
            var isOrderEnabled = "FALSE";
            
            var filterValue = JSON.parse('${hideOrShowFields}');
            
            if(typeof filterValue["create.order.withoutprice"]!="undefined"){
         	   isOrderEnabled = filterValue["create.order.withoutprice"]
            } 
            var disableButton = false;
            if(isOrderEnabled == "FALSE" || isOrderEnabled == "false"){    
           	   lineItemHolder.find('.cart-details').each(function(index){
	                if($(this).find('input[type="hidden"]').val()=="-1"){
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
        				if(response == 'true' && (paymentMethodId == 2 || paymentMethodId == 3 || paymentMethodId == 4)){
        	        		//$('.modal-body').text("<spring:message code='alert.quote.order.price.validation1' javaScriptEscape='true'/>")
        	        		$('.modal-body').text("<spring:message code='message.cannot.place.order.for.zero.price' javaScriptEscape='true'/>")
        	                $("#myModal").show();
        	                return false;
        	        	}else{
        	        		$('#cartToOrderForm').attr("modelAttribute","cartToOrderForm");
        	        		$('#cartToOrderForm').attr("action","createorderreview");
        	        		var breadcrumbsPhrase = formBreadcrumbsArray();
        					$('#breadcrumbsArray').val(breadcrumbsPhrase);
        					$('#cartToOrderForm').submit();
        	        	}
        			},
        			error : function(e) {

        			}
        		});

        }
		
        });
		
		 /*increase item quantity*/
    $(document).delegate('.plus-qty','click', function(){
       var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
       var partId =$(this).parents('.qty-change-div').attr('id');
       
       editQuantity(partId,quantity);
     });
    
    /*decrease item quantity*/
    $(document).delegate('.minus-qty','click', function(){
        var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
        var partId =$(this).parents('.qty-change-div').attr('id');
        var ordMult =$(this).parents('.spinner-control').attr('data-ordermultiplekey');
        if(quantity<0)
     	    {
     	    $(this).parents('.qty-change-div').children('.total-items').val(ordMult);
     	  // $('.modal-body').text("<spring:message code='alert.quote.order.item.qty.validation1' javaScriptEscape='true'/> "+ ordMult);
            //$("#myModal").show();
        }
     	else
        	editQuantity(partId,quantity);
      });
    $(document).delegate('input.get-input-price','keypress', function(e){
         if (e.which != 8 && e.which != 0 && e.which != 44 && e.which != 46 && (e.which < 48 || e.which > 57)) {
            //display error message
                   return false;
        }
       var text = $(this).val();

        if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2) && e.which != 8 ) {
            e.preventDefault();
        } 
   });
    /*item price change*/
    $(document).delegate('input.get-input-price','change', function(){
        var price = $(this).val();
        var oldPrice = $(this).parents().attr("data-your-price");
        if(price === ""){
            $('.modal-body').text("<spring:message code='alert.quote.order.price.validation1' javaScriptEscape='true'/>") 
            $("#myModal").show();
            return false;
        }
        else if(price == "0"){
        	$(this).val(oldPrice);

            $('.modal-body').text("<spring:message code='alert.quote.order.price.validation2' javaScriptEscape='true'/>")
            $("#myModal").show();
            return false;
        }
        else if(price < 0){
        	$(this).val(oldPrice);

            $('.modal-body').text("<spring:message code='alert.quote.order.price.validation3' javaScriptEscape='true'/>")
            $("#myModal").show();
            return false;
        }
        else
        {
            /* var RE = /^\d*(\.\d{1})?\d{0,1}$/;
            if(!RE.test(price)){ */
            /*if(validateSpecialCharacterAndAlphanumeric(price)== true){
            	$(this).val(oldPrice);
                $('.modal-body').text("<spring:message code='alert.quote.order.price.validation4' javaScriptEscape='true'/>")
                $("#myModal").show();
                 return false;
             }*/
        }
        var partId =$(this).parents('div.nopadding').attr('data-itemId');
        editPrice(partId,price); 
      });
    
    /*item comment change*/
    $(document).delegate('textarea.comment-controller','change', function(){
        var comment = $(this).val();
        var partId =$(this).parents('div.item-comments').attr('comment-itemId');
        itemcommentChange(partId,comment); 
      });
    
    /*edit item quantity*/
    function editQuantity(partId,quantity){
    	$('div.pageLoader').show();
         $.ajax({
	          type : "Get",
	          /* data : "cartItemId=" + cartItemId, */
	         data : {partId: partId,quantity: quantity},
	          contentType: 'application/json',
	          mimeType: 'application/json',
	        //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
	          dataType:"json",
	          url : "editquoteitemquantity",
	          success : function(response) {
	        	  var locale=${locale};
	        	  console.log(response);
	        	    /* $("#cart-items-hldr").html('');
	        	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr"); */
                    if(response.cartItem.priceMSRPStr != "-1"){
                        $(".cartItemMsrp[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.priceMSRPStr + " " +(typeof response.cartItem.currencyCode=="undefined"?"":response.cartItem.currencyCode));//set MSRP
                    }else{
                        $(".cartItemMsrp[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                    }

                    if(response.cartItem.itemTotalMSRPStr != "-1"){
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.itemTotalMSRPStr+ " " +(typeof response.cartItem.currencyCode=="undefined"?"":response.cartItem.currencyCode));//set MSRP
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parent().siblings().val("1");

                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parents('.price-box').find('input.alertFlagInput').val(response.cartItem.itemTotalMSRPStr);
                        checkAlertMessage();
                    }else{
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parent().siblings().val("-1");
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parents('.price-box').find('input.alertFlagInput').val("-1");
                        if(!$('p.alert-message').is(':visible')){
                            $('p.alert-message').show();
                        }
                    }
                    if(response.cartItem.inventoryMessage != ''){
                    	$(".b-label[data-cartItem='"+response.cartItem.partId+"']").find('div > strong').text(response.cartItem.inventoryMessage);
					}
					

                    filterComments();
                    valueHideOrShow = ${hideOrShowFields};
    	            if (valueHideOrShow["show.order.multiples"] == "TRUE")
    	            { 
    	            	$(".order-multiples-lbl").show();
    	            }
    	            else
    	            {
    	            	$(".order-multiples-lbl").hide();
    	            }
                    if(response.shoppingCart.subtotalAmountStr != "-1"){
                        $('#subTotal').text(response.shoppingCart.subtotalAmountStr+" "+(typeof response.shoppingCart.currencyCode=="undefined"?"":response.shoppingCart.currencyCode));
                    }else{
                        $('#subTotal').text("");
                    }
	        	    
	        	    $('div.pageLoader').hide();
	          },  
	          error : function(e) {  
	        	  $('div.pageLoader').hide();
	          }  
	        }); 
      }
    
    /*edit item  price*/
    function editPrice(partId,price){
    	$('div.pageLoader').show();
     $.ajax({
         type : "Get",
         /* data : "cartItemId=" + cartItemId, */
        data : {partId: partId,priceStr: price},
         contentType: 'application/json',
         mimeType: 'application/json',
         url : "editquoteitemprice",
         success : function(response) {
       	  console.log(response);
       	   var locale=${locale};
       	    $("#cart-items-hldr").html('');
       	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
            checkAlertMessage();
            filterComments();
            valueHideOrShow = ${hideOrShowFields};
            if (valueHideOrShow["show.order.multiples"] == "TRUE")
            { 
            	$(".order-multiples-lbl").show();
            }
            else
            {
            	$(".order-multiples-lbl").hide();
            }
            if(response.subtotalAmountStr != "-1"){
                $('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
            }else{
                $('#subTotal').text("");
            }
       	    
	       	 $('div.pageLoader').hide();
         },  
         error : function(e) {     
        	 $('div.pageLoader').hide();
         }  
       });
     }
    
    

     
    
    /*comment change*/
    function itemcommentChange(partId,comment){
     $.ajax({
         type : "Get",
         /* data : "cartItemId=" + cartItemId, */
         data : {partId: partId,comment: comment},
         contentType: 'application/json',
         mimeType: 'application/json',
         url : 'edititemcomment',
         success : function(response) {
          var locale=${locale};
       	  console.log(response);
       	    $("#cart-items-hldr").html('');
       	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
            checkAlertMessage();
            filterComments();
            valueHideOrShow = ${hideOrShowFields};
            if (valueHideOrShow["show.order.multiples"] == "TRUE")
            { 
            	$(".order-multiples-lbl").show();
            }
            else
            {
            	$(".order-multiples-lbl").hide();
            }
            if(response.subtotalAmountStr != "-1"){
                $('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
            }else{
                $('#subTotal').text("");
            }
       	    
         },  
         error : function(e) {    
         }  
       });
     }
	 
/* 	 function validateKey(e) {
     if (e.which != 8 && e.which != 0 && e.which != 50 && e.which != 47 && (e.which < 46 || e.which > 57 )) {
        //display error message
        $(".errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
        }
        var DigitsAfterDecimal = 2;
        var val = $(this).val();
        if(val.length - (val.indexOf(".")) > DigitsAfterDecimal)                          
        {     
            if(val.indexOf(".") == -1){
                return true;
            }                   
            alert("Only " +DigitsAfterDecimal + " digits Are Allowed After Decimal.");                      
            return false;                

            } 
 } */
 
 	function appendSalesRepData(basicUserDetailsJson,loggedInUserId){
		$('#salesRepSelect').find('option').remove();
		for(var i=0; i<basicUserDetailsJson.length;i++){
			var opt = $("<option></option>");
			if(basicUserDetailsJson[i].userId==loggedInUserId)
				opt.attr("selected","selected");
			opt.text(basicUserDetailsJson[i].userId + " - " +basicUserDetailsJson[i].firstName+" "+basicUserDetailsJson[i].lastName);
			opt.val(basicUserDetailsJson[i].userId);
			$('#salesRepSelect').append(opt);
		 } 
 	}
	
	function appendChargesData(chargesDetailsJson){
		$('#chargesSelect').find('option').remove();
		var blankOpt = $("<option>------------ Select ------------</option>");
		$('#chargesSelect').append(blankOpt);
		for(var i=0; i<chargesDetailsJson.length;i++){
			var opt = $("<option></option>");
			opt.text(chargesDetailsJson[i].chargeId + " - " +chargesDetailsJson[i].name);
			opt.val(chargesDetailsJson[i].chargeId);
			$('#chargesSelect').append(opt);
		 } 
 	}
	
	$('#chargesSelect').on('change', function(){
		var selectedChargeId = $('#chargesSelect :selected').val();
		var defaultAmount;
		for(var i=0; i<chargesDetailsJson.length;i++){
			if(chargesDetailsJson[i].chargeId==selectedChargeId){
				defaultAmount = chargesDetailsJson[i].defaultAmount;
				break;
			}
		}
		$('.charges-val').val(defaultAmount);
	})
	
	// adding selected charges
	$('#add-charges').on('click', function(){
		var selectedChargeId = $('#chargesSelect :selected').val();
		var chargeAmount = $('#charge-value').val().trim();
		
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
		}else if(chargeAmount<0){ /** GS-649 **/
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
         data : {selectedChargeId:selectedChargeId,chargeAmount:chargeAmount},
         contentType: 'application/json',
         mimeType: 'application/json',
         url : 'setcreatequotechargedetail',
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
	
	$(document).delegate('.remove-charges','click', function(){
	    	removeChargeId = $(this).parent().attr('data-chargeId');
	    	isAutoApply = $(this).parent().attr('data-isAutoApply');
	    	var chargeName = $(this).parent().attr('data-chargeName');
	    	$("#confirmationWindow").show();
	    	$('.dialog-content').text("<spring:message code='label.createquotefromcartconfirm.messages.charge' javaScriptEscape='true'/> #"+chargeName);
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
					
					// check removed auto apply charge or other charge
					if(isAutoApply=="true"){
						//unchecked the auto apply checkbox 
						$('#autoaply-charges').prop('checked', false);
					}
	            },  
	            error : function(e) {   
	            }  
	          });
	});
	
	$(".cancel").click(function(){
		$("#confirmationWindow").hide();
		return false;
	});
	
	
	/*explicitly change item quantity*/
    $(document).delegate('.input-qty-box','change', function(evt){
      var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
      var partId =$(this).parents('.qty-change-div').attr('id');      
      var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
      
      quantity = getOrderMultiplesForQuantity(quantity, partId, ordMultiple);
      editQuantity(partId,quantity);
      
    });
	
	function formValidation(){
		var customer = $('#customer-no').val();
		/* var billTo = $('#billtoSelect').val();
		var shipTo = $('#shiptoSelect').val(); */
		var carrier = $('#carrierSelect').val();
		var salesCode = $('#salesCodeSelect').val();
		var carrierBilling = $('#carrierBillingSelect').val();
  		var cartItemCount = $('#count').text();
  		//INC-1578
		var poNumber =  $('#purchase-orderno').val().trim();
  		//Venkatasiva : GPD-2041
		var cboId = $("#transportMode > option:selected").val();
		if(carrierBilling == 0){
			 disablePaymentTermFlag = true;
		}	
		
		if(customer===null || customer==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.customer.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(POFlag && (poNumber===null || poNumber=="")){
			$('.modal-body').text("<spring:message code='alert.quote.order.ponumber' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		/* else if(billTo===null || billTo==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.billto.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(shipTo===null || shipTo==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		} */
		else if(cartItemCount==0){
			$('.modal-body').text("<spring:message code='alert.order.lineitem.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(salesCode===null || salesCode==""){
			$('.modal-body').text("<spring:message code='label.quote.order.sales.code.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(!disablePaymentTermFlag && (carrierBilling===null || carrierBilling=="")){
			$('.modal-body').text("<spring:message code='alert.quote.order.payment.term' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}
		//Venkatasiva : Made common function to validate billTo shipTo address for quote and order creation 
		else if(!validateBillToShipToAddressGuest()){
			return false;
		}
		
		else if(!ValidateEmail($("#contactEmailInput").val())) {
            $('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.email.invalid' javaScriptEscape='true'/>");
            $("#myModal").show();
            return false;
        }//Venkatasiva : GPD-2041
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
  		handleTransportModeDropDown(transportModeJson,this.value,transportModeApplicable);
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
		
	})
	
	/* // full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   		window.open("getfullitemdetailsUsingCartId?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+'&isFromQuoteOrder=true&cartItemId='+cartItemId,'_blank');
     }
	
	function fullItemRedirect(itemId, orgId){
	   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
	   		window.open("getfullitemdetails?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+'&isFromQuoteOrder=true','_blank');
	     } */
	
	function getRefreshedPriceForItems(){
		$.ajax({
            type : "Get",
            contentType: 'application/json',
            mimeType: 'application/json',
          //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
            dataType:"json",
            url : 'getrefreshedrriceforitem',
            success : function(response) {
            	var locale=${locale};
				if(response.cartItemList!=null && response.cartItemList.length>0){
					$('#cart-items-hldr').html('');
		            $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
                    checkAlertMessage();
                    filterComments();
                    valueHideOrShow = ${hideOrShowFields};
    	            if (valueHideOrShow["show.order.multiples"] == "TRUE")
    	            { 
    	            	$(".order-multiples-lbl").show();
    	            }
    	            else
    	            {
    	            	$(".order-multiples-lbl").hide();
    	            }
		            $('#count').text(response.cartItemList.length);
                    if(response.subtotalAmountStr != "-1"){
                        $('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
                    }else{
                        $('#subTotal').text("");
                    }
		            
				}
            },  
            error : function(e) {    
            }  
          });
	}
	
	$(".quicksearch-img").on('click',function(){
  	     fullItemRedirect($('#partId').text(),$('#organizationId').text())
	});
	


    function setPaymentTermBasedOnSalesCode(){
        // If Sales code = Credit card, then Payment Terms is Disabled and becomes non-mandatory field
        var selectedSalesCodeId = $('#salesCodeSelect').val();
        $("#salesCodeSelect > option").each(function() {
            if((2 == selectedSalesCodeId || 3 == selectedSalesCodeId || 4 == selectedSalesCodeId  && selectedSalesCodeId==this.value)){
                 disablePaymentTermFlag=true;
                 $('#purchase-orderno').val('Credit Card');
                 $("#purchase-orderno").attr("readonly", "readonly");
            }else{
                disablePaymentTermFlag=false;
                $('#purchase-orderno').val('');
            	$("#purchase-orderno").removeAttr("readonly");
            }
        });
        if(disablePaymentTermFlag){
            // GS-1038 fixed.
            $('#mySelect').append($('<option>', {
                value: 0,
                text: ' '
            }));
            $("#carrierBillingSelect").val(0).val();
            $("#carrierBillingSelect").prop("disabled", true);
            $("label#paymentTermsLabel").removeClass("required");
        }else{
        	$("#carrierBillingSelect").val($("#carrierBillingSelect option:eq(0)").val());
        	$("#carrierBillingSelect").prop("disabled", false);
            $("label#paymentTermsLabel:not([class~='required'])").addClass("required"); // If class is not there, only then add class.
        }
    }

	function removeAttachedFile(){
		$('div.file-list').html('');
		$("#file-upload").val('');
		$('.modal-body').text("<spring:message code='alert.quote.order.file.delete' javaScriptEscape='true'/>")
		$("#myModal").show();
		$("#attached-fileName").val('');
	}
    
    function filterComments(){
        $('#cart-items-hldr .product-comments > textarea').each(function(){
            
        	if($(this).val() !== ""){
                $(this).show();
                $(this).prev('a').text("<spring:message code='label.quote.order.edit.comment' javaScriptEscape='true'/>");
            }else{
                $(this).prev('a').text("<spring:message code='label.quote.order.add.comment' javaScriptEscape='true'/>");
            }
        });
    }
    
    function ValidateEmail(email) {
    	var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	return expr.test(email);
    };
    function checkAlertMessage(){
        var showMessage = false;
        $('#cart-items-hldr .cart-details').each(function(){
          if($(this).find('input.alertFlagInput').val()== "-1"){
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
    
    
    function getOrderMultiplesForQuantity(quantity, partId, ordMultiple) {
		var itemCount = parseFloat(quantity);			
		var incFactor = parseFloat(ordMultiple);
		
		//itemCount = (itemCount >= 999.99) ? 999.99 : itemCount;
		var newVal = 0.0;
		if(itemCount >= 999.99){
			newVal = (999.99 - (999.99 % incFactor));
		}
		else if((itemCount % incFactor) == 0)
		{
			newVal = itemCount;
		}
		else if ((itemCount % incFactor) > 0.0){
			newVal = (itemCount - (itemCount % incFactor)) + incFactor ;
		}
		
		if(isNaN(itemCount) || itemCount == 0.0 ){
			newVal = incFactor;
		}
		
		newVal = (newVal >999.99) ? newVal - incFactor : newVal;
		
		if(newVal == 0.0 && incFactor!=null && incFactor != 0.0 && itemCount !=0.0 ){
			
			newVal = itemCount*incFactor;
		}
		
		return parseFloat(newVal);
  }
  	//Venkatasiva 		
		/* $('#shipToAddressCountry').on('change',function(){
			 //var countrySelected = $('#shipToAddressCountry').find("option:selected" ).text();
			 //To get the option value i.e., country code
			 var countrySelected = $('#shipToAddressCountry').val();
			  $("#shipToAddressCountry").val(countrySelected);			  
		});
		$('#shipToStateSelect').on('change',function(){
			 //var stateSelected = $('#shipToStateSelect').find("option:selected" ).text();
			 //To get the option value i.e., state code
			 var stateSelected = $('#shipToStateSelect').val();
			  $("#shipToAddressState").val(stateSelected);			  
		});
		 $('#billToAddressCountry').on('change',function(){
			 // var countrySelected = $('#billToAddressCountry').find("option:selected" ).text();
			 //To get the option value i.e., country code
			 var countrySelected = $('#billToAddressCountry').val();
			  $("#billToAddressCountry").val(countrySelected);
			  // Populate States for ship to address is same as bill to address
			  //populateStates("billToAddressCountry", "shipToStateSelect");
		});
   		$('#billToStateSelect').on('change',function(){
			  //var stateSelected = $('#billToStateSelect').find("option:selected" ).text();
			  //To get the option value i.e., state code
			  var stateSelected = $('#billToStateSelect').val();
			  $("#billToAddressState").val(stateSelected); 
		});*/
   	//Venkatasiva End
	
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

	//On load check for shipment Terms
	//INC-1764 CARRIER SHOULD NOT BE SHOWN FOR PREPAY AND ADD
		if($("#carrierBillingSelect > option:selected").text() == "Prepay and Add"){
			$("#carrierSelect").parent().parent().hide();
			
			var cboId = $("#carrierBillingSelect > option:selected").val();
			getTransportModeBasedOnShippingTerms(cboId);
			
			
		}
		/* var userApplication = $('#userApplication').val();
		 if(userApplication == "REVFIRE"){
			 $("#carrierBillingSelect").parent().hide();
			 $("#paymentTermsLabel").hide();
			 getTransportModeBasedOnShippingTerms(1);
		}  */
		//Venkatasiva : GPD-3449	    	 
    	var hideOrShowTransportModeFieldsOrderGuest = ${hideOrShowFields};
        if (hideOrShowTransportModeFieldsOrderGuest["is.shipment.terms.flag.visible"] != "TRUE")
        { 
        	 $("#carrierBillingSelect").parent().hide();
			 $("#paymentTermsLabel").hide();
			 getTransportModeBasedOnShippingTerms(1);
        }
		$("#carrierBillingSelect").on('change',function(){
			var shipmentTerms = $("#carrierBillingSelect > option:selected").text();
			var cboId = $("#carrierBillingSelect > option:selected").val();
			var transportModeJson =  JSON.parse('${transportModeMap}');
			if(shipmentTerms == 'Prepay and Add'){
				$("#carrierSelect").parent().parent().hide();
				getTransportModeBasedOnShippingTerms(cboId);
			}else{
				$("#carrierSelect").parent().parent().show();
				$('#transportMode').empty();
			}
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
		var manualStateChange = true;
		History.Adapter.bind(window,'statechange',function(){
	    	manualStateChange = false;
	    	//alert("dfsaf");
	    	 window.location.href = 'homepage';
	    	var x = document.referrer.split("/");
	    	if(x[x.length-1] == "createquotereview"){
	    		/* document.forms[0].action="homepage";
	    		document.forms[0].submit(); */
	    		 window.location.href = 'homepage';
	    	}
	 	 
	    });
    </script>
</body>
</html>
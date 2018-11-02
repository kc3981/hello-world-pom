<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<!-- GPD-51: Venkatasiva, Added for dependent country and state drop down list-->
	<script type= "text/javascript" src = "../js/countries.js"></script>
	<script type= "text/javascript" src = "../js/jquery.select-to-autocomplete.js" defer></script>
<!-- End -->
<script type= "text/javascript" src = "../js/dealer.scripts.js" ></script>
<style type="text/css">
ul#ui-id-1 {
	position: absolute !Important;
	z-index: 999 !important;
}
.emptyCart {
    color: black;
    pointer-events: none;
    cursor: default;
}
</style>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form:form id="editQuoteForm" name="editQuoteForm"
			modelAttribute="editQuoteForm" action="editquotereview" method="post"
			enctype="multipart/form-data">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li><a href="getquotes"><spring:message
								code="lable.quote.quotes" /></a></li>
					<li class="active"><spring:message
							code="report.label.quotenumber" /> <span
						class="quoteNumber"></span></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">

					<h3>
						<spring:message code="report.label.quotenumber" />
						<span class="quoteNumber"></span> <span
							class="column-paddings required-message"> <span
							class="asterik">*</span> <spring:message
								code="label.quote.order.mandatory" /></span>
					</h3>

					<div class="form-inline section">

						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.by" />
								:
							</h5>
							<p class="inline" id="quotedBy"></p>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.date" />
								:
							</h5>
							<p class="inline">
								<fmt:formatDate pattern="${dateformat}" value="${quoteDate}" />
							</p>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 quoteStatusMsg"
							style="display: none">
							<span><spring:message code="adapter.quote.exception" /></span>
						</div>

						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div
								class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">
								<label for="customer-no"
									class="control-label column-paddings required" id="customer_dealer_name"><spring:message
										code="view.label.customer" /></label>
								<div class="input-group col-lg-8 col-md-8 col-sm-8 col-xs-12" id="customerNameAndId">
									<input type="text" id="customer-no" class="form-control"
										readOnly /> <input type="hidden" id="customerVal"
										class="form-control"/>
								</div>
							</div>
							<div
								class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">
								<label for="reference-no" class="control-label column-paddings"><spring:message
										code="view.label.your.reference" /></label> <a
									class="help-button visible-xs pull-right" href="javascript:;"
									data-toggle="tooltip" data-placement="left"
									title='<spring:message code="label.quote.reference.message"/>'>?</a>
								<input type="text" id="reference-no" class="form-control"
									name="referenceNumber" maxlength="200" /> <a
									class="help-button hidden-xs" href="javascript:;"
									data-toggle="tooltip" data-placement="left"
									title='<spring:message code="label.quote.reference.message"/>'>?</a>
							</div>
							<!-- Venkatasiva : Made common div for billToAddress and shipToAddress in billToShipToAddressDivForUser.jsp to use in Order, Quote and edit pages for user -->
							<div id="billToShipToAddress">
									<%@ include file="billToShipToAddressDivForUser.jsp"%>
							</div>
							<div
								class="col-lg-5 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

									<label
										class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs" id="carrierBillingOptionLable"><spring:message
											code="view.label.payment.terms" /></label>
									<div
										class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
										<sec:authorize access="hasRole('ROLE_CHANGE_PAYMENTTERMS')">
											<select class="form-control" id="carrierBillingSelect"
												name="carrierBillingOption">
												<c:forEach items="${carrierBillingOptionList}"
													var="carrierBilling">
													<option value="${carrierBilling.carrierBillingOptionId}">${carrierBilling.description}</option>
												</c:forEach>
											</select>
										</sec:authorize>

										<sec:authorize access="!hasRole('ROLE_CHANGE_PAYMENTTERMS')">
											<select class="form-control disabled-onpermission"
												id="carrierBillingSelect" name="carrierBillingOption">
												<c:forEach items="${carrierBillingOptionList}"
													var="carrierBilling">
													<option value="${carrierBilling.carrierBillingOptionId}">${carrierBilling.description}</option>
												</c:forEach>
											</select>
										</sec:authorize>
									</div>

									<div class="rowx">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"><spring:message
												code="label.quote.order.shipping.method" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<select class="form-control" name="carrier"
												id="carrierSelect">
												<option>-----
													<spring:message code="label.quote.order.select" /> ------
												</option>
												<c:forEach items="${carrierList}" var="carrier">
													<option value="${carrier.carrierId}">${carrier.carrierDescription}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 nopadding"
										style="display: none;" id="transportModeDiv">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs ">
											<spring:message code="label.quote.order.transport.code" />
										</label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<select class="form-control" name="transportMode"
												id="transportMode">
												<option>----- Select ------</option>
											</select>
										</div>
									</div>



									<sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
										<div
											class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
											id="sales-id">
											<div
												class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
												<label
													class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
														code="label.quote.order.sales.rep" /></label>
												<div
													class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
													<select class="form-control" id="salesRepSelect"
														name="salesRepresentative">
														<option></option>
													</select>
												</div>
											</div>
										</div>
									</sec:authorize>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
										id="salesAreaDiv">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
											<label
												class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs required"><spring:message
													code="label.sales.area" /></label>
											<div
												class="contactEmail col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
												<p class="inline" id="contact-email"></p>
												<input class="form-control" type="text" readOnly
													name="salesArea" id="salesArea">
												<sec:authorize access="hasRole('ROLE_CHANGE_SALES_AREA')">
													<div class="inline">
														<button type="button" id="open" class="btn btn-success"
															data-toggle="modal" data-target="#demo-1">
															<span class="glyphicon glyphicon-pencil"
																aria-hidden="true"></span>
														</button>
													</div>
												</sec:authorize>
											</div>
										</div>
									</div>
									<label
										class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"
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

							<div
								class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
								<!-- div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12 column-paddings">
                                <label class="control-label col-lg-12 col-md-2 col-sm-4 col-xs-12 column-paddings"><spring:message code="label.quote.order.contact" /></label>
                                <div class="col-lg-7 col-md-7 col-sm-4 col-xs-12 nopadding">
                                	 <select class="form-control contact-details selectwidth" name="contact"></select>
                                </div>
                                <!-- <input type="checkbox" class="ctq-checkbox" id="new-contact"/>
                                <label for="new-contact" class="control-label ctq-control-label">New</label> 
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 bill-to-add nopadding-xs">
									<a href="javascript:;" class="btn-addtocart add contact-to-add" data-toggle="tooltip" data-placement="top" title='<spring:message code="label.creteordercartinit.msg.add.contact" />'><spring:message code="label.quote.order.add" /></a>
                                 	<a href="javascript:;" class="btn-addtocart add contact-to-cancel" style="display: none;" data-toggle="tooltip" data-placement="top" title='<spring:message code="label.creteordercartinit.msg.contact.cancel" />'><spring:message code="label.quote.order.reset" /></a>
								</div>
                            </div-->
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">


									<h5 class="inline contactName-label">
										<spring:message code="label.quote.order.name" />
									</h5>
									<div class="contactName">
										<p class="inline" id="contact-name"></p>
										<input class="form-control" type="text"
											placeholder='<spring:message code="label.creteordercartinit.enter.name" />'
											name="contactName" id="contactNameInput" maxlength="100">
									</div>
								</div>
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">


									<h5 class="inline contactEmail-label">
										<spring:message code="label.quote.order.email" />
									</h5>
									<div class="contactEmail">
										<p class="inline" id="contact-email"></p>
										<input class="form-control" type="text"
											placeholder='<spring:message code="label.creteordercartinit.enter.email" />'
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
						<!-- common item list template. Added by Pooja & Reviewed by Rajesh-->
						<%@ include file="lineItemsForQuotesOrders.jsp"%>
					</div>
					<div class="row">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<div id="cart-items-hldr"
								class="result-container col-lg-9 col-md-9 col-sm-12 col-xs-12">

							</div>

							<div class="col-lg-3 col-md-3 col-sm-8 col-xs-12">

								<div class="quick-search-popover">
									<div class="quick-search-hldr">
										<div class="box-title column-paddings">
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
												href="javascript:void(0);" class="clear-search hidden"><i
												class="fa fa-times" style="right: 15px;"></i></a> <input
												id="keyword1" name="keyword" type="text"
												class="form-control  keyword" aria-label="Search"
												placeholder='<spring:message code="label.cart.search.for.parts"/>'>
											<!-- <span class="input-group-addon search-glass-hldr"><i class="search-glass-ico"></i></span> -->
										</div>
										<div class="popover-content" id="quickSearchDiv"
											style="display: none;">
											<div class="row cart-item">
												<div class="col-md-12 cartitem">
													<a href="#" class="fullItemRedirect"><img
														id="quickSearchImg" src="" alt="catalog-img"></a>
													<!-- // Fix for GS-677 -->
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
													<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
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
														id="organizationId">
													<!--  Fix for GS-677 -->
													<input type="hidden" id="ordermultiple" />
													<button class="btn btn-addtocart cart-small"
														id="quickSearchAdd">
														<spring:message code="quick.search.addtoquote" />
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
									class="col-lg-6 col-md-6 col-sm-12 col-xs-12 column-paddings header-links  header-links-md">
									<!-- Commented to not to show attachment -->
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="attach-file-section">
											<input id="file-upload" type="file" name="file" /> <label
												for="file-upload"><spring:message
													code="label.quote.order.attach.file" /></label>
											<div class="file-list">
												<a href="javascript:;" id="attach-file-click"> <span
													id="attachedFileName"></span>
												</a> <a href='javascript:;' class='remove remove-attach-file'
													onclick='removeAttachedFile();'><i
													class="fa fa-trash-o hidden-xs remove"></i></a> <input
													type="hidden" id="attached-fileName" name="attchedFileName">

											</div>
										</div>
									</c:if>

									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</c:if>
					<%-- <sec:authorize access="hasAnyRole('ROLE_CHANGE_SALES_REP','ROLE_APPLY_CHARGES')">
                <div class="form-horizontal section chargesSection" id = "SALES_REP_SECTION">
                <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" id="sales-id">
                        <div class="col-lg-8 col-md-8 col-sm-10 col-xs-12 column-paddings">
                            <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12 required"><spring:message code="label.quote.order.sales.rep" /></label>
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                <select class="form-control" id="salesRepSelect" name="salesRepresentative">
                                   <!--  <option>1 - Jane Doe</option>
                                    <option>2 - John Doe</option>
                                    <option>3 - Richard Roe</option> -->
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
                                <!-- <option>100 - Handling/Labor</option>
                                <option>190 - Crate Charges</option>
                                <option>200 - Minimum Order Charge</option>
                                <option>708 - 15% Restocking Fee</option>
                                <option>900 - Export Surcharge</option> -->
                            </select>
                        </div>
                    </div>

                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12" id="charge-value-id">
                        <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right currency" id="chargeSymbol"></div> <! -- Fix for GS-522 -->
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
                                <input type="text" id="charge-value" class="form-control charges-val"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 btn-val-charges">
                            <a href="javascript:;" class="btn-addtocart add " id="add-charges"><spring:message code="label.quote.order.add" /></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="auto-apply-id">
                        <div>
                            <input type="checkbox" id="autoaply-charges" name="autoApplyChecked" class="ctq-checkbox" checked />
                            <label for="autoaply-charges" class="control-label ctq-control-label"><spring:message code="label.quote.order.auto.apply.charge" /></label>
                        </div>
                    </div>
                    <!--<div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <label class="label-control col-lg-4 col-md-4 col-sm-4 col-xs-6 charges-label">Surcharge</label>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                            <select class="form-control">
                                <option>Select Surcharge</option>
                                <option>EXP - Export Charges</option>
                            </select>
                        </div>
                    </div>-->
                    </sec:authorize> 
                    <div class="clearfix"></div>
                </div>
			</sec:authorize> --%>
					<div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-5 col-sm-offset-4 col-xs-8">
								<spring:message code="label.quote.order.item.total.am" />
								(<span id="count"></span>
								<spring:message code="label.quote.order.items" />
								)
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-3 col-xs-4 text-right"
								 id="subTotal"></h5> <!-- style="padding: 0px 0px" -->
						</div>
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
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a href="javascript:void(0)"
								class="pull-right green-button next review-quote not-active"
								id="save-changes"><spring:message
									code="label.editquote.save.changes" /></a>
							<sec:authorize access="hasRole('ROLE_ORDER')">
								<a href="javascript:void(0)"
									class="pull-right blue-button not-active"
									id="place-order-click"><spring:message
										code="label.cart.place.order" /></a>
							</sec:authorize>
						</div>
					</div>

				</div>
			</div>

			<div class="modal bs-example-modal-md" id="myModal"  data-backdrop="static" data-keyboard="false">
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
							<p class="dialog-content" ></p>
						</div>
						<div class="modal-footer custom-modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
								class="col btn delete-ok charge-ok" href="javascript:;"><spring:message
									code="label.myaccount.ok" /></a> <input type="hidden"
								id="confirmBoxType" />
						</div>
					</div>
				</div>
			</div>

			<!------    Search Component           ----->
			<!-- SUPPORT-MIL-223-170216 -->
			<!------    Search Component           ----->
			<div class="modal modal-quotes fade" id="demo-1" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content  custom-modal-content">

						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title caps" id="myModalLabel">
								<strong><spring:message code="label.sales.area" /></strong>
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<div class="row">
								<div class="col-sm-5 col-lg-5 inlineblock">
									<label
										class="control-label col-lg-3 col-md-3 col-sm-4 col-xs-12 required"><spring:message
											code="label.sales.area.by" /></label>
									<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
										<select name="carrierSales" id="searchType"
											class="form-control">
											<!-- Removed Hard code values for sales area POP UP: By Hari-->
											<option value="0" selected disabled><spring:message
													code="label.sales.area.search.column.select" /></option>
											<option value="1"><spring:message
													code="label.sales.area.search.column.orgref" /></option>
											<option value="2"><spring:message
													code="label.sales.area.search.column.distribution" /></option>
											<option value="3"><spring:message
													code="label.sales.area.search.column.desciption" /></option>

										</select>
									</div>
								</div>
								<div class="col-sm-5 col-lg-4 inlineblock">
									<label
										class="control-label col-lg-4 col-md-4 col-sm-4 col-xs-12 required"><spring:message
											code="label.sales.area.value" /></label>
									<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="searchText" class="form-control">
									</div>
								</div>
								<div class="col-sm-2 col-lg-3">
									<button class="btn btn-default" id="searchAddress">
										<spring:message code="label.sales.area.search" />
									</button>
								</div>
								<div class="col-sm-12 text-center emptyText">
									<p></p>
								</div>

							</div>
							<div class="row">
								<div class="preload-icon" style="display: none;"></div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table id="quotes-table"
										class="table table-striped table-bordered"
										style="display: none;">
										<tr>
											<th><spring:message
													code="label.sales.area.search.column.select" /></th>
											<th><spring:message
													code="label.sales.area.search.column.orgref" /></th>
											<th><spring:message
													code="label.sales.area.search.column.orgname" /></th>
											<th><spring:message
													code="label.sales.area.search.column.distribution" /></th>
											<th><spring:message
													code="label.sales.area.search.column.desciption" /></th>
										</tr>

									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</form:form>
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
	</div>

	<sec:authorize
		access="@customSpringSecurity.hasDivisionPermission('ROLE_ORDER',#organizationId)"
		var="hasROLE_ORDER" />
	<!-- Javascript Plugins -->
		<script src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer type="text/javascript"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		<script src="../js/gensuite-ui.js?version=${properties['application.version']}" type="text/javascript"></script>
		<script src="../js/custom.scripts.js?version=${properties['application.version']}" type="text/javascript"></script>
		<script src="../js/hideOrShowFields.js?version=${properties['application.version']}" defer type="text/javascript"></script><!-- 19-01-2016  5.5.1.0_EH_ajax_error_msg. -->
	<script src="../js/searchComponent.js?version=${properties['application.version']}" defer type="text/javascript"></script>
   
	<script id="chargesTemplate" type="text/x-jquery-tmpl">
		{{if active}}
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" >
				<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
				<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4 nopadding" data-isAutoApply="${'${'}isAutoApply}" data-chargeId="${'${'}chargeId}" data-chargeName="${'${'}name}">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode}<i class="fa fa-trash-o remove pull-right remove-charges" ></i></p>
			</div>
		{{/if}}
	</script>
	<!-- GPD-51: Venkatasiva -->
	<script language="javascript">
		populateCountries("shipToAddressCountry", "stateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	</script>	
	<!-- End -->
	<script type="text/javascript">
	
	 var isQuoteAllowedWithPriceError = '${isQuoteAllowedWithPriceError}'; 
	 var isOrderAllowedWithPriceError = '${isOrderAllowedWithPriceError}'; 
	
    var  myErrObj = new errnsp.errHandling.init();	//19-01-2016  5.5.1.0_EH_ajax_error_msg.
    var userid,authtoken,childCartId;
    var chargesDetailsJson;
    var removeChargeId,isAutoApply;
    var transportModeApplicable = 0 ;
	var transportModeJson;
	
	var defaultPartUOM = '${properties["default.part.uom"]}';
    var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
    var ordMult;
    var valueHideOrShow;
    var shopToAddClickTracking = 0;
    var isShipToOverridden=false;
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
	
    
	$(document).ready(function(){
	   
			 handleTransportMode();
        	userid=$('#userId').val();
    		authtoken = $('#authToken').val();
            hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
            
            valueHideOrShow = ${hideOrShowFields};
            
            $('div.file-list').on('click','a.remove',function(){
                
            });


            $(document).delegate('div.product-comments>a','click',function(){
                $(this).parent().find('textarea').toggle();
            });
            $(".input-price").keypress(function (e) {
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
            });
            
            
            //****************************************
            
            $(document).delegate('div.product-comments>a','click',function(){
            	$('#save-changes').removeClass('not-active');
            });
        	
			$("#bill-to-add").click(function(){

        		 $(this).hide().siblings("#bill-to-cancel").show();
        		 $('.bill-to-address').children('div.column-paddings.address-holder').hide();
        	      $('.bill-to-address').children("div.nopadding.address-holder").show();
        	      $('div>select#billtoSelect').prop('disabled', true);
				  $('#billToNewAddExist').val("true");
				  
				// reset all input fields of bill to
				  $('#bill-to-add-div').find('input:text').val('');
        	    });
        	 $("#bill-to-cancel").click(function(){
        		 $(this).hide().siblings("#bill-to-add").show();
        		 $('.bill-to-address').children('div.column-paddings.address-holder').show();
        	      $('.bill-to-address').children("div.nopadding.address-holder").hide();
        	      $('div>select#billtoSelect').prop('disabled', false);
				  $('#billToNewAddExist').val("false");

        	    });
        	 $('a.contact-to-add').click(function(){
        		 if($('#shipToNewAddExist').val()=="true"){
        			 return false;
        		 }
        		 else{
        			 $(this).hide().siblings(".contact-to-cancel").show();
	        		 $('select.contact-details ').prop('disabled', true);
	        		 $('.contactName').children('#contact-name').hide();
	        		 $('.contactName').children(".contactName>.form-control").show();
	       	      	 $('.contactEmail').children('#contact-email').hide();
	        		 $('.contactEmail').children(".contactEmail>.form-control").show();
	        		 $('#newConatcExist').val("true");
	        		// reset contact input fields
	        		 $('#contactNameInput').val('');
					 $('#contactEmailInput').val('');
        		 }        		 
        	 });
        	 $('a.contact-to-cancel').click(function(e){

        		 	if($(this).hasClass('not-active')){
                        e.preventDefault();
                        return false;
                    }
        		 
        			 $(this).hide().siblings(".contact-to-add").show();
            		 $('select.contact-details').prop('disabled', false);
            		
        		 $(this).hide().siblings(".contact-to-cancel").show();
        		 $('.contactName').children('#contact-name').show();
        		 $('.contactName').children(".contactName>.form-control").hide();
       	      	$('.contactEmail').children('#contact-email').show();
        		 $('.contactEmail').children(".contactEmail>.form-control").hide();
				$('#newConatcExist').val("false");
				
        	 });
        	 
			
        	var quote = '${jsonQuote}';
      	  	var quoteJson = JSON.parse(quote);
      	  	isShipToOverridden=quoteJson.isShipToOverriden;
      	 	var hasRole_Order=${hasROLE_ORDER};
      	 	if(hasRole_Order){
      	 		if(quoteJson.hasPlaceOrderPOCC && !quoteJson.isGuestChildCart){
      	  		
      	  			$('#place-order-click').removeClass('not-active');
      	  		}
      	 	}
      	 	if(quoteJson.isGuestChildCart){
      	 		$('#save-changes').hide();
  	  		}
			
			// Set customer Sales Area, Changed by Ganeshan 4th Feb
			//SUPPORT-MIL-223-170216
			var customerSalesAreaCurrencyVo = quoteJson.customerSalesAreaCurrencyVo;
			if(typeof customerSalesAreaCurrencyVo!="undefined" && customerSalesAreaCurrencyVo){
				$("#salesArea").val(customerSalesAreaCurrencyVo.description);
        	}
      	 	
			$("#shipping-instruction").attr("maxlength",200);
  	    	$("#shipping-instruction").attr("rows",8);
  	    	
      	  	var locale=${locale};
			console.log(quoteJson);
			console.log(locale);
			console.log(quoteJson.cartItemList);
			childCartId = quoteJson.childCartId;
			var quoteStatus = quoteJson.cartStatusId;
			if(quoteStatus === 2 || quoteStatus === 4){
				$('.quoteStatusMsg').show();
				   $(".content-wrapper :input,a").prop("disabled", true);
				   $(".content-wrapper a").removeAttr('href').css('pointer-events','none');
				   $('.content-wrapper i').prop('onclick',null).off('click');	
			}
            $("#editQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
            checkAlertMessage();
         // Zero Price issue changes 20th/Oct/2015 by Ganeshan 
            var flagForZeroPrice = false;
            $.each(quoteJson.cartItemList, function (key, data) {
                console.log(data)
                if(data.itemTotalAmount==0){
                	flagForZeroPrice = true;
                }
            })
            
            if(flagForZeroPrice){
            	$(".review-quote").addClass("not-active");
            }
            else{
            	$(".review-quote").removeClass("not-active");
            }
            
            if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
        	 	$(".order-multiples-lbl").show();
            }else{$(".order-multiples-lbl").hide();
            }
            
            filterComments();
            $('#count').text(quoteJson.cartItemList.length);
            if(quoteJson.cartItemList.length>0){
            	if(quoteJson.subtotalAmountStr !== "-1"){
            		$('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
                	$('#chargeSymbol').text((typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
                }else{
                    $('#subTotal').text("");
                }
            }else{
            	$('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
            	$('#chargeSymbol').text((typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
            }
            
            if((typeof quoteJson.chargeList)!="undefined"){
            	$("#chargesContainer").html('');
                $("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
            }
            
            var fields = JSON.parse('${hideOrShowFields}');
			if(typeof quoteJson.taxAmount!="undefined" &&  fields["show.sales.tax"] == "TRUE" && quoteJson.taxAmountStr !="-1"){
				$('#additionalCharges').show();
 	      	    $('#taxVal').text(quoteJson.taxAmountStr+ " ");
	      	    $('#taxVal').append(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode);
			}
            
            
            $('#comments').val(quoteJson.comments);
            
            $('.quoteNumber').text(quoteJson.quoteNumber);
            if(typeof quoteJson.quotedBy!="undefined")
            	$('#quotedBy').text(quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName);
            else
            	$('#quotedBy').text(quoteJson.contact.fullName);
            //$('#quotedBy').text(quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName);
           // $('#quotedDate').text(quoteJson.quoteCreatedDate);
            $('#reference-no').val(quoteJson.cartName);
            $('#shipping-instruction').val(quoteJson.deliveryInstructions1);
            $('#machine-serial-no').val(quoteJson.serialNumber);
            $('#partial-shipment').prop('checked', quoteJson.partialShipment==true?false:true);
            $('#ship-today').prop('checked', quoteJson.isSameDayShipping);
            $('#unit-down').prop('checked', quoteJson.machineBreakdown);
            $('#autoaply-charges').prop('checked', quoteJson.autoApplyCharges);
           
            if(typeof quoteJson.attachedFileName=="undefined"){
            	$('.remove-attach-file').removeClass('remove');
            	$('.remove-attach-file').hide();
            }
            else{
            	$('#attachedFileName').html(quoteJson.attachedFileName);
            	$('#attached-fileName').val(quoteJson.attachedFileName)
            }
            
            if(typeof quoteJson.editBackFlag!="undefined" && quoteJson.editBackFlag){
            	$('#place-order-click').addClass('not-active');
            	  $('#save-changes').removeClass('not-active');
            }
            
            
            $( "#customer-no" ).val(quoteJson.customer.customerReference + " - " +quoteJson.customer.customerName);
            $('#customerVal').val(quoteJson.customer.customerId)
            
      /*       if(typeof quoteJson.consignmentOrder!="undefined")
				$('#consignment-order').prop('checked', quoteJson.consignmentOrder==true?true:false);
			
			consignmentOrderStatus(quoteJson.customer.customerTypeId); */
			
            if(typeof quoteJson.state!="undefined"){
				var stateId = quoteJson.state.stateId;
				var selected =$('#stateSelect').find('option[value="'+stateId+'"]').prop("selected",true);
				console.log(selected);
			}
            //set sales rep and charges list
            var chargesDetails = '${chargeDetailsVos}';
            
            if(chargesDetails!=""){
            	chargesDetailsJson = JSON.parse(chargesDetails);
            	appendChargesData(chargesDetailsJson);
            }
      	  		
      	  	var basicUserDetails = '${basicUserDetailsVos}';
      	  	if(basicUserDetails!=""){
				var basicUserDetailsJson = JSON.parse(basicUserDetails);
				var loggedInUserId = quoteJson.quotedBy.userId;
	    	  	appendSalesRepData(basicUserDetailsJson,loggedInUserId);
      	  	}
      	  	
      	  // attached file download	
      	  $('#attach-file-click').on('click', function(){
          	var fileName = $('#attachedFileName').text();
          	window.location.href = 'exportattachedfileforquoteorder?childCartId='+quoteJson.childCartId+'&fileName='+fileName;
          })
          
      	  
          $("#carrierSelect").val((typeof quoteJson.carrier)=="undefined"?$("#carrierSelect option:first").val():quoteJson.carrier.carrierId);
      	  	if(typeof quoteJson.carrier!="undefined" && typeof quoteJson.transportMode!="undefined"){
      	  		reloadDropDown(transportModeApplicable,transportModeJson,1,quoteJson.carrier.carrierId);
    			$("#transportMode").val((typeof quoteJson.transportMode)=="undefined"?$("#transportMode	 option:first").val():quoteJson.transportMode.transportModeId);
      	  	}
 	    		

    		if((typeof quoteJson.carrierBillingOption)!="undefined")
     	  $("#carrierBillingSelect").val(quoteJson.carrierBillingOption.carrierBillingOptionId);
    	  	
            
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
	    		select : function(event, ui) {
	    			$('#keyword1').val(ui.item.label);
                    $(this).prev('a.clear-search').removeClass('hidden');
	    			quickSearch(ui.item.value,quoteJson.organization.organizationId);
	    			$("#quickSearchDiv").show();
	    			return false;
	    		},
	    		minLength : 2 ,
                open: function() { 
                   var width = $(window).width();
                    if(width >= 1025){
                    $('ul.ui-menu').width(243); 
                }
                else if(width >= 900){
                      $('ul.ui-menu').width(204);  
                    }
                else{
                    $('ul.ui-menu').width(440); 

                } 
                }
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
                    	
                		$('.modal-body').text('<spring:message code="alert.quote.order.file.validation" javaScriptEscape="true"/>')
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

/*            $('div.product-comments a').on('click',function(){
                $(this).parent().find('textarea').toggleClass('hidden').slideDown('1000');
            });*/
            
            
            var val = '${userProfileDetails}';
      	  	var json = JSON.parse(val);
      	  
      	  	//if(typeof contactListJson!="undefined" && contactListJson!=null)
      	    	//appendDataForContact(contactListJson, defaultContact);
      	  $("#carrierSelect").val((typeof quoteJson.carrier)=="undefined"?$("#carrierSelect option:first").val():quoteJson.carrier.carrierId);	
      	  if((typeof quoteJson.carrierBillingOption)!="undefined"){
	       	  	$("#carrierBillingSelect").val(quoteJson.carrierBillingOption.carrierBillingOptionId);
		       //Added during merge for GSP-935
				 if("${properties['user.application']}" == 'REV'){	
		       	  	if(quoteJson.carrierBillingOption.carrierBillingOptionId == 1){
			    		$("#carrierSelect").parent().parent().hide();
	 		  		}else{
		  				console.log("Hiding Carrier===");
	 		    		$("#carrierSelect").parent().parent().show();
	 	     	  	}
		       	 }
	       	 	var cboId = $("#carrierBillingSelect > option:selected").val();
	    		var transportmodeId;
				if((typeof quoteJson.transportMode)!="undefined"){
					transportmodeId = quoteJson.transportMode.transportModeId
				}
				if(userApplication == "REVFIRE"){
					$("#carrierBillingSelect").parent().hide();
					$("#carrierBillingOptionLable").hide();
					$("#carrierSelect").parent().parent().hide();
    			} 
	    		getTransportModeBasedOnShippingTerms(cboId,transportmodeId);
 				
	      	}
      	  	
      	// Bill to add button allow or not based on flag
			if(!quoteJson.billToOverriddenAllow){
				$('#div-bill-to').hide();
			}
      	   
      	     // set contact name and email
           //  $('#contact-name').text((typeof quoteJson.contact.fullName) == "undefined"?"-":quoteJson.contact.fullName);
          //   $('#contact-email').text((typeof quoteJson.contact.primaryEmail) == "undefined"?"-":quoteJson.contact.primaryEmail);
     	     
     	     var billToAddresses = json.billToAddresses;
     	   	 var docBillTo = $('#billtoSelect');
     	   	 var primaryBillToAddress=quoteJson["billToAddress"];
     	   	 var billToShipToMap = json.billToShipToMap;
     	   	 var defaultBillToId;
     	   	 var dafaultBillTo;
     	   	 var shipToAddress;
     	   	 
   	 		 // Override bill To
     	   	 if(typeof primaryBillToAddress.addressId == "undefined"){
     	   		$("#bill-to-add").click();
     	   		for (var k in billToShipToMap) {
     	           if (billToShipToMap.hasOwnProperty(k)) {
     	        	  shipToAddress = billToShipToMap[k];
     	        	  break;
     	           }
     	        }
     	   	  	
     	   		//add existing values on bill to fields
   	   			$("#billToAddressName").val(primaryBillToAddress.addressName);
   	   			$("#billToAddressLine1").val(primaryBillToAddress.addressLine1);
   	   			$("#billToAddressLine2").val(primaryBillToAddress.addressLine2);
   	 			$("#billToAddressLine3").val(primaryBillToAddress.addressLine3);
   				$("#billToAddressCity").val(primaryBillToAddress.addressCity);
   				$("#billToAddressState").val(primaryBillToAddress.addressState);
			   	$("#billToAddressZipCode").val(primaryBillToAddress.addressZipCode);
			   	$("#billToAddressCountry").val(primaryBillToAddress.addressCountry === null ? "-" :primaryBillToAddress.addressCountry);	
   	   	
	    	   	defaultBillToId = json.billToAddress.addressId;
	    	   	dafaultBillTo = json.billToAddress;
     	   		
     	   	 }
     	   	 else{
     	   		shipToAddress = billToShipToMap[primaryBillToAddress.addressId];
     	   		defaultBillToId = quoteJson.billToAddress.addressId;
     	   		dafaultBillTo = quoteJson.billToAddress;
     	   	 }
     	   	 
     	 	 // append billto
    	   	 appendOption(billToAddresses,docBillTo,defaultBillToId);
    	   	 $('#billToDetails').html('');
    	   	 $('#billToDetails').html(setAddress(dafaultBillTo));
     	     
     	   	 
     	   	 var defaultShipToId;
     	   	 var docShipTo = $('#shiptoSelect');
     	   	 var dafaultShipTo;
     	     
         	 if(isDealerUser=='true'){
          	 	fillShipToDetailsForDealerUser(json,quoteJson);
         	 }
     	 	 // Override Ship To
     	   	 if(isShipToOverridden){
     	   		$("#ship-to-add").click();
     	   		
     	   		//add existing values on bill to fields
   	   			$("#shipToAddressName").val(quoteJson["shipToAddress"].addressName);
   	   			
     	   		$("#shipToAddressCountry").val(quoteJson["shipToAddress"].addressCountry === null ? "-" :quoteJson["shipToAddress"].addressCountry);
     	   	    populateStates("shipToAddressCountry", "stateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
     	   		
     	   	    $("#shipToAddressLine1").val(quoteJson["shipToAddress"].addressLine1);
   	   			$("#shipToAddressLine2").val(quoteJson["shipToAddress"].addressLine2);
   	 			$("#shipToAddressLine3").val(quoteJson["shipToAddress"].addressLine3);
   				$("#shipToAddressCity").val(quoteJson["shipToAddress"].addressCity);
   				//$("#shipToAddressState").val(quoteJson["shipToAddress"].addressState);
			   	$("#shipToAddressZipCode").val(quoteJson["shipToAddress"].addressZipCode);
			   	//$("#shipToAddressCountry").val(quoteJson["shipToAddress"].addressCountry === null ? "-" :quoteJson["shipToAddress"].addressCountry);			   	
			   	
				$("#shipToAddressState").val(quoteJson["shipToAddress"].addressState);
				$("#stateSelect").val(quoteJson["shipToAddress"].addressState);
			   	
			   	
			   	$('#shipToDetails').html('');
	    	   	$('#shipToDetails').html(setAddress(json.shipToAddress));
	    	   	defaultShipToId = json.shipToAddress.addressId;
	    	   	dafaultShipTo = json.shipToAddress;
     	   	 }
     	   	 else{
	     	   	 $('#shipToDetails').html('');
	     	   	 $('#shipToDetails').html(setAddress(quoteJson.shipToAddress));
	     	   	 defaultShipToId = quoteJson.shipToAddress.addressId;
	     	   	 dafaultShipTo = quoteJson.shipToAddress;
     	   	 }
     	   	 // append shipto
     	   	 appendOption(shipToAddress,docShipTo,defaultShipToId);
     	   	 $('#shipToDetails').html('');
    	   	 $('#shipToDetails').html(setAddress(dafaultShipTo));
    	   	 
    	  	// override contact details
      	   	if(typeof quoteJson.contact.contactReference=="undefined"){
      	   		$("a.contact-to-add").click();
      	   		$("#contactNameInput").val(quoteJson["contact"].fullName);
 	   			$("#contactEmailInput").val(quoteJson["contact"].primaryEmail);
      	   	}
     	   	 
        });
        
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
        
        function appendDataForContact(contactListJson, defaultcontact){
        	$('.contact-details').find('option').remove();
        	for(var i=0; i<contactListJson.length;i++){
     	       var opt = $("<option></option>");
                
     	       	if(defaultcontact==contactListJson[i].contactReference)
     	       		opt.attr("selected","selected");
     	       	else if(defaultcontact==""){
     	       		if(typeof contactListJson[i].isDefaultContact!="undefined")
     	       			opt.attr("selected","selected");
     	       	}
     	       	
                opt.text(contactListJson[i].primaryEmail);
                opt.val(contactListJson[i].fullName + "," +contactListJson[i].primaryEmail + "," + contactListJson[i].contactReference);
                $('.contact-details').append(opt);
     	     }
        	contactChange();
        }
        
        function contactChange(){
        	var contactName = $('.contact-details :selected').val();
            var contactEmail = $('.contact-details :selected').text();
			var nameOfContact = contactName.toString().split(",")
            $('#contact-name').text(nameOfContact[0]);
            $('#contact-email').text(contactEmail);
            
        }
        
        function quickSearch(searchString,organizationId){
        	var locale=${locale};
        	var displayLegacyPart = '${properties['display.legacy.part']}';
	    	  $.ajax({  
	              type : "Get",
	              contentType: 'application/json',
	              mimeType: 'application/json',
	              url : "searchonparts",
	              data : {
	            	    searchString : searchString,
	            	    specificOrganization : organizationId,
					},
	              success : function(response) {  
	               console.log(response[1]);
	               var commDesc="",enggDesc="";
	               //var descriptionList = response[1].source.description;
	               
						/*if(locale="en_US"){
							commDesc = response[1].source.commercialDescription_en_US;
							enggDesc = response[1].source.engineeringDescription_en_US;
						}
						else{
							commDesc = response[1].source.commercialDescription_de_DE;
							enggDesc = response[1].source.engineeringDescription_de_DE;
						}*/
						commDesc = response[1].source.commDesc;
				   		enggDesc = response[1].source.enggDesc;
               		 //  enggDesc = descriptionList[].engineeringDescription;
            	   if(response[1].source.mediaId==0)
            		   $("#quickSearchImg").hide();
            	   else
	               	   $("#quickSearchImg").attr("src","${properties['docserver.url']}?media="+response[1].source.mediaId+"&thumbnail=true&user="+userid+"&token="+authtoken);
            	   
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
        
    	
    	$(document).delegate('.remove-charges','click', function(){
	    	
	    	removeChargeId = $(this).parent().attr('data-chargeId');
	    	isAutoApply = $(this).parent().attr('data-isAutoApply');
	    	var chargeName = $(this).parent().attr('data-chargeName');
	    	$("#confirmationWindow").show();
	    	/* $('.dialog-content, .confirm-modal-body').text("<spring:message code='label.creteordercartinit.msg.charge' javaScriptEscape='true'/>"+chargeName); */
	    	$('.dialog-content, .confirm-modal-body').text("<spring:message code='label.creteordercartinit.msg.charge' javaScriptEscape='true'/>");
            $("#confirmationWindow").draggable({
                handle: ".modal-header"

   			});
	    	
    });
    	
    	$(".charge-ok").click(function(){
   		 $("#confirmationWindow").hide();
   		 $.ajax({
   	            type : "Get",
               cache:false,
   	            data : "selectedChargeId=" + removeChargeId,
   	            contentType: 'application/json',
   	            mimeType: 'application/json',
   	            url : 'createquoteremovechargesforedit',
   	            success : function(response) {
   					//console.log(response);
   					$("#chargesContainer").html('');
   					$("#chargesTemplate").tmpl(response.chargeList).appendTo("#chargesContainer");
   					
   					$('#place-order-click').addClass('not-active');
					$('#save-changes').removeClass('not-active');
					
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
       
        if(quantity<ordMult){
        	// $('.modal-body').text("<spring:message code='alert.quote.order.item.qty.validation2' javaScriptEscape='true'/> ");
            //$("#myModal").show();
        }
     	else
        	editQuantity(partId,quantity);
      });
    
    /*explicitly change item quantity*/
    $(document).delegate('.input-qty-box','change', function(evt){
      var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
      var partId =$(this).parents('.qty-change-div').attr('id');
      var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
      
      quantity = getOrderMultiplesForQuantity(quantity, partId, ordMultiple);
      
      /* var RE = /^\d*(\.\d{1})?\d{0,1}$/;
		if(!RE.test(quantity)){ */
	if(validateSpecialCharacterAndAlphanumeric(quantity)== true){
		//$('.modal-body').text("<spring:message code='alert.quote.order.special.char.not.allowed' javaScriptEscape='true'/>");
         // $("#myModal").show();
          $(this).parents('.qty-change-div').children('.total-items').val(1);
          editQuantity(partId,1);
      }
      else if(quantity<1)
           {
    	 // $('.modal-body').text("<spring:message code='alert.quote.order.item.qty.validation1' javaScriptEscape='true'/>");
           // $("#myModal").show();
            $(this).parents('.qty-change-div').children('.total-items').val(1);
            editQuantity(partId,1);
        }
     	else
      		editQuantity(partId,quantity);
      
    });
    
    /*item price change*/
    $(document).delegate('input.get-input-price','change', function(e){
    	e.preventDefault();
    	e.stopPropagation();
        var price = $(this).val();
        var oldPrice = $(this).parents().attr("data-your-price");
        if(price === ""){
			$('.modal-body').text("<spring:message code='alert.quote.order.price.validation1' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(price == "0"){
			$(this).val(oldPrice);

			$('.modal-body').text("<spring:message code='alert.quote.order.price.validation2' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}
		else if(price < 0){
			$(this).val(oldPrice);

			$('.modal-body').text("<spring:message code='alert.quote.order.price.validation3' javaScriptEscape='true'/>");
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
        var partId =$(this).parents('div.price-div').attr('data-itemId');
        
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
	          //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE
	          dataType : "json",
	          url : "editquoteitemquantity",
	          success : function(response) {
	        	  var locale=${locale};
	        	  console.log(response);
	        	    /* $("#cart-items-hldr").html('');
	        	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr"); */
	        	    if(response.cartItem.priceMSRPStr != "-1"){
                        $(".cartItemMsrp[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.priceMSRPStr + " " +response.cartItem.currencyCode);//set MSRP
                    }else{
                        $(".cartItemMsrp[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                    }

                    if(response.cartItem.priceStr != "-1"){
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.priceStr+" "+response.cartItem.currencyCode);//set MSRP
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").val(response.cartItem.priceStr);
                    }else{
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").val("0");
                    }

                    if(response.cartItem.savedPriceStr != "-1"){
                        $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.savedPriceStr+" "+response.cartItem.currencyCode);//set MSRP
                    }else{
                        $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                    }

                    if(response.cartItem.itemTotalAmountStr != "-1"){
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.itemTotalAmountStr+" "+response.cartItem.currencyCode);//set MSRP

                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parents('.price-div').find('input.alertFlagInput').val(response.cartItem.itemTotalAmountStr);
                        checkAlertMessage();
                    }else{
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").html(" - ");

                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parents('.price-div').find('input.alertFlagInput').val("-1");
                        if(!$('p.alert-message').is(':visible')){
                            $('p.alert-message').show();
                        }
                    }
                    if(response.cartItem.inventoryMessage != ''){
                    	$(".b-label[data-cartItem='"+response.cartItem.partId+"']").find('div > strong').text(response.cartItem.inventoryMessage);
					}
					 
            
                    filterComments();
                    if(response.shoppingCart.subtotalAmountStr!=="-1"){
                    	$('#subTotal').text(response.shoppingCart.subtotalAmountStr+" "+(typeof response.shoppingCart.currencyCode=="undefined"?"":response.shoppingCart.currencyCode));
                    }else{
                        $('#subTotal').text("");
                    }
                    
	        	    
	        	    $('#place-order-click').addClass('not-active');
	        	    $('#save-changes').removeClass('not-active');
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
         //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE
         dataType : "json",
         url : "editquoteitemprice",
         success : function(response) {
       	  console.log(response);
       	   var locale=${locale};
       	    $("#cart-items-hldr").html('');
       	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
       	    $('.cartItemTotal').removeClass('price-loader');
            filterComments();
            if(response.subtotalAmountStr !== "-1"){
                $('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
            }else{
                $('#subTotal').text(" - ");
            } 
       	    
       	 	$('#place-order-click').addClass('not-active');
       	 	$('#save-changes').removeClass('not-active');
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
            if(response.subtotalAmountStr !== "-1"){
            	$('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
            }
            else{
                $('#subTotal').text(" - ");
            }
       	    
       	 	$('#place-order-click').addClass('not-active');
       	 	$('#save-changes').removeClass('not-active');
         },  
         error : function(e) {    
         }  
       });
     }
    
		    // INC-1633 START
		    $('#shiptoSelect').on('change', function(){
		      var shipTo = $('#shiptoSelect').val();
		     getDetails(false,shipTo);
		    })
		    $('#billtoSelect').on('change', function(){
		     var shipTo = $('#billtoSelect').val();
		     getDetails(true,shipTo);
		    })
		    
		    function getDetails(isFromBillTo,shipTo){
		     var customerId = $('#customerVal').val();
		
		     $.ajax({  
		         type : "GET",
		         data : {customerId: customerId,shipTo: shipTo,isFromBillTo: isFromBillTo },
		         url : "getcontactlistforshipto",
		         success : function(response) {
		 var responseJson = JSON.parse(response);
// 		 console.log(responseJson.contactJson);
// 		 appendDataForContact(responseJson.contactJson);
		 if(isFromBillTo){ 
		  $('#billToDetails').html();
		         $('#billToDetails').html(setAddress(responseJson.addressJson));
		 }else{
		  $('#shipToDetails').html();
		        $('#shipToDetails').html(setAddress(responseJson.addressJson)); 
		 }
		         },  
		         error : function(e) {     
		         }  
		     });
		    }
		  // INC-1633 END
    
    $('.contact-details').on('change', function(){
        	contactChange();
        })
        
        $('.review-quote').on('click', function(){
        	
        	/* code change for GS-2177
        	on 19-10-2015
        	added 'item comment change' and 'item quantity change' function*/
        	
        	/*item comment change*/
    	    $(document).delegate('textarea.comment-controller','change', function(){
    	        var comment = $(this).val();
    	        var partId =$(this).parents('div.item-comments').attr('comment-itemId');
    	        itemcommentChange(partId,comment); 
    	      });
        	
			var numItems = $('.cart-details').length;
        	
        	if(numItems == 0){
        		$('.modal-body').text("<spring:message code='alert.quote.order.lineitem.validation' javaScriptEscape='true'/>")
    			$("#myModal").show();
        		return false;
        	}

            var lineItemHolder = $('#cart-items-hldr');
            var disableButton = false;
            //Create quote without a price changes
            var filterValue = JSON.parse('${hideOrShowFields}');
            var isQuoteEnabled = "FALSE";
            if(typeof filterValue["create.quote.withoutprice"]!="undefined"){
            	isQuoteEnabled = filterValue["create.quote.withoutprice"]
            } 
   		 if(isQuoteEnabled == "FALSE" || isQuoteEnabled == "false"){    
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
    	  /*explicitly change item quantity*/
    	    $(document).delegate('.input-qty-box','change', function(evt){
    	      var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
    	      var partId =$(this).parents('.qty-change-div').attr('id');
			  var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
              
              quantity = getOrderMultiplesForQuantity(quantity, partId, ordMultiple);
              
    	      /* var RE = /^\d*(\.\d{1})?\d{0,1}$/;
    			if(!RE.test(quantity)){ */

    		if(validateSpecialCharacterAndAlphanumeric(quantity)== true){
    			//$('.modal-body').text("<spring:message code='alert.quote.order.special.char.not.allowed' javaScriptEscape='true'/>");
    	         // $("#myModal").show();
    	          $(this).parents('.qty-change-div').children('.total-items').val(1);
    	          editQuantity(partId,1);
    	      }
    	      else if(quantity<1)
    	           {
    	    	 // $('.modal-body').text("<spring:message code='alert.quote.order.item.qty.validation1' javaScriptEscape='true'/>");
    	          //  $("#myModal").show();
    	            $(this).parents('.qty-change-div').children('.total-items').val(1);
    	            editQuantity(partId,1);
    	        }
    	     	else
    	      		editQuantity(partId,quantity);
    	      
    	    });
    	  
    	  
        	if($(this).hasClass('not-active')){
    		    return false;
    		   }
        	var validateResult = formValidation();
        	if(validateResult){
        	  
        		$('#editQuoteForm').attr("modelAttribute","editQuoteForm");
        		$('#editQuoteForm').attr("action","editquotereview");
				$('#editQuoteForm').submit();
        	}
        }) 
        
        
        $('#place-order-click').on('click',function(){
        	if($(this).hasClass('not-active')){
    		    return false;
    		   }	
		var numItems = $('.cart-details').length;
        	
        	if(numItems == 0){
        		$('.modal-body').text("<spring:message code='alert.order.lineitem.validation' javaScriptEscape='true'/>")
    			$("#myModal").show();
        		return false;
        	}
        	window.location.href = 'quotetoorderinit?childCartId='+childCartId+'&isFromQuoteToOrder=true'+'&organizationId='+${organizationId};
        })
        
        $(".custom-close").click(function(){
		   $("#myModal").hide();
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
		
// 		handleTransportModeDropDown(transportModeJson,this.value,transportModeApplicable); 

		
	})
	
/* 	// full item details page redirect onclick line items
	function fullItemRedirect(itemId, orgId){
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   		window.open('getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId,'_blank');
     }
    
 /*    function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
     	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
     		window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId,'_blank');
       } */
    
    function formValidation(){
    	   //Venkatasiva : Moved to common function 'validateBillToShipToAddressUser()'
    	/* var customer = $('#customer-no').val();
		var billTo = $('#billtoSelect').val();
		var shipTo = $('#shiptoSelect').val();
		var cartItemCount = $('#count').text();
		var customer = $('#customer-no').val(); */
		var carrierBilling = $('#carrierBillingSelect').val();
		var endCustomerId=$("#endCustomerId option:selected").val();
		var isFromOrder=false;
		if(carrierBilling == 0){
		  	disablePaymentTermFlag = true;
			
		}
		
		$("#myModal").draggable({
            handle: ".modal-header"
        });
		
		if(endCustomerId=="0" && $("#endCustomerId option").length >0){
				$('#myModal').find('.modal-body').text("<spring:message code='alert.quote.order.customer.validation' javaScriptEscape='true'/>")
				$("#myModal").show();
				return false;
		}
		//Venkatasiva : Made common function to validate billTo shipTo address for quote and order creation 		
		if(!validateBillToShipToAddressUser(isFromOrder)){
			return false;
		}
		/* if(billTo===null || billTo==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.billto.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(shipTo===null || shipTo==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(cartItemCount==0){
			$('.modal-body').text("<spring:message code='alert.quote.order.lineitem.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if($('#billToNewAddExist').val()=="true" && $('#billToAddressName').val()==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.billto.name.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if($('#billToNewAddExist').val()=="true" && $('#billToAddressLine1').val()==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.billto.addline1.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if($('#shipToNewAddExist').val()=="true" && $('#shipToAddressCity').val()==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addcity..validation' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}
		else if($('#shipToNewAddExist').val()=="true" && $('#shipToAddressState').val()==""){
			//Support-MIL-206-020416 For guest user state field is mandatory 
			    $('.modal-body').text("<spring:message code='alert.quote.order.shipto.addState.validation' javaScriptEscape='true'/>");
		      $("#myModal").show();
		      return false;
		}
		else if($('#shipToNewAddExist').val()=="true" && $('#shipToAddressZipCode').val()==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addzip.validation' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}
		else if($('#shipToNewAddExist').val()=="true" && $.trim($('#shipToAddressName').val())==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addname.validation' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}
		else if($('#shipToNewAddExist').val()=="true" && $.trim($('#shipToAddressLine1').val())==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addname.empty.validation' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}		
		//INC-2805 -- COUNTRY VALIDATION -- ADDED BY ANIKET-- REVIEWED BY JK
		else if($('#shipToNewAddExist').val()=="true" && $('#shipToAddressCountry').val()==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addcountry.empty.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		//INC-2805 ENDS 
		*/
		//INC-2296 Email Validation :: Added by Aniket :: Reviewed by Krupa
		else if(!($.trim($("#contactEmailInput").val())=='') && !ValidateEmail($("#contactEmailInput").val())) {
            $('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.email.invalid' javaScriptEscape='true'/>");
            $("#myModal").show();
            return false;
      	}
		//INC-2296 END
		else{
			
			if(carrierBilling == 0){
				$('#carrierBillingSelect').val("");
			 
			}
			return true;
		}
	}
    
    $('#editQuoteForm').change(function(){
    	$('#place-order-click').addClass('not-active');
    	$('#save-changes').removeClass('not-active');
    });
    $("#comments").on('keypress',function(){
    	if($(this).val()!==""){
    		$('#save-changes').removeClass('not-active');
    	}
    	
    });
 	// Fix for GS-677
    $(".quicksearch-img").on('click',function(){
      fullItemRedirect($('#partId').text(),${organizationId})
  	});
 
    function removeAttachedFile(){
		$('div.file-list').html('');
		$("#file-upload").val('');
		$('#attached-fileName').val('');
		
		$('.modal-body').text("<spring:message code='alert.quote.order.file.delete' javaScriptEscape='true'/>")
		$("#myModal").show();
	}
    
    function filterComments(){
        $('#cart-items-hldr .product-comments > textarea').each(function(){
            if($(this).val() !== ""){
                $(this).show();
                $(this).prev('a').text('<spring:message code='label.quote.order.edit.comment' javaScriptEscape='true'/>');
            }else{
            	$(this).prev('a').text("<spring:message code='label.quote.order.add.comment' javaScriptEscape='true'/>");
            }
        });
    }
  //INC-2296 Email Validation :: Added by Aniket :: Reviewed by Krupa
    function ValidateEmail(email) {
    	var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	return expr.test(email);
    };
  //INC-2296 END
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
 // GPD-51: Venkatasiva  
  /*  $('#shipToAddressCountry').on('change',function(){
		  if($('#shipToAddressCountry').find("option:selected" ).index()!=0){
			  //var shipToAddressCountry = $('#shipToAddressCountry').find("option:selected" ).text();
			   //To get the option value i.e., country code
			   var shipToAddressCountry = $('#shipToAddressCountry').val();
			  console.log("shipToAddressCountry: " + shipToAddressCountry);				  
			  $("#shipToAddressCountry").val(shipToAddressCountry); 				  
			  //$('#shipToAddressCountry').val(shipToAddressCountry).attr('readonly','readonly');
		  }else{
			  $('#shipToAddressCountry').val('');				  
		  }
	}); 
	
	$('#stateSelect').on('change',function(){
		  if($('#stateSelect').find("option:selected" ).index()!=0){				  
			  //var stateSelected = $('#stateSelect').find("option:selected").text();
			  //To get the option value i.e., state code
			  var stateSelected = $('#stateSelect').val();
			  console.log("stateSelect: " + stateSelected);							  
			  $("#shipToAddressState").val(stateSelected); 				 			  
			  //$('#shipToAddressCountry').val(shipToAddressCountry).attr('readonly','readonly');
		  }else{
			  $("#shipToAddressState").val('');
		  }
	}); */
	//GPD-51: Venkatasiva End
    $("#carrierBillingSelect").on('change',function(){
		var shipmentTerms = $("#carrierBillingSelect > option:selected").text();
		var cboId = $("#carrierBillingSelect > option:selected").val();
		if(shipmentTerms == 'Prepay and Add'){
			$("#carrierSelect").parent().parent().hide();
			$("#carrierSelect").val("");
  		}else{
			$("#carrierSelect").parent().parent().show();
 		}
		getTransportModeBasedOnShippingTerms(cboId)
		$("#carrierSelect").prop("selectedIndex", 0);
			
	});
    </script>
</body>
</html>

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
<link rel="stylesheet" type="text/css"
	href="../css/searchComponent.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.responsive.css?version=${properties['application.version']}">

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
<!--19-01-2016  5.5.1.0_EH_ajax_error_msg.-->
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js"></script>
	
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
<sec:authorize access="hasRole('ROLE_DEALER_USER')" var="isDealerUser"></sec:authorize>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form:form id="cartToQuoteForm" name="cartToQuoteForm" method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li class="active"><spring:message code="lable.quote.quotes" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">

					<h3>
						<spring:message code="label.brand.request.quote" />
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
									code="label.brand.create.quote" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review.quote" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm.quote" /></span></li>
					</ul>
					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

							<div
								class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx">
								<label for="customer-no"
									class="labelleftalign control-label column-paddings required" id="customer_dealer_name"><spring:message
										code="label.quote.order.customer" /></label>
							
								<div class="input-group col-lg-8 col-md-8 col-sm-8 col-xs-12 " id="customerNameAndId"
									data-input-width="width">
									<input type="text" id="customer-no"
										class="form-control customerNoInput spaceLeft10x" /> <input
										type="hidden" id="customerVal" class="form-control" />
												
								</div>
								<c:choose>
										<c:when test="${isDealerUser == false}"> 
											<a class="tooltip_mobile tooltip_tabber help-button" data-placement="left"
												data-toggle="tooltip" href="javascript:;"
												data-original-title="<spring:message code="label.order.customer.message" />"
												>?</a>
									</c:when>
									</c:choose>	
								
							</div>
							<div class="form-inline">
								<div
									class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddingsx" style="margin-bottom: 10px;">
									<label for="reference-no"
										class="control-label column-paddings"><spring:message
											code="label.quote.order.your.reference" /></label> <%-- <a
										class="tooltip_mobile tooltip_tabber help-button" href="javascript:;"
										data-toggle="tooltip" data-placement="left"
										title="<spring:message code="label.quote.reference.message" />">?</a> --%>
									<input type="text" id="reference-no"
										class="form-control spaceLeft10x" name="referenceNumber"
										maxlength="100" /> <a class="tooltip_mobile tooltip_tabber help-button"
										href="javascript:;" data-toggle="tooltip"
										data-placement="left"
										title="<spring:message code="label.quote.reference.message" />">?</a>
								</div>
								<div class="clearfix"></div>
							</div>

							<!-- Venkatasiva : Made common div for billToAddress and shipToAddress in billToShipToAddressDivForUser.jsp to use in Order, Quote and edit pages for user -->
							<div id="billToShipToAddress">
									<%@ include file="billToShipToAddressDivForUser.jsp"%>
							</div>
							<div
								class="col-lg-5 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddingsx">
									<div class="clearfix"></div>
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_PAYMENTTERMS',#organizationId)">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs" id="carrierBillingOptionLable"><spring:message
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

											<%-- <sec:authorize access="!hasRole('ROLE_CHANGE_PAYMENTTERMS')"> 
                               	<select class="form-control disabled-onpermission" id="carrierBillingSelect" name="carrierBillingOption" >
                                    <c:forEach items="${carrierBillingOptionList}" var="carrierBilling">
									   <option value="${carrierBilling.carrierBillingOptionId}">${carrierBilling.description}</option>
									</c:forEach>
                               	</select>
                               	</sec:authorize> --%>
										</div>
									</sec:authorize>
									<div class="">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs"  id="carrierLabelId"><spring:message
												code="label.quote.order.shipping.method"/></label>
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
									<div class="col-lg-12 col-md-12 nopadding"
										style="display: none;" id="transportModeDiv">
										<label
											class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 charges-label nopadding-xs "><spring:message
												code="label.quote.order.transport.code" /></label>
										<div
											class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
											<select class="form-control" name="transportMode"
												id="transportMode">
												<option>-----
													<spring:message code="label.quote.order.select" /> ------
												</option>
											</select>
										</div>
									</div>



									<div class="clearfix"></div>
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
													class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
													<select class="form-control" id="salesRepSelect"
														name="salesRepresentative">
														<option></option>
													</select>
												</div>
											</div>
										</div>
									</sec:authorize>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
										id="salesAreaDiv">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
											<label
												class="control-label col-lg-6 col-md-4 col-sm-4 col-xs-12 nopadding-xs required"><spring:message
													code="label.sales.area" /></label>
											<div
												class="contactEmail col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
												<p class="inline" id="contact-email"></p>
												<input class="form-control" type="text" readOnly
													name="salesArea" id="salesArea">
												<%-- <sec:authorize access="hasRole('ROLE_CHANGE_SALES_AREA')">  --%>
												<sec:authorize
													access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_SALES_AREA',#organizationId)">
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
									<div class="clearfix"></div>
								</div>
							</div>

							<div
								class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
								<!-- div class="form-group col-lg-4 col-md-4 col-sm-12 col-xs-12 column-paddings">
                                <label class="control-label col-lg-12 col-md-2 col-sm-4 col-xs-12 column-paddings"><spring:message code="label.quote.order.contact" /></label>
                                <div class="col-lg-7 col-md-7 col-sm-4 col-xs-12 nopadding no-padding-md">
                                	 <select class="form-control contact-details selectwidth" name="contact" id="contact-id"></select>

                                </div>
                               
                                <!-- <input type="checkbox" class="ctq-checkbox" id="new-contact"/>
                                <label for="new-contact" class="control-label ctq-control-label">New</label> 
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 bill-to-add nopadding-xs">
									<a href="javascript:;" class="btn-addtocart add contact-to-add" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.creteordercartinit.msg.add.contact" />"><spring:message code="label.quote.order.add" /></a>
                                 	<a href="javascript:;" class="btn-addtocart add contact-to-cancel" style="display: none;" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.creteordercartinit.msg.contact.cancel" />"><spring:message code="label.quote.order.reset" /></a>
								</div>

                            </div-->
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddingsx">


									<h5 class="inline contactName-label">
										<spring:message code="label.quote.order.name" />
									</h5>
									<div class="contactName">
										<p class="inline" id="contact-name"></p>
										<input class="form-control" type="text"
											placeholder="<spring:message code="label.creteordercartinit.enter.name" />"
											name="contactName" id="contactNameInput" maxlength="100" >
									</div>
								</div>
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddingsx">


									<h5 class="inline contactEmail-label">
										<spring:message code="label.quote.order.email" />
									</h5>
									<div class="contactEmail">
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
						<!-- common item list template. Added by Pooja & Reviewed by Rajesh-->
						<%@ include file="lineItemsForQuotesOrders.jsp"%>
					</div>

					<div class="row">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<div id="cart-items-hldr"
								class="result-container col-lg-9 col-md-9 col-sm-12 col-xs-12">
								<spring:message code="label.quote.order.quick.search.quote" />
							</div>

							<div class="col-lg-3 col-md-3 col-sm-8 col-xs-12 nopadding-sm">

								<div class="quick-search-popover">
									<div class="quick-search-hldr" id="quicksearchconfig">
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
											<!-- <span class="input-group-addon search-glass-hldr"><i class="search-glass-ico"></i></span> -->
										</div>
										<div class="popover-content" id="quickSearchDiv"
											style="display: none;">
											<div class="row cart-item">
												<div class="col-md-12 cartitem">
													<a href="javascript:void(0);" class="quicksearch-img"><img
														id="quickSearchImg" src=""> <!-- INC-2498 fix starts(Developed by : Swetha) -->
														<div class="waterMarkForQuickSearch" id="waterMarkText">
															<span
																style="margin: 6px; font-weight: 600; font-size: 8px;"
																class="label1FontFamily"><spring:message
																	code="label.watermark.text1" /> </span> <span
																style="font-size: 7px; font-weight: 400;"
																class="label2FontFamily"><br> <spring:message
																	code="label.watermark.text2" /></br></span>
														</div> <!-- INC-2498 fix ends --> </a>
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
													<%--  <sec:authorize access="@customSpringSecurity.hasDivisionPermission('ROLE_ENGG_DESC',#organizationId)"> --%>
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
														id="mediaId" /> <input type="hidden" id="organizationId" />
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
									class="col-lg-6 col-md-6 col-sm-12 col-xs-12 column-paddings header-links header-links-md">
									<!-- Commented to not to show attachment-->
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="attach-file-section">
											<input id="file-upload" name="file" type="file" /> <label
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
						</div>
					</c:if>

					<%-- <sec:authorize access="hasAnyRole('ROLE_CHANGE_SALES_REP','ROLE_APPLY_CHARGES')">
                <div class="form-horizontal section chargesSection"  id = "SALES_REP_SECTION">
                 <sec:authorize access="hasRole('ROLE_CHANGE_SALES_REP')">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" id="sales-id">
                        <div class="col-lg-8 col-md-8 col-sm-10 col-xs-12 column-paddings">
                            <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12 charges-label required"><spring:message code="label.quote.order.sales.rep" /></label>
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
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
                        <label class="label-control col-lg-3 col-md-3 col-sm-3 col-xs-12 charges-label"><spring:message code="label.quote.order.charge" /></label>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <select class="form-control" id="chargesSelect">
                            	
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
                            <a href="javascript:;" class="btn-addtocart add" id="add-charges"><spring:message code="label.quote.order.add" /></a>
                        </div>
                         <!-- <div id="loading" style="display:none;left:345px;position: absolute;"><img src="../images/466_1.GIF"></div>  -->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="auto-apply-id">
                        <div class="">
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
							<div
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<h5
									class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
									<spring:message code="label.quote.order.item.total.am" />
									(<span id="count"></span>
									<spring:message code="label.quote.order.items" />
									)
								</h5>
								<h5
									class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right"
									id="subTotal"></h5>
							</div>
							<div id="chargesContainer"></div>

							<p class="alert-message pull-right" style="display: none;">
								<spring:message code="label.total.item.cart.msg" />
							</p>
							<div
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<a href="javascript:void(0)"
									class="pull-right green-button next review-quote"><spring:message
										code="label.quote.order.review.quote.button" /></a>
							</div>
						</div>
					</div>
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
								class="col btn delete-ok ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a> <input type="hidden"
								id="confirmBoxType" />
						</div>
					</div>
				</div>
			</div>
			<div class="modal bs-example-modal-md"
				id="backButtonConfirmationWindow"  data-backdrop="static" data-keyboard="false">
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
							<p class="back-button-dialog-content" >
								<spring:message code="lable.init.quote.back.button" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" id="backButtonCancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
								class="col btn delete-ok charge-ok" id="backButtonOk" 
								href="javascript:;"><spring:message
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
					<div class="modal-content custom-modal-content">

						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title caps" id="myModalLabel">
								<strong><spring:message code="label.sales.area" /></strong>
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<div class="row">
								<div class="col-sm-5 col-lg-5 col-xs-12">
									<label
										class="control-label col-lg-3 col-md-3 col-sm-4 col-xs-12 required"><spring:message
											code="label.sales.area.by" /></label>
									<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
										<select name="carrierSales" id="searchType"
											class="form-control">
											<option value="0" selected disabled>----- Select
												------</option>

											<option value="1">Sales Org Reference</option>

											<option value="2">Distribution Channel Reference</option>

											<option value="3">Description</option>

										</select>
									</div>
								</div>
								<div class="col-sm-5 col-lg-4 col-xs-12">
									<label
										class="control-label col-lg-4 col-md-4 col-sm-4 col-xs-12 required"><spring:message
											code="label.sales.area.value" /></label>
									<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="searchText" class="form-control">
									</div>
								</div>
								<div class="col-sm-2 col-lg-3 col-xs-12">
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
						<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
							<div class="modal-dialog">
								<div class="modal-content custom-modal-content" >
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
										<a class="col btn cancel"  href="javascript:;"><spring:message
												code="label.bulkpartupload.cancel" /></a> <a
											class="col btn delete-ok ok" href="javascript:;"><spring:message
												code="label.bulkpartupload.ok" /></a> <input type="hidden"
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
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
										<h4 class="modal-title caps" id="myModalLabel">
											<strong><spring:message code="label.sales.area" /></strong>
										</h4>
									</div>
									<div class="modal-body custom-modal-body">
										<div class="row">
											<div class="col-sm-5 col-lg-5">
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
											<div class="col-sm-5 col-lg-4">
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

						<!-- 		   ----    Ship to Modal ---
		  <div class="modal modal-quotes fade" id="shiptoTable" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
		    <div class="modal-dialog" role="document">
		     <div class="modal-content">
		      
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title caps" id="myModalLabel">Ship To Details: </h4>
		      </div>
		      <div class="modal-body">
		       
		        <div class="row">
		        	<div class="col-sm-12">
		        	<table class="table table-striped table-bordered" id="shipTable">
						<thead>
						   <tr>
						  <th>Reference</th>
						    <th>Name</th>
						      <th>Id</th>
						</tr>
						</thead>
						
					</table>
					</div>
		        </div>
		      </div>
		      
		     </div>
		    </div>
		  </div>
		  
		   ----    Ship to Modal end--- -->
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
	<!------    Ship to Modal ----->
	<div class="modal modal-quotes fade" id="shiptoTable" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
					<h4 class="modal-title custom-modal-title caps" id="myModalLabel">Ship To
						Details:</h4>
				</div>
				<div class="modal-body custom-modal-body modal-body-shipto">

					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered" id="shipTable">
								<thead>
									<tr>
										<%--  <th><spring:message code="label.creteordercartinit.address.short" /></th> --%>

										<th>Address Reference</th>
										<th>Address Line 1</th>

										<th>City</th>
										<th>State</th>
										<th>Country</th>
										<th>Zipcode</th>
										<th>Address Id</th>
									</tr>
								</thead>

							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/jquery.multiselect.js?version=${properties['application.version']}"
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
	<script
		src="../js/searchComponent.js?version=${properties['application.version']}"
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

	<script id="chargesTemplate" type="text/x-jquery-tmpl">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" >
			<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
			<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4 text-right" data-isAutoApply="${'${'}isAutoApply}" data-chargeId="${'${'}chargeId}" data-chargeName="${'${'}name}"> ${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode}<i class="fa fa-trash-o remove pull-right remove-charges" ></i></p>
		</div>

	</script>
	<!-- GPD-51: Venkatasiva -->
	<script language="javascript">
		populateCountries("shipToAddressCountry", "stateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	</script>
	<!-- End -->

	<script type="text/javascript">
    	var defaultPartUOM = '${properties["default.part.uom"]}';
	    var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
	    var ordMult;
	    var valueHideOrShow;
	    var quoteJsonGlobal;
        var  myErrObj = new errnsp.errHandling.init();
    	var currentUpdatedQuote;
		var chargesDetailsJson;
		var userid,authtoken;
		var removeChargeId,isAutoApply;
		 var isFromConfigurator = false ;
		 var isFromConfiguratorValue = '${isFromConfigurator}'; 
		 var isQuoteAllowedWithPriceError = '${isQuoteAllowedWithPriceError}'; 
		 var isOrderAllowedWithPriceError = '${isOrderAllowedWithPriceError}'; 
		 var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
		 
		if(isFromConfiguratorValue == 'true'){
			 isFromConfigurator = true ;
		}else{
			isFromConfigurator = false;
		}
		var endCustId; //Added from mil
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
			//Fix for GSP-496 Back button functionality
			var previousUrl = document.referrer;
	     	var manualStateChange = true;
	     	//Venkatasiva : GPD-3449
    		hideOrShowTransportModeFieldsQuotes('${hideOrShowFields}');
	     	var userApplication = $('#userApplication').val();
	    	History.pushState({},"${properties['global.page.title']}","./"+History.getState().url.split('web/')[1]+"&amp;state=99");
	    	History.Adapter.bind(window,'statechange',function(){	    		
    		    if(manualStateChange == true){
    		    	var x = previousUrl.split("/");
    		    	if(x[x.length-1] == "createquoteconfirm"){
    		    		$("#backButtonConfirmationWindow").show();
    	        	}else{
    	        		window.location.href = previousUrl;
    	        	}
    		    }
    		    manualStateChange = true;
    		});
		
	    	 $("#backButtonCancel").click(function(){
	    		 History.pushState({},"${properties['global.page.title']}","./"+History.getState().url.split('web/')[1]+"?state=99");
	       		$("#backButtonConfirmationWindow").hide();
	   		 });
	 		 
	   		 $("#backButtonOk").click(function(){
	      		 	$("#backButtonConfirmationWindow").hide();
	      		 	window.location.href="getshoppingdetails?reOrder=true";
	      	});
	
		
		 $(window).keydown(function(event){
			    if(event.keyCode == 13) {
			      event.preventDefault();
			      return false;
			    }
			  });
         	 handleTransportMode();
        	
        	$('.pageLoader').show();
        	userid=$('#userId').val();
    		authtoken = $('#authToken').val();
    		
        	$(document).delegate('div.product-comments>a','click',function(){
                $(this).parent().find('textarea').toggle();
            });
        	hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
        	
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
        			 //$('#contact-id').css({"visibility":"hidden"});
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
        		 $('#contact-id').css({"visibility":"visible"});
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
        	console.log(quote);
      	  	var quoteJson = JSON.parse(quote);
      	  	quoteJsonGlobal = quoteJson;
      	  	$("#shipping-instruction").attr("maxlength",200);
  	    	$("#shipping-instruction").attr("rows",8);
      	  	var locale=${locale};
			console.log(quoteJson);
			//console.log(locale);
			
			// Set customer Sales Area, Changed by Ganeshan 4th Feb
			//SUPPORT-MIL-223-170216
			var customerSalesAreaCurrencyVo = quoteJson.customerSalesAreaCurrencyVo;
			if(typeof customerSalesAreaCurrencyVo!="undefined" && customerSalesAreaCurrencyVo){
				$("#salesArea").val(customerSalesAreaCurrencyVo.description);
        	}
			
			// if no line item found then disable review button
			if(quoteJson.cartItemList.length==0){
				$(".review-quote").addClass("not-active");
				//select all checkbox div must be hidden if length is zero. Added by Pooja.H.S & Reviewed by Rajesh
				$("#checkboxDiv").css('display','none');
			}
			
			if(quoteJson.cartItemList.length>0)
				$('#cart-items-hldr').html('');
			//select all checkbox div must be hidden if length is zero. Added by Pooja.H.S & Reviewed by Rajesh
			$('#checkboxDiv').css('display','visible');
			$("#editQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
			 $('.cartItemYourPrice').html('');
				
			 	$('.cartItemYourPrice').addClass('price-loader');
		    	$('.cartItemMsrp').addClass('price-loader');
		    	$('.cartItemSavedPrice').addClass('price-loader');
		   	  	$('.cartItemTotal').addClass('price-loader');
		   	  	
	   	 	$('.cartItemTotal').html('');
           checkAlertMessage();
            if(isFromConfigurator){
            	$('.cartItemYourPrice').parent().each(function(){
            		var $this = $(this);
            		var price = $this.data('your-price');
            		$this.find('input').val(price);
            	});
            }
            filterComments();
            
            valueHideOrShow = ${hideOrShowFields};
    		   if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
 	    	 	$(".order-multiples-lbl").show();
 	        }
 	        	else{$(".order-multiples-lbl").hide();
 	        }    		
            $('#count').text(quoteJson.cartItemList.length);
            if(quoteJson.cartItemList.length>0){
            	if(quoteJson.subtotalAmountStr !== "-1"){
                	$('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
                    $('#chargeSymbol').text((typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
                }else{
                    $('#subTotal').text("");
                }
                
              }else{
           		$('#subTotal').text((typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
              	$('#chargeSymbol').text((typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
               }
            
            $('#brandName').text(quoteJson.organization.organizationName);
            
            //set sales rep and charges list
            var chargesDetails = '${chargeDetailsVos}';
            if(chargesDetails!=""){
            	$('#autoaply-charges').prop('checked', quoteJson.autoApplyCharges);
            	chargesDetailsJson = JSON.parse(chargesDetails);
            	appendChargesData(chargesDetailsJson);
            }else{
            	$(".chargesSection").children().addClass("not-active");
            }
      	  		
      	  	var basicUserDetails = '${basicUserDetailsVos}';
      	  	if(basicUserDetails!=""){
				var basicUserDetailsJson = JSON.parse(basicUserDetails);
				var loggedInUserId = '${loggedInUserID}';
				if(typeof quoteJson.quotedBy!="undefined")
					loggedInUserId = quoteJson.quotedBy.userId;
	    	  	appendSalesRepData(basicUserDetailsJson,loggedInUserId);
      	  	}
    	  	
			// carrier and carrier billing option default values
			if(typeof quoteJson.carrier!="undefined"){
				var carrierId = quoteJson.carrier.carrierId;
				$('#carrierSelect').find('option[value="'+carrierId+'"]').prop("selected",true);
				
				if(typeof quoteJson.transportMode!="undefined"){
					reloadDropDown(transportModeApplicable,transportModeJson,1,carrierId);
				         	$("#transportMode").val((typeof quoteJson.transportMode)=="undefined"?$("#transportMode	 option:first").val():quoteJson.transportMode.transportModeId);
				}
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
			
			if(typeof quoteJson.deliveryInstructions1!="undefined")
				$('#shipping-instruction').val(quoteJson.deliveryInstructions1);
			
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
			
			
			
			if(typeof quoteJson.consignmentOrder!="undefined")
				$('#consignment-order').prop('checked', quoteJson.consignmentOrder==true?true:false);
			
			consignmentOrderStatus(quoteJson.customer.customerTypeId);
			
				
            // Bill to add button allow or not based on flag
            if(!quoteJson.billToOverriddenAllow){
                $('#div-bill-to').hide();
            }
			
			if(typeof quoteJson.chargeList!="undefined"){
				$("#chargesContainer").html('');
	        	$("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
			}
 			 
			if(typeof quoteJson.state!="undefined"){
				var stateId = quoteJson.state.stateId;
				var selected =$('#stateSelect').find('option[value="'+stateId+'"]').prop("selected",true);
				console.log(selected);
			}
			//Added by Krupa for Breadcrumbs Issue on 20-Oct-2015
	       	 var previousURL = '${previousURL}';
			        var oldURL = document.referrer;
			        var isFromCart="";
			        var cartLink="";
			   
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
			         if(oldURL.indexOf("getshoppingdetails") != -1 ){
			        	 $("#main-menu-list li a[href*='getshoppingdetails']").parent().addClass("active");
			        }
			        
			        
			        if(previousURL.indexOf("getshoppingdetails") != -1){
			        	isFromCart = true;
			        	var promotionString = previousURL.split("/");
			        	 promotionLink = promotionString[promotionString.length - 1];
			        }
			        
			        console.log("Bread Crumb"+$("#main-menu-list > li.active").html());	
					$(".breadcrumb").empty();
					$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
					if(isFromCart){
							$(".breadcrumb > li:last-child()").after('<li><a href="'+promotionLink+'"><spring:message code="label.header.cart" javaScriptEscape="true" /></a></li>');
							$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'"><spring:message code="quick.search.item" javaScriptEscape="true" />'+itemNumber+'</li>');
					}
					else{
						if($("#main-menu-list > li.active a").attr('href') == undefined ){
							  
						}else
							$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
					}
					$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="lable.quote.quotes" /></li>');
			   }
	       		// End of Added by Krupa for Breadcrumbs Issue on 20-Oct-2015
           $('.pageLoader').hide();
           $("#quickSearchDiv").hide();
          //Search bar
	      $("#keyword1").autocomplete({
	    		source : function(request, response) {
	    			var searchString = document.getElementById('keyword1').value;
	    			//NREV-1552 - Added by Pushpa. Reviewed by JK   		 //----Missed during Merge activity,for	GSP-919 added by krupa
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
                    if(width >= 1100){
                      $('.ui-autocomplete').css({'width': 243 + 'px','max-height': 150 + 'px'});  
                    }
                    else if(width >= 900){
                      $('.ui-autocomplete').css({'width': 204 + 'px','max-height': 150 + 'px'});  
                    }
                    else{
                        $('.ui-autocomplete').css({'width': 471 + 'px','max-height': 150 + 'px'});  
                    }
                },
	    		select : function(event, ui) {
	    			$('#keyword1').val(ui.item.label);
                    $(this).prev('a.clear-search').removeClass('hidden');
	    			quickSearch(ui.item.data,quoteJson.organization.organizationId);
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
            var val = '${userProfileDetails}';
      	  	var json = JSON.parse(val);
      	  var customerLoaded = false;
           $( "#customer-no" ).on('change',function(e){
        		$('.pageLoader').show();
             if(customerLoaded == true){
            		$('.pageLoader').hide();
                if(typeof validCustomerNumber == 'undefined'){
                    $(this).val("");
                }else if (validCustomerNumber && $("#customerVal").data('label')!==$(this).val()){
                    $(this).val("");
                    validCustomerNumber=false;
                }else if(!validCustomerNumber){
                    $(this).val("");
                }
             }else{
            	 $('.pageLoader').hide(); 
             }
           });
      	   // set contact name and email
            // contactChange();
       	//Customer Object  : STEP 1 : Load Default Values
    	  	var customer = json.customer;
    	  	$("#customer-no").val(customer.customerReference +" - "+customer.customerName );
    	  	$("#customerVal").val(customer.customerId);
          	
    	  	//Bill To Clean up Code
    	   	var billToAddresses = json.billToAddress;
  	   	 	var docBillTo = $('#billtoSelect');
  	   	 	var defaultBillToId = json.billToAddressId;
  	   	 	appendOption($.makeArray(billToAddresses),docBillTo,defaultBillToId);
  	   	 	
  		 	var shipToAddress = json.shipToAddress;
	     	var docShipTo = $('#shiptoSelect');
	     	var defaultShipToId = json.shipToAddressId;
	     	appendOption($.makeArray(shipToAddress),docShipTo,defaultShipToId);
  	   	 	
	     	
    	   	 // append billto
    	   	 if(typeof quoteJson.billToAddress.addressReference=="undefined"){
    	   		$("#bill-to-add").click();
    	   		$("#billToAddressName").val(quoteJson.billToAddress.addressName);
	   			$("#billToAddressLine1").val(quoteJson.billToAddress.addressLine1);
	   			$("#billToAddressLine2").val(quoteJson.billToAddress.addressLine2);
	 			$("#billToAddressLine3").val(quoteJson.billToAddress.addressLine3);
				$("#billToAddressCity").val(quoteJson.billToAddress.addressCity);
				$("#billToAddressState").val(quoteJson.billToAddress.addressState);
		   		$("#billToAddressZipCode").val(quoteJson.billToAddress.addressZipCode);
		   		$("#billToAddressCountry").val(quoteJson.billToAddress.addressCountry === null ? "-" :quoteJson.billToAddress.addressCountry);
		   		
		   		// when click on reset then show dropdown bill to values
		   		for(var i=0; i<billToAddresses.length;i++){
	     	    	if(billToAddresses[i].addressId==defaultBillToId){
	     	    		$('#billToDetails').html();
	    	       	   	$('#billToDetails').html(setAddress(billToAddresses[i]));
	    	       	   	break;
	     	    	}
	     	     } 
		   		
    	   	 }
    	   	 else{
	       	   	 $('#billToDetails').html();
	       	   	 $('#billToDetails').html(setAddress(json.billToAddress));
    	   	 }
    	   	 
    	 	// append shipto
    	   
    	   	 if(typeof quoteJson.shipToAddress.addressReference=="undefined"){
    	   		//add existing values on bill to fields
    	   		$("#ship-to-add").click();
  	   			$("#shipToAddressName").val(quoteJson["shipToAddress"].addressName);
	  	   		$("#shipToAddressCountry").val(quoteJson["shipToAddress"].addressCountry === null ? "-" :quoteJson["shipToAddress"].addressCountry);
			   	populateStates("shipToAddressCountry", "stateSelect");
			   
  	   			$("#shipToAddressLine1").val(quoteJson["shipToAddress"].addressLine1);
  	   			$("#shipToAddressLine2").val(quoteJson["shipToAddress"].addressLine2);
  	 			$("#shipToAddressLine3").val(quoteJson["shipToAddress"].addressLine3);
  				$("#shipToAddressCity").val(quoteJson["shipToAddress"].addressCity);
  				$("#shipToAddressState").val(quoteJson["shipToAddress"].addressState);
			   	$("#shipToAddressZipCode").val(quoteJson["shipToAddress"].addressZipCode);
			   		
				$("#stateSelect").val(quoteJson["shipToAddress"].addressState);
			 // when click on reset then show dropdown ship to values
			   	for(var i=0; i<shipToAddress.length;i++){
	     	    	if(shipToAddress[i].addressId==defaultShipToId){
	     	    		$('#shipToDetails').html();
	    	       	   	$('#shipToDetails').html(setAddress(shipToAddress[i]));
	    	       	   	break;
	     	    	}
	     	     } 
			 
			   	$("#contactNameInput").val(typeof quoteJson.contact.fullName=="undefined"?"":quoteJson.contact.fullName);
		   		$("#contactEmailInput").val(typeof quoteJson.contact.primaryEmail=="undefined"?"":quoteJson.contact.primaryEmail);
    	   	 }
    	   	 else{
       	   	 $('#shipToDetails').html();
       	   	 $('#shipToDetails').html(setAddress(json.shipToAddress));
    	   	 }
    	 	 
    	   	 
    	   	 // override contact details
      	  	if(quoteJson.newContactExist){
      	   		$("a.contact-to-add").click();
      	   		$("#contactNameInput").val(typeof quoteJson.contact=="undefined"?"":quoteJson.contact.fullName);
 	   			$("#contactEmailInput").val(typeof quoteJson.contact=="undefined"?"":quoteJson.contact.primaryEmail);
      	   	}
      	  $('div.pageLoader').show(); //INC-2299 ADDED BY ANIKET REVIEWED BY KRUPA : DIV LOADER FOR LOADING PAGE AND CHANGE OF CUSTOMER
    	   //Part of Step 2 : Load Bill To's and Ship To's for Customer	 
    	  	getBillToShipToForCustomer(json.organizationId , $("#customerVal").val(),true);	 
    	   	
    	   //Step 3 : Load User Customer Autocomplete Values 
    	   $("#organizationId").val(json.organizationId);
    	   getCustomerDropdown(json.organizationId);
     	   	 
     	   	 // override contact details
     	   	if(quoteJson.newContactExist){
     	   		$("a.contact-to-add").click();
     	   		$("#contactNameInput").val(typeof quoteJson.contact=="undefined"?"":quoteJson.contact.fullName);
   				$("#contactEmailInput").val(typeof quoteJson.contact=="undefined"?"":quoteJson.contact.primaryEmail);
     	   	}
     	  console.log('logging'+quoteJson.shipToAddress.addressName);	 
      	     
     	 if(isDealerUser=='true'){
      	 	fillShipToDetailsForDealerUser(json,quoteJson);
     	 }
        });
        
        
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
	               //console.log(response[1]);
	               var commDesc="",enggDesc="",orderMultiple="";
	               //var descriptionList = response[1].source.description;
	               
						/* if(locale="en_US"){
							commDesc = response[1].source.commercialDescription_en_US;
							enggDesc = response[1].source.engineeringDescription_en_US;
						}
						else{
							commDesc = response[1].source.commercialDescription_de_DE;
							enggDesc = response[1].source.engineeringDescription_de_DE;
						}	 */										
						commDesc = (response[1].source.commDesc != 'NULL') ? response[1].source.commDesc : '-';
				   		enggDesc = (response[1].source.enggDesc != 'NULL') ? response[1].source.enggDesc : '-';
						
						 orderMultiple = response[1].source.orderMultiple;
		            	 if(orderMultiple ==null || orderMultiple == "")
		            	 {
		            	   orderMultiple = defaultPartOrderMultiple;
		            	 }
		            	   
		            	 document.getElementById('ordermultiple').value = orderMultiple;
						
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
		               document.getElementById('ordermultiple').value = orderMultiple;
	              },  
	              error: function (jqxhr, status, error) {  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.  						    	  
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
        	 //contactChange();
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
    	   	 $('#shipToDetails').html(setAddress(defaultShipTo)); 
    	   	 
    	  	console.log('ship'+shipToAddresses.length);
    	   	 var sampleData=[];
    	   	 for(var i=0; i<  Object.keys(shipToAddresses).length; i++ ){
    	   	 sampleData.push({"addressReference": shipToAddresses[i].addressReference,"addressName":shipToAddresses[i].addressName,"addressId":shipToAddresses[i].addressId});
    	   	 }
    	   	console.log('second'+sampleData);
    	 	var shipTable = $('#shipTable').DataTable();
    	 	shipTable.clear().draw();
    	 	shipTable.rows.add(sampleData); // Add new data
    	 	shipTable.columns.adjust().draw(); // Redraw the DataTable

        	 $('#shipTable tbody').find('tr').each (function() {
    				$(this).find('td:first').wrapInner( "<a class='new'></a>");
   		 		}); 
    	   	 
        	 $('#shipTable tbody tr td a').click(function(){
        		 $('#shipToNewAddExist').val("false");
				  $('#newConatcExist').val("false");
         		 var aElement = $(this).html();
         		 var select = $('#shiptoSelect');
         		$('#shiptoSelect option').prop('selected', false);
         			if ($('#shiptoSelect option:contains('+ aElement +')').length) {
         				 $('#shiptoSelect option:contains('+ aElement +')').prop('selected', true);
         				}
         		$('#shiptoTable').modal('toggle');
         	  });
    	   	 
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
        	var dupId;
        	for(var i=0; i<options.length;i++){
        		if(dupId == options[i].addressId){
        			continue;
        		}
     	    	 var opt = $("<option></option>");
                /* opt.attr("selected",elem.Selected); */
                if(options[i].addressId==defaultId)
                	opt.attr("selected","selected");
                opt.text(options[i].addressReference + " - " +options[i].addressName);
                opt.val(options[i].addressId);
      	        doc.append(opt);
      	      	dupId = options[i].addressId;
        	} 
        }
        
        function appendDataForPaymentTerm(paymentTerms){
        	$('#carrierBillingSelect').find('option').remove();
        	for(var i=0; i<paymentTerms.length;i++){
    	    	 var opt = $("<option></option>");
               opt.text(paymentTerms[i].description);
               opt.val(paymentTerms[i].carrierBillingOptionId);
     	        $('#carrierBillingSelect').append(opt);
    	     } 
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
    		
            /*explicitly change item quantity*/
            $(document).delegate('.input-qty-box','change', function(evt){
              var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
              var partId =$(this).parents('.qty-change-div').attr('id');
              var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
              quantity = getOrderMultiplesForQuantity(quantity, partId, ordMultiple);
              editQuantity(partId,quantity);
              
            });
            
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
        	var validateResult = formValidation();
        	if(validateResult){        		
        		$('#cartToQuoteForm').attr("modelAttribute","cartToQuoteForm");
        		$('#cartToQuoteForm').attr("action","createquotereview");
        		$('#cartToQuoteForm').attr("enctype","multipart/form-data");
        		var breadcrumbsPhrase = formBreadcrumbsArray();
				$('#breadcrumbsArray').val(breadcrumbsPhrase);
				$('#cartToQuoteForm').submit();
        	}
        		
        }) 
        
        $(".custom-close").click(function(){
		   $("#myModal").hide();
		});
		
		
		 /*increase item quantity*/
    $(document).delegate('.plus-qty','click', function(){
       var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
       var partId =$(this).parents('.qty-change-div').attr('id');
       
       var ItemPrice = $(this).parents('.search-parts-template').find('span.cartItemYourPrice');
       ItemPrice.addClass('price-loader');
       ItemPrice.html('');
       var ItemTotal = $(this).parents('.search-parts-template').find('span.cartItemTotal');
       ItemTotal.addClass('price-loader');
       ItemTotal.html('');
       
       editQuantity(partId,quantity);
     });
    	
    
		 
    /*explicitly change item quantity*/
     $(document).delegate('.input-qty-box','change', function(evt){
       var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
       var partId =$(this).parents('.qty-change-div').attr('id');
       var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
       
       quantity = getOrderMultiplesForQuantity(quantity, partId, ordMultiple);
       
       var ItemPrice = $(this).parents('.search-parts-template').find('span.cartItemYourPrice');
       ItemPrice.addClass('price-loader');
       ItemPrice.html('');
       var ItemTotal = $(this).parents('.search-parts-template').find('span.cartItemTotal');
       ItemTotal.addClass('price-loader');
       ItemTotal.html('');
       
       editQuantity(partId,quantity);	

     });
    
      
    /*decrease item quantity*/
    $(document).delegate('.minus-qty','click', function(){
        var quantity = $(this).parents('.qty-change-div').children('.total-items').val();
        var partId =$(this).parents('.qty-change-div').attr('id');
        var ordMult =$(this).parents('.spinner-control').attr('data-ordermultiplekey');
        
        var ItemPrice = $(this).parents('.search-parts-template').find('span.cartItemYourPrice');
        ItemPrice.addClass('price-loader');
        ItemPrice.html('');
        var ItemTotal = $(this).parents('.search-parts-template').find('span.cartItemTotal');
        ItemTotal.addClass('price-loader');
        ItemTotal.html('');
        editQuantity(partId,quantity);
       
    
    });
    
    
 
    
    /*item price change*/ //FIX for GS-671
    $(document).delegate('input.get-input-price','change', function(){
        var price = $(this).val(); 
         var oldPrice = $(this).parents().attr("data-your-price");
       /* var savedPrice = $(this).parents().attr("data-saved-price"); */
      
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
		 var partId =$(this).parents('div.div-part').attr('data-itemId');
		 
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
    	$('div.pageLoader').show(); //INC-2299 ADDED BY ANIKET REVIEWED BY KRUPA : DIV LOADER FOR EDIT QUANTITY
         $.ajax({
	          type : "Get",
	          /* data : "cartItemId=" + cartItemId, */
	         data : {partId: partId,quantity: quantity},
	          contentType: 'application/json',
	          mimeType: 'application/json',
	        //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE
	          dataType:"json",
	          url : "editquoteitemquantity",
	          cache : false,
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

                    if(response.cartItem.priceStr != "-1"){
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.priceStr+" "+(typeof response.cartItem.currencyCode=="undefined"?"":response.cartItem.currencyCode));//set MSRP
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").val(response.cartItem.priceStr);
                    }else{
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                        $(".cartItemYourPrice[data-cartItem='"+response.cartItem.partId+"']").val("0");
                    }

                    if(response.cartItem.savedPriceStr != "-1"){
                        $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.savedPriceStr+" "+(typeof response.cartItem.currencyCode=="undefined"?"":response.cartItem.currencyCode));//set MSRP
                    }else{
                        $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                    }

                    if(response.cartItem.itemTotalAmountStr != "-1"){
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").html(response.cartItem.itemTotalAmountStr+" "+(typeof response.cartItem.currencyCode=="undefined"?"":response.cartItem.currencyCode));//set MSRP

                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parent('.price-div').find('input.alertFlagInput').val(response.cartItem.itemTotalAmountStr);
                        $('#cart-items-hldr .cart-details').find('input.alertFlagInput').val(response.cartItem.itemTotalAmountStr);// added for RRG - 351
                        checkAlertMessage();
                    }else{
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").html(" - ");
                        $(".cartItemTotal[data-cartItem='"+response.cartItem.partId+"']").parent('.price-div').find('input.alertFlagInput').val("-1");
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
                    if(response.subtotalAmountStr!=="-1"){
                        $('#subTotal').text(response.shoppingCart.subtotalAmountStr+" "+(typeof response.shoppingCart.currencyCode=="undefined"?"":response.shoppingCart.currencyCode));
                    }else{
                        $('#subTotal').text("");
                    }
                    
                    $('.cartItemYourPrice').removeClass('price-loader');
                    $('.cartItemTotal').removeClass('price-loader');
                    
	        	    $('div.pageLoader').hide();

	          },  
	          error : function(e) {    
	        	 $('div.pageLoader').hide();
	        	  $('.cartItemYourPrice').removeClass('price-loader');
                  $('.cartItemTotal').removeClass('price-loader');
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
         cache : false,
         success : function(response) {
       	  //console.log(response);
       	   var locale=${locale};
       	$("#cart-items-hldr").html('');
   	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
   		$('.cartItemTotal').removeClass('price-loader');
            /* if(response.totalMSRPStr != "-1"){
                    $(".cartItemMsrp[data-cartItem='"+response.cartItemList[0].partId+"']").html(response.totalMSRPStr + " " +response.currencyCode);//set MSRP
                    }else{
                        $(".cartItemMsrp[data-cartItem='"+response.cartItemList[0].partId+"']").html(" - ");
                }

                if(response.totalSavedAmountStr != "-1"){
                    $(".cartItemSavedPrice[data-cartItem='"+response.cartItemList[0].partId+"']").html(response.totalSavedAmountStr+" "+response.currencyCode);//set MSRP
                }else{
                    $(".cartItemSavedPrice[data-cartItem='"+response.cartItemList[0].partId+"']").html(" - ");
                }

                if(response.subtotalAmountStr != "-1"){
                    $(".cartItemTotal[data-cartItem='"+response.cartItemList[0].partId+"']").html(response.subtotalAmountStr+" "+response.currencyCode);//set MSRP
                    $(".cartItemTotal[data-cartItem='"+response.cartItemList[0].partId+"']").parent().siblings().val("1");

                    $(".cartItemTotal[data-cartItem='"+response.cartItemList[0].partId+"']").parents('.price-box').find('input.alertFlagInput').val(response.subtotalAmountStr);
                    checkAlertMessage();
                }else{
                    $(".cartItemTotal[data-cartItem='"+response.cartItemList[0].partId+"']").html(" - ");
                    $(".cartItemTotal[data-cartItem='"+response.cartItemList[0].partId+"']").parent().siblings().val("-1");

                    $(".cartItemTotal[data-cartItem='"+response.cartItemList[0].partId+"']").parents('.price-box').find('input.alertFlagInput').val("-1");
                    if(!$('p.alert-message').is(':visible')){
                        $('p.alert-message').show();
                    }
                } */

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
            if(response.subtotalAmountStr!=="-1"){
                 $('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
             }else{
                $('#subTotal').text(" - ");
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
        $('.pageLoader').show();
     $.ajax({
         type : "Get",
         /* data : "cartItemId=" + cartItemId, */
         data : {partId: partId,comment: comment},
         contentType: 'application/json',
         mimeType: 'application/json',
         url : 'edititemcomment',
         success : function(response) {
          var locale=${locale};
       	  $('.pageLoader').hide();
       	    $("#cart-items-hldr").html('');
       	    $("#editQuoteTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
            checkAlertMessage();
            $('.cartItemYourPrice').removeClass('price-loader');
			$('.cartItemTotal').removeClass('price-loader');
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
          //  $('#subTotal').text(response.subtotalAmountStr+" "+response.cartItemList[0].currencyCode);
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
		$('#chargesSelect').append(blankOpt);
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
		 /*  $('#loading').show(); */
		
		
		$.ajax({
         type : "Get",
         cache:false,
         data : {selectedChargeId:selectedChargeId,chargeAmount:chargeAmount,currencyCode:currencyCode},
         contentType: 'application/json',
         mimeType: 'application/json',
         url : 'setcreatequotechargedetail',
         success : function(response) {
			 //console.log(response);
        	 $("#chargesContainer").html('');
        	 $("#chargesTemplate").tmpl(response.chargeList).appendTo("#chargesContainer");
        	 $("#add-charges").removeClass('not-active');
        	 /* $('#loading').hide(); */
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
	    	$('.dialog-content, .confirm-modal-body').text("<spring:message code='label.createquotefromcartconfirm.messages.charge' javaScriptEscape='true'/> #"+chargeName);
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
	
	function formValidation(){
		/* var customer = $('#customer-no').val();
		var billTo = $('#billtoSelect').val();
		var shipTo = $('#shiptoSelect').val();
		var cartItemCount = $('#count').text(); */
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
		/* if(customer===null || customer==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.customer.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if(billTo===null || billTo==""){
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
			      $('.modal-body').text("<spring:message code='alert.quote.order.shipto.addState.validation' javaScriptEscape='true'/>")
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
		//INC-2805 ENDS */
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
		
//  		handleTransportModeDropDown(transportModeJson,this.value,transportModeApplicable);

		
	})
    
/* 	// full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
   	//  window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
     	window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+'&isFromQuoteOrder=true&cartItemId='+cartItemId,'_blank');
     }
	
	function fullItemRedirect(itemId, orgId){
	   	//  window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
	     	window.open('getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+'&isFromQuoteOrder=true','_blank');
	     } */
	
	function getRefreshedPriceForItems(){
	    	 $('div.pageLoader').show(); //INC-2299 ADDED BY ANIKET REVIEWED BY KRUPA : DIV LOADER FOR LOADING PAGE AND CHANGE OF CUSTOMER
	    	 $('.cartItemYourPrice').html('');
	    	 $('.cartItemYourPrice').addClass('price-loader');
	    	
	   	  $('.cartItemTotal').addClass('price-loader');
	   	 $('.cartItemTotal').html(''); 
		$.ajax({
            type : "Get",
            contentType: 'application/json',
          //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE
            dataType:"json",
            mimeType: 'application/json',
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
                     if(response.subtotalAmountStr !== "-1"){
                        $('#subTotal').text(response.subtotalAmountStr+" "+(typeof response.currencyCode=="undefined"?"":response.currencyCode));
                    }else{
                        $('#subTotal').text("");
                    }
		            
				}else{
					$("#subTotal").text("");	
				}
				
				$('.cartItemYourPrice').removeClass('price-loader');
				$('.cartItemMsrp').removeClass('price-loader');
				$('.cartItemSavedPrice').removeClass('price-loader');
				$('.cartItemTotal').removeClass('price-loader');
				updateChargesBasedOnCustomer();
				$('div.pageLoader').hide(); //INC-2299 END
            },  
            error : function(e) { 
            	$('div.pageLoader').hide();
            }  
          });
		
	}
	
	function updateChargesBasedOnCustomer(){
		$.ajax({
            type : "Get",
            contentType: 'application/json',
            mimeType: 'application/json',
            url : 'updatechargesbasedoncustomer',
            success : function(response) {
            	console.log(response);
            	$("#chargesContainer").html('');
            	if(response!=undefined){
            			var chargesDetails = response;
            	  		console.log(chargesDetails);
               		
               			chargesDetailsJson=chargesDetails;
               			$(".chargesSection").children().removeClass("not-active");
               			$("#charge-value").val("");
               			//$('#autoaply-charges').prop('checked', response.quote.autoApplyCharges);
               			if(typeof chargesDetails[0]!="undefined"){
               				$('#chargeSymbol').text(chargesDetails[0].overriddenCurrencyCode);
               				appendChargesData(chargesDetailsJson);
               			}
               			
              	}else{
	          			
              			$(".chargesSection").children().addClass("not-active");
              			$('#autoaply-charges').prop('checked', false);
              			$('#chargeSymbol').text("");
              			$("#charge-value").val("");
              			$("#chargesSelect").html("");
              			
              			
              			

              	} 
            },  
            error : function(e) {   
            }  
          });
	}
	
	$(".quicksearch-img").on('click',function(){
  	  fullItemRedirect($('#partId').text(),$('#organizationId').text())
		});
	
	function removeAttachedFile(){
		$('div.file-list').html('');
		$("#file-upload").val('');
		$('.modal-body').text("<spring:message code='alert.quote.order.file.delete' javaScriptEscape='true'/>");
		$("#myModal").show();
		$("#attached-fileName").val('');
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
    function disableQuoteButton(disable){
            if(disable){
                if(!$('.review-quote').hasClass('not-active'))
                    $('.review-quote').addClass('not-active');
            }else{
                $('.review-quote').removeClass('not-active');
            }
        }
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
    
    

    var billToList;
	var shipToList;
	function getBillToShipToForCustomer(orgId,customerId,flagCheck){
		var customerId = customerId;
		var organizationID =  orgId;
		 $.ajax({
	     	    type: "GET",
	     	    url: "getbilltoshiptoforCustomer",
	     	    data: {selectedOrganization:organizationID,customerId:customerId,defaultTab:"profileSetting",isAccountSettingFlow:false},
	     	    success: function(data){
	     		  	console.log("Address For Customer :"+data);
	     		  	//$('div.pageLoader').hide();
	     		  	$('div.pageLoader').show(); //INC-2299 ADDED BY ANIKET REVIEWED BY KRUPA : DIV LOADER FOR LOADING PAGE AND CHANGE OF CUSTOMER
	     			var json = JSON.parse(data);
	     			billToList = $.makeArray(json.billToList);
	     		 	//$("#billtoSelect").find("option").remove();
		     		var duplicateBillToId = "";
		     		var defaultBillToId ;
		     		var defaultShipToId ; 
		     		var dbCustomerId = json.customerId;
		     		
		     		
		     		if(flagCheck){
		     			 defaultBillToId = $("#billtoSelect").val();
			     		 defaultShipToId = $("#shiptoSelect").val(); 
		     		}else{
		     			 defaultBillToId = json.billToAddressId;
			     		 defaultShipToId = json.shipToAddressId;
		     		}
		     		var defaultBillFlag = false;
		     		shipToList = $.makeArray(json.shipToList);
		     		var docBillTo = $('#billtoSelect');
		     		var docShipTo = $('#shiptoSelect');
		     		appendOption(billToList,docBillTo,defaultBillToId);
		     		appendOption(shipToList,docShipTo,defaultShipToId);
		     		var sampleData = [];
					 
					//Set Address change for BillTo
					
			         $.each(billToList,function(index,item){
			        if(item.addressId == defaultBillToId){
			           billtoIsDefault = true;
			           $('#billToDetails').html();
			               $('#billToDetails').html(setAddress(item));
			          } 
			         });
			         //Set Address change for Ship To
			         $.each(shipToList,function(index,item){
			          if(index == 0){
			        	  if(item.addressId == defaultShipToId){
				        	   $('#shipToDetails').html();
				               $('#shipToDetails').html(setAddress(item));
				           }
			          }else{
				           if(item.addressId == defaultShipToId){
				        	   $('#shipToDetails').html();
				               $('#shipToDetails').html(setAddress(item));
			        	  }
			          }
			         });
			         //end
			         
		     		$.each(shipToList,function(index,item){
		     		//alert("addressReference"+item.addressReference+"addressName"+item.addressName+"addressLine1"+item.addressLine1+"addressId"+item.addressId+"addressCity"+item.addressCity+"addressCountry"+item.addressCountry+"addressZipCode"+item.addressZipCode);
		     			sampleData.push({"addressReference":setDataValue(item.addressReference),"addressState":setDataValue(item.addressState),"addressName":setDataValue(item.addressName),"addressLine1":setDataValue(item.addressLine1),"addressId":item.addressId,"addressCity":setDataValue(item.addressCity),"addressCountry":setDataValue(item.addressCountry),"addressZipCode":setDataValue(item.addressZipCode)});
		     		});
		    	   	/*  $.each(quoteJson.shipToAddress, function(){
		    	   		console.log("Address: " + $(this).addressReference + " , " + $(this).addressName); 
		    	   	 }); */
		    	   	buildShipToTable(sampleData);
					//End of Set Ids	     		
					console.log("defaultBillToId===="+defaultBillToId+"shippingAddress->"+defaultShipToId);
	    	   		eventsToBeTriggeredUponChangeCustomer(customerId,orgId,$("#shiptoSelect").val(),$("#billtoSelect").val());//Generic function to embed all changes to happen upon customer change
	     	    },
	     	    error: function(jqxhr, textStatus, error) {
	     	     	  // 15-01-2015-EH Handling
	     	              var err = jqxhr.status;
	     	              var msg = jqxhr.responseText;
	     	              $(".pageLoader").hide();
	     	             // myErrObj.raise(err,msg,textStatus);
	     	             
	     	     	    }
		});
		 //Check for PO Flag 
		// getPOFlagForCustomer(orgId,customerId);
	}
      
	 //Start of Loading Default Setting For Customer
    function getCustomerDropdown(orgId){
		$.ajax({
         	    type: "GET",
         	    url: "customerforOrganization",
         	    data: {selectedOrganization:orgId},
         	    success: function(data){
         	   	profileVoObj = JSON.parse(data);
         	   	console.log("Customer Lite :"+profileVoObj);
         	   	var string = [];
				$.each(profileVoObj.CustomerLiteForUserOrg,function(index,item){
					//customerString.push(item.customerReference+'-'+item.customerName);
					//$("#tags").val(item.customerReference+'-'+item.customerName);
				 	var items = {};
					items["label"] = item.customerReference + ' - '
							+ item.customerName;
					items["value"] = item.customerId;  
					string.push(items);
					
				});
				$( "#customer-no" ).autocomplete({
							minLength: 2,
							source : function (request, response) {
									var results = $.ui.autocomplete.filter(string, request.term);
									response(results.slice(0, 1000));
								},
							select : function(e, ui) {
								e.preventDefault() // <--- Prevent the value from being inserted.
								var selectedOrganization = $("#organizationId").val();
								console.log(selectedOrganization+"---"+ui.item.value);
								$('div.pageLoader').show(); //INC-2299 ADDED BY ANIKET REVIEWED BY KRUPA : DIV LOADER FOR LOADING PAGE AND CHANGE OF CUSTOMER
								onchangeDropDown = true;
								getBillToShipToForCustomer(selectedOrganization,ui.item.value,false);
								$("#customerVal").val(ui.item.value);
								console.log("Customer Values :"+JSON.stringify(ui.item));
								$("#customer-no").val(ui.item.label);
			                      customerLoaded = true;
							},
							open:function(event) {
						        $('.ui-autocomplete').css({'height':'auto'});
							        var $input = $(event.target),
							            inputTop = $input.offset().top,
							            inputHeight = $input.height(),
							            autocompleteHeight = $('.ui-autocomplete').height(),
							            windowHeight = $(window).height();
						              windowWidth = $(window).width();
						          if(windowWidth >= 768 && windowWidth <992){
						            $('.ui-autocomplete').css("width", 340+'px');
						          }
							        
							        if ((inputHeight + inputTop+ autocompleteHeight) > 430) {
							            $('.ui-autocomplete').css({"height": 430+'px', "position": "fixed"});
							        }
							    },
							focus : function(event, ui) {
								event.preventDefault();
								$("#tags").val(ui.item.label);
							}
						});
						    
         	    },
         	    error: function(jqxhr, textStatus, error) {
         	  // 15-01-2015-EH Handling
                  var err = jqxhr.status;
                  var msg = jqxhr.responseText;
                  $(".pageLoader").hide();
                  myErrObj.raise(err,msg,textStatus);
         	    }
         	  });
	}  
    
	 function eventsToBeTriggeredUponChangeCustomer(customerId,organizationId,shipToId,billToId){
	   	   $.ajax({  
			        type : "GET",
			        data : {customerId: customerId,selectedOrganization: organizationId,shipToId:shipToId,billToId:billToId},
			        url : "getaddressescontactforcustomerjson",
			        success : function(response) {
			        	$("div.pageLoader").show(); //INC-2299 ADDED BY ANIKET REVIEWED BY KRUPA : DIV LOADER FOR LOADING PAGE AND CHANGE OF CUSTOMER
			        	var isFromCartBrand = '${isFromEditFlow}'; 
			        	var responseJson = JSON.parse(response);
			        	  var isChange = responseJson.isChangeInCust;
			        	//if(!jQuery.parseJSON(isFromCartBrand)){
			        	if(isFromCartBrand == 'false' || !isFromCartBrand || isChange){	
			        	  
// 			        	  handleTransportModeOnAjax(responseJson);
			          	  appendDataForPaymentTerm(responseJson.carrierBillingOptionList);
			          	  document.getElementById("bill-to-cancel").click();
			          	  //document.getElementById("ship-to-cancel").click();
			       		  // Set customer Sales Area, Changed by Ganeshan 8th Feb
			       			//SUPPORT-MIL-223-170216
			          	  var customerSalesAreaCurrencyVo = responseJson.customerSalesAreaCurrencyVo;
			          	  if(typeof customerSalesAreaCurrencyVo!="undefined" && customerSalesAreaCurrencyVo){
			          		  $("#salesArea").val(customerSalesAreaCurrencyVo.salesOrgReference + "-" + customerSalesAreaCurrencyVo.distributionChannelRef);  
			          	  } 
			          	//On load check for shipment Terms
			             fillCarrierSelect(responseJson.carrierList);
			             	if($("#carrierBillingSelect > option:selected").text() == "Prepay and Add" && userApplication == "REV"){
		        				$("#carrierSelect").parent().parent().hide();
		        			}else if( userApplication == "REV"){
		        				$("#carrierSelect").parent().parent().show();
		        			}else{
		        				$("#carrierSelect").parent().parent().hide();
		        			}
		        			var cboId = $("#carrierBillingSelect > option:selected").val();
	        				getTransportModeBasedOnShippingTerms(cboId);
	        				//Venkatasiva : GPD-3449
	        				/* if(userApplication == "REVFIRE"){
	        					$("#carrierBillingSelect").parent().hide();
	        					$("#carrierBillingOptionLable").hide();
		        			}  */
				        }else{
				        	if($("#carrierBillingSelect > option:selected").text() == "Prepay and Add"){
		        				$("#carrierSelect").parent().parent().hide();
				        	}else{
		        				$("#carrierSelect").parent().parent().show();
		        			}
				        	var cboId = $("#carrierBillingSelect > option:selected").val();
	        				var transportmodeId;
	        				if((typeof quoteJsonGlobal.transportMode)!="undefined"){
	        					transportmodeId = quoteJsonGlobal.transportMode.transportModeId
	        				}
	        				getTransportModeBasedOnShippingTerms(cboId,transportmodeId);
	        				//Venkatasiva : GPD-3449
	        				/* if(userApplication == "REVFIRE"){
	        					$("#carrierBillingSelect").parent().hide();
	        					$("#carrierBillingOptionLable").hide();
		        			} */
				        }
			          	getRefreshedPriceForItems(shipToId,billToId);
			      }
		 });
	 }
   
	  var shipToDataTable = false;
	    function buildShipToTable(sampleData){
	        if(shipToDataTable){
	            var shipTable = $('#shipTable').DataTable();
	            shipTable.clear().draw();
	            shipTable.rows.add(sampleData); // Add new data
	            shipTable.columns.adjust().draw(); // Redraw the DataTable
	        }else{
			    	shipTableRef= $('#shipTable').DataTable({
			            data: sampleData,
			                columns: [
			                          
			                          { "data": "addressReference" },
			                          { "data": "addressLine1" },
			                          { "data": "addressCity" },
			                          { "data": "addressState" },
			                          { "data": "addressCountry" },
			                          { "data": "addressZipCode" },
			                          { "data": "addressId" }
			                ],
			               paging: false  
			         
			         });
			           shipToDataTable = true;
			    }
	        $('#shipTable tbody').find('tr').each (function() {
	            $(this).find('td').wrapInner( "<a class='new'></a>");
	            $(this).find('td:last-child').addClass('IDClass');
	         });     	
	        $('#shipTable tbody tr td a').click(function(){
	            
	  	  	  if( $(this).html() == $(this).parent('td.IDClass').find('a').html()){
	  	 		   var aElement =$(this).html();
	  	 	   }else{
	  	        var aElement =$(this).parent('td').siblings('td.IDClass').find('a').html();
	  	 	   }
	  	        $("#shiptoSelect").prop('selectedIndex', $("#shiptoSelect option[value*='"+aElement+"']").index());
	  	         
	  	  	  $('#shiptoTable').modal('toggle');
	  	  
	  			//To change the address fields in shipToDetails
	  		    var customerId = $('#customerVal').val();
	  		    var shipTo = $('#shiptoSelect').val();
	  			$.ajax({  
	  		        type : "GET",
	  		        data : {customerId: customerId,shipTo: shipTo,isFromBillTo: false},
	  		        url : "getcontactlistforshipto",
	  		        success : function(response) {
	  						var responseJson = JSON.parse(response);
	  						$('#shipToDetails').html();
	  			    	   	$('#shipToDetails').html(setAddress(responseJson.addressJson));
	  		        },  
	  		        error : function(e) {    
	  		        }  
	  		    });
	      });
	  	   //shipto feature end
	    }
	function setDataValue(input){
		if(typeof(input) != "undefined"){
			return input+" ";
		}else{
			return " ";
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
	/*
		 $('#shipToAddressCountry').on('change',function(){
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
				 // var stateSelected = $('#stateSelect').find("option:selected").text();	
				 //To get the option value i.e., state code
				 var stateSelected = $('#stateSelect').val();
				  console.log("stateSelect: " + stateSelected);							  
				  $("#shipToAddressState").val(stateSelected); 				 			  
				  //$('#shipToAddressCountry').val(shipToAddressCountry).attr('readonly','readonly');
			  }else{
				  $("#shipToAddressState").val('');
			  }
		});*/
		//GPD-51: Venkatasiva End
	$("#carrierBillingSelect").on('change',function(){
		var shipmentTerms = $("#carrierBillingSelect > option:selected").text();
		var cboId = $("#carrierBillingSelect > option:selected").val();
		if(shipmentTerms == 'Prepay and Add'){
			$("#carrierSelect").parent().parent().hide();
 		}else{
			$("#carrierSelect").parent().parent().show();
			$("#carrierSelect").prop("selectedIndex", 1);
 		}
		getTransportModeBasedOnShippingTerms(cboId);
		$("#carrierSelect").prop("selectedIndex", 0);
			
	});
    </script>
</body>
</html>

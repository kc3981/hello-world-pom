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
<script type="text/javascript"
	src="../js/loading.js?version=${properties['application.version']}" defer></script>
	
<script type= "text/javascript" src = "../js/dealer.scripts.js" ></script>

<sec:authorize access="hasRole('ROLE_DEALER_USER')" var="isDealerUser"></sec:authorize>

</head>
<body>
<%@ include file="../googleAnalyticsbody.jsp" %>
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed ">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class="active"><spring:message code="lable.quote.quotes" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<h3>
						<spring:message code="label.brand.request.quote" />
						- <span id="organizationName"></span>
					</h3>

					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.choose" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.create.quote" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review.quote" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm.quote" /></span></li>
					</ul>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
							<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline" id="customer_dealer_name">
									<spring:message code="label.quote.order.customer" />
									
								</h5>:
								<p class="inline" id="customerDetails"></p>
							</div>
							<div
								class="form-static-data form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="label.quote.order.your.reference" />
									:
								</h5>
								<p id="referenceNo" class="inline"></p>
							</div>

							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 column-paddings">
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12" id="billToReview">
									<div class="">
										<h5 class="inline" >
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
										<h5 class="inline" id="paymentTermsLable">	<spring:message code="view.label.payment.terms"  />
											:
										</h5>
										<p class="inline" id="carrierBillingOption"></p>
										<br>
									</sec:authorize>
									<h5 class="inline" id="shippingMethodLable">
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

							<!-- Added from mil-->
							<!--   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="endCustomer">
									<h5 class="inline">My Customer :</h5>
	                                <p class="inline endCustomerName" id="endCustomerName"></p><br> 
	                                     
                        </div> -->
							<!-- end of Added from mil-->

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
									<h5 class="inline">
										<spring:message code="label.quote.order.name" />
										:
									</h5>
									<p class="inline" id="contactName"></p>
								</div>
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
									<h5 class="inline">
										<spring:message code="label.quote.order.email" />
										:
									</h5>
									<p class="inline" id="contactEmail"></p>
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
											<p id="attachedFile" class="inline"></p>
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
			                        <h5 class="inline"><spring:message code="label.quote.order.sales.rep" /> : </h5>
			                        <p class="inline" id="salesRepDetails"></p>  
			                    </div>
		                    </sec:authorize>
		                    <sec:authorize access="hasRole('ROLE_APPLY_CHARGES')">
			                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                        <h5 class="inline"><spring:message code="label.quote.order.auto.apply.charge" /> : </h5>
			                        <p class="inline" id="autoApply"></p>  
			                    </div>
		                    </sec:authorize>
	                    </div>
	                </div>
				</sec:authorize> --%>
					<div class="quote-total">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<!-- GPD-2522 ROLE_PRICE authorization added by Pujith reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_PRICE')">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">
								
								<spring:message code="label.quote.order.item.total.am" />
								(<span id="count"></span>
								<spring:message code="label.quote.order.items" />
								)
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4" id="subTotal"></h5>
							</sec:authorize>
							<sec:authorize access="!hasRole('ROLE_PRICE')">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">
								
								<spring:message code="label.shoppingcart.total" />
								(<span id="count"></span>
								<spring:message code="label.quote.order.items" />
								)
							</h5>
							</sec:authorize>
								
						</div>
						<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">Handling/Labor</p>
                        <p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">$98.00 </p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">Minimum Order Charge</p>
                        <p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">$28.00</p>
                    </div> -->
						<div id="chargesContainer"></div>


						<p class="alert-message pull-right" style="display: none;">
							<spring:message code="label.total.item.cart.msg" />
						</p>
						<!-- GPD-2522:ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_PRICE')">
							<div class="final-total col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8 font20">
								<spring:message code="view.label.quote.total" />
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4 font20"
								id="totalAmount"></h5>
							
						</div>
						</sec:authorize>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a href="javascript:void(0);" class="green-button prev"
								id="edit-quote"><spring:message
									code="label.createorderFromcartreview.edit" /></a> <a
								href="javascript:void(0);" id="quote-confirm"
								class="pull-right green-button next"><spring:message
									code="label.brand.confirm.quote" /></a>
							<p class="taxp">
								<spring:message code="message.quote.tax.disclaimer" />
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>

			<!------    Search Component           ----->
			<!-- SUPPORT-MIL-223-170216 -->
			<div class="modal modal-quotes fade" id="demo-1" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content custom-modal-content">

						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title caps" id="myModalLabel">
								<strong>Sales Area</strong>
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<div class="row">
								<div class="col-sm-5">
									<label
										class="control-label col-lg-3 col-md-3 col-sm-4 col-xs-12 required">Select</label>
									<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
										<select name="carrierSales" id="searchType"
											class="form-control">
											<option>----- Select ------</option>

											<option value="1">Sales Org Reference</option>

											<option value="2">Distribution Channel Reference</option>

											<option value="3">Description</option>

										</select>
									</div>
								</div>
								<div class="col-sm-5">
									<label
										class="control-label col-lg-3 col-md-3 col-sm-4 col-xs-12 required">Search</label>
									<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="searchText" class="form-control">
									</div>
								</div>
								<div class="col-sm-2">
									<button class="btn btn-default" id="searchAddress">Search</button>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-12">
									<table id="quotes-table"
										class="table table-striped table-bordered"
										style="display: none;">
										<tr>
											<th>Select</th>
											<th>Sales Org Reference</th>
											<th>Sales Org Name</th>
											<th>Distribution Channel Ref</th>
											<th>Description</th>
										</tr>

									</table>
								</div>
							</div>
						</div>

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
			<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
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

	<!-- Javascript Plugins -->
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
	<script
		src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer></script>
	<script id="createQuoteTemplate" type="text/x-jquery-tmpl">

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details text-center-xs">
                                <div class="col-lg-2 col-sm-3">
									{{if mediaId!=0}}
                               			<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="catalog-img">
											{{if !isActualImage}}
												<div class="waterMarkForQuoteReview">
													<span style="font-size: 8px; margin: 10px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
													<span style="font-size: 7px; font-weight: 400;margin: 12px;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
												</div>
											{{/if}}
										</a>
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-4 col-sm-4">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a></h4>
									<%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
									<c:if test="${properties['display.legacy.part']}">
										<div><spring:message code="label.legacy.part"/> ${'${'}legacyNumber}</div>
									</c:if>
                                    <div><strong>${'${'}partCommercialDescription}</strong></div>
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
									<!-- GPD-2522 ROLE_AVAILABILITY authorization added by Pujith, reviewed by Venkatasiva Reddy -->
									<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
									<div><strong>${'${'}inventoryMessage}</strong></div> 
									</sec:authorize>
                                    </div>

									<p class="order-multiples-lbl"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>${'${'}orderMultiple}</p>

				<c:if test="${properties['item.comments.section.required']==true}">
                                    <div class="product-comments item-comments" comment-itemId="${'${'}partId}">
                                        <h5><spring:message code="label.quote.order.comments" />: </h5>
                                        <p>${'${'}comments}</p>
                                    </div></c:if>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2">
								<div class="spinner-control">
                                      <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:40px;text-align:center" readonly>
                                      <span class="unit">${'${'}uom}</span> 
                                 </div>
								</div>
                                <div class="col-lg-3 col-md-3 col-sm-3 nopadding">
									<c:choose>
                       		 			<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
										<!-- GPD-2522:ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
										<sec:authorize access="hasRole('ROLE_PRICE')">
											{{if priceMSRPStr !== "-1"}}
                                    			<div><spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
											{{/if}}
											{{if itemTotalMSRPStr !== "-1"}}
												<div><h5><spring:message code="label.shoppingcart.total" />: ${'${'}itemTotalMSRPStr}  ${'${'}currencyCode}</h5></div>
											{{/if}}
										</sec:authorize>
										</c:when>
										<c:otherwise>
											{{if priceMSRPStr !== "-1" && priceMSRPStr!=priceStr}}
                                    			<div><spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
											{{/if}}
											{{if priceStr !== "-1"}}
                                    			<div><strong><spring:message code="label.item.yourPrice" />: ${'${'}priceStr} ${'${'}currencyCode}</strong></div>
											{{/if}}
											{{if savedPriceStr !== "-1" && priceMSRPStr!=priceStr}}
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
    var userid,authtoken;
    
    
    var defaultPartUOM = '${properties["default.part.uom"]}';
    var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
    var ordMult;
    var valueHideOrShow;
    var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
    
    $(document).ready(function(){
    	$('.pageLoader').show();
    	//Venkatasiva : GPD-3449
    	 hideOrShowTransportModeFieldsQuotes('${hideOrShowFields}');
    	var errorMessageFromERP = '${errorMessageFromERP}';
    	if(errorMessageFromERP){
            $("#quote-confirm").css('opacity','0.5');
            $('#myModal .modal-body').text(errorMessageFromERP);
            $("#myModal").show();
            $('div.pageLoader').hide()
           }
      $("#quote-confirm").click(function(){
        if(!errorMessageFromERP){
        	 $('div.pageLoader').show(); 
             $("#quote-confirm").addClass('not-active');
             $("#quote-confirm").blur(); //INC-2424 ADDED BY ANIKET : TO PREVENT DUPLICATE ORDER : REVIEWED BY JK
      		 window.location.href = "createquoteconfirm";
       }
      });
    	
      $(".custom-close").click(function(){
		   $("#myModal").hide();
		});
      
      
        /*if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1){
            $('div.timeline').css({'margin':'33px 5% 7% 10%'});
          }*/
    	//Added by Krupa
    	var breadcrumbsPhrase = '${breadcrumbsArray}';
    	$('#breadcrumbsArray').val(breadcrumbsPhrase);
		if(null !='${breadcrumbsArray}' || '${breadcrumbsArray}' != '' ){
	          var stringSplit = breadcrumbsPhrase.toString().split(",");
	          console.log(stringSplit);
	          for(i=0;i<stringSplit.length;i++){
	           console.log(stringSplit[i]);
	           if(stringSplit[i].indexOf('_') > 0){
	           		var name = stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
	           		var hrefLink = stringSplit[i].substring(stringSplit[i].indexOf("_")+1,stringSplit[i].length);
	           		/* if(hrefLink.indexOf("getfullitemdetails") != -1){
	           			$(".breadcrumb > li:last-child()").before('<li>'+name+'</a></li>').addClass("active"); 
	           		}else{
	           			$(".breadcrumb > li:last-child()").before('<li><a href="'+hrefLink+'">'+name+'</a></li>'); 
	           		} */
	           }else{
	        	   $(".breadcrumb > li:last-child()").addClass("active");
	           }
	          }
		}
		// End of Added by krupa
    	userid=$('#userId').val();
		authtoken = $('#authToken').val();
    	var quote = '${quoteReview}';
      	var quoteJson = JSON.parse(quote);
      	console.log(quoteJson);
      	var locale=${locale};
      	
      	/*if (window.history && window.history.state) {
      		window.history.state('forward', null, 'createquotefromcartinit?organizationId='+quoteJson.organization.organizationId+'&isFromCartBrand=false&isDivisionMapped='+quoteJson.isDivisionMapped); 
      	  $(window).on('popstate', function() {
      	   window.location.href = 'createquotefromcartinit?organizationId='+quoteJson.organization.organizationId+'&isFromCartBrand=false&isDivisionMapped='+quoteJson.isDivisionMapped
      	  });
      	}*/
      	
      	 $("#createQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
         $('#count').text(quoteJson.cartItemList.length);
         if(quoteJson.cartItemList.length>0){
           	// $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.cartItemList[0].currencyCode);
           	if(quoteJson.subtotalAmountStr!="-1")
           	 	$('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
             disableQuoteButton(false);
            }else{
           	// $('#subTotal').text(quoteJson.subtotalAmountStr+" "+quoteJson.currencyCode);
           	$('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
            disableQuoteButton(true);
          }
		 
		 console.log(quoteJson);
		 if(typeof quoteJson.chargeList!="undefined"){
			 $("#chargesContainer").html('');
	         $("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
		 }
		
		setDataForReview(quoteJson);
		hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
		valueHideOrShow = ${hideOrShowFields};
		
		//ordMult = quoteJson.cartItemList[0].orderMultiple;
    	//$(".order-multiples-lbl").html("<spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>"+ordMult);
        if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
    	 	$(".order-multiples-lbl").show();
        }else{$(".order-multiples-lbl").hide();
        }
		
       
    	$('.total-items-review').prop('disabled','true');
    	if(typeof quoteJson.quotedBy!="undefined"){
    		var salesRep = quoteJson.quotedBy.userId + " - " + quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName;
    		$('#salesRepDetails').text(salesRep);
    	
    	}
    	
    	$('#comments').text(quoteJson.comments==""?"-":quoteJson.comments);
    	$('#autoApply').text(quoteJson.autoApplyCharges?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
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
    	
    	if(quoteJson.isGuestChildCart){
    		$('#SALES_REP_SECTION').hide();
    	}
    	
    	$('#edit-quote').on('click', function(){
    		window.location.href = 'createquotefromcartinit?organizationId='+quoteJson.organization.organizationId+'&isFromCartBrand=false&isDivisionMapped='+quoteJson.isDivisionMapped+"&isFromEditScreen="+true;;//+'&breadcrumbsArray='+breadcrumbsPhrase;
    	})
    	
    	
    	hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
        $('.pageLoader').hide();
    });
	
	function setDataForReview(quoteJson){
  		/* $('#customerDetails').text((typeof quoteJson.customer=="undefined")?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName); */
		$('#customerDetails').text(quoteJson.isGuestChildCart?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
		$('#referenceNo').text(quoteJson.cartName==""?"-":quoteJson.cartName);
		$('#bill-to').text(((typeof quoteJson.billToAddress.addressReference=="undefined"))?quoteJson.billToAddress.addressName:quoteJson.billToAddress.addressReference+" - "+quoteJson.billToAddress.addressName);
		$('#ship-to').text(((typeof quoteJson.shipToAddress.addressReference=="undefined"))?quoteJson.shipToAddress.addressName:quoteJson.shipToAddress.addressReference+" - "+quoteJson.shipToAddress.addressName);
		
		$('#transportModeId').text(typeof quoteJson.transportMode=="undefined"?"-":quoteJson.transportMode.transportDescription);
		$('#carrierBillingOption').text(typeof quoteJson.carrierBillingOption=="undefined"?"-":quoteJson.carrierBillingOption.description);
		
		$('#carrierId').text(typeof quoteJson.carrier=="undefined"?"-":quoteJson.carrier.carrierDescription);
		//Venkatasiva : GPD-3449
		/* var userApplication = $('#userApplication').val();
  	 	
  	 	if(userApplication == "REVFIRE"){
  	 		$('#carrierBillingOption').hide();
			$('#shippingMethodLable').hide();
  	 	}else{
  	 		
  	 		$('#carrierId').text(typeof quoteJson.carrier=="undefined"?"-":quoteJson.carrier.carrierDescription);
  	 	} */
		
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
			 $('#carrierId').hide();
			$('#carrierId').prev().hide();
		 }else{
			$('#bill-to-addr').html(setAddress(quoteJson.billToAddress));
			$('#ship-to-addr').html(setAddress(quoteJson.shipToAddress));
		 }
		//Commented to not to show attachment
		//$('#attachedFile').html(quoteJson.attachedFile.size>0?quoteJson.attachedFile.fileItem.fileName:'-');
		$('#organizationName').text(quoteJson.organization.organizationName);
		//SUPPORT-MIL-223-170216
		$('#salesArea').text(typeof quoteJson.customerSalesAreaCurrencyVo=="undefined"?"":quoteJson.customerSalesAreaCurrencyVo.description);
		
		consignmentOrderStatusInViews(quoteJson.customer.customerTypeId);
		$('#consignment-order').text(quoteJson.consignmentOrder?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		
		
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
	/* 
	// full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   	  window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+'&isFromQuoteOrder=true&cartItemId='+cartItemId,'_blank');
     } */
     function disableQuoteButton(disable){
            if(disable){
                if(!$('.review-quote').hasClass('not-active'))
                    $('.review-quote').addClass('not-active');
            }else{
                $('.review-quote').removeClass('not-active');
            }
        }
     history.pushState(null, null, null);
     window.addEventListener('popstate', function () {
         history.pushState(null, null, document.referrer);
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

</body>
</html>
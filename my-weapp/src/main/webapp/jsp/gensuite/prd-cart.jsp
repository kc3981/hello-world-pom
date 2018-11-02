

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!--     <link rel="shortcut icon" href="images/favicon.ico">
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
<%-- <script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script> --%>
<script defer
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer></script>
<style type="text/css">
ul#ui-id-1 {
	position: absolute !Important;
	z-index: 999 !important;
}

#ui-id-2 {
	position: fixed;
}

.fa.fa-star.fav-item {
	font-size: 18px;
	color: #c52033;
	line-height: 30px;
	cursor: pointer;
}

.no-fav-item {
	color: #7b7b7b !important;
	cursor: pointer;
}



/*.col-lg-3.pricebox {
		    width: 29%;
		}
		.col-lg-1.delete-item-parent {
		    width: 4%;
		}*/
.price_cart_R {
	padding: 1px 5px 2px 5px;
}

.pl-lg-15 {
	padding-left: 15px;
}

.emptyCart {
	color: black;
	pointer-events: none;
	cursor: default;
}

@media only screen and (min-width: 768px) {
	/* .sm_lm_-50 {
		    margin-left: -50px;
	} */
}

@media ( min-width : 300px) and (max-width: 767px) {
	.xs_bottom {
		margin-bottom: 35px;
	}
}
</style>

</head>

<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>

			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class="active"><spring:message code="label.shoppingcart" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper m-t-sm-17 m-t-lg-48">

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<h3 class="responsive-padding page-heading pl-lg-15">
						<input id="selectall" type="checkbox" class="cart-checkbox" />
						<spring:message code="label.shoppingcart" />
						(<span class="cart-item-count"></span>) <span
							class="fa fa-trash-o delete-item_new emptyCart"
							id="emptyCartButton" onClick="emptyCartDelete()"></span>
					</h3>
				</div>

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings parent-cart-items">
					<div id="cart-items-hldr"
						class="result-container col-lg-9 col-md-9 col-sm-12 col-xs-12 responsive-padding nopadding">
					</div>

					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 get-quote">
						<div
							class="checkout col-lg-12 col-md-12 col-sm-6 col-xs-12 column-paddings">
							<div id="currencyContainer"></div>
							<!--  <sec:authorize access="hasRole('ROLE_ORDER')">
                     <button id="btn-place-order-frm-cart" class="col-sm-6 checkout-button" type="submit"><img src="../images/checkout.png"><strong>Place Order</strong></button>
                     </sec:authorize> -->
							<div class="checkout-footer">
								<!-- GPD-2522: ROLE_PRICE authorization added by Pujith, reviewed by Venkatasiva Reddy -->
								<sec:authorize access="hasRole('ROLE_ORDER') and hasRole('ROLE_PRICE')">
									<!-- fix for OM-1514: Place order leading 405 error. place order button is made inactive by default. once page is loaded, it is made active. Added by Pooja.H.S -->
												<!-- Edited by Pujith for GPD-10. Reviewed by Krupa  -->
												<a href="javascript:void(0)"
													class="btn btn-buynow cart-small order-button btn-width disabled "
													id="btn-place-order-frm-cart" onclick="quoteOrder(event,'createorderfromcartbrand')"
													style="margin-right: 4px; line-height: 1.5;">
													<spring:message code="label.cart.place.order" /></a>
								</sec:authorize>
								<!-- <a class="btn btn-primary btn-sm pull-right theme-maroon" href="carttoquote.html">Create Quote</a>  -->
								<!-- Edited by Pujith for GPD-10. Reviewed by Krupa  -->
								<sec:authorize access="hasRole('ROLE_CART')">
												<a href="javascript:void(0)"
												class="btn quote-button theme-maroon btn-width disabled"
												id="btn-create-quote-frm-cart" onclick="quoteOrder(event,'createquotefromcartbrand')"><!-- Edited by Pujith for GPD-10. Reviewed by Krupa  --> <spring:message
												code="label.create.quote" /></a>
								</sec:authorize>
							</div>
							<p class="alert-message" style="display: none;">
								<spring:message code="label.total.item.cart.msg" />
							</p>
						</div>
						<!-- <sec:authorize access="hasRole('ROLE_CART')">
                                              <a href="javascript:void(0)" class="btn quote_continue quote-button"><spring:message code="label.create.quote"/></a>
                     </sec:authorize>
                                         <button class="btn quote_continue continue_shopping" type="submit">Continue Shopping</button> -->
						<div
							class="col-lg-12 col-md-12 col-sm-6 col-xs-12 column-paddings quick-search-popover xs_bottom">
							<div class="quick-search-hldr">
								<div class="box-title">
									<spring:message code="label.quick.search" />
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
										id="required3DViewerVersionUrl"> <input type="hidden"
										name="search_param" value="all" id="search_param"> <input
										type="hidden" id="fuzzy" name="fuzzy" /> <input type="hidden"
										name="pageNumber" id="pageNumber"> <input
										type="hidden" name="typedropdown" id="typedropdown"
										value="all" /> <a href="#" class="clear-search hidden"><i
										class="fa fa-times" style="right: 15px;"></i></a> <input
										name="keyword" id="keyword1" type="text"
										class="form-control keyword" aria-label="Search"
										placeholder="<spring:message code="label.cart.search.for.parts"/>">
									<!-- <span class="input-group-addon search-glass-hldr"><i class="search-glass-ico"></i></span> -->
								</div>
								<div class="popover-content" id="quickSearchDiv"
									style="display: none;">
									<div class="row cart-item">
										<div class="col-md-12 cartitem">
											<a href="javascript:void(0);" class="quicksearch-img"> <img
												id="quickSearchImg" src=""> <!-- INC-2498 fix starts(Developed by : Swetha) -->
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
												id="mediaId"> <input type="hidden" id="mediaId">
											<input type="hidden" id="organizationId"> <input
												type="hidden" id="partNumber"> <input type="hidden"
												id="ordermultiple" />

											<sec:authorize access="hasRole('ROLE_CART')">
												<button class="btn btn-addtocart cart-small"
													id="quickSearchAddCart">
													<spring:message code="quick.search.addtocart" />
												</button>
											</sec:authorize>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings view-other-products upsell-frame"
					style="display: none">
					<p class="recommendation_text column-paddings">
						<spring:message code="label.cart.customer.also.bought" />
					</p>
					<div id="upsellContainer" style="display: inline-block;">
						<div class="clearfix"></div>
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
			<div class="modal bs-example-modal-md" id="emptyCartConfirmationWindow" data-backdrop="static" data-keyboard="false">
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
									code="label.bulkpartupload.ok" /></a>
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
			<div
				class="row search-parts-template cart-details add-cartpopover-img"
				style="display: none">
				<div class="col-lg-2">
					<a href="javascript:void(o);" class="no-image"><p
							id="imageDesc"></p></a>
				</div>
			</div>
		</form>
	</div>

	<!-- Javascript Plugins -->
	<script
		src="//ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer
		type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/gensuite-ui.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script src="../js/custom.scripts.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script src="../js/hideOrShowFields.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script>
	var mediaId; 

	</script>
	<script id="shoppingCartTemplate" type="text/x-jquery-tmpl">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details">

                  <%-- This code Came for Hilpheonix
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 xs_img_center"> --%>

						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 item_check nopadding prd_cart_checkbox">
							<input class="ind-empty-checkbox cart-checkbox" id="${'${'}cartItemId}_${'${'}organizationId}" type="checkbox" onclick="indCheckBox(${'${'}cartItemId},${'${'}organizationId},event)" value="${'${'}cartItemId}_${'${'}organizationId}"> 
						</div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 xs_img_center sm_lm_-50" >
							 {{if mediaId!=0}}
                              <a href="javascript:void(0)" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" >
								<%--INC-2498 fix starts(Developed by : Swetha)--%>
								<img id="image" src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img">
								{{if !isActualImage}}
										<div class="waterMarkForCart">
											<span style="margin: 8px;font-size: 8px; font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
											<span style="margin: 10px;font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
										</div>
								{{/if}}
							  	</a>
								<%--INC-2498 fix ends--%>
                             {{else}}
									 <a href="javascript:void(0);" class="no-image" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><p></p></a>
							 {{/if}}
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12 padding-left">
                            <h4><a href="javascript:void(0)" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a>
								<span>
										<c:if test="${ not sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
											<a class="fav-btn ng-scope" title="Favorites" data-itemid="${'${'}partId}" data-mediaid="${'${'}mediaId}" data-orgid="${'${'}organizationId}" data-quantity="${'${'}orderMultiple}">
										{{if myFavNonOrderableShown == 1}} 
											{{if myFavShown == 0}} 
												<i class="fa fa-star no-fav-item"></i>
											{{else}}
												<i class="fa fa-star fav-item"></i>
											{{/if}}
										{{/if}}
									</a>
								</c:if>	
								</span>
							</h4>
                           		

								 <%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
							<c:if test="${properties['display.legacy.part']}">
								<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div>
							 </c:if>
														
							
                            <div><strong>${'${'}partCommercialDescription}</strong></div>
							<sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
								<div>${'${'}partEngineeringDescription}</div>
							</sec:authorize>
                         <div class="b-label" data-cartItem="${'${'}cartItemId}" ><!--  Support-MIL-236-170216 <div class="b-label">-->
								   <!-- Start: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
									{{if typeof(obsoletePartNumber) != "undefined" && obsoletePartNumber!=''}}
									<div id="cartSuperseeded"><spring:message code="search.part.superseededpartnumber" />${'${'}obsoletePartNumber} </div>
									{{/if}}
									<!--End: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
								<c:if test="${properties['display.organizationName']}">
                                <div>${'${'}organizationName} Part</div>
								</c:if>
									<p class="order-multiples-lbl" data-orgId="${'${'}organizationId}"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>${'${'}orderMultiple}</p>
                                <!-- <div><strong>${'${'}availableQuantity} In Stock</strong></div> -->
								<!-- GPD-2522: ROLE_AVAILABILITY authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
								<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
								<div><strong>${'${'}inventoryMessage}</strong></div>
								</sec:authorize>
                            </div>
                        </div>

						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pricebox nopadding xs_img_center pt-xs-10">

                          <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalAmountStr}" />
						  <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalMSRPStr}" />
							{{if priceMSRPStr !== "-1" && priceMSRPStr!=priceStr }}
							<!-- GPD-2522: ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
								<sec:authorize access="hasRole('ROLE_PRICE')">
								<div class="price_cart_R">
									<spring:message code="label.msrp"/>: 
										<span data-cartItem="${'${'}cartItemId}" class="cartItemMsrp"> 
											${'${'}priceMSRPStr} ${'${'}currencyCode}
										</span>
								</div>
								</sec:authorize>
								<sec:authorize access="!hasRole('ROLE_PRICE')">
									<spring:message code="message.guest.login" />
								</sec:authorize>
							{{/if}}
							{{if priceStr !== "-1"}}
                       			<div class="price_cart_R">
									<spring:message code="label.your.price"/>: 
										<span data-cartItem="${'${'}cartItemId}" class="cartItemYourPrice one">
											${'${'}priceStr} ${'${'}currencyCode}
										</span>
								</div>
							{{/if}}
							{{if savedPriceStr !== "-1" && priceMSRPStr!=priceStr }}
								<div class="blueColor xs_img_center price_cart_R">
									<spring:message code="label.you.save"/>: 
										<span data-cartItem="${'${'}cartItemId}" class="cartItemSavedPrice"> 
											${'${'}savedPriceStr} ${'${'}currencyCode}
										</span> 
										<spring:message code="lable.item.each" />
								</div>
							{{/if}}
							<!-- GPD-2522: ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_PRICE')">
							{{if itemTotalAmountStr !== "-1"}} 
                  			<div class="item-total">
								<strong><spring:message code="label.item.total"/>: 
									<span data-cartItem="${'${'}cartItemId}" class="cartItemTotal logged-in">
                        				${'${'}itemTotalAmountStr} ${'${'}currencyCode}
                    				</span> 
								</strong>
							</div>
							{{/if}}

							{{if itemTotalMSRPStr !== "-1"}}
							<div class="item-total" style="margin-top:0;">
								<strong><spring:message code="label.item.total"/>:
									<span data-cartItem="${'${'}cartItemId}" class="cartItemTotal guest"> 
                      					${'${'}itemTotalMSRPStr} ${'${'}currencyCode}
                  					</span> 
								</strong>
							</div>
							{{/if}}
							</sec:authorize>
							
                        </div>

                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-12 nopadding text-center">

                            <c:choose>
                            <c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
                                <div class="spinner-control"  data-ordermultiplekey="${'${'}orderMultiple}" style="margin-top:0" id="${'${'}cartItemId}" data-orgId="${'${'}organizationId}" data-priceval="${'${'}price}" data-msrpval="${'${'}priceMSRP}" data-savepriceval="${'${'}savedPrice}" data-currencyval="${'${'}currencyCode}" data-uomval="${'${'}uom}">
                              <input type="text" id="${'${'}partId}" class="total-items output" maxlength="6" value="${'${'}quantity}" style="width:40px;text-align:center;">  
                              <div class="qty">  
                                <a href="javascript:void(0);" class="item-increment plus-click">
                                    <i class="fa fa-caret-up"></i>
                                  </a>
                                  <a href="javascript:void(0);" class="item-decrement minus-click">
                                    <i class="fa fa-caret-down"></i>
                                  </a>
                              </div>
                              </div>
                              <span class="unit">${'${'}uom}</span>
                              </c:when>
                              <c:otherwise>
                                <div class="spinner-control" data-ordermultiplekey="${'${'}orderMultiple}" id="${'${'}cartItemId}" data-orgId="${'${'}organizationId}" data-priceval="${'${'}price}" data-msrpval="${'${'}priceMSRP}" data-savepriceval="${'${'}savedPrice}" data-currencyval="${'${'}currencyCode}" data-uomval="${'${'}uom}">
                              <input type="text" id="${'${'}partId}" class="total-items output" maxlength="6" value="${'${'}quantity}" style="width:40px;text-align:center;">
							  <input type="hidden" class="hiddenQty" value="${'${'}quantity}"/>  
                              <div class="qty">  
                                <a href="javascript:void(0);" class="item-increment plus-click">
                                    <i class="fa fa-caret-up"></i>
                                  </a>
                                  <a href="javascript:void(0);" class="item-decrement minus-click">
                                    <i class="fa fa-caret-down"></i>
                                  </a>
                              </div>
                              </div>
                              <span class="unit">${'${'}uom}</span>
                              </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
	 </script>

	<script id="upsellTemplate" type="text/x-jquery-tmpl">
		
	 	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center upsell-item">
                    <div class="upsell-img-wrapper">
                       {{if mediaId!=0}}
                           <a href="javascript:void(0)" onclick="fullItemRedirect(${'${'}upsellPartId}, ${'${'}organizationId}})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="recommendations"></a>
                       {{else}}
							<a href="javascript:void(0);" class="no-image" onclick="fullItemRedirect(${'${'}upsellPartId}, ${'${'}organizationId})"><p></p></a>
						{{/if}}
                    </div>
                    <div class="upsell-details">
                    <span><a href="javascript:void(0)" onclick="fullItemRedirect(${'${'}upsellPartId}, ${'${'}organizationId})"><spring:message code="quick.search.item" /> ${'${'}upsellPartNumber}</a></span>
                    <div><strong>${'${'}commercialDescription}</strong></div>
					<p class="order-multiples-lbl" data-orgId="${'${'}organizationId}"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>${'${'}upsellOrderMultiple}</p>
                    </div>
					<!--Added for GSP-1037 - Kameshwari Popuri -->
					 <c:choose>
					<c:when test="${properties['enable.upsell.price']=='true'}">
					<div class="upsellPartPrice">
						{{if priceMSRPStr!=="-1" && priceMSRPStr!=priceStr }} 
                			<p><spring:message code="label.msrp"/>: <span class="msrp-price">${'${'}priceMSRPStr} ${'${'}CurrencyCode}</span></p>
						{{/if}}
						{{if priceStr!=="-1"}} 
                			<p> <spring:message code="label.your.price"/>: <span class="price-total">${'${'}priceStr} ${'${'}CurrencyCode}</span></p>
						{{/if}}
						{{if savedPriceStr!=="-1" && priceMSRPStr!=priceStr }} 
                			<div class="blueColor"><spring:message code="label.you.save"/>: <span class="save-price">${'${'}savedPriceStr} ${'${'}CurrencyCode}</span></div>
						{{/if}}
      			 	</div> 
					</c:when>
					 <c:otherwise> </c:otherwise>
					 </c:choose>
					<div><strong>${'${'}inventoryMsg}</strong></div>
					<div class="spinner-control" data-ordermultiplekey="${'${'}upsellOrderMultiple}">
                      <input type="text" class="total-items output" maxlength="6" style="width:50px;text-align:center" value="${'${'}upsellOrderMultiple}">
                      <div class="qty">  
                        <a href="javascript:void(0);" class="item-increment">
                            <i class="fa fa-caret-up"></i>
                          </a>	
                          <a href="javascript:void(0);" class="item-decrement">
                            <i class="fa fa-caret-down"></i>
                          </a>
                      </div>
					
                    </div><span class="upsell-unit" style="/*bottom:60px;left:134px;*/">${'${'}upsellUom}</span> 
                    <sec:authorize access="hasRole('ROLE_CART')">
            					<input type="hidden" id="partId" value="${'${'}upsellPartId}"/> 
                                <input type="hidden" id="mediaId" value="${'${'}mediaId}">
                                <input type="hidden" id="partNum" value="${'${'}upsellPartNumber}">
            					<input type="hidden" id="data" value="${'${'}upsellPartNumber}">
            					<input type="hidden" id="partNum" value="${'${'}upsellPartNumber}">
            					<input type="hidden" id="partNum" value="${'${'}upsellPartNumber}">								
								<input type="hidden" id="partUOM" value="${'${'}upsellUom}">
								<input type="hidden" id="partOrderMultiple" value="${'${'}upsellOrderMultiple}">
            					{{if isOrderable && hasPriceAccess}}
<br />
                                	<button class="btn btn-addtocart cart-small upsellAdd"><spring:message code="quick.search.addtocart"/></button>
            					{{else}}
<br />
            						<button class="btn btn-addtocart cart-small not-active upsellAdd"><spring:message code="quick.search.addtocart"/></button>
            					{{/if}}
                    </sec:authorize>
                </div>
	 </script>

	<script id="currencyTemplate" type="text/x-jquery-tmpl">
	 	<div class="quantityprice">
                <p>${'${'}organizationName} <spring:message code="label.items"/>: <strong><span>${'${'}itemCount}</span></strong></p>
				<!-- GPD-2522:ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
					<sec:authorize access="hasRole('ROLE_PRICE')">
				{{if totalMSRPStr!=="-1"}} 
                	<p><spring:message code="label.total.list"/>: <span class="msrp-price">${'${'}totalMSRPStr} ${'${'}CurrencyCode}</span></p>
				{{/if}}
				{{if totalAmountStr!=="-1"}} 
                	<p> <spring:message code="label.total.price"/>: <strong class="price-total">${'${'}totalAmountStr} ${'${'}CurrencyCode}</strong></p>
				{{/if}}
				{{if savePriceStr!=="-1"}} 
                	<div class="blueColor"><spring:message code="label.total.save"/>: <span class="save-price">${'${'}savePriceStr} ${'${'}CurrencyCode}</span></div>
				{{/if}}
				</sec:authorize>
       </div>
	 </script>

	<!-- Spinner Control -->
	<script type="text/javascript">
    
    var defaultPartUOM = '${properties['default.part.uom']}';
	   var defaultPartOrderMultiple = '${properties['default.part.ordermultiple']}';
	   var valueHideOrShow; 
	   var ordMult;
	   var orderMultipleOrgFlag;
	   	   
    var  myErrObj = new errnsp.errHandling.init();
    var userid,authtoken;
    var selectAllEmptyCart;
    $(document).ready(function(e){
    	
    	var previousUrl = document.referrer;
    	<!-- GSP-1070 Observe "From Quote page to Shopping cart page" Back button not working.-->
   		History.pushState({},'${properties['global.page.title']}',"./"+History.getState().url.split('web/')[1]+"?state=99");
       	var manualStateChange = true;
   		History.Adapter.bind(window,'statechange',function(){
   		    if(manualStateChange == true){
   		    	var x = previousUrl.split("/");
   		    	if(x[x.length-1] == "searchrequest"){//The state in Search result is defaulted to the adjacent one
   		    		window.location.href="homepage";
   	        	}else{
   	        		window.location.href = previousUrl;
   	        	}
   		    }
   		    manualStateChange = true;
   		});
			
    	userid=$('#userId').val();
		authtoken = $('#authToken').val();
    	getCartItems();
    	 $("#quickSearchDiv").hide();
			var soldMachineURL = "";
      
		 var previousURL = '${previousURL}';
		 
		 var oldURL = document.referrer;
	        if(previousURL !== '' && oldURL !== previousURL){
	        	oldURL = previousURL;
	        	$('#previousURL').val(oldURL);
	        }else{
	        	$('#previousURL').val(oldURL);
	        }
	        if(oldURL.indexOf("viewmachine") != -1 || (oldURL.indexOf("machinecatalogwhereused") != -1)){
	        	$("#new-main-menu-list > li:nth-child(3)").addClass("active");
	        	var assemblyUsedId = oldURL.substring(oldURL.lastIndexOf("=") + 1, oldURL.length);
	        	var soldMachineURL = oldURL;

				$(".breadcrumb").empty();
				$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
				$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
					$(".breadcrumb > li:last-child()").after('<li><a href="'+soldMachineURL+'">'+oldURL.substring(oldURL.lastIndexOf("=") + 1, oldURL.length)+'</li>');

				$(".breadcrumb > li:last-child()").after('<li class="active">Shopping Cart</li>');							

	        }
	       
	      //Search bar
		      $("#keyword1").autocomplete({
		    		source : function(request, response) {
		    			var searchString = document.getElementById('keyword1').value;
		    			//NREV-1552 - Added by Pushpa. Reviewed by JK
		    			var escString = "searchString="+escape(searchString)+"&specificOrganization="+"&typeDropDown="+$("#typedropdown").val()
		    			$.ajax({
		    				type : "post",
		    				url : "quicksearchautocomplete?"+escString,
		    				//End of NREV-1552
		    				//data : request.term.toLowerCase(),
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
                       /* var autocomplete = $(".ui-autocomplete");
                       var oldTop = autocomplete.offset().top;
                       var newTop = oldTop - autocomplete.height() - 10;

                       autocomplete.css("bottom", newTop);*/
                       
                        if(width >= 1100){
                            $('.ui-autocomplete').css({'width': 249 + 'px','max-height': 150 + 'px','zIndex':0});  
                        }
                        else if(width >= 900){
                          $('.ui-autocomplete').css({'width': 214 + 'px','max-height': 150 + 'px','zIndex':0});  
                        }
                        else{
                            $('.ui-autocomplete').css({'width': 335 + 'px','max-height': 150 + 'px','zIndex':0});  
                        }
                    },                  
		    		select : function(event, ui) {
		    			$('#keyword1').val(ui.item.label);
                        $(this).prev('a.clear-search').removeClass('hidden');
		    			quickSearch(ui.item.value);
		    			$("#quickSearchDiv").show();
		    			return false;
		    		},
		    		minLength : 2 
		      });
    	$("#myModal").draggable({
            handle: ".modal-header"
        });
    	
    	//Fav Add Call
		 $(document).on("click", ".no-fav-item", function(evt){
			//alert("sadfsadsad");
			var partId = $(this).parent().data('itemid');
			var mediaId = $(this).parent().data('mediaid');
			var organizationId = $(this).parent().data('orgid');
			var quantity = $(this).parent().data('quantity');
			addItemToFavListPage(partId, mediaId, quantity ,organizationId, evt);
			evt.preventDefault();
		 });
		 
		//Fav Del Call
		 $(document).on("click", ".fav-item", function(evt){
			//alert("sadfsadsad");
			var partId = $(this).parent().data('itemid');
			var organizationId = $(this).parent().data('orgid');
			
			var dataItemLst =[];
	    	dataItemLst.push({partId: partId,organizationId: organizationId});
	    	deleteFromFavList(dataItemLst, evt);
	    	evt.preventDefault();
		 });
		
		 $(".no-fav-item").parent().attr("title", "<spring:message code='label.onhover.addtofav' javaScriptEscape='true'/>");
		 $(".fav-item").parent().attr("title", "<spring:message code='label.onhover.removefromfav' javaScriptEscape='true'/>");
		 
		 $("#selectall").click(function () {
	  		  $('.ind-empty-checkbox').prop('checked', this.checked);
	  		  if(this.checked == true){
	  			$("#emptyCartButton").removeClass('emptyCart');
	  			selectAllEmptyCart = 'true';
	  		  }else{
	  			$("#emptyCartButton").addClass('emptyCart');
	  			selectAllEmptyCart = 'false';
	  		  }
	  	});
    });
		
		$("#quickSearchAddCart").click(function(e){
			if($('#quickSearchAddCart').hasClass('not-active')){
				return false;
			}
				e.preventDefault();
	    	   var partId = $(this).parent().find('input[type="hidden"][id="partId"]').text();
	    	   var mediaId = $(this).parent().find('input[type="hidden"][id="mediaId"]').text();
	    	   var organizationId = $(this).parent().find('input[type="hidden"][id="organizationId"]').text();
	    	   var partNumber=$('#pNumber').text();
	    	   ordMult = $(this).parent().find('input[type="hidden"][id="ordermultiple"]').val();
	    	    
	    	   
           $(".cart-popover").find(".cart-popover-img > img").attr('src',"");
           $(".cart-popover").find(".cart-popover-title").html("");
	    	   addItemToCartFromCartPage(partId, mediaId,0,organizationId,partNumber,null,null,null, ordMult);
               $("#quickSearchDiv").css("display","none");
               $('#keyword1').val("");
               $('.clear-search').addClass('hidden');
             //GSP-1154 : Added by Venkatasiva to enable checkbox for Shopping Cart, if cart is empty then you are trying to add item from quick search
               //then Shopping Cart checkbox is disabled. Added below code to enable checkbox.           
               if($(".cart-item-count").text()==0){            	   
            	   $('#selectall').prop('disabled', false);
               }             
               //End
    	  });
		  
		  function addItemToCartFromCartPage(partId, mediaId, quantity,organizationId,partNumber, dataPrice, dataMsrp, dataSavedPrice, ordMult){
			  var dataItemVal = null;
			  $('div.pageLoader').show();
	    		 $.ajax({  
	    	        type : "POST",
	    	        data : {partId: partId,mediaId: mediaId,quantity: quantity,organizationId: organizationId, dataItemVal:dataItemVal, ordMult:ordMult},
	    	        url : "addtocartsearch",
	    	        cache : false,
	    	        success : function(response) {
	
	    	        	var jsonResponse = JSON.parse(response);

	    	         if(response==''){
  	    	        
                    $(".cart-popover").css({"opacity": 1});
  	    	        	 	$(".cart-popover").show().fadeOut(5000);
  	    	        	 	$(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
  								  $(this).css("text-decoration","none");
  							});
							$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ partNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
	    	         }
	    	         else{
	    	        	 	if(typeof jsonResponse.errorMessage=="undefined"){
	    	        	 		getShoppingCartCount();
		    	        	 	getCartItems();
		    	        	 	//getUpsellPart(); //Fix for GS-846
		    	        	    $('div.pageLoader').hide();
	                            $(".cart-popover").css({"opacity": 1});
		    	        	 	$(".cart-popover").show().fadeOut(5000);
		    	        	 	//Rajesh Chinnam : Changed the below line of code to fix GS-1925 on 2015-10-15
		    	        	 	
		    	        	 	if(mediaId != 0)
		    	        	 	{
		    	        	 		$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
		    	        	 		//NREV-1511 fix starts
									if(jsonResponse.isActualImage == false){
									var waterMarkDivPosition;
										$(document).ready(function() {
										    $("#popOverImage").load(function() {
										    	waterMarkDivPosition = $(this).height()-20;
												$(".waterMarkForCartPopOver").show();
												$(".waterMarkForCartPopOver").attr("style",'top:'+waterMarkDivPosition+'px');
										    });
										});
									}
									//NREV-1511 fix ends
		    	        	 		
		    	        	 	}else
		    	        	 	{
		    	        	 		$(".cart-popover").find(".cart-popover-img").children().attr("class","no-image");
		    	        	 	}
								
								$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ partNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
	    	        	 	}
	    	        	 	else{
	    	        	 		$('div.pageLoader').hide();
	    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
	    		    			$("#myModal").show();	
	    	        	 	}
	    	         }
	    	     	$('div.pageLoader').hide();
	    	        },  
	    	        error : function(e) {  
	    	         $('div.pageLoader').hide(); 
	    	        }  
	    	    });
	    	}
     
        
        // get shopping cart items
        function getCartItems(){
        	$('div.pageLoader').show();
	    	$.ajax({  
	            type : "Post",
	            dataType : "json",
	            //contentType: 'application/json;charset=utf-8',
	            mimeType: 'application/json',
	            //Added by Aniket : INC-1801 : Special Character Issue : Reviewed by Hari
	            dataType:"json",
	            url : "getshoppingcart",
	            success : function(response) {  
	            	var locale=${locale};
	            	console.log(locale);
	            	console.log(response);
             		var upsellParts=[];
             		
	         		if(response!=null){
	         			
	         			//taking all part ids to pass upsell methord
	         			for(var i=0;i<response.cartItemList.length;i++){
	         				upsellParts.push(response.cartItemList[i].partId);
			            }
	         			
	         			if(response.cartItemList.length != 0 && response.cartItemList[0].orderMultiple!= null)
	         		    {
	         				ordMult = response.cartItemList[0].orderMultiple;
	         				$('.total-items').val(response.cartItemList[0].quantity);
	         			}
	         			<!-- Added by Venkatasiva to hide selectall checkbox if cart is empty-->
	         			$("#selectall").hide();
	         			$("#emptyCartButton").hide();
	         			//console.log("response.cartItemList.length : "+response.cartItemList.length);
    	         		if(response.cartItemList.length > 0 ){
    	         			$("#emptyCartButton").show();
    	         			$("#selectall").show();
    	         		}
    	         		//Venkatasiva End
	         			$("#cart-items-hldr").html('');
	         			console.log(response.cartItemList);
		             	$("#shoppingCartTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
		             	
		             	orderMultipleOrgFlag=response.orderMultipleOrgFlags;
		             	// Since is.consignment.order.required flag is not related to order multiple
		              for(key in response.orderMultipleOrgFlags){
		             		if(response.orderMultipleOrgFlags[key]=='TRUE' || response.orderMultipleOrgFlags[key]=='true')
		             	    	$(".order-multiples-lbl[data-orgId='"+key+"']").show();
		             	    else
		             	    	$(".order-multiples-lbl[data-orgId='"+key+"']").hide();  	
		             	}
						
                   		checkAlertMessage();
		             	$(".cart-item-count").text(response.cartItemList.length);		             	
		             	
		             	if(response.cartItemList.length == 0){
		             		$("#emptyCartButton").addClass('emptyCart');
		             		$("#selectall").prop("disabled", "disabled");
		             	}

		               	$("#currencyContainer").html('');

		             	$("#currencyTemplate").tmpl(response.cartCurrencyVO).appendTo("#currencyContainer");
		             	
		             	$("#upsellContainer").html('');
			               
		               	console.log(response.cartCurrencyVO);
		               	
		               	if(upsellParts.length>0)
		               		getUpsellPart(upsellParts);
	         		}
	         		else{
	         			$(".cart-item-count").text(0);
	         			$("#selectall").prop("disabled", "disabled");
	         			
	         		}
	         		//fix for OM-1514: Place order leading 405 error. Added by Pooja.H.S
	         		$("#btn-place-order-frm-cart").removeClass('disabled');
	         		$("#btn-create-quote-frm-cart").removeClass('disabled');
	         		//OM-1514 end
	         		$(".no-fav-item").parent().attr("title", "<spring:message code='label.onhover.addtofav' javaScriptEscape='true'/>");
		 			$(".fav-item").parent().attr("title", "<spring:message code='label.onhover.removefromfav' javaScriptEscape='true'/>");
	               	$('div.pageLoader').hide();
	            },  
	            error : function(e) {  
	            	//fix for OM-1514: Place order leading 405 error. Added by Pooja.H.S
	             $("#btn-place-order-frm-cart").removeClass('disabled');
	             $("#btn-create-quote-frm-cart").removeClass('disabled');
	         	//OM-1514 end
	             $('div.pageLoader').hide(); 
	             <!-- Added by Venkatasiva to hide selectall checkbox if cart is empty-->
      			$("#selectall").hide();
      			$("#emptyCartButton").hide();      			
	         	//Venkatasiva End
	            }  
           });
	    }
		
		function getUpsellPart(upsellParts){
			$('div.pageLoader').show(); 
			$.ajax({  
	              type : "get",
	              contentType: 'application/json;charset=utf-8',
	              mimeType: 'application/json',
	             //Added by Aniket : INC-1801 : Special Character Issue : Reviewed by Hari
	              dataType:"json",
	              url : "getupsellparts",
	              data : "upsellParts=" + upsellParts,
	              success : function(response) {
	               $("#upsellContainer").html('');
	               if(response!=null){
	            	   for(var i=0;i<response.length;i++){
		            	   $("#upsellTemplate").tmpl(response[i].upsellPartVOList).appendTo("#upsellContainer");
		               }
	            	   $('.upsell-frame').show(); // FIX for GS-846

                    var container = $('.view-other-products.upsell-frame');
                    var content = $('.upsell-item');
                    var promotionNumber = content.size();
	               }if(response==null||response.length==0){
	            	   $('.upsell-frame').hide();
	               }
	               valueHideOrShow = ${hideOrShowFields};
	      	       if (valueHideOrShow["show.order.multiples"] == "TRUE")
	      	       { 
	      	    	 $(".order-multiples-lbl").show();
	      	       }
	      	       else
	      	       {
	      	    	 $(".order-multiples-lbl").hide();
	      	       }
	               
	              },  
	              error : function(e) {    
	            	 // alert(e);
	              }  
	             });
			$('div.pageLoader').hide(); 
	    }

        
        // delete individual cart item
        function deleteCartItem(cartItemId, organizationId, e){
        	$('div.pageLoader').show();
	        $.ajax({
	          type : "Get",
	          data : {cartItemId: cartItemId,organizationId: organizationId},
	          contentType: 'application/json;charset=utf-8',
	          mimeType: 'application/json',
	        //Added by Aniket : INC-1801 : Special Character Issue : Reviewed by Hari
	          dataType:"json",
	          url : "deletecartitem",
	          cache : false,
	          success : function(response) {
	        	  var locale=${locale};
	        	  console.log(response);
	        	  getShoppingCartCount();
	        	  var upsellParts=[];
	        	  
	        	  if(response.cartItemList.length>0){
	        	  	for(var i=0;i<response.cartItemList.length;i++){
       					upsellParts.push(response.cartItemList[i].partId);
		          	}
	        	  }
	        	  if(response.cartItemList.length==0){
	        		  	upsellParts=cartItemId;
	        	  }
	        	  
	        	  getUpsellPart(upsellParts);
	        	  
	               	$("#currencyContainer").html('');
	             	$("#currencyTemplate").tmpl(response.cartCurrencyVO).appendTo("#currencyContainer");
	               	console.log(response.cartCurrencyVO);

	                $("#cart-items-hldr").html('');
	             	$("#shoppingCartTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
             	
                	checkAlertMessage();
	             	console.log(response.cartItemList.length);
 	             	$(".cart-item-count").text(response.cartItemList.length);
                  	$('div.pageLoader').hide();
					
                  	
	          },  
	          error : function(e) {  
	        	  $('div.pageLoader').hide();
	          }  
	        });
	        e.preventDefault();
	      }
	    
        // change quantity
	    function QuantityChange(quantity, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM, ordMult){
        	console.log(dataPrice+".."+dataMsrp+".."+dataSavedPrice);
	    	$('div.pageLoader').show();
	        $.ajax({  
	          type : "Get",
	          data : {quantity : quantity, cartItemId : cartItemId, partId : partId, organizationId:organizationId, dataPrice:dataPrice, dataMsrp:dataMsrp, dataSavedPrice:dataSavedPrice, dataCurrency : dataCurrency, dataUOM : dataUOM, ordMult: ordMult},
	          contentType: 'application/json;charset=utf-8',
	          mimeType: 'application/json',
		  //Added by Aniket : INC-1801 : Special Character Issue : Reviewed by Hari
	          dataType:"json",
	          url : "cartitemquantitychange",
	          cache : false,
	          success : function(response) {
	        	  var locale=${locale};
	              console.log(response);
	              	if(response.cartItem.priceMSRPStr !="-1"){
	              		$(".cartItemMsrp[data-cartItem='"+response.cartItem.cartItemId+"']").html(response.cartItem.priceMSRPStr + " " + (typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
	              	}else{
	              		$(".cartItemMsrp[data-cartItem='"+response.cartItem.cartItemId+"']").html("");
	              	}

	            	  if(response.cartItem.priceStr !="-1"){
	            		  $(".cartItemYourPrice[data-cartItem='"+response.cartItem.cartItemId+"']").html(response.cartItem.priceStr + " " + (typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
	            	  }else{
	            		  $(".cartItemYourPrice[data-cartItem='"+response.cartItem.cartItemId+"']").html("");
	            	  }
	            	  
					  if(response.cartItem.savedPriceStr!="-1"){
						  $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.cartItemId+"']").html(response.cartItem.savedPriceStr+" "+ (typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));
	            	  }else{
	            		  $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.cartItemId+"']").html("");
	            	  }
	            	  
					  if(response.cartItem.itemTotalAmountStr !="-1"){
						  $(".cartItemTotal[data-cartItem='"+response.cartItem.cartItemId+"']").html(response.cartItem.itemTotalAmountStr+" "+(typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
			              $(".cartItemTotal[data-cartItem='"+response.cartItem.cartItemId+"']").parents('.pricebox').find('input.alertFlagInput').val(response.cartItem.itemTotalAmountStr);
			              checkAlertMessage();
					  }else if(response.cartItem.itemTotalMSRPStr!="-1" ){
	            		  	$(".cartItemTotal[data-cartItem='"+response.cartItem.cartItemId+"']").html(response.cartItem.itemTotalMSRPStr+" "+(typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
                    		$(".cartItemTotal[data-cartItem='"+response.cartItem.cartItemId+"']").parents('.pricebox').find('input.alertFlagInput').val(response.cartItem.itemTotalMSRPStr);
                        	checkAlertMessage();
	            	  }else{
						  $(".cartItemTotal[data-cartItem='"+response.cartItem.cartItemId+"']").html(" - ");
			              $(".cartItemTotal[data-cartItem='"+response.cartItem.cartItemId+"']").parents('.pricebox').find('input.alertFlagInput').val("-1");
			              if(!$('p.alert-message').is(':visible')){
			                  $('p.alert-message').show();
			              }
					  }
					
					  if(response.cartItem.inventoryMessage != ''){
							//$('.b-label').find('div > strong').text(response.cartItem.inventoryMessage); --- Dibu's fix Support-MIL-236-170216
						  $(".b-label[data-cartItem='"+response.cartItem.cartItemId+"']").find('div > strong').text(response.cartItem.inventoryMessage);
						}
	             	
	             	$(".cart-item-count").text(response.shoppingCart.cartItemList.length);
	             
	               	$("#currencyContainer").html('');
	             	$("#currencyTemplate").tmpl(response.shoppingCart.cartCurrencyVO).appendTo("#currencyContainer");
	               	console.log(response.shoppingCart.cartCurrencyVO);
                  
	               	$('div.pageLoader').hide();
	          },  
	          error : function(e) {  
	        	  $('div.pageLoader').hide();  
	          }  
	        });
	      }
	    
        // increase the quantity
	    $(document).delegate('.plus-click','click', function(e){
          
	    	 var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
         if(parseInt(itemVal)>999){
            $(this).parents('.spinner-control').children('.total-items').val("999");
            return false;
          }
	    	 $(this).parents('.spinner-control').children('.hiddenQty').val(itemVal);
	         var cartItemId = $(this).parents('.spinner-control').attr('id');
	         var partId = $(this).parents('.spinner-control').children('.total-items').attr('id');
	         var organizationId = $(this).parents('.spinner-control').attr('data-orgId');
	         var dataPrice = $(this).parents('.spinner-control').attr('data-priceval');
	         var dataMsrp = $(this).parents('.spinner-control').attr('data-msrpval');
	         var dataSavedPrice = $(this).parents('.spinner-control').attr('data-savepriceval');
	         var dataCurrency = $(this).parents('.spinner-control').attr('data-currencyval');
	         var dataUOM = $(this).parents('.spinner-control').attr('data-uomval');
	         var ordMult = $(this).parents('.spinner-control').attr('data-ordermultiplekey');

	         itemVal = getOrderMultiplesForQuantity(itemVal, partId, ordMult);
	         
	         QuantityChange(itemVal, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM, ordMult);
	      });
	     
        // decrease the quantity
	      $(document).delegate('.minus-click','click', function(){
	    	  var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	    	  var itemValOld = $(this).parents('.spinner-control').children('.hiddenQty').val();
	    	  $(this).parents('.spinner-control').children('.hiddenQty').val(itemVal);
	          var cartItemId = $(this).parents('.spinner-control').attr('id');
	          var partId = $(this).parents('.spinner-control').children('.total-items').attr('id');
	          var organizationId = $(this).parents('.spinner-control').attr('data-orgId');
	          var dataPrice = $(this).parents('.spinner-control').attr('data-priceval');
		      var dataMsrp = $(this).parents('.spinner-control').attr('data-msrpval');
		      var dataSavedPrice = $(this).parents('.spinner-control').attr('data-savepriceval');
		      var dataCurrency = $(this).parents('.spinner-control').attr('data-currencyval');
		      var dataUOM = $(this).parents('.spinner-control').attr('data-uomval');
		      var ordMult = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
	          var returnVal=validateQty(itemVal);
	          
	          if(itemValOld==1){
	        	  return false;
	          }
	          
	          itemVal = getOrderMultiplesForQuantity(itemVal, partId, ordMult);
	          
	          if(!returnVal){
	        	  QuantityChange(1, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM, ordMult);
	          }else{
	        	  QuantityChange(itemVal, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM, ordMult);
	          }
	      }); 
	    
        // direct change of quantity
	      $(document).delegate('.total-items.output','change', function(){
	    	  var itemVal = $(this).parents('.spinner-control').children('.total-items.output').val();
	    	  
	    	  $(this).parents('.spinner-control').children('.hiddenQty').val(itemVal);
	          var cartItemId = $(this).parents('.spinner-control').attr('id');
	          var partId = $(this).parents('.spinner-control').children('.total-items.output').attr('id');
	          var organizationId = $(this).parents('.spinner-control').attr('data-orgId');
	          var dataPrice = $(this).parents('.spinner-control').attr('data-priceval');
		      var dataMsrp = $(this).parents('.spinner-control').attr('data-msrpval');
		      var dataSavedPrice = $(this).parents('.spinner-control').attr('data-savepriceval');
		      var dataCurrency = $(this).parents('.spinner-control').attr('data-currencyval');
		      var dataUOM = $(this).parents('.spinner-control').attr('data-uomval');
		      var ordMult = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
		      	      
	          var returnVal=validateQty(itemVal);
              
	          itemVal = getOrderMultiplesForQuantity(itemVal, partId, ordMult);
	          
	          if(!returnVal){
	        	  QuantityChange(1, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM, ordMult);
                   $(this).val(1);
                   $(this).parents('.spinner-control').children('.hiddenQty').val(1);
	          }else{
	        	  QuantityChange(itemVal, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM, ordMult);
	          }
              
   	  });
        
	      // Upsell quantity change
	      $(document).delegate('.total-items.upsellQty','change', function(){
	    	  var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	          var upsellPartId = $(this).parents('.spinner-control').children('.total-items').attr('id');
	          var returnVal=validateQty(itemVal);
	          if(!returnVal)
	             document.getElementById(upsellPartId).value='1';
   	  });
        
	      function quickSearch(searchString){
	    	  var locale=${locale};
	    	  var displayLegacyPart = '${properties['display.legacy.part']}';
	    	  $.ajax({  
	              type : "Get",
	              contentType : 'application/json;charset=ISO-8859-1',
	              mimeType : 'application/json;charset=ISO-8859-1',
	              url : "searchonparts",
	              data : {
	            	    searchString : searchString,
	            	    specificOrganization : null,
					},
	              success : function(response) {  
	               console.log(response[1]);
	               var commDesc="",enggDesc="",orderMultiple="";
	               
						commDesc = response[1].source.commDesc;
						enggDesc = response[1].source.enggDesc;
						 orderMultiple = response[1].source.orderMultiple;
	   	            	   
		            	   if(orderMultiple ==null || orderMultiple == "")
		            	  {
		            		   orderMultiple = defaultPartOrderMultiple;
		            	  }
		            	   
		            	   document.getElementById('ordermultiple').value = orderMultiple;
	               if(response[1].source.mediaId!=0){
	            	   $("#quickSearchImg").show();
	            	   $("#quickSearchImg").attr("src","${properties['docserver.url']}?media="+response[1].source.mediaId+"&thumbnail=true&user="+userid+"&token="+authtoken);
	            	 	//NREV-1486 fix starts
		           		if(!response[1].source.isActualImage){
		           			$("#waterMarkText").show();
		           		}
		           		//NREV-1486 fix ends
	               }
	               else{
	            	   $("#quickSearchImg").hide();
	            	 	//NREV-1486 fix starts
	           	   	   $("#waterMarkText").hide();
	           	  		//NREV-1486 fix ends
	               }
	            	
	               var hasPriceAccess = response[1].hasPriceAccess;
	               if((response[1].source.orderable=="false") || (hasPriceAccess == "false")){
	            	   $("#quickSearchAddCart").addClass('not-active');
	               }
	               else{
	            	   $("#quickSearchAddCart").removeClass('not-active');
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
	               $("#orgName").text(response[1].source.organizationName + " Part");
	               $("#partId").text(response[1].source.partId);
	               $("#mediaId").text(response[1].source.mediaId);
	               $("#organizationId").text(response[1].source.organizationId);
	               document.getElementById('ordermultiple').value = orderMultiple;
	               $("#enggDesc").text(enggDesc);
	               $("#imageDesc").text(commDesc);
	               
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
		  
		  $(document).delegate('.upsellAdd','click', function(e){
			  e.preventDefault();
	    	  var partId = $(this).parent().find('input[type="hidden"][id="partId"]').val();
	    	  var mediaId = $(this).parent().find('input[type="hidden"][id="mediaId"]').val();
	    	  var quantity = $(this).parent().find('.total-items').val();
	    	  var partNumber = $(this).parent().find('input[type="hidden"][id="partNum"]').val();
	    	  var ordMult = $(this).parent().find('input[type="hidden"][id="partOrderMultiple"]').val();
	    	  addItemToCartFromCartPage(partId, mediaId,quantity,"upsell",partNumber,null,null,null,ordMult);
    	  });
		  <!-- Edited by Pujith for GPD-10. Reviewed by Krupa  -->
	      function quoteOrder(e,redirectUrl){
	    	  cartItemCount = $(".cart-item-count").text();
	    	  if(cartItemCount>0){
	    		  e.preventDefault();
	    		var msg="<spring:message code='label.prompt.login' javaScriptEscape='true'/>";
		    	 $('.modal-body').text(msg);
	    		  	displayPrompt(redirectUrl);

	    	  }
	    	  else{
	    		  var msg = "<spring:message code='alert.cart.empty' javaScriptEscape='true'/>";
	    		  $('.modal-body').text(msg)
	  			  $("#myModal").show();
	    		  return false;
	    	  }
	    		  
		  }
	      
	      $(".custom-close").click(function(){
			   $("#myModal").hide();
			});
	      
	      $('.continue_shopping').on('click', function(e){
	    	  e.preventDefault();
	    	  window.location.href = 'shopforparts';
	      })
	      $(".quicksearch-img").on('click',function(){
	    	  fullItemRedirect($('#partId').text(),$('#organizationId').text())
			});
	    
	       
	      function validateQty(itemQty){
	    	  if(itemQty==""){
	    		    var msg = "<spring:message code='alert.cart.enter.qty' javaScriptEscape='true'/>";
	    			$('.modal-body').text(msg);
	    			$("#myModal").show();
	    			return false;
	    		}
	    		else if(itemQty<=0){
	    			return false;
	    		}else if(validateSpecialCharacterAndAlphanumeric(itemQty) == true){
	    			return false;
	    		}else
	    			return true;
		  }

      function checkAlertMessage(){
        var showMessage = false;
        $('#cart-items-hldr .cart-details').each(function(){
          var flags = $(this).find('input.alertFlagInput');
          if($(flags[0]).val()== "-1" && $(flags[1]).val()== "-1"){
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
      
     
      function indCheckBox(cartItemId, organizationId, e){
 		 if($(".ind-empty-checkbox").length == $(".ind-empty-checkbox:checked").length) {
 			//Venkatasiva : Some times select all checkbox is not working if you select all individuals checkboxes that's why chenaged 'this.changed' to 'true'
	  			$("#selectall").prop('checked', true);
	  			selectAllEmptyCart = 'true';
	  		} else {
	  			$("#selectall").removeAttr("checked");
	  			selectAllEmptyCart = 'false';
	  		}
 		 if($(".ind-empty-checkbox:checked").length != 0){
 			$("#emptyCartButton").removeClass('emptyCart');
 		 }else if($(".ind-empty-checkbox:checked").length == 0){
 			$("#emptyCartButton").addClass('emptyCart'); 
 		 }
 	 }
      
      function emptyCartDelete(){    	  
    	  if(selectAllEmptyCart == 'true' ){
    		  var msg = "<spring:message code='empty.cart.confirm.selectAll' javaScriptEscape='true'/>";
    		  $('.modal-body').text(msg)
    			  $("#emptyCartConfirmationWindow").show();
    	  }else if($(".ind-empty-checkbox:checked").length > 1){	
    		  var msg = "<spring:message code='empty.cart.confirm' javaScriptEscape='true'/>";
    		  $('.modal-body').text(msg)
    			  $("#emptyCartConfirmationWindow").show();
    	  }else{
    		  emptyCart();
    	  }
    	  $('.modal-footer a:first-child').focus();
  	 }
     
      $("#emptyCartConfirmationWindow .cancel").click(function(){
  		$("#emptyCartConfirmationWindow").hide();
  		return false;
		});
      
      $("#emptyCartConfirmationWindow .ok").click(function(){
    	  $("#emptyCartConfirmationWindow").hide();
    	 emptyCart();
      });
      
      function emptyCart(){
		  var someObj=[];
    	  
    	  var inputElements = document.getElementsByClassName('ind-empty-checkbox');
    	  for(var i=0; inputElements[i]; ++i){
    	        if(inputElements[i].checked){
    	             checkedValue = inputElements[i].id;
    	             someObj.push({
     		        	'cartItemId' : checkedValue.split("_")[0],
     		        	'organizationId' : checkedValue.split("_")[1],
     		    	});
    	            
    	        }
    	  }
    	  
    	  var formdatastr;
    	  $('div.pageLoader').show();
    	  $.ajax({
    		  
	          type : "POST",
	          data : { formdatastr : JSON.stringify(someObj), 
	        	  selectAllEmptyCart : selectAllEmptyCart},
		      mimeType: 'application/json',
	          url : "deletecartitemForEmptyCart",
	          
	          success : function(response) {
	        	  var locale=${locale};
	        	  console.log(response);
	        	  getShoppingCartCount();
	        	  var upsellParts=[];
	        	  
	        	  <!-- Added by Venkatasiva to hide selectall checkbox if cart is empty-->
	       			$("#selectall").hide();
	       			$("#emptyCartButton").hide();
		         	if(response.cartItemList.length > 0 ){
		         		$("#emptyCartButton").show();
		         		$("#selectall").show();
		         	}
		         	//Venkatasiva End
	        	  if(response.cartItemList.length==0){
	        			  $("#upsellContainer").html('');
	        			  $('.upsell-frame').hide();
	        			  $("#emptyCartButton").addClass('emptyCart');
		             	  $("#selectall").prop("disabled", "disabled");
	        	  } 
	        	  
	        	  $("#selectall").removeAttr("checked");
	        	  $("#emptyCartButton").addClass('emptyCart'); 
	        	  	               	
	              $("#currencyContainer").html('');
	              $("#currencyTemplate").tmpl(response.cartCurrencyVO).appendTo("#currencyContainer");
	              console.log(response.cartCurrencyVO);

	              $("#cart-items-hldr").html('');
	              $("#shoppingCartTemplate").tmpl(response.cartItemList).appendTo("#cart-items-hldr");
             	
                  checkAlertMessage();
                  
                  if(response.cartItemList.length>0){
  	        	  	for(var i=0;i<response.cartItemList.length;i++){
         					upsellParts.push(response.cartItemList[i].partId);
  		          	}
  	        	  }
  	        	  getUpsellPart(upsellParts);
                  
	              console.log(response.cartItemList.length);
 	              $(".cart-item-count").text(response.cartItemList.length);
                  $('div.pageLoader').hide();
					
                  	
	          },  
	          error : function(e) {  
	        	  $('div.pageLoader').hide();
	          }  
	        });
    	  
      }
      
      
    </script>
</body>

</html>
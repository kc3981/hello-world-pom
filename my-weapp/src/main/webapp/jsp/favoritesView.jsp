<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<jsp:include page="googleAnalytics.jsp" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<!-- CSS -->
<!-- build:css ../assets/globalstyles.min.css -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>
<link rel="stylesheet" href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-responsive.css?version=${properties['application.version']}">
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
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/apple-touch-icon-57-precomposed.png">

<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script src="../js/jquery.bootpag.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<script src="../js/errorHandler.js?version=${properties['application.version']}" type="text/javascript"></script>
<style type="text/css">
#ui-id-1 {
	position: absolute;
	z-index: 999 !important
}

#ui-id-2 {
	position: fixed;
}
/*
		.favparts-hldr input.keyword{
			height: 34px;
		}
		.favparts-hldr.quick-search-hldr{
			padding: 1px;
		}
		.quick-search-hldr.favparts-hldr{
			position: absolute;
		    z-index: 999;
		    width: 95%;
		}
		*/
input[type=checkbox].chk-fav-items, input[type=checkbox].chk-favallitems
	{
	/* height: 20px; */
	margin: 0;
	width: 20px;
}

.mleft10 {
	margin-left: 10px;
}

.imageAnchor:focus img {
	border: 2px solid blue;
}

@media ( min-width : 300px) and (max-width: 767px) {
	.delete-item{
		top: 33px;
   		padding: 0 5px 0 0;
	}
}
	

@media ( min-width :768px) {
	.delete-item {
		top: -2px;
		padding: 0 2px 0 0;
	}
}


/* .col-lg-1.delete-item-parent {
	padding: 0;
	width: 5%;
} */

/* .col-lg-3.pricebox, .col-lg-3.div-part {
	width: 28%;
} */

.price_cart_R {
	padding: 1px 5px 2px 5px;
}

.item_check, .pl-lg-15 {
	padding-left: 15px;
}

.emptyCart {
	color: black;
	pointer-events: none;
	cursor: default;
}

@media ( min-width : 300px) and (max-width: 767px) {
.xs_pos{
	    position: absolute;
    right: 4px;
}
}

@media ( min-width : 768px) {
.xs_pos{
	    position: absolute;
    right: 39px;
}
}

.item_check, .pl-lg-15 {
	padding-left: 15px;
}

</style>
</head>

<body>
<%@ include file="googleAnalyticsbody.jsp" %>
 	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>

			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class="active"><spring:message
							code="label.header.favorites" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper m-t-sm-17 m-t-lg-48">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<h3 class="responsive-padding page-heading  pl-lg-15">
						<label  for="chkfavallitems"> <input
							id="chkfavallitems" class="chk-favallitems" type="checkbox"
							title="Select All" /> <!-- <span class="mleft10"></span> -->
						</label>
						<spring:message code="label.header.favorites" />
						&nbsp; (<span id="allResult"></span>)
						<!-- GSP-1187 : Venkatasiva changed for IE11 Issue, added separate <i class > for icon and added onClick -->
						<span id="btn-addFavItemstoCart" title="<spring:message code="lable.item.addToCart" />"
							class="shopping-cart emptyCart" disabled onClick="addItemToCart()">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i>
						</span>						
						<span id="btn-deleteFavItemsfrmLst" 
							title="<spring:message code="label.onhover.removefromfav"/>"
							class="delete-item_new emptyCart" disabled onClick="deleteItemFromCart()">
							<i class="fa fa-trash-o" aria-hidden="true"></i>
						</span>
						<!-- GSP-1187 End -->
					</h3>
				</div>
				<div class="row my-favactionbtn-hldr">
					<div class="col-sm-2"></div>
				</div>
				<div class="row">
					<div class="col-sm-9 col-xs-12">
						<div class="text-center hidden-xs" id="page-selection-top"
							style="text-align: right;"></div>
						<div class="col-sm-12 text-center" id="page-selection-top-xs"></div>
					</div>
				</div>

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings parent-cart-items">
					<div id="cart-items-hldr"
						class="result-container col-lg-9 col-md-9 col-sm-12 col-xs-12 responsive-padding nopadding">
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 get-quote">

						<div
							class="col-lg-12 col-md-12 col-sm-6 col-xs-12 column-paddings quick-search-popover">
							<div class="quick-search-hldr favparts-hldr">
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
											<a href="javascript:void(0);" class="quicksearch-img"><img
												id="quickSearchImg" src=""></a>
										</div>
									</div>
									<div class="row cart-item">
										<div class="col-md-12 cartitemdetails">
											<h4>
												<a href="javascript:void(0);" class="quicksearch-img"><spring:message
														code="quick.search.item" /> <span id="pNumber"></span></a>
											</h4>
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
												type="hidden" id="partNumber"><input type="hidden"
												id="ordermultiple" />
											<sec:authorize access="hasRole('ROLE_CART')">
												<button class="btn btn-addtocart cart-small"
													id="quickSearchAdd">
													<spring:message code="lable.addtolist" />
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
					<div id="upsellContainer"style="display:inline-block;">
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
							<p class="dialog-content">
								<spring:message code="label.myFav.delete.confirm"></spring:message>
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" data-dismiss="modal"
								href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a id="btnOkAction"
								class="col btn ok" data-dismiss="modal"
								href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>

			<!-- footer container -->
			<footer>
				<%@ include file="footer.jsp"%>
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
		src="//ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" 
		type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/gensuite-ui.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/custom.scripts.js?version=${properties['application.version']}"  type="text/javascript"></script>
	<script id="shoppingCartTemplate" type="text/x-jquery-tmpl">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details">
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 item_check nopadding prd_cart_checkbox">
							{{if isOrderable == true}}
								<input class="ind-empty-checkbox cart-checkbox chk-fav-items" name="chkFavItems[]" type="checkbox" value="" data-favctid="${'${'}favoritesCartItemId}" data-partid="${'${'}partId}" data-orgid="${'${'}organizationId}" data-mediaid="${'${'}mediaId}" title="Select" />
							{{/if}} 
						</div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 xs_img_center sm_lm_-50">
							 {{if mediaId!=0}}
                              <a href="javascript:void(0)" onclick="fullItemRedirect(${'${'}partId}, ${'${'}organizationId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img"></a>
                             {{else}}
									 <a href="javascript:void(0);" class="no-image" onclick="fullItemRedirect(${'${'}partId}, ${'${'}organizationId})"><p></p></a>
							 {{/if}}
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding-left">
                            <h4>
								<a href="javascript:void(0)" onclick="fullItemRedirect(${'${'}partId}, ${'${'}organizationId})"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a>
							</h4>
							<c:if test="${properties['display.legacy.part']}">
								<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div>
							 </c:if>
                            <div><strong>${'${'}partCommercialDescription}</strong></div>
							<sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
								<div>${'${'}partEngineeringDescription}</div>
							</sec:authorize>
                         	<div class="b-label" data-cartItem="${'${'}favoritesCartItemId}" ><!--  Support-MIL-236-170216 <div class="b-label">-->
                                <c:if test="${properties['display.organizationName']}">
									<div>${'${'}organizationName} Part</div>
								</c:if>
								<p class="order-multiples-lbl" data-orgId="${'${'}organizationId}"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>${'${'}orderMultiple}</p>
                                <!-- <div><strong>${'${'}availableQuantity} In Stock</strong></div> -->
								{{if organizationId != 1}}
									     <div><strong>${'${'}inventoryMessage}</strong></div>
								    {{else}}
									    {{if inventoryMessage.substring(0, 10)=="0 In Stock" }}
										      <div><strong>0 In Stock, Please call 855-737-8835</strong></div>
                                        {{else}}
										      <div><strong>${'${'}inventoryMessage}</strong></div>
							     	    {{/if}}	
					        	 {{/if}}
                            </div>
                        </div>
                        

                  		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pricebox nopadding  xs_img_center pt-xs-10">

                          <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalAmountStr}" />
						  <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalMSRPStr}" />
							{{if priceMSRPStr !== "-1" && priceMSRPStr !==priceStr}}
								<div class="price_cart_R">
									<spring:message code="label.msrp"/>: 
										<span data-cartItem="${'${'}favoritesCartItemId}" class="cartItemMsrp"> 
											${'${'}priceMSRPStr} ${'${'}currencyCode}
										</span>
								</div>
							{{/if}}
							{{if priceStr !== "-1"}}
                       			<div class="price_cart_R">
									<spring:message code="label.your.price"/>: 
										<span data-cartItem="${'${'}favoritesCartItemId}" class="cartItemYourPrice">
											${'${'}priceStr} ${'${'}currencyCode}
										</span>
								</div>
							{{/if}}
							{{if savedPriceStr !== "-1" && priceMSRPStr !==priceStr}}
								<div class="blueColor xs_img_center price_cart_R">
									<spring:message code="label.you.save"/>: 
										<span data-cartItem="${'${'}favoritesCartItemId}" class="cartItemSavedPrice"> 
											${'${'}savedPriceStr} ${'${'}currencyCode}
										</span> 
										<spring:message code="lable.item.each" />
								</div>
							{{/if}}

							{{if itemTotalAmountStr !== "-1"}} 
                  			<div class="item-total">
								<strong><spring:message code="label.item.total"/>: 
									<span data-cartItem="${'${'}favoritesCartItemId}" class="cartItemTotal logged-in">
                        				${'${'}itemTotalAmountStr} ${'${'}currencyCode}
                    				</span> 
								</strong>
							</div>
							{{/if}}

							{{if (itemTotalMSRPStr !== "-1") && itemTotalAmountStr == "-1"}}
							<div class="item-total" style="margin-top:0;">
								<strong><spring:message code="label.item.total"/>:
									<span data-cartItem="${'${'}favoritesCartItemId}" class="cartItemTotal guest"> 
                      					${'${'}itemTotalMSRPStr} ${'${'}currencyCode}
                  					</span> 
								</strong>
							</div>
							{{/if}}
							
                        </div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 qty-hldr nopadding text-center">

                            <c:choose>
                            <c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
                                <div class="spinner-control" style="margin-top:0" data-ordermultiplekey="${'${'}orderMultiple}" id="${'${'}favoritesCartItemId}" data-orgId="${'${'}organizationId}" data-priceval="${'${'}price}" data-msrpval="${'${'}priceMSRP}" data-savepriceval="${'${'}savedPrice}" data-currencyval="${'${'}currencyCode}" data-uomval="${'${'}uom}">
                              <input type="text" id="${'${'}partId}" class="total-items output" maxlength="3" value="${'${'}quantity}" style="width:40px;text-align:center;">  
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
                                <div class="spinner-control" id="${'${'}favoritesCartItemId}" data-ordermultiplekey="${'${'}orderMultiple}" data-orgId="${'${'}organizationId}" data-priceval="${'${'}price}" data-msrpval="${'${'}priceMSRP}" data-savepriceval="${'${'}savedPrice}" data-currencyval="${'${'}currencyCode}" data-uomval="${'${'}uom}">
                              <input type="text" id="${'${'}partId}" class="total-items output" value="${'${'}quantity}" style="width:40px;text-align:center;">
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
					
                    </div>
                    <div class="spinner-control">
                      <input type="text" class="total-items output" value="1" maxlength="3" style="width:30px;text-align:center">  
                      <div class="qty">  
                        <a href="javascript:void(0);" class="item-increment">
                            <i class="fa fa-caret-up"></i>
                          </a>
                          <a href="javascript:void(0);" class="item-decrement">
                            <i class="fa fa-caret-down"></i>
                          </a>
                      </div> 
                      <span class="unit upsell-unit" style="bottom:60px;left:110px;">${'${'}uom}</span> 
                    </div>
                    <sec:authorize access="hasRole('ROLE_CART')">
            					<input type="hidden" id="partId" value="${'${'}upsellPartId}"/> 
                                <input type="hidden" id="mediaId" value="${'${'}mediaId}">
                                <input type="hidden" id="partNum" value="${'${'}upsellPartNumber}">
            					<input type="hidden" id="data" value="${'${'}upsellPartNumber}">
            					<input type="hidden" id="partNum" value="${'${'}upsellPartNumber}">
            					<input type="hidden" id="partNum" value="${'${'}upsellPartNumber}">
            					{{if isOrderable && hasPriceAccess}}
                                	<button class="btn btn-addtocart cart-small upsellAdd"><spring:message code="quick.search.addtocart"/></button>
            					{{else}}
            						<button class="btn btn-addtocart cart-small not-active upsellAdd"><spring:message code="quick.search.addtocart"/></button>
            					{{/if}}
                    </sec:authorize>
                </div>
	 </script>

	<script id="currencyTemplate" type="text/x-jquery-tmpl">
	 	<div class="quantityprice">
                <p>${'${'}organizationName} <spring:message code="label.items"/>: <strong><span>${'${'}itemCount}</span></strong></p>
				{{if totalMSRPStr!=="-1"}} 
                	<p><spring:message code="label.total.list"/>: <span class="msrp-price">${'${'}totalMSRPStr} ${'${'}CurrencyCode}</span></p>
				{{/if}}
				{{if totalAmountStr!=="-1"}}
					<p> <spring:message code="label.total.price"/>: <strong class="price-total">${'${'}totalAmountStr} ${'${'}CurrencyCode}</strong></p>
				{{/if}}
				{{if savePriceStr!=="-1"}} 
                	<div class="blueColor"><spring:message code="label.total.save"/>: <span class="save-price">${'${'}savePriceStr} ${'${'}CurrencyCode}</span></div>
				{{/if}}
       </div>
	 </script>

	<!-- Spinner Control -->
	<script type="text/javascript">
    var  myErrObj = new errnsp.errHandling.init();
    var userid,authtoken;
    var pageNumber=1;
	var counter=1;
	
    $(document).ready(function(e){
    	userid=$('#userId').val();
		authtoken = $('#authToken').val();
		partsPerPage = 10;
    	getFavListItems();
    	//getCartItems();
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
	        	$("#main-menu-list > li:nth-child(5)").addClass("active");
	        	var assemblyUsedId = oldURL.substring(oldURL.lastIndexOf("=") + 1, oldURL.length);
	        	var soldMachineURL = oldURL;
	        	var parseQueryString = function() {
       		    var str = oldURL;
       		    var objURL = {};

	        		    str.replace(
	        		        new RegExp( "([^?=&]+)(=([^&]*))?", "g" ),
	        		        function( $0, $1, $2, $3 ){
	        		            objURL[ $1 ] = $3;
	        		        }
	        		    );
	        		    return objURL;
	        		};
	        		
	        	var params = parseQueryString();
	        	var assemblyNumber = params["assemblyNumber"].split('?',1).toString().replace("%20", " ");
				$(".breadcrumb").empty();
				$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
				$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
				$(".breadcrumb > li:last-child()").after('<li><a href="'+soldMachineURL+'">'+assemblyNumber+'</li>');

				$(".breadcrumb > li:last-child()").after('<li class="active">Shopping Cart</li>');							

	        }
	       
	      //Search bar
		      $("#keyword1").autocomplete({
		    		source : function(request, response) {
		    			var searchString = document.getElementById('keyword1').value;
		    			$.ajax({
		    				type : "post",
		    				url : "quicksearchautocomplete?searchString="+searchString+"&specificOrganization="+"&typeDropDown="+$("#typedropdown").val(),
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
    	
	    	
	    	
	    	
	    	
	    	$("#confirmationWindow #btnOkAction").on("click", function(){
	    		deleteFavListItems();
	    	});
	    	
	    	$('#cart-items-hldr').on('click', 'input[type="checkbox"].chk-fav-items', function(){
	    		if($('#cart-items-hldr input[type="checkbox"]:checked').length > 0){
	    			$("#btn-addFavItemstoCart").removeClass('emptyCart');
	    			$("#btn-deleteFavItemsfrmLst").removeClass('emptyCart');
	    		
	    		}else{
	    			$("#btn-addFavItemstoCart").addClass('emptyCart')
	    			$("#btn-deleteFavItemsfrmLst").addClass('emptyCart');
	    		}
	    		if($('#cart-items-hldr input[type="checkbox"]').length > $('#cart-items-hldr input[type="checkbox"]:checked').length){
	    			$("#chkfavallitems").prop('checked', false);
	    		}
	    		else if($('#cart-items-hldr input[type="checkbox"]').length == $('#cart-items-hldr input[type="checkbox"]:checked').length){
	    			$("#chkfavallitems").prop('checked', "checked");
	    		}
    		});
	    	
	    	
	    	$("#chkfavallitems").click(function () {
	    		$("#btn-addFavItemstoCart").addClass('emptyCart');
    			$("#btn-deleteFavItemsfrmLst").addClass('emptyCart');
	    		$(".chk-fav-items").prop('checked', $(this).prop('checked'));
	    		//console.log( $('#cart-items-hldr input[type="checkbox"]:checked').length );
	    		if($('#cart-items-hldr input[type="checkbox"]:checked').length > 0){
	    			$("#btn-addFavItemstoCart").removeClass('emptyCart');;
	    			$("#btn-deleteFavItemsfrmLst").removeClass('emptyCart');;
	    		
	    		}
	    	    
	    	});
    	});
		//GSP-1187 : Venkatasiva changed for IE11 Issue
   function addItemToCart(){	   
		addItemToCartFromListPage();
	}    
		
	function deleteItemFromCart() { 			
		$("#confirmationWindow").modal("show");
		$('.modal-footer a:first-child').focus();
	}
	//GSP-1187 : End
		$("#quickSearchAdd").click(function(e){
				if($('#quickSearchAdd').hasClass('not-active')){
					return false;
				}
				e.preventDefault();
	    	   	var partId = $(this).parent().find('input[type="hidden"][id="partId"]').text();
	    	   	var mediaId = $(this).parent().find('input[type="hidden"][id="mediaId"]').text();
	    	   	var organizationId = $(this).parent().find('input[type="hidden"][id="organizationId"]').text();
	    	   	ordMult = $(this).parent().find('input[type="hidden"][id="ordermultiple"]').val();
	    	   	var partNumber=$('#pNumber').text();
           		$(".cart-popover").find(".cart-popover-img > img").attr('src',"");
           		$(".cart-popover").find(".cart-popover-title").html("");
	    	   	addItemToFavListPage(partId, mediaId,ordMult,organizationId,partNumber,null,null,null);
               	$("#quickSearchDiv").css("display","none");
               	$('#keyword1').val("");
               	$('.clear-search').addClass('hidden');
   	  	});
		
	  	function addItemToFavListPage(partId, mediaId, quantity,organizationId,partNumber, dataPrice, dataMsrp, dataSavedPrice){
			  var dataItemVal = null;
			  $('div.pageLoader').show();
	    		 $.ajax({  
	    	        type : "POST",
	    	        data : {partId: partId,mediaId: mediaId,quantity: quantity,organizationId: organizationId, dataItemVal:dataItemVal},
	    	        url : "addToFavoritesCart",
	    	        cache : false,
	    	        success : function(response) {
	    	        	var jsonResponse = JSON.parse(response);
	    	         	if(response){
	    	         		$('#allResult').text(response.favCartCnt);
	    	         		$("#btn-deleteFavItemsfrmLst").hide();
	    	         		$("#btn-addFavItemstoCart").hide();
	    	         		$("#chkfavallitems").hide();
	    	         		if(response.favCartCnt >0 ){
	    	         			$("#btn-deleteFavItemsfrmLst").show();
		    	         		$("#btn-addFavItemstoCart").show();
		    	         		$("#chkfavallitems").show();
	    	         		}
	    	        	 	if(typeof jsonResponse.errorMessage=="undefined"){
	    	        	 		//getShoppingCartCount();
		    	        	 	getFavListItems();
		    	        	 	//getUpsellPart(); //Fix for GS-846
		    	        	    $('div.pageLoader').hide();
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
    	};
     
	  	function addItemToCartFromListPage(){
		  	var dataItemLst =[];
		  	$('div.pageLoader').show();
		  	$.each($('#cart-items-hldr input[type="checkbox"]:checked'), function(key, value) {
		  		var thisQty = $(this).parent().siblings(".qty-hldr").find(".spinner-control input.total-items").val();
		  		dataItemLst.push({partId: ($(this).data("partid")), "organizationId": ($(this).data("orgid")), "mediaId" : ($(this).data("mediaid")), "quantity": thisQty , "dataItemVal": null });
		  	});
		  	//console.log("{\"dataItemLst\":" + JSON.stringify(dataItemLst) + "}");
   			$.ajax({  
    	        type : "POST",
    	        data : {"objectRef":"{\"dataItemLst\":" + JSON.stringify(dataItemLst) + "}"},
    	        url : "addToCartFromFavorites",
    	        cache : false,
    	        success : function(response) {
   	        		var jsonResponse = JSON.parse(response);
   	        		console.log(jsonResponse);
   	        		console.log(jsonResponse.partNumber);
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
	    	        	    $('div.pageLoader').hide();
                            $(".cart-popover").css({"opacity": 1});
	    	        	 	$(".cart-popover").show().fadeOut(5000);
	    	        	 	//Rajesh Chinnam : Changed the below line of code to fix GS-1925 on 2015-10-15
							$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+jsonResponse.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
							$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ jsonResponse.partNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
    	        	 	}
    	        	 	else{
    	        	 		$('div.pageLoader').hide();
    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
    		    			$("#myModal").show();	
    	        	 	}
    	         	}
    	     		$('div.pageLoader').hide();
    	     		$(".chk-fav-items").removeAttr('checked');
    	     		$(".chk-favallitems").removeAttr('checked');
    	     		$("#btn-addFavItemstoCart").addClass('emptyCart');
    	    		$("#btn-deleteFavItemsfrmLst").addClass('emptyCart');
    	        },  
    	        error : function(e) { 
    	        	$('div.pageLoader').hide(); 
    	        	$(".chk-fav-items").removeAttr('checked');
    	     		$(".chk-favallitems").removeAttr('checked');
    	     		$("#btn-addFavItemstoCart").addClass('emptyCart');
    	    		$("#btn-deleteFavItemsfrmLst").addClass('emptyCart');
    	        }
    	    });
    	};
    	
        // get shopping cart items
        function getFavListItems(){
        	$('div.pageLoader').show();
	    	$.ajax({  
	            type : "Post",
	            dataType : "json",
	            //contentType: 'application/json;charset=utf-8',
	            mimeType: 'application/json',
	            //Added by Aniket : INC-1801 : Special Character Issue : Reviewed by Hari
	            dataType:"json",
	            url : "getFavoritesCart",
	            success : function(response) {  
	            	var locale=${locale};
	            	console.log(locale);
	            	console.log(response);
             		var upsellParts=[];
             		
	         		if(response!=null){
	         			$('#allResult').text(response.favCartCnt);
	         			$("#btn-deleteFavItemsfrmLst").hide();
	         			$("#btn-addFavItemstoCart").hide();
	         			$("#chkfavallitems").hide();
    	         		if(response.favCartCnt > 0 ){
    	         			$("#btn-deleteFavItemsfrmLst").show();
    	         			$("#btn-addFavItemstoCart").show();
    	         			$("#chkfavallitems").show();
    	         		}
	         			$("#cart-items-hldr").html('');
	         			console.log(response.favoritesCartItemList);
		             	$("#shoppingCartTemplate").tmpl(response.favoritesCartItemList).appendTo("#cart-items-hldr");
                   		checkAlertMessage();
		             	$(".cart-item-count").text(response.favoritesCartItemList.length);
		               	$("#currencyContainer").html('');
			            //Bing Keypress Event
		                  $('.total-items.output').on('keypress',function(e){
		                    var maxThree = /^\d{3}$/;
		                    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		                        return false;
		                    }
		                    if(maxThree.test($(this).val())){
		                      e.preventDefault();
		                    }
		                  });
		               	console.log(response.cartCurrencyVO);
		               	orderMultipleOrgFlag=response.orderMultipleOrgFlags;
		             	// Since is.consignment.order.required flag is not related to order multiple
		             	for(key in response.orderMultipleOrgFlags){
		             		if(response.orderMultipleOrgFlags[key]=='TRUE' || response.orderMultipleOrgFlags[key]=='true')
		             	    	$(".order-multiples-lbl[data-orgId='"+key+"']").show();
		             	    else
		             	    	$(".order-multiples-lbl[data-orgId='"+key+"']").hide();  	
		             	}  
	         		}
	         		else{
	         			$(".cart-item-count").text(0);
	         		}
	         		//fix for OM-1514: Place order leading 405 error. Added by Pooja.H.S
	         		$("#btn-place-order-frm-cart").removeClass('disabled');
	         		$("#btn-create-quote-frm-cart").removeClass('disabled');
	         		//OM-1514 end
	               	$('div.pageLoader').hide();
	               	
	            },  
	            error : function(e) {  
	            	//fix for OM-1514: Place order leading 405 error. Added by Pooja.H.S
	             $("#btn-place-order-frm-cart").removeClass('disabled');
	             $("#btn-create-quote-frm-cart").removeClass('disabled');
	         	//OM-1514 end
	             $('div.pageLoader').hide(); 
	            }  
           });
	    };

	    function getUpsellPart(upsellParts){
	    	
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
                    if(promotionNumber == 1){
                    content.css("margin-left", (container.width()-content.width())/2);
                    }
                    if(promotionNumber >1 && promotionNumber < 6){
                      $(".upsell-item:first").css("margin-left","20px");
                    }

	               }if(response==null||response.length==0){
	            	   $('.upsell-frame').hide();
	               }
	               
	              },  
              	error : function(e) {    
	            	  //alert(e);
	        	}  
	    	});
	    };

	    function deleteCartItem(cartItemId, organizationId, e){
	    	var dataItemLst =[];
	    	dataItemLst.push({cartItemId: cartItemId,organizationId: organizationId});
	    	deleteFromFavList(dataItemLst);
	    };
	    function deleteFavListItems(){
	    	var dataItemLst =[];
		  	$('div.pageLoader').show();
		  	$.each($('#cart-items-hldr input[type="checkbox"]:checked'), function(key, value) {
		  		dataItemLst.push({cartItemId: ($(this).data("favctid")), "organizationId": ($(this).data("orgid")) });
		  	});
	    	deleteFromFavList(dataItemLst);
	    };
        // delete individual cart item
        function deleteFromFavList(dataItemLst){
        	$('div.pageLoader').show();
	        $.ajax({
	          type : "Get",
	          data : {"objectRef":"{\"dataItemLst\":" + JSON.stringify(dataItemLst) + "}"},
	          contentType: 'application/json;charset=utf-8',
	          mimeType: 'application/json',
	          dataType:"json",
	          url : "deleteFavoritesCartItem",
	          cache : false,
	          	success : function(response) {
	        		var locale=${locale};
	        	  	console.log(response);
	        	  	//getShoppingCartCount();
	        	  	getFavListItems();
	        	  	var upsellParts=[];
	               	$("#currencyContainer").html('');
	             	//$("#currencyTemplate").tmpl(response.cartCurrencyVO).appendTo("#currencyContainer");
	               	console.log(response.cartCurrencyVO);

	                $("#cart-items-hldr").html('');
	             	$("#shoppingCartTemplate").tmpl(response.favoritesCartItemList).appendTo("#cart-items-hldr");
                	//checkAlertMessage();
	             	console.log(response.favoritesCartItemList.length);
 	             	//$(".cart-item-count").text(response.favoritesCartItemList.length);
                  	$('div.pageLoader').hide();
                  	$(".chk-fav-items").removeAttr('checked');
    	     		$(".chk-favallitems").removeAttr('checked');
    	     		$("#btn-addFavItemstoCart").addClass('emptyCart');
    	    		$("#btn-deleteFavItemsfrmLst").addClass('emptyCart');
	          },  
	          error : function(e) {  
	        	$('div.pageLoader').hide();
	        	$(".chk-fav-items").removeAttr('checked');
  	     		$(".chk-favallitems").removeAttr('checked');
  	     		$("#btn-addFavItemstoCart").addClass('emptyCart');
  	    		$("#btn-deleteFavItemsfrmLst").addClass('emptyCart');
	          }  
	        });
	        e.preventDefault();
	      }
	    
        // change quantity
	    function QuantityChange(quantity, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM){
        	console.log(dataPrice+".."+dataMsrp+".."+dataSavedPrice);
	    	$('div.pageLoader').show();
	        $.ajax({  
	          type : "Get",
	          data : {quantity : quantity, cartItemId : cartItemId, partId : partId, organizationId:organizationId, dataPrice:dataPrice, dataMsrp:dataMsrp, dataSavedPrice:dataSavedPrice, dataCurrency : dataCurrency, dataUOM : dataUOM, ordMult : 1},
	          contentType: 'application/json;charset=utf-8',
	          mimeType: 'application/json',
	        //Added by Aniket : INC-1801 : Special Character Issue : Reviewed by Hari
	          dataType:"json",
	          url : "favoritesCartitemquantitychange",
	          cache : false,
	          success : function(response) {
	        	  	var locale=${locale};
	              	console.log(response);
	              	$('#allResult').text(response.favCartCnt);
	              	
	             	if(response.cartItem.priceMSRPStr !="-1" && response.cartItem.priceMSRPStr !=response.cartItem.priceStr){
	              		$(".cartItemMsrp[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html(response.cartItem.priceMSRPStr + " " + (typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
	              	}else{
	              		$(".cartItemMsrp[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html("");
	              	}
	
					if(response.cartItem.priceStr !="-1"){
					 $(".cartItemYourPrice[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html(response.cartItem.priceStr + " " + (typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
					}else{
					 $(".cartItemYourPrice[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html("");
					}
	            	  
				 	if(response.cartItem.savedPriceStr!="-1" && response.cartItem.priceMSRPStr !=response.cartItem.priceStr){
					  $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html(response.cartItem.savedPriceStr+" "+ (typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));
            	  	}else{
            		  $(".cartItemSavedPrice[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html("");
            	  	}
	            	  
					  if(response.cartItem.itemTotalAmountStr !="-1"){
						  $(".cartItemTotal[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html(response.cartItem.itemTotalAmountStr+" "+(typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
			              $(".cartItemTotal[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").parents('.pricebox').find('input.alertFlagInput').val(response.cartItem.itemTotalAmountStr);
			              checkAlertMessage();
					  }else if(response.cartItem.itemTotalMSRPStr!="-1" ){
	            		  	$(".cartItemTotal[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html(response.cartItem.itemTotalMSRPStr+" "+(typeof response.cartItem.currencyCode!="undefined"?response.cartItem.currencyCode:""));//set MSRP
                    		$(".cartItemTotal[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").parents('.pricebox').find('input.alertFlagInput').val(response.cartItem.itemTotalMSRPStr);
                        	checkAlertMessage();
	            	  }else{
						  $(".cartItemTotal[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").html(" - ");
			              $(".cartItemTotal[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").parents('.pricebox').find('input.alertFlagInput').val("-1");
			              if(!$('p.alert-message').is(':visible')){
			                  $('p.alert-message').show();
			              }
					  }
					
				  	if(response.cartItem.inventoryMessage != ''){
				  		if(organizationId!=1){	
				  			 $(".b-label[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").find('div > strong').text(response.cartItem.inventoryMessage);
				        } else {
				        	         var str=response.cartItem.inventoryMessage;
			        	             var strContent = str.substring(0, 10);
							         if(strContent=="0 In Stock"){
								     $(".b-label[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").find('div > strong').text('0 In Stock, Please call 855-737-8835');
						             }else {
						            	 $(".b-label[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").find('div > strong').text(response.cartItem.inventoryMessage);
								     }
				               }
					 // $(".b-label[data-cartItem='"+response.cartItem.favoritesCartItemId+"']").find('div > strong').text(response.cartItem.inventoryMessage);
					}
	             	
	             	$(".cart-item-count").text(response.shoppingCart.favoritesCartItemList.length);
	               	
	               	$("#currencyContainer").html('');
	             	//$("#currencyTemplate").tmpl(response.shoppingCart.cartCurrencyVO).appendTo("#currencyContainer");
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
	         QuantityChange(itemVal, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM);
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
	        	  QuantityChange(1, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM);
	          }else{
	        	  QuantityChange(itemVal, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM);
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
	          var returnVal=validateQty(itemVal);
              
	          if(!returnVal){
	        	  QuantityChange(1, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM);
                   $(this).val(1);
                   $(this).parents('.spinner-control').children('.hiddenQty').val(1);
	          }else{
	        	  QuantityChange(itemVal, cartItemId, partId, organizationId, dataPrice, dataMsrp, dataSavedPrice, dataCurrency, dataUOM);
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
	               var commDesc="",enggDesc="";
	               
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
	               if(response[1].source.mediaId!=0){
	            	   $("#quickSearchImg").show();
	            	   $("#quickSearchImg").attr("src","${properties['docserver.url']}?media="+response[1].source.mediaId+"&thumbnail=true&user="+userid+"&token="+authtoken);
	               }
	               else
	            	 $("#quickSearchImg").hide();
	               var hasPriceAccess = response[1].hasPriceAccess;
	               if((response[1].source.orderable=="false") || (hasPriceAccess == "false")){
	            	   $("#quickSearchAdd").addClass('not-active');
	               }
	               else{
	            	   $("#quickSearchAdd").removeClass('not-active');
	               }
	               
	               $("#pNumber").text(response[1].source.partNumber);
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
	               $("#enggDesc").text(enggDesc);
	               $("#imageDesc").text(commDesc);
	               orderMultiple = response[1].source.orderMultiple;
	            	   
            	   if(orderMultiple ==null || orderMultiple == "")
            	  {
            		   orderMultiple = defaultPartOrderMultiple;
            	  }
	               document.getElementById('ordermultiple').value = orderMultiple;
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
	    	  addItemToFavListPage(partId, mediaId,quantity,"upsell",partNumber);
    	  });
	      
		  
	      
	      $('.quote-button').on('click', function(){
	    	  cartItemCount = $(".cart-item-count").text();
	    	  if(cartItemCount>0)
	    	  	window.location.href = 'createquotefromcartbrand';
	    	  else{
	    		  var msg = "<spring:message code='alert.cart.empty' javaScriptEscape='true'/>";
	    		  $('.modal-body').text(msg)
	  			  $("#myModal").show();
	    		  return false;
	    	  }
	      })
	      
	      $("#btn-place-order-frm-cart").on('click',function(e){
	    	  cartItemCount = $(".cart-item-count").text();
	    	  if(cartItemCount>0){
	    		  e.preventDefault();
	    		  window.location.href="createorderfromcartbrand";
	    	  }
	    	  else{
	    		  var msg = "<spring:message code='alert.cart.empty' javaScriptEscape='true'/>";
	    		  $('.modal-body').text(msg)
	  			  $("#myModal").show();
	    		  return false;
	    	  }
	    		  
		  });
	      
	      $(".custom-close").click(function(){
			   $("#myModal").hide();
			});
	      
	      $('.continue_shopping').on('click', function(e){
	    	  e.preventDefault();
	    	  window.location.href = 'shopforparts';
	      })
	      
	      function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
	    	  
	    	  //window.open("getfullitemdetailsUsingCartId?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+"&cartItemId="+cartItemId);
	    	  document.location.href="getfullitemdetailsUsingCartId?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+"&cartItemId="+cartItemId;
	      }
	      
	      function fullItemRedirect(itemId, orgId){
	    	  //window.open("getfullitemdetails?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId);
	    	  document.location.href="getfullitemdetails?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+"&ismyfavorite=true";
	    	 
	      }
	      
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
	    			var msg = "<spring:message code='alert.cart.qty.notless.one' javaScriptEscape='true'/>";
	    			$('.modal-body').text(msg);
	    			$("#myModal").show();
	    			return false;
	    		}else if(validateSpecialCharacterAndAlphanumeric(itemQty) == true){
	    			var msg = "<spring:message code='alert.cart.specialchar.not.allow' javaScriptEscape='true'/>";
	    			$('.modal-body').text(msg);
	    			$("#myModal").show();
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
    </script>
</body>

</html>
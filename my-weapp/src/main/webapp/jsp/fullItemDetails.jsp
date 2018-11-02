<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<jsp:include page="googleAnalytics.jsp" />

<!-- CSS -->
<!-- build:css ../assets/globalstyles.min.css -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400" rel="stylesheet" type='text/css'>
<link rel="stylesheet"	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<link rel="stylesheet" type="text/css"	href="../js/ortary/HTML5Viewer.css">
<!-- /build -->
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css" href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico"	type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<!-- build:js  ../assets/globalscripts.js -->
<script	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"	type="text/javascript"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.4/jquery.i18n.js?version=${properties['application.version']}" ></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- Javascript Plugins -->
<script	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<!-- /build -->
<script	src="../js/gensuite-ui.js?version=${properties['application.version']}"	type="text/javascript"></script>
<script	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" ></script>

<script	src="../js/custom.scripts.js?version=${properties['application.version']}" ></script>


<style>
#marketing-pannel-hldr {
	padding: 0 15px;
	height: auto;
}
.pin-main-img {
	max-width: 100%;
	max-height: 100%;
}
.mkt-banner-hldr img{
    border: 1px solid #999;
    margin-bottom: 5px;
    max-height: 90px;
}
#headerName {
    color: #c80000;
    font-size: 22px;
    font-weight: 700;
    margin-top:15px;
}
#marketing-pannel-hldr .nav-tabs {
	margin-top: 8px;
	background: #fbfbfb;
}

#marketing-pannel-hldr .nav-tabs>li.active>a {
    background: #444;
    font-size: 16px;
    color: #fff;
    font-weight: bold;
    padding: 2px 12px;
    max-width: 250px;
}
#marketing-pannel-hldr .nav-tabs>li.active>a:focus,
#marketing-pannel-hldr .nav-tabs>li.active>a:hover {
	opacity: 1;
	border-radius: 4px 4px 0 0;
}

#marketing-pannel-hldr .nav-tabs>li>a {
	border: 1px solid #ddd;
	border-bottom: none;
	padding: 5px 15px;
	font-weight: 600;
	font-size: 12px;
	line-height: 1.5;
	max-width: 200px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.tab-pane > div{
	padding-top:0px;
	border: none;
}

#marketing-pannel-hldr .tab-content {
	border-right: 1px solid #ddd;
	padding: 10px 10px 20px;
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	margin-bottom: 15px;
	font-size: 10px;
}

#marketing-pannel-hldr .tab-content-box {
    font-size: 14px;
    margin-bottom: 1px;
    max-height: 105px;
    padding: 0 10px;
    overflow: hidden;
    line-height: 1.5;
    font-weight: 500;
}

#marketing-pannel-hldr .tab-content>.tab-pane{
	padding:5px
}

#marketing-pannel-accordion {
	display: none;
}
#marketing-pannel-accordion.panel-group{
	margin-bottom:0;
}
#marketing-pannel-accordion .panel-title {
	font-size: 13px;
	font-weight: normal;
}

#marketing-pannel-accordion .panel-heading {
	background: #53585a;
	color: #fff;
}

.main-img-list {
	list-style: none;
	margin: 0;
	right: 0;
	position: absolute;
	padding: 0;
	top: 0;
}
.main-img-list li {
	border: 1px solid #d5d5d5;
	cursor: pointer;
	padding: 5px;
	margin-top: 7px;
	width: 95px;
}
.main-img-list li:hover, .main-img-list li.active {
	border: 1px solid #c52033;
}
.main-img-list li img {
	max-width: 100%;
	max-height: 100%;
}
#enlargeModal .modal-dialog1{
    position: absolute;
    right: 0;
    top: 35%;
    bottom: 0;
    left: 0;
    margin: -61px auto 0;
}
#enlargeModal .modal-header{
	border:none;
}
div.otherDetails-content>h5 {
	background-color: transparent;
}
.custom-modal-body{
	padding: 2px 10px;
}
.fa.fa-star.fav-item {
	font-size: 18px;
	color: #c52033;
	line-height: 30px;
	cursor: pointer;
}

.dropDown-icon {
	transform: rotate(-90deg);
	top: 0px;
}

.no-fav-item {
	color: #7b7b7b !important;;
	cursor: pointer;
}


</style>
</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<input type="hidden" name="sapInstallerLink"
		value="${properties['sap.installer.link']}" id="sapInstallerLink">
	<input type="hidden" name="threedVersionReq"
		value="${properties['threed.required.version']}" id="threedVersionReq">
	<input type='hidden' id='partNum' value='${fullItemDetails.partNumber}'>
	<form method="post">
		<!-- Main Wrapper having header,footer and content -->
		<div class="main-wrapper" id="full-item">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed hidden-xsx">
				<ul id="breadcrumb" class="breadcrumb">
					<!-- Made it hidden Added on 19-10-2015 for GS-1710 from Krupa L J -->
					<li hidden><a href="homepage"><spring:message
								code="lable.home" /></a></li>
					<c:choose>
						<c:when test="${true==param.ismyfavorite}">
							<li hidden><a href="myfavorites"><spring:message
										code="label.header.favorites" /></a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${!empty param.searchString}">
									<li hidden><a href="shopCentre"><spring:message
												code="label.search.search" /></a></li>
								</c:when>
								<c:when test="${properties['facetSearch.required']}">
									<li hidden><a href="shopCentre"><spring:message
												code="lable.item.shopForParts" /></a></li>
								</c:when>
								<c:otherwise>
									<li hidden><a href="shopforparts"><spring:message
												code="lable.item.shopForParts" /></a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<li class="active" hidden><spring:message
							code="lable.item.item" /> # ${fullItemDetails.partNumber}</li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper p-t-sm-67 m-t-lg-55">

				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 column-paddings">
					<div class="col-sm-5 col-sm-push-0 col-xs-12">
						<h3 id="headerName" class="inline">
							<spring:message code="lable.item.item" />
							# ${fullItemDetails.partNumber}
							<c:if
								test="${ not sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
								<a class="fav-btn ng-scope" title="Favorites"
									data-itemid="${fullItemDetails.partId}"
									data-mediaid="${fullItemDetails.mediaId}"
									data-orgid="${fullItemDetails.organizationId}"> <c:if
										test="${fullItemDetails.myFavNonOrderableShown == '1'}">
										<c:if test="${fullItemDetails.myFavShown == '0'}">
											<i class="fa fa-star no-fav-item"></i>
										</c:if>
										<c:if test="${fullItemDetails.myFavShown == '1'}">
											<i class="fa fa-star fav-item"></i>
										</c:if>
									</c:if>
								</a>
							</c:if>
						</h3>
					</div>
					<div
						class="col-lg-3 col-md-3 col-sm-12 col-xs-12 column-paddings checkout visible-sm">
						<div class="pull-left details-leftpart">
							<div>
								<strong>${fullItemDetails.partCommercialDescription}</strong>
							</div>
							<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
								<div>${fullItemDetails.partEngineeringDescription}</div>
							</sec:authorize>
							<div class="otherDetails">
								<div class="b-label">
									<c:if test="${properties['display.organizationName']}">
										<div>${fullItemDetails.brand}Part</div>
									</c:if>
									<%-- <div><strong>${fullItemDetails.availableQuantity} <spring:message code="lable.item.inStock"/></strong></div> --%>
									<!-- GPD-2524:Added by Pujith, reviewed by Venkatasiva Reddy -->
									<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
									<div>
										<strong>${fullItemDetails.inventoryMessage}</strong>
									</div>
									</sec:authorize>
								</div>
								<br />

							</div>

						</div>
						<div class="pull-right">
						<!-- GPD-2522: Added by Pujith, reviewed by Venkatasiva Reddy -->
						<sec:authorize access="hasRole('ROLE_PRICE')">
							<div class="msrpShowHide price-loader">
								<spring:message code="lable.item.msrp" />
								: <span id="msrp-sm"></span>
							</div>
							<div class="price-loader">
								<spring:message code="label.item.yourPrice" />
								: <span id="price-sm"></span>
							</div>
							<div class="blueColor youSaveShowHide price-loader">
								<spring:message code="lable.item.youSave" />
								: <span id="youSave-sm"></span>
							</div>
							</sec:authorize>
							<sec:authorize access="!hasRole('ROLE_PRICE')">
							<div >
								<spring:message code="message.guest.login" />
							</div>
							</sec:authorize>
						<!-- GPD-2524:ROLE_PRICE authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_CART') and hasRole('ROLE_PRICE')">
								<c:choose>
									<c:when
										test="${(fullItemDetails.isOrderable) && (empty isFromQuoteOrder)}">
										<button
											class="btn btn-addtocart btn-size cart-large not-active"
											role="button" data-btn-type="addtocart-click"
											id="addtocart-click-sm">
											<spring:message code="lable.item.addToCart" />
										</button>
									</c:when>
									<c:otherwise>
										<button
											class="btn btn-addtocart btn-size cart-large not-active"
											data-btn-type="addtocart-click" role="button"
											id="addtocart-click-sm">
											<spring:message code="lable.item.addToCart" />
										</button>
									</c:otherwise>
								</c:choose>
							</sec:authorize>
							<!-- GPD-2524:ROLE_PRICE authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_CART') and hasRole('ROLE_PRICE')">
								<c:choose>
									<c:when
										test="${(fullItemDetails.isOrderable) && (empty isFromQuoteOrder)}">
										<sec:authorize access="hasRole('ROLE_ORDER')">
											<c:choose>
												<c:when test="${(fullItemDetails.canPlaceOrderPOCC)}">
													<button
														class="btn btn-addtocart cart-large btn-size btn-buynow not-active"
														data-btn-type="addtocart" id="buynow-click" role="button">
														<spring:message code="lable.item.buyNow" />
													</button>
												</c:when>
												<c:otherwise>
													<button
														class="btn btn-addtocart cart-large btn-size btn-buynow not-active"
														data-btn-type="addtocart" id="buynow-click" role="button">
														<spring:message code="lable.item.buyNow" />
													</button>
												</c:otherwise>
											</c:choose>
										</sec:authorize>
										<sec:authorize access="!hasRole('ROLE_ORDER')">
											<button
												class="btn btn-addtocart cart-large btn-size btn-buynow not-active"
												data-btn-type="addtocart" id="buynow-click" role="button">
												<spring:message code="lable.item.buyNow" />
											</button>
										</sec:authorize>
									</c:when>
									<c:otherwise>
										<button
											class="btn btn-addtocart cart-large btn-size not-active"
											data-btn-type="addtocart" id="buynow-click" role="button">
											<spring:message code="lable.item.buyNow" />
										</button>
									</c:otherwise>
								</c:choose>

							</sec:authorize>
						</div>
					</div>
					<div id="fullitemsMediaContainer" class="container-fluid mediawrap">
					<div id="fullitems-graphic-hldr"
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div
							class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pull-left nopadding">
							<!-- <h3>
								<spring:message code="lable.item.item" />
								# ${fullItemDetails.partNumber}
							</h3>-->
						</div>
						<div
							class="col-lg-8 col-md-8 col-sm-8 col-xs-12 nav nav-pills differentViews pull-right nopadding">
							<!-- SUPPORT -MIL 196 210116 -->
							<c:if test="${not empty fullItemDetails.part3dModelLink}">
								<a id="tab_3E" class="external-3d part3dModel"
									style="cursor: pointer" title="Cadenas viewer"><i
									class="fa fa-cubes"></i></a>
							</c:if>
							<c:if test="${not empty fullItemDetails.catalogDocumentLink}">
								<a href="${fullItemDetails.catalogDocumentLink}" target="_blank"
									class="catalog" style="cursor: pointer" title="Catalog Page"><i
									class="fa fa-clipboard"></i></a>
							</c:if>
							<span class="vertical-seperator"></span>
							<%-- 	<c:if test="${not empty fullItemDetails.part3dModelLink}">
									<a class="msds hidden"><i class="fa fa-user-secret"></i></a>
								</c:if> --%>

							<!-- Added by Dibu ,Fix for NREV-792, reviewed by Rajesh chinnam for 2D overlapping issue-->
							<a id="tab_1"
								title="<spring:message code="label.mymachine.image" />"
								class="active" data-toggle="pill" href="#tab_a"><i
								class="fa fa-picture-o"></i></a> <a id="tab_2" data-toggle="pill"
								title="<spring:message code="label.mymachine.twod" />"
								class="click disabled" onClick="initialize2d();"><i
								class="fa fa-table"></i></a> <a id="tab_3" data-toggle="pill"
								title="<spring:message code="label.mymachine.threed" />"
								class="click disabled" onClick="initialize3d();"><i
								class="fa fa-cube"></i></a> <a id="tab_4" data-toggle="pill"
								title="<spring:message code="label.mymachine.audio" />"
								class="click disabled"><i class="fa fa-headphones"></i></a> <a
								id="tab_5" data-toggle="pill"
								title="<spring:message code="label.mymachine.video" />"
								class="click disabled"><i class="fa fa-play-circle-o"></i></a> <a
								id="tab_6" data-toggle="pill"
								title="<spring:message code="label.mymachine.documents" />"
								class="click disabled"><i class="fa fa-folder-open-o"></i></a>
						</div>
						<div
							class="tab-content col-lg-12 col-md-12 col-sm-12 col-xs-12 beltMarginRight">
							<div class="tab-pane active row no-pad" id="tab_a">
								<!-- Content area for image part-->
								<div class="btn-group-vertical zoomOption1" role="group">
									<button id="imageview-zoomin" value="zoom-in"
										title="<spring:message code="label.mymachine.zoom.in" />"
										type="button" class="btn btn-default">
										<span class="fa fa-search-plus" aria-hidden="true"></span>
									</button>
									<button id="imageview-zoomout" value="zoom-out"
										title="<spring:message code="label.mymachine.zoom.out" />"
										type="button" class="btn btn-default">
										<span class="fa fa-search-minus" aria-hidden="true"></span>
									</button>
									<button id="reset1"
										title="<spring:message code="label.quote.order.reset" />"
										type="button" class="btn btn-default">
										<span class="fa fa-refresh" aria-hidden="true"></span>
									</button>
								</div>
								<div id="ImgwhnNull">
									<img id="imageIdCatWeb" />
									<div class="noimg-hldr col-md-12 text-center" id="divIdNoImage">
										<div class="no-image-text">
											<h3 id="noImgAvailable"></h3>
										</div>
									</div>
									<c:if test="${fullItemDetails.isActualImage == false}">
									<div id="{{itemPartId}}" ng-if="isActualImage == 0" class="waterMarkForFullItemDetails">
										<span class="label1ForCartPopOver" style="font-size: 19px;margin-top: 21px;font-weight: 600;position: absolute;float: none;left: 0px;width: 93%;">
										<spring:message code="label.watermark.text1"/> </span>
										<span class="label2ForCartPopOver" style="font-size: 17px;font-weight: 400;margin-top: 22px;position: absolute;float: none;left: 0px; width: 93%;"><br>
										<spring:message code="label.watermark.text2"/></br></span>
									</div>	
									</c:if>
								</div>
								<div id="imageIdCatWebOrtary"
									class="animateCreatorContainer zoombtn"
									style="width: 458px;height: auto; "></div>
									<ul class="marketing-hldr main-img-list">
								</ul>
							</div>
							<div class="tab-pane row no-pad" id="tab_b">
								<!-- Content area for 2D part-->
								<c:forEach items="${fullItemDetails.mediaList}"
									var="catalogMedia">
									<c:if test="${catalogMedia.mediaType == '2'}">
										<div class="btn-group-vertical zoomOption" role="group">
											<button id="pan1" type="button"
												title="<spring:message code="label.mymachine.pan" />"
												class="btn btn-default">
												<span class="fa fa-arrows" aria-hidden="true"></span>
											</button>
											<button id="zoom-in" type="button"
												title="<spring:message code="label.mymachine.zoom.in" />"
												class="btn btn-default">
												<span class="fa fa-search-plus" aria-hidden="true"></span>
											</button>
											<button id="zoom-out" type="button"
												title="<spring:message code="label.mymachine.zoom.out" />"
												class="btn btn-default">
												<span class="fa fa-search-minus" aria-hidden="true"></span>
											</button>
											<button id="reset" type="button"
												title="<spring:message code="label.quote.order.reset" />"
												class="btn btn-default">
												<span class="fa fa-refresh" aria-hidden="true"></span>
											</button>
										</div>
										<div class="cCarousel">
											<div id="carousel-2D" class="carousel slide"
												data-ride="carousel">
												<!-- Carousel for 2D part-->
												<!-- Indicators -->
												<ol class="carousel-indicators">
													<li data-target="#carousel-2D" data-slide-to="0"
														class="active"></li>
													<li data-target="#carousel-2D" data-slide-to="1"></li>
													<li data-target="#carousel-2D" data-slide-to="2"></li>
												</ol>
												<!-- Wrapper for slides -->
												<div class="carousel-inner text-center" role="listbox">

													<div class='item active belt'>
														<div id="viewer2dDiv" class='belt'>
															<div id="imgContainer"></div>
														</div>
													</div>
												</div>
												<!-- Controls -->
												<a class="left carousel-control" href="#carousel-2D"
													role="button" data-slide="prev">
													<div class="leftControl">
														<i class="fa fa-chevron-circle-left " id="prevSvg"
															onclick="loadPrevImage();"> </i> <span class="sr-only"
															id="prev"><spring:message
																code="lable.item.previous" /></span>
													</div>
												</a> <a class="right carousel-control" href="#carousel-2D"
													role="button" data-slide="next">
													<div class="rightControl">
														<i class="fa fa-chevron-circle-right  glyphiconcolor"
															id="nextSvg" onclick="loadNxtImage();"></i> <span
															class="sr-only" id="next"><spring:message
																code="lable.item.next" /></span>
													</div>
												</a>
											</div>
											<!-- Carousel end for 2D part-->
										</div>
									</c:if>
								</c:forEach>

							</div>

							<div class="tab-pane" id="tab_c">
								<!-- Content area for 3D part-->
								<div id="viewer3dDiv" class='fullItemDetailsViewer3d'>
									<iframe src="" width="100%;" height="490" frameborder="0"
										allowfullscreen></iframe>
								</div>
							</div>
							<div class="tab-pane" id="tab_d">
								<!-- Content area for audio part-->
								<img src="../images/product.png" class="belt">

							</div>
							<div class="tab-pane" id="tab_e">
								<!-- Content area for video part-->
							</div>
							<div class="tab-pane" id="tab_f">
								<!-- Content area for pdf part-->
								<div class="row pdfPart mtop10" id="docPart">

									<c:forEach items="${fullItemDetails.mediaList}"
										var="catalogMedia">

										<c:if test="${catalogMedia.mediaType == '6'}">
											<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="pd">
												<div class="firstArticle">
													<c:choose>
														<c:when test="${catalogMedia.mediaFileTypeId == '3' }">
															<img src="../images/pdf.png">
														</c:when>
														<c:when test="${catalogMedia.mediaFileTypeId == '6' }">
															<img src="../images/excel.png">
														</c:when>
														<c:when test="${catalogMedia.mediaFileTypeId == '8' }">
															<img src="../images/File-Audio-icon.png">
														</c:when>
														<c:when test="${catalogMedia.mediaFileTypeId == '9' }">
															<img src="../images/File-Video-icon.png">
														</c:when>
														<c:when test="${catalogMedia.mediaFileTypeId == '7' }">
															<img src="../images/word.png">
														</c:when>
													</c:choose>
													<div>
														<h3>
															<a style="cursor:pointer;"
																onclick=downloadMedia(${catalogMedia.mediaId});
																id="pdfName">${catalogMedia.mediaFile}</a>
														</h3>
														<p style='margin-top: -20px;'>
															<br>${catalogMedia.description}</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<!-- SUPPORT -MIL -  -->
							<div class="tab-pane" id="tab_g">
								<!-- Content area for 3D part-->
								<div id="external3dDiv" class='fullItemDetailsViewer3d'>
									<iframe src="" width="100%;" height="580" frameborder="0"
										allowfullscreen></iframe>
								</div>
							</div>
						</div>
					</div>
					</div>				
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="otherDetails other3dDetail">
							<c:if test="${properties['display.legacy.part']}">
							<h5>
								<spring:message code="lable.item.legacyPartNumber" />
							</h5>
							<div class="row otherDetails-content">
								<h5
									class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
									<spring:message code="lable.item.partNUmber" />
								</h5>
								<h5
									class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
									<spring:message code="lable.item.description" />
								</h5>
							</div>

							<c:choose>
								<c:when test="${not empty fullItemDetails.legacyParts}">
									<c:forEach items="${fullItemDetails.legacyParts}"
										var="legacyParts">
										<div class="row otherDetails-content">
											<p
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${legacyParts.legacyPartNumber}
											</p>
											<p
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${legacyParts.description}
											</p>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="bootstrap-padding">
										<spring:message code="lable.item.none" />
									</p>
								</c:otherwise>
							</c:choose>
							</c:if>
							<h5>
								<spring:message code="lable.item.supersededParts" />
							</h5>
							<c:choose>
								<c:when test="${not empty fullItemDetails.superseededParts}">
									<c:forEach items="${fullItemDetails.superseededParts}"
										var="superseededParts">
										<div class="row otherDetails-content">
											<h5
												class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.partNUmber" />
											</h5>
											<h5
												class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.supersededBy" />
											</h5>
											<h5
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.supersededOn" />
											</h5>
											<h5
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.description" />
											</h5>
										</div>

										<div class="row otherDetails-content">
											<div class="row otherDetails-content">
												<p
													class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${superseededParts.partNumber}</p>
												<p
													class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
													<a href="javascript:void(0);"
														onclick="fullItemRedirect(${superseededParts.orderablePartId})">${superseededParts.orderablePartNumber}</a>
												</p>
												<p
													class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${superseededParts.supersededOn}
												</p>
												<p
													class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${superseededParts.partCommercialDescription}
												</p>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="row otherDetails-content">
										<p
											class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
											<spring:message code="lable.item.none" />
										</p>
									</div>
								</c:otherwise>
							</c:choose>

							<h5>
								<spring:message code="lable.item.alternativeParts" />
							</h5>
							<c:choose>
								<c:when test="${not empty fullItemDetails.alternateParts}">
									<c:forEach items="${fullItemDetails.alternateParts}"
										var="alternateParts">
										<div class="row otherDetails-content">
											<p
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<a href="javascript:void(0);"
													onclick="fullItemRedirect(${alternateParts.orderablePartId})">${alternateParts.orderablePartNumber}</a>
											</p>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="row otherDetails-content">
										<p
											class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
											<spring:message code="lable.item.none" />
										</p>
									</div>
								</c:otherwise>
							</c:choose>
							<sec:authorize access="hasRole('ROLE_VENDOR_PART')">
								<h5>
									<spring:message code="lable.item.vendorPartNumbers" />
								</h5>
								<c:choose>
									<c:when test="${not empty fullItemDetails.vendorParts}">
										<c:forEach items="${fullItemDetails.vendorParts}"
											var="vendorParts">
											<div class="row otherDetails-content">
												<h5
													class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
													<spring:message code="lable.item.partNUmber" />
												</h5>
												<h5
													class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${vendorParts.vendorPartNumber}
												</h5>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="row otherDetails-content">
											<p
												class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.none" />
											</p>
										</div>
									</c:otherwise>
								</c:choose>
							</sec:authorize>

							<h5>
								<spring:message code="lable.item.crossRefPartNumbers" />
							</h5>
							<c:choose>
								<c:when test="${not empty fullItemDetails.crossReferenceParts}">
									<c:forEach items="${fullItemDetails.crossReferenceParts}"
										var="crossReferenceParts">
										<div class="row otherDetails-content">
											<h5
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.partNUmber" />
											</h5>
											<h5
												class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${crossReferenceParts.crossRefNumber}
											</h5>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="row otherDetails-content">
										<p
											class="col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
											<spring:message code="lable.item.none" />
										</p>
									</div>
								</c:otherwise>
							</c:choose>

							<h5>
								<spring:message code="label.full.itemdetails.comments" />
							</h5>
							<div>${fullItemDetails.comments}</div>

						</div>
					</div>
				</div>
				<div
					class="col-lg-3 col-md-3 col-sm-12 col-xs-12 column-paddings checkout hidden-sm">
					<div>
						<strong>${fullItemDetails.partCommercialDescription}</strong>
					</div>
					<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
						<div>${fullItemDetails.partEngineeringDescription}</div>
					</sec:authorize>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
						<div class="otherDetails">
							<div class="b-label">
								<c:if test="${properties['display.organizationName']}">
								<div>${fullItemDetails.brand}&nbsp;Part</div>
								</c:if>
								<%-- <div><strong>${fullItemDetails.availableQuantity} <spring:message code="lable.item.inStock"/></strong></div> --%>
								<!-- GPD-2522:ROLE_AVAILABILITY authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
								<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
								<div>
									<strong> <c:choose>
											<c:when test="${empty fullItemDetails.inventoryMessage}">
												<%--   <spring:message code="guest.inventory.msg" /> --%>
											</c:when>
											<c:otherwise>
					                       ${fullItemDetails.inventoryMessage}
					                    </c:otherwise>
										</c:choose>
									</strong>
								</div>
								</sec:authorize>
							</div>
							<br />
							<!-- GPD-2522:ROLE_PRICE authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_PRICE')">
							<div class="msrpShowHide price-loader">
								<spring:message code="lable.item.msrp" />
								: <span id="msrp"></span>
							</div>

							<div class="yourPrice price-loader">
								<spring:message code="label.your.price" />
								: <span id="price"></span>
							</div>
							<div class="blueColor youSaveShowHide price-loader">
								<spring:message code="lable.item.youSave" />
								: <span id="youSave"></span>
							</div>
							</sec:authorize>
							<sec:authorize access="!hasRole('ROLE_PRICE')">
							<div >
								<spring:message code="message.guest.login" />
							</div>
							</sec:authorize>
							<input type="hidden" id="orderMultiple" />
							<div class="nopadding fullitemdet mtop10">

								<div class="spinner-control nopadding not-active"
									data-ordermultiplekey="">
									<input type="text" id="quantity" maxlength="6"
										class="total-items output" value="1"
										style="width: 40px; text-align: center">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment "> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement "> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="top: auto;">${fullItemDetails.uom}</span>
							</div>
							<div class="col-lg-12 ordPara" style="padding-left: 0"></div>
							<p class="order-multiples-lbl">
								<spring:message code="label.all.ordermultiples"
									javaScriptEscape="true" />
								${'${'}orderMultiple}
							</p>

							<!-- GPD-2524:ROLE_PRICE authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_CART') and hasRole('ROLE_PRICE')">
								<!--  console.log('ROLE_CART');-->
								<c:choose>
									<c:when
										test="${(fullItemDetails.isOrderable) && (empty isFromQuoteOrder)}">
										<!--	console.log('ROLE_CART isOrderable');-->
										<button
											class="btn btn-addtocart btn-size cart-large pull-left not-active"
											role="button" id="addtocart-click">
											<spring:message code="lable.item.addToCart" />
										</button>
									</c:when>
									<c:otherwise>
										<!--	console.log('ROLE_CART not-active');-->
										<button
											class="btn btn-addtocart btn-size cart-large pull-left not-active"
											role="button" id="addtocart-click">
											<spring:message code="lable.item.addToCart" />
										</button>
									</c:otherwise>
								</c:choose>
							</sec:authorize>
							<!-- GPD-2524:ROLE_PRICE authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_CART') and hasRole('ROLE_PRICE')">
								<c:choose>
									<c:when
										test="${(fullItemDetails.isOrderable) && (empty isFromQuoteOrder)}">
										<sec:authorize access="hasRole('ROLE_ORDER')">
											<c:choose>
												<c:when test="${(fullItemDetails.canPlaceOrderPOCC)}">
													<button
														class="btn btn-addtocart cart-large btn-size btn-buynow not-active"
														data-btn-type="addtocart" id="buynow-click" role="button">
														<spring:message code="lable.item.buyNow" />
													</button>
												</c:when>
												<c:otherwise>
													<button
														class="btn btn-addtocart cart-large btn-size not-active"
														data-btn-type="addtocart" id="buynow-click" role="button">
														<spring:message code="lable.item.buyNow" />
													</button>
												</c:otherwise>
											</c:choose>
										</sec:authorize>
										<sec:authorize access="!hasRole('ROLE_ORDER')">
											<button
												class="btn btn-addtocart cart-large btn-size not-active"
												data-btn-type="addtocart" id="buynow-click" role="button">
												<spring:message code="lable.item.buyNow" />
											</button>
										</sec:authorize>
									</c:when>
									<c:otherwise>
										<button
											class="btn btn-addtocart cart-large btn-size not-active"
											data-btn-type="addtocart" id="buynow-click" role="button">
											<spring:message code="lable.item.buyNow" />
										</button>
									</c:otherwise>
								</c:choose>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
					<div class="modal bs-example-modal-lg bs-example-modal-md" id="enlargeModal">
				<div class="modal-dialog1 modal-lg modal-md" style="cursor: pointer;">
					<div id="moveModal" class="modal-content">
						<div id="moveModalheader" class="modal-header" style="height: 50px;">
							<button type="button" class="close custom-close"
								data-dismiss="modal" aria-label="Close" title="Close">
								<i class="fa fa-times" style="color: #080505;"></i>
							</button>
							<img alt="Bulk Upload" class="fa fa-times"
								src="../images/drag1.png" data-holder-rendered="true"
								style="height: 40px; width: 45px; position: relative;right: -10px;top: -10px;"
								align="middle" title="Drag Me">
						</div>
						<div class="modal-body custom-modal-body">
							<img id="enlargeModalImage" src="">
						</div>
					</div>
				</div>
			</div>
			<!-- footer container -->
			<div
				class="row search-parts-template cart-details add-cartpopover-img"
				style="display: none">
				<div class="col-lg-2">
					<a href="javascript:void(o);" class="no-image"><p>${fullItemDetails.partCommercialDescription}</p></a>
				</div>
			</div>
			<footer>
				<%@ include file="footer.jsp"%>
			</footer>
			<div class="pageLoader" style="display: block;">
				<div class="loader-content">
					<h4>
						<spring:message code="label.footer.loading" />
						...
					</h4>
					<div class="loader"></div>
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
		</div>
	</form>
	<sec:authorize access="hasRole('ROLE_CART')" var="hasROLE_CART" />
	<sec:authorize access="hasRole('ROLE_ORDER')" var="hasROLE_ORDER" />
	<sec:authorize access="hasRole('ROLE_CREATE_DIRECT_ORDER')"
		var="hasROLE_CREATE_DIRECT_ORDER" />
	<script type="text/javascript"	src="../js/2d/browserdetection.js?version=${properties['application.version']}"></script>
	<script type="text/javascript"	src="../js/2d/e-smart-zoom-jquery.min.js"></script>
	<script type="text/javascript"	src="../js/2d/viewer2d.js?version=${properties['application.version']}"></script>
	<script type="text/javascript"	src="../js/3d/viewer3d.js?version=${properties['application.version']}"></script>
	<script type="text/javascript"	src="../js/3d/Loco.js?version=${properties['application.version']}"></script>
	<!-- <script type="text/javascript"	src="../js/3d/dvl.js?version=${properties['application.version']}"></script>-->
	<script src="../js/custom.scripts.js" type="text/javascript"></script>

	<script type="text/javascript"	src="../js/ortary/jQueryPlugin.js?version=${properties['application.version']}"></script>
	<script type="text/javascript"	src="../js/ortary/HTML5Loader.js?version=${properties['application.version']}"></script>
	<script type="text/javascript"	src="../js/ortary/HTML5Viewer.js?version=${properties['application.version']}"></script>
	
	<script src="../js/jquery.nicescroll.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script src="../js/module-estore-marketingbnr.js?version=${properties['application.version']}" type="text/javascript"></script>
	
	<script type="text/javascript">

    var defaultPartUOM = '${properties["default.part.uom"]}';
    var defaultPartOrderMultiple = '${properties["default.part.ordermultiple"]}';
    var ordMult;
    var valueHideOrShow;
    var downloadFlag= false;
    var partImageLink='${fullItemDetails.partImageLink}';
    var partProfileLink='${fullItemDetails.partProfileLink}';
    console.log("partImageLink=="+partImageLink+"==partProfileLink=="+partProfileLink)
    if(partImageLink != null && partImageLink != ''){
        jQuery(function ($) {
	        $('#imageIdCatWebOrtary').animate360({
		        centerInWindow: true,
		        objPath: partImageLink+'/',
		        xmlPath: partProfileLink,
		        iconPath: '../js/ortary/'
		    });
	        $("#imageIdCatWebOrtary").css("min-height", "425px");
	    });
        $('.noimg-hldr').hide();
        $('#ImgwhnNull').hide();
    }else{
    	$('.noimg-hldr').show();
    	$('#ImgwhnNull').show();
    }

        function downloadMedia(mediaId){
	        var docserverUrl = $('#docserverUrl').val();
	        var userId=  $('#userId').val();
	        var authToken =  $('#authToken').val();
//	        	alert("userId===" +userId+"authToken===" +authToken);
//	        	var authToken = "a432cb5baec20d0118360ca48292e4d06fd55429be09e67de64ab5fa01e9d91c";
	        var downloadURL = docServerUrl+"?media="+mediaId+"&user="+userId+"&token="+authToken;
	        //	alert(downloadURL);
	        downloadFlag=true;
	        window.location = downloadURL;
	    }
        var enableHotSpot = false;
        var imageMediaArray = new Array();
		var twoDMediaArray = new Array();
		var threeDMediaArray = new Array();
		var documentArray = new Array();
		 <c:forEach items="${fullItemDetails.mediaList}" var="catalogMedia">

			if(${catalogMedia.mediaType} == 1){
				imageMediaArray.push(${catalogMedia.mediaId});
			}else if(${catalogMedia.mediaType} == 2){
				twoDMediaArray.push(${catalogMedia.mediaId});
			}else if(${catalogMedia.mediaType} == 3){
				threeDMediaArray.push(${catalogMedia.mediaId});
			}else if(${catalogMedia.mediaType} == 6){
				documentArray.push(${catalogMedia.mediaId});
			}
	  	</c:forEach>
		if(imageMediaArray.length === 0) {
			$(".differentViews >a#tab_1").addClass('click disabled');
		}
		if(twoDMediaArray.length === 0) {

				$(".differentViews >a#tab_2").addClass('click disabled');
				$(".differentViews > a#tab_2").css({'opacity':'0.4','cursor':'not-allowed'});
		}else{
			$(".differentViews > a#tab_2").attr( "href", "#tab_b");
			$(".differentViews > a#tab_2").removeClass("disabled");
		}
		if(threeDMediaArray.length === 0) {
				$(".differentViews > a#tab_3").addClass('click disabled');
				$(".differentViews > a#tab_3").css({'opacity':'0.4','cursor':'not-allowed'});
		}else if(threeDMediaArray.length == 1) {
				$('.carousel-control').hide();
				$(".differentViews > a#tab_3").attr( "href", "#tab_c");
				$(".differentViews > a#tab_3").removeClass("disabled");
		}else {
				$('.carousel-control').show();
				$(".differentViews > a#tab_3").attr( "href", "#tab_c");
				$(".differentViews > a#tab_3").removeClass("disabled");
		}
		if(documentArray.length === 0) {
				$(".differentViews > a#tab_6").addClass('click disabled');
				$(".differentViews > a#tab_6").css({'opacity':'0.4','cursor':'not-allowed'});
		}else{
			$(".differentViews > a#tab_6").attr( "href", "#tab_f");
			$(".differentViews > a#tab_6").removeClass("disabled");
		}

            $(document).ready(function() {
            	var pageHeight = $(window).height()-100;
            	$(".mediawrap").height(pageHeight);
            	 $(".ordPara").hide();

            	//$(".close").text("x");
            	//alert("keyword - search"+keyword-search);
            	  /*BREAD - CRUMB ONCLICK EVENT*/
                  $('div.pageLoader').show();
            	  $("#breadcrumbsearch").click(function() {
            	  	document.forms[0].action="searchrequest";
            	  	document.forms[0].submit();
            	  });
            	var locale='${locale}';

				var hasRole_Cart=${hasROLE_CART};
				var hasRole_Order=${hasROLE_ORDER};


				 var itemId='${fullItemDetails.partId}';
				 var partNumber='${fullItemDetails.partNumber}';

				 var orgId='${fullItemDetails.organizationId}';


       			valueHideOrShow = ${hideOrShowFields};
   				ordMult = parseFloat('${fullItemDetails.orderMultiple}');

   		    	$(".order-multiples-lbl").html("<spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>"+ordMult);

   		        if (valueHideOrShow["show.order.multiples"] == "TRUE"){
   		    	 	$(".order-multiples-lbl").show();
   		        }else{$(".order-multiples-lbl").hide();
   		        }
   				$('.spinner-control').attr('data-ordermultiplekey',ordMult);
				 //alert('Am a'+ordMult);
					$('#quantity').val(ordMult);

					var showNonValue='${showNonValue}';
					if(showNonValue =='true' || showNonValue =='TRUE'){
						$(".nonetext").show();
					}else{
						$(".nonetext").hide();
					}
				 
				 $.ajax({
          			type : "Get",
          			data :{itemId: itemId,partNumber: partNumber,orgId:orgId},
          			contentType: 'application/json',
 			        mimeType: 'application/json',
          			url:'loaditempricedetails',
          			cache:false,
          			success:function(response){
          				//console.log(response);
          				console.log(response.inventoryMessage);
          				$('.fullItemDetailsViewer3d #ps_conf_view3d_iframe').find('.container').css('height','80% !important');
          				$('.viewerBox').css('height','80% !important');

 						if(response.priceNotShown){
 							$("#price-sm,#price").text("<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>").parent().removeClass('price-loader');
							$("#msrp-sm,#msrp,#youSave,#youSave-sm").parent().hide();
						}else{

 							if(response.inventoryMessage!= ''){
 								$('.b-label').find('div > strong').text(response.inventoryMessage);
 							}

 							$('#msrp, #msrp-sm').parent().removeClass('price-loader');

 	          				if(response.msrpStr!= "-1" && response.msrpStr!=response.priceStr){
 	          					$('#msrp, #msrp-sm').text(response.msrpStr+" "+response.currencyCode).parent().show();
 	          				}else{
 	          					$('#msrp, #msrp-sm').parent().hide();
 	          				}

 	          				$('#price, #price-sm').parent().removeClass('price-loader');
 	 						if(response.priceStr!=-1){
 	 							$('#price, #price-sm').text(response.priceStr+" "+response.currencyCode).parent().show();
 	          				}else{
 	          					$('#price, #price-sm').parent().hide();
 	          				}

 	 						$('#youSave, #youSave-sm').parent().removeClass('price-loader');
 	 						if(response.savedPriceStr != "-1" && response.msrpStr!=response.priceStr){
 	 							$('#youSave, #youSave-sm').text(response.savedPriceStr+" "+response.currencyCode+" "+' <spring:message code='lable.item.each' javaScriptEscape='true'/>').parent().show();
 	 						}else{
 	 							$('#youSave, #youSave-sm').parent().hide();
 	 						}
 	 						var isOrderable=${fullItemDetails.isOrderable};
 	 						var canPlaceOrderPOCC=${fullItemDetails.canPlaceOrderPOCC};
 	 						if(hasRole_Cart){
 	 							if(isOrderable){
 	 								$('.visible-sm .btn-addtocart,.hidden-sm .btn-addtocart').each(function(){
 	 								if($(this).attr('id')==="addtocart-click"){
 	 									$(this).removeClass('not-active');
 	 								}
	 	 						});
	 	 						if(hasRole_Order && canPlaceOrderPOCC){

 									$('.visible-sm .btn-addtocart,.hidden-sm .btn-addtocart').each(function(){
 										if($(this).attr('id')==="buynow-click"){
 										$(this).removeClass('not-active');
 										}
 									});

	 	 							}
 	 							}
 	 						}

							$('.spinner-control').removeClass('not-active');
 						}

          			},
          			error:function(xhr,status,erro){
          				console.log(status);
          				//20-01-2016  5.5.1.0_EH_ajax_error_msg.
          				//$('#msrp, #msrp-sm').parent().hide(); //GS-3180 ashwini_kamath stabilization_bug release
          				$('#msrp-sm,#msrp').parent().hide();
          				$('#youSave, #youSave-sm').parent().hide();
          				$("#price, #price-sm").text("<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>").parent().removeClass('price-loader');

          			}
          		});

                $(".differentViews > a").click(function(){
                    $(".zoomOption > div.pull-right > button,.zoomOption1 > div.pull-right > button").removeClass("button-border");
                    var id = $(this).attr("id");

                    if(id == "tab_1"){
                        $(".differentViews > a").css("background","");
                    }else if(id =="tab_2"){
                        $(".differentViews > a").css("background","");

                    }else if(id == "tab_3"){
                        $(".differentViews > a").css("background","");
                    }
                    else if(id == "tab_4"){
                        $(".differentViews > a").css("background","");
                    }
                    else if(id == "tab_5"){
                        $(".differentViews > a").css("background","");
                    }
                    else{
                        $(".differentViews > a").css("background","");
                    }
                    $(".zoomOption1>button, .zoomOption>button").removeClass("button-border");

                });
                 $('.differentViews a').on('click', function(e){
                    if($(this).hasClass("disabled")){
                    e.preventDefault();
                   }
               });
               $(".zoomOption > div.pull-right > button").on("click", function() {
                  $(".zoomOption > div.pull-right > button").removeClass("button-border");
                  $(this).addClass("button-border");
                });
               $(".zoomOption1 > div.pull-right > button").on("click", function() {
                    $(".zoomOption1 > div.pull-right > button").removeClass("button-border");
                    $(this).addClass("button-border");
                });

               var shopForPartsFlag = '${shopForPartFlag}';
               var isSearch = false;
               var isQuoteOrder=false;

               var searchflag = ${searchflag};
               if(searchflag){
            	   $('div.pageLoader').show();
            	   var searchString = '${searchString}';
            	   var searchType = '${searchType}'

   				$('#keyword').val(searchString);
				$('#typedropdown').val(searchType);

				if($('#keyword').val() != ""){
                    $('a.clear-search').removeClass('hidden');
                  }

				$('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value='+$("#typedropdown").val()+']').text());

				 var previousURL = '${previousURL}';
			        var oldURL = document.referrer;
			        if(oldURL.indexOf('previousURL')!= -1){
						 if(oldURL.split('previousURL').length>0){
						 	oldURL = oldURL.split('previousURL=')[oldURL.split('previousURL').length-1];
						 }
					 }
			        if(previousURL !== '' && oldURL !== previousURL){
			        	oldURL = previousURL;
			        	$('#previousURL').val(oldURL);
			        }else{
			        	$('#previousURL').val(oldURL);
			        }

			        if(oldURL.indexOf("mymachine") != -1 ){
			        	$("#main-menu-list > li:nth-child(4)").addClass("active");
			        }else if(oldURL.indexOf("homepage") != -1 ){
			        	$("#main-menu-list > li:nth-child(1)").addClass("active");
			        	isSearch = true;
			        }else if(oldURL.indexOf("shopforparts") != -1 ){
			        	$("#main-menu-list > li:nth-child(2)").addClass("active");
			        }else if(oldURL.indexOf("getmydocuments") != -1 ){
			        	$("#main-menu-list > li:nth-child(5)").addClass("active");
			        }
			        else if(oldURL.indexOf("getorders") != -1 ){
			        	$("#main-menu-list > li:nth-child(6)").addClass("active");
			        }
			        else if(oldURL.indexOf("getquotes") != -1 ){
			        	$("#main-menu-list > li:nth-child(7)").addClass("active");
			        }
			        else if(oldURL.indexOf("userprofile?selectedOrganization=null&defaultTab=accountSetting&organizationTab=0") != -1 ){
			        	$("#main-menu-list > li:nth-child(8)").addClass("active");
			        }
			        else if(oldURL.indexOf("getshoppingdetails") != -1 ){
			        	$("#main-menu-list > li:nth-child(9)").addClass("active");
			        }
			        //Added on 16-10-2015 for Breadcrumbs issue from Promotions page
			        else if(oldURL.indexOf("getpromotionparts") != -1 ){
			        	$("#main-menu-list > li:nth-child(10)").addClass("active");
			        	var promotionString = oldURL.split("/");
			        	var promotionLink = promotionString[promotionString.length - 1];
			        	$("#main-menu-list > li:nth-child(10) a").attr("href",promotionLink);
			        }
			        else if((oldURL.indexOf("directorderbrand") != -1)){
			        	$("#idlink > li:nth-child(2)").addClass("active");
			        	document.getElementById('hdnQuoteOrder').value= "<spring:message code="tooltip.order.placeorder" javaScriptEscape='true'/>";
			        	isSearch = true;
			        	isQuoteOrder=true;
			        }
			        else if(oldURL.indexOf("directquotebrand") != -1 ){
			        	$("#idlink > li:nth-child(1)").addClass("active");
			        	document.getElementById('hdnQuoteOrder').value= "<spring:message code="label.footer.request.for.quote" javaScriptEscape='true'/>";
			        	isSearch = true;
			        	isQuoteOrder=true;
			        }
			        else if(oldURL.indexOf("directquoteinit") != -1 || (oldURL.indexOf("directorderinit") != -1)){
			        	isSearch = true;
// 			        	$("#main-menu-list > li:nth-child(10)").addClass("active");
			        }
			        else if((oldURL.indexOf("vieworder") != -1) || (oldURL.indexOf("editquoteinit"))){
			        	isSearch = true;
// 			        	$("#main-menu-list > li:nth-child(10)").addClass("active");
			        }

// 				        if($("#main-menu-list > li").hasClass("active")){
							console.log("Bread Crumb"+$("#main-menu-list > li.active").html());
							$(".breadcrumb").empty();
							$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
							if(!isSearch) {
								$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
							}
							if(isQuoteOrder){
								$(".breadcrumb > li:last-child()").after('<li><a href='+oldURL+'>'+document.getElementById('hdnQuoteOrder').value+'</li>');
							}
							$(".breadcrumb > li:last-child()").after('<li><a id="breadcrumbsearch"  onclick="breadCrumb()" href="#"><spring:message code="label.whereused.search" javaScriptEscape="true" /></a></li>');
							$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="quick.search.item" javaScriptEscape="true" />${fullItemDetails.partNumber}</li>');
				}


                else if(shopForPartsFlag){
            	 var searchString = "${shopForPartBreadCrumb}".toString();
            	 //searchString = searchString.replace(new RegExp(/'/g, 'g'), "\'");
            	 searchString = searchString.replace(/'/g, "\'");
            	                   //searchString = searchString+"_hasParts";
            	                   console.log("searchString----------"+searchString);
            	                   var stringSplit = searchString.toString().split(",");
            	                   console.log(stringSplit);
            	                   for(i=2;i<stringSplit.length;i++){
            	                    console.log(stringSplit[i]);
            	                    var name = stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
            	                    var catID = stringSplit[i].substring(stringSplit[i].indexOf("_")+1,stringSplit[i].length);
            	                    //alert(stringSplit[i]+"=="+name+"=="+catID)
            	                    $(".breadcrumb > li:last-child()").before('<li><a href="shopforparts?breadCrumFullItem='+catID+'">'+name+'</a></li>');
            	                   }
                }else{

					// Bread crumb for no search
					var isViewMachine = false;
					var soldMachineURL = "";
					 var previousURL = '${previousURL}';
					 var oldURL = document.referrer;
					 if(oldURL.indexOf('previousURL')!= -1){
						 if(oldURL.split('previousURL').length>0){
						 	oldURL = oldURL.split('previousURL=')[oldURL.split('previousURL').length-1];
						 }

					 }
				    	var breadcrumbsArray = '${breadcrumbsArray}';
				    	$('#breadcrumbsArray').val(breadcrumbsArray);
						if(null !='${breadcrumbsArray}' && '${breadcrumbsArray}' != '' ){
					          var stringSplit = breadcrumbsArray.toString().split(",");
					          $(".breadcrumb").empty();
					          console.log(stringSplit);
					          for(i=0;i<stringSplit.length;i++){
					           console.log(stringSplit[i]);
					           if(stringSplit[i].indexOf('_') > 0){
					           		var name = stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
					           		var hrefLink = stringSplit[i].substring(stringSplit[i].indexOf("_")+1,stringSplit[i].length);
					           		if(i==0){
					           			$(".breadcrumb").append('<li><a href="'+hrefLink+'">'+name+'</a></li>');
					           		}else{
					           			$(".breadcrumb > li:last-child()").after('<li><a href="'+hrefLink+'">'+name+'</a></li>');
					           		}
					           }else{
					        	   $(".breadcrumb > li:last-child()").after('<li>'+stringSplit[i]+'</li>');
					        	   $(".breadcrumb > li:last-child()").addClass("active");
					           }
					          }
						}else {
					        if(previousURL !== '' && oldURL !== previousURL){
					        	oldURL = previousURL;
					        	$('#previousURL').val(oldURL);
					        }else{
					        	$('#previousURL').val(oldURL);
					        }

					        if(oldURL.indexOf("mymachine") != -1 ){
					        	$("#main-menu-list > li:nth-child(4)").addClass("active");
					        }else if(oldURL.indexOf("homepage") != -1 ){
					        	$("#main-menu-list > li:nth-child(1)").addClass("active");
					        }else if(oldURL.indexOf("shopforparts") != -1 ){
					        	$("#main-menu-list > li:nth-child(2)").addClass("active");
					        }else if(oldURL.indexOf("getmydocuments") != -1 ){
					        	$("#main-menu-list > li:nth-child(5)").addClass("active");
					        }
					        else if(oldURL.indexOf("getorders") != -1 ){
					        	$("#main-menu-list > li:nth-child(6)").addClass("active");
					        }
					        else if(oldURL.indexOf("getquotes") != -1 ){
					        	$("#main-menu-list > li:nth-child(7)").addClass("active");
					        }
					        else if(oldURL.indexOf("userprofile?selectedOrganization=1&defaultTab=accountSetting&organizationTab=0") != -1 ){
					        	$("#main-menu-list > li:nth-child(8)").addClass("active");
					        }
					        else if(oldURL.indexOf("getshoppingdetails") != -1 ){
					        	$("#main-menu-list > li:nth-child(9)").addClass("active");
					        }
					        //Added on 16-10-2015 for Breadcrumbs issue from Promotions page
					        else if(oldURL.indexOf("getpromotionparts") != -1 ){
					        	$("#main-menu-list > li:nth-child(10)").addClass("active");
					        	var promotionString = oldURL.split("/");
					        	var promotionLink = promotionString[promotionString.length - 1];
					        	$("#main-menu-list > li:nth-child(10) a").attr("href",promotionLink);
					        }
						}
				        if($("#main-menu-list > li").hasClass("active")){
							console.log("Bread Crumb"+$("#main-menu-list > li.active").html());
							$(".breadcrumb").empty();
							$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
							$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
							if(isViewMachine) {
								$(".breadcrumb > li:last-child()").after('<li><a href="'+soldMachineURL+'">'+oldURL.substring(oldURL.lastIndexOf("=") + 1, oldURL.length)+'</li>');
							}
							$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="quick.search.item" javaScriptEscape="true" /> ${fullItemDetails.partNumber}</li>');
						}
					/* $("#headerName").append('<li><a href="home"><spring:message code="lable.home"/></a></li> '+
	                        '<li><a href="#"><spring:message code="lable.item.shopForParts"/></a></li> '+
	                        '<li><a href="#"><spring:message code="lable.item.capacityParts"/></a></li> '+
	                        '<li><a href="#">${category}</a></li> '+
	                        '<li class="active"><spring:message code="shipment.label.item.no"/>${fullItemDetails.partNumber}</li>' ); */
				}
               $("#imageview-zoomin").on("click",function(){
                   var scaleToAdd = 0.8;
                   $("#imageIdCatWeb").smartZoom("zoom", scaleToAdd);
               });
               $("#imageview-zoomout").on("click",function(){
                    var scaleToOut = -0.8;
                   $("#imageIdCatWeb").smartZoom("zoom", scaleToOut);
               });

               // buy now click
               $('#buynow-click, button[data-btn-type="addtocart"]').on('click', function(e){
                    if($(this).hasClass("not-active")){
                        return false;
            }
            else{
            	   e.preventDefault();
            	   var organizationId=${fullItemDetails.organizationId};
            	   var partId=${fullItemDetails.partId};
            	   var quantity = $('#quantity').val();

            	   var partPrice = $('#price-sm').html();

             	   if(partPrice == null || partPrice == '' || partPrice.indexOf("-1")==0)
             		   partPrice = $('#msrp-sm').html();

             	   var idxOfCurrency =  partPrice.indexOf(" ");
             	   if(idxOfCurrency!=null || idxOfCurrency!=-1)
             		  partPrice = partPrice.substring(0, idxOfCurrency);

			       var phrase ="";

			    	$('#breadcrumbsArray').val(breadcrumbsArray);
					if(null !='${breadcrumbsArray}' && '${breadcrumbsArray}' != '' ){
						phrase = formBreadcrumbsArray();
					}
            	   $('div.pageLoader').show();
            	   $.ajax({
         	          type : "Get",
         	          /* data : "cartItemId=" + cartItemId, */
         	          data : {organizationId: organizationId},
         	          contentType: 'application/json',
         	          mimeType: 'application/json',
         	          url : "isdivisionmapped",
         	          cache : false,
         	          success : function(response) {
         	          $('div.pageLoader').hide();         	         
         	       	  if(phrase!= "")
         	       		displayPrompt('directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&partPrice='+partPrice+'&previousURL='+$('#previousURL').val()+'&breadcrumbsArray='+phrase.toString().replace(new RegExp('#', 'g'), '%23'));/* Edited by Pujith for GPD-10. Reviewed by Krupa */
         	          else
         	        	 displayPrompt('directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&partPrice='+partPrice+'&previousURL='+$('#previousURL').val());/* Edited by Pujith for GPD-10. Reviewed by Krupa */
         	          },
         	          error : function(e) {
         	        	  $('div.pageLoader').hide();
         	          }
         	       
                 });

                }
               });

              $("#viewer3dDiv").css({'height':550+'px'});
               $('div.pageLoader').hide();
           });

        	console.log("----"+$('.breadcrumbs-list ul li a').size());
        	var isFacetSearch = "${isFacetSearch}";
        	if(!isFacetSearch){
            	History.pushState({state: $('.breadcrumbs-list ul li a').size()}, '${properties['global.page.title']}',"./"+History.getState().url.split('web/')[1]+"&state="+$('.breadcrumbs-list ul li a').size());        		
        	}
				var manualStateChange = true;
				History.Adapter.bind(window,'statechange',function(){
					manualStateChange = false;
               	var x = document.referrer.split("/");
               	if(x[x.length-1] == "searchrequest" || ${searchflag}){
               		var searchString = '${searchString}';
               		var searchType = '${searchType}';
               		document.forms[0].action="searchrequest?keyword="+searchString+"&typedropdown="+searchType;
               		document.forms[0].submit();
               	}else if(x[x.length-1] == "getInvoiceDetails"){ <!-- Fix for OM-1291 -->
               		document.forms[0].action="javascript:getInvoiceDetails('${invoiceNumber}','${orderDate}')";
               		document.forms[0].submit();
               	}else if(x[x.length-1] == "getShipmentDetails"){<!-- Fix for OM-1291 -->
               		document.forms[0].action="javascript:getShipmentDetails('${shipmentNumber}')";
               		document.forms[0].submit();
               	}else{
               		window.history.go(-1);
               	}
               /* 	else if($('.breadcrumb li a:last').attr('onclick')!=undefined  && $('.breadcrumb li a:last').attr('onclick')!=null && $('.breadcrumb li a:last').attr('onclick')!=""){
               		$('.modal-body').text('Please use breadcrumb');
	    			$("#myModal").show();	
               	}
               	else if($('.breadcrumb li a:last').attr('href')!=undefined  && $('.breadcrumb li a:last').attr('href')!=null && $('.breadcrumb li a:last').attr('href')!=""){
					$('.modal-body').text('Please use breadcrumb');
	    			$("#myModal").show();	
		 			} */
               }); 

            function formBreadcrumbsArray(){
			   var itemCategory=$("#headerName").text();
			   var phrase="";

			   $('.breadcrumb').find('li').each(function(){
			    var current = $(this);
			    var str = $(this).find('a').attr('href');
			    if(phrase=="" && str != null){
		             phrase = current.text()+"_"+str;
		        }else{
				    if(str != null){
				     phrase = phrase+","+current.text()+"_"+str;
				    }else{
				     var currentUrl = window.location.href.split("/")[window.location.href.split("/").length - 1].split("&breadcrumbsArray")[0];
				     phrase = phrase+","+ current.text();
				    }
			    }
			  });
			   return phrase;
        };
            $(".otherDetails #addtocart-click, #addtocart-click-sm").on("click",function(e){
            /*function addToCart(e){*/
            if($(this).hasClass("not-active")){
                        return false;
            }
            else{
            var userId=  $('#userId').val();
    	    var authToken =  $('#authToken').val();
            e.preventDefault();
            $('div.pageLoader').show();
            if($("#viewer3dDiv")[0]){
        		$("#viewer3dDiv").css({"visibility":"hidden"});
        	}
           	var quantity=document.getElementById("quantity").value;
           	 //alert(quantity);
           	var mediaId=${fullItemDetails.mediaId};
           	var partId=${fullItemDetails.partId};
           	var organizationId=${fullItemDetails.organizationId};
           	var partNumber= '${fullItemDetails.partNumber}';
            var jsonObject = {
            		price:'${fullItemDetails.price}',
            		msrp:'${fullItemDetails.msrp}',
            		uom:'${fullItemDetails.uom}',
            		currencyCode:'${fullItemDetails.currencyCode}',
            		priceStr:'${fullItemDetails.priceStr}',
            		msrpStr:'${fullItemDetails.msrpStr}',
            		savedPrice: '${fullItemDetails.savedPriceStr}'
            };

			var dataItemVal = null;
			if(quantity==1){
				dataItemVal=jsonObject;
			}
           	$.ajax({
					type : "POST",
					data : {
						partId : partId,
						mediaId : mediaId,
						quantity : quantity,
						organizationId : organizationId,
						dataItemVal : JSON.stringify(dataItemVal),
						isAddToCartFromBOM:false // INC-2438 Track BOM Catalog Usages (product - Milacron and REV), Changes done by Kameshwari, Reviewed by Jayakumar
					},
					url : "addtocart",
					success : function(response) {
						getShoppingCartCount();
						if (response == '') {
							 $('div.pageLoader').hide();
                             $(".cart-popover").css({"opacity": 1});
		    	        	 	$(".cart-popover").show().delay(2000).fadeOut(3000);
		    	        	 	if(mediaId==0){
		    	        	 		var popoverImg = $(".add-cartpopover-img").children().html();
		    	        	 		$(".cart-popover").find(".cart-popover-img").html(popoverImg);
		    	        	 	}else{
			    	        	 	$(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
										$(this).css("text-decoration","none");
									});
		    	        	 	}
		    	        	 	var msg="<spring:message code='label.export.item' javaScriptEscape='true'/>"+ " #" + partNumber +" <spring:message code='label.cart.add.error' javaScriptEscape='true'/>";
								$(".cart-popover").find(".cart-popover-title").text(msg);
						} else {
							//alert("Part is added to your cart...");
							var jsonResponse = JSON.parse(response);

							if(typeof jsonResponse.errorMessage=="undefined"){

							$('div.pageLoader').hide();
                             $(".cart-popover").css({"opacity": 1});
		    	        	 	$(".cart-popover").show().delay(2000).fadeOut(3000);
		    	        	 	if(mediaId==0){
		    	        	 		var popoverImg = $(".add-cartpopover-img").children().html();
		    	        	 		$(".cart-popover").find(".cart-popover-img").html(popoverImg);
		    	        	 	}
		    	        	 	else{
		    	        	 		$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userId+'&token='+authToken);
		    	        	 		//NREV-1511 fix starts
									if(jsonResponse.isActualImage == false){
										$(".waterMarkForCartPopOver").show();
									}
									//NREV-1511 fix ends
		    	        	 	}
		    	        	 	var msg="<spring:message code='label.export.item' javaScriptEscape='true'/>"+ " #" + partNumber +" <spring:message code='label.cart.add.success' javaScriptEscape='true'/>";
								$(".cart-popover").find(".cart-popover-title").text(msg);
							}
							else{
								$('div.pageLoader').hide();
	    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
	    		    			$("#myModal").show();
							}
						}
						if($("#viewer3dDiv")[0]){
			        		$("#viewer3dDiv").css({"visibility":"visible"});
			        	}
					},
					error : function(e) {
						 $('div.pageLoader').hide();
						 if($("#viewer3dDiv")[0]){
			        		$("#viewer3dDiv").css({"visibility":"visible"});
		        		}
						//alert('Error: ' + e);
					}
				});
           }
           });
		  initializeImage();
		  function fullItemRedirect(itemId){
			  var organizationId=${fullItemDetails.organizationId};
	    	  window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+organizationId;
	      }
		  $('.total-items.output').change(function(){
			  var itemQty=$(this).val();
	    	  if(itemQty==""){
	    			//$('.modal-body').text("<spring:message code='alert.cart.enter.qty' javaScriptEscape='true'/>");
	    			//$("#myModal").show();
	    			 $('.total-items.output').val(1);
	    		}
	    		else if(itemQty<=0){
	    			//$('.modal-body').text("<spring:message code='alert.cart.qty.notless.one' javaScriptEscape='true'/>");
	    			//$("#myModal").show();
	    			 $('.total-items.output').val(1);
	    		}else if(!(/^ *[0-9]+ *$/.test(itemQty)) == true){
	    			//$('.modal-body').text("<spring:message code='alert.cart.specialchar.not.allow' javaScriptEscape='true'/>");
	    			//$("#myModal").show();
	    			 //$('.total-items.output').val(1);
	    		}
		  });
		  $(".custom-close").click(function(){
			   $("#myModal").hide();
			});
		 //Support - MIL-196 -210116
		 var part3dLink = '${fullItemDetails.part3dModelLink}';
		 var catalogLink = '${fullItemDetails.catalogDocumentLink}';
		 if(part3dLink!="" || catalogLink!=""){
			$(".vertical-seperator").show();
		 }else{
			 $(".vertical-seperator").hide();
		 }

		  $(".part3dModel").click(function(){
		 		$("a#tab_3E").addClass('active').siblings().removeClass('active');
				$("a#tab_3E").removeClass('disabled');
				$("a#tab_3E").css({'opacity':'1','cursor':'pointer'});
				$("#fullitems-graphic-hldr").find('div#tab_g').addClass('active').siblings().removeClass('active');

				$(".noimg-hldr").hide();
				$('#ImgwhnNull').hide();
				$("#external3dDiv > iframe").attr('src',part3dLink);

		  });

		  $(".differentViews > a#tab_1,a#tab_2,a#tab_3,a#tab_4,a#tab_5,a#tab_6").click(function(){
			  $('.differentViews > a#tab_1,a#tab_2,a#tab_3,a#tab_4,a#tab_5,a#tab_6').removeClass('active');
			  $(this).addClass('active');
			  if(part3dLink!=""){
				  $(".differentViews > a#tab_3E").addClass('click disabled');
				  $(".differentViews > a#tab_3E").css({'opacity':'1','cursor':'pointer'});
			  } //NREV-1694 Added by Aniket -- for re-loading image after downloading manual
			  setTimeout(function(){
				  loadImageAgain();
			  }, 500); 
			  
		  });
		  
		  function loadImageAgain(){
			  if($('#tab_1').hasClass('active') && downloadFlag){
				  initializeImageReset();
				  downloadFlag=false;
			  }
		  }
		  //INC-1694 END
		  
		  
		  $("#enlargeModal .custom-close").click(function(){
			   $("#enlargeModal").hide();
			   $("#enlargeModal .custom-modal-body").empty();
			});
		  	function downloadLink(mediaId){
			  	currentView = "download";
			  	$('#msg3dArea p').css('visibility','hidden');
			  	if(downloadArray.length>0){
					var webPath = downloadArray[0];
					var imageSrc = document.getElementById("downloadIframe");
					imageSrc.src=webPath;
					return true;
				}else{
					e.preventDefault();
					return false;
				}
			};
 $(function(){
	 
	 var userId=  $('#userId').val(); 
	  	var authToken =  $('#authToken').val();
		//Marketing BANNER;
	 	mktBanner =  Systems.Classes.registerBanner;
	 	mktBanner.init('${properties['docserver.url']}', userId, authToken, "fullItems");
	 	mktBanner.clearall();
		
		$.ajax({
       type : "Get",
       data : { "productCategoryId" : "${param.productCategoryId}", "partId" : "${fullItemDetails.partId}", "status" : 0 } ,
       contentType: 'application/json',
       mimeType: 'application/json',
       url : "getXmlPathForCategoryAndPart",
       cache : false,
       success : function(response) {
     	  if( response.markettingBannersMedia.mediaId ){
     		  var xmlFileName = '${properties['docserver.url']}?media='+response.markettingBannersMedia.mediaId+'&thumbnail=true&user='+userId+'&token='+authToken;
     		  mktBanner.loadBanner(xmlFileName);
     	  }
       },  
  		error : function(e) {  
     	  $('div.pageLoader').hide();
   		}
		});
		
		//xmlFileName = "../htmls/mbxml/mb_512_en_US.xml";
	  	//mktBanner.loadBanner(xmlFileName);
		  //Fav Add Call
    $(document).on("click", ".no-fav-item", function(evt){
    //alert("sadfsadsad");
    var partId = $(this).parent().data('itemid');
    var mediaId = $(this).parent().data('mediaid');
    var organizationId = $(this).parent().data('orgid');
    
    addItemToFavListPage(partId, mediaId, 1,organizationId, evt);
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
 
  });
</script>
<style>
.animateCreatorContainer .animateCreatorBtnDiv {
	bottom: 15px;
}

.animateCreatorContainer .animateCreatorPosSpan {
	height: 35px !important;
}
</style>


</body>
</html>
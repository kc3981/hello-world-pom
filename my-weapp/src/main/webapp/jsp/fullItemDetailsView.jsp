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

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- Javascript Plugins -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
	defer type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.4/jquery.i18n.js?version=${properties['application.version']}"
	defer></script>

</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<input type="hidden" id="language_id_"
		value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
	<input type="hidden" name="sapInstallerLink"
		value="${properties['sap.installer.link']}" id="sapInstallerLink">
	<input type="hidden" name="threedVersionReq"
		value="${properties['threed.required.version']}" id="threedVersionReq">
	<input type='hidden' id='partNum' value='${fullItemDetails.partNumber}'>


	<form method="post">
		<input type="hidden" name="docServerUrl"
			value="${properties['docserver.url']}" id="docServerUrl"> <input
			type="hidden" name="sapInstalledUrl"
			value="${properties['sap.installer.link']}" id="sapInstalledUrl">

		<input type="hidden" name="mediaUrl"
			value="${properties['media.Url']}" id="mediaUrl"> <input
			type="hidden" name="required3DViewerVersionUrl"
			value="${properties['threed.required.version']}"
			id="required3DViewerVersionUrl">
		<!-- Main Wrapper having header,footer and content -->
		<div class="main-wrapper" id="full-item">
			<header>
				<div class="header-container">
					<div class="top-bar">
						<div class="col-lg-3 col-md-3 col-sm-2 col-xs-4 brand">
							<a href="${properties['default.landing.page']}"> <img
								id="headerlogo" src="${sessionScope.logo}" alt="">
							</a>

						</div>
					</div>
				</div>
			</header>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">


				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 column-paddings">
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
									<div>${fullItemDetails.brand}Part</div>
									<%-- <div><strong>${fullItemDetails.availableQuantity} <spring:message code="lable.item.inStock"/></strong></div> --%>
									<div>
										<strong>${fullItemDetails.inventoryMessage}</strong>
									</div>
								</div>
								<br />

							</div>
							<%--  <div class="nopadding fullitemdet mtop10">
                        <div class="spinner-control nopadding">
                          <input type="text" id="quantity" class="total-items output" value="1" style="width:40px;text-align:center">  
                          <div class="qty">  
                            <a href="javascript:void(0);" class="item-increment ">
                                <i class="fa fa-caret-up"></i>
                              </a>
                              <a href="javascript:void(0);" class="item-decrement ">
                                <i class="fa fa-caret-down"></i>
                              </a>
                          </div>
                        </div>
                        <span class="unit" style="left:66px;top: 130px;">${fullItemDetails.uom}</span>
                    </div> --%>
						</div>
						<div class="pull-right">

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
							<sec:authorize access="hasRole('ROLE_CART')">
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
							<sec:authorize access="hasRole('ROLE_CART')">
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
											<!--<sec:authorize access="!hasRole('ROLE_CREATE_DIRECT_ORDER')">
												<button
													class="btn btn-addtocart cart-large btn-size btn-buynow not-active"
													data-btn-type="addtocart" id="buynow-click" role="button">
													<spring:message code="lable.item.buyNow" />
												</button>
											</sec:authorize>-->
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
					<div id="fullitems-graphic-hldr"
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div
							class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pull-left nopadding">
							<h3>
								<spring:message code="lable.item.item" />
								# ${fullItemDetails.partNumber}
							</h3>
							<c:choose>
								<c:when test="${not empty fullItemDetails.catalogDocumentLink}">
									<div
										class="col-lg-9 col-md-9 col-sm-12 col-xs-12 column-paddings responsive-padding"
										id="catalog-page">
										<a href="${fullItemDetails.catalogDocumentLink}"
											target="_blank"
											class="btn btn-addtocart cart-small catalog-btn">Catalog
											Page</a>
									</div>
								</c:when>
							</c:choose>
						</div>
						<div
							class="col-lg-8 col-md-8 col-sm-8 col-xs-8 nav nav-pills differentViews pull-right nopadding">
							<a id="tab_1"
								title="<spring:message code="label.mymachine.image" />"
								class="active" data-toggle="pill" href="#tab_a"><i
								class="fa fa-picture-o"></i></a> <a id="tab_2" data-toggle="pill"
								title="<spring:message code="label.mymachine.twod" />"
								class="click disabled" onClick="initialize2d(null);"><i
								class="fa fa-table"></i></a>
							<c:choose>
								<c:when test="${not empty fullItemDetails.part3dModelLink}">
									<a id="tab_3" data-toggle="pill"
										title="<spring:message code="label.mymachine.threed" />"
										class="click " onClick="initialize3d();"><i
										class="fa fa-cube"></i></a>
								</c:when>
								<c:otherwise>
									<a id="tab_3" data-toggle="pill"
										title="<spring:message code="label.mymachine.threed" />"
										class="click disabled" onClick="initialize3d();"><i
										class="fa fa-cube"></i></a>
								</c:otherwise>
							</c:choose>
							<a id="tab_4" data-toggle="pill"
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
								<img id="imageIdCatWeb" />
								<div class="noimg-hldr col-md-12 text-center">
									<div class="no-image-text">
										<h3 id="noImgAvailable"></h3>
									</div>
								</div>
							</div>
							<div class="tab-pane row no-pad" id="tab_b">
								<!-- Content area for 2D part-->
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
												<!--  <img src="../images/2ddrawing.png" alt="img"> -->
												<!-- <img id='imageFullScreen' width='100%' height='600px'/> -->
											</div>
											<!--below for magnifier png/svg image-->
											<!--  <div name="large" class='item large belt '>
                                                <img src="../images/2ddrawing.png" alt="img">
                                            </div> -->
										</div>
										<!-- Controls -->
										<a class="left carousel-control" href="#carousel-2D"
											role="button" data-slide="prev">
											<div class="leftControl">
												<i class="fa fa-chevron-circle-left " id="prevSvg"
													onclick="loadPrevImage();"> </i> <span class="sr-only"
													id="prev"><spring:message code="lable.item.previous" /></span>
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

							</div>

							<div class="tab-pane" id="tab_c">
								<!-- Content area for 3D part-->
								<div id="viewer3dDiv" class='fullItemDetailsViewer3d'>
									<iframe src="${fullItemDetails.part3dModelLink}" width="100%;"
										height="490" frameborder="0" allowfullscreen></iframe>
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
															<a href="#"
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
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="otherDetails">
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
							<!--<c:choose>
								<c:when test="${not empty fullItemDetails.alternateParts}">
									<c:forEach items="${fullItemDetails.alternateParts}"
										var="alternateParts">
										<div class="row otherDetails-content">
											<h5
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">
												<spring:message code="lable.item.partNUmber" />
											</h5>
										</div>

										<div class="row otherDetails-content">
											<p
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${alternateParts.orderablePartId}</p>
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
							</c:choose>-->
							<c:choose>
								<c:when test="${not empty fullItemDetails.crossReferenceParts}">
									<c:forEach items="${fullItemDetails.crossReferenceParts}"
										var="crossReferencePart">


										<div class="row otherDetails-content">
											<p
												class=" col-lg-3 col-md-3 col-sm-3 col-xs-6 otherDetails-content">${crossReferencePart.crossRefNumber}</p>
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
								<div>${fullItemDetails.brand}Part</div>
								<%-- <div><strong>${fullItemDetails.availableQuantity} <spring:message code="lable.item.inStock"/></strong></div> --%>
								<div>
									<strong> <c:choose>
											<c:when test="${empty fullItemDetails.inventoryMessage}">
												<spring:message code="guest.inventory.msg" />
											</c:when>
											<c:otherwise>
					                       ${fullItemDetails.inventoryMessage}            
					                    </c:otherwise>
										</c:choose>
									</strong>
								</div>
							</div>
							<br />
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
							<!-- 
							<div class="nopadding fullitemdet mtop10">
								<div class="spinner-control nopadding not-active">
									<input type="text" id="quantity" class="total-items output"
										value="1" style="width: 40px; text-align: center">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment "> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement "> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>

								</div>
								<span class="unit" style="left: 65px;">${fullItemDetails.uom}</span>
							</div>
							 -->
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

			<!-- custome alert-->
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
		</div>
	</form>
	<sec:authorize access="hasRole('ROLE_CART')" var="hasROLE_CART" />
	<sec:authorize access="hasRole('ROLE_ORDER')" var="hasROLE_ORDER" />
	<sec:authorize access="hasRole('ROLE_CREATE_DIRECT_ORDER')"
		var="hasROLE_CREATE_DIRECT_ORDER" />

	<script type="text/javascript"
		src="../js/2d/browserdetection.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/2d/e-smart-zoom-jquery.min.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/2d/viewer2d.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/3d/viewer3d.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/3d/Loco.js?version=${properties['application.version']}" defer></script>
	<script type="text/javascript"
		src="../js/3d/dvl.js?version=${properties['application.version']}" defer></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script type="text/javascript">
      

        
        function downloadMedia(mediaId){			
	        var docserverUrl = $('#docserverUrl').val(); 				
	        var userId=  $('#userId').val(); 
	        var authToken =  $('#authToken').val(); 
//	        	alert("userId===" +userId+"authToken===" +authToken);
//	        	var authToken = "a432cb5baec20d0118360ca48292e4d06fd55429be09e67de64ab5fa01e9d91c";
	        var downloadURL = docServerUrl+"?media="+mediaId+"&user="+userId+"&token="+authToken;
	        //	alert(downloadURL);
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
            	
            	var locale='${locale}';
            	
            
            	
            	
			
            	var hasRole_Cart=${hasROLE_CART};
				var hasRole_Order=${hasROLE_ORDER};
				
				
				 var itemId='${fullItemDetails.partId}';
				 var partNumber='${fullItemDetails.partNumber}';
				 var orgId='${fullItemDetails.organizationId}';
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
 						if(response.priceNotShown){
 							$("#msrp-sm,#msrp").text("<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>").parent().removeClass('price-loader');
							$("#price-sm,#price,#youSave,#youSave-sm").parent().hide();
							//$("div.savePriceShowHide span.save-price").siblings("span").text("");
							//$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
							//var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
							//$("div.cart-item-info .stock-count").text(inventoryMsg);//set inventory Message text
 						}else{
 							
 							if(response.inventoryMessage!= ''){
 								$('.b-label').find('div > strong').text(response.inventoryMessage);
 							}
 							else{
 								$('.b-label').find('div > strong').text("<spring:message code="guest.inventory.msg" />");							
 							}
 							$('#msrp, #msrp-sm').parent().removeClass('price-loader');

 	          				if(response.msrpStr!= "-1"){
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
 	 						if(response.savedPriceStr != "-1"){
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
          				//Disable addtocart is not based on price and msrp --Ashwini
          				/* if(response.msrp!= -1 || response.price!= -1){
          					$('#addtocart-click,#buynow-click,.spinner-control').removeClass('not-active');
          				} */
          				
          				
                    	
                    	/* console.log(price+"...."+msrp+"...."+savePrice);
                    	if(msrp != "-1"){
                    		$(".msrpShowHide").show();
                    		$('.msrpShowHide img.loading').hide().siblings('#msrp').text(response.msrpStr+" "+response.currencyCode);
                        	$('#msrp-sm').text(response.msrpStr+" "+response.currencyCode);
        				}
        				else{
        					$(".msrpShowHide").parent().hide();
        				}
        				
        				if(price != "-1"){
        					$(".yourPrice").show();
        					$('.yourPrice img.loading').hide().siblings('#price').text(response.priceStr+" "+response.currencyCode);
        					$("#price-sm").text(response.priceStr+" "+response.currencyCode);
        				}
        				else{
        					$(".yourPrice").parent().hide();
        				}
        				
        				if(savePrice != "-1"){
        					$(".youSaveShowHide").show();
        					$('.youSaveShowHide img.loading').hide().siblings("#youSave").text(response.savedPrice+" "+response.savedPrice + ' <spring:message code='lable.item.each' javaScriptEscape='true'/>');
        	            	$("#youSave-sm").text(response.savedPrice+" "+response.savedPrice+ ' <spring:message code='lable.item.each' javaScriptEscape='true'/>');
        				}
        				else{
        					$(".youSaveShowHide").hide();
        				} */
          				
          				
          			},
          			error:function(xhr,status,erro){
          				console.log(status);
          				//20-01-2016  5.5.1.0_EH_ajax_error_msg.
          				//$('#msrp, #msrp-sm').parent().hide();
          				$('#price, #price-sm').parent().hide();
          				$('#youSave, #youSave-sm').parent().hide();
          				//alert("error");
          				$("#msrp-sm,#msrp").text("<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>").parent().removeClass('price-loader');
          				//$('.modal-body').text("<spring:message code='message.contact.customer.service' javaScriptEscape='true'/>");
		    			//$("#myModal").show();	
          			}
          		});
            	
            	
                //$(".differentViews > a#tab_1").css("background","url(../images/part2D-hover-sprites.png)no-repeat 0px 0px");
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
            	   
            	   /* var previousURL = '${previousURL}';
			        var oldURL = document.referrer;
			         if(previousURL !== '' && oldURL !== previousURL){
			        	oldURL = previousURL;
			        	$('#previousURL').val(oldURL);
			        }else{
			        	$('#previousURL').val(oldURL);
			        } */
			      // var phrase = BreadcrumbsArray(previousURL, oldURL);
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
         	        	 		window.location.href = 'directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&previousURL='+$('#previousURL').val();//+'&breadcrumbArray='+phrase;
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
           
		  initializeImage();	
		  $(".custom-close").click(function(){
			   $("#myModal").hide();
			});		  
        </script>
	<!--    TODO: Below chat code to be removed 
		<script type="text/javascript">
		  var hotspotType= '${hotspotType}';
		  
		  /*SUPPORT MIL-215 210116*/ 
	        (function() {
	            var s = document.createElement("script");
	            s.type = "text/javascript";
	            s.async = true;
	            s.src = '//api.usersnap.com/load/'+'${properties['usersnap.api.key']}';
	            var x = document.getElementsByTagName('script')[0];
	            x.parentNode.insertBefore(s, x);
	            })();
		 
		</script>
           -->


</body>
</html>
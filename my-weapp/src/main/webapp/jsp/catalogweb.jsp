<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<meta name="author" content="www.frebsite.nl" />
<meta name="viewport" id="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=0">


<script type="text/javascript">
	<c:set var="version" value="${properties['application.version']}"/>
</script>
<script src="../js/chat.js" type="text/javascript" defer> </script>
<title>${properties['global.page.title']}</title>
<jsp:include page="googleAnalytics.jsp" />
<!-- CSS -->

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
<link type="text/css" rel="stylesheet"
	href="../css/jquery.mmenu.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css"
	href="../css/theme.css?version=${properties['application.version']}">

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
<!-- Added to find the application version -->


<script src="../js/less.min.js?version=${properties['application.version']}" defer></script>
</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<form method="post">
		<input type="text" id="assembly" value="${assembly}" hidden> <input
			type="hidden" name="docServerUrl"
			value="${properties['docserver.url']}" id="docServerUrl"> <input
			type="hidden" name="sapInstalledUrl"
			value="${properties['sap.installer.link']}" id="sapInstalledUrl">
		<input type="hidden" name="required3DViewerVersionUrl"
			value="${properties['threed.required.version']}"
			id="required3DViewerVersionUrl"> <input type="hidden"
			id="userId"
			value="<sec:authentication property='principal.id'></sec:authentication>">
		<input type="hidden" id="authToken"
			value="<sec:authentication property='principal.authToken'></sec:authentication>">
		<input type="hidden" id="descriptionSearchPlaceholder"
			value="<spring:message code="label.catalog.search.vendorparts.description" />">
		<input type="hidden" id="partNumberPlaceholder"
			value="<spring:message code="label.search.parts.minimum" />">
		<input type='hidden' id="where-used" value='${whereUsed}'> <input
			type='hidden' id="origin-from" value='${originFrom}'> <input
			type='hidden' id="part_id" name="part_id" value='${partId}'> <input
			type='hidden' id='partNum' value='${partNumber}'> <input
			type='hidden' id="assemblyUsed" value='${assemblyUsed}'>
		<input type='hidden' id="childrenIdList" name="childrenIdList"  value="">
		<input type='hidden' id="childCatalogName" value='${childCatalogName}'>
		<input type='hidden' id="catalogMediaExistsModel" value='${catalogMediaExists}'>
		<input
			type="hidden" name="userApplication"
			value="${properties['user.application']}" id="userApplication">
		<nav id="menu">
			<div class="catalog-header" style="text-align: center;">
				<a href="homepage"><img src="${properties['base.url']}/${organizationLogo}"></a>
			</div>
			<div class="catalog-details">
				<h5 id="name"></h5>
				<span class="machine_titles" id="commDescription"></span> <span
					class="machine_titles" id="model"></span> <span
					class="machine_titles" id="customerName"></span> <span
					class="machine_titles" id="vendor"></span> <span
					class="machine_titles" id="jobId"></span> <span
					class="machine_titles" id="retrofitlbl"></span>
			</div>
			<div class="col-xs-12 tree_paddleft">
				<div class="input-group">
					<input class="form-control searchtree" id="searchtree"
						type="search" onblur="validateMessage()" /> <span
						class="glyphicon search-ico-bg search-tree" id="search-tree"><i
						class="search-glass-ico"></i></span>
				</div>
				<span id="treeError"><spring:message
						code="label.catalogweb.record.not.found" /></span>
			</div>
			<div id="treemachine-catalog" class="treeview-hldr"></div>
			<div class="catalog-footer treelegends">
				<label for="" class="legends"><span class="retrofit"></span>
					<spring:message code="label.catalogweb.retrofit" /></label> <label for=""
					class="legends"><span class="two-dimen-media"></span> <spring:message
						code="label.catalogweb.media.2D" /></label> <label for="" class="legends"><span
					class="three-dimen-media"></span> <spring:message
						code="label.catalogweb.media.3D" /></label>
			</div>
		</nav>
		<div class="catalogweb-hldr" id="page">
			<div class="header Fixed">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<a class="menu_slide" href="javascript:void(0);"
						title='<spring:message code="label.termsandconditions.text.expand"/>'></a>
					<div class="menu_tab">
						<a href="homepage" class="home_img"
							title='<spring:message code="label.footer.home"/>'></a>
						<c:choose>
							<c:when test="${properties['facetSearch.required']}">
								<a href="machinecentre" class="machine_img"
									title='<spring:message code="label.my.machines"/>'></a>
							</c:when>
							<c:otherwise>
								<a href="mymachine?sortSelect=catalogName" class="machine_img"
									title='<spring:message code="label.my.machines"/>'></a>
							</c:otherwise>
						</c:choose>

						<c:if test="${serialInfoFlag}">
							<a href="#serial_info" class="serial_info"
								title="Major unit serials"><i
								class="fa fa-info-circle hidden-xs"></i></a>
						</c:if>
						<a href="getshoppingdetails" class="cart_img"
							title='<spring:message code="label.header.cart"/>'
							><span
							class="badge cartItemCount"
							></span></a>
						<c:if test="${hasIdexPart}">
							<a href="${properties['external.idex.link']}" target="_blank" class="idex_link" title="IDEX link"></a>
						</c:if>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 media-panel">
					<div class="nav nav-pills  pull-right mediacontrols">
						<a href="#tab_a" id="tab_1" class="active" data-toggle="pill"
							title='<spring:message code="label.mymachine.image"/>'><i
							class="fa fa-picture-o fa-2x"></i></a> <a href="#tab_b" id="tab_2"
							data-toggle="pill"
							title='<spring:message code="label.mymachine.twod"/>'><i
							class="fa fa-table fa-2x"></i></a> <a href="#tab_c" id="tab_3"
							data-toggle="pill"
							title='<spring:message code="label.mymachine.threed"/>'><i
							class="fa fa-cube fa-2x"></i></a> <a id="tab_4"
							class="click disabled inactive" data-toggle="pill"
							title='<spring:message code="label.mymachine.audio"/>'><i
							class="fa fa-headphones fa-2x"></i></a> <a id="tab_5"
							class="click disabled inactive" data-toggle="pill"
							title='<spring:message code="label.mymachine.video"/>'><i
							class="fa fa-play-circle-o fa-2x"></i></a> <a href="#tab_f"
							id="tab_6" data-toggle="pill"
							title='<spring:message code="label.header.document"/>'><i
							class="fa fa-folder-open-o fa-2x"></i></a>
					</div>
				</div>
			</div>
			<!-- content wrapper for the current page contents -->
			<div id="fullitemsMediaContainer" class="container-fluid mediawrap">
				<div id="fullitems-graphic-hldr">
					<div class="tab-content">
						<div class="tab-pane active row no-pad" id="tab_a">
							<!-- Content area for image part-->
							<div class="btn-group-vertical zoomOption1" role="group">
								<button id="imageview-zoomin" value="zoom-in"
									title='<spring:message code="label.mymachine.zoom.in"/>'
									type="button" class="btn btn-default">
									<span class="zoomin" aria-hidden="true"></span>
								</button>
								<button id="imageview-zoomout" value="zoom-out"
									title='<spring:message code="label.mymachine.zoom.out"/>'
									type="button" class="btn btn-default">
									<span class="zoomout" aria-hidden="true"></span>
								</button>
								<button id="resetImage" type="button" class="btn btn-default"
									title='<spring:message code="label.quote.order.reset"/>'>
									<span class="refresh" aria-hidden="true"></span>
								</button>
							</div>
							<div id="imageviewre-hldr">
								<img id="imageIdCatWeb" class="catalogweb-ref" />
								<div class="noimg-hldr col-md-12 text-center">
									<div class="no-image-text">
										<h3 id="noImgAvailable"></h3>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane row no-pad" id="tab_b">
							<!-- Content area for 2D part-->
							<div class="btn-group-vertical zoomOption viewer_options "
								role="group">
								<button id="pan1" type="button" class="btn btn-default"
									title='<spring:message code="label.mymachine.pan"/>'>
									<span class="fa fa-arrows" aria-hidden="true"></span>
								</button>
								<button id="zoom-in" type="button" class="btn btn-default"
									title='<spring:message code="label.mymachine.zoom.in"/>'>
									<span class="fa fa-search-plus" aria-hidden="true"></span>
								</button>
								<button id="zoom-out" type="button" class="btn btn-default"
									title='<spring:message code="label.mymachine.zoom.out"/>'>
									<span class="fa fa-search-minus" aria-hidden="true"></span>
								</button>
								<button id="reset" type="button" class="btn btn-default"
									title='<spring:message code="label.quote.order.reset"/>'>
									<span class="fa fa-refresh" aria-hidden="true"></span>
								</button>
							</div>
							<div class="cCarousel">
								<div id="carousel-2D" class="carousel slide"
									data-ride="carousel" data-interval="false">
									<!-- Carousel for 2D part-->
									<!-- Indicators -->
									<!-- <ol class="carousel-indicators">
									<li data-target="#carousel-2D" data-slide-to="0" class="active"></li>
									<li data-target="#carousel-2D" data-slide-to="1"></li>
									<li data-target="#carousel-2D" data-slide-to="2"></li>
								</ol> -->
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
												onclick="loadPrevImage()"> </i> <span class="sr-only"
												id="prev"><spring:message
													code="label.homepage.previous" /></span>
										</div>
									</a> <a class="right carousel-control" href="#carousel-2D"
										role="button" data-slide="next">
										<div class="rightControl">
											<i class="fa fa-chevron-circle-right  glyphiconcolor"
												id="nextSvg" onclick="loadNxtImage()"></i> <span
												class="sr-only" id="next"><spring:message
													code="label.homepage.next" /></span>
										</div>
									</a>
								</div>
								<!-- Carousel end for 2D part-->
							</div>
						</div>
						<div class="tab-pane" id="tab_c">
							<!-- Content area for 3D part-->
							<div id="viewer3dDiv" class="viewer3dDiv"></div>
							<div class="noimg-hldr col-md-12 text-center">
								<div class="no-image-text">
									<h3>
										<spring:message code="label.catalogweb.view.3D.not.support" />
									</h3>
								</div>
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
							<div class="row pdfPart mtop10" id="docPart"></div>
						</div>
						<!-- Machine Catalog Serial Information-->

					</div>
				</div>
			</div>
			<div id="catalogBOM" class="section_datatable">
				<div class="data_tables_title">
					<span><spring:message code="label.catalogweb.materials.bill" /></span>

					<a class="pull-right hide_bom" id="hide_bom" type="submit"
						title='<spring:message code="label.bom.show.hide"/>'> <img
						src="../images/hide_bom.png" alt="hide_bom"
						title='<spring:message code="label.bom.show.hide"/>'>
					</a>

					<!-- Added the code on behalf of the INC - 2131 -->

					<button id="exportpdf" class="btn pull-right export_btn"
						type="button">
						<img src="../images/download-icon.png" alt="export_pdf" />
						<spring:message code="lable.download" />
					</button>
				</div>
				<div id="datatable-container" style="padding: 0 2px;">
					<div class="row-fluid">
						<div class="table-paddings">
							<table id="datatable-list" class="table display table-striped"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th><spring:message code="label.export.item" /></th>
										<th><spring:message code="label.catalogweb.part" /></th>
										<th id="legacyNumber"><spring:message code="label.catalogweb.legacy.part" /></th>
										<sec:authorize access="hasRole('ROLE_VENDOR_PART')">
											<th><spring:message code="label.catalogweb.vendor.part" /></th>
										</sec:authorize>
										<th><spring:message code="lable.action" /></th>
										<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
											<th><spring:message
													code="label.export.engineeringdescription" /></th>
										</sec:authorize>
										<th><spring:message code="label.export.description" /></th>
										<th><spring:message code="report.label.quantity" /></th>
										<th><spring:message code="label.export.uom" /></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<div id="msg3dArea" style="visibility: visible">
					<p id="msgA">&nbsp;</p>
				</div>
			</div>

		</div>
		<!-- custome alert -->
		<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false"
			style="z-index: 2147483647;">
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

		<input type="hidden" id="language_id_"
			value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
			<sec:authorize access="hasRole('ROLE_AVAILABILITY')"> <input type="hidden" name="hasRoleAvailability" id="hasRoleAvailability" value="true"/> </sec:authorize>
		<script>
		// NREV-1265 ADDED BY ANIKET : REVIEWED BY JK
		var hotspotType= '${hotspotType}';
		var customermsg = "<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>";
		var guestpricemsg = "<spring:message code="guest.price.msg" javaScriptEscape='true'/>";
		var processing_msg = "<spring:message code='label.processing'/>...";
    	var lengthMenu_msg = "<spring:message code='search.resultsperpage'/> _MENU_";
		var search_msg = "<span class='alignSearch'><spring:message code='label.whereused.search'/><br/></span>";
	    var loadingRecords_msg =  "<spring:message code='label.footer.loading'/>...";
	    var zeroRecords_msg = "<spring:message code='label.catalogweb.record.not.found'/>";
	    var emptyTable_msg = "<spring:message code='label.results.nodata'/>";
	    var first_page_msg = "<spring:message code='label.pagnation.first'/>";
	    var previous_page_msg = "<";
	    var next_page_msg = ">";
	    var last_page_msg = "<spring:message code='label.pagnation.last'/>";
	    var retrofitmsg = "<spring:message code='lable.hasaftermarketitem'/>";
	    
	    function validateMessage(){
	    	var searchKey = $("#searchtree").val();
	    	var searchKeyLength = searchKey.length;
 	    	if (searchKeyLength == 0 && $('#car').css('treeError') != 'none') {
 	    	  		$('#treeError').hide();
	    	}
	   } 
	</script>
		<!-- Javascript Plugins -->
		<!-- TODO Need to recheck CDN Links -->
		<script src="../js/jquery.min.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script src="../js/bootstrap.min.js?version=${properties['application.version']}" defer
			type="text/javascript"></script>
		<script src="../js/jstree.min.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script src="../js/jquery-ui.min.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script src="../js/jquery.dataTables.min.js?version=${properties['application.version']}" defer
			type="text/javascript"></script>
		<script src="../js/dataTables.bootstrap.js?version=${properties['application.version']}" defer
			type="text/javascript"></script> 
		<script src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer
			type="text/javascript"></script>
		<script src="../js/less.min.js?version=${properties['application.version']}" defer></script>
		<script
			src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js" defer></script>
		<!-- Additional scripts -->

		<script src="../js/2d/browserdetection.js?version=${properties['application.version']}"
			defer type="text/javascript"></script>
		<script src="../js/2d/e-smart-zoom-jquery.min.js?version=${properties['application.version']}"
			defer type="text/javascript"></script>
		<script src="../js/2d/viewer2d.js?version=${properties['application.version']}"
			 type="text/javascript"></script>
		<script src="../js/3d/viewer3d.js?version=${properties['application.version']}"
			 type="text/javascript"></script>
		<script src="../js/scroll-into-view.js?version=${properties['application.version']}"
			defer type="text/javascript"></script>
<%-- 		<script type="text/javascript"
			src="../js/jquery.i18n.properties.js?version=${properties['application.version']}"></script> --%>

		<!-- MSRP Popup -->
		<div class="cart-popup-4grid" style="display: none;">
			<a href="#0" class="close-button"><i class="fa fa-times"></i></a>
			<h3>
				<span class="partNumber"></span>
			</h3>
			<div class="msrploader text-center">
				<img src="../images/msrpload.gif" width="35" />
			</div>
			<div class="msrp-container" style="display: none;">
				<!-- <p class="partsbrand"></p> -->
				<p class="inventoryMessage"></p>
				<p class="msrp"></p>
				<p class="your-price"></p>
				<p class="save-price"></p>
				<div class="spinner-control">
					<input type="text" style="width: 30px; text-align: center"
						value="1" class="total-items output">
					<div class="qty">
						<a class="item-increment" href="javascript:void(0);"> <i
							class="fa fa-caret-up"></i>
						</a> <a class="item-decrement" href="javascript:void(0);"> <i
							class="fa fa-caret-down"></i>
						</a>
					</div>
				</div>
				<sec:authorize access="hasRole('ROLE_CART')">
					<a href="javascript:void(0)"
						class="btn btn-primary quote-button theme-maroon btn-width"><spring:message
							code="lable.item.addToCart" /></a>
				</sec:authorize>
				<p></p>
				<div class="error-text"></div>
			</div>
		</div>
		<div class="pageLoader" style="display: none">
			<div class="loader-content">
				<h4>
					<spring:message code="label.footer.loading" />
					...
				</h4>
				<div class="loader"></div>
			</div>
		</div>
		<!-- Major unit serials -->
		<div class="container serial_info_content content"
			style="display: none;">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-3">
						Model<br> Series<br> Sale Date<br> Eng Mfg<br>
					</div>
					<div class="col-lg-5">
						: <span class="serial_model"></span><br> : <span
							class="serial_name"></span><br> : ${serialInfo.saleDate}<br>
						: ${serialInfo.engineMfg}<br>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-10">
						<h5>Major units serial</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-5">
						Engine Mfg<br> Engine Type<br> Engine Serial Number<br>
						Transmission Serial Number<br> Front Axle Mfg<br> Front
						Axle Serial Number<br> Rear Axle Mfg<br> Rear Axle
						Serial Number<br>
					</div>
					<div class="col-lg-7">
						: ${serialInfo.engineMfg}<br> : ${serialInfo.engineType}<br>
						: ${serialInfo.engineSerialNumber}<br> :
						${serialInfo.transmissionSerialNumber}<br> :
						${serialInfo.frontAxleMfg}<br> :
						${serialInfo.frontAxleSerialNumber}<br> :
						${serialInfo.rearAxleMfg}<br> :
						${serialInfo.rearAxleSerialNumber}<br>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="row"></div>
				<div class="row">
					<div class="col-lg-12">
						<img src="" class="img-thumbnail img-responsive"
							alt="Responsive image">
					</div>
				</div>
			</div>
		</div>
		<!-- NREV-885 fix starts -->
		<input type="hidden" name="keyword" id="keyword" /> <input
			type="hidden" name="typedropdown" id="typedropdown"
			value="${typeDropDown}" /> <input type="hidden"
			name="viewMachineCatalog" value="true" />
		<!-- NREV-885 fix ends -->
		<!-- Custom scripts -->
		<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
			<input type="hidden" name="viewEngDesc" id="viewEngDesc" value="true" />
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_VENDOR_PART')">
			<input type="hidden" name="viewVendorPart" id="viewVendorPart"
				value="true" />
		</sec:authorize>
		<input type="hidden" name="showOrHideLegacyPart" id="showOrHideLegacyPart"
				value="${properties['display.legacy.part']}" />
		<script src="../js/gensuite-ui.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<!-- 	Misplaced Script -->
		<script src="../js/errorHandler.js?version=${properties['application.version']}" type="text/javascript"></script>
		<script src="../js/cart-count.js?version=${properties['application.version']}" 
			type="text/javascript"></script>
		<script src="../js/machine-catalog.js?version=${properties['application.version']}" 
			type="text/javascript"></script>

		<script type="text/javascript">
		var hotspotType= '${hotspotType}';
	
  
  	/*SUPPORT MIL-215 210116*/ 
  	/*INC-1083 Hide usersnap in Production*/
        var flag='${properties['value.show.usersnap']}';
        
  		if(flag=="true"){
  		 (function() {
 	    	var s = document.createElement("script");
 	        s.type = "text/javascript";
 	        s.async = true;
 	        s.src = '//api.usersnap.com/load/'+'${properties['usersnap.api.key']}';
 	        var x = document.getElementsByTagName('script')[0];
 	        x.parentNode.insertBefore(s, x);
 	        })(); 		
  		}
		var catalogMediaExists = '${catalogMediaExists}';
		//catalogMediaExists = 'false';
		var mediadocURL = '${properties['docserver.url']}';
		if(catalogMediaExists === 'false'){
			$("#fullitemsMediaContainer").hide();
			$("#hide_bom").hide();
			$(".catalogweb-hldr .mediacontrols").hide();
			$("#datatable-container").height(this.height + $("#fullitemsMediaContainer").height());
		}
		$(function(){
			$(".serial_info").click(function(){
				 $(".serial_info_content").toggle();
			});
			//Load the image into serial information section
			var mediaId = '${mediaId}';
			var userId = $("#userId").val();
			var authtoken = $('#authToken').val();
			var imageAttr = '${properties['docserver.url']}?media=${mediaId}&thumbnail=true&user='+userId+'&token='+authtoken;
			$(".serial_info_content").children("div").find("img").attr('src',imageAttr);
		});
	    $(document).ready(function(){
	    	var showOrHideLegacy = '${properties['display.legacy.part']}';
	    	$("#searchtree").keyup(function() {

	    	    if (!this.value) {
	    	    	validateMessage();
	    	    }

	    	});
	    	//NREV-885 fix starts
			var previousUrl = History.getState().url;
			History.pushState({state: 1}, '${properties['global.page.title']}',"./"+History.getState().url.split('web/')[1]+"&state=23"); 
				var manualStateChange = true;
				History.Adapter.bind(window,'statechange',function(){
					manualStateChange = false;
		       	//alert("dfsaf");
		       	var x = previousUrl.split("/");
		       	if(x[x.length-1] == "searchrequest" || ${searchflag}){
		       		document.forms[0].action="searchrequest";
		       		$("#keyword").val($("#assembly").val().split('?')[0]);
	           		document.forms[0].submit();

		       	}else{
		       		//Fix for GSP-953 - Kameshwari
		       		history.go(-1);
		       	}
			//NREV-885 fix ends
	    });
	    }); 
	</script>
	</form>

</body>
</html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<jsp:include page="googleAnalytics.jsp" />

<!-- CSS -->
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
<link rel="stylesheet"
	href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">

<link rel="stylesheet" href="../css/simplePagination.css?version=${properties['application.version']}" />

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
.block-wrapper {
	clear: both;
	padding-left: 0;
	padding-right: 0;
}

.block>div:last-child {
	background: #f1f2f2;
	transition: transform 2s linear;
	border: 1px solid #d5d5d5;
	padding: 3px 10px;
	transform: translateY(0);
}

div.advanceFilter input.qty {
	float: none;
}

div.advanceFilter input[type="text"] {
	width: 60px;
	margin-right: 5px;
	border: 1px solid #aaa;
	padding: 2px;
	height: 26px;
}

::-webkit-input-placeholder {
	color: #ccc;
}

:-moz-placeholder { /* Firefox 18- */
	color: #ccc;
}

::-moz-placeholder { /* Firefox 19+ */
	color: #ccc;
}

:-ms-input-placeholder {
	color: #ccc;
}

.block
 
input
:not
 
(
.qty
 
){
width
:
 
130
px
 
!
important
;


}
div.advanceFilter {
	min-height: 50px;
}

div.advanceFilter input:first-child {
	margin-left: 0;
}

div.advanceFilter p {
	font-size: 12px;
}

.dropdown .btn {
	font-size: 14px;
}

div.advanceFilter>p:first-child {
	font-weight: bold;
	margin-right: 4px;
}

div.advanceFilter>p:first-child label {
	min-width: 80px;
	text-transform: capitalize !important;
}

div.advanceFilter .dropdown {
	min-width: 137px;
	width: 137px;
	margin: 0;
	color: #fff;
	display: inline-block;
}

div.advanceFilter .dropdown button {
	text-align: left;
	padding: 2px 10px;
	color: #000;
	font-weight: normal;
}

div.advanceFilter .dropdown button span {
	color: #fff;
}

.block .btn {
	min-width: 30px;
	padding: 6px 20px;
	height: 30px;
}

.block .btns {
	padding-right: 0;
	padding-left: 0;
	margin-top: 3px;
}

.block .btn-addtocart {
	margin-right: 6px;
}

.block>div:last-child p {
	display: block;
	margin: 0 0 4px;
}

.block>div:last-child p label {
	margin-bottom: 0;
}

.block div.col-sm-4, .block div.col-sm-8, .block .col-sm-12>div.col-sm-12
	{
	padding-right: 0;
	padding-left: 0;
}

.block select {
	width: auto;
	min-width: 15%;
	padding: 2px;
	border: 1px solid #aaa;
	height: 26px;
	margin-right: 5px;
}

.block .betweenSelect {
	width: auto;
}

.filter-text {
	font-size: 15px;
	font-weight: normal;
	text-decoration: underline;
	transition: all 1s linear;
	display: block !important;
	cursor: pointer;
}

.block h3 {
	margin-top: 0;
	margin-bottom: 0;
	background: #53585a;
	color: #fff;
	font-size: 13px;
	padding: 10px;
	font-weight: 700;
}

.block h3 span {
	cursor: pointer;
}

.block label {
	font-weight: normal;
}

.dropDown-icon {
	transform: rotate(-90deg);
	top: 0px;
}

#errorBlock {
	display: inline-block;
	color: red;
	margin-left: 5px;
	font-size: 13px;
}

.fa.fa-star.fav-item {
	font-size: 18px;
	color: #c52033;
	line-height: 30px;
	cursor: pointer;
}

.no-fav-item {
	color: #7b7b7b;
	cursor: pointer;
}

.custom-modal-body {
	padding: 2px 10px;
}



@media ( min-width : 300px) and (max-width: 991px) {
	.mob_cen {
		text-align: center;
	}
	a.no-image {
		overflow: hidden;
		word-break: break-all;
	}
}
@media ( min-width : 991px) {
	.spinner-control_mt {
		margin-top: 35px;
	}
}

@media ( min-width : 768px) and (max-width: 991px) {
	.spinner-control_mt {
		margin-top: 2px;
	}
}

.pl_xs {
	padding-left: 2em;
}


@media (min-width: 300px) and (max-width: 767px){
	#btn_filter_SFP{
		/* background-color: #c80000; */
	    position: fixed;
	    top: 154px;
	    z-index: 999;
	    left: -5px;
	    border-radius: 3px;
	}
	
	.xs_pad-left_27{
		  padding-left: 27px;
	}
	
	#btn_filter_SFP .fa {
		color:#FFFFFF;
		font-size:15px;
	}
}

#page-selection-top {
    margin-top: -6px;
    margin-bottom: 3px;
    float: right;
    padding: 0;
}

#page-selection{
	float: right;
    padding: 0;
}

#resultInfo.column-paddings {
	padding:0;
}

#resultInfo ul.pagination {
	margin-bottom: 0;
}


#marketing-pannel-accordion .panel-body {
	padding: 0;
}

#marketing-pannel-hldr {
	height: 150px;
	border: 1px solid #d5d5d5;
	overflow: hidden;
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
    padding: 2px;
    margin-top: 3px;
    width: 45px;
}
.main-img-list li:hover, .main-img-list li.active {
	border: 1px solid #c52033;
}
.main-img-list li img {
	max-width: 100%;
	max-height: 100%;
}
#marketing-pannel-hldr .nav-tabs {
	margin-top: 4px;
	background: #fbfbfb;
}
#marketing-pannel-hldr .nav-tabs>li.active
{
	max-width: 240px;
}
#marketing-pannel-hldr .nav-tabs>li>a {
	background: #f1f2f2;
	border: 1px solid #ddd;
	border-bottom: none;
	padding: 2px 12px;
	font-weight: 500;
	font-size: 12px;
	line-height: 1.5;
	max-width: 120px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
#marketing-pannel-hldr .nav-tabs>li.active>a {
    background: #444;
    font-size: 14px;
    color: #fff;
    font-weight: bold;
    padding: 1px 12px;
    max-width: none;
}
#marketing-pannel-hldr .nav-tabs>li.active>a:focus,
#marketing-pannel-hldr .nav-tabs>li.active>a:hover {
	/* background: #ffffff; */
	opacity: 1;
	border-radius: 4px 4px 0 0;
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

.pin-main-img {
	cursor: pointer;
	max-width: 100%;
	margin: 0 auto;
	padding-left:10px;
	padding-right:10px;
	border: 1px solid #fff;
}
.pin-main-img:hover{
	border: 1px solid #c52033;
}

#img-main-marketing:hover{
	border: 1px solid #c52033;
}

.main-img-holder {
	height: auto;
    overflow: hidden;
    text-align: center;
}

#enlargeModal .modal-header{
	border:none;
}

.tab-content {
	font-size: 10px;
}
.tab-pane > div{
	padding-top:0px;
	border: none;
}
.tab-content-box {
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

.tab-content-box li {
	font-size: 14px;
	line-height: 1.7;
	list-style-type: disc;
	list-style-position: inside;
}

#resultInfo.column-paddings {
	padding:0;
}

#resultInfo ul.pagination {
	margin-bottom: 0;
}
#product-catalog-hldr.result-container {
    padding: 0;
}
#page-selection-top {
	line-height: .9;
}
#headerName {
    /* color: #c80000; */
    font-size: 22px;
    font-weight: 700;
    margin-top:15px;
}
#page-selection-top {
    margin-top: -6px;
    margin-bottom: 3px;
    float: right;
    padding: 0;
}
.simple-pagination li:last-child a {
    margin: 0;
}
#page-selection{
	float: right;
    padding: 0;
}
.fa.fa-star.fav-item {
	font-size: 18px;
	color: #c52033;
	line-height: 30px;
	cursor: pointer;
}
.mkt-banner-hldr img{
    border: 1px solid #999;
    margin-bottom: 5px;
    max-height: 90px;
}
.no-fav-item {
	color: #7b7b7b;
	cursor: pointer;
}
span.current {
    border: none;
    box-shadow: none;
    padding-bottom: 1px;
}
.disabled:hover {
    background:transparent;
}
.custom-modal-body{
	padding: 2px 10px;
}
.mkt-banner-hldr img:hover {
	border: 1px solid #c52033;
}

</style>
<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.i18n.properties.js" defer ></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../js/advance-filter.js?version=${properties['application.version']}" defer></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js" defer></script>
</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<!-- header container having logo and navigation -->
		<form method="post">
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class='active'><spring:message code="label.shopforparts" /></li>

				</ul>
			</div>
			<div class="btn hidden-md hidden-lg" id="btn_filter_SFP"><i class="fa fa-filter" aria-hidden="true"></i></div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper p-t-sm-67 m-t-lg-48">
				
				<div
					class="col-lg-3 col-md-3 col-sm-3 col-xs-12 column-paddings responsive-padding mobile_SFP"
					id="shopForPartLeft">
					<h3 class="page_title xs_pad-left_27">
					<spring:message code="label.shopforparts" />
				</h3>
					<div id="treeShopforParts" class="treeview-hldr"></div>
				</div>
				<div align="center" id="noCatalog" style="display: none;">
					<p>
						<spring:message code="label.shopforparts.nocatalog" />
					</p>
				</div>
				<div
					class="col-lg-9 col-md-9 col-sm-9 col-xs-12 column-paddings responsive-padding"
					id="catalog-content-hldr">
					<div
						class="col-lg-9 col-md-9 col-sm-12 col-xs-12 column-paddings responsive-padding"
						id="catalog-page" hidden>
						<!-- SUPPORT INSTALLATION INFORMATION -->
						<a href="#" id="installation-info" style="margin-left: 10px;"
							target="_blank" class="btn btn-addtocart cart-small catalog-btn"
							hidden>Installation Information</a>
						<!--END SUPPORT INSTALLATION INFORMATION -->
						<a href="#" target="_blank" id="catalog-link"
							class="btn btn-addtocart cart-small catalog-btn" hidden>Catalog
							Page</a> <a href="#" id="msds-page" style="margin-left: 10px;"
							target="_blank" class="btn btn-addtocart cart-small catalog-btn"
							hidden><spring:message code="label.button.msds.text" /></a>
					</div>

					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="resultInfo" style="display: none; border-bottom: 1px #eee;">

						<div class="row">
							<div class="col-sm-5 col-sm-push-0 col-xs-12">
								<h3 id="headerName" class="inline hidden-xs"></h3>
							</div>
							<div class="col-sm-7 col-sm-push-0 col-xs-12 mkt-banner-hldr">
								
							</div>
							
						</div>
									
						<div class="panel-group" id="marketing-pannel-accordion" role="tablist" aria-multiselectable="true">
					  		<div class="panel panel-default">
							    <div class="panel-heading" role="tab" id="headingOne">
							      <h4 class="panel-title">
							        <a role="button" data-toggle="collapse" data-parent="#marketing-pannel-accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							          Additional Information<span class="glyphicon glyphicon-chevron-down pull-right"></span>
							        </a>
							      </h4>
							    </div>
							    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
									<div id="marketing-pannel-hldr" class="panel-body">
										<div class="col-sm-3" style="padding-left: 0; max-height: 100%;">
											<div class="main-img-holder"></div>
											<ul class="main-img-list">
											</ul>
										</div>
										<div class="col-sm-9">
											<ul class="nav nav-tabs" role="tablist">
			
											</ul>
											<div class="tab-content"> </div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mtop10" style="padding-bottom: 5px;">
							<div class="col-sm-6">
								(<span id="allResult"></span>&nbsp;<spring:message code="label.results" />)
							</div>
							<div class="col-sm-6 nopadding" style="right:15px;">
								<div class="pull-right">
									<label><spring:message code="label.sortby" /></label>
									<select id="sort-by">
										<option value="1"><spring:message code="whereused.item" /> </option>
										<option value="2"><spring:message code="label.export.commercialdescription" /></option>
									</select>
									<div class="menu-icon active" id="menu-toggle">
										<div class="top"></div>
										<div class="middle"></div>
										<div class="bottom"></div>
									</div>
								</div>
							</div>
						</div>
						<%@ include file="paginationHeader.jsp" %>
					</div>

					
					
					<!-- 					 For advance Filter -->
					<div class="container-fluid col-lg-12 block-wrapper">
						<div class="block"></div>
					</div>
					<!-- 					 For advance Filter -->
					<div
						class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="product-catalog-hldr"></div>
					<%@ include file="paginationFooter.jsp" %>
				</div>

			</div>

			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="myModal"  data-backdrop="static" data-keyboard="false">
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

			<!-- Modal -->

			<div class="modal bs-example-modal-lg bs-example-modal-md" id="enlargeModal">
				<div class="modal-dialog modal-lg modal-dialog modal-md" style="cursor: pointer;">

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
			<a href="javascript:void(0);" class="cd-top"
				title="<spring:message code='label.scroll.top'/>"><spring:message
					code="label.footer.top" /></a>
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
			<div class="lazyLoader hidden">
				<div class="lazySpinner"></div>
			</div>
		</form>
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
	<script	src="../js/jstree.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	
	<script src="../js/jquery.nicescroll.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	
	<script src="../js/jquery.simplePagination.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/pagination.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
		
	<script src="../js/module-estore-marketingbnr.js?version=${properties['application.version']}"  defer type="text/javascript"></script>

	<script id="productCatalogTemplate" type="text/x-jquery-tmpl">
					<div class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
                        <div class="product-info" data-id="${'${'}id}" data-pcatalog="${'${'}pcatalogId}" data-parent="${'${'}parent}" data-cataloglink="${'${'}catalogDocumentLink}" data-hasparts="${'${'}children}" data-catalogId="${'${'}pcatalogId}">
                        	{{if mediaId!=0}}
                               <a href="javascript:void(0);" class="productCatalogClick"><span class="helper"></span><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"></a>
							   <a href="#" class="productCatalogClick" title="${'${'}text}">${'${'}text}</a>
                              {{else}}
								<a href="javascript:void(0);" class="no-image productCatalogClick">${'${'}text}</a>
							 {{/if}}
                        </div>
                    </div>
    </script>
	<script id="productItemTemplate" type="text/x-jquery-tmpl">
		<style>
						.row-eq-height {
  							display: -webkit-box !important;
  							display: -webkit-flex !important;
  							display: -ms-flexbox !important;
  							display: flex !important;
						}

				</style>
		<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 search-parts-template cart-details add-cartpopover mob_cen">
   <div class="row row-eq-height">
   <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12" prodimg-box" style="width:17%">
		{{if mediaId!=0}}
			 <a href="javascript:void(0)" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})" >
			 <img id="image" src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}">
				{{if !isActualImage}}
					<div class="waterMarkForChildPartsForSearch">
						<span style="margin: 6px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
						<span style="font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>													
					</div>
				{{/if}}			   
			</a>
		 {{else}}
				 <a href="javascript:void(0);" class="no-image" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})">${'${'}commercialDescription}</a>
		 {{/if}}
	</div>
	<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 cart-item-info pl_xs xs_img_center pt-xs-10">
		<h4>
			<a href="javascript:void(0);" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})" data-itemId="${'${'}itemId}" data-mediaId="${'${'}mediaId}" data-itemNumber="${'${'}itemNumber}"><spring:message code="label.item.shop"/> # ${'${'}itemNumber}</a>
			<c:if test="${ not sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
				<a class="fav-btn ng-scope" title="Favorites" data-itemid="${'${'}itemId}" data-mediaid="${'${'}mediaId}" data-orgid="${'${'}organizationId}" >
					{{if myFavNonOrderableShown == 1}}
						{{if myFavShown == 0}} 
							<i class="fa fa-star no-fav-item"></i>
						{{else}}
							<i class="fa fa-star fav-item"></i>
						{{/if}}																													
					{{/if}}
				</a>
			</c:if>
		</h4>
		<!--Display Legacy Part Number(Developed by : Swetha) -->
		<%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
		<c:if test="${properties['display.legacy.part']}">
			<div><spring:message code="label.legacy.part"/> ${'${'}legacyNumber}</div>
		</c:if>
		<!--Display Legacy Part Number ends -->
		<div><strong>${'${'}commercialDescription}</strong></div>
		<sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
			<div>${'${'}engineeringDescription}</div>
		</sec:authorize>
		<div class="b-label">
		<div>${'${'}organizationName} <spring:message code="search.part" /></div>
		<p class="order-multiples-lbl"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>  ${'${'}orderMultiple}</p>
	  <!--  <strong><span class="stock-count" data-avail="${'${'}itemId}"></span> <spring:message code="label.promotion.instock"/>, <spring:message code="label.promotion.leadtime"/> <span class="lead-time" data-leadtime="${'${'}itemId}"></span> Day(s)</strong></div> 
		<strong><span class="stock-count" data-avail="${'${'}itemId}"></span></strong>-->
		</div>
	
	</div>
	<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12 nopadding quantity-change" data-orgId="${'${'}organizationId}">
		<div class="spinner-control spinner-control_mt" data-ordermultiplekey="${'${'}orderMultiple}">
		  <input type="text" id="${'${'}partId}" class="total-items output" maxlength="6" value="${'${'}orderMultiple}" style="width:40px;text-align:center;">  
		  <div class="qty">  
			<a href="javascript:void(0);" class="item-increment">
				<i class="fa fa-caret-up"></i>
			  </a>
			  <a href="javascript:void(0);" class="item-decrement">
				<i class="fa fa-caret-down"></i>
			  </a>
		  </div> 
		</div>
		<span class="unit" style="left:75px;top:42px;" >${'${'}uom}</span> 
	</div>
	<div class="col-lg-4 col-md-4 col-sm-3 col-xs-12 nopadding erp-price-avail" data-allVal="" data-orgId="${'${'}organizationId}" style="width:32%;">

		<div data-msrpShowHide="${'${'}itemId}" data-msrp="${'${'}itemId}" class="msrpShowHide msrpHide"><spring:message code="label.msrp"/>: <span class="msrp-price price-loader" data-msrp="${'${'}itemId}"></span></div>
		<div class="your-price1" data-price="${'${'}itemId}"><spring:message code="label.your.price"/>: <span class="your-price price-loader" data-price="${'${'}itemId}"></span></div>
		<div data-savePriceShowHide="${'${'}itemId}" data-saved="${'${'}itemId}" class="blueColor youSaveHide savePriceShowHide"><spring:message code="label.save"/>: <span class="save-price price-loader" data-saved="${'${'}itemId}"></span> <span><spring:message code="lable.item.each" /></span></div>
		<div><strong>${'${'}inventoryMessage}</strong></div>
		<div style="height:auto;min-height: 65px;" ><strong><span class="stock-count" data-avail="${'${'}itemId}"></span></strong></div>
	</div>
</div>
	<div class="row row-eq-height">
		<div class="col-sm-offset-6 col-sm-6 text-right" data-orgid="${'${'}organizationId}" data-itemid="${'${'}itemId}" data-mediaid="${'${'}mediaId}" data-itemnumber="${'${'}itemNumber}" >
			<sec:authorize access="hasRole('ROLE_CART')">

			{{if isOrderable && !priceNotShown}}
				<button class="btn btn-addtocart cart-small add-to-cart cart-btn-space" style="height:35px;"><spring:message code="quick.search.addtocart"/></button>
				<sec:authorize access="hasRole('ROLE_ORDER')"> 
					{{if canPlaceOrderPOCC}}
						<button class="btn btn-buynow cart-small  spaceLeft10 buynow-click" style="height:35px;"><spring:message code="label.buynow"/></button>
					{{else}}
						<button class="btn btn-buynow cart-small  spaceLeft10 not-active" style="height:35px;"><spring:message code="label.buynow"/></button>
					{{/if}}										
				</sec:authorize>
				<sec:authorize access="!hasRole('ROLE_ORDER')"> 
					<button class="btn btn-buynow cart-small  spaceLeft10 not-active" style="height:35px;"><spring:message code="label.buynow"/></button>
				</sec:authorize>
				
			{{else}}
				<button class="btn btn-addtocart cart-small not-active cart-btn-space" style="height:35px;"><spring:message code="quick.search.addtocart"/></button>
				<button class="btn btn-buynow cart-small  spaceLeft10 not-active" style="height:35px;"><spring:message code="label.buynow"/></button>
			{{/if}}
			
		</sec:authorize>
		</div>
	</div>
</div>
					
    </script>
	<script type="text/javascript">
	var prodCatalogId, prodCategoryId;
	var paginationCount;
	var startPoint = 1;
	var levelCount=0;
	var foundClickedItem=false;
	var counter=0;
	var arr1=[];
	var arr2=[];
	var userid,authtoken;
	var isSearch=false;
	var isQuoteOrder=false;
	var bookMark = true;
	var bookMarkSearch = false;
	var mktBanner;
	//Removed function for loading issue
			userid=$('#userId').val();
			authtoken = $('#authToken').val();
			$('#callingLocation').val('shopforparts');
			
			$("#new-main-menu-list > li:visible").find("a:contains(<spring:message code='label.header.shopforparts'/>)").parent().addClass('active');
			
			var nodeId = '${productCategoryMappingId}';
			$('#productCategoryMappingId').val(nodeId); 
			
			var searchflag = 'false';
			var searchVariable= '${searchflag}';
			if(null != searchVariable && searchVariable !=""){
				searchflag = '${searchflag}';
			}
			if(searchflag=='true'){
				var searchString = '${searchString}';
				var searchType = '${searchType}';
				$('#callingLocation').val('');
					 
				$('#keyword').val(searchString);
				$('#typedropdown').val(searchType); 
				$('#issearch').val(searchflag); 
				$('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value='+$("#typedropdown").val()+']').text());
				bookMarkSearch = true;
			}
		initilizeTreeCtrl();
		/*$('#treeShopforParts.treeview-hldr').on('ready.jstree',function(e,data){
			console.log("Test My jstree Node :"+$('#treeShopforParts.treeview-hldr').jstree(true).is_loaded("1_182"));
		});*/
		// A $( document ).ready() block.
		$( document ).ready(function() {
			$('#treeShopforParts').jstree(true).hide_icons(false);
			
			var searchflag = 'false';
			var searchVariable= '${searchflag}';
			var breadCrumFullItem = '${productCategoryMappingId}';
			if(null != searchVariable && searchVariable !=""){
				searchflag = '${searchflag}';
			}
				
			if(searchflag=='true'){
				
				var searchString = '${searchString}';
				var searchType = '${searchType}';
				$('#callingLocation').val('');
				 
				$('#keyword').val(searchString);
				$('#typedropdown').val(searchType); 
				$('#issearch').val(searchflag); 
				$('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value='+$("#typedropdown").val()+']').text());
			
			}
			
			var offset = 300,
	        offset_opacity = 1200,
	        scroll_top_duration = 700,
	        $back_to_top = $('.cd-top');
			$(window).scroll(function(){
			  ( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
			  if( $(this).scrollTop() > offset_opacity ) { 
			    $back_to_top.addClass('cd-fade-out');
			  }
			});

			//smooth scroll to top
			$back_to_top.on('click', function(event){
			  event.preventDefault();
			  $('body,html').animate({
			    scrollTop: 0 ,
			    }, scroll_top_duration
			  );
			});
			
			if(!searchflag){
			/*	$(".breadcrumb").append('<li><a href='+$("#main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#main-menu-list >li:nth-child(1)").text()+'</a></li>');
				$(".breadcrumb").append('<li class="active"><a href='+$("#main-menu-list > li.active a").attr('href')+'>'+$("#main-menu-list > li.active a").text()+'</a></li>');*/
			}
			
			$("#filterThumbnailDiv").removeClass('hidden');
			
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
		   
		 	//Marketing BANNER;
			 mktBanner =  Systems.Classes.registerBanner;
			 mktBanner.init('${properties['docserver.url']}', userid, authtoken, "shop4parts");
			 mktBanner.clearall();
		   
		});

		// decrease the quantity
	      $(document).delegate('.minus-click','click', function(){
	    	  var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	          var cartItemId = $(this).parents('.spinner-control').attr('id');
	          var partId = $(this).parents('.spinner-control').children('.total-items').attr('id');
	          if(itemVal>0){
		         QuantityChange(itemVal, cartItemId, partId);
	          }else{
	        	  var msg = "<spring:message code='alert.shopforparts.valid.qty' javaScriptEscape='true'/>";
	          	$('.modal-body').text(msg)
	  			  $("#myModal").show();
	          	$('.total-items.qty-change').val(1);
	          //	QuantityChange(1, cartItemId, partId);
	          }
	      }); 
	      var pageNumber=1
	 	 var counter = 1;
	 	 var pageSize=12;
	 	 var totalItems;
	 	 var productCategoryId;
	 	 var productCatalogId;
		
			//Created to call the breadcrum from F.I.Details
			   $("#treeShopforParts").bind( "loaded.jstree", function(evt, data){
			    var breadCrumFullItem = '${productCategoryMappingId}';
			    if(null != breadCrumFullItem){
			     //alert("Callign breadCrumFullItem")
			     //breadCrumFullItem=breadCrumFullItem+"_anchor";
			     var productCategoryId = breadCrumFullItem.toString().split("_")[1];
			     var productCatalogId =  breadCrumFullItem.toString().split("_")[0];
			     
			     jstreeBreadCrumb(breadCrumFullItem);
			     
			    }
			    if(breadCrumFullItem != ""){
			    	bookMark = false;		
			    }
			   });
		

		// onclick of catalog or category box
	 			$(document)
					.delegate(
							'.productCatalogClick',
							'click',
							function() {
								//$(".breadcrumb > li:last-child").after('<li><a href="" >'+ $(this).text()+'</a></li>');
								var productCategoryId = $(this).parent().data('catalogid');
								var productCatalogId = $(this).parent().data('id');
								var hasChildren = $(this).parent().data('hasparts');
								var parent = $(this).parent().data('parent');
								var id = $(this).parent().data('id');
								var productCatalogId = $(this).parent().data('pcatalog');
								var catalogLink = $(this).parent().data('cataloglink');
								partsPerPage=10;
								$("#treeShopforParts.treeview-hldr").jstree(true).deselect_all();
								$("#treeShopforParts.treeview-hldr").jstree(true).select_node(id);  
								
							});
				function searchFilterPart(){
					var isAbleToSubmit = validateGlobalCheck();
 					if(!isAbleToSubmit){
						prepareQuery();
					}
				}
	 			function prepareQuery(){
	 				mainArr = prepareDynamicQuery();
 	 				var filterValue = JSON.parse(mainArr);
                    console.log(filterValue);
                      if(filterValue['isSuccess']==true){  
                    	pageNumber = 1;
      	 	 			counter = 1;
      	 				getItemsForCategory(prodCategoryId,prodCatalogId,pageNumber,mainArr);
      	 				pageNumber++;
      	 				counter++;
                     }
   	 			 }
	 			
	 			function resetFilter(){
 	 				renderJson(searchJson);
 	 				prepareQuery();
 	 			}
		// get items for category
		function getItemsForCategory(productCategoryId, productCatalogId, pageNumber,filterJson) {
			prodCatalogId = productCatalogId;
			prodCategoryId = productCategoryId;
			
			var locale=${locale};
			mktBanner.clearall();
			$.ajax({
		          type : "Get",
		          data : {"productCategoryId" : prodCategoryId, "partId" : "0", "status" : 0},
		          contentType: 'application/json',
		          mimeType: 'application/json',
		          url : "getXmlPathForCategoryAndPart",
		          cache : false,
		          success : function(response) {
		        	  if(typeof response.markettingBannersMedia.mediaId !='undefined'){
		        		$("#catalog-page").hide();	
		        	    //var xmlFileName = '../htmls/mbxml/mb_512_en_US.xml';
		        	    var xmlFileName = '${properties['docserver.url']}?media='+response.markettingBannersMedia.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken;
			            mktBanner.loadBanner(xmlFileName);
		        	  }else{
		        		  $("#catalog-page").show();
		        	  }
		          },  
		          error : function(e) {
		        	  $("#catalog-page").show();
		        	  $('div.pageLoader').hide();
		          }  
			});
		 	
			///xmlFileName = "../htmls/mbxml/mb_512_en_US.xml";
      	  	//mktBanner.loadBanner(xmlFileName); 
			
			
			var resultPerPage = pageSize;//$('#result-per-page').val();
			
			if(partsPerPage==10){
				$('.ten-a,.twentyFive-a,.fifty-a,.hundred-a').css('color', 'black');
				$('.ten-a').css('color', 'blue');
			}
			
			var sortBy = $('#sort-by').val();
 			
			if(pageNumber === 1 || sortChange){
				$('.pageLoader').show();
			}
 			$.ajax({
				type : "Get",
				data : {
					productCategoryId : productCategoryId,
					productCatalogId : productCatalogId,
					resultPerPage : partsPerPage,
					pageNumber : pageNumber,
					sortBy : sortBy,
					filterJson : filterJson
				},
				contentType : 'application/json',
				mimeType : 'application/json',
				url : "getitemsforcategory",
				//INC-1907 Added by Aniket to handle multilanguage
				dataType:"json",
				//INC-1907 End
				success : function(response) {
					console.log(response);
					
					var filterValue = JSON.parse(filterJson);
                    console.log(filterValue);
                    
                      if(filterValue['isFilterRequired']==true){  
                         renderFilter(response.advancefilters);
                     }
                      
                      if(response.filterMedia!=null && response.filterMedia.mediaId!=null && response.filterMedia.mediaId!='undefined'){
                      	filterMediaId=response.filterMedia.mediaId;
                      	$("#filterThumbnailImage").show();
                      	$("#filterThumbnailDiv").show();
                      	$("#advanceFilterId").css("width", "60%");
                      	$("#filterThumbnailDiv").css("width", "40%");
                      	$("#filterThumbnailImage").attr("src",'${properties['docserver.url']}?media='+filterMediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
                      	//$("#enlargeModalImage").attr("src",'${properties['docserver.url']}?media='+filterMediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
                      	attributeMedia = '${properties['docserver.url']}?media='+filterMediaId+'&thumbnail=true&user='+userid+'&token='+authtoken;
                      	//$("#enlargeModal .custom-modal-body").append('<img id="enlargeModalImage" src="'+ attributeMedia +'">');
                      }else{
                      	$("#filterThumbnailImage").hide();
                      	$("#filterThumbnailDiv").hide();
                      	$("#advanceFilterId").css("width", "100%");
                      }
                    
					if(pageNumber===1){
						$("#product-catalog-hldr").html('');
					}
					 
					 $("#product-catalog-hldr").html('');
					 $("#productItemTemplate").tmpl(response.itemDetails)
							.appendTo("#product-catalog-hldr");

					 $('.pageLoader').hide();
					//Bing Increment click Event
					$('.item-increment').on('click',function(){
						var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
						if(parseInt(itemVal)>=999){
				            $(this).parents('.spinner-control').children('.total-items').val("999");
				            return false;
				          }
					});
					
					 
                  	var valueHideOrShow = ${hideOrShowFields};
                  	valueHideOrShow = valueHideOrShow==null?response.hideOrShowFields:valueHideOrShow;
					//if (filterValue["show.order.multiples"] == "TRUE"){
					if (valueHideOrShow!=null && valueHideOrShow["show.order.multiples"] == "TRUE"){
			    	 	$(".order-multiples-lbl").show();
			        }
			        	else{$(".order-multiples-lbl").hide();
			        }
        	        
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
                  	
                  	$("#resultCount").text(response.itemDetails.length);
					$("#resultInfo").show();
					$("#pagination").show();
					
					 if(filterValue['isFromSearch']==true) { 
							$('#allResult').text(response.totalItemCount);
							var totalPage=Math.ceil(response.totalItemCount/partsPerPage);
							
							if(response.totalItemCount>50){
								$('.hundred').removeClass('hidden');
							}else{
								$('.hundred').addClass('hidden');
							}
							if(response.totalItemCount>25){
								$('.fifty').removeClass('hidden');
							}else{
								$('.fifty').addClass('hidden');
							}
							if(response.totalItemCount>10){
								$('.twentyFive').removeClass('hidden');
							}else{
								$('.twentyFive').addClass('hidden');
							}
							if(response.totalItemCount>=1){
								$('.ten').removeClass('hidden');
							}else{
								$('.ten').addClass('hidden');
							}
							if(totalPage==0)
								$('#page-selection,#page-selection-top').hide();
							else{
								$('#page-selection,#page-selection-top').show();
								$('#partsPerPageDivFooter,#partsPerPageDivHeader').show();
							}
							if(response.totalItemCount > partsPerPage){
								
								$('#page-selection,#page-selection-top').pagination({
									pages: totalPage,
									currentPage: pageNumber,
							        itemsOnPage: partsPerPage,
							        displayedPages: 4,
							        cssStyle: 'light-theme',
							        onPageClick: function(pageNumber, event){
										getItemsForCategory(prodCategoryId,prodCatalogId,pageNumber,mainArr);
									}
							    });
							}else{
								$('#page-selection,#page-selection-top').hide();
							}
	                    }
                    
                    totalItems = parseInt($('#allResult').text());
 					if(filterValue['isFromSearch']==true && totalItems  == 0){
						  $('#product-catalog-hldr').append('<p class="errorText"><spring:message code="message.noPart.filter" javaScriptEscape="true"/></p>');
					}else if(totalItems  == 0){
						  $('#product-catalog-hldr').append('<p class="errorText"><spring:message code="message.noPart" javaScriptEscape="true"/></p>');

					}
                    ///////////////
                     if(filterValue['isFilterRequired']==true) { 
                    	  filterValue["isFromSearch"]=false;
                       	  mainArr = JSON.stringify(filterValue);

                    }
                    ///////////////////////
					
                    
					if(sortChange || filterValue['isFromSearch'] == true){
						sortChange = false;
						$('#sort-by').prop('disabled',false);
					}else{
						counter++;
					}
					

					paginationCount = getPaginationCount(resultPerPage,response.totalItemCount);
					
					
					resetPagination(startPoint+4);
					startPoint = 1;
					
					// enabled or disabled first/previous/next/last
					if(pageNumber==1){
						$('.paginate_button.first').addClass('disabled');
						$('.paginate_button.previous').addClass('disabled');
						
						$('.paginate_button.next').removeClass('disabled');
						$('.paginate_button.last').removeClass('disabled');
					}
					else{
						
						$('.paginate_button.first').removeClass('disabled');
						$('.paginate_button.previous').removeClass('disabled');
						if(pageNumber==paginationCount){
							$('.paginate_button.next').addClass('disabled');
							$('.paginate_button.last').addClass('disabled');
						}
						else{
							$('.paginate_button.next').removeClass('disabled');
							$('.paginate_button.last').removeClass('disabled');
						}
						
						if(pageNumber>5){
							var val = pageNumber-5;
							startPoint = startPoint+val;
							
						}
						
					}
					
					setpaginationCount(paginationCount,startPoint);
					
					if(paginationCount==1){
						$('.paginate_button.next').addClass('disabled');
						$('.paginate_button.last').addClass('disabled');
					}
					$('.page1').addClass('active');
					
					// active clicked button and inactive previous active button
					$('.paginate_button.active').removeClass('active');
					$('.page'+pageNumber+'').addClass('active');
					
					// get item id list for getting price
					var partVoList = {};
					var items = [];
					var organizationId;
					$.each(response.itemDetails, function(idx, obj) {
						organizationId = obj.organizationId;
						var partVo = {};
						partVo['partId'] = obj.itemId;
						partVo['partNumber'] = obj.itemNumber;
						
						//Disbale add tocart if price not shown
						if(obj.priceNotShown == true){
							$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
						}
						items.push(partVo);
					});
					partVoList['partVoList'] = items;
                   if(response.itemDetails.length>0){
                	   $("#pagination").show();
                	   var shopForPartPriceFlag=${properties['show.price.inventory.flag']};
                	   
                	   if(shopForPartPriceFlag)
                	   		getPriceForItems(partVoList,organizationId);
                	   else{
                		   	//$(".msrpShowHide").hide();//set MSRP
							///$(".your-price").hide();
							//$(".savePriceShowHide").hide();
							$("div.msrpShowHide, div.savePriceShowHide").hide();
							$("div.your-price1").hide();
                	   }
                   }
					else{
						 $("#pagination").hide();
						 
					}
                   $('div.lazyLoader').addClass('hidden');
                   if($('.pageLoader').is(':visible')){
                   	$('.pageLoader').hide();
                   }
                   $(".no-fav-item").parent().attr("title", "<spring:message code='label.onhover.addtofav' javaScriptEscape='true'/>");
                   $(".fav-item").parent().attr("title", "<spring:message code='label.onhover.removefromfav' javaScriptEscape='true'/>");
                   
                   $(document).scrollTop(0);
                   
                 //INC - 1806 : Scroll down of item in a category stops working after coming back from full item details page/searching a category from global search in Milacron
                   //Reviewed by Subbu
                   	var tmp1 = productCatalogId+"_"+productCategoryId;
                   	History.pushState({state: tmp1},"${properties['global.page.title']}","./shopforparts?breadCrumFullItem="+tmp1);
                   //INC - 1806 : Scroll down of item in a category stops working after coming back from full item details page/searching a category from global search in Milacron
                   //Reviewed by Subbu
				},
				error : function(e) {
					$('.pageLoader').hide();
					$('div.lazyLoader').addClass('hidden');
				}
			});
		 }

		
		
		// recursive function call for Setting BreadCrumbs  
		function getClickedCategoryForBreadCrumb(clickedJsonObj, productCategoryId) {
			var temp=0;
			
			for ( var key in clickedJsonObj) {
				if(foundClickedItem){
					break;
				}
				if(typeof clickedJsonObj[key].children!='undefined'){
					if(clickedJsonObj[key].children.length==1 ){
						levelCount++;
						counter=0;
					}
					if(clickedJsonObj[key].children.length>1){
						if(typeof clickedJsonObj[key].children[clickedJsonObj[key].children.length-1].children=='undefined'){
							arr1.push(clickedJsonObj[key].children[clickedJsonObj[key].children.length-1].text);
						}else {
							arr2.push(clickedJsonObj[key].immediateParent);
							temp=1;
						}
					}
				}
			
				 for( var i = 0; i < arr2.length; i++ ){
					  if(clickedJsonObj[key].immediateParent==arr2[i] && temp==0){
						  $('.breadcrumb li:last-child').remove();
					  }
				  }
				 temp=0;
				  
				var val = clickedJsonObj[key].children;
				
				if (clickedJsonObj.hasOwnProperty(key)
						&& clickedJsonObj[key].productCatalogId == productCategoryId) {
					$(".breadcrumb").append('<li class="active">'+clickedJsonObj[key].text+'</li>');
					foundClickedItem=true;
					break;
				} else {
					  for( var i = 0; i < arr1.length; i++ ){
						  if(clickedJsonObj[key].text==arr1[i]){
							  $('.breadcrumb li:last-child').remove();
						  }
					  }
					  
					if (typeof val != "undefined" && val.length > 0) {
						$(".breadcrumb").append('<li><a href="javascript:void(0);" onclick="clickonBreadCrumb('+clickedJsonObj[key].pcatalogId+','+clickedJsonObj[key].productCatalogId+','+clickedJsonObj[key].children+',this); return false;">'+clickedJsonObj[key].text+'</a></li>');
						getClickedCategoryForBreadCrumb(clickedJsonObj[key].children,
								productCategoryId);
					} else {
						for(var j=0;j<levelCount;j++){
							$('.breadcrumb li:last-child').remove();	
						}
						levelCount=0; 
					}
				}
				
			}
		}


 

		 
		 
		// Call on BreadCrumb click
		function clickonBreadCrumb(productCatalogId,productCategoryId,hasParts,lastClickedText){
			console.log("Coming...."+productCatalogId+"::::"+productCategoryId+":::::::"+hasParts+":::::"+lastClickedText.text);
			var removeBreadCrumbs=1;
			$(".breadcrumb > li").each(function(){
				if(removeBreadCrumbs==0){
					   $(this).remove();
				   }
				
				if($(this).text() == lastClickedText.text ){
					$(this).children().css('textDecoration','none');
			  	 	removeBreadCrumbs=0;
			  	}
			   
			});
			
			var myTreeDataString = '${productCatalogTreeData}';
		
			myTreeData = JSON.parse(myTreeDataString);
			
			$("#headerName").text(lastClickedText.text);
			// for catalog click
			if (typeof productCatalogId == "undefined"
					&& typeof hasParts == "undefined") {
				// get only catalog details from json tree structure 
				var productCatalogs = [];
				var productCatalogList = {};
				for ( var key in myTreeData) {
					if (myTreeData.hasOwnProperty(key)
							&& myTreeData[key].productCatalogId == productCategoryId) {
						latestJsonObj = myTreeData[key].children;
						var clickedJsonObj = myTreeData[key].children;

						var productCategory = [];
						var productCategoryList = {};
						for ( var key in clickedJsonObj) {
							if (clickedJsonObj.hasOwnProperty(key)) {
								productCategory
										.push({
											"productCatalogId" : clickedJsonObj[key].productCatalogId,
											"hasParts" : clickedJsonObj[key].children,
											"description" : clickedJsonObj[key].description,
											"catalogDocumentLink" : clickedJsonObj[key].catalogDocumentLink,	
											"text" : clickedJsonObj[key].text,
											"mediaId" : clickedJsonObj[key].mediaId,
											"children" : clickedJsonObj[key].children,
											"pcatalogId" : clickedJsonObj[key].pcatalogId
										});
								
								if(typeof clickedJsonObj[key].catalogDocumentLink=="undefined" || clickedJsonObj[key].catalogDocumentLink==""){
									$("#catalog-page").hide();
								}else{
								$("#catalog-page").show(); 
							 	$("#catalog-page > a").attr("href",clickedJsonObj[key].catalogDocumentLink);
								}
								
							}
						}
						productCategoryList.productCategory = productCategory;
						console.log(productCategoryList.productCategory);

						$("#product-catalog-hldr").html('');
						$("#productCatalogTemplate").tmpl(
								productCategoryList.productCategory).appendTo(
								"#product-catalog-hldr");
						$("#resultInfo").hide();
						$("#pagination").hide();
					}
				}
			} else {
				// least category click which contains items
				if (hasParts == true) {
					
					//var pageNumber = 1;
					pageNumber=1;
					counter=1;
					getItemsForCategory(productCategoryId, productCatalogId,pageNumber);
					pageNumber++;
				}
				// click on category which contains subcategory
				else {
					var productCatalogs = [];
					var productCatalogList = {};
					for ( var key in myTreeData) {
						if (myTreeData.hasOwnProperty(key)
								&& myTreeData[key].productCatalogId == productCatalogId) {
							var childrenJson = myTreeData[key].children;
							getClickedCategory(childrenJson, productCategoryId);

						}
					}
				}
			}
		}

		// recursive function call for getting sub-category of clicked  
		function getClickedCategory(clickedJsonObj, productCategoryId) {
			for ( var key in clickedJsonObj) {
				var val = clickedJsonObj[key].children;
				if (clickedJsonObj.hasOwnProperty(key)
						&& clickedJsonObj[key].productCatalogId == productCategoryId) {
					latestJsonObj = clickedJsonObj[key].children;
					var clickedJsonObj1 = clickedJsonObj[key].children;
					var productCategory = [];
					var productCategoryList = {};
					for ( var key in clickedJsonObj1) {
						if (clickedJsonObj1.hasOwnProperty(key)) {
							productCategory
									.push({
										"productCatalogId" : clickedJsonObj1[key].productCatalogId,
										"hasParts" : clickedJsonObj1[key].children,
										"description" : clickedJsonObj1[key].description,
										"catalogDocumentLink" : clickedJsonObj[key].catalogDocumentLink,	
										"text" : clickedJsonObj1[key].text,
										"mediaId" : clickedJsonObj1[key].mediaId,
										"children" : clickedJsonObj1[key].children,
										"pcatalogId" : clickedJsonObj1[key].pcatalogId
									});
							
							if(typeof clickedJsonObj[key].catalogDocumentLink=="undefined" || clickedJsonObj[key].catalogDocumentLink==""){
								$("#catalog-page").hide();
							}else{
							$("#catalog-page").show(); 
						 	$("#catalog-page > a").attr("href",clickedJsonObj[key].catalogDocumentLink);
							}
						}
					}
					productCategoryList.productCategory = productCategory;
					console.log(productCategoryList.productCategory);
					$("#product-catalog-hldr").html('');
					$("#productCatalogTemplate").tmpl(
							productCategoryList.productCategory).appendTo(
							"#product-catalog-hldr");
					$("#resultInfo").hide();
					$("#pagination").hide();
				} else {
					//alert(".....length...."+val);
					/* if (typeof val != "undefined" && val.length > 0) {
						alert("........clicked else if........")
						getClickedCategory(clickedJsonObj[key].children,
								productCategoryId);
					} else {
						alert("........clicked else else........")
						return;
					} */
					getClickedCategory(clickedJsonObj[key].children,
							productCategoryId);
				}
			}
		}
		$(document).delegate(
				'.add-to-cart',
				'click',
				function(e) {
					 $('div.pageLoader').show();
					 $("body").css("overflow", "hidden");
					e.preventDefault();
					/* var img =$(this).parents(".search-parts-template").children("div:first-child").html();
					var partId = $(this).parent().siblings('.cart-item-info')
							.find('a').attr('data-itemId');
					
					var mediaId = $(this).parent().siblings('.cart-item-info')
							.find('a').attr('data-mediaId');
					var quantity = $(this).parent()
							.siblings('.quantity-change').find('.total-items')
							.val();
					var organizationId = $(this).parent().attr('data-orgId');
					var itemNumber = $(this).parent().siblings('.cart-item-info')
					.find('a').attr('data-itemNumber'); */
					
					var img =$(this).parents(".search-parts-template").children().find(".prodimg-box").html();
					var organizationId = $(this).parent().data('orgid');
					var partId = $(this).parent().data('itemid');
					var mediaId = $(this).parent().data('mediaid');
					var itemNumber = $(this).parent().data('itemnumber');
					var quantity = $(this).parents(".search-parts-template").find(".quantity-change").children("div.spinner-control").find("input").val();
									
					var dataItemVal = null;
					
					//dataItemVal=$(this).parent().data('allval');
					
					console.log(dataItemVal);
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
							console.log('shop'+response);
                        getShoppingCartCount();
							if (response == '') {
								/* alert("Part is not added...") */
								$('div.pageLoader').hide();
								$("body").css("overflow", "auto");
								$(".cart-popover").css({"opacity": 1});
								$(".cart-popover").show().stop().fadeOut(5000);
								/*$(".close-popup").delegate("click",function(){
									$(this).parents(".cart-popover").fadeout("fast");
								})*/
								$(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
									$(this).css("text-decoration","none");
								});
								$(".cart-popover").find(".cart-popover-title").text("<spring:message code='quick.search.item' javaScriptEscape='true'/> " + itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
							} else {
								var jsonResponse = JSON.parse(response);
								
								if(typeof jsonResponse.errorMessage=="undefined"){
									$('div.pageLoader').hide();
									$("body").css("overflow", "auto");
									$(".cart-popover").css({"opacity": 1});
									$(".cart-popover").show().stop().fadeOut(5000);
									/*$(".close-popup").delegate("click",function(){
										$(this).parents(".cart-popover").fadeout("fast");
									})*/
									if(mediaId != "0"){
										$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
									}else{
										$(".cart-popover").find(".cart-popover-img").children().attr("class",'no-image');
									}
									
									
									$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
								}
								else{
									$('div.pageLoader').hide();
									$("body").css("overflow", "auto");
		    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
		    		    			$("#myModal").show();	
								}
								/* alert("Part is added to your cart..."); */
							}
							 
						},
						error : function(e) {
							 $('div.pageLoader').hide();
						}
					});
					/*$(".close-popup").on("click",function(){
									$(this).parents(".cart-popover").hide();
								});*/
				});
		function getPriceForItems(items, organizationId) {
			var locale=${locale};
			var priceMsg = "<spring:message code='message.contact.customer.service' javaScriptEscape='true'/>";
			//$('div.pageLoader').show();
			$.ajax({
				async: true,
				type : "Get",
				data : {items:JSON.stringify(items),organizationId:organizationId},
				//contentType : 'application/json',
				dataType : "json",
				mimeType : 'application/json',
				url : "getcategoryPartPrice",
				success : function(response) {
                var locale=${locale};
					console.log(response);
					var partItemListPriceAvail = response.partItemVOList;
				/* 	$scope.$apply(function () {
			            $scope.partItemListPriceAvail123 = response.partItemVOList;
			        }); */
					for(var i=0;i<partItemListPriceAvail.length;i++){
						if(partItemListPriceAvail[i].priceNotShown == true){
							
							$("span.your-price").removeClass("strike-through").text(priceMsg);
							$("div.msrpShowHide, div.savePriceShowHide").hide();
							$("div.savePriceShowHide span.save-price").siblings("span").text("");
							$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
							$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set MSRP
							$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set price
							$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set saved price
							
							var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
							$("div.erp-price-avail .stock-count").text(inventoryMsg);//set inventory Message text
						}
						else{
							$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.erp-price-avail .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);//set inventory Message text
						
							if(typeof partItemListPriceAvail[i].msrp!="undefined" && partItemListPriceAvail[i].msrp>0){
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set MSRP
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set price
								$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set saved price
							}else{
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set price
							}
						}
						

						if(partItemListPriceAvail[i].savedPrice>=0){
							//$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set MSRP
							$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+partItemListPriceAvail[i].currencyCode).removeClass('price-loader');//set saved price
						}
						else{
							$("div.erp-price-avail .youSaveHide[data-saved='"+partItemListPriceAvail[i].partId+"']").hide();
							
						}
						if(partItemListPriceAvail[i].price<=0 && partItemListPriceAvail[i].msrp>=0){
							$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").hide();
						}
						
						if(partItemListPriceAvail[i].price<=0 && partItemListPriceAvail[i].msrp<=0){
							$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(priceMsg);
						}
						/* if(partItemListPriceAvail[i].msrp>=0 && partItemListPriceAvail[i].price <=0){
							$("div.erp-price-avail .msrpHide[data-msrp='"+partItemListPriceAvail[i].partId+"']").show();
							$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").hide();
						}else{
							$("div.erp-price-avail .msrpHide[data-msrp='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(priceMsg);
						} */
						
						//$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].availableQuantity);//set saved price
						$("div.cart-item-info .lead-time[data-leadtime='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].leadTime);//set saved price
						//$('span.unit').text(partItemListPriceAvail[i].uom);
					}
					if($('div.pageLoader').is(':visible')){
						$('div.pageLoader').hide();
					}
					
                    $('div.lazyLoader').addClass('hidden');
				},
				error : function(e) {
                    //$('div.pageLoader').hide();
                    $('div.lazyLoader').addClass('hidden');
				}
			});
		}
		
		$('.paginate_button').on('click', function(){
			var pageNumber=$(this).text();
				if($(this).hasClass('disabled')){
		    return false;
		   }		
			
			
			if(pageNumber=="First"){
				pageNumber = 1;
				$('.paginate_button.active').removeClass('active');
				$('.page1').addClass('active');
				//$('.paginate_button.active').removeClass('active');
			}
			else if(pageNumber=="Previous"){
				pageNumber = $('.paginate_button.active').children('a').text()-1;
			}
			else if(pageNumber=="Next"){
				pageNumber = $('.paginate_button.active').children('a').text();
				pageNumber = parseInt(pageNumber)+1;
				
			}
			else if(pageNumber="Last"){
				pageNumber = paginationCount;
			}
			else{
				$('.paginate_button.active').removeClass('active');
				$(this).addClass('active');
			}
			
			getItemsForCategory(prodCategoryId,prodCatalogId,pageNumber)
		})
		
		$('#result-per-page').on('change', function(){
			var pageNumber = 1;
			getItemsForCategory(prodCategoryId,prodCatalogId,pageNumber);
		});
		
 
		  $('#sort-by').on('change', function(){
			pageNumber = 1;
			counter = 1;
 			sortChange = true;
 			$("#product-catalog-hldr").html('');
 			$('.cart-details').html('');
 			$(this).prop('disabled',false);
 			var filterValue = JSON.parse(mainArr);
            filterValue["isFromSearch"]=false;
         	mainArr = JSON.stringify(filterValue);
 			getItemsForCategory(prodCategoryId,prodCatalogId,pageNumber,mainArr);
			pageNumber++;
			counter++;
		})
 
		/*$('#sort-by').on('change', function(){
			var pageNumber = 1;
			sortChange = true;
			$(this).prop('disabled',true);
			getItemsForCategory(prodCategoryId,prodCatalogId,pageNumber);
		})*/
		//Fixed on sort sccroll
		
		function getPaginationCount(resultPerPage, totalItemCount){
			var pageCount=0;
			if(resultPerPage>=totalItemCount){
				pageCount = 1;
			}
			else{
				pageCount = parseInt((totalItemCount/resultPerPage));
				if(totalItemCount%resultPerPage!=0)
					pageCount = pageCount + 1;
			}
			return pageCount;
		}
		
		function resetPagination(paginationCount){
			for(var i=1; i<=paginationCount;i++){
				$('.page'+i).remove();
			}
		}
		
		function setpaginationCount(paginationCount,startPoint){
			if(paginationCount>5)
				paginationCount = startPoint+4;
			
			var count = 1;
			for(var i=startPoint; i<=paginationCount;i++){
				$('#pageUl li:eq('+(count)+')').after('<li class="paginate_button page'+i+'" aria-controls="quote-list" tabindex="'+i+'" onclick="pageNumberClicked('+i+')"><a href="#">'+i+'</a></li>');
				count=count+1;
			}
		}
		
		function pageNumberClicked(pageNumber){
			getItemsForCategory(prodCategoryId, prodCatalogId, pageNumber);
		}
		
		function setPartPerPage(arg){
			partsPerPage = arg;
			prepareQuery();
		}
		
		function check(itemId,organizationId){
			var itemCategory=$("#headerName").text();
			document.location.href="getfullitemdetails?itemId="+itemId+"&itemCategory="+itemCategory+"&organizationId="+organizationId;
		}
		
		function handelSearchproductCatalog(productCatalogId,hasParts,displayName,productCategoryId) {
			var productCategoryId = productCategoryId;
			var productCatalogId = productCatalogId;
			var hasParts = hasParts;
			var lastClickedText=displayName;
			$("#headerName").text(lastClickedText);
			foundClickedItem=false;
			levelCount=0;  
			 arr1=[];
			 arr2=[];
			var myTreeDataString = '${productCatalogTreeData}';
			
			myTreeData = JSON.parse(myTreeDataString);
			console.log(myTreeData);
			var flag=false;
			var searchflag = false;
			var searchVariable= '${searchflag}';
			if(null != searchVariable && searchVariable !=""){
				searchflag = '${searchflag}';
			}
		 
			// for catalog click
			if (typeof productCatalogId == "undefined"
					&& typeof hasParts == "undefined") {
				// get only catalog details from json tree structure 
				var productCatalogs = [];
				var productCatalogList = {};
				for ( var key in myTreeData) {
					if (myTreeData.hasOwnProperty(key)
							&& myTreeData[key].productCatalogId == productCategoryId) {
						latestJsonObj = myTreeData[key].children;
						var clickedJsonObj = myTreeData[key].children;

						var productCategory = [];
						var productCategoryList = {};
						for ( var key in clickedJsonObj) {
							if (clickedJsonObj.hasOwnProperty(key)) {
								productCategory
										.push({
											"productCatalogId" : clickedJsonObj[key].productCatalogId,
											"hasParts" : clickedJsonObj[key].children,
											"description" : clickedJsonObj[key].description,
											"catalogDocumentLink" : clickedJsonObj[key].catalogDocumentLink,	
											"text" : clickedJsonObj[key].text,
											"mediaId" : clickedJsonObj[key].mediaId,
											"children" : clickedJsonObj[key].children,
											"pcatalogId" : clickedJsonObj[key].pcatalogId
										});
								
								if(typeof clickedJsonObj[key].catalogDocumentLink=="undefined" || clickedJsonObj[key].catalogDocumentLink==""){
									$("#catalog-page").hide();
								}else{
								$("#catalog-page").show(); 
							 	$("#catalog-page > a").attr("href",clickedJsonObj[key].catalogDocumentLink);
								}
							}
						}
						productCategoryList.productCategory = productCategory;
						console.log(productCategoryList.productCategory);
						$("#product-catalog-hldr").html('');
						$("#productCatalogTemplate").tmpl(
								productCategoryList.productCategory).appendTo(
								"#product-catalog-hldr");
						$("#resultInfo").hide();
						$("#pagination").hide();
					}
				}
			} else {
				// least category click which contains items
				if (hasParts === "true") {
					//var pageNumber = 1;
					pageNumber=1;
					counter=1;
					getItemsForCategory(productCategoryId, productCatalogId,pageNumber);
					pageNumber++;
				}
				// click on category which contains subcategory
				else {
					var productCatalogs = [];
					var productCatalogList = {};
					for ( var key in myTreeData) {
						if (myTreeData.hasOwnProperty(key)
								&& myTreeData[key].productCatalogId == productCatalogId) {
							var childrenJson = myTreeData[key].children;
							getClickedCategory(childrenJson, productCategoryId);
						}
					}
				}
			}
		}
		/* function fullItemDetails(itemId,organizationId){
			var itemCategory=$("#headerName").text();
			var phrase="";
			$('.breadcrumb').find('li').each(function(){
            // cache jquery var
            var current = $(this);
            if(phrase=="")
            	phrase = current.text();
            else
            	phrase = phrase+","+ current.text();
        });
			
			document.location.href="getfullitemdetails?itemId="+itemId+"&itemCategory="+itemCategory+"&organizationId="+organizationId+"&shopforpartbreadcrumb="+phrase;
			
		} */
		
		
		
		function fullItemDetails(itemId,organizationId){
			   var itemCategory=$("#headerName").text();
			   var phrase="";
			   
			   $('.breadcrumb').find('li').each(function(){
			            // cache jquery var
			            var current = $(this);
			            if(phrase==""){
			             phrase = current.text();
			            }else{
			             var parameter = null;
			             var subcategoryParameter = $('#treeShopforParts a.jstree-clicked').closest('li').attr('id');
			         var str = $(this).find('a').attr('onclick');
			    if(str == "breadCrumb()"){
			    	
			    }else if(str){
			     parameter = str.split("jstreeBreadCrumb('")[1].split("')")[0];
			    }
			    if(parameter != null){
			     phrase = phrase+","+current.text()+"_"+parameter;
			    }else if(subcategoryParameter != null){
			     phrase = phrase+","+current.text()+"_"+subcategoryParameter;
			    }else{
			     phrase = phrase+","+ current.text();
			    }
			   }
			    
			        });
			   
			  /*   var jsondata = $('#treeShopforParts.treeview-hldr').jstree(true).get_json();
			   // added by krupa for Breadcrumbs
			    var jsonVal = JSON.stringify(jsondata);
			    $('#jsonTree').val(JSON.stringify(jsondata).toString().replace(new RegExp('#', 'g'), '%23'));
			   $.ajax({
				   	  url : "sessionJsonTree",
			          type : 'POST',
			          data :{jsonData:JSON.stringify(jsondata)},     
			          success : function(response) {
			        	  document.location.href="getfullitemdetails?itemId="+itemId+"&itemCategory="+itemCategory+"&organizationId="+organizationId+"&shopforpartbreadcrumb="+replaceWith(phrase);
			          },  
			          error : function(e) {  
			          }  
		        });  
			    */
			    <!-- GPD-479 Kameshwari Popuri  -->
			   var breadCItem = $('#treeShopforParts a.jstree-clicked').closest('li').attr('id');
			   productCategoryId =  breadCItem.toString().split("_")[1];
			   productCatalogId =  breadCItem.toString().split("_")[0];
			   //History.pushState({},null,"getfullitemdetails?itemId="+itemId+"&itemCategory="+itemCategory+"&organizationId="+organizationId+"&shopforpartbreadcrumb="+replaceWith(phrase));
			   document.location.href="getfullitemdetails?itemId="+itemId+"&itemCategory="+itemCategory+"&organizationId="+organizationId+"&productCategoryId=" + productCategoryId+"&shopforpartbreadcrumb="+replaceWith(phrase)+"&productCatalogId="+productCatalogId;//+"&jsonTreeFlag=true&jsonData="+jsonVal.replace(new RegExp('#', 'g'), '%23');
			  // alert('**'+$('.breadcrumb li a').length);
			   
			  }
		//Added by krupa on 19-10-2015 for issue breadcrumbs was breaking for phrase contaning '&' as the system interpreted as a URL parameter. 
		function replaceWith(content) {
			return content.toString().replace(new RegExp('&', 'g'), '%26');
		}
		// end of Added by krupa on 19-10-2015 for issue breadcrumbs was breaking for phrase contaning '&' as the system interpreted as a URL parameter. 
		$(document).delegate('.total-items.output','change',function() {
			var itemCount = $(this).val();
			var partId = $(this).attr('id');

			if(!(/^ *[0-9]+ *$/.test(itemCount))){
				var msg = "<spring:message code='alert.shopforparts.valid.specialchar' javaScriptEscape='true'/>";
				$('.modal-body').text(msg)
				  $("#myModal").show();
				$('.total-items.output').val(1);
				//editQuantity(1,partId);
			}
			if(itemCount==0){
				var msg = "<spring:message code='alert.shopforparts.valid.qty.lessthan.one' javaScriptEscape='true'/>";
				$('.modal-body').text(msg)
				  $("#myModal").show();
				  $("#myModal").draggable({
		              handle: ".modal-header"
		          });
				$('.total-items.output').val(1);
				//editQuantity(1,partId);
			}
			else if(itemCount<0){
				var msg = "<spring:message code='alert.shopforparts.valid.qty.lessthan.one' javaScriptEscape='true'/>";
				$('.modal-body').text(msg)
				  $("#myModal").show();
				  $("#myModal").draggable({
		              handle: ".modal-header"
		          });
				$('.total-items.output').val(1);
				//editQuantity(1,partId);
			}else{
				//editQuantity($('.total-items.output').val(),partId);
			}
			
		});
		$(".custom-close").click(function(){
			   $("#myModal").hide();
			});
		$("#enlargeModal .custom-close").click(function(){
			   $("#enlargeModal").hide();
			   $("#enlargeModal .custom-modal-body").empty();
		});
		$("#btn_filter_SFP").click(function(){
			
		    $(".mobile_SFP").toggle('slide', {direction: 'left'}, 250);
		});
		var sortChange = false;
		
		// buy now click
		$(document).delegate('.buynow-click','click',function(e) {
     	   e.preventDefault();
    	  /*  var organizationId = $(this).parent().attr('data-orgId');
     	   var partId = $(this).parent().siblings('.cart-item-info').find('a').attr('data-itemId');
     	   var quantity = $(this).parent().siblings('.quantity-change').find('.total-items').val(); */

     	  var organizationId = $(this).parent().data('orgid');
    	  var partId = $(this).parent().data('itemid');
    	  var quantity = $(this).parents(".search-parts-template").find(".quantity-change").children("div.spinner-control").find("input").val();
    	  var partPrice = $(this).parents(".search-parts-template").find(".erp-price-avail").find('.your-price1').find("span.your-price").html();
     	  //var partPrice = $(this).siblings('.your-price1').find("span.your-price").html();
     	   if(partPrice == null || partPrice == '' || partPrice.indexOf("-1")==0)
     		   partPrice = $(this).parents(".search-parts-template").find(".erp-price-avail").find('.msrpShowHide').find('span.msrp-price').html();
     	   
     	   var idxOfCurrency = partPrice.indexOf(" ");     	   
     	   if(idxOfCurrency!=null || idxOfCurrency!=-1)
     		  partPrice = partPrice.substring(0, idxOfCurrency);
     	       	   
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
		        	  
		        	  /* Edited by Pujith for GPD-10. Reviewed by Krupa */
		        	  displayPrompt('directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&partPrice='+partPrice);
		          },  
		          error : function(e) {  
		        	  $('div.pageLoader').hide();
		          }  
	        });
        })

        
    	// Onclick of Bread crumb 
		
    	function jstreeBreadCrumb(prodId){
    			
    			 $("#treeShopforParts").jstree(true).deselect_all();
    			 $("#treeShopforParts").jstree(true).select_node(prodId);
    		}
       
		$(function(){
			
			  $("#treeShopforParts.treeview-hldr").on('ready.jstree', function (e, data) {
				  var productCatalogId = '${productCatalogId}';
					var searchflag = false;
					var searchVariable= '${searchflag}';
					if(null != searchVariable && searchVariable !=""){
						searchflag = '${searchflag}';
					}
						if(searchflag){  
							$('#treeShopforParts.treeview-hldr').jstree(true).select_node(productCatalogId);
						}
				 	
				  });
	 
		})
		
		function editQuantity(quantity,partId){

			$.ajax({
	          type : "Get",
	          data : {partId: partId,quantity: quantity},
	          contentType: 'application/json',
	          mimeType: 'application/json',
	          url : "editquoteitemquantity",
	          cache : false,
	          success : function(response) {

	          },
	          error:function(xhr,status,error){

	          }
		});
		}
		if(bookMarkSearch){
			History.pushState({state: '#'},'${properties['global.page.title']}',"./shopforparts?search=");
			bookMarkSearch = false;
		}
		//back button starts 
		var manualStateChange = true;
		History.Adapter.bind(window,'statechange',function(e){
			e.preventDefault();
			var searchFlow = document.referrer.split("/");
			//OM-1570 Start
			//if(searchFlow[searchFlow.length-1] == 'searchrequest'){
				/* document.forms[0].action="searchrequest";
           		document.forms[0].submit(); */
           		//breadCrumb();
           		//return false;
			//}
			//OM-1570 End
			
			var previousStateNode = History.getState().url.split("?breadCrumFullItem=")[1];
				if(!$('#treeShopforParts.treeview-hldr').jstree(true).is_selected(previousStateNode) && typeof(previousStateNode) != "undefined"){
					$("#enlargeModal").hide();
					$("#filterThumbnailDiv").hide();
					$('#treeShopforParts.treeview-hldr').jstree(true).deselect_all();
					$('#treeShopforParts.treeview-hldr').jstree(true).select_node(previousStateNode);
				}else if(typeof(previousStateNode) == "undefined"){
					location.reload();
				}
		});
		
		if(bookMarkSearch){
			History.pushState({state: '#'},"${properties['global.page.title']}","./shopforparts?search=");
			bookMarkSearch = false;
		}
	</script>

</body>
</html>
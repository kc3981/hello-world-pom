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
<jsp:include page="googleAnalytics.jsp"/>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>

<link rel="stylesheet" href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">



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
<style>

.product-info {
	text-align: center;
}

.list-search {
	max-height: 150px !important;
	overflow-y: auto;
	height: auto;
	list-style: none;
	padding-left: 1em;
}

.list-search a, .more {
	font-size: 0.76em;
}

.filterLabel {
	font-weight: normal;
	font-size: 0.87em;
	width: 100%;
	cursor: pointer;
}

.clearall {
	font-size: 0.8em;
}

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

:-moz-placeholder {
	/* Firefox 18- */
	color: #ccc;
}

::-moz-placeholder {
	/* Firefox 19+ */
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

 

)
{
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

.breadcrumbs-list.fixed {
	/*width: 30% !important;*/
    padding: 8px 0;
    background: #fff;
}
/* #facetfilter{
	position: fixed;
    overflow: auto;
    height: 73%;
} */

/*#facetfilter{
   width: 285px;
}
#facetfilter .panel-heading {
    padding: 6px 7px;
}
#facetfilter .panel-heading h4 {
    font-size: 12px;
    text-transform: capitalize;
}*/
#facetfilter .panel-group .panel+.panel, #facetfilter .panel-group .panel {
    border-radius: 3px 3px 0 0;
    border: 1px solid #e5e5e5;
    box-shadow: 2px 2px 4px -1px #c1c1c1;
}

#custom-search-input {
    padding: 1px 3px;
    border-radius: 3px;
}
#custom-search-input .glyphicon-search {
	font-size: 14px;
	top: 0;
}
.GridsDisplay div.quantity-change, .GridsDisplay div.erp-price-avail {
	width: 100% !important;
}

.GridsDisplay button {
	float: none !important;
	margin-left: 0;
}

.GridsDisplay .mil-langbut-wrapper {
	float: none;
}
.GridsDisplay {
	text-align: center !important;
	height: auto !important;
	vertical-align: top;
}
.GridsDisplay .unit {
	/* position: static !important; */
	/*right: -10px;*/
}
@media(min-width:300px){
	.searchPreferences {
		width: 100%;
	}
	.GridsDisplay {
    	width: 100% !important;
    }
    .vehicleshldr .search-parts-template .fav-btn, .vehicleshldr .search-parts-template .close-btn{
    	margin : 0 !important;
    }
}



@media (min-width: 992px){
	.searchPreferences {
		top:0px;
		position:relative;
		min-height:43px;
	}
	.GridsDisplay {
		width: 31.5% !important;
	}
	div#product-catalog-hldr {
		margin-top: 16px;
	}
	.fixedSearchPreferences {
    	margin-top: 159px;
    }
}
@media(min-width:1200px){
	.GridsDisplay {
    	width: 31.5% !important;
    }
}


/* .searchPreferences {
    top: 0px;
    margin-left: 0;
    height: 43px; 
    position: relative;
} */

.primary div#custom-search-input {
	width: 200px;
	margin-top: 0.2em;
	float: right;
}

div.paginationStyle {
	text-align: center;
	margin-top: 5px;
}

.hide {
	display: none;
}

#slider-range {
	height: 12px;
	border: 1px solid #ccc;
	padding: 5px;
	overflow: visible;
	margin: 10px;
}

.ui-slider .ui-slider-handle {
	width: 1em;
	height: 1em;
}

/* New Styles for veh template*/
	facet-filter-directive {
	    display: block;
	}
	.GridsDisplay {
		margin: 10px 1%;
    	/*width: 31.5% !important;*/
    }
    .GridsDisplay .item-img-rep {
    	height: 130px;
    }
	.GridsDisplay .item-img-rep , .GridsDisplay .cart-item-info{
	    width: 100%;
	}
	.GridsDisplay .cart-item-info .b-label{
		font-size: 11px;
	}
	.GridsDisplay .cart-item-info .b-label p{
		margin: 0;
	}
	.search-parts-template {
	    width: 100%;
	    height: auto;
	    display: inline-block;
	    padding: 12px;
	    margin-bottom: 10px;
	}
	.search-parts-template.GridsDisplay{
		margin-bottom: 1px;
	}
	.search-parts-template .imagesample {
	    display: inline-block;
	    padding: 0 10px;
	    vertical-align: top;
	    clear: left;
	    margin-top: 15px;
	    width:30%;
	}
	.search-parts-template .imageContent {
	    display: inline-block;
	    padding: 0 10px;
	}
	.search-parts-template .imageContent p {
	    margin-bottom: 0px;
	    font-size: 12px;
	    color: #333;
	    font-weight: 600;
	    overflow: hidden;
    	text-overflow: ellipsis;
    	white-space: nowrap;
	}
	.search-parts-template .imageContent .b-label{
		font-size: 12px;
    	font-weight: 400;
    	margin-top: 5px;
    	height:72px;
	}
	
	.vehicleshldr .search-parts-template {
		background: #eceff6;
		border: 1px solid #ccc;
	    margin: 10px 1%;
	    vertical-align: top;
	}
	.vehicleshldr .search-parts-template h4 span {
	    font-size: 15px;
	   /*  color: #ca1a1a; */
	}
	.vehicleshldr .search-parts-template .imagesample{
		width: 38%;
		float:left;
	}
	.vehicleshldr .search-parts-template .imageContent{
		width: 58%;
	}
	.vehicleshldr .search-parts-templates .imageContent span {
	    display: inline-block;
	    word-wrap: break-word;
	    margin-left: 0px;
	    color: #756f6f;
	    font-size: 13px;
	}
	.vehicleshldr .search-parts-template.GridsDisplay .imagesample{
		/*width: 155px;*/
			width: 100%;
	}
	.vehicleshldr .search-parts-template.GridsDisplay .imageContent{
		width: 100%;
		padding-top: 15px;
	}
	
	.vehicleshldr .search-parts-template .fav-btn, .vehicleshldr .search-parts-template .close-btn
	{
		/* color: #b52d0b; */
	    cursor: pointer;
	    display: inline-block;
    	font-size: 20px;
    	float: right;
    	line-height: 20px;
    	margin: -5px 8px;
	}
	.reftextarea {
	    resize: none;
	    width: 100%;
	}
	.addReference-box, .fav-btn, .close-btn{
		display: none;
	}
	.addReference-box .btn-primary{
		/* background-color: #c80000;
    	border-color: #c80000; */
	}
	.vehicleshldr .addReference-box{
		margin-left: 0px;
		min-height:99px;
	}
	.vehicleshldr .addReference-box,
	.vehicleshldr .fav-btn, .vehicleshldr .close-btn{
		display: block;
	}
	.vehicleshldr .GridsDisplay .machineTitle h4 
	{
		display: block;
		width: 100%;
    	text-align: left;
	}
	.vehicleshldr .GridsDisplay .addReference-box {
	    height: 125px;
	}
	.vehicleshldr .ref-text-val{
		
		font-size:13px;
		line-height:2;
		word-wrap: break-word;
	}
	.vehicleshldr .GridsDisplay .ref-text-val{
		display: block;
		font-size:12px;
		height: 52px;
		line-height: 1.45;
	}
	.column-paddings {
	    padding: 9px 0px;
	}
	.item-img-rep img {
    	max-height: 130px;
	}
	.search-parts-template.GridsDisplay  .item-img-rep img {
    	height: 75px;
	}
	.search-parts-template.GridsDisplay .imagesample {
   	 width: 100%;
	}
	.search-parts-template.GridsDisplay .cart-item-info .b-label p{
		margin: 0;
	}
	.search-parts-template.GridsDisplay .cart-item-info p {
	    margin: 2px 0;
	}
	.search-parts-template.GridsDisplay div.quantity-change, 
	.search-parts-template.GridsDisplay div.erp-price-avail{
		margin-top: 2px !important;
		font-size: 13px;
	}
	.search-parts-template.GridsDisplay div.erp-price-avail {
	    min-height: 147px;
	}
	.search-parts-template.GridsDisplay .cart-item-info {
    	padding-top: 5px;
    }
    .search-parts-template.GridsDisplay .no-image{
    	height:75px;
    }
    .search-parts-template.GridsDisplay .item-img-rep {
	    height: 75px;
	}
	.search-parts-template.GridsDisplay .spinner-control{
		margin-top:5px;
	}
	.search-parts-template .unit{
		/*left: 70px;
	    top: 42px;*/
	}
	.search-parts-template.GridsDisplay .unit{
	    top: 13px;
   		/*left: auto;
    	right: auto;*/
	}
	.product-info-container > .product-info > a:last-child {
		height:40px;
		white-space:normal !important;
	}
	.product-info-container {
		/*padding:5px;*/
		padding:5px 5px 0px 5px;/*guru -responisive*/
	}
	
	.quantity-change{
		/* top: 50px; */
	}
.fixedSearchPreferences{
    position: static;
    margin-left: 1px;
    margin-top: 0;
    padding-top: 0;
    padding-bottom:10px;
}
.disable-button{
	cursor: not-allowed;
    pointer-events: none;
    color: #E6E6E6;
}

.enable-button{
	cursor: pointer;
    pointer-events: auto;
	
}
</style>
<!-- Javascript Library-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"  type="text/javascript"></script>
<script	src="//ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer   type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer   type="text/javascript"></script>
<%-- <script src="../js/jstree.js?version=${properties['application.version']}" type="text/javascript"></script> --%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jscroll/2.2.4/jquery.jscroll.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<script src="../js/gensuite-ui.js?version=${properties['application.version']}"    type="text/javascript"></script>
<script src="../js/custom.scripts.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer  ></script>
<script src="../js/advance-filter.js?version=${properties['application.version']}" defer></script>
<script	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer  ></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.4/jquery.i18n.js?version=${properties['application.version']}" defer ></script>


</head>

<body ng-app="facetModule" ng-controller="facetCtrl">
<jsp:include page="googleAnalyticsbody.jsp" />
<c:set var = "isVinNoRequired" value="${properties['vinNo.required']}"></c:set>
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
					<li><a href="homepage"> <spring:message
								code="label.footer.home" />
					</a></li>
				</ul>
			</div>
			<div class="btn hidden-md hidden-lg" id="btn_filter"><i class="fa fa-filter" aria-hidden="true"></i></div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="col-lg-3 col-md-3  column-paddings responsive-padding mobile_facet facet_responsive"
					id="shopForPartLeft">

					<!-- Left panel Facet Filter -->
					<div ng-cloak id="facetfilter" id="accordion">
						<h3><spring:message code="label.show.results" /></h3>
						<div class="subFilters">
							<!-- Accordian Implementation -->
							<facet-filter-template></facet-filter-template>
							<!-- EO Accordian Implementation -->
						</div>
					</div>

					<!-- EO Left panel Facet Filter -->
					<div id="div-hidden-left" class="hidden"></div>
					<input type="hidden" id="refreshed" value="no">
				</div>
				<div align="center" id="noCatalog" style="display: none;">
					<p>
						<spring:message code="label.shopforparts.nocatalog" />
					</p>
				</div>
				<div
					class="col-lg-9 col-md-9 col-sm-12 col-xs-12 column-paddings responsive-padding"
					id="catalog-content-hldr">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="resultInfo" style="border-bottom: 1px solid #eee;"
						ng-if="productInfo">
						<filter-search-result-rt></filter-search-result-rt>
					</div>
					<div ng-cloak
						class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings ${requestOrigin}hldr"
						id="product-catalog-hldr" ng-if="productCatalogueInfo">
						<div
							class="searchPreferences col-lg-12 col-md-12 col-sm-12 fixedSearchPreferences">
							<div class="primary">
								<div class="ItemCountDisp col-md-3 p10-sm">
									<p ng-cloak>
										<spring:message code="label.item.count" />&nbsp;:&nbsp;<span ng-cloak ng-bind="partCount"></span>
									</p>
								</div>

								<p ng-show="sortByFlag" class="p10"><spring:message code="label.sort_by" /></p>
								<select ng-show="sortByFlag" ng-model="$parent.orderBySort"
									ng-change="sortByFacet(orderBySort)">
									<!-- Start: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C -->
									<option value="partPopularity" selected><spring:message code="label.part_popularity" /></option>
									<!-- End: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C -->
									<option value="itemNumber"><spring:message code="label.item_no" /></option>
									<option value="itemDescription"><spring:message code="label.item_description" /></option>
								</select>

								<div id="gridOrList" class="p10-sm">
									<a class="gridView" href="#" ng-click="GridsDisplay=true"><span
										class="glyphicon glyphicon-th-large"></span><spring:message code="label.grid" /></a> <a
										class="listView" href="#" ng-click="GridsDisplay=false"><span
										class="glyphicon glyphicon-th-list"></span><spring:message code="label.list" /></a>
								</div>

								<div ng-show="searchFilterFlag" id="custom-search-input" class="xs-searchFilterFlag">
									<div class="input-group col-md-12">
										<input type="text" class="form-control input-lg"
											title="<spring:message code='search.min.characters'></spring:message>" placeholder="<spring:message code="label.search.search"/>" ng-model="$parent.partSearchBar" /> <span
											class="input-group-btn">
											<button class="btn btn-info btn-lg" ng-click="search(partSearchBar)" ng-class="{'disable-button':($parent.partSearchBar.length == 1),'enable-button':($parent.partSearchBar.length != 1)}"
											type="button">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div>
								</div>

							</div>
						</div>

						<p id="permissionError" style="display: none; color: red">
							<spring:message code="search.noaccesstomachinecatalog"></spring:message>
							<span></span>
							<spring:message code="search.pleasecontactadministrator"></spring:message>
						</p>
						<product-catalogue-holder></product-catalogue-holder>
					</div>
				</div>
			</div>

			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
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

			<!-- footer container -->
			<a href="javascript:void(0);" class="cd-top"
				title="<spring:message code='label.scroll.top'/>"> <spring:message
					code="label.footer.top" />
			</a>
			<footer>
				<%@ include file="footer.jsp"%>
			</footer>


			<div class="lazyLoader hidden">
				<div class="lazySpinner"></div>
			</div>
		</form>
	</div>
	<div class="pageLoader" style="display: none; oveflow: hidden;">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>
	<!-- Javascript Plugins -->


	<script type="text/javascript">
	function loadBundles() {
		  var lang = document.getElementById('language_id_').value;
		  $.ajax({
				type: "GET",
				 async :false,
				url: "getLanguage",
				success: function(response){
				    var scriptContent = $($.parseHTML(response, document, true)).filter('script').text();
				    $.globalEval(scriptContent);
				},
				error: function(e){
				//alert('Error: ' + e);
				}
			});	
		}
                    $(document).ready(function($) {
                    	//Highlight the main menu  
                        // browser window scroll (in pixels) after which the "back to top" link is shown
                        var offset = 300,
                            //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
                            offset_opacity = 1200,
                            //duration of the top scrolling animation (in ms)
                            scroll_top_duration = 700,
                            //grab the "back to top" link
                            $back_to_top = $('.cd-top');
                         
                        //hide or show the "back to top" link
                        $(window).scroll(function() {
                            ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible'): $back_to_top.removeClass('cd-is-visible cd-fade-out');
                            if ($(this).scrollTop() > offset_opacity) {
                                $back_to_top.addClass('cd-fade-out');
                            }
                        });
                        //smooth scroll to top
                        $back_to_top.on('click', function(event) {
                            event.preventDefault();
                            $('body,html').animate({
                                scrollTop: 0,
                            }, scroll_top_duration);
                        });
                    });
                   
                </script>
	<!-- EO Left panel Facet Filter -->

	<!-- Left Panel Filter Template -->
	<div style="display: none;">
		<div id="facetTemplateContent">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default" ng-show="showfilter">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								href="#category"> <spring:message code="label.applied_filters" /> <span
								class="glyphicon glyphicon-chevron-down"></span>
							</a>
						</h4>
					</div>
					<div id="category" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="filterBody">
								<a href="#" title="Clear All" ng-click="clearAll()"
									class="clearall"><spring:message code="label.clear_all" /></a>
							</div>
							<ul class="list-search">
								<li ng-repeat="w in selectedFilterListObj"><a href="#">{{w.name}}<span
										class="glyphicon glyphicon-remove removClass"
										ng-click="clear(w.name, w.id)"></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="panel panel-default" id="{{x.facetId}}"
					ng-repeat="x in facetData"
					ng-show="x.showFacet && x.facetData.length > 0 &&  ( ( shopforpartsPage && x.facetCategoryId == 1 || x.facetCategoryId == 3 ) || ( machineFlag && x.facetCategoryId == 2 || x.facetCategoryId == 3  ) || ( globalsearchFlag ) )">
					<!-- NREV-1328:Added By Hari Shankar -->
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								href="#acc{{$index}}"> {{x.facetName}} <span
								class="glyphicon glyphicon-chevron-down"></span>
							</a>
						</h4>
					</div>
					<div id="acc{{$index}}" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="filterBody">
								<div id="custom-search-input"
									ng-show="x.facetData.length > 5 && x.facetDisplay != 'DROP DOWN' && x.facetDisplay != 'SLIDER'"
									ng-init="limitNum=5">
									<div class="input-group col-md-12">
										<input type="text" id="category-keyword"
											class="form-control input-lg" placeholder="<spring:message code="label.search.search"/>"
											ng-model="facetFilter" /> <span class="input-group-btn">
											<button class="btn btn-info btn-lg" id="category-search"
												type="button">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div>
								</div>
								<ul class="list-search">
									<li
										ng-repeat="y in x.facetData | filter: facetFilter | limitTo: limitNum"
										ng-if="x.facetDisplay=='CHECK LIST'"><label
										class="filterLabel"> <input type="checkbox"
											data-name="{{x.facetName}}" value="{{x.facetId}}-{{$index}}"
											ng-model="checkBool"
											ng-click="selectedFiltersList(checkBool, y, x.facetId+'-'+$index)"
											class="filterCheckBox"> {{y}}
									</label></li>
									<li
										ng-repeat="y in x.facetData | filter: facetFilter | limitTo: limitNum "
										ng-if="x.facetDisplay=='RADIO BUTTON'"> 
									<label class="filterLabel"> 
										<input style="margin-right:5px" type="radio" ng-model="typedropdown" 
										ng-click="globalSearchRequest(mySplit(y,1))" name="{{x.facetName}}" ng-value="mySplit(y,1)" />
										<span style="position: relative;bottom: 2px;">{{mySplit(y,0)}}</span>
									</label> </li>
									<li ng-if="x.facetDisplay == 'SLIDER'"><label class="left">{{minVal}}</label>
										- <label class="right">{{maxVal}}</label>
										<div id="slider-range" ng-model="rangeModel"
											data-name="{{x.facetName}}" min="{{minVal}}" max="{{maxVal}}"></div>
										<input class="hidden" type="range" id="myRange"
										data-name="{{x.facetName}}" ng-model="rangeModel"></li>
									<li ng-if="x.facetDisplay == 'DROP DOWN'"><select
										class="col-lg-12 col-md-12 col-sm-12 col-xs-12 dropdownfacet"
										data-name="{{x.facetName}}"
										ng-change="dropDownValue != 'select' && selectedFiltersList(true, dropDownValue, x.facetId+'-dropdown')"
										ng-model="dropDownValue" ng-init="dropDownValue='select'">
											<option value="select">Select</option>
											<option value="{{y}}" ng-repeat="y in x.facetData">{{y}}</option>
									</select></li>
								</ul>
								<a href="javascript:void(0)"
									ng-show="((x.facetData | filter: facetFilter).length > limitNum) && x.facetDisplay != 'DROP DOWN' && x.facetDisplay != 'SLIDER'"
									ng-click="limitNum = x.facetData.length" class="more">more</a>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Ends Left Panel Filter Template -->
	<!-- Right Panel Search Template -->
	<div class="dummyHold" id="searchResultsTemplate"
		style="display: none;">
		<div
			class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12"
			ng-repeat="z in searchResultsRt" ng-model="checkBool"
			ng-click="selectedFiltersList(true, z.facetValue, onLoadFirstFacetId+'-'+$index)">
			<div class="product-info" data-id="144" data-pcatalog="144"
				data-parent="" data-cataloglink="" data-hasparts="false"
				data-catalogid="144">
				<a href="#" class="productCatalogClick"
					ngClass="z.mediaId == '0' ?'no-image':''"><span class="helper"></span>
					<%-- <img src="${sessionScope.logo}"> --%> <img
					src="${properties['docserver.url']}?media={{z.mediaId}}&thumbnail=true" />
				</a> <a href="#" class="productCatalogClick" title="{{z.facetValue}}">{{z.facetValue}}</a>
			</div>
		</div>
	</div>
	<!--Ends  Right Panel Search Template -->
	<!--Product Catalogue Right Panel Template -->
	<!-- Search Parts Directive Template -->
	<div id="showsearchPartsTmpl" style="display: none">
		<div class="row row-eq-height">
			<div class="col-lg-2 col-md-3 col-sm-2 col-xs-12 item-img-rep">
				<a href="#" ng-if="itemMediaId !=0"
					ng-click="fullItemDetails(itemPartId,itemOrganizationId)"> <%--INC-2498 fix starts(Developed by : Swetha)--%>
					<img id="image"
					src="${properties['docserver.url']}?media={{itemMediaId}}&thumbnail=true">
					<div ng-if="isActualImage == 0"
						class="waterMarkForChildPartsForSearch">
						<span
							style="/* margin: 13px; */font-weight: 600;font-size: 8px;/* left: -6px */"
							class="label1FontFamily"><spring:message
								code="label.watermark.text1" /> </span> <span
							style="/* margin: 17px; *//* font-size: 7px; *//* font-weight: 400; *//* left: -11px; */"
							class="label2FontFamily"><br> <spring:message
								code="label.watermark.text2" /></br></span>
					</div>
				</a>
				<%--INC-2498 fix ends--%>
	
				<a href="#" ng-if="itemMediaId==0" class="no-image"
					ng-click="fullItemDetails(itemPartId,itemOrganizationId)"> <!-- {{itemCommercialDescription}} -->
					</span>
				</a>
			</div>
			<div id="part{{itemPartId}}" class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info xs_img_center pt-xs-10">
				<h4>
					<a href="javascript:void(0);"
						ng-click="fullItemDetails(itemPartId,itemOrganizationId)"
						data-itemId="{{itemPartId}}" data-mediaId="{{itemMediaId}}"
						data-itemNumber="{{itemPartNumber}}"><spring:message
							code="label.item.shop" /> # {{itemPartNumber}}</a> 
					<a class="fav-icon" title="Favorites" ng-if="!(isGuestUser) && itemOrderable == 'true'"
						ng-click="addFavouritesForShopForParts(itemPartId,itemMediaId,itemOrganizationId,itemFavorite,itemOrderMultiple,$event)"><i
						class="fa fa-star "
						ng-class="{'fav-item':(itemFavorite == true),'no-fav-item':(itemFavorite == false)}"></i></a>
				</h4>
				<div>
					<strong>{{itemCommercialDescription}}</strong>
				</div>
				<%-- <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> --%>
				<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
					<div>
						<strong>{{itemEngineeringDescription}}</strong>
					</div>
				</sec:authorize>
				<c:if test="${properties['display.legacy.part']}">
					<div ng-show="itemlegacyNumber.size != 0">
					<p>
						<spring:message code="search.part.legacypartnumber"></spring:message>
						: <span ng-show="itemlegacyNumber.length == 0">None</span> <span
							ng-if="itemlegacyNumber.length != 0"
							ng-repeat=" l in itemlegacyNumber ">{{l}}<span
							ng-if="!$last">,</span></span>
						<!-- NREV-1420 Added by Hari Shankar Reviewed by Dibu-->
					</div>
				</c:if>
				
				
				<%-- <!-- Start: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
 				  <div ng-show="itemSuperseeded.length > 0">
					<p>
					<spring:message code="search.part.superseededpartnumber"/>{{itemSuperseeded}}
 				    </p>
 				</div>
 				<!-- End: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu --> --%>
 				
				<div>
					<c:if test="${properties['display.organizationName']}">
						<p>
							<spring:message code="label.organization"></spring:message>
							<span>: {{itemClogORGANIZATION_NAME}}</span>
						</p>
					</c:if>
	
					<!-- NREV-1420 Added by Hari Shankar Reviewed by Dibu-->
					<c:if test="${properties['show.orderMultiple']}">
						<p>
							<spring:message code="label.all.ordermultiples"></spring:message>
							<span>{{itemOrderMultiple}}</span>
					</c:if>
				</div>
				<%-- </sec:authorize> --%>
				<div class="b-label">
					<%-- <div><spring:message code="search.part" /> : {{itemOrganizationName}} </div> --%>
					<!-- <p class="order-multiples-lbl"><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/>  {{itemOrderMultiple}}</p> -->
					<!-- <strong><span class="stock-count" data-avail="${'${'}itemId}"></span> <spring:message code="label.promotion.instock"/>, <spring:message code="label.promotion.leadtime"/> <span class="lead-time" data-leadtime="${'${'}itemId}"></span> Day(s)</strong></div> -->
					
				</div>
				<p ng-repeat="us in userDefinedFacets">{{us}}</p>
			</div>
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change xs_img_center pt-xs-10 ">
				<div class="spinner-control"
					data-ordermultiplekey=" {{itemOrderMultiple}}">
					<!-- <input type="text" id="{{itemPartId}}" class="total-items output" maxlength="6" value="{{itemOrderMultiple}}" style="width:40px;text-align:center;"> -->
					<input type="text" id="{{itemPartId}}" class="total-items output"
						maxlength="6" value="{{itemOrderMultiple}}"
						style="width: 40px; text-align: center;">
					<div class="qty">
						<a href="javascript:void(0);" class="item-increment"> <i
							class="fa fa-caret-up"></i>
						</a> <a href="javascript:void(0);" class="item-decrement"> <i
							class="fa fa-caret-down"></i>
						</a>
					</div>
				</div>
				<span class="unit">{{itemUom}}</span>
			</div>
			<div
				class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail itemPartId xs_img_center pt-xs-10"
				data-allVal="" data-orgId="{{itemOrganizationId}}"
				data-partId="{{itemPartId}}" data-partNumber="{{itemPartNumber}}"
				data-mediaId="{{itemMediaId}}">
				<!-- GPD-2522:Added by Pujith, reviewed by Venkatasiva Reddy -->
				<sec:authorize access="hasRole('ROLE_PRICE')">
				<div ng-class="{'hide' : (itemMsrpStr == '-1')}"
					data-msrpShowHide="{{itemPartId}}" data-msrp="{{itemPartId}}" 
					class="msrpShowHide msrpHide">
					<spring:message code="label.msrp" />
					: <span class="msrp-price"
						ng-class="{'price-loader': (itemMsrpStr == '')}"
						data-msrp="{{itemPartId}}">{{itemMsrpStr}} </span>
				</div>
				<div ng-class="{'hide' : (itemPriceStr == '-1')}" class="your-price1"
					data-price="{{itemPartId}}">
					<spring:message code="label.your.price" />
					: <span class="your-price " data-price="{{itemPartId}}"
						ng-class="{'price-loader': (itemPriceStr == '')}">{{itemPriceStr}}
					</span>
				</div>
				<div ng-class="{'hide' : (itemSavedPriceStr == '-1')}"
					data-savePriceShowHide="{{itemPartId}}" data-saved="{{itemPartId}}"
					class="blueColor youSaveHide savePriceShowHide">
					<spring:message code="label.you.save" />
					: <span class="save-price " data-saved="{{itemPartId}}"
						ng-class="{'price-loader': (itemSavedPriceStr == '')}">{{itemSavedPriceStr}}</span>
					<span><spring:message code="lable.item.each" /></span>
				</div>
				</sec:authorize>
					<sec:authorize access="!hasRole('ROLE_PRICE')">
				<div >
					<spring:message code="message.guest.login" />
				</div>
				</sec:authorize>
				<!-- GPD-2522:Added by Pujith, reviewed by Venkatasiva Reddy -->
				<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
				<div>
					<strong><span class="stock-count" data-avail="{{itemPartId}}">{{itemInventory}}</span></strong>
				</div>	
				</sec:authorize>
		 </div>
	 </div>
	 <div class="col-xs-12 row-eq-height" data-orgid="{{itemOrganizationId}}"
				data-partid="{{itemPartId}}" data-partnumber="{{itemPartNumber}}"
				data-mediaid="{{itemMediaId}}">
			<sec:authorize access="hasRole('ROLE_CART')">	
			<!-- GPD-2524:Added by Pujith, reviewed by Venkatasiva Reddy -->
			<sec:authorize access="hasRole('ROLE_PRICE')">
				<div ng-if="itemOrderable == 'true'" class="col-lg-12 col-sm-8 mil-button-wrapper">
					<div class="mil-langbut-wrapper">
						<button
							class="langbut btn btn-addtocart cart-small mil-button mtop10x col-lg-9 col-md-12 col-xs-12 add-to-cart" 
							>
							<spring:message code="quick.search.addtocart" />
						</button>
					</div>
					<div ng-if="!shopforpartsPage" class="mil-langbut-wrapper">
						<sec:authorize access="hasRole('ROLE_ORDER')">
							<button ng-if="(itemWhereUsedFlag == 'false')"	class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12  mil-button buynow-click"
								ng-click="buynow();" >
								<spring:message code="label.buynow" />
							</button>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
								<button ng-if="(itemWhereUsedFlag == 'true') && displayWhereUsed " ng-click="whereUsed(itemPartId)" class="langbut btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 mil-button" style="height:35px;"><spring:message code="search.whereused" /></button>
						</sec:authorize>
					</div>
					<div ng-if="shopforpartsPage" class="mil-langbut-wrapper">
						<sec:authorize access="hasRole('ROLE_ORDER')">
							<button
								class="langbut btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 mil-button buynow-click"
								ng-click="buynow();">
								<spring:message code="label.buynow" />
							</button>
						</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_ORDER')">
							<button
								class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active mil-button"
								>
								<spring:message code="label.buynow" />
							</button>
						</sec:authorize>
					</div>
				</div>
				</sec:authorize>
				<div ng-if="itemOrderable == 'false'" class="col-lg-12 col-sm-8" style="text-align: center">
					<div class="mil-langbut-wrapper">
						<button
							class="langbut btn btn-addtocart cart-small mil-button mtop10x col-lg-9 col-md-12 col-xs-12 not-active">
							<spring:message code="quick.search.addtocart" />
						</button>
					</div>
					<div ng-if="shopforpartsPage" class="mil-langbut-wrapper">
						<button
							class="langbut btn btn-buynow cart-small mil-button mtop10x col-lg-9 col-md-12 col-xs-12 not-active"
							>
							<spring:message code="label.buynow" />
						</button>
						</div>
						<div ng-if="!shopforpartsPage" class="mil-langbut-wrapper">
							<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
								<button
									ng-if="(itemWhereUsedFlag == 'true') && displayWhereUsed "
									ng-click="whereUsed(itemPartId)"
									class="langbut btn btn-buynow mtop10x cart-small mil-button col-lg-9 col-md-12 col-xs-12 ">
									<spring:message code="search.whereused" />
								</button>
							</sec:authorize>
						</div>
				</div>
				
				</sec:authorize>
		</div>
	</div>
	
	<div id="showsearchCategoryTmpl" style="display: none">
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 item-img-rep imagesample">
			<a href="${properties['redirect.shopforparts.url']}{{shopForPartsUrl}}" ng-if="categoryMediaId !=0">
				<img id="image"
				src="${properties['docserver.url']}?media={{categoryMediaId}}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}">
			</a>
			<a href="${properties['redirect.shopforparts.url']}{{shopForPartsUrl}}" ng-if="categoryMediaId==0" class="no-image"> 
				</span>
			</a>
		</div>
		<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info xs_img_center pt-xs-10">
			<h4>
				<a href="${properties['redirect.shopforparts.url']}{{shopForPartsUrl}}"><spring:message
						code="search.placeholder.productcategory" /> : {{productCategoryName}}</a>
			</h4>
				<strong> {{productCategoryName}}</strong>
			<div>
				<strong><spring:message
						code="search.productcat" /> : {{productCatalogName}}</strong>
			</div>
	</div>
	</div>
	

	<div id="showsearchVehTmpl" style="display: none">
		<!-- catalogCheck('+item.source.catalogId+',\''+replaceWith(itemClogCOMM_DESCRIPTION)+'\') -->
		<div id="veh{{itemPartId}}" style="cursor: pointer"
			ng-click="catalogCheck(itemPartId,itemClogCOMM_DESCRIPTION)">
			<div class="machineTitle">
				<h4 class="alignLeft blueColor"
					ng-click="viewMachine(itemPartId,itemCatalogName,itemClogMedia)">
					<c:choose>
						<c:when test="${isVinNoRequired}">
							<span class="no-font"><spring:message
								code="search.catalog.customField1"></spring:message>: {{itemClogCUSTOM_FIELD1}}</span>
						</c:when>
						<c:otherwise>
							<span class="no-font"><spring:message 
								code="search.catalog.catalogname"></spring:message>: {{itemCatalogName}}</span>
						</c:otherwise>
					</c:choose>
				</h4>
				<a ng-if="!(isGuestCatalog)" class="close-btn"
					ng-click="deleteCatalog(itemPartId,itemCatalogName)"> <i
					class="fa fa-trash-o delete-itemx "></i>
				</a> <a ng-if="!(isGuestCatalog)" class="fav-btn" title="Favorites"
					ng-click="favoriteActions(itemPartId,itemCatalogName,itemFavorite)">
					<i class="fa fa-star"
					ng-class="{'fav-item':(itemFavorite == true),'no-fav-item':(itemFavorite == false)}"></i>
				</a>
			</div>
			<div class="imagesample"
				ng-click="viewMachine(itemPartId,itemCatalogName,itemClogMedia)">
				<img ng-if="itemClogMedia!='0'"
					src="${properties['docserver.url']}?media={{itemClogMedia}}&thumbnail=true&user='+userid+'&token='+authtoken+'">
				<div ng-if="itemClogMedia =='0'" class="machine-image"
					class="no-image">
					<img class="img-responsive" alt="catalog-img"
						src="../images/gear_thumb.png">
				</div>
			</div>
			<div class="imageContent">
				<div style="margin-top: 7px;min-height: 40px;">
					<p
						ng-click="viewMachine(itemPartId,itemCatalogName,itemClogMedia)">
						<spring:message code="search.catalog.model"></spring:message>
						: {{itemClogMODEL}}<span ng-if="!(itemClogMODEL)"><spring:message
								code="search.none"></spring:message></span>
					</p>
					<p

						ng-click="viewMachine(itemPartId,itemCatalogName,itemClogmediaId)">
						<spring:message code="display.catalogserialnumber"></spring:message>
						: {{itemCatalogName}}<span ng-if="!(itemCatalogName)"><spring:message
								code="search.none"></spring:message></span>
					</p>
					<p
						ng-click="viewMachine(itemPartId,itemCatalogName,itemClogmediaId)">{{itemClogCOMM_DESCRIPTION}}</p>

				
				<%-- <div style="margin-top: 5px">
					<p><spring:message code="search.catalog.customerName"></spring:message>: {{itemClogCUSTOMER_NAME}}<span ng-if="itemClogCUSTOMER_NAME == ''"><spring:message code="search.none"></spring:message></span></p>
					<p><spring:message code="search.catalog.catalogReference"></spring:message>: {{itemClogREFERENCE}}<span ng-if="!(itemClogREFERENCE)"><spring:message code="search.none"></spring:message></span></p>
				</div> --%>
				
				
				<c:if test="!${isVinNoRequired}">
					<p ng-click="viewMachine(itemPartId,itemCatalogName,itemClogMedia)">
					<spring:message code="search.catalog.catalogname"></spring:message>
					: {{itemCatalogName}} <span ng-if="itemClogCUSTOM_FIELD1 == ''"><spring:message
							code="search.none"></spring:message></span>
					</p>
				</c:if>
				
				<c:if test="${properties['user.application'] !='HILLPHOENIX'}">
					<p
						ng-click="viewMachine(itemPartId,itemCatalogName,itemClogMedia)">
						<spring:message code="search.catalog.customField2"></spring:message>
						: {{itemClogCUSTOM_FIELD2}} <span
							ng-if="itemClogCUSTOM_FIELD2 == ''"><spring:message
								code="search.none"></spring:message></span>
					</p>
				</c:if>
				</div>
				<div class="b-label">
				<c:if test="${properties['display.organizationName']}">
					<p style="white-space: normal;"
						ng-click="viewMachine(itemPartId,itemCatalogName,itemClogMedia)">Organization
						: {{itemClogORGANIZATION_NAME}}</p></c:if>
					<p ng-repeat="us in userDefinedFacets">{{us}}</p>					
				</div>
				<div ng-show="!(isGuestCatalog)" class="addReference-box"
					ng-show="addReference"
					ng-init="addReference='true'; editFlag = true; editReferenceVal= itemClogREFERENCE">
					<h6 ng-show="!(isGuestCatalog)">
						<strong><spring:message
								code="search.catalog.catalogReference" /></strong>
					</h6>
					<div
						ng-show="((editReferenceVal =='' && editFlag) && !(isGuestCatalog))">
						<button ng-click="editFlag = !editFlag"
							class="btn btn-sm btn-primary"><spring:message code="label.addreference" /></button>
					</div>
					<div
						ng-show="(editReferenceVal != '' && editFlag && !isGuestCatalog)">
						<span class="ref-text-val">{{editReferenceVal}}</span>
						<button
							ng-click="editFlag = !editFlag; catalogReference= editReferenceVal;"
							class="btn btn-xs btn-warning">
							<i class="fa fa-pencil"></i>
						</button>
					</div>
					<div ng-hide="editFlag">
						<textarea ng-model="catalogReference" maxlength="75"
							class="reftextarea">{{editReferenceVal}}</textarea>
						<button
							ng-click="editFlag = true; editReferenceVal=catalogReference; editCatalog( itemPartId,catalogReference, itemCatalogName)"
							class="btn btn-xs btn-warning"><spring:message code="label.mymachines.save" /></button>
						<button
							ng-click="editFlag = true; catalogReference=editReferenceVal"
							class="btn btn-xs btn-warning"><spring:message code="label.bulkpartupload.cancel" /></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END Search Parts Directive Template-->
	<div id="searchResultsprodCatalogueTemplate" style="display: none">
		<div class="row" ng-show="partCount == 0">
			<p class="text-center">No Data Available</p>
		</div>
		<!-- <div class="ItemCountDisp col-md-3 p10-sm hidden-lg hidden-md hidden-sm text-center">
			<p ng-cloak>
				Item Count: <span ng-cloak ng-bind="partCount"></span>
			</p>
		</div>
		<div id="gridOrList" class="hidden-lg hidden-md hidden-sm p10-sm">
			<a class="gridView" href="#" ng-click="GridsDisplay=true"><span
				class="glyphicon glyphicon-th-large"></span>Grid</a> <a
				class="listView" href="#" ng-click="GridsDisplay=false"><span
				class="glyphicon glyphicon-th-list"></span>List</a>
		</div> -->
		<div class="col-lg-12 nopadding" ng-hide="partCount < 10">			
			<div id="partsPerPageDivHeader" class="col-lg-4 col-md-4 col-sm-4"
				ng-model="itemsPerPage" style="font-size: 14px; margin-top: 10px">
				<span ng-show="partCount > 0" class="ten"><spring:message code="label.results.per.page" /> <a
					href="javascript:void(0)" id="ten" class="ten-a"
					ng-class="{'not-active':10 == numPerPage}"
					ng-click="resultsPerPage(10)">10</a>
				</span> <span ng-show="partCount > 25" class="twentyFive"> | <a
					href="javascript:void(0)" class="twentyFive-a" id="twentyFive"
					ng-class="{'not-active':25 == numPerPage}"
					ng-click="resultsPerPage(25)">25</a>
				</span> <span ng-show="partCount > 50" class="fifty"> | <a
					href="javascript:void(0)" id="fifty" class="fifty-a"
					ng-class="{'not-active':50 == numPerPage}"
					ng-click="resultsPerPage(50)">50</a>
				</span> <span ng-show="partCount > 100" class="hundred"> | <a
					ng-model="itemsPerPage" href="javascript:void(0)" class="hundred-a"
					id="hundred" ng-class="{'not-active':100 == numPerPage}"
					ng-click="resultsPerPage(100)">100</a>
				</span>
			</div>
			<div class="col-md-7 col-xs-12 pagination_mobile_wrapper float-lg-md-right">
				<div class="paginationStyle float-lg-md-right">
				<div paging
				page-type="top"
                page="$parent.currentPage" 
                page-size="numPerPage" 
                total="partCount"
                text-next="<spring:message code="label.pagnation.next"/>"
                text-prev="<spring:message code="label.pagnation.prev"/>"
                show-prev-next="true"
  				show-first-last="false" >
            </div>
					<!-- <pagination total-items="partCount" ng-model="$parent.currentPage"
						max-size="maxSize" class="pagination-sm" ng-hide="partCount==0"
						ng-change="changeHandler($event, currentPage)"
						boundary-links="true" num-pages="numPages"
						items-per-page="numPerPage" previous-text="&lsaquo;" next-text="&rsaquo;" first-text="&laquo;" last-text="&raquo;"> </pagination> -->
				</div>
			</div>
		</div>
		<div class="search-parts-template-wrapper">
			<div class="search-parts-template cart-details add-cartpopover"
				ng-repeat="xr in filteredTodos | orderBy:orderBySort"
				ng-class="{GridsDisplay:GridsDisplay==true}">
				<facet-filter-directive ng-init="newpart = xr"></facet-filter-directive>
			</div>
		</div>

		<div class="col-lg-12 nopadding" ng-hide="partCount < 10">
			<div id="partsPerPageDivHeader" class="col-lg-4 col-md-4 col-sm-4">
				<span ng-show="partCount > 0" class="ten"><spring:message code="label.results.per.page" /><a
					href="javascript:void(0)" id="ten" class="ten-a"
					ng-class="{'not-active':10 == numPerPage}"
					ng-click="resultsPerPage(10)">10</a>
				</span> <span ng-show="partCount > 25" class="twentyFive"> | <a
					href="javascript:void(0)" class="twentyFive-a" id="twentyFive"
					ng-class="{'not-active':25 == numPerPage}"
					ng-click="resultsPerPage(25)">25</a>
				</span> <span ng-show="partCount > 50" class="fifty"> | <a
					href="javascript:void(0)" id="fifty" class="fifty-a"
					ng-class="{'not-active':50 == numPerPage}"
					ng-click="resultsPerPage(50)">50</a>
				</span> <span ng-show="partCount > 100" class="hundred"> | <a
					href="javascript:void(0)" class="hundred-a" id="hundred"
					ng-class="{'not-active':100 == numPerPage}"
					ng-click="resultsPerPage(100)">100</a>
				</span>
			</div>
			<div class="col-md-7 col-xs-12 pagination_mobile_wrapper float-lg-md-right">
				<div class="paginationStyle float-lg-md-right">
					<div paging
					page-type="bottom"
                page="$parent.currentPage" 
                page-size="numPerPage" 
                total="partCount"
                text-next="<spring:message code="label.pagnation.next"/>"
                text-prev="<spring:message code="label.pagnation.prev"/>"
                show-prev-next="true"
  				show-first-last="false">
            </div>
					<!-- <pagination ng-model="$parent.currentPage"
						ng-click="changeHandler($event, currentPage)"
						ng-hide="partCount==0" total-items="partCount"
						items-per-page="numPerPage" max-size="maxSize"
						boundary-links="true" previous-text="&lsaquo;" next-text="&rsaquo;" first-text="&laquo;" last-text="&raquo;"></pagination> -->
				</div>
			</div>
		</div>
	</div>
	<!--Ends  Product Catalogue Right Panel Template -->
	<!--Ends  Product Catalogue Right Panel Template -->
	<input id="msg" type="hidden"
		value="Are you sure you want to remove Serial Number?">
	<input id="msg-contact-admin" type="hidden"
		value="Please contact your administrator to remove this machine from your list.">
	<input id="msg-deleted" type="hidden"
		value="was removed from your list.">
	<input id="msg-edited" type="hidden" value="is successfully edited.">
	<input id="msg-edit-error" type="hidden" value="cannot be edited.">
	<input id="msg-edit-error-part" type="hidden" value="from your list">
	<input id="msg-add-reference" type="hidden"
		value="Reference text for the">
	<input id="msg-add-msg" type="hidden" value="is successfully added.">

	<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.9/angular.min.js?version=${properties['application.version']}"  type="text/javascript"></script>
	<script src="../js/app.js" defer type="text/javascript"></script>	
	<script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.12.1/ui-bootstrap-tpls.min.js" type="text/javascript"></script>
<script type="text/javascript">
var defaultPartUOM = '${properties["default.part.uom"]}';
var defaultPartOrderMultiple = '${properties["default.part.ordermultiple"]}';
var isFacetSearch = '${properties["facetSearch.required"]}';
$(document).ready(function() {
	$("#btn_filter").click(function(){		
	    $(".mobile_facet").toggle('slide', {direction: 'left'}, 250);
	    $('html, body').animate({scrollTop: 0});
	});
});
</script>
	<script>
   		showLoader();
       	var facetModule = angular.module('facetModule',  ['ui.bootstrap', 'bw.paging']);
       
       	facetModule.controller('facetCtrl', ['$scope', '$http', '$timeout', '$log', '$rootScope', function($scope, $http, $timeout, $log, $rootScope) {
          	// $scope.msg = 'it works!';
          	
          	$scope.DoCtrlPagingAct = function(text, page, pageSize, total) {
		        $log.info({
		            text: text,
		            page: page,
		            pageSize: pageSize,
		            total: total
		        });
		    };
		    
        	$scope.resultObj = jQuery.parseJSON('${resultList}');
           	$scope.facetData = $scope.resultObj.facetdetails;//jQuery.parseJSON('${facetList}');
           	$scope.itemList = $scope.resultObj.itemList;
           	
           	
           	$scope.requestOrigin = '${requestOrigin}'; 
        	$scope.shopforpartsPage = false;
        	//Pagination for search part within search
        	$scope.partSearchForPaginationFlag = false;
        	
           	//Enable features based on action screen 
        	if(typeof $scope.itemList != 'undefined'){
                angular.forEach($scope.itemList,function(p,i){
                 $scope.partCount = p.itemCount;
                });
               }
           	
           	if(	$scope.requestOrigin == 'shopforparts' ){
           		var keepGoing = true;
           	 	$scope.onLoadFirstFacetId;
           		$scope.sortByFlag = true;
           		$scope.searchFilterFlag = true;	
           		$scope.shopforpartsPage = true;
           		angular.forEach($scope.facetData, function(elem, i) {
    				var conditionalElem = elem.facetDisplay;
    				if (keepGoing && elem.facetData != undefined && elem.facetData.length > 0) {
    					if (conditionalElem == 'CHECK LIST') {
    						//Fetch Media Id for All
    						var thumbnailData = [];
    						angular.forEach(elem.facetData, function(insideElem, i) {
    							var lastIndex = insideElem.lastIndexOf('(');
        						var requestData = insideElem.slice(0,lastIndex);
        						requestData = requestData.toUpperCase();
    							var mediaId = elem.facetDataToMedia[requestData];
    							//var mediaId = 0;
    							var thumbnailObj = {
    									mediaId : mediaId,
    									facetValue : insideElem
    									};
    							thumbnailData.push(thumbnailObj); 
    						});
    						//$scope.searchResultsRt = elem.facetData;
    						$scope.searchResultsRt = thumbnailData;
    						$scope.onLoadFirstFacetId = elem.facetId;
    						keepGoing = false;
    						$scope.facetDataMedia = elem.facetDataToMedia;
    						
    					}
    				}

    			});
           		$scope.productCatalogueInfo = false;
           		$scope.productInfo = true;
           		$scope.partTypeId = '1';
           		angular.element($("#new-main-menu-list li a[href = 'shopCentre']").parent().addClass("active"));
           		$scope.gloabalSearchFlag = false;
				angular.element($(".breadcrumb > li:nth-child(1)").after('<li class="active"><spring:message code="label.shopforparts" />'));
			}else if(	$scope.requestOrigin == 'vehicles' ){
				$scope.sortByFlag = false;
           		$scope.searchFilterFlag = true;
           		$scope.machineFlag = true;
           		$scope.productInfo = false;
           		$scope.productCatalogueInfo = true;
           		$scope.partTypeId = '2';
           		angular.element($("#new-main-menu-list li a[href = 'machinecentre']").parent().addClass("active"));
           		$scope.productCatalogueInfo = true;
           		$scope.partCount = '${catalogCount}';
           		$scope.gloabalSearchFlag = false;
           		if($scope.itemList.length == 0){
               		$scope.partCount = 0;
               	}
				angular.element($(".breadcrumb > li:nth-child(1)").after('<li class="active"><spring:message code="label.header.myvehicle" />'));
			}else{
				$scope.sortByFlag = false;
           		$scope.searchFilterFlag = false;
           		$scope.globalsearchFlag = true;
           		//Keep the drop down selected : based on type drop down
           		$scope.typeDropDownUsed = '${typedropdown}';
           		$scope.hasMachineCatalog='${roleHasMachineCatalog}';
                
           	  angular.forEach(angular.element($(".dropdown-menu > li").children()), function(elem, i) {           			
           			if( elem.attributes.getNamedItem('data-value').value == $scope.typeDropDownUsed ){
	           				angular.element($('button.searchall-dpdown > span.search-options-label').text(elem.text));
	           				angular.element($("#typedropdown").val('${typedropdown}'));
	           				return false;
           			}
           		}); 
           		$scope.productCatalogueInfo = true;
           		$scope.productInfo = false;
           		$scope.partTypeId = '1';
           		$scope.gloabalSearchFlag = true;
           		//to set partCount=0 if there is no search results. Added by Pooja
           		if($scope.itemList.length == 0){
               		$scope.partCount = 0;
               	}
				angular.element($(".breadcrumb > li:nth-child(1)").after('<li class="active"><spring:message code="label.search.search" />'));
			}
			           	
           	//Set Keyword searched
           	angular.element($("#keyword").val('${searchKey}'));
			$scope.searchKey = '${searchKey}';
			$scope.typedropdown = '${typedropdown}';
			$scope.selectedFilterListObj = [];
			$scope.limitNum = 5;
			$scope.filterCheck = false;
			$scope.GridsDisplay = false;
			$scope.selectedObj = [];
           	//untouch
           	$scope.SelectedFacetObj = $scope.facetData;
           
		 	//Whole Object
		 	$scope.rangeValue = 0;
		 	$scope.partListObjTemp = [];
		 	var rangeExist = false;
			$scope.filteredTodos = [];
			$scope.filteredTodos = $scope.itemList;
			$scope.appendPrvData = [];
			$scope.facetReqObj = [];
			$scope.noAppliedFilter = false; //Used for pagination flag
			$scope.sortByVal = "";
			$scope.searchInputVal = "";
			$scope.currentPage = 1;
			$scope.numPerPage =10;
			$scope.maxSize=5;
			// scope for searchResults
			$scope.searchFlag = false;
			//setting default dropdown value to item number. added by pooja
			/*Start: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C*/
			$scope.orderBySort = "${properties['shopforparts.orderBySort.default']}";
			/*End: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C*/
			//Part Count global value to be used for page results, update on getshopping items
			$scope.partCountGlobal = $scope.partCount;
			// Page # limit to ? default:5
			$scope.limitNum = function(limitToNum) {
				$scope.limitNum = limitToNum;
			}
			

			// Conditional Template Load checkbox/slider/dropdown
			//debugger;
			$scope.switchTemplateObj = $scope.facetData;
			angular.forEach($scope.switchTemplateObj, function(item) {
				if (item.facetDisplay == "SLIDER") {
					var result = item.facetData.map(function(x) {
						return parseFloat(x);
					});
					$scope.minVal = Math.min.apply(Math, result);
					$scope.maxVal = Math.max.apply(Math, result);
					$scope.switchTemplate = 2;
	
				}
			});
			// Pushing range value
			$scope.addtocart = function(partId,mediaId,organizationId,partNumber,itemQuantity){
				console.log("Add to cart"+partId);
				var quantity = angular.element($(this).parent().parent().siblings('.quantity-change').find('.total-items')).val();
				var img = $(this).parents(".search-parts-template").children("div:first-child").html();
				addToCartFunc(partId,mediaId,organizationId,partNumber,quantity,img);
			}

			// Pushing the filter Array()
			$scope.selectedFiltersList = function(booVal, selectedVal, ckpos) {
				showLoader();
				if(booVal){//select of filter options
					$scope.getItemForFilters(true, selectedVal, ckpos,false,null,null,false);
				}else{//Un-select of filter options
					$scope.clear(selectedVal,ckpos);                        			
				}
			}
			
			//globalsearch request.
			$scope.globalSearchRequest = function(selectedVal){
				$("#typedropdown").val(selectedVal);
				angular.element('#searchsubmit').triggerHandler('click');
			}
			
			$scope.mySplit = function(string, nb) {
			    var array = string.split(',');
			    return array[nb];
			}
			// Clears All the Filter
			$scope.clearAll = function(checkBool) {
				$scope.checkBool = false;
				angular.element($('.filterCheckBox').prop("checked", false));
				$scope.selectedFilterListObj = [];
				$scope.showfilter = false;
				if(	$scope.requestOrigin == 'shopforparts' ){
	           	 	location.href = 'shopCentre';
				}else if(	$scope.requestOrigin == 'vehicles' ){
					location.href = 'machinecentre';
				}else{
				   angular.element($("#searchsubmit").trigger('click'));
				}
 		}
			//Find position of the object 
			 
			// Clear only the selected filter
			$scope.clear = function(selectedVal, pos) {
				$("div.pageLoader").show();
				angular.element($('.filterCheckBox[value=' + pos + ']').prop("checked", false));
				//  var index = $scope.selectedFilterListObj.indexOf(selectedVal);
				var position = -1 ;
				angular.forEach($scope.selectedFilterListObj, function(fData,k){
					if(fData.name == selectedVal.split("(")[0] || fData.name.split(":")[1] == selectedVal.split("(")[0]){
						position = k;
					}
				});
				$scope.selectedFilterListObj.splice(position, 1);
				if(pos == 'rangeId'){
					$scope.rangeModel = $scope.maxVal;
				}
				var facetId;
				angular.forEach($scope.facetReqObj, function(fData,k){
					if(fData.facetData == selectedVal.split(":")[1] || fData.facetData == selectedVal.split("(")[0]){
						facetId = fData.facetId;
						$scope.facetReqObj.splice(k, 1);//Remove from the request list vo
					}
				});
				angular.forEach($scope.appendPrvData, function(prevData,k){
					if(prevData.facetId == facetId){
						facetId = prevData.facetId;
						//$scope.appendPrvData.splice(k, 1);//Remove Facet from the Previous Chosen list
					}
				});
				if ($scope.selectedFilterListObj.length < 1) {
					$scope.showfilter = false;
					if(	$scope.requestOrigin == 'shopforparts' ){
		           	 	location.href = 'shopCentre';
					}else if(	$scope.requestOrigin == 'vehicles' ){
						location.href = 'machinecentre';
					}else{
					   angular.element($("#searchsubmit").trigger('click'));
					}
				}else{
					$scope.getItemForFilters(true, selectedVal, null,false,null,null,true);	
				}
			}
			
			$scope.fullItemDetails = function(itemId,organizationId){
				//INC-2703 :Hari shankar 
				if(isFacetSearch == 'true'){
					if($scope.requestOrigin == 'shopforparts' ){
						window.open("getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''"+"&searchString="+$scope.searchKey+"&searchType="+$scope.typedropdown,'_blank');	
					}else{
						window.open("getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''"+"&searchString="+$scope.searchKey+"&searchType="+$scope.typedropdown+"&searchflag="+true+"&previousURL=",'_blank');						
					}
				}else{
					if($scope.requestOrigin == 'shopforparts' ){
						window.open("getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''"+"&searchString="+$scope.searchKey+"&searchType="+$scope.typedropdown,'_self');	
					}else{
						window.open("getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''"+"&searchString="+$scope.searchKey+"&searchType="+$scope.typedropdown+"&searchflag="+true+"&previousURL=",'_self');						
					}
					
				}
			//	document.location.href="getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''";
			}
			$scope.whereUsed = function(partId) { 
				document.forms[0].action="whereUsed?partId="+partId;
				document.forms[0].submit();					
			}

			$scope.callRange = function(booVal,ckpos,sliderMinVal,sliderMaxVal){
				//alert('test');
				var minVal = sliderMinVal;
				var maxVal = sliderMaxVal;
				//$scope.rangeModel = this.rangeModel;
	
				$scope.getItemForFilters(true, minVal+'-'+maxVal, ckpos,true,minVal,maxVal,false);
			};
			
			//Generic Function for fetching Item List
			$scope.getItemForFilters = function(booVal, selectedVal, ckpos,isRangeInput,minVal,maxVal,clearFlag){
				//NREV-1198: If you use the search field and then change facet selections, the search field should clear out.Added by pooja
				$scope.partSearchBar = "";
				//Enable check box
				var facetIdGlobal;
				if(!isRangeInput){
					angular.element($('.filterCheckBox[value=' + ckpos + ']').prop("checked", true));
				} 
				if(!clearFlag){
					facetIdGlobal = ckpos.split("-")[0];
				 	var lastIndex = selectedVal.lastIndexOf('(');
					var requestData = '';
					if(lastIndex == "-1"){
						requestData = selectedVal;
					}else{
						requestData = selectedVal.slice(0,lastIndex);
					}
				 	
					var facetIdReq = ckpos.split("-")[0];
					var reqObj = {
						"facetId":facetIdReq,
						"facetData":requestData,	
						"isRangeInput":isRangeInput,
						"minRange":minVal,
						"maxRange":maxVal,
						"partType":$scope.partTypeId //Set Part Type for new template based on Request Origin
					};
					//Handle drop down request object    
					if(ckpos.split('-')[1]=='dropdown' && $scope.facetReqObj.length > 0){
						angular.forEach($scope.facetReqObj, function(elem, j){
							if(elem.facetId==ckpos.split('-')[0]  ){
								$scope.facetReqObj.splice(j,1);
							}
						});
					}
					$scope.facetReqObj.push(reqObj);
					if($scope.appendPrvData.length>0){
						var checkFilter = false;
						angular.forEach($scope.appendPrvData, function(item, i){
							angular.forEach(item.facetData, function(ele, i){
								if(selectedVal==ele  && item.facetId == facetIdReq){
									//Do not append the Filter, It's already available in the scope
									checkFilter = true;
								}
							});
						});
						if(!checkFilter){
							angular.forEach($scope.facetData, function(item, i){
								angular.forEach(item.facetData, function(elem, j){
									if(selectedVal==elem  && item.facetId == facetIdReq  ){
										$scope.appendPrvData.push(item);
										angular.element($('.filterCheckBox[value=' + ckpos + ']').prop("checked", true));
									}
								});
							});
						}
					}else{
						//Discard duplicate facet's in the screen
						angular.forEach($scope.facetData, function(item, i){
							angular.forEach(item.facetData, function(elem, j){
								if(selectedVal==elem  && item.facetId == facetIdReq  ){
									$scope.appendPrvData.push(item);
									angular.element($('.filterCheckBox[value=' + ckpos + ']').prop("checked", true));
								}
							});
							if(isRangeInput){
								if(ckpos.split("-")[0] == item.facetId){
									$scope.appendPrvData.push(item);
								}
							}
						});
					}
				}
				$scope.currentPage=1;
				$scope.numPerPage = 10;
				//Call custom event 
				$http({
					method : "GET",
					url : "getShoppingItems?selectedItems=" + encodeURIComponent(JSON.stringify($scope.facetReqObj))+"&partType="+$scope.partTypeId+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&gloabalSearchFlag="+$scope.gloabalSearchFlag+"&globalsearchkeyword="+escape($scope.searchKey)+"&typedropdown="+$scope.typedropdown,
				}).then(function mySuccess(response) {
					if(response.data.length > 1256){
						$scope.partCount = 0;
						console.log("Error Appeared Contact customer service");
						hideLoader();
						return false;
					}
					/*Start: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C*/
					$scope.orderBySort = "${properties['shopforparts.orderBySort.default']}";
					/*End: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C*/
					$scope.itemList = response.data.itemList;
					$scope.partListObj = response.data.partList;
					$scope.facetData = response.data.facetdetails;
					$scope.filteredTodos = response.data.itemList;//$scope.partListObj;
					$scope.partCount = response.data.itemCount;
					$scope.facetDataTemp = [];//$scope.facetData;
					angular.forEach($scope.facetData, function(fData,k){
					 	var addFlag = true;
						angular.forEach($scope.appendPrvData, function(pData, j){
							//var boolValCheck = angular.equals(fData[k], pData[j]); 
							if(fData.facetId == pData.facetId){
								addFlag = false;//Remove new facet if exist in previously chosen facet
								//$scope.facetData.splice(k,1);
								return false; 
							}
						});
						if(addFlag){
							$scope.facetDataTemp.push(fData);	
						}
					});
					$scope.facetData = $scope.facetDataTemp;
					if(isRangeInput && $scope.selectedFilterListObj.length > 0){
						angular.forEach($scope.selectedFilterListObj, function(fData,k){
							if(fData.id == ckpos.split("-")[0]+'-rangeId'){
								$scope.selectedFilterListObj.splice(k,1);
							}
						});
					}	
					if(!clearFlag){
						if(ckpos.split('-')[1]=='dropdown' && $scope.selectedFilterListObj.length > 0){
							angular.forEach($scope.selectedFilterListObj, function(fData,k){
								if(fData.id == ckpos.split("-")[0]+'-dropdown'){
									$scope.selectedFilterListObj.splice(k,1);
								}
							});
						}
					}
					angular.forEach($scope.facetData, function(fData,k){
						angular.forEach($scope.appendPrvData,function(item, i){
							if(fData.facetId == item.facetId){
								$scope.facetData.splice(k,1);
							}
						})
					});	 
					//response.data.facetdetails;

					//$scope.facetData = $scope.facetDataTemp;//New Facet's
					angular.forEach($scope.appendPrvData,function(item, i){
						if(typeof $scope.facetData !== "undefined"){
							$scope.facetData.push(item);
						}
					});//Applied Facet's carry forwarded
					//Range values
					$scope.switchTemplateObj = $scope.facetData;
					angular.forEach($scope.switchTemplateObj, function(item) {
						if (item.facetDisplay == "SLIDER") {
							var result = item.facetData.map(function(x) {
								return parseFloat(x);
							});
							$scope.minVal = Math.min.apply(Math, result);
							$scope.maxVal = Math.max.apply(Math, result);
							$scope.switchTemplate = 2;
						}
					});
					$scope.noAppliedFilter = false;
					$scope.partCount = response.data.itemCount;
					$scope.partCountGlobal = $scope.partCount; 
					// $scope.rangeModel.value = $scope.rangeModel;
					$scope.partListObjTemp = $scope.partListObj; 
					if(!clearFlag){
						if (booVal) {
							$scope.showfilter = true;
							var ckItem =  ckpos;
							var facetName ;
							if(isRangeInput){
								facetName = $("#myRange").attr('data-name');
							}else if(ckItem.split('-')[1]=='dropdown'){
								facetName = $(".dropdownfacet").attr('data-name');
							}else{
								facetName = $('.filterCheckBox[value=' + ckpos + ']').attr('data-name');
							}
							if(typeof facetName == "undefined"){
								//$("div#"+facetIdGlobal).children("div.panel-collapse").children().children().children("a").trigger('click');
								/* $scope.$apply(function () {
                   						$("div#"+facetIdGlobal).children("div.panel-collapse").children().children().children("a").trigger('click');
                				}); */
								facetIdGlobal = facetIdGlobal +"-0";
								//$('.filterCheckBox[value=' + ckpos + ']').prop('checked', true);
								facetName = $('.filterCheckBox[value=' + facetIdGlobal + ']').attr('data-name');
							}
							
							
							$scope.selectedFilterListObj.push({
								'id': ckItem,
								'name': facetName+':'+selectedVal.split("(")[0]
							});
						} else {
							var index = $scope.selectedFilterListObj.indexOf(selectedVal);
							$scope.selectedFilterListObj.splice(index, 1);
							if ($scope.selectedFilterListObj.length < 1) {
								$scope.showfilter = false;
							}
						}
					}	
					if ($scope.selectedFilterListObj != '') {
						$scope.productInfo = false;
						$scope.productCatalogueInfo = true;

					} else {
						$scope.productInfo = true;
						$scope.productCatalogueInfo = false;
					}
					if(isRangeInput){
						$scope.newMinVal = minVal; 
						$scope.newMaxVal = maxVal;
					}
					hideLoader();
					if($scope.partTypeId == '1' || $scope.partTypeId == '1'){
						var partList = [];
						var organizationId; 
						angular.forEach($scope.filteredTodos, function(pData, j){
							var item;
							angular.forEach(pData.itemFacetData, function(innerData, j){
								if(innerData.facetId == 10){
									organizationId = innerData.facetData;
									item = {"partId":pData.partId,"partNumber":innerData.partNumber,"organizationId":organizationId};
								}
							});
							partList.push(item);
						});
						var items = {"partVoList":partList};
						if(partList.length > 0){
							$scope.getPriceForItems(items,organizationId);
						}
					}
				 	//Scroll to Top
					$('body,html').animate({
                        scrollTop: 0,
                    }, 1000);
				 	//Reset Part Search
					$scope.searchFlag = false;
					$scope.searchInputVal = "";
				}, function myError(response) {
					hideLoader();
					$scope.myWelcome = response.statusText;
				});
			};                       
			 $scope.getPriceForItems = function(items,organizationId){
             	 $http({
                     method : "GET",
                     url : "getcategoryPartPrice?items="+encodeURIComponent(JSON.stringify(items))+"&organizationId="+organizationId,
                 }).then(function mySuccess(response) {
                 	$scope.filteredTodosTemp = $scope.filteredTodos;
                 	//$scope.filteredTodos;
                 	if(response.data.length == 1256){//Signifies failure from back end, hence populate contact customer service
                 		angular.forEach(angular.element(".search-parts-template"), function(elem,j){
                     				elem.priceStr = "Contact Customer Service";
                     				elem.currencyCode = "Contact Customer Service";
                     				elem.inventoryMessage = "Contact Customer Service";
                     				elem.msrpStr = "-1";
                     				elem.savedPriceStr = "-1";
        	                 				if(elem.msrpStr != '-1'){
        	                 					$(elem).find(".erp-price-avail .msrpShowHide").text(strings['label.msrp']+": " + elem.msrpStr + ' ' + elem.currencyCode);
        	                 				}else{
        	                 					$(elem).find(".erp-price-avail .msrpShowHide").html('');
        	                 				}
        	                 			});
                     	}
                 	else{
	                 	angular.forEach(response.data.partItemVOList,function(item,i){
	                 		//-angular.forEach($scope.itemList,function(elem,j){
	                 		angular.forEach(angular.element(".search-parts-template "), function(elem,j){
	                 			if(item.partId == $(elem).find(".erp-price-avail").attr("data-partid")){
	                 				//elem.priceStr = item.priceStr;
	                 				//elem.currencyCode = item.currencyCode;
	                 				//elem.inventoryMessage = item.inventoryMessage;
	                 				//elem.msrpStr = item.msrpStr;
	                 				//elem.savedPriceStr = item.savedPriceStr;
	                 				if(item.msrpStr != '-1'  && item.msrpStr!=item.priceStr ){
	                 					$(elem).find(".erp-price-avail .msrpShowHide").text(strings['label.msrp']+": " + item.msrpStr + ' ' + item.currencyCode);
	                 				}else{
	                 					$(elem).find(".erp-price-avail .msrpShowHide").html('');
	                 				}
	                 				if(item.priceStr != '-1'){
	                 					$(elem).find(".erp-price-avail .your-price1").text(strings['label.item.yourPrice']+": " + item.priceStr + ' ' + item.currencyCode);
	                 				}else{
	                 					$(elem).find(".erp-price-avail .your-price1").html('');
	                 				}
	                 				if(item.savedPriceStr != '-1' && item.msrpStr!=item.priceStr){
	                 					$(elem).find(".erp-price-avail .savePriceShowHide").text(strings['label.you.save']+": " + item.savedPriceStr +  ' ' + item.currencyCode+ " each");
	                 				}else{
	                 					$(elem).find(".erp-price-avail .savePriceShowHide").html('');
	                 				}
	                 				$(elem).find(".stock-count").text(item.inventoryMessage);
	                 			}
	                 		});
	                 	});
                 	}
                 }, function myError(response) {
                 	hideLoader();
                     $scope.myWelcome = response.statusText;
                 }); 
             };
           //Onload price fetch
				if($scope.partTypeId == '1'){
					var partList = [];
					var organizationId; 
					angular.forEach($scope.itemList, function(pData, j){
						var item;
						angular.forEach(pData.itemFacetData, function(innerData, j){
							if(innerData.facetId == 10){
								organizationId = innerData.facetData;
								item = {"partId":pData.partId,"partNumber":innerData.partNumber,"organizationId":organizationId};
								
							}
						});
						partList.push(item);
					});
					var items = {"partVoList":partList};
					if(partList.length > 0){
						$scope.getPriceForItems(items,organizationId);
					}
				}
             
             
			 $rootScope.pageResults = function(currentPage){
				 /*Start: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C*/
				 if($scope.sortByVal ==""){
					 $scope.sortByVal =  $scope.orderBySort;
				 }
				 /*End: Added By Harish Bakale, GPD-777, Reviwed By: Rajesh C*/
				 $scope.currentPage = currentPage || 1;
				 $("div.pageLoader").show();
					if(	$scope.requestOrigin == 'shopforparts' ){
							$scope.partTypeId = '1';			 
					}else if(	$scope.requestOrigin == 'vehicles' ){
						 	$scope.partTypeId = '2';
					}else{
							 $scope.partTypeId = '1';
							 $scope.searchKey = '${searchKey}';
							 $scope.typedropdown = '${typedropdown}';
					}
					if($scope.searchFlag && $scope.searchInputVal != ""){
						$scope.partSearchForPaginationFlag = true;
						$scope.search($scope.searchInputVal);
						return false;
					}
					$http({
							method : "GET",
							url : "getpageresults?selectedItems=" + encodeURIComponent(JSON.stringify($scope.facetReqObj))+"&partTypeId="+$scope.partTypeId+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&sortBy="+$scope.sortByVal+"&searchInput="+$scope.searchInputVal+"&gloabalSearchFlag="+$scope.gloabalSearchFlag+"&globalsearchkeyword="+escape($scope.searchKey)+"&typedropdown="+$scope.typedropdown,
						}).then(function mySuccess(response) {
							hideLoader();
							if(response.data.length > 1256){
								$scope.partCount = 0;
								console.log("Error Appeared Contact customer service");
								$('div.pageLoader').hide();
							} 
							$scope.itemList = response.data.itemList;
							$scope.filteredTodos = response.data.itemList;//response.data.partList;
							if($scope.partTypeId == '1' || $scope.partTypeId == '1'){
								var partList = [];
								var organizationId;
								angular.forEach($scope.filteredTodos, function(pData, j){
									var item;
									angular.forEach(pData.itemFacetData, function(innerData, j){
										if(innerData.facetId == 10){
											organizationId = innerData.facetData;
											item = {"partId":pData.partId,"partNumber":innerData.partNumber,"organizationId":organizationId};
										}
									});
									partList.push(item);
									if(partList.length == 10){
										var items = {"partVoList":partList};
										if(partList.length > 0){
											$scope.getPriceForItems(items,organizationId);
										}
										partList = [];
									}
								});
								var items = {"partVoList":partList};
								if(partList.length > 0){
									$scope.getPriceForItems(items,organizationId);
								}
							}
							$scope.searchInputVal = "";
						//	$scope.sortByVal = "";
							$("div.pageLoader").hide();
							//Scroll to Top
							$('body,html').animate({
		                        scrollTop: 0,
		                    }, 1000);
					}, function myError(response) {
							hideLoader();
							$scope.myWelcome = response.statusText;
					});
			 };		
			 $scope.changeHandler = function($event, currentpage){
					$scope.currentPage = currentpage;
					$scope.numPerPage = $scope.numPerPage;
					$scope.noAppliedFilter = true;
					$scope.pageResults();
				}
			 
			$scope.resultsPerPage = function(numperpage){
					$scope.numPerPage = numperpage;
					$scope.currentPage = 1;
					//angular.element($(".pagination > li").removeClass("active"));
					//angular.element($(".pagination > li:nth-child(3)").addClass("active"));
					$scope.noAppliedFilter = true;
				 	$scope.pageResults();	
					//$scope.maxSize = $scope.partCount / $scope.numPerPage;
			}
			 
			$scope.$watch('switchTemplateObj', function (newValue, oldValue) {
				$timeout(function () { 
					var sMINVal = $( "#slider-range" ).attr("min");
					var sMAXVal = $( "#slider-range" ).attr("max");
					var sminVal = sMINVal
					var smaxVal = sMAXVal;
		
					if(angular.element("#myRange").scope() != undefined){
						var newscope = angular.element("#myRange").scope();
						sminVal = (newscope.newMinVal === undefined) ? sMINVal : newscope.newMinVal;
						smaxVal = (newscope.newMaxVal === undefined) ? sMAXVal : newscope.newMaxVal;
					}
					angular.element($( "#slider-range" ).slider({
						range: true,
						min: sMINVal,
						max: sMAXVal,
						values: [ sminVal, smaxVal],
						slide: function( event, ui ) {
							console.log(ui.values[ 0 ]+'-'+ui.values[ 1 ])  	
						},
						stop: function( event, ui){
							var scope = angular.element("#myRange").scope();
							scope.callRange(true, scope.x.facetId+'-rangeId',ui.values[ 0 ],ui.values[ 1 ]);
						}
					}));
				}, 1000);
			});
			
			/*SORT BY AND SEARCH*/
			$scope.sortByFacet = function(sortBy){
				showLoader();
				$scope.sortByVal = sortBy;
				if(sortBy == ""){
					$scope.pageResults();
				}else{
					$scope.sortByVal = sortBy; 
					$http({
						method : "GET",
						url : "getpageresults?selectedItems=" + encodeURIComponent(JSON.stringify($scope.facetReqObj))+"&partTypeId=1"+"&sortBy="+sortBy+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&gloabalSearchFlag="+$scope.gloabalSearchFlag+"&globalsearchkeyword="+escape($scope.searchKey)+"&typedropdown="+$scope.typedropdown,
					}).then(function mySuccess(response) {
						hideLoader();
						$scope.noAppliedFilter = false;
						if(response.data.length > 1256){
							$scope.partCount = 0;
							console.log("Error Appeared Contact customer service");
							hideLoader();
						}else{
							$scope.partCount = response.data.itemCount;
						}
						$scope.itemList = response.data.itemList;
						$scope.partListObj = response.data.partList;
						$scope.partListObjTemp = $scope.partListObj; 
						$scope.filteredTodos = response.data.itemList;//$scope.partListObj;
						if($scope.partTypeId == '1' || $scope.partTypeId == '1'){
							var partList = [];
							var organizationId; 
							angular.forEach($scope.filteredTodos, function(pData, j){
								var item;
								angular.forEach(pData.itemFacetData, function(innerData, j){
									if(innerData.facetId == 10){
										organizationId = innerData.facetData;
										item = {"partId":pData.partId,"partNumber":innerData.partNumber,"organizationId":organizationId};
									}
								});
								partList.push(item);
								if(partList.length == 10){
									var items = {"partVoList":partList};
									if(partList.length > 0){
										$scope.getPriceForItems(items,organizationId);
									}
									partList = [];
								}
							});
							var items = {"partVoList":partList};
							if(partList.length > 0){
								$scope.getPriceForItems(items,organizationId);
							}
						}
						if($scope.currentPage == 1 ){
							//angular.element($(".pagination > li").removeClass("active"));
							//angular.element($(".pagination > li:nth-child(3)").addClass("active"));
						}
						//$scope.partCount = response.data.itemCount;
					}, function myError(response) {
						hideLoader();
						$scope.myWelcome = response.statusText;
					});
				} 
			};
			  //View Machine information
            $scope.viewMachine = function(catalogId,catalogName,mediaId){
				/*NREV-1328 : Added By Hari */
				$("div.pageLoader").show();			 
						window.location.href = 'viewmachine?catalogId='+catalogId+'&assemblyNumber='+catalogName+'&mediaId='+mediaId;
            }
			$scope.search = function(searchInput){
				showLoader();
				 //NREV-1175, NREV-1160. Added by Pooja
				 if(searchInput== undefined){
					 searchInput = "";
					 $scope.currentPage = 1;
				 }
				 if(!$scope.partSearchForPaginationFlag){
					 $scope.currentPage = 1;//Default the current Page to First/1  
				 } 
				 $scope.searchFlag = true;
				 if(searchInput.length >= 2){
					$scope.searchInputVal = searchInput;
					$http({
						method : "GET",
						url : "getpageresults?selectedItems=" + encodeURIComponent(JSON.stringify($scope.facetReqObj))+"&partTypeId="+$scope.partTypeId+"&searchInput="+searchInput+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage,
					}).then(function mySuccess(response) {
						
						$scope.noAppliedFilter = false;
						hideLoader();
						if(response.data.length > 1000){
							$scope.partCount = 0;
							console.log("Error Appeared Contact customer service")
							hideLoader();;
						}else{
							$scope.partCount = response.data.itemCount;
						}
						$scope.itemList = response.data.itemList;
						$scope.partListObj = response.data.partList;
						$scope.partListObjTemp = $scope.partListObj; 
						$scope.filteredTodos = response.data.itemList;//$scope.partListObj;
						if($scope.partTypeId == '1' || $scope.partTypeId == '1'){
							var partList = [];
							var organizationId; 
							angular.forEach($scope.filteredTodos, function(pData, j){
								var item;
								angular.forEach(pData.itemFacetData, function(innerData, j){
									if(innerData.facetId == 10){
										organizationId = innerData.facetData;
										item = {"partId":pData.partId,"partNumber":innerData.partNumber,"organizationId":organizationId};
									}
								});
								partList.push(item);
								if(partList.length == 10){
									var items = {"partVoList":partList};
									if(partList.length > 0){
										$scope.getPriceForItems(items,organizationId);
									}
									partList = [];
								}
							});
							var items = {"partVoList":partList};
							if(partList.length > 0){
								$scope.getPriceForItems(items,organizationId);
							}
						}
						//$scope.currentPage = 1;
						//Scroll to Top
							$('body,html').animate({
		                        scrollTop: 0,
		                    }, 1000);
					}, function myError(response) {
						hideLoader();
						$scope.myWelcome = response.statusText;
					});
				}else{
					$scope.searchInputVal = "";
					$scope.currentPage = 1;
					$scope.pageResults();
					//angular.element($(".pagination > li").removeClass("active"));
					$scope.partCount = $scope.partCountGlobal; 
				}
			};
			hideLoader();
			//Vehicle functionalities
			$scope.favoriteActions = function(catalogId,catalogName, isFavourite){
        		angular.element( $( "#veh" + catalogId));
        		showLoader();
        		var favoriteActionUrl;
            	// inside success
            	console.log("flag:::"+$( "#veh" + catalogId ).find('.fa.fa-star').hasClass("fav-item"));
            	if(!$( "#veh" + catalogId ).find('.fa.fa-star').hasClass("fav-item")){
            		favoriteActionUrl = "addtofavorites";
            	}else{
            		favoriteActionUrl = "removefavorites";
            	}
            	var reqparams = {catalogId:catalogId}
            	$http({
            		method: "POST",
         			url: favoriteActionUrl,
         			params: reqparams,
         			headers: {'Content-Type': 'application/json'}
            		}).then(function mySuccess(response) {
            			$("div.pageLoader").hide();
            			var resultText = '';
         				if(response.data){
         					if($( "#veh" + catalogId ).find('.fa.fa-star').hasClass("fav-item")){
                        		angular.element( $( "#veh" + catalogId ).find('.fa.fa-star').removeClass("fav-item").addClass("no-fav-item"));
                        	}else{
                        		angular.element(  $( "#veh" + catalogId ).find('.fa.fa-star').removeClass("no-fav-item").addClass("fav-item"));
                        	}
         					console.log('Added to your favorites');
         					if(favoriteActionUrl == 'addtofavorites'){
         						resultText = "<spring:message code="addremove.favourites"/> : "+catalogName +" <spring:message code="label.added_favorites"/>";
         					}else{
         						resultText = "<spring:message code="addremove.favourites"/> : "+catalogName +" <spring:message code="label.removed_favorites"/>";
         					}
         					
         				}else{
         					if(favoriteActionUrl == 'addtofavorites'){
         						resultText = "<spring:message code="addremove.favourites"/> : "+catalogName +" <spring:message code="label.already_favorites"/>";
         					}else{
         						resultText = "<spring:message code="addremove.favourites"/> : "+catalogName +" <spring:message code="label.de_favoriting"/>";
         					}
         				}
         				$("div.pageLoader").find("h4").text(resultText).show().fadeOut(2500);
         				$("div.pageLoader").show().fadeOut(5000);
         				//$("body").css("overflow", "auto");
         				//$("div.pageLoader").find("h4").text(x);
            		 }, function myError(response) {
         				console.log(response);
         			});
            		//hideLoader();
           		 };
           		 //favourite shop for parts.
           		$scope.addFavouritesForShopForParts = function(partId,mediaId,organizationId,isFavorite,orderMultiple,event){
					console.log($( "#part" + partId ).find('.fa.fa-star').hasClass("fav-item"));
           			angular.element( $( "#part" + partId));
           			if(!$( "#part" + partId ).find('.fa.fa-star').hasClass("fav-item")){
           				addItemToFavListPage(partId,mediaId,orderMultiple,organizationId,event);
                	}else{
                	  var dataItemLst =[];
           		      dataItemLst.push({partId: partId,organizationId: organizationId});
           		      deleteFromFavList(dataItemLst, event);
                	}
           	 	};
           			
               		 
           		 $scope.editCatalog = function(catalogId,catalogRef,catalogName){
                    	showLoader();	
                    	/*if(catalogRef == ''){
                    		hideLoader();//NREV-1251 Added By Hari Shankar	
							return false;                                  		
                    	}else */
                    	if(catalogRef.length > 126){
                    		alert("Exceeds 126 Characters");
                    		return false;
                    	}
                    	var editedMsg= document.getElementById("msg-edited").value;
                 		var addReference=document.getElementById("msg-add-reference").value;
                 		var addReferenceMsg=document.getElementById("msg-add-msg").value;
                 		editedMsg = editedMsg.trim();
                 		var reqparams = {catalogId:catalogId,value:catalogRef,catalogName:catalogName};  
                    	$http({
                 		method: "POST",
 	         			url: "editCatalog",
 	         			params: reqparams,
 	         			headers: {'Content-Type': 'application/json'}	
                 			}).then(function mySuccess(data) {
                 				hideLoader();
                 				var response=data;
                 				if(response.data.oldValue=="noOldValueFound"){
                 					var mg=addReference+" "+ catalogName + " " +addReferenceMsg;
                 					$('.modal-body').text(mg);
                 					hideLoader();	
                 					$("#confirmationWindow").show();
                 					//window.location.href="machinestatus?message="+empty+"&pageNo="+pageNumber+"&pageSize="+pageSize;
                 				}
                 				else{
                 					var editMessage = addReference+" "+ catalogName + " " +editedMsg;
                 					$('.modal-body').text(editMessage);
                 					hideLoader();	
                 					$("#confirmationWindow").show();
                     				//window.location.href="machinestatus?message="+empty+"&pageNo="+pageNumber+"&pageSize="+pageSize;
                     				
                 				}	
                    			}, function myError(response) {
                                 	hideLoader();
                                 	console.log(response);
                          	});	  	
                 	};
                 	//Delete Catalog based on ID - Directive specific
                    $scope.deleteCatalog = function(catalogId,catalogName){
                       	showLoader();	
                       	//Delete functional related messages - Start
                       	var delateConfim=document.getElementById("msg").value;
                    	var label=document.getElementById("msg-edit-error-part").value;
                    	var contactAdminMsg=document.getElementById("msg-contact-admin").value;
                		var deletedMsg= document.getElementById("msg-deleted").value;
                		//Delete functional related messages - End
                       	var reqparams = {catalogId:catalogId};  
                     	 //Modified by krupa for Facet implementation
                       	$http({
                    		method: "POST",
    	         			url: "deleteCatalog",
    	         			params: {catalogId:catalogId},
    	         			headers: {'Content-Type': 'application/json'}	
                    			}).then(function mySuccess(data) {
                    				if(data.successMsg=="failure"){
                   				 		editMessage=contactAdminMsg;
                   				 		$('.modal-body').text(editMessage);
                						hideLoader();	
                						$("#confirmationWindow").show();
                   				 	}
                   				 	else{
                   				 		editMessage=catalogName+" "+deletedMsg;
            	       				 	$('.modal-body').text(editMessage);
            							hideLoader();	
            							$("#confirmationWindow").show();
            							$scope.filteredTodosBK = [];
                        				angular.forEach($scope.filteredTodos,function(pData,index){
                        					if(pData.catalogId != catalogId){
                        						$scope.filteredTodosBK.push(pData);
                        					}
                        				});
                        				console.log($scope.filteredTodos);
                        				$scope.filteredTodos = $scope.filteredTodosBK;
                        				$scope.partCount = $scope.partCount - 1 ;
                   				 	}
                       			}, function myError(response) {
                                    	hideLoader();
                       				 		editMessage=contactAdminMsg;
                       				 		$('.modal-body').text(editMessage);
                    						hideLoader();	
                    						$("#confirmationWindow").show();
                             	});	
                    };
					//END of Delete Machine                  	
           }]);
			
		// Cooked Template for Left Filter Panel
		facetModule.directive('facetFilterTemplate', function() {
		    return {
		        restrict: 'E',
		        template: facetTemplateContent.innerHTML
		    }
		});
		// Cooked Template for Right Search  Panel
		facetModule.directive('filterSearchResultRt', function() {
		    return {
		        restrict: 'E',
		        template: searchResultsTemplate.innerHTML
		    }
		})
		
		// Cooked Template for product Catalogue Holder  Panel
		facetModule.directive('productCatalogueHolder', function() {
		    return {
		        restrict: 'E',
		        template: searchResultsprodCatalogueTemplate.innerHTML
		    }
		});
		
		// Constructing search part details          
		facetModule.directive("facetFilterDirective", function($compile) {
			var pTemplate1 = showsearchPartsTmpl.innerHTML;
			var pTemplate2 = showsearchVehTmpl.innerHTML;
			var pTemplate3 = showsearchCategoryTmpl.innerHTML;

			var getTemplate = function(partypeId){
				var template = '';
				switch(partypeId){
				    case 1:
				        template = pTemplate1;
				        break;
				    case 2:
				        template = pTemplate2;
				        break;
				    case 3:
				    	template = pTemplate3;
				}
		       return template;
	      	};
	      
	      	var linker = function(scope, element, attrs){
				scope.newpart.partTypeId = scope.newpart.partTypeId || ((scope.requestOrigin == 'vehicles') ? 2 : 1 ); // Setting partypeId to 1 as default.
				scope.displayWhereUsed = scope.newpart.isWhereUsedAllowed;
				scope.itemPartId = scope.newpart.partId;
				scope.itemMediaId = 0;
				scope.itemClogMedia = 0;
				scope.itemlegacyNumber =[];
				/* scope.itemSuperseeded = ''; */
				scope.itemVendorNumber =[];
				scope.userDefinedFacets =[];
				scope.itemCatalogId = '';
				scope.itemCatalogName = '';
				scope.itemClogREFERENCE = '';
				scope.itemFavorite = scope.newpart.isFavourite; 
				scope.isGuestCatalog = scope.newpart.isGuestCatalog;
				scope.categoryMediaId = '';
				scope.shopForPartsUrl = '';
				scope.productCatalogName = '';
				scope.productCategoryName = '';
				scope.isGuestUser=scope.newpart.isGuestUser;
				//INC-2498 fix starts(Developed by : Swetha)
				scope.isActualImage = 1;
				//INC-2498 fix ends
				scope.itemUom = defaultPartUOM;
				scope.itemOrderMultiple = Math.abs(defaultPartOrderMultiple);
				var legacyNumberList = [];
				var vendorNumberList = [];
				angular.forEach(scope.newpart.itemFacetData, function(value, key) {
					switch (value.facetId) {
		      			case 1: scope.itemMediaId = value.facetData;
		 						break;  
					   	case 2: scope.itemDescription = value.facetData;
					   			break;  
					   	case 3: scope.itemEngineeringDescription = value.facetData;
					   			break;
					   	case 4: scope.itemCommercialDescription = value.facetData;
								break;
					   	case 5: scope.itemCatalogLink = value.facetData;
								break;
					   	case 6: scope.itemPart3dLink = value.facetData;
								break;
					   	case 7: scope.itemUom = value.facetData;
								break;
					   	case 8: scope.itemOrderMultiple = Math.abs(value.facetData);
								break;
					   	case 9: scope.itemPartSource = value.facetData;
								break;
					   	case 10: scope.itemOrganizationId = value.facetData;
								break;
					   	case 11: legacyNumberList.push(value.facetData); 
								break;
					   	case 12: vendorNumberList.push(value.facetData); 
								break;
					   	case 13: scope.itemOrderable = value.facetData;
								break;
						case 14: scope.itemPartNumber = value.facetData;
								break;
						case 15: scope.itemOrganizationName = value.facetData;
								break;
						<!-- Start: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
						/* case 16: scope.itemSuperseeded = value.facetData;
								break; */
						<!-- End: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
						//INC-2498 fix starts(Developed by : Swetha)
						case 17: scope.isActualImage = value.facetData;
								break;
						//INC-2498 fix ends
						case 19: scope.itemClogORGANIZATION_NAME = value.facetData;
								break;
					   	case 21: scope.itemClogMedia = value.facetData;
								break;	
					   	case 22: scope.itemClogCOMM_DESCRIPTION = value.facetData;
								break;
					   	case 23: scope.itemClogENGG_DESCRIPTION = value.facetData;
								break;
					   	case 24: scope.itemClogCUSTOMER_ID = value.facetData;
								break;
					   	case 25: scope.itemClogCUSTOMER_NAME = value.facetData;
								break;
						case 26: scope.itemClogCATEGORY_ID = value.facetData;
								break;
						case 27: scope.itemClogUSE_LEGACY_PART = value.facetData;
								break;
						case 28: scope.itemClogHAS_LEGACY_PART = value.facetData;
								break;
						case 29: scope.itemClogHAS_AFTERMARKET = value.facetData;
								break;
						case 30: scope.itemClogMODEL = value.facetData;
								break;
						case 31: scope.itemClogREFERENCE = value.facetData;
								break;
						case 32: scope.itemClogORGANIZATION_ID = value.facetData;
								break;
						case 33: scope.itemClogORGANIZATION_NAME = value.facetData;
								break;
						case 34: scope.itemClogCUSTOM_FIELD1 = value.facetData;
								break;
						case 35: scope.itemClogCUSTOM_FIELD2 = value.facetData;
								break;
						case 36: scope.itemClogUNIQUE_PRODUCT_CATALOG_CODE = value.facetData;
								break;
						case 40: scope.itemWhereUsedFlag = value.facetData;
								break;
						/* case 41: scope.itemCatalogName = value.facetData;
								break; */
						case 42: scope.itemCatalogName = value.facetData;
								break;
						case 45: var productCatalogId = value.facetData;
								scope.shopForPartsUrl = productCatalogId+'_'+scope.itemPartId;
								break;
						case 46: scope.productCatalogName = value.facetData;
								break;	
						case 47: scope.productCategoryName = value.facetData;
								break;
						case 48: scope.categoryMediaId = value.facetData;
								break;
				    	default: if(value.showAtItemInfo){
					  				scope.userDefinedFacets.push(value.facetName+":"+value.facetData);
									}
						    	scope.itemMsrpStr = '';
				  				scope.itemPriceStr = '';
				  				scope.itemSavedPriceStr = '';	
	 					scope.itemPartNumber =  value.partNumber;
	    			};
	    			scope.itemCatalogId = value.partId;
					//scope.itemCatalogName = value.partNumber;
	  			});
				scope.itemlegacyNumber = legacyNumberList;
				scope.itemVendorNumber = vendorNumberList;
				if(scope.newpart.itemMsrpStr != scope.newpart.currencyCode){
					scope.itemMsrpStr = scope.newpart.msrpStr + scope.newpart.currencyCode;
				}else{
					scope.itemMsrpStr = scope.newpart.msrpStr;
				}
				if(scope.newpart.itemPriceStr != scope.newpart.currencyCode){
					scope.itemPriceStr = scope.newpart.msrpStr + scope.newpart.currencyCode;
				}else{
					scope.itemPriceStr = scope.newpart.priceStr;
				}
				if(scope.newpart.savedPriceStr != scope.newpart.currencyCode){
					scope.savedPriceStr = scope.newpart.msrpStr + scope.newpart.currencyCode;
				}else{
					scope.itemSavedPriceStr = scope.newpart.savedPriceStr;	
				}
  				scope.itemCurrecyCode = scope.newpart.currencyCode;
  				scope.itemInventory =	scope.newpart.inventoryMessage;
		    	//var partList =[];
		    	scope.partItemsList = scope.partItemsList || [];
		    	scope.partItemsList.push({"partId":scope.itemPartId,"partNumber": scope.itemPartNumber });
	    		//partList.push(items);
	    		//var organizationId = $scope.filteredTodos[0].organizationId;
	  			element.html(getTemplate(scope.newpart.partTypeId));
	      			$compile(element.contents())(scope);
	   			};
	    	return {
		        restrict: "E",
		        replace: true,
		        link: linker
	    	};
	   		if (scope.$last){
	      		window.alert("im the last!");
	         	scope.getPriceForItems(scope.partItemsList, scope.itemOrganizationId);
	   		} 
	  	});
	 	// All Javascript & Jquery related functions will be listed in the below DOM load functions
		$(function(){
			//Define global variable for userId & authtoken : Added By Hari Shankar - Using the hidden stored value from Header.jsp 
			var userid = $("#userId").val();
			var authtoken = $("#authToken").val();
			
					$('.machine-edit-btn').on("click", function(){
		                $(this).parents('.machine-edit').hide();
		                var value = $(this).siblings('strong').text();
		                  $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'}).children('textarea').val(value);
		              	});
		        	
		        	$('.add-machine').delegate(".cancel-machine-btn","click",function(){
				  			   showLoader();
				           $(this).children('.save-machine').hide();
				           $(this).children('.machine-edit').show(); 
				           hideLoader();
				           /* $(this).parents('span').siblings('.machine-edit').show(); */
				        });
		        	$('.close-btn').on("click", function(){
		        	        $(this).parents('.search-parts-templates').remove();
		        	      });
					$(".custom-close").click('click',function(){
						$("#confirmationWindow").hide();
						$("div.pageLoader").hide();
						});
		        	$('.add-machine-btn').on("click", function(){
		        	        $(this).parents('.add-machine').hide();
		        	        $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'});
		        	   	});
		    		$(".btn-ok").click(function(){
		        			$(".modal").hide()
		        		});
				// Buy Now
					$(document).delegate('.buynow-click','click',function(e) {
		     	   			e.preventDefault();
		     	   			showLoader();
		     	   			var partId =  $(this).parents(".row-eq-height").data('partid');
							var mediaId = $(this).parents(".row-eq-height").data('mediaid');
							var organizationId = $(this).parents(".row-eq-height").data('orgid');
							var itemNumber = $(this).parents(".row-eq-height").data('partnumber'); 
							var quantity = $(this).parents(".row-eq-height").siblings().find("div.quantity-change").find(".total-items").val();
							
							/* var mediaId = $(this).parent().parent().parent().attr('data-mediaId');
				 			var itemNumber = $(this).parent().parent().parent().attr('data-partNumber');
		     	  			var organizationId = $(this).parent().parent().parent().attr('data-orgid');
		     	   			var partId = $(this).parent().parent().parent().attr('data-partId');
		     	   			var quantity = $(this).parent().parent().parent().siblings("div.quantity-change").find(".total-items").val();
		     	   			 */
		     	   			var partPrice = $(this).parents(".row-eq-height").siblings().find("div.erp-price-avail").find('.your-price1').html()
		     	   			//var partPrice = $(this).parent().parent().siblings('.your-price1').html();
				     	   	if(partPrice == null || partPrice == ''){
						    partPrice = $(this).parents(".row-eq-height").siblings().find("div.erp-price-avail").find('.msrpShowHide').html();
				     		   //partPrice = $(this).parent().parent().siblings('.msrpShowHide').html();
				     	   	}   
		     	   			partPrice = partPrice.split(" ")[2];
			     	 		showLoader();
				     		$.ajax({
						          type : "Get",
						          /* data : "cartItemId=" + cartItemId, */
						          data : {organizationId: organizationId},
						          contentType: 'application/json',
						          mimeType: 'application/json',
						          url : "isdivisionmapped",
						          cache : false,
						          success : function(response) {
						        	  displayPrompt('directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&partPrice='+partPrice); /* Edited by Pujith for GPD-10. Reviewed by Krupa */
						        	  hideLoader();
						          },  
						          error : function(e) {  
						        	  hideLoader();
						          }  
				        	});
		        		});
					$(document).delegate('.add-to-cart','click',function(e) {
							e.preventDefault();
							showLoader();
							var img = $(this).parents(".row-eq-height").siblings().find("div:first-child").html();
							var partId =  $(this).parents(".row-eq-height").data('partid');
							var mediaId = $(this).parents(".row-eq-height").data('mediaid');
							var organizationId = $(this).parents(".row-eq-height").data('orgid');
							var itemNumber = $(this).parents(".row-eq-height").data('partnumber'); 
							
							var quantity = $(this).parents(".row-eq-height").siblings().find("div.quantity-change").find(".total-items").val();
							
							
							/* var img =$(this).parent().parent().siblings("div:first-child").html();
							var partId =  $(this).parent().parent().attr('data-partId');
							var mediaId = $(this).parent().parent().attr('data-mediaId');
							var quantity = $(this).parent().parent().siblings("div.quantity-change").find(".total-items").val();
							var organizationId = $(this).parent().parent().attr('data-orgid');
							var itemNumber = $(this).parent().parent().attr('data-partNumber');  */
							var dataItemVal = null;
							console.log(dataItemVal);
							$.ajax({
									type : "POST",
									data : {
										partId : partId,
										mediaId : mediaId,
										quantity : quantity,
										organizationId : organizationId,
										dataItemVal : JSON.stringify(dataItemVal),
										isAddToCartFromBOM:false
									},
									url : "addtocart",
									success : function(response) {
										console.log('shop'+response);
			                        getShoppingCartCount();
										if (response == '') {
											/* alert("Part is not added...") */
											hideLoader();
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
												hideLoader();
												$(".cart-popover").css({"opacity": 1});
												$(".cart-popover").show().stop().fadeOut(5000);
												/*$(".close-popup").delegate("click",function(){
													$(this).parents(".cart-popover").fadeout("fast");
												})*/
												if(mediaId != "0"){
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
													$(".cart-popover").find(".cart-popover-img").children().attr("class",'');
												}else{
													$(".waterMarkForCartPopOver").hide();
													$(".cart-popover").find(".cart-popover-img").children().attr("class",'no-image');
													$(".cart-popover").find(".cart-popover-img").children().attr("src",'');
												}
												//NREV-1511 fix ends
												
												$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
											}
											else{
												hideLoader();
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
							}); 
		});
		function getShoppingCartCount(){
			 /* Ajax call for cart item count*/
			 $.ajax({
			  type : "post",
			  url : "getshoppingcount",
			  dataType : "json",
			  contentType : 'application/json;charset=ISO-8859-1',
			  success : function(data) {
					   	console.log(data);
					   	document.getElementsByClassName("cartItemCount")[0].innerHTML = data;
						   	if(document.getElementsByClassName("cartItemCount")[1]){
						  	 document.getElementsByClassName("cartItemCount")[1].innerHTML = data;
						   	}
					  	},
			  error :function(jqxhr, textStatus, error) {
			  		  // 15-01-2015-EH Handling
			          var err = jqxhr.status;
			          var msg = jqxhr.responseText;
			          $(".pageLoader").hide();
			          console.log( "Request Failed: " + err );
			          console.log( "Request Failed: " + jqxhr.responseText );
			          //myErrObj.raise(err,msg,textStatus);
				}
			 });
		}
		
		function showLoader(){
			$('div.pageLoader').show();
	   		//$("body").css("overflow", "hidden");
		}
		function hideLoader(){
			$('div.pageLoader').hide();
	   		//$("body").css("overflow", "auto");
		}
		
</script>

</body>
</html>
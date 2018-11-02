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
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
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

.searchPreferences {
	top: 8.5em;
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

div#product-catalog-hldr {
	margin-top: 12px;
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
	width: 27% !important;
	padding-top: 10px;
}

.GridsDisplay div.quantity-change, .GridsDisplay div.erp-price-avail {
	width: 100% !important;
}

.GridsDisplay button {
	float: none !important;
	margin-left: 0;
}

.GridsDisplay {
	text-align: center !important;
	height: auto !important;
}

/* .GridsDisplay div.quantity-change {
	margin-top: 0 !important;
} */
.GridsDisplay .unit {
	/* position: static !important; */
	right: -10px;
}

.searchPreferences {
	top: 8.2em;
	margin-left: 0;
	width: 855px;
}

.primary div#custom-search-input {
	width: 200px;
	margin-top: 0.2em;
	float: right;
}

div.paginationStyle {
	text-align: center;
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
</style>
<!-- Javascript Library-->

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js?version=${properties['application.version']}"></script>
<script src="../js/less.min.js?version=${properties['application.version']}"></script>
<script src="../js/advance-filter.js?version=${properties['application.version']}"></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}"></script>
<script type="text/javascript" src="../js/jquery.i18n.properties.js?version=${properties['application.version']}"></script>
<!-- <script src="../js/jquery.history.js"></script> -->
<!-- <script src="https://github.com/balupton/History.js"></script> -->
<!-- <script type="text/javascript" src="https://github.com/devote/HTML5-History-API/blob/master/history.js"></script> -->

</head>

<body ng-app="facetModule" ng-controller="facetCtrl">
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
					<li><a href="homepage"> <spring:message
								code="label.footer.home" />
					</a></li>
					<li class='active'><spring:message code="label.shopforparts" />
					</li>

				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-3 col-md-3 hidden-sm hidden-xs column-paddings responsive-padding"
					id="shopForPartLeft">



					<!-- Left panel Facet Filter -->
					<div id="facetfilter" id="accordion">
						<h3>Show Results for</h3>
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
							hidden> <spring:message code="label.button.msds.text" />
						</a>
					</div>

					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="resultInfo" style="border-bottom: 1px solid #eee;"
						ng-if="productInfo">
						<filter-search-result-rt></filter-search-result-rt>
					</div>


					<!-- 					 For advance Filter -->
					<div class="container-fluid col-lg-12 block-wrapper">
						<div class="block"></div>
					</div>
					<!-- 					 For advance Filter -->

					<div ng-cloak
						class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="product-catalog-hldr" ng-if="productCatalogueInfo">
						<div
							class="searchPreferences col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="primary">
								<div class="ItemCountDisp col-md-3" style="margin-top: 10px;">
									<p>
										<spring:message code="label.item.count" />&nbsp;:&nbsp;<span ng-cloak>{{partCount}}</span>
									</p>
								</div>

								<p><spring:message code="label.sort_by" /></p>
								<select ng-model="orderBySort"
									ng-change="sortByFacet(orderBySort)">
									<option value="" selected>--Select--</option>
									<option value="itemNumber" selected><spring:message code="label.item_no" /></option>
									<option value="itemDescription"><spring:message code="label.item_description" /></option>
								</select>

								<div id="gridOrList">
									<a class="gridView" href="#" ng-click="GridsDisplay=true"><span
										class="glyphicon glyphicon-th-large"></span><spring:message code="label.grid" /></a> <a
										class="listView" href="#" ng-click="GridsDisplay=false"><span
										class="glyphicon glyphicon-th-list"></span><spring:message code="label.list" /></a>
								</div>

								<div id="custom-search-input">
									<div class="input-group col-md-12">
										<input type="text" class="form-control input-lg"
											placeholder="Search" ng-model="$parent.partSearchBar" /> <span
											class="input-group-btn" ng-click="search(partSearchBar)">
											<button class="btn btn-info btn-lg" type="button">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>


						</div>
						<div class="row">
							<div id="partsPerPageDivHeader" class="col-md-4"
								style="font-size: 14px; margin-top: 10px">
								<span ng-show="partCount > 10" class="ten">Result perpage
									<a href="javascript:void(0)" id="ten" class="ten-a"
									ng-click="resultsPerPage(10)">10</a>
								</span> <span ng-show="partCount > 25" class="twentyFive"> | <a
									href="javascript:void(0)" class="twentyFive-a" id="twentyFive"
									ng-click="resultsPerPage(25)">25</a>
								</span> <span ng-show="partCount > 50" class="fifty"> | <a
									href="javascript:void(0)" id="fifty" class="fifty-a"
									ng-click="resultsPerPage(50)">50</a>
								</span> <span ng-show="partCount > 100" class="hundred"> | <a
									href="javascript:void(0)" class="hundred-a" id="hundred"
									ng-click="resultsPerPage(100)">100</a>
								</span>
							</div>
							<div class="col-md-8 ">
								<div class="paginationStyle pull-right">
									<pagination ng-model="currentPage"
										ng-change="changeHandler(currentPage)" total-items="partCount"
										items-per-page="numPerPage" max-size="maxSize"
										boundary-links="true"></pagination>
								</div>
							</div>
						</div>

						<product-catalogue-holder></product-catalogue-holder>

					</div>

				</div>

			</div>

			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="myModal"  data-backdrop="static" data-keyboard="false">
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



			<!-- footer container -->
			<a href="javascript:void(0);" class="cd-top"
				title="<spring:message code='label.scroll.top'/>"> <spring:message
					code="label.footer.top" />
			</a>
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
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
		type="text/javascript"></script>
	<script
		src="../js/jquery-ui.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/bootstrap.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/jstree.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/jquery.jscroll.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/angular.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script data-require="ui-bootstrap@*" data-semver="0.12.1"
		src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
	<script id="leftPanel" type="text/x-jquery-tmpl">
                    <div class="panel panel-default facetName">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" href="#category"> ${'${'}facetName} <span class="glyphicon glyphicon-chevron-down"></span>
											</a>
                            </h4>
                        </div>
                        <div id="category" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="filterBody">
                                    <div id="custom-search-input">
                                        <div class="input-group col-md-12">
                                            <input type="text" id="category-keyword" class="form-control input-lg" placeholder="Search"> <span class="input-group-btn">
															<button class="btn btn-info btn-lg" id="category-search" type="button">
																<i class="glyphicon glyphicon-search"></i>
															</button>
														</span>
                                        </div>
                                    </div>
                                    <ul>

                                        <li><input type="checkbox" name="Axle" value="Axle"><a href="#">${'${'}facetData}</a></li>

                                    </ul>
                                    <!-- 	<a href="#" class="moreFacets">View More</a> -->

                                </div>
                            </div>
                        </div>
                    </div>
                </script>



	<script type="text/javascript">
                    var facetListJson = '${facetList}';
                    $(document).ready(function($) {
                    	//Highlight the main menu  
                    	$("ul#main-menu-list > li:nth-child(2)").addClass('active');
                    	
                    	
                        //	$(".panel-group").empty();
                        var result = jQuery.parseJSON(facetListJson);
                        /* if(result.facetdetails == ""){
                        	result = result ;
                        }else{
                        	result = result.facetdetails;
                        } */
                        //	$("#leftPanel").tmpl(result).appendTo(".panel-group");
                        // browser window scroll (in pixels) after which the "back to top" link is shown
                        var offset = 300,
                            //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
                            offset_opacity = 1200,
                            //duration of the top scrolling animation (in ms)
                            scroll_top_duration = 700,
                            //grab the "back to top" link
                            $back_to_top = $('.cd-top');

                        //localStorage.setItem("customattr", "500ml");
                        // var storedVal = localStorage.getItem("customattr");
                        // alert(storedVal);
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
 
                        $('.product-info').click(function(e) {
                            //  $('div.pageLoader').show();
                            //    window.location.href = 'getcategoryinformation?appliedFilter= Product Categories' + "&value=" + $(this).children("a:nth-child(2)").text();
                        });
						$('input[type=range]').on('change',function($scope,$http){
							
						});
                           
                        /*  Thickness Slider starts */
                        function collision($div1, $div2) {
                            var x1 = $div1.offset().left;
                            var w1 = 40;
                            var r1 = x1 + w1;
                            var x2 = $div2.offset().left;
                            var w2 = 40;
                            var r2 = x2 + w2;

                            if (r1 < x2 || x1 > r2) return false;
                            return true;

                        }
              
                        /* EO Thickness Slider */



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
								href="#category"><spring:message code="label.applied_filters" /><span
								class="glyphicon glyphicon-chevron-down"></span>
							</a>
						</h4>
					</div>
					<div id="category" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="filterBody">
								<a href="shopCentre" title="Clear All" ng-click="clearAll()"
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
				<div class="panel panel-default" ng-repeat="x in facetData"
					ng-show="x.facetData.length > 0">
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
											class="form-control input-lg" placeholder="Search"
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
	<div class="dummyHold" style="display: none;"
		id="searchResultsTemplate">
		<div
			class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12"
			ng-repeat="z in searchResultsRt" ng-model="checkBool"
			ng-click="selectedFiltersList(true, z, onLoadFirstFacetId+'-'+$index)">
			<div class="product-info" data-id="144" data-pcatalog="144"
				data-parent="" data-cataloglink="" data-hasparts="false"
				data-catalogid="144">
				<a href="#" class="productCatalogClick"><span class="helper"></span><img
					src="${sessionScope.logo}"></a> <a href="#"
					class="productCatalogClick" title="{{z}}">{{z}}</a>
			</div>
		</div>
	</div>
	<!--Ends  Right Panel Search Template -->



	<!--Product Catalogue Right Panel Template -->
	<div id="searchResultsprodCatalogueTemplate" style="display: none">

		<div class="row search-parts-template cart-details add-cartpopover"
			ng-repeat="xr in filteredTodos |orderBy:orderBySort"
			ng-class="{GridsDisplay:GridsDisplay==true}">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
				<a href="#" ng-if="xr.mediaId!=0"
					ng-click="fullItemDetails(xr.partId,xr.organizationId)"><img
					src="${properties['docserver.url']}?media={{xr.mediaId}}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"></a>
				<a href="#" ng-if="xr.mediaId==0" class="no-image"
					ng-click="fullItemDetails(xr.partId,xr.organizationId)">{{xr.commercialDescription_en_US}}</a>
			</div>
			<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
				<h4>
					<a href="javascript:void(0);"
						ng-click="fullItemDetails(xr.partId,xr.organizationId)"
						data-itemId="{{xr.partId}}" data-mediaId="{{xr.mediaId}}"
						data-itemNumber="{{xr.partNumber}}"><spring:message
							code="label.item.shop" />{{xr.partNumber}}</a>
				</h4>

				<div>
					<strong>{{xr.commercialDescription}}</strong>
				</div>
				<%-- <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> --%>
				<div>{{xr.engineeringDescription}}</div>
				<%-- </sec:authorize> --%>
				<div class="b-label">
					<div>
						{{xr.organizationName}}
						<spring:message code="search.part" />
					</div>
					<p class="order-multiples-lbl">
						<spring:message code="label.all.ordermultiples"
							javaScriptEscape="true" />
						{{xr.orderMultiple}}
					</p>
					<!--  <strong><span class="stock-count" data-avail="${'${'}itemId}"></span> <spring:message code="label.promotion.instock"/>, <spring:message code="label.promotion.leadtime"/> <span class="lead-time" data-leadtime="${'${'}itemId}"></span> Day(s)</strong></div> -->
					<!-- Modified by Krupa, Reviewed by Rajesh chinnam for NREV-1212 -->
					<strong><span class="stock-count"
						data-avail="{{xr.partId}}">{{xr.inventoryMessage}} </span></strong>
				</div>
				<p ng-repeat="us in xr.userDefinedFacets">{{us}}</p>
			</div>
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
				<div class="spinner-control"
					data-ordermultiplekey=" {{xr.orderMultiple}}">
					<!-- <input type="text" id="{{xr.partId}}" class="total-items output" maxlength="6" value="{{xr.orderMultiple}}" style="width:40px;text-align:center;"> -->
					<input type="text" id="{{xr.partId}}" class="total-items output"
						maxlength="6" value="1.0" style="width: 40px; text-align: center;">
					<div class="qty">
						<a href="javascript:void(0);" class="item-increment"> <i
							class="fa fa-caret-up"></i>
						</a> <a href="javascript:void(0);" class="item-decrement"> <i
							class="fa fa-caret-down"></i>
						</a>
					</div>
				</div>
				<span class="unit" style="left: 70px; top: 42px;">{{xr.uom}}</span>
			</div>
			<div
				class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
				data-allVal="" data-orgId="{{xr.organizationId}}"
				data-partId="{{xr.partId}}" data-partNumber="{{xr.partNumber}}"
				data-mediaId="{{xr.mediaId}}">

				<div ng-class="{'hide' : (xr.msrpStr == '-1')}"
					data-msrpShowHide="{{xr.partId}}" data-msrp="{{xr.partId}}"
					class="msrpShowHide msrpHide">
					<spring:message code="label.msrp" />
					: <span class="msrp-price"
						ng-class="{'price-loader': (xr.msrpStr == '')}"
						data-msrp="{{xr.partId}}">{{xr.msrpStr}} </span>
				</div>
				<div ng-class="{'hide' : (xr.priceStr == '-1')}" class="your-price1"
					data-price="{{xr.partId}}">
					<spring:message code="label.your.price" />
					: <span class="your-price " data-price="{{xr.partId}}"
						ng-class="{'price-loader': (xr.priceStr == '')}">{{xr.priceStr}}
					</span>
				</div>
				<div ng-class="{'hide' : (xr.savedPriceStr == '-1')}"
					data-savePriceShowHide="{{xr.partId}}" data-saved="{{xr.partId}}"
					class="blueColor youSaveHide savePriceShowHide">
					<spring:message code="label.save" />
					: <span class="save-price " data-saved="{{xr.partId}}"
						ng-class="{'price-loader': (xr.savedPriceStr == '')}">{{xr.savedPriceStr}}</span>
					<span><spring:message code="lable.item.each" /></span>
				</div>


				<sec:authorize access="hasRole('ROLE_CART')">

					<div ng-if="xr.orderable">
						<button
							class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
							style="height: 35px;">
							<spring:message code="quick.search.addtocart" />
						</button>
						<sec:authorize access="hasRole('ROLE_ORDER')">

							<button
								class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
								ng-click="buynow();" style="height: 35px;">
								<spring:message code="label.buynow" />
							</button>
						</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_ORDER')">
							<button
								class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active"
								style="height: 35px;">
								<spring:message code="label.buynow" />
							</button>
						</sec:authorize>
					</div>

					<div ng-if="!xr.orderable">
						<button
							class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active"
							style="height: 35px;">
							<spring:message code="quick.search.addtocart" />
						</button>
						<button
							class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active"
							style="height: 35px;">
							<spring:message code="label.buynow" />
						</button>
					</div>
				</sec:authorize>
			</div>
		</div>
		<div class="row">
			<div id="partsPerPageDivHeader" class="col-md-4"
				style="font-size: 14px; margin-top: 10px">
				<span ng-show="partCount > 10" class="ten">Results Per Page <a
					href="javascript:void(0)" id="ten" class="ten-a"
					ng-click="resultsPerPage(10)">10</a>
				</span> <span ng-show="partCount > 25" class="twentyFive"> | <a
					href="javascript:void(0)" class="twentyFive-a" id="twentyFive"
					ng-click="resultsPerPage(25)">25</a>
				</span> <span ng-show="partCount > 50" class="fifty"> | <a
					href="javascript:void(0)" id="fifty" class="fifty-a"
					ng-click="resultsPerPage(50)">50</a>
				</span> <span ng-show="partCount > 100" class="hundred"> | <a
					href="javascript:void(0)" class="hundred-a" id="hundred"
					ng-click="resultsPerPage(100)">100</a>
				</span>
			</div>
			<div class="col-md-8 ">
				<div class="paginationStyle pull-right">
					<pagination ng-model="currentPage"
						ng-change="changeHandler(currentPage)" items-per-page="numPerPage"
						total-items="partCount" max-size="maxSize" boundary-links="true"></pagination>
				</div>
			</div>
		</div>
	</div>
	<!--Ends  Product Catalogue Right Panel Template -->
	</div>
	<!--Ends  Product Catalogue Right Panel Template -->


	<script>
                    $('div.pageLoader').show();
                    var facetModule = angular.module('facetModule',  ['ui.bootstrap']);
                    facetModule.controller('facetCtrl', ['$scope', '$http', '$timeout', function($scope, $http, $timeout) {
                       // $scope.msg = 'it works!';
                        $scope.facetData = jQuery.parseJSON('${facetList}');
                        $scope.selectedFilterListObj = [];
                        $scope.limitNum = 5;
                        $scope.filterCheck = false;
                        $scope.productInfo = true;
                        $scope.productCatalogueInfo = false;
                        $scope.GridsDisplay = false;
                        $scope.selectedObj = [];
                        //untouch
                        $scope.SelectedFacetObj = $scope.facetData;
                        $scope.partCount = 0;
                        //Whole Object
                        $scope.wholeObj = jQuery.parseJSON('${facetList}');
                        $scope.rangeValue = 0;
                        $scope.partListObjTemp = [];
                        var rangeExist = false;
                        $scope.filteredTodos = [];
                        $scope.appendPrvData = [];
                     	$scope.facetReqObj = [];
                        $scope.onLoadFirstFacetId;
                        $scope.numPerPage = 10;
                        $scope.noAppliedFilter = false; //Used for pagination flag
                        $scope.sortByVal = "";
                        $scope.searchInputVal = "";
                        $scope.currentPage = 1;
                        $scope.numPerPage =10;
                        $scope.maxSize=5;
                        // scope for searchResults
                        var keepGoing = true;
                        $scope.searchFlag = false;
                        angular.forEach($scope.facetData, function(elem, i) {
                            var conditionalElem = elem.facetDisplay;

                            if (keepGoing) {
                                if (conditionalElem == 'CHECK LIST') {
                                    $scope.searchResultsRt = elem.facetData;
                                    $scope.onLoadFirstFacetId = elem.facetId;
                                    keepGoing = false;
                                }
                            }

                        });

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
                                if(isNaN(result[0])){//Secondary validation to handle String slider's
                                 $scope.facetDataTemp=[];
                                 angular.forEach($scope.facetData, function(elem, i) {
                                    if(elem.facetId == item.facetId){
                                     elem.facetDisplay = 'CHECK LIST';
                                    }
                                    $scope.facetDataTemp.push(elem)
                                  });
                                 $scope.facetData = $scope.facetDataTemp;
                                }
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
                        	$('div.pageLoader').show();
                        	if(booVal){//select of filter options
                        		$scope.getItemForFilters(true, selectedVal, ckpos,false,null,null,false);
                        	}else{//Un-select of filter options
                        		$scope.clear(selectedVal,ckpos);                        			
                        	}
                        }
						 
                        // Clears All the Filter
                        $scope.clearAll = function(checkBool) {
                            $scope.checkBool = false;
                            angular.element($('.filterCheckBox').prop("checked", false));
                            $scope.selectedFilterListObj = [];
                            $scope.showfilter = false;
                        }
                        //Find position of the object 
						/* $scope.findIndexOf = function(selectedVal){
                        	var position = 0 ;
							angular.forEach($scope.selectedFilterListObj, function(fData,k){
								if(fData.name == selectedVal){
									position = k;
									return position;
								}
							});
						}  */
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
                            if ($scope.selectedFilterListObj.length < 1) {
                                $scope.showfilter = false;
                                location.href = 'shopCentre';
                            } 
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
                            		$scope.appendPrvData.splice(k, 1);//Remove Facet from the Previous Chosen list
                            	}
                            });	
                           $scope.getItemForFilters(true, selectedVal, null,false,null,null,true);		
								
                        }
                        $scope.fullItemDetails = function(itemId,organizationId){
                      	  document.location.href="getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''";
                      	}
                         
                        $scope.callRange = function(booVal,ckpos,sliderMinVal,sliderMaxVal){
                        	//alert('test');
                        	$scope.currentPage;
                        	var minVal = sliderMinVal;
							var maxVal = sliderMaxVal;
							//$scope.rangeModel = this.rangeModel;
							
							$scope.getItemForFilters(true, minVal+'-'+maxVal, ckpos,true,minVal,maxVal,false);
                        };
                        //Generic Function for fetching Item List
						$scope.getItemForFilters = function(booVal, selectedVal, ckpos,isRangeInput,minVal,maxVal,clearFlag){
                        	//02-08-2017: NREV-1198: If you use the search field and then change facet selections, the search field should clear out.Added by Pooja.Reviewed by rajesh
                        	$scope.partSearchBar = "";
                        	//Enable check box
                        	if(!isRangeInput){
                        		angular.element($('.filterCheckBox[value=' + ckpos + ']').prop("checked", true));
                        	} 
                        	if(!clearFlag){
                        		var reqObj = {
         							   "facetId":ckpos.split("-")[0],
                                 	   "facetData":selectedVal.split("(")[0],	
                                 	   "isRangeInput":isRangeInput,
                                 	   "minRange":minVal,
                                 	   "maxRange":maxVal,
                                 	   "partType":1
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
                                			if(selectedVal == ele){
                                				//Do not append the Filter, It's already available in the scope
                                				checkFilter = true;
                                			}
                                		});
                                	});
                                	if(!checkFilter){
                                		  angular.forEach($scope.facetData, function(item, i){
  			                            	angular.forEach(item.facetData, function(elem, j){
  			                            		if(selectedVal==elem  ){
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
    			                            		if(selectedVal==elem  ){
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
                        	$scope.currentPage=0;
							//Call custom event 
							$http({
                                method : "GET",
                                url : "getShoppingItems?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partType=1"+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage,
                            }).then(function mySuccess(response) {
                                $scope.partListObj = response.data.partList;
                                $scope.facetData = response.data.facetdetails;
                                $scope.filteredTodos = $scope.partListObj;
                                $scope.partCount = response.data.itemCount;
                                $scope.facetDataTemp = [];
                                angular.forEach($scope.facetData, function(fData,k){
                                			angular.forEach($scope.appendPrvData, function(pData, j){
                                				//var boolValCheck = angular.equals(fData[k], pData[j]); 
                                				if(fData.facetId == pData.facetId){//Remove new facet if exist in previously chosen facet
                                					/* var isExist = false;
                                					angular.forEach($scope.facetDataTemp,function(eData,k){
                                						if(eData.facetId == pData.facetId){
                                							isExist = true;
                                						}
                                					});
                                					if(!isExist){
                                						$scope.facetDataTemp.push(fData);	
                                					} */
                                					$scope.facetData.splice(k,1);
														                                					
                                				} 
                               		})
                               }); 
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
                               // $scope.rangeModel.value = $scope.rangeModel;
                                $scope.partListObjTemp = $scope.partListObj; 
                                debugger;
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
                              	$('div.pageLoader').hide();
                              	var partList = [];
                    			angular.forEach($scope.filteredTodos, function(pData, j){
                    				if(pData.msrpStr == '' && pData.priceStr == '' && pData.savedPriceStr == ''){
                    					var item = {"partId":pData.partId,"partNumber":pData.partNumber };
	                    				partList.push(item);
                    				}
                   			});
                            var items = {"partVoList":partList};
                            if(partList.length > 0){
                            	var organizationId = $scope.filteredTodos[0].organizationId;
                            	$scope.getPriceForItems(items,organizationId);
                            }
                            }, function myError(response) {
                            	$('div.pageLoader').hide();
                                $scope.myWelcome = response.statusText;
                            });
						}                       
                        $scope.getPriceForItems = function(items,organizationId){
                        	
                        	$http({
                                method : "GET",
                                url : "getcategoryPartPrice?items="+JSON.stringify(items)+"&organizationId="+organizationId,
                            }).then(function mySuccess(response) {
                            	console.log("Result :"+response);
                            	if(response.data.length == 1256){//Signifies failure from back end, hence populate contact customer service
                            		angular.forEach($scope.filteredTodos,function(elem,i){
                                				elem.priceStr = "Contact Customer Service";
                                				elem.currencyCode = "Contact Customer Service";
                                				elem.inventoryMessage = "Contact Customer Service";
                                				elem.msrpStr = "-1";
                                				elem.savedPriceStr = "-1";
                                	});
                            	}
                            	angular.forEach(response.data.partItemVOList,function(item,i){
                            		angular.forEach($scope.partListObj,function(elem,j){
                            			if(item.partId == elem.partId){
                            				elem.priceStr = item.priceStr;
                            				elem.currencyCode = item.currencyCode;
                            				elem.inventoryMessage = item.inventoryMessage;
                            				elem.msrpStr = item.msrpStr;
                            				elem.savedPriceStr = item.savedPriceStr;
                            			}
                            		});
                            	});
                            	console.log('With Price'+$scope.partListObj);
                            }, function myError(response) {
                            	$('div.pageLoader').hide();
                                $scope.myWelcome = response.statusText;
                            });
                        };
                        
                        $scope.changeHandler = function(currentpage){
                        	$scope.currentPage = currentpage;
                        	$scope.numPerPage = $scope.numPerPage;
                        	$scope.noAppliedFilter = true;
                        }
                        $scope.resultsPerPage = function(maxSize){
                        	$scope.numPerPage = maxSize;
                        	$scope.currentPage = 1;
                        	$scope.noAppliedFilter = true;
                        	//$scope.maxSize = $scope.partCount / $scope.numPerPage;
                        }
                          $scope.$watchGroup(['currentPage','numPerPage'], function() {
                            var begin = (($scope.currentPage - 1) * $scope.numPerPage)
                            , end = begin + $scope.numPerPage;
	                         /* if($scope.partListObjTemp.length > 0) {
	                        	 
	                            $scope.filteredTodos = $scope.partListObjTemp.slice(begin, end);
	                            //Get Price only for those displayed in the screen at page level
	                         } */
						    //if($scope.partListObjTemp.length >0 && $scope.filteredTodos.length != $scope.numPerPage){
						    if($scope.currentPage > 0 && $scope.noAppliedFilter && !$scope.searchFlag){
						    	$('div.pageLoader').show();
							  $http({
	                                method : "GET",
	                                url : "getpageresults?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=1"+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&sortBy="+$scope.sortByVal+"&searchInput="+$scope.searchInputVal,
	                            }).then(function mySuccess(response) {
	                            	$('div.pageLoader').hide();
	                            	if(response.data.length == 1256){
	                            		console.log("Error Appeared Contact customer service");
	                            		$('div.pageLoader').hide();
	                            	}
									//Added by Krupa, Reviewed by Rajesh chinnam for NREV-1173
	                            	$scope.partListObj = response.data.partList;
	                                $scope.partListObjTemp = $scope.partListObj;
	                            	$scope.filteredTodos = response.data.partList;
	                            	var partList = [];
		                    			angular.forEach($scope.filteredTodos, function(pData, j){
		                    				if(pData.msrpStr == '' && pData.priceStr == '' && pData.savedPriceStr == ''){
		                    					var item = {"partId":pData.partId,"partNumber":pData.partNumber };
			                    				partList.push(item);
		                    				}
		                   			});
		                            var items = {"partVoList":partList};
		                            if(partList.length > 0){
		                            	var organizationId = $scope.filteredTodos[0].organizationId;
		                            	$scope.getPriceForItems(items,organizationId);
		                            }
		                            $scope.partCount = response.data.itemCount;
		                            $scope.searchInputVal = "";
									$scope.sortByVal = "";
	                            }, function myError(response) {
	                            	$('div.pageLoader').hide();
	                                $scope.myWelcome = response.statusText;
	                            });
						     }                      
                          });
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
							 $('div.pageLoader').show();
							 $scope.sortByVal = sortBy;
							 if(sortBy == ""){
								  $http({
		                                method : "GET",
		                                url : "getpageresults?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=1"+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&sortBy="+$scope.sortByVal+"&searchInput="+$scope.searchInputVal,
		                            }).then(function mySuccess(response) {
		                            	$('div.pageLoader').hide();
		                            	$scope.noAppliedFilter = false;
		                            	if(response.data.length == 1256){
		                            		console.log("Error Appeared Contact customer service");
		                            		$('div.pageLoader').hide();
		                            	}
		                            	$scope.filteredTodos = response.data.partList;
		                            	var partList = [];
			                    			angular.forEach($scope.filteredTodos, function(pData, j){
			                    				if(pData.msrpStr == '' && pData.priceStr == '' && pData.savedPriceStr == ''){
			                    					var item = {"partId":pData.partId,"partNumber":pData.partNumber };
				                    				partList.push(item);
			                    				}
			                   			});
			                            var items = {"partVoList":partList};
			                            if(partList.length > 0){
			                            	var organizationId = $scope.filteredTodos[0].organizationId;
			                            	$scope.getPriceForItems(items,organizationId);
			                            }
			                            $scope.partCount = response.data.itemCount;
			                            $scope.searchInputVal = "";
										$scope.sortByVal = "";
		                            }, function myError(response) {
		                            	$('div.pageLoader').hide();
		                                $scope.myWelcome = response.statusText;
		                            });
							 }else{
							 $http({
	                                method : "GET",
	                                url : "getsortbyresults?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=1"+"&sortBy="+sortBy+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage,
	                            }).then(function mySuccess(response) {
	                            	$('div.pageLoader').hide();
	                            	$scope.noAppliedFilter = false;
	                            	if(response.data.length == 1256){
	                            		console.log("Error Appeared Contact customer service");
	                            		$('div.pageLoader').hide();
	                            	}
	                            	$scope.partListObj = response.data.partList;
	                            	$scope.partListObjTemp = $scope.partListObj; 
	                            	$scope.filteredTodos = $scope.partListObj;
	                            	var partList = [];
	                    			angular.forEach($scope.filteredTodos, function(pData, j){
	                    				if(pData.msrpStr == '' && pData.priceStr == '' && pData.savedPriceStr == ''){
	                    					var item = {"partId":pData.partId,"partNumber":pData.partNumber };
		                    				partList.push(item);
	                    				}
	                   			});
	                            var items = {"partVoList":partList};
	                            if(partList.length > 0){
	                            	var organizationId = $scope.filteredTodos[0].organizationId;
	                            	$scope.getPriceForItems(items,organizationId);
	                            }
	                            $scope.partCount = response.data.itemCount;
	                            }, function myError(response) {
	                            	$('div.pageLoader').hide();
	                                $scope.myWelcome = response.statusText;
	                            });
							 } 
						 };
						 $scope.search = function(searchInput){
							 $('div.pageLoader').show();
							 //Modified by Krupa for NREV-1160
							 //NREV-1175, NREV-1160. Added by Pooja
							 if(searchInput== undefined){
								 searchInput = "";
							 } 
							 //NREV-1186: setting the number of charecters to search to 2. Added by Pooja Reviewed by rajesh
							 if(searchInput.length >= 2){
								 $scope.searchInputVal = searchInput;
								 $http({
		                                method : "GET",
		                                url : "getsearchinfo?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=1"+"&searchInput="+searchInput+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage,
		                            }).then(function mySuccess(response) {
		                            	$scope.noAppliedFilter = false;
		                            	$('div.pageLoader').hide();
		                            	if(response.data.length == 1256){
		                            		console.log("Error Appeared Contact customer service")
		                            		$('div.pageLoader').hide();;
		                            	}
		                            	$scope.partListObj = response.data.partList;
		                            	$scope.partListObjTemp = $scope.partListObj; 
		                            	$scope.filteredTodos = $scope.partListObj;
		                            	var partList = [];
		                    			angular.forEach($scope.filteredTodos, function(pData, j){
		                    				if(pData.msrpStr == '' && pData.priceStr == '' && pData.savedPriceStr == ''){
		                    					var item = {"partId":pData.partId,"partNumber":pData.partNumber };
			                    				partList.push(item);
		                    				}
		                   			});
		                            var items = {"partVoList":partList};
		                            if(partList.length > 0){
		                            	var organizationId = $scope.filteredTodos[0].organizationId;
		                            	$scope.getPriceForItems(items,organizationId);
		                            }
		                            $scope.partCount = response.data.itemCount;
		                            $scope.searchFlag =false;
		                            }, function myError(response) {
		                            	$('div.pageLoader').hide();
		                                $scope.myWelcome = response.statusText;
		                            });
								 $scope.searchFlag = true;
							 }else if(searchInput.length == 0){
								 $http({
		                                method : "GET",
		                                url : "getpageresults?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=1"+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&sortBy="+$scope.sortByVal+"&searchInput="+$scope.searchInputVal,
		                            }).then(function mySuccess(response) {
		                            	$('div.pageLoader').hide();
		                            	$scope.noAppliedFilter = false;
		                            	if(response.data.length == 1256){
		                            		console.log("Error Appeared Contact customer service");
		                            		$('div.pageLoader').hide();
		                            	}
		                            	$scope.filteredTodos = response.data.partList;
		                            	var partList = [];
			                    			angular.forEach($scope.filteredTodos, function(pData, j){
			                    				if(pData.msrpStr == '' && pData.priceStr == '' && pData.savedPriceStr == ''){
			                    					var item = {"partId":pData.partId,"partNumber":pData.partNumber };
				                    				partList.push(item);
			                    				}
			                   			});
			                            var items = {"partVoList":partList};
			                            if(partList.length > 0){
			                            	var organizationId = $scope.filteredTodos[0].organizationId;
			                            	$scope.getPriceForItems(items,organizationId);
			                            }
			                            $scope.partCount = response.data.itemCount;
		                            }, function myError(response) {
		                            	$('div.pageLoader').hide();
		                                $scope.myWelcome = response.statusText;
		                            });
								 $scope.searchFlag = false;
							 }else{
							        $("div.pageLoader").hide();
							        $scope.searchFlag = false;
							        return false;
							}
						 };
				       //end of Modified by Krupa for NREV-1160
						$('div.pageLoader').hide();
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
 
                </script>
	<script type="text/javascript">
				// Buy Now
								
				$(document).delegate('.buynow-click','click',function(e) {
		     	   e.preventDefault();
					var mediaId = $(this).parent().parent().attr('data-mediaId');
				 	var itemNumber = $(this).parent().parent().attr('data-partNumber');
		     	   
		     	   var organizationId = $(this).parent().parent().attr('data-orgid');
		     	   var partId = $(this).parent().parent().attr('data-partId');
		     	   var quantity = $(this).parent().parent().siblings("div.quantity-change").find(".total-items").val();
		     	   
		     	   var partPrice = $(this).parent().siblings('.your-price1').find("span.your-price").html();
		     	   
		     	   if(partPrice == null || partPrice == ''){
		     		   partPrice = $(this).parent().siblings('.msrpShowHide').find('span.msrp-price').html();
		     	   }   
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
				        	  window.location.href = 'directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&partPrice='+partPrice;
				          },  
				          error : function(e) {  
				        	  $('div.pageLoader').hide();
				          }  
			        });
		        });
				$(document).delegate('.add-to-cart','click',function(e) {
						//function addToCartFunc(partId,mediaId,organizationId,partNumber,quantity,img) {
							 $('div.pageLoader').show();
							 $("body").css("overflow", "hidden");
							e.preventDefault();
							var img =$(this).parent().parent().siblings("div:first-child").html();
							var partId =  $(this).parent().parent().attr('data-partId');
							var mediaId = $(this).parent().parent().attr('data-mediaId');
							var quantity = $(this).parent().parent().siblings("div.quantity-change").find(".total-items").val();
							var organizationId = $(this).parent().parent().attr('data-orgid');
							var itemNumber = $(this).parent().parent().attr('data-partNumber');
											
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
									dataItemVal : JSON.stringify(dataItemVal)
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
												//NREV-1511 fix starts
												if(jsonResponse.isActualImage == false){
													$(".waterMarkForCartPopOver").show();
												}
												//NREV-1511 fix ends
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
							 
						} );
				function getPriceForItems(items, organizationId) {
					var locale= null;
					var priceMsg = "<spring:message code='message.contact.customer.service' javaScriptEscape='true'/>";
					//$('div.pageLoader').show();
					$.ajax({
						type : "Get",
						data : {items:JSON.stringify(items),organizationId:organizationId},
						contentType : 'application/json',
						mimeType : 'application/json',
						url : "getcategoryPartPrice",
						success : function(response) {
		                var locale=null;
							console.log(response);
							var partItemListPriceAvail = response.partItemVOList;
							var appElement = document.querySelector('[ng-app=facetModule]');
						    var $scope = angular.element(appElement).scope();
							for(var i=0;i<partItemListPriceAvail.length;i++){
								 	var scopeElementMsrp = partItemListPriceAvail[i].partId+"-"+'msrp';
								 	var scopeElementYour = partItemListPriceAvail[i].partId+"-"+'your';
								 	var scopeElementSave = partItemListPriceAvail[i].partId+"-"+'save';
								 	$scope.$apply(function() {
								        $scope.scopeElementMsrp  = partItemListPriceAvail[i].msrpStr;
								        $scope.scopeElementYour  = partItemListPriceAvail[i].priceStr;
								        $scope.scopeElementSave  = partItemListPriceAvail[i].msrpStr;
								    });	
								if(partItemListPriceAvail[i].priceNotShown == true){
									
									$("span.your-price").removeClass("strike-through").text(priceMsg);
									$("div.msrpShowHide, div.savePriceShowHide").hide();
									$("div.savePriceShowHide span.save-price").siblings("span").text("");
									$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
									var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
									$("div.cart-item-info .stock-count").text(inventoryMsg);//set inventory Message text
								}
								else{
									$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
									$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
									$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);//set inventory Message text
								
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
				function getShoppingCartCount(){
					 /* Ajax call for cart item count*/
					 $.ajax({
					  type : "post",
					  url : "getshoppingcount",
					  //data : request.term.toLowerCase(),
					  dataType : "json",
					  contentType : 'application/json;charset=ISO-8859-1',
					  //mimeType : 'application/json;charset=ISO-8859-1',
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
				           myErrObj.raise(err,msg,textStatus);
						}
					 });
				}
				</script>

</body>

</html>
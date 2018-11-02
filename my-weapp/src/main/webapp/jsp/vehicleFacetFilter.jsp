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
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css?version=${properties['application.version']}">
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

.GridsDisplay div.quantity-change {
	margin-top: 0 !important;
}

.GridsDisplay .unit {
	position: static !important;
}

.searchPreferences {
	top: 8.2em;
	margin-left: 0;
	width: 855px;
	padding-bottom: 6px;
}

.primary div#custom-search-input {
	width: 200px;
	margin-top: 0.2em;
	float: right;
}

div.paginationStyle {
	text-align: center;
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

.breadcrumbs-list.fixed {
	width: 27% !important;
	padding-top: 10px;
}
/*Facet Template CSS */
.machine-details textarea.reftextarea {
	resize: none;
	max-width: 100%;
	font-size: 13px;
	max-height: 50px;
}

.machine-details p.reftext {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.machineTitle h4 span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 80%;
	display: inline-block;
}
/* Btn style
	.menu-icon{
		display: inline-block;
		vertical-align: middle;
		cursor: pointer;
	}
	.menu-icon>div{
	  width: 20px;
	  height: 3px;
	  background: #333;
	  margin: 3px;
	  text-align: right;
	  transition: transform 1s cubic-bezier(0.23, 1, 0.32, 1);
	}
	.menu-icon.active .top{
	   transition: transform 1s cubic-bezier(0.23, 1, 0.32, 1);
	  -webkit-transform: translateX(0) translateY(10px) rotate(45deg);
	  transform: translateX(0) translateY(5px) rotate(45deg);
	  background: #333;
	  
	}
	.menu-icon.active .middle{
	  opacity:0;
	  background: #fff;
	}
	.menu-icon.active .bottom{
	  transition: transform 1s cubic-bezier(0.23, 1, 0.32, 1);
	  -webkit-transform: translateX(0) translateY(-7px) rotate(-45deg);
	  transform: translateX(0) translateY(-7px) rotate(-45deg);
	 background: #333;
	} */
</style>
<!-- Javascript Library-->

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js?version=${properties['application.version']}"></script>
<script
	src="../js/less.min.js?version=${properties['application.version']}"></script>
<script
	src="../js/advance-filter.js?version=${properties['application.version']}"></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}"></script>
<script type="text/javascript"
	src="../js/jquery.i18n.properties.js?version=${properties['application.version']}"></script>
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
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class='active'><spring:message
							code="label.header.myvehicle" /></li>

				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-3 col-md-3 hidden-sm hidden-xs column-paddings responsive-padding"
					id="shopForPartLeft">
					<%-- <h3>
					<spring:message code="label.shopforparts" />
				</h3> --%>
					<!-- <div id="treeShopforParts" class="treeview-hldr hidden-xs"></div> -->
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
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="resultInfo" style="border-bottom: 1px solid #eee;"
						ng-if="productInfo">
						<div
							class="searchPreferences col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="primary">
								<div class="ItemCountDisp">
									<p>
										<spring:message code="label.catalog.count" /><span ng-cloak>{{partCount}}</span>
									</p>
								</div>
								<div id="custom-search-input">
									<div class="input-group col-md-12">
										<input type="text" class="form-control input-lg"
											placeholder="Search" ng-model="searchBar" /> <span
											class="input-group-btn" ng-click="search(searchBar)">
											<button class="btn btn-info btn-lg" type="button">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div id="partsPerPageDivHeader" class="col-md-4"
							style="font-size: 14px; margin-top: 10px">
							<span ng-show="partCount > 10" class="ten">Results Per
								Page <a href="javascript:void(0)" id="ten" class="ten-a"
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
								<pagination ng-model="currentPage" textPrev="<spring:message code="label.pagnation.next"/>" textNext="<spring:message code="label.pagnation.prev"/>"
									ng-change="changeHandler(currentPage)" total-items="partCount"
									items-per-page="numPerPage" max-size="maxSize"
									boundary-links="true" ng-hide="partCount == 0"></pagination>
							</div>
						</div>
					</div>
					<vehicle-search-template></vehicle-search-template>
				</div>
				<!-- For advance Filter -->
				<div class="container-fluid col-lg-12 block-wrapper">
					<div class="block"></div>
				</div>
				<!-- For advance Filter -->
				<div
					class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
					id="product-catalog-hldr"></div>

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
										<a href="machinecentre" title="Clear All"
											ng-click="clearAll()" class="clearall"><spring:message code="label.clear_all" /></a>
									</div>
									<ul class="list-search">
										<li ng-repeat="w in selectedFilterListObj"><a href="#">{{w.name}}<span
												class="glyphicon glyphicon-remove removClass"
												ng-click="clear(w.name, w.id)"></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default" ng-repeat="x in facetData">
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
													data-name="{{x.facetName}}"
													value="{{x.facetId}}-{{$index}}" ng-model="checkBool"
													ng-click="selectedFiltersList(checkBool, y, x.facetId+'-'+$index)"
													class="filterCheckBox"> {{y}}
											</label></li>
											<li ng-if="x.facetDisplay == 'SLIDER'"><label
												class="left">{{minVal}}</label> - <label class="right">{{maxVal}}</label>
												<input type="range" id="myRange"
												ng-change="callRange(true,x.facetId+'-rangeId')"
												data-name="{{x.facetName}}" min="{{minVal}}"
												max="{{maxVal}}" ng-model="rangeModel"></li>
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
			<div id="vehicleSearchTemplateRt" style="display: none">
				<div id="veh{{x.catalogId}}"
					class="search-parts-templates clearfix whereusedBox"
					ng-repeat="x in filteredTodos" ng-init="isGuest=x.isGuestCatalog">
					<div class="machineTitle">
						<h4 ng-click="viewMachine(x.catalogId,x.catalogName,x.mediaId)" />
						<spring:message code="search.catalog.vinNo" />
						: <span>{{x.customField1}}</span>
						</h4>
						<a ng-show="!(isGuest)" class="close-btn"
							ng-click="deleteCatalog(x.catalogId ,  x.catalogName )"> <i
							class="fa fa-trash-o delete-item hidden-xs"></i></a> <a
							ng-show="!(isGuest)" class="fav-btn" title="Favorites"
							ng-click="favoriteActions(x.catalogId,x.catalogName, x.isFavourite)"><i
							class="fa fa-star hidden-xs"
							ng-class="{'fav-item':(x.isFavourite == true),'no-fav-item':(x.isFavourite == false)}"></i></a>
					</div>
					<div class="machine-image" ng-class="{'no-image':(x.mediaId == 0)}"
						ng-click="viewMachine(x.catalogId,x.catalogName,x.mediaId)">
						<img class="img-responsive" alt="catalog-img"
							src="${properties['docserver.url']}?media={{x.mediaId}}&thumbnail=true'">
					</div>
					<div class="machine-details">
						<h6 ng-click="viewMachine(x.catalogId,x.catalogName,x.mediaId)">
							<p>
								<spring:message code="search.catalog.jobNo" />
							</p>
							<span>{{x.customField2}}</span>
						</h6>
						<strong><span> {{x.catalogEngineeringDescription}}</span>
						</strong>
						<h6 ng-click="viewMachine(x.catalogId,x.catalogName,x.mediaId)">
							<p>
								<spring:message code="search.catalog.model" />
							</p>
							<strong><span>{{x.model}}</span></strong>
						</h6>
						<div style="margin-bottom: 5px;">
							<span>{{x.customerName}}</span>
						</div>
						<h6 ng-click="viewMachine(x.catalogId,x.catalogName,x.mediaId)">
							<p>
								<spring:message code="view.label.serial.no" />
							</p>
							<span>{{x.catalogName}}</span>
						</h6>
					</div>
					<div class="machine-details machine-Detail100p">
						<%-- <h6 ng-click="viewMachine(x.catalogId,x.catalogName,x.mediaId)">
						   		<p class="reftext"><spring:message code="lable.brand"/></p>
						   		<span style="font-size:13px;line-height:2;">{{x.organizationName}}</span>
					   	   </h6> --%>
						<p ng-repeat="us in x.userDefinedFacets">{{us}}</p>
						<div style="margin-left: 0px; height: 120px;"
							ng-show="addReference"
							ng-init="addReference='true'; editFlag = true; editReferenceVal= x.catalogReference">
							<h6 ng-show="!(isGuest)">
								<p>
									<spring:message code="search.catalog.catalogReference" />
								</p>
							</h6>
							<div
								ng-show="((x.catalogReference =='' && editFlag) && !(isGuest))">
								<button ng-click="editFlag = !editFlag"
									class="btn btn-sm btn-primary">Add Reference</button>
							</div>
							<div ng-show="(x.catalogReference != '' && editFlag && !isGuest)">
								<span style="font-size: 13px; line-height: 2;">{{editReferenceVal}}</span>
								<button ng-click="editFlag = !editFlag"
									class="btn btn-xs btn-warning">
									<i class="fa fa-pencil"></i>
								</button>
							</div>
							<div ng-hide="editFlag">
								<textarea ng-model="editReferenceVal" class="reftextarea">{{editReferenceVal}}</textarea>
								<button
									ng-click="editFlag = true;x.catalogReference= editReferenceVal;editCatalog(x.catalogId,editReferenceVal,x.catalogName)"
									class="btn btn-xs btn-warning">Save</button>
								<button
									ng-click="editFlag = true;editReferenceVal=x.catalogReference"
									class="btn btn-xs btn-warning">Cancel</button>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div id="partsPerPageDivHeader" class="col-md-4"
						style="font-size: 14px; margin-top: 10px">
						<span ng-show="partCount > 10" class="ten">Results Per Page
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
							<pagination ng-model="currentPage" textPrev="<spring:message code="label.pagnation.next"/>" textNext="<spring:message code="label.pagnation.prev"/>"
								ng-change="changeHandler(currentPage)" total-items="partCount"
								items-per-page="numPerPage" max-size="maxSize"
								boundary-links="true" ng-hide="partCount == 0"></pagination>
						</div>
					</div>
				</div>
			</div>

			<div id="vehReferenceTemplate" style="display: none">
				<input type="text" on-enter="save()" on-esc="cancel()"
					ng-model="model" ng-show="editMode">
				<button ng-click="cancel()" ng-show="editMode">cancel</button>
				<button ng-click="save()" ng-show="editMode">save</button>
				<span ng-mouseenter="showEdit = true"
					ng-mouseleave="showEdit = false"> <span ng-hide="editMode"
					ng-click="edit()">{{model}}</span> <a ng-show="showEdit"
					ng-click="edit()">edit</a>
				</span>
			</div>

			<!--Ends  Right Panel Search Template -->
			<input id="msg" type="hidden"
				value="Are you sure you want to remove Serial Number?"> <input
				id="msg-contact-admin" type="hidden"
				value="Please contact your administrator to remove this machine from your list.">
			<input id="msg-deleted" type="hidden"
				value="was removed from your list."> <input id="msg-edited"
				type="hidden" value="is successfully edited."> <input
				id="msg-edit-error" type="hidden" value="cannot be edited.">
			<input id="msg-edit-error-part" type="hidden" value="from your list">
			<input id="msg-add-reference" type="hidden"
				value="Reference text for the"> <input id="msg-add-msg"
				type="hidden" value="is successfully added.">

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
			<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.bulkpartupload.information" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content"></p>
							<div class="modal-footer">
								<a class="col btn btn-ok" href="javascript:;"><spring:message
										code="label.myaccount.ok" /></a> <input type="hidden"
									id="confirmBoxType" />
							</div>

						</div>
					</div>
		</form>
	</div>
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
	<script>
                    $('div.pageLoader').show();
                    $("#main-menu-list > li:contains(<spring:message code='label.header.myvehicle'/>)").addClass('active');
                    var facetModule = angular.module('facetModule',  ['ui.bootstrap']);
                    facetModule.controller('facetCtrl', ['$scope', '$http', function($scope, $http) {
                       // $scope.msg = 'it works!';
                        $scope.facetData = ${facetList};   //jQuery.parseJSON('${facetList}');
                        $scope.vehicleObj = ${vehicleList}; //jQuery.parseJSON('${vehicleList}');
                        $scope.filteredTodos = $scope.vehicleObj;
                        $scope.selectedFilterListObj = [];
                        $scope.limitNum = 5;
                        $scope.filterCheck = false;
                        $scope.productInfo = true;
                        $scope.productCatalogueInfo = false;
                        $scope.GridsDisplay = false;
                        $scope.selectedObj = [];
                        //untouch
                        $scope.SelectedFacetObj = $scope.facetData;
                        $scope.partCount = '${catalogCount}';//$scope.vehicleObj.length;
                        //Whole Object
                        $scope.wholeObj = ${facetList}; //jQuery.parseJSON('${facetList}');
                        $scope.rangeValue = 0;
                        $scope.partListObjTemp = [];
                        var rangeExist = false;
                        $scope.filteredTodos = [];
                        $scope.appendPrvData = [];
                     	$scope.currentPage = 1;
                        $scope.numPerPage =10; 
                        $scope.maxSize=5;
                        $scope.facetReqObj = [];
                        $scope.onLoadFirstFacetId;
                        // scope for searchResults
                        var keepGoing = true;
                        $scope.noAppliedFilter = false; //Used for pagination flag
                        $scope.sortByVal = "";
                        $scope.searchInputVal = "";
                        
                        
                        angular.forEach($scope.facetData, function(elem, i) {
                            var conditionalElem = elem.facetDisplay;

                            if (keepGoing) {
                                if (conditionalElem == 'CHECK LIST') {
                                    $scope.searchResultsRt = elem.facetData;
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
                                $scope.minVal = Math.min.apply(Math, result);
                                $scope.maxVal = Math.max.apply(Math, result);
                                $scope.switchTemplate = 2;

                            }
                        });
						// Pushing range value
						
                        
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
                                location.href = 'machinecentre';
                            } 
                            if(pos == 'rangeId'){
                            	$scope.rangeModel = $scope.maxVal;
                            }
                            angular.forEach($scope.facetReqObj, function(fData,k){
                            	if(fData.facetData == selectedVal.split(":")[1] || fData.facetData == selectedVal.split("(")[0]){
                            		$scope.facetReqObj.splice(k, 1);//Remove from the request list vo
                            	}
                            });
                           $scope.getItemForFilters(true, selectedVal, null,false,null,null,true);		
								
                        }
                        $scope.fullItemDetails = function(itemId,organizationId){
                      	  document.location.href="getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''";
                      	}
                         
                        $scope.callRange = function(booVal,ckpos){
                        	//alert('test');
                        	$scope.currentPage;
                        	var minVal = $scope.minVal;
							var maxVal = this.rangeModel;
							$scope.rangeModel = this.rangeModel;
							
							$scope.getItemForFilters(true, minVal+'-'+maxVal, ckpos,true,minVal,maxVal,false);
                        };
                        //Generic Function for fetching Item List
						$scope.getItemForFilters = function(booVal, selectedVal, ckpos,isRangeInput,minVal,maxVal,clearFlag){
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
                                 	   "partType":2
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
                                url : "getShoppingItems?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partType=2",
                            }).then(function mySuccess(response) {
                                $scope.vehicleObj = response.data.vehicleList;
                                $scope.filteredTodos =$scope.vehicleObj;
                                $scope.facetData = response.data.facetdetails;
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
    								if($scope.facetData != "" &&  $scope.facetData.length > 0){
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
    							
    							$scope.partCount = response.data.itemCount;
    							$scope.noAppliedFilter = false;
                               // $scope.rangeModel.value = $scope.rangeModel;
                               // $scope.partListObjTemp = $scope.vehicleObj; 
                                debugger;
                                $scope.currentPage = 1;
                                $scope.numPerPage =10; 
                                $scope.maxSize=5;
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
                              	$('div.pageLoader').hide();
                            }, function myError(response) {
                            	$('div.pageLoader').hide();
                                $scope.myWelcome = response.statusText;
                            });
						}
                        //View Machine information
                        $scope.viewMachine = function(catalogId,catalogName,mediaId){
                        	window.location.href = 'viewmachine?catalogId='+catalogId+'&assemblyNumber='+catalogName+'&mediaId='+mediaId;
                        }

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
                              //Get Remaining Items
                              $scope.filteredTodos = $scope.vehicleObj;
                              if($scope.currentPage > 0 && $scope.noAppliedFilter){
                            	  console.log('Get Remaining Items');
                            	  $("div.pageLoader").show();
                            		$http({
                                        method : "GET",
                                        url : "getpageresults?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=2"+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&sortBy="+$scope.sortByVal+"&searchInput="+$scope.searchInputVal,
                                    }).then(function mySuccess(response) {
                                    	/* $scope.vehicleList = response.data.vehicleList;
                                    	angular.forEach($scope.vehicleList,function(item,j){
                                    		$scope.filteredTodos.push(item)
                                    	});
                                    	$scope.partCount = response.data.itemCount; */
                                    	$scope.filteredTodos = response.data.vehicleList;
                                    	$("div.pageLoader").hide();
                                    }, function myError(response) {
                                    	$('div.pageLoader').hide();
                                        $scope.myWelcome = response.statusText;
                                    });
                              }
                          });  
    						 $scope.search = function(searchInput){
    							 $('div.pageLoader').show();
    							 if(typeof searchInput === 'undefined'){
    								 $('div.pageLoader').hide();
    								 return false;
    							 }
    							 if(searchInput.length >= 3){
    								 $scope.searchInputVal = searchInput;
    								 $http({
    		                                method : "GET",
    		                                url : "getsearchinfo?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=2"+"&searchInput="+searchInput+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage,
    		                            }).then(function mySuccess(response) {
    		                            	$('div.pageLoader').hide();
    		                            	if(response.data.length == 1256){
    		                            		console.log("Error Appeared Contact customer service")
    		                            		$('div.pageLoader').hide();;
    		                            	}
    		                            	$scope.vehicleList = response.data.vehicleList;
    		                            	$scope.filteredTodos = $scope.vehicleList;
    		                            	$scope.partCount = response.data.itemCount;
    		                            }, function myError(response) {
    		                            	$('div.pageLoader').hide();
    		                                $scope.myWelcome = response.statusText;
    		                            });
    							 }else if(searchInput.length == 0){
    								 $('div.pageLoader').hide();	 
    								 $scope.searchInputVal= "";
    								 $http({
                                         method : "GET",
                                         url : "getpageresults?selectedItems=" + JSON.stringify($scope.facetReqObj)+"&partTypeId=2"+"&pageNumber="+$scope.currentPage+"&pageSize="+$scope.numPerPage+"&sortBy="+$scope.sortByVal+"&searchInput="+$scope.searchInputVal,
                                     }).then(function mySuccess(response) {
                                     	//$scope.vehicleList = response.data.vehicleList;
                                     	$scope.searchInputVal = "";
                                     	
 		                            	$scope.filteredTodos = $scope.vehicleList;
                                     	$scope.partCount = response.data.itemCount;
                                     	$("div.pageLoader").hide();
                                     }, function myError(response) {
                                     	$('div.pageLoader').hide();
                                         $scope.myWelcome = response.statusText;
                                     });
    							 }else{
    								 $('div.pageLoader').hide();	 
    							 }
    							 
    						 };
                         
    						//Delete Catalog based on ID - Directive specific
                             $scope.deleteCatalog = function(catalogId,catalogName){
                                	$('div.pageLoader').show();	
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
                         						$('div.pageLoader').hide();	
                         						$("#confirmationWindow").show();
                            				 	}
                            				 	else{
                            				 		editMessage=catalogName+" "+deletedMsg;
                     	       				 	$('.modal-body').text(editMessage);
                     							$('div.pageLoader').hide();	
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
                                             	$('div.pageLoader').hide();
                                				 		editMessage=contactAdminMsg;
                                				 		$('.modal-body').text(editMessage);
                             						$('div.pageLoader').hide();	
                             						$("#confirmationWindow").show();
                                      	});	
                             };
    						 
    						 
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
                    facetModule.directive('vehicleSearchTemplate', function() {
                        return {
                            restrict: 'E',
                            template: vehicleSearchTemplateRt.innerHTML,
                            controller: function($scope, $element, $attrs,$http){
                            	$scope.favoriteActions = function(catalogId,catalogName, isFavourite){
                                	console.log(catalogId+"--"+catalogName);
                            		angular.element( $( "#veh" + catalogId));
                            		$('div.pageLoader').show();
                            		var favoriteActionUrl;
                                	// inside success
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
                                			console.log(response);
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
                	         				//$("div.pageLoader").find("h4").text(x);
                                		 }, function myError(response) {
                	         				console.log(response);
                	         			});
                                	//$('div.pageLoader').hide();
                                }; 
                                
                           	 //End of Modified by krupa for Facet implementation
                                $scope.editCatalog = function(catalogId,catalogRef,catalogName){
                                   	$('div.pageLoader').show();	
                                   	if(catalogRef == ''){
 										return false;                                  		
                                   	}else if(catalogRef.length > 126){
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
                                				$('div.pageLoader').hide();
                                				var response=data;
                                				if(response.data.oldValue=="noOldValueFound"){
                                					var mg=addReference+" "+response.data.catalogName + " " +addReferenceMsg;
                                					$('.modal-body').text(mg);
                                					$('div.pageLoader').hide();	
                                					$("#confirmationWindow").show();
                                					//window.location.href="machinestatus?message="+empty+"&pageNo="+pageNumber+"&pageSize="+pageSize;
                                				}
                                				else{
                                					var editMessage = addReference+" "+response.data.catalogName + " " +editedMsg;
                                					$('.modal-body').text(editMessage);
                                					$('div.pageLoader').hide();	
                                					$("#confirmationWindow").show();
                                    				//window.location.href="machinestatus?message="+empty+"&pageNo="+pageNumber+"&pageSize="+pageSize;
                                    				
                                				}	
                                   			}, function myError(response) {
                                                	$('div.pageLoader').hide();
                                                	console.log(response);
                                         	});	  	
                                };
       						$('div.pageLoader').hide();
                            }
                        }
                    });
                    
                    // Cooked Template for product Catalogue Holder  Panel
                    facetModule.directive('productCatalogueHolder', function() {
                        return {
                            restrict: 'E',
                            template: searchResultsprodCatalogueTemplate.innerHTML
                        }
                    });
                    
					// Cooked Template for veh Ref.
					/*
					facetModule.directive('inlineEdit', function($timeout) {
                 		return {
                    	    restrict: 'A',
                    	    replace: true,
                    	    scope: {
                   	    	  nestedData: '=',
                      	      model: '=inlineEdit',
                      	      handleSave: '&onSave',
                      	      handleCancel: '&onCancel'
                      	    },
                      	    link: function(scope, elm, attr) {
                      	      var previousValue;
                      	      
                      	      scope.edit = function() {
                      	        scope.editMode = true;
                      	        previousValue = scope.model;
                      	        
                      	        $timeout(function() {
                      	          elm.find('input')[0].focus();
                      	        }, 0, false);
                      	      };
                      	      scope.save = function() {
                      	        scope.editMode = false;
                      	        scope.handleCancel({value: scope.model});
                      	      };
                      	      scope.cancel = function() {
                      	        scope.editMode = false;
                      	        scope.model = previousValue;
                      	        scope.handleCancel({value: scope.model});
                      	      };
                   	    	},
                   	    	templateUrl: vehReferenceTemplate.innerHTML
                   	  	};
                   	});*/
 
                </script>
	<script type="text/javascript">
			//Favorite catalog's INC-764
	        /* function createfavorite(catalogId,catalogname){
	        	console.log("Html ele" +this);
	        		$.ajax({
	         			type: "POST",
	         			url: "addtofavorites",
	         			data: {catalogId:catalogId},
	         			success: function(data){
	         				console.log("Result :"+data);
	         				//alert("Catalog :  "+catalogname +" is added to favorites.");fav-btn
	         				if(jQuery.parseJSON(data)){
	         					$(".machineTitle").find("a#"+catalogId).find(".no-fav-item").addClass("fav-item");
	             				$(".machineTitle").find("a#"+catalogId).find(".no-fav-item").removeClass("no-fav-item");
	         					$("div.pageLoader").find("h4").text("Catalog :  "+catalogname +" is added to favorites.");	
	         					var event = $(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick").replace("createfavorite","removefavorite");
	             				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick",event);
	             				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("title","Remove favorites");
	         				}else{
	         					$("div.pageLoader").find("h4").text("Catalog :  "+catalogname +" is your favorites already.");
	         				}
	         				$("div.pageLoader").show().fadeOut(5000);
	         				//$("div.pageLoader").find("h4").text(x);
	         			},error:function(e){
	         				console.log(e);
	         			}
	         			});
	        		$("div.pageLoader").find("h4").text("Loading ...");	
	        	 
	        }
	        function removefavorite(catalogId,catalogname){
	        	$.ajax({
	     			type: "POST",
	     			url: "removefavorites",
	     			data: {catalogId:catalogId},
	     			success: function(data){
	     				console.log("Result :"+data);
	     				$(".machineTitle").find("a#"+catalogId).find(".fav-item").addClass("no-fav-item");
	     				$(".machineTitle").find("a#"+catalogId).find(".fav-item").removeClass("fav-item");
	     				var event = $(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick").replace("removefavorite","createfavorite");
	     				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick",event);
	     				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("title","Add to favorites");
	     				$("div.pageLoader").find("h4").text("Catalog :  "+catalogname +" is removed from favorites.");
	     				$("div.pageLoader").show().fadeOut(5000);
	     			//	alert("Catalog :  "+catalogname +" is removed to favorites.");
	     				//$("div.pageLoader").find("h4").text(x);
	     			},error:function(e){
	     				console.log(e);
	     			}
	     			});
	        	$("div.pageLoader").find("h4").text("Loading ...");	
	        }
	        function deleteCatalog(catalogId,catalogName){
	        	var delateConfim=document.getElementById("msg").value;
	        	var label=document.getElementById("msg-edit-error-part").value;
	        	var result=1;//confirm(delateConfim+" "+catalogName+" "+label);
	        	$('div.pageLoader').show();	
	        	$("div.pageLoader").find("h4").text("Loading ...");	
	        	 var $containerwidth = $(window).width();
	        	 if($containerwidth>768){
	    	       var pageNo =  $('#page-selection>.pagination.bootpag>li.active').children('a').text();
	        	 }
	    			 else{
	    				var pageNo =  $('#page-selection-xs>.pagination.bootpag>li.active').children('a').text();
	    			 }
	    	     if(result){	
	            		var contactAdminMsg=document.getElementById("msg-contact-admin").value;
	            		var deletedMsg= document.getElementById("msg-deleted").value;
	            		$.ajax({
	            			type: "POST",
	            			url: "deleteCatalog",
	            			data: {catalogId:catalogId},
	            			 success: function(data){
	           				 	if(data=="failure"){
	           				 		editMessage=contactAdminMsg;
	           				 		$('.modal-body').text(editMessage);
	        						$('div.pageLoader').hide();	
	        						$("#confirmationWindow").show();
	           				 		
	           				 		//window.location.href="machinestatus?message="+editMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
	           				 		//$('div.col-sm-12 text-center').show();
	           				 		//$('#page-selection').show();
	           				 	}
	           				 	else{
	           				 		editMessage=data+" "+deletedMsg;
	           				 		
	    	       				 	$('.modal-body').text(editMessage);
	    							$('div.pageLoader').hide();	
	    							$("#confirmationWindow").show();
	           				 		
	           				 		//window.location.href="machinestatus?message="+editMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
	           				 	}
	            			},																					
	            			error: function(e){
	            				console.log( e);																				
	            			} 
	            		}); 
	           			}else{
	           				//alert("in else");
	           				//$('.alert-text').empty();
	           				//$('div.pageLoader').hide();	
	           				//location.reload(); 
	           				var nullMessage="";
	           				$.ajax({
	           					type: "POST",
	           					 url: "machinestatus?message="+nullMessage+"&pageNo="+pageNo+"&pageSize="+pageSize,
	           					 success: function(data){
	           						 if(data!=""){
	           							$('div.pageLoader').show();	
	           							window.location.href="machinestatus?message="+nullMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
	           							 //window.loaction.href="machinestatus?message="+nullMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
	           						 }
	           					 }
	           					
	           				});
	           				$('div.pageLoader').hide();	
	            	}
	            }; */
	        	$('.machine-edit-btn').on("click", function(){
	                $(this).parents('.machine-edit').hide();
	               /*  $(this).parents('span').siblings('.save-machine').find('input').val($(this).parent().find('strong').text());
	                $(this).parents('span').siblings('.save-machine').show(); */
	                var value = $(this).siblings('strong').text();
	                  $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'}).children('textarea').val(value);
	              });
	        	
	        	 $('.add-machine').delegate(".cancel-machine-btn","click",function(){
			  			   $('div.pageLoader').show();
			           $(this).children('.save-machine').hide();
			           $(this).children('.machine-edit').show(); 
			           $('div.pageLoader').hide();
			           /* $(this).parents('span').siblings('.machine-edit').show(); */
			        });
	        	 $('.close-btn').on("click", function(){
	        	        $(this).parents('.search-parts-templates').remove();
	        	      });
				$(".custom-close").click('click',function(){
					$("#confirmationWindow").hide();
					$("div.pageLoader").hide();
				})
	        			  $('.add-machine-btn').on("click", function(){
	        	        $(this).parents('.add-machine').hide();
	        	        $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'});
	        	      });
	        			  $(".btn-ok").click(function(){
	        				  $(".modal").hide()
	        		        });
			</script>
</body>
</html>

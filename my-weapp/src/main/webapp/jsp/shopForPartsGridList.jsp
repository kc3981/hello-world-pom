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
.unit {
	position: absolute;
	width: 16%;
	display: inline-block;
	margin-left: -20px;
}

.spinner-control input {
	height: 36px;
	float: left;
	width: 30px !important;
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

.spinner-control {
	display: inline-block;
	margin-top: 35px;
	margin-right: 10px;
}

.add-cartpopover {
	width: 96%;
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

.result-container img {
	max-height: 130px
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
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"
	type="text/javascript"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

<script
	src="../js/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
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

<body>
<%@ include file="googleAnalyticsbody.jsp" %>
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
					<%-- <h3>
                                    <spring:message code="label.shopforparts" />
                                    </h3>
                                    --%>

					<!-- Left panel Facet Filter -->
					<div id="facetfilter">
						<h3>Show Results for</h3>
						<div class="subFilters">
							<!-- Accordian Implementation -->
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#category"> Applied Filters <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="category" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="filterBody">
												<!-- <div id="custom-search-input" style="width: 82%;display: inline-block;">
                                                                    <div class="input-group col-md-12">
                                                                        <input type="text" class="form-control input-lg" placeholder="Search" /> <span class="input-group-btn">
															<button class="btn btn-info btn-lg" type="button">
																<i class="glyphicon glyphicon-search"></i>
															</button>
														</span>
                                                                    </div>
                                                                </div> -->
												<div>
													<a href="shopCentre" title="Clear All" id="deleteAll">Clear
														All</a>
												</div>
												<ul>
													<li><a href="#">${value}<span
															class="glyphicon glyphicon-remove removClass"></a><span
														style="font-size: 9px">(${value})</span></li>
												</ul>


											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default" style="display: none">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#prodCategory">Product Sub-Categories<span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="prodCategory" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">

												<ul>
													<li><input type="checkbox" id="aluminium">Aluminium
														Molds (2)</li>
													<li><input type="checkbox" id="blank">Blank
														Plates (4)</li>
													<li><input type="checkbox" id="drilled">Drilled
														Plates (7)</li>
												</ul>


											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default width">
									<div class="panel-heading width">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#width">Width<span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="width" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">
												<ul>
													<li><input type="checkbox" id="width1"> 96 (2)
													</li>
													<li><input type="checkbox" id="width2"> 100
														(1)</li>
													<li><input type="checkbox" id="width3"> 126
														(1)</li>
												</ul>


											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default steel">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#steel">Steel Types<span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="steel" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">

												<ul>
													<li><input type="checkbox" id="steel1">DME01 /
														1.1730 (2)</li>
													<li><input type="checkbox" id="steel2">DME03 /
														1.2312 (1)</li>
												</ul>


											</div>
										</div>
									</div>
								</div>

								<div class="panel panel-default diameter">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#diameter">Diameter<span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="diameter" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">

												<ul>
													<li><input type="checkbox" id="dia1">1/2"
														oversize (2)</li>
													<li><input type="checkbox" id="dia2">1/4" (1)</li>
												</ul>


											</div>
										</div>
									</div>
								</div>

								<div class="panel panel-default aluminium">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#dimension">Dimensions (Length*Width)<span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="dimension" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">
												<ul>
													<li><input type="checkbox" id="dim1">125 * 125
														(1)</li>
													<li><input type="checkbox" id="dim2">125 * 246
														(1)</li>
												</ul>
											</div>
										</div>
									</div>
								</div>





								<div class="panel panel-default series">
									<div class="panel-heading width">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#series">Series W x L<span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="series" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">
												<ul>
													<li><input type="checkbox" id="model1"> 096 x
														096 (1)</li>
													<li><input type="checkbox" id="model2"> 100 x
														130 (1)</li>
												</ul>


											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#thickness"> Thickness <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="thickness" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="filterBody">

												<div id="slider"></div>

											</div>
										</div>
									</div>
								</div>

								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#brand"> Product Categories <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="brand" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="filterBody">
												<div id="custom-search-input">
													<div class="input-group col-md-12">
														<input type="text" class="form-control input-lg"
															placeholder="Search" /> <span class="input-group-btn">
															<button class="btn btn-info btn-lg" type="button">
																<i class="glyphicon glyphicon-search"></i>
															</button>
														</span>
													</div>
												</div>
												<ul>
													<li><input type="checkbox" checked="true" name="Axle"
														value="Axle" class="plate"><a
														href="getcategoryinformation">Plates </a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Components</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Surface Finishing</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Temperature Controllers</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Hot Runner Spare Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="getcategoryinformation">Die Sets</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Metalworking Fluids</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Mold Bases</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Pins,Sleeves &amp; Blades</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Die Casting</a></li>
												</ul>
												<!--   <a href="#" class="moreFacets">View More</a> -->

											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- EO Accordian Implementation -->
						</div>
					</div>

					<!-- EO Left panel Facet Filter -->

					<!-- <div id="treeShopforParts" class="treeview-hldr hidden-xs"></div> -->
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

					<div class="searchPreferences">


						<div class="primary">
							<p><spring:message code="label.sort_by" /></p>
							<select>
								<option><spring:message code="label.item_no" /></option>
								<option><spring:message code="label.item_description" /></option>
								<option>Item Category</option>
							</select>
							<div id="gridOrList">
								<a class="gridView" href="javascript:void(0)"><span
									class="glyphicon glyphicon-th-large"></span><spring:message code="label.grid" /></a> <a
									class="listView" href="javascript:void(0)"><span
									class="glyphicon glyphicon-th-list"></span><spring:message code="label.list" /></a>
							</div>
							<div class="ItemCountDisp">
								<p>
									<spring:message code="label.item.count" />&nbsp;:&nbsp;<span>13</span>
								</p>
							</div>
							<div id="custom-search-input">
								<div class="input-group col-md-12">
									<input type="text" class="form-control input-lg"
										placeholder="Search" /> <span class="input-group-btn">
										<button class="btn btn-info btn-lg" type="button">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</span>
								</div>
							</div>
						</div>


						<!-- <div class="itemsPerPage">
							Results per page: <span> <a href="">16</a> | <span>32</span>
								| <a href="">48</a>
							</span>
						</div>
						<div class="pagination"></div> -->

					</div>

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
						id="resultInfo"
						style="display: none; border-bottom: 1px solid #eee;">

						<div
							class="col-lg-6 col-md-5 col-sm-4 col-sm-push-0 col-xs-3 col-xs-push-9"
							style="margin-top: 10px; padding: 0px 0px;">
							<h3 id="headerName" class="inline hidden-xs"
								style="margin: 0px 0px;"></h3>
							&nbsp; ( <span id="allResult"></span>&nbsp;
							<spring:message code="label.results" />
							)
						</div>
						<div
							class="col-lg-5 col-md-7 col-sm-8 col-sm-pull-0 col-xs-9 col-xs-pull-3 nopadding pull-right">
							<div class="pull-right" style="padding-top: 10px;">
								<label> <spring:message code="label.sortby" />
								</label> <select id="sort-by">
									<option value="1">
										<spring:message code="whereused.item" />
									</option>
									<option value="2">
										<spring:message code="label.export.commercialdescription" />
									</option>
								</select>
								<div class="menu-icon active" id="menu-toggle">
									<div class="top"></div>
									<div class="middle"></div>
									<div class="bottom"></div>
								</div>
							</div>
						</div>

					</div>
					<!-- 					 For advance Filter -->
					<div class="container-fluid col-lg-12 block-wrapper">
						<div class="block"></div>
					</div>
					<!-- 					 For advance Filter -->
					<div
						class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="product-catalog-hldr">
						<div
							class="row search-parts-template cart-details add-cartpopover plate width1 steel2">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0);" class="no-image"
									onclick="fullItemDetails(10394,5)">ENCODER</a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(10394,5)" data-itemid="10394"
										data-mediaid="0" data-itemnumber="PLT01096096046">Item #
										PLT01096096046</a>
								</h4>
								<div>
									<strong>P-Plates</strong>
								</div>
								<div>P/096x096x046 /2312</div>
								<div class="b-label">
									<div class="showList">DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="125" ><span _tmplitem="125"  class="stock-count" data-avail="10394"></span> In Stock, Lead Time <span _tmplitem="125"  class="lead-time" data-leadtime="10394"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="10394"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="5">
								<div data-msrpshowhide="10394" data-msrp="10394"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="10394"></span>
								</div>
								<div class="your-price1 hidden" data-price="10394">
									Your Price: <span class="your-price price-loader"
										data-price="10394"></span>
								</div>
								<div data-savepriceshowhide="10394" data-saved="10394"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="10394"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>

						<!-- Above 4 Items Repeated -->
						<div
							class="row search-parts-template cart-details add-cartpopover plate width2">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0);" class="no-image"
									onclick="fullItemDetails(10394,5)">ENCODER</a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(10394,5)" data-itemid="10394"
										data-mediaid="0" data-itemnumber="10010773">Item #
										PLT01096096046</a>
								</h4>
								<div>
									<strong>ENCODER</strong>
								</div>
								<div>Encoder HE100M</div>
								<div class="b-label">
									<div class="showList">DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="125" ><span _tmplitem="125"  class="stock-count" data-avail="10394"></span> In Stock, Lead Time <span _tmplitem="125"  class="lead-time" data-leadtime="10394"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="10394"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="5">
								<div data-msrpshowhide="10394" data-msrp="10394"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="10394"></span>
								</div>
								<div class="your-price1 hidden" data-price="10394">
									Your Price: <span class="your-price price-loader"
										data-price="10394"></span>
								</div>
								<div data-savepriceshowhide="10394" data-saved="10394"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="10394"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>
						<div
							class="row search-parts-template cart-details add-cartpopover drilled model1 ">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(429930,4)">
									<img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133550&amp;thumbnail=true&amp;user=156&amp;token=cca2c2ea279085b71d25be6d9a7fc7bbdd9604284dd4fdbb2040da7dcd505b18">
								</a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(429930,4)" data-itemid="429930"
										data-mediaid="133550" data-itemnumber="L0501096096022">Item
										# L0501096096022</a>
								</h4>
								<div>
									<strong>Oversized Clamping Plate (width)+ recess</strong>
								</div>
								<div>L05 / 1730 / 96x 96x 22</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="67" ><span _tmplitem="67"  class="stock-count" data-avail="429930"></span> In Stock, Lead Time <span _tmplitem="67"  class="lead-time" data-leadtime="429930"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="429930"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="429930" data-msrp="429930"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="429930"></span>
								</div>
								<div class="your-price1 hidden" data-price="429930">
									Your Price: <span class="your-price price-loader"
										data-price="429930"></span>
								</div>
								<div data-savepriceshowhide="429930" data-saved="429930"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="429930"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>
						<div
							class="row search-parts-template cart-details add-cartpopover drilled model2">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(429930,4)">
									<img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133550&amp;thumbnail=true&amp;user=156&amp;token=cca2c2ea279085b71d25be6d9a7fc7bbdd9604284dd4fdbb2040da7dcd505b18">
								</a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(429931,4)" data-itemid="429931"
										data-mediaid="133550" data-itemnumber="L0501100130022">Item
										# L0501100130022</a>
								</h4>
								<div>
									<strong>Oversized Clamping Plate (width)+ recess</strong>
								</div>
								<div>L05 / 2312 / 100x130x 22</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="67" ><span _tmplitem="67"  class="stock-count" data-avail="429930"></span> In Stock, Lead Time <span _tmplitem="67"  class="lead-time" data-leadtime="429930"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="429930"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="429930" data-msrp="429930"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="429930"></span>
								</div>
								<div class="your-price1 hidden" data-price="429930">
									Your Price: <span class="your-price price-loader"
										data-price="429930"></span>
								</div>
								<div data-savepriceshowhide="429930" data-saved="429930"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="429930"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>



						<div
							class="row search-parts-template cart-details add-cartpopover aluminium dim1">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(421183,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134095&amp;thumbnail=true&amp;user=48219&amp;token=b264c1767786dc8f7c037d2774f8c821f5fc18afe3fd0aecbe4705e2d94c18fd"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(421183,4)" data-itemid="421183"
										data-mediaid="134095" data-itemnumber="AFN125125">Item #
										AFN125125</a>
								</h4>
								<div>
									<strong>Aluminium Mold Base - Plastics</strong>
								</div>
								<div>AFN 125 / 125 ALU.MOULD BASE</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="94" ><span _tmplitem="94"  class="stock-count" data-avail="421183"></span> In Stock, Lead Time <span _tmplitem="94"  class="lead-time" data-leadtime="421183"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="421183"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="421183" data-msrp="421183"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="421183"></span>
								</div>
								<div class="your-price1 hidden" data-price="421183">
									Your Price: <span class="your-price price-loader"
										data-price="421183"></span>
								</div>
								<div data-savepriceshowhide="421183" data-saved="421183"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="421183"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>


						<div
							class="row search-parts-template cart-details add-cartpopover aluminium dim2">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(421186,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134095&amp;thumbnail=true&amp;user=48219&amp;token=b264c1767786dc8f7c037d2774f8c821f5fc18afe3fd0aecbe4705e2d94c18fd"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(421186,4)" data-itemid="421186"
										data-mediaid="134095" data-itemnumber="AFN125246">Item #
										AFN125246</a>
								</h4>
								<div>
									<strong>Aluminium Mold Base - Plastics</strong>
								</div>
								<div>AFN 125 / 246 ALU.MOULD BASE AFN 125 / 246 ALU.MOULD
									BASE</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="97" ><span _tmplitem="97"  class="stock-count" data-avail="421186"></span> In Stock, Lead Time <span _tmplitem="97"  class="lead-time" data-leadtime="421186"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="421186"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="421186" data-msrp="421186"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="421186"></span>
								</div>
								<div class="your-price1 hidden" data-price="421186">
									Your Price: <span class="your-price price-loader"
										data-price="421186"></span>
								</div>
								<div data-savepriceshowhide="421186" data-saved="421186"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="421186"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>

						<div
							class="row search-parts-template cart-details add-cartpopover plate width1 steel1">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(429930,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133550&amp;thumbnail=true&amp;user=48219&amp;token=b264c1767786dc8f7c037d2774f8c821f5fc18afe3fd0aecbe4705e2d94c18fd"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(429930,4)" data-itemid="429930"
										data-mediaid="133550" data-itemnumber="L0501096096022">Item
										# L0501096096022</a>
								</h4>
								<div>
									<strong>Oversized Clamping Plate (width)+ recess</strong>
								</div>
								<div>L05 / 1730 / 96x 96x 22</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="131" ><span _tmplitem="131"  class="stock-count" data-avail="429930"></span> In Stock, Lead Time <span _tmplitem="131"  class="lead-time" data-leadtime="429930"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="429930"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="429930" data-msrp="429930"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="429930"></span>
								</div>
								<div class="your-price1 hidden" data-price="429930">
									Your Price: <span class="your-price price-loader"
										data-price="429930"></span>
								</div>
								<div data-savepriceshowhide="429930" data-saved="429930"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="429930"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>

						<div
							class="row search-parts-template cart-details add-cartpopover plate width3 steel1">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(429933,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133550&amp;thumbnail=true&amp;user=48219&amp;token=b264c1767786dc8f7c037d2774f8c821f5fc18afe3fd0aecbe4705e2d94c18fd"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(429933,4)" data-itemid="429933"
										data-mediaid="133550" data-itemnumber="L0501126156027">Item
										# L0501126156027</a>
								</h4>
								<div>
									<strong>Oversized Clamping Plate (width)+ recess</strong>
								</div>
								<div>L05 / 1730 / 126x156x 27</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="134" ><span _tmplitem="134"  class="stock-count" data-avail="429933"></span> In Stock, Lead Time <span _tmplitem="134"  class="lead-time" data-leadtime="429933"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="429933"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="429933" data-msrp="429933"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="429933"></span>
								</div>
								<div class="your-price1 hidden" data-price="429933">
									Your Price: <span class="your-price price-loader"
										data-price="429933"></span>
								</div>
								<div data-savepriceshowhide="429933" data-saved="429933"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="429933"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>
						<!-- 						<div
							class="row search-parts-template cart-details add-cartpopover aluminium">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(421184,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134095&amp;thumbnail=true&amp;user=48219&amp;token=b264c1767786dc8f7c037d2774f8c821f5fc18afe3fd0aecbe4705e2d94c18fd"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(421184,4)" data-itemid="421184"
										data-mediaid="134095" data-itemnumber="AFN125156">Item #
										AFN125156</a>
								</h4>
								<div>
									<strong>Aluminium Mold Base - Plastics</strong>
								</div>
								<div>AFN 125 / 156 ALU.MOULD BASE</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									 <strong _tmplitem="144" ><span _tmplitem="144"  class="stock-count" data-avail="421184"></span> In Stock, Lead Time <span _tmplitem="144"  class="lead-time" data-leadtime="421184"></span> Day(s)</strong></div>
									<strong><span class="stock-count" data-avail="421184"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="421184" data-msrp="421184"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="421184"></span>
								</div>
								<div class="your-price1 hidden" data-price="421184">
									Your Price: <span class="your-price price-loader"
										data-price="421184"></span>
								</div>
								<div data-savepriceshowhide="421184" data-saved="421184"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="421184"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click"
									style="height: 35px;">Buy Now</button>
							</div>
						</div> -->
						<div
							class="row search-parts-template cart-details add-cartpopover diameter dia2">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(425518,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133597&amp;thumbnail=true&amp;user=48219&amp;token=1da8a1ba389603f829b3669d96b903c546799a2f4f4a586cefb1c422c3aa52c1"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(425518,4)" data-itemid="425518"
										data-mediaid="133597" data-itemnumber="EX10M10">Item #
										EX10M10</a>
								</h4>
								<div>
									<strong>Ejector pin - inch</strong>
								</div>
								<div>EX 10-10" EJ PIN</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="45" ><span _tmplitem="45"  class="stock-count" data-avail="425518"></span> In Stock, Lead Time <span _tmplitem="45"  class="lead-time" data-leadtime="425518"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="425518"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="425518" data-msrp="425518"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="425518"></span>
								</div>
								<div class="your-price1 hidden" data-price="425518">
									Your Price: <span class="your-price price-loader"
										data-price="425518"></span>
								</div>
								<div data-savepriceshowhide="425518" data-saved="425518"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="425518"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>

						<div
							class="row search-parts-template cart-details add-cartpopover drilled">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(425519,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133597&amp;thumbnail=true&amp;user=48219&amp;token=1da8a1ba389603f829b3669d96b903c546799a2f4f4a586cefb1c422c3aa52c1"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(425519,4)" data-itemid="425519"
										data-mediaid="133597" data-itemnumber="EX10M10OS">Item #
										EX10M10OS</a>
								</h4>
								<div>
									<strong>Ejector pin - inch</strong>
								</div>
								<div>EX 10-10" OS EJ PIN</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="46" ><span _tmplitem="46"  class="stock-count" data-avail="425519"></span> In Stock, Lead Time <span _tmplitem="46"  class="lead-time" data-leadtime="425519"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="425519"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="425519" data-msrp="425519"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="425519"></span>
								</div>
								<div class="your-price1 hidden" data-price="425519">
									Your Price: <span class="your-price price-loader"
										data-price="425519"></span>
								</div>
								<div data-savepriceshowhide="425519" data-saved="425519"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="425519"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>

						<div
							class="row search-parts-template cart-details add-cartpopover drilled diameter dia2">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(425520,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133597&amp;thumbnail=true&amp;user=48219&amp;token=1da8a1ba389603f829b3669d96b903c546799a2f4f4a586cefb1c422c3aa52c1"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(425520,4)" data-itemid="425520"
										data-mediaid="133597" data-itemnumber="EX10M14">Item #
										EX10M14</a>
								</h4>
								<div>
									<strong>Ejector pin - inch</strong>
								</div>
								<div>EX 10-14" EJ PIN</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="47" ><span _tmplitem="47"  class="stock-count" data-avail="425520">
									   </span> In Stock, Lead Time <span _tmplitem="47"  class="lead-time" data-leadtime="425520"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="425520"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="425520" data-msrp="425520"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="425520"></span>
								</div>
								<div class="your-price1 hidden" data-price="425520">
									Your Price: <span class="your-price price-loader"
										data-price="425520"></span>
								</div>
								<div data-savepriceshowhide="425520" data-saved="425520"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="425520"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>
						<div
							class="row search-parts-template cart-details add-cartpopover diameter dia1">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(425521,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133597&amp;thumbnail=true&amp;user=48219&amp;token=1da8a1ba389603f829b3669d96b903c546799a2f4f4a586cefb1c422c3aa52c1"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(425521,4)" data-itemid="425521"
										data-mediaid="133597" data-itemnumber="EX11M10">Item #
										EX11M10</a>
								</h4>
								<div>
									<strong>Ejector pin - inch</strong>
								</div>
								<div>EX 11-10" EJ PIN</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="48" ><span _tmplitem="48"  class="stock-count" data-avail="425521"></span> In Stock, Lead Time <span _tmplitem="48"  class="lead-time" data-leadtime="425521"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="425521"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="425521" data-msrp="425521"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="425521"></span>
								</div>
								<div class="your-price1 hidden" data-price="425521">
									Your Price: <span class="your-price price-loader"
										data-price="425521"></span>
								</div>
								<div data-savepriceshowhide="425521" data-saved="425521"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="425521"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Buy Now</button>
							</div>
						</div>


						<div
							class="row search-parts-template cart-details add-cartpopover drilled diameter dia1">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<a href="javascript:void(0)" onclick="fullItemDetails(425522,4)"><img
									src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=133597&amp;thumbnail=true&amp;user=48219&amp;token=1da8a1ba389603f829b3669d96b903c546799a2f4f4a586cefb1c422c3aa52c1"></a>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
								<h4>
									<a href="javascript:void(0);"
										onclick="fullItemDetails(425522,4)" data-itemid="425522"
										data-mediaid="133597" data-itemnumber="EX11M10OS">Item #
										EX11M10OS</a>
								</h4>
								<div>
									<strong>Ejector pin - inch</strong>
								</div>
								<div>EX 11-10" OS EJ PIN</div>
								<div class="b-label">
									<div>DME - Mold Technologies EU Part</div>
									<!--  <strong _tmplitem="49" ><span _tmplitem="49"  class="stock-count" data-avail="425522"></span> In Stock, Lead Time <span _tmplitem="49"  class="lead-time" data-leadtime="425522"></span> Day(s)</strong></div> -->
									<strong><span class="stock-count" data-avail="425522"></span></strong>
								</div>
							</div>
							<div
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
								<div class="spinner-control">
									<input type="text" id="" class="total-items output"
										maxlength="3" value="1"
										style="width: 40px; text-align: center;">
									<div class="qty">
										<a href="javascript:void(0);" class="item-increment"> <i
											class="fa fa-caret-up"></i>
										</a> <a href="javascript:void(0);" class="item-decrement"> <i
											class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<span class="unit" style="left: 70px; top: 42px;">EA</span>
							</div>
							<div
								class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail"
								data-allval="" data-orgid="4">
								<div data-msrpshowhide="425522" data-msrp="425522"
									class="msrpShowHide msrpHide hidden">
									List Price: <span class="msrp-price price-loader"
										data-msrp="425522"></span>
								</div>
								<div class="your-price1 hidden" data-price="425522">
									Your Price: <span class="your-price price-loader"
										data-price="425522"></span>
								</div>
								<div data-savepriceshowhide="425522" data-saved="425522"
									class="blueColor youSaveHide savePriceShowHide hidden">
									Save: <span class="save-price price-loader" data-saved="425522"></span>
									<span>each</span>
								</div>
								<button
									class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Add To Cart</button>
								<button
									class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active disabled"
									style="height: 35px;">Buy Now</button>
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
		src="../js/jquery.nicescroll.js?version=${properties['application.version']}"></script>
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
                var partList = '${partList}';
                $(document).ready(function($){
                	$(".panel-group").children("div.panel:gt(1)").remove();
        	    	//var appliedFilter = $(".panel-group").children("div.panel:nth-child(1)").html();
        	    	var result = jQuery.parseJSON(facetListJson);
        	    	//$(".panel-group").appendTo(appliedFilter);
        	    	$("#leftPanel").tmpl(result.facetdetails).appendTo(".panel-group");
                });
        	    	
                	function sortByOption(){
                		//Populate Sort By Options
                		$("div.primary > select ").empty();
                	 	var optionList = $(".accordion-toggle:visible").text().split("\n");
                	 	$.each(optionList,function(index,item){
                	 		if(index != 0 && index!= 8){
	                	 		var option = '<option>'+item+'</option>';
	                	 		$("div.primary > select ").append(option);
                	 		}
                	 	});
                	}
                	
                	function sortByOptionChange(){
                		$(".pageLoader").fadeIn("2000");
                		var cards = $(".search-parts-template");
                		for(var i = 0; i < cards.length; i++){
                		    var target = Math.floor(Math.random() * cards.length -1) + 1;
                		    var target2 = Math.floor(Math.random() * cards.length -1) +1;
                		    cards.eq(target).before(cards.eq(target2));
                		}
                		$(".pageLoader").fadeOut("2000");
                	}
                	
                	function changeElement(){
                	 	
            	    	if($("#aluminium").is(":checked")){
            	    		$("div.row.aluminium").show();
            	    		$("div.panel.aluminium").show();
            	    		if($("#dim1").is(":checked")){
	       							$("div.row.dim1").css('display','inline-block');
  	       					}else{
  	       						$("div.row.dim1").css('display','none');
  	       					}
  		       				if($("#dim2").is(":checked")){
  		       					$("div.row.dim2").css('display','inline-block');
  		       				}else{
  		       					$("div.row.dim2").css('display','none');
  		       				}
  		       				if(!$("#dim1").is(":checked") && !$("#dim2").is(":checked")){
  		       					$("div.row.dim1").css('display','inline-block');
  		       					$("div.row.dim2").css('display','inline-block');
  		       				}
            	    	}else{
            	    		$("div.row.aluminium").css('display','none');
            	    		$("div.panel.aluminium").css('display','none');
            	    	}
            	    	if($("#blank").is(":checked")){
            	    		$("div.panel.width").css('display','block');
  		       				$("div.panel.steel").css('display','block');
  		       				$("div.row.plate").css('display','inline-block');
		       				if($("#steel1").is(":checked")){
								$("div.row.steel1").css('display','inline-block');
							}
		       				if($("#steel2").is(":checked")){
								$("div.row.steel2").css('display','inline-block');
							}
							if(!$("#steel2").is(":checked")){
								$("div.row.steel2").css('display','none');
							}
							if(!$("#steel1").is(":checked")){
								$("div.row.steel1").css('display','none');
							}
							if(!$("#steel1").is(":checked") && !$("#steel2").is(":checked")){
		       					$("div.row.steel1").css('display','inline-block');
		       					$("div.row.steel2").css('display','inline-block');
		       				}
							if($("#width1").is(":checked")){
								$("div.row.width1").css('display','inline-block');
							}
							if($("#width2").is(":checked")){
								$("div.row.width2").css('display','inline-block');
							}
							if($("#width3").is(":checked")){
								$("div.row.width3").css('display','inline-block');
							}
            	    	}else{
            	    		$("div.row.plate").css('display','none');
  	       				//	$("div.panel.width").css('display','none');
  	                        $("div.panel.steel").css('display','none');
            	    	}
            	    	if($("#drilled").is(":checked")){
            	    			$("div.panel.series").css('display','block');
		       				//	$("div.panel.width").show();
			       				$("div.panel.steel").css('display','block');
		       					$("div.row.drilled").css('display','inline-block');
		       					if($("#steel1").is(":checked")){
									$("div.row.steel1").css('display','inline-block');
								}
			       				if($("#steel2").is(":checked")){
									$("div.row.steel2").css('display','inline-block');
								}
								if(!$("#steel2").is(":checked")){
									$("div.row.steel2").css('display','none');
								}
								if(!$("#steel1").is(":checked")){
									$("div.row.steel1").css('display','none');
								}
								if($("#model1").is(":checked")){
									$("div.row.model1").css('display','inline-block');
								} 
								if($("#model2").is(":checked")){
									$("div.row.model1").css('display','inline-block');
								}
								if(!$("#model1").is(":checked")){
									$("div.row.model1").css('display','none');
								} 
								if(!$("#model2").is(":checked")){
									$("div.row.model1").css('display','none');
								}
								if(!$("#model1").is(":checked") && !$("#model2").is(":checked")){
			       					$("div.row.model1").css('display','inline-block');
			       					$("div.row.model2").css('display','inline-block');
			       				}
								if($("#dia2").is(":checked")){
									$("div.row.dia2").css('display','inline-block');
								}
								if($("#dia1").is(":checked")){
									$("div.row.dia1").css('display','inline-block');
								}
								if(!$("#dia2").is(":checked")){
									$("div.row.dia2").css('display','none');
								}
								if(!$("#dia1").is(":checked")){
									$("div.row.dia1").css('display','none');
								} 
								if(!$("#dia2").is(":checked") && !$("#dia1").is(":checked")){
									$("div.row.diameter").css('display','inline-block');
								} 
		       					
            	    	}else{
  	       					//$("div.panel.width").css('display','none');
  		       				$("div.panel.steel").css('display','none');
  		       				$("div.row.drilled , div.row.diameter").css('display','none');
            	    	}
            	    	if($("#dia2").is(":checked")){
								$("div.row.dia2").css('display','inline-block');
							}
						if($("#dia1").is(":checked")){
								$("div.row.dia1").css('display','inline-block');
						}
						if($("#model1").is(":checked")){
								$("div.row.model1").css('display','inline-block');
						} 
						if($("#model2").is(":checked")){
								$("div.row.model1").css('display','inline-block');
							}
						if($("#steel1").is(":checked")){
									$("div.row.steel1").css('display','inline-block');
								}
			       			if($("#steel2").is(":checked")){
									$("div.row.steel2").css('display','inline-block');
								}
			       			if($("#width1").is(":checked")){
								$("div.row.width1").css('display','inline-block');
							}
							if($("#width2").is(":checked")){
								$("div.row.width2").css('display','inline-block');
							}
							if($("#width3").is(":checked")){
								$("div.row.width3").css('display','inline-block');
							}
							if($("#dim1").is(":checked")){
       							$("div.row.dim1").css('display','inline-block');
	       					}
		       				if($("#dim2").is(":checked")){
		       					$("div.row.dim2").css('display','inline-block');
		       				}
            	    	if(!$("#drilled").is(":checked") && !$("#aluminium").is(":checked") && !$("#blank").is(":checked") && !$("#dim1").is(":checked") && !$("#dim2").is(":checked")
            	    		&&	!$("#dia1").is(":checked") && !$("#dia2").is(":checked") && !$("#model1").is(":checked") && !$("#model2").is(":checked")
            	    		&& !$("#steel1").is(":checked") && !$("#steel2").is(":checked")
            	    		&& !$("#width1").is(":checked") && !$("#width2").is(":checked") && !$("#width3").is(":checked") && !$("#steel1").is(":checked") && !$("#steel2").is(":checked")
            	    	
            	    	){
	       					$("div.row.plate").css('display','inline-block');
	       					$("div.row.diameter").css('display','inline-block');
	       					$("div.row.aluminium").css('display','inline-block');
	       					$("div.row.drilled").css('display','inline-block');
	       					$(".panel").css('display','block');
	       				}
            	    	
						$(".ItemCountDisp > p > span").text($(".result-container").find("div.row:visible").length);
						sortByOption();
						$(".pageLoader").fadeOut("slow");
                	}
                	
                    $(document).ready(function($) {
                    	 // $("#facetfilter").niceScroll();
                    	 	sortByOption();
                    	 	$(".primary > select").change(function(){ sortByOptionChange(); })
                         	 // Grid and List View
                             $('.gridView').click(function() {
                                 $('.search-parts-template').addClass('GridsDisplay');
                                 $('.showList').css('display','none');
                             });
                             $('.listView').click(function() {
                                 $('.search-parts-template').removeClass('GridsDisplay');
                                 $('.showList').css('display','block');
                             });
                         
                        //facets Accordian
                        function toggleChevron(e) {
                            $(e.target)
                                .prev('.panel-heading')
                                .find("span.glyphicon")
                                .toggleClass('glyphicon-chevron-right glyphicon-chevron-down');
                        }
                        $('#accordion').on('hidden.bs.collapse', toggleChevron);
                        $('#accordion').on('shown.bs.collapse', toggleChevron);

                        // View More in Facet Panel

                        $('.moreFacets').click(function() {
                            $('.filterBody ul').removeClass('scroll');
                            $(this).siblings('.filterBody ul').addClass('scroll');
                        });
                        //keep the accordians open

						$('#deleteAll').click(function(){
							$(this).parent('div').siblings('ul').fadeOut('slow');
							$(this).css('display','none');
							$('#custom-search-input').css('width','100%');
						});
                        
                        $('.filterBody ul li a').find('span.glyphicon-remove').click(function(){
                        	$(this).parents('li').fadeOut();
                        	
                        });
                        var check = false;
                        var ele = false;
                        $('.filterBody ul li').click(function(e){
                        	$(".pageLoader").show();
                        	if($(this).children().length != 0){
                	    	  if($(this).find('input[type=checkbox]').prop("checked") == true){
                	    		  $(this).find('input[type=checkbox]').prop( "checked", false );
                	    	  }else{
                	    		  $(this).find('input[type=checkbox]').prop( "checked", true );
                	    		  check = true;
                	    	  }
                        	}
                        	
                        	changeElement();
                        });
                        $('.filterBody ul li input').click(function(e){
                        	$(".pageLoader").show();
                        	if($(this).is(":checked")){
                        		$(this).prop( "checked", false );
                        	}else{
                        		$(this).prop( "checked", true );
                        	}
                        });
                        
                        // Applied Filters Section Element Population
                        $('#prodCategory,.width,.steel,.diameter,.aluminium,.series').find('ul li').click(function(){
                        	
                        	  if($(this).find('input[type=checkbox]').prop("checked") == true){
                        			var ele = $(this).text();
                                	$('#category').find('ul').append('<li>'+ele+'<span class="glyphicon glyphicon-remove removClass" ></li>');
                        	  }
                        	  
                        	  var seen = {};
                        	  $('#category').find('ul li').each(function() {
                        	      var txt = $(this).html();
                        	      if (seen[txt])
                        	          $(this).remove();
                        	      else
                        	          seen[txt] = true;
                        	  });
                        
                        	
                        })
                        
                        $(document).on('click','span.glyphicon-remove',function(){
                        	var x = $(".filterBody > ul").find('li:contains('+$(this).parents('li').text()+')');
                        	x.children().trigger('click');
                        	$(this).parents('li').remove();
                        });
                       
                        
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
                   
               // // slider call

               $('#slider').slider({
               	range: true,
               	step:0.1,
               	min: 0.1,
               	max: 5.0,
               	values: [ 1.5, 4.3 ],
               	
               	slide: function(event, ui) {
               		
               		$('.ui-slider-handle:eq(0) .price-range-min').html( ui.values[ 0 ].toFixed(1) );
               		$('.ui-slider-handle:eq(1) .price-range-max').html(ui.values[ 1 ].toFixed(1) );
               		$('.price-range-both').html( ui.values[ 0 ].toFixed(1)  + ' - ' + ui.values[ 1 ].toFixed(1)  );
               		
               		//
               		console.log("Min:"+ui.values[0]);
               		if(ui.values[0] > 1.5 && ui.values[0] < 4){
               			$('.width1,.width2,.diameter').css('display','none');
               		}else{
               			$('.width1,.width2,.diameter').css('display','block');
               		}
               		
               		
                   if ( ui.values[0] == ui.values[1] ) {
                     $('.price-range-both i').css('display', 'none');
                   } else {
                     $('.price-range-both i').css('display', 'inline');
                   }
                       
                       //
               		
               		if (collision($('.price-range-min'), $('.price-range-max')) == true) {
               			
               			$('.price-range-min, .price-range-max').css('opacity', '0');	
               			$('.price-range-both').css('display', 'block');		
               		} else {
               		
               			$('.price-range-min, .price-range-max').css('opacity', '1');	
               			$('.price-range-both').css('display', 'none');		
               			//$('.width1,.width2').css('display','block');
               		}
               	},
               	stop: function(event, ui) {
               		$(".ItemCountDisp > p > span").text($(".result-container").find("div.row:visible").length);
               		$(".panel:first").find("div.filterBody").find("ul").find("li:contains(Thickness)").remove();
               		$('#category').find('ul').append('<li>Thickness:'+ui.values[0]+'--'+ui.values[1]+'<span class="glyphicon glyphicon-remove removClass" ></li>');	               	
               	} 
               });

               $('.ui-slider-range').append('<span class="price-range-both value">' + $('#slider').slider('values', 0 ) + ' - ' + $('#slider').slider('values', 1 ) + '</span>');

               $('.ui-slider-handle:eq(0)').append('<span class="price-range-min value">' + $('#slider').slider('values', 0 ) + '</span>');

               $('.ui-slider-handle:eq(1)').append('<span class="price-range-max value">' + $('#slider').slider('values', 1 ) + '</span>');
               	     
               	     /* EO Thickness Slider */
               	      

                        
                        
                    });
                </script>

	<script id="productCatalogTemplate" type="text/x-jquery-tmpl">
                    <div class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
                        <div class="product-info" data-id="${'${'}id}" data-pcatalog="${'${'}pcatalogId}" data-parent="${'${'}parent}" data-cataloglink="${'${'}catalogDocumentLink}" data-hasparts="${'${'}children}" data-catalogId="${'${'}pcatalogId}">
                            {{if mediaId!=0}}
                            <a href="javascript:void(0);" class="productCatalogClick"><span class="helper"></span><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"></a>
                            <a href="#" class="productCatalogClick" title="${'${'}text}">${'${'}text}</a> {{else}}
                            <a href="javascript:void(0);" class="no-image productCatalogClick">${'${'}text}</a> {{/if}}
                        </div>
                    </div>
                </script>
	<script id="productItemTemplate" type="text/x-jquery-tmpl">

                    <div class="row search-parts-template cart-details add-cartpopover">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            {{if mediaId!=0}}
                            <a href="javascript:void(0)" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}">
                            </a>
                            {{else}}
                            <a href="javascript:void(0);" class="no-image" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})">${'${'}commercialDescription}</a> {{/if}}
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
                            <h4><a href="javascript:void(0);" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})" data-itemId="${'${'}itemId}" data-mediaId="${'${'}mediaId}" data-itemNumber="${'${'}itemNumber}"><spring:message code="label.item.shop"/> # ${'${'}itemNumber}</a></h4>

                            <div><strong>${'${'}commercialDescription}</strong>
                            </div>
                            <sec:authorize access="hasRole('ROLE_ENGG_DESC')">
                                <div>${'${'}engineeringDescription}</div>
                            </sec:authorize>
                            <div class="b-label">
                                <div>${'${'}organizationName}
                                    <spring:message code="search.part" />
                                </div>
                                <!--  <strong><span class="stock-count" data-avail="${'${'}itemId}"></span> <spring:message code="label.promotion.instock"/>, <spring:message code="label.promotion.leadtime"/> <span class="lead-time" data-leadtime="${'${'}itemId}"></span> Day(s)</strong></div> -->
                                <strong><span class="stock-count" data-avail="${'${'}itemId}"></span></strong>
                            </div>

                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding quantity-change">
                            <div class="spinner-control">
                                <input type="text" id="${'${'}partId}" class="total-items output" maxlength="3" value="1" style="width:40px;text-align:center;">
                                <div class="qty">
                                    <a href="javascript:void(0);" class="item-increment">
                                        <i class="fa fa-caret-up"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="item-decrement">
                                        <i class="fa fa-caret-down"></i>
                                    </a>
                                </div>
                            </div>
                            <span class="unit" style="left:70px;top:42px;">${'${'}uom}</span>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail" data-allVal="" data-orgId="${'${'}organizationId}">

                            <div data-msrpShowHide="${'${'}itemId}" data-msrp="${'${'}itemId}" class="msrpShowHide msrpHide hidden">
                                <spring:message code="label.msrp" />: <span class="msrp-price price-loader" data-msrp="${'${'}itemId}"></span>
                            </div>
                            <div class="your-price1 hidden" data-price="${'${'}itemId}">
                                <spring:message code="label.your.price" />: <span class="your-price price-loader" data-price="${'${'}itemId}"></span>
                            </div>
                            <div data-savePriceShowHide="${'${'}itemId}" data-saved="${'${'}itemId}" class="blueColor youSaveHide savePriceShowHide hidden">
                                <spring:message code="label.save" />: <span class="save-price price-loader" data-saved="${'${'}itemId}"></span> <span><spring:message code="lable.item.each" /></span>
                            </div>


                            <sec:authorize access="hasRole('ROLE_CART')">

                                {{if isOrderable && !priceNotShown}}
                                <button class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart" style="height:35px;">
                                    <spring:message code="quick.search.addtocart" />
                                </button>
                                <sec:authorize access="hasRole('ROLE_ORDER')">
                                    {{if canPlaceOrderPOCC}}
                                    <button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click" style="height:35px;">
                                        <spring:message code="label.buynow" />
                                    </button>
                                    {{else}}
                                    <button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;">
                                        <spring:message code="label.buynow" />
                                    </button>
                                    {{/if}}
                                </sec:authorize>
                                <sec:authorize access="!hasRole('ROLE_ORDER')">
                                    <button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;">
                                        <spring:message code="label.buynow" />
                                    </button>
                                </sec:authorize>

                                {{else}}
                                <button class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;">
                                    <spring:message code="quick.search.addtocart" />
                                </button>
                                <button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;">
                                    <spring:message code="label.buynow" />
                                </button>
                                {{/if}}

                            </sec:authorize>
                        </div>

                    </div>
                </script>
	<script type="text/javascript">
                
              
                
                
                    var prodCatalogId, prodCategoryId;
                    var paginationCount;
                    var startPoint = 1;
                    var levelCount = 0;
                    var foundClickedItem = false;
                    var counter = 0;
                    var arr1 = [];
                    var arr2 = [];
                    var userid, authtoken;
                    var isSearch = false;
                    var isQuoteOrder = false;

                    //Removed function for loading issue
                    userid = $('#userId').val();
                    authtoken = $('#authToken').val();
                    $('#callingLocation').val('shopforparts');
                    $("#main-menu-list > li:nth-child(2)").addClass("active");

                    var nodeId = '${productCategoryMappingId}';
                    $('#productCategoryMappingId').val(nodeId);

                    var searchflag = 'false';
                    var searchVariable = '${searchflag}';
                    if (null != searchVariable && searchVariable != "") {
                        searchflag = '${searchflag}';
                    }
                    if (searchflag == 'true') {
                        var searchString = '${searchString}';
                        var searchType = '${searchType}';
                        $('#callingLocation').val('');

                        $('#keyword').val(searchString);
                        $('#typedropdown').val(searchType);
                        $('#issearch').val(searchflag);
                        $('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value=' + $("#typedropdown").val() + ']').text());
                    }
                    initilizeTreeCtrl();
                    /*$('#treeShopforParts.treeview-hldr').on('ready.jstree',function(e,data){
			console.log("Test My jstree Node :"+$('#treeShopforParts.treeview-hldr').jstree(true).is_loaded("1_182"));
		});*/
                    // A $( document ).ready() block.
                    $(document).ready(function() {
                    	
                    	
                    	
                    	
                        //$('#treeShopforParts').jstree(true).hide_icons(false);

                        var searchflag = 'false';
                        var searchVariable = '${searchflag}';
                        var breadCrumFullItem = '${productCategoryMappingId}';
                        if (null != searchVariable && searchVariable != "") {
                            searchflag = '${searchflag}';
                        }

                        if (searchflag == 'true') {

                            var searchString = '${searchString}';
                            var searchType = '${searchType}';
                            $('#callingLocation').val('');

                            $('#keyword').val(searchString);
                            $('#typedropdown').val(searchType);
                            $('#issearch').val(searchflag);
                            $('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value=' + $("#typedropdown").val() + ']').text());

                        }

                        if (!searchflag) {
                            /*	$(".breadcrumb").append('<li><a href='+$("#main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#main-menu-list >li:nth-child(1)").text()+'</a></li>');
				$(".breadcrumb").append('<li class="active"><a href='+$("#main-menu-list > li.active a").attr('href')+'>'+$("#main-menu-list > li.active a").text()+'</a></li>');*/
                        }
                    });

                    // decrease the quantity
                    $(document).delegate('.minus-click', 'click', function() {
                        var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
                        var cartItemId = $(this).parents('.spinner-control').attr('id');
                        var partId = $(this).parents('.spinner-control').children('.total-items').attr('id');
                        if (itemVal > 0) {
                            QuantityChange(itemVal, cartItemId, partId);
                        } else {
                            var msg = "<spring:message code='alert.shopforparts.valid.qty' javaScriptEscape='true'/>";
                            $('.modal-body').text(msg)
                            $("#myModal").show();
                            $('.total-items.qty-change').val(1);
                            //	QuantityChange(1, cartItemId, partId);
                        }
                    });
                    var pageNumber = 1
                    var counter = 1;
                    var pageSize = 12;
                    var totalItems;

                    //Created to call the breadcrum from F.I.Details
                    $("#treeShopforParts").bind("loaded.jstree", function(evt, data) {
                        var breadCrumFullItem = '${productCategoryMappingId}';
                        if (null != breadCrumFullItem) {
                            //alert("Callign breadCrumFullItem")
                            //breadCrumFullItem=breadCrumFullItem+"_anchor";
                            var productCategoryId = breadCrumFullItem.toString().split("_")[1];
                            var productCatalogId = breadCrumFullItem.toString().split("_")[0];

                            jstreeBreadCrumb(breadCrumFullItem);

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
                                $("#treeShopforParts.treeview-hldr").jstree(true).deselect_all();
                                $("#treeShopforParts.treeview-hldr").jstree(true).select_node(id);
                            });

                    function searchFilterPart() {
                        var isAbleToSubmit = validateGlobalCheck();
                        if (!isAbleToSubmit) {
                            prepareQuery();
                        }
                    }

                    function prepareQuery() {
                        mainArr = prepareDynamicQuery();
                        var filterValue = JSON.parse(mainArr);
                        console.log(filterValue);
                        if (filterValue['isSuccess'] == true) {
                            pageNumber = 1;
                            counter = 1;
                            getItemsForCategory(prodCategoryId, prodCatalogId, pageNumber, mainArr);
                            pageNumber++;
                            counter++;
                        }
                    }

                    function resetFilter() {
                            renderJson(searchJson);
                            prepareQuery();
                        }
                        // get items for category
                    function getItemsForCategory(productCategoryId, productCatalogId, pageNumber, filterJson) {
                        prodCatalogId = productCatalogId;
                        prodCategoryId = productCategoryId;
                        var resultPerPage = pageSize; //$('#result-per-page').val();
                        var sortBy = $('#sort-by').val();
                        if (pageNumber === 1 || sortChange) {
                            $('.pageLoader').show();
                        }
                        $.ajax({
                            type: "Get",
                            data: {
                                productCategoryId: productCategoryId,
                                productCatalogId: productCatalogId,
                                resultPerPage: resultPerPage,
                                pageNumber: pageNumber,
                                sortBy: sortBy,
                                filterJson: filterJson
                            },
                            contentType: 'application/json',
                            mimeType: 'application/json',
                            url: "getitemsforcategory",
                            success: function(response) {
                                console.log(response);

                                var filterValue = JSON.parse(filterJson);
                                console.log(filterValue);

                                if (filterValue['isFilterRequired'] == true) {
                                    renderFilter(response.advancefilters);
                                }



                                if (pageNumber === 1) {
                                    $("#product-catalog-hldr").html('');
                                }

                                $("#productItemTemplate").tmpl(response.itemDetails)
                                    .appendTo("#product-catalog-hldr");

                                $("#product-catalog-hldr").prepend($('div.searchPreferences'));


                                //Bing Increment click Event
                                $('.item-increment').on('click', function() {
                                    var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
                                    if (parseInt(itemVal) >= 999) {
                                        $(this).parents('.spinner-control').children('.total-items').val("999");
                                        return false;
                                    }
                                });
                                //Bing Keypress Event
                                $('.total-items.output').on('keypress', function(e) {
                                    var maxThree = /^\d{3}$/;
                                    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                                        return false;
                                    }
                                    if (maxThree.test($(this).val())) {
                                        e.preventDefault();
                                    }
                                });
                                $("#resultCount").text(response.itemDetails.length);
                                $("#resultInfo").show();
                                $("#pagination").show();

                                if (filterValue['isFromSearch'] == true) {
                                    $('#allResult').text(response.totalItemCount);
                                }

                                totalItems = parseInt($('#allResult').text());
                                if (filterValue['isFromSearch'] == true && totalItems == 0) {
                                    $('#product-catalog-hldr').append('<p class="errorText"><spring:message code="message.noPart.filter" javaScriptEscape="true"/></p>');
                                } else if (totalItems == 0) {
                                    $('#product-catalog-hldr').append('<p class="errorText"><spring:message code="message.noPart" javaScriptEscape="true"/></p>');

                                }
                                ///////////////
                                if (filterValue['isFilterRequired'] == true) {
                                    filterValue["isFromSearch"] = false;
                                    mainArr = JSON.stringify(filterValue);

                                }
                                ///////////////////////


                                if (sortChange || filterValue['isFromSearch'] == true) {
                                    sortChange = false;
                                    $('#sort-by').prop('disabled', false);
                                } else {
                                    counter++;
                                }


                                paginationCount = getPaginationCount(resultPerPage, response.totalItemCount);


                                resetPagination(startPoint + 4);
                                startPoint = 1;

                                // enabled or disabled first/previous/next/last
                                if (pageNumber == 1) {
                                    $('.paginate_button.first').addClass('disabled');
                                    $('.paginate_button.previous').addClass('disabled');

                                    $('.paginate_button.next').removeClass('disabled');
                                    $('.paginate_button.last').removeClass('disabled');
                                } else {

                                    $('.paginate_button.first').removeClass('disabled');
                                    $('.paginate_button.previous').removeClass('disabled');
                                    if (pageNumber == paginationCount) {
                                        $('.paginate_button.next').addClass('disabled');
                                        $('.paginate_button.last').addClass('disabled');
                                    } else {
                                        $('.paginate_button.next').removeClass('disabled');
                                        $('.paginate_button.last').removeClass('disabled');
                                    }

                                    if (pageNumber > 5) {
                                        var val = pageNumber - 5;
                                        startPoint = startPoint + val;

                                    }

                                }

                                setpaginationCount(paginationCount, startPoint);

                                if (paginationCount == 1) {
                                    $('.paginate_button.next').addClass('disabled');
                                    $('.paginate_button.last').addClass('disabled');
                                }
                                $('.page1').addClass('active');

                                // active clicked button and inactive previous active button
                                $('.paginate_button.active').removeClass('active');
                                $('.page' + pageNumber + '').addClass('active');

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
                                    if (obj.priceNotShown == true) {
                                        $("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
                                    }
                                    items.push(partVo);
                                });
                                partVoList['partVoList'] = items;
                                if (response.itemDetails.length > 0) {
                                    $("#pagination").show();
                                    //getPriceForItems(partVoList,organizationId); 
                                } else {
                                    $("#pagination").hide();

                                }
                                $('div.lazyLoader').addClass('hidden');
                                if ($('.pageLoader').is(':visible')) {
                                    $('.pageLoader').hide();
                                }

                            },
                            error: function(e) {
                                $('.pageLoader').hide();
                                $('div.lazyLoader').addClass('hidden');
                            }
                        });
                    }



                    // recursive function call for Setting BreadCrumbs  
                    function getClickedCategoryForBreadCrumb(clickedJsonObj, productCategoryId) {
                        var temp = 0;

                        for (var key in clickedJsonObj) {
                            if (foundClickedItem) {
                                break;
                            }
                            if (typeof clickedJsonObj[key].children != 'undefined') {
                                if (clickedJsonObj[key].children.length == 1) {
                                    levelCount++;
                                    counter = 0;
                                }
                                if (clickedJsonObj[key].children.length > 1) {
                                    if (typeof clickedJsonObj[key].children[clickedJsonObj[key].children.length - 1].children == 'undefined') {
                                        arr1.push(clickedJsonObj[key].children[clickedJsonObj[key].children.length - 1].text);
                                    } else {
                                        arr2.push(clickedJsonObj[key].immediateParent);
                                        temp = 1;
                                    }
                                }
                            }

                            for (var i = 0; i < arr2.length; i++) {
                                if (clickedJsonObj[key].immediateParent == arr2[i] && temp == 0) {
                                    $('.breadcrumb li:last-child').remove();
                                }
                            }
                            temp = 0;

                            var val = clickedJsonObj[key].children;

                            if (clickedJsonObj.hasOwnProperty(key) && clickedJsonObj[key].productCatalogId == productCategoryId) {
                                $(".breadcrumb").append('<li class="active">' + clickedJsonObj[key].text + '</li>');
                                foundClickedItem = true;
                                break;
                            } else {
                                for (var i = 0; i < arr1.length; i++) {
                                    if (clickedJsonObj[key].text == arr1[i]) {
                                        $('.breadcrumb li:last-child').remove();
                                    }
                                }

                                if (typeof val != "undefined" && val.length > 0) {
                                    $(".breadcrumb").append('<li><a href="javascript:void(0);" onclick="clickonBreadCrumb(' + clickedJsonObj[key].pcatalogId + ',' + clickedJsonObj[key].productCatalogId + ',' + clickedJsonObj[key].children + ',this); return false;">' + clickedJsonObj[key].text + '</a></li>');
                                    getClickedCategoryForBreadCrumb(clickedJsonObj[key].children,
                                        productCategoryId);
                                } else {
                                    for (var j = 0; j < levelCount; j++) {
                                        $('.breadcrumb li:last-child').remove();
                                    }
                                    levelCount = 0;
                                }
                            }

                        }
                    }




                    // Call on BreadCrumb click
                    function clickonBreadCrumb(productCatalogId, productCategoryId, hasParts, lastClickedText) {
                        console.log("Coming...." + productCatalogId + "::::" + productCategoryId + ":::::::" + hasParts + ":::::" + lastClickedText.text);
                        var removeBreadCrumbs = 1;
                        $(".breadcrumb > li").each(function() {
                            if (removeBreadCrumbs == 0) {
                                $(this).remove();
                            }

                            if ($(this).text() == lastClickedText.text) {
                                $(this).children().css('textDecoration', 'none');
                                removeBreadCrumbs = 0;
                            }

                        });

                        var myTreeDataString = '${productCatalogTreeData}';

                        myTreeData = JSON.parse(myTreeDataString);

                        $("#headerName").text(lastClickedText.text);
                        // for catalog click
                        if (typeof productCatalogId == "undefined" && typeof hasParts == "undefined") {
                            // get only catalog details from json tree structure 
                            var productCatalogs = [];
                            var productCatalogList = {};
                            for (var key in myTreeData) {
                                if (myTreeData.hasOwnProperty(key) && myTreeData[key].productCatalogId == productCategoryId) {
                                    latestJsonObj = myTreeData[key].children;
                                    var clickedJsonObj = myTreeData[key].children;

                                    var productCategory = [];
                                    var productCategoryList = {};
                                    for (var key in clickedJsonObj) {
                                        if (clickedJsonObj.hasOwnProperty(key)) {
                                            productCategory
                                                .push({
                                                    "productCatalogId": clickedJsonObj[key].productCatalogId,
                                                    "hasParts": clickedJsonObj[key].children,
                                                    "description": clickedJsonObj[key].description,
                                                    "catalogDocumentLink": clickedJsonObj[key].catalogDocumentLink,
                                                    "text": clickedJsonObj[key].text,
                                                    "mediaId": clickedJsonObj[key].mediaId,
                                                    "children": clickedJsonObj[key].children,
                                                    "pcatalogId": clickedJsonObj[key].pcatalogId
                                                });

                                            if (typeof clickedJsonObj[key].catalogDocumentLink == "undefined" || clickedJsonObj[key].catalogDocumentLink == "") {
                                                $("#catalog-page").hide();
                                            } else {
                                                $("#catalog-page").show();
                                                $("#catalog-page > a").attr("href", clickedJsonObj[key].catalogDocumentLink);
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
                                pageNumber = 1;
                                counter = 1;
                                getItemsForCategory(productCategoryId, productCatalogId, pageNumber);
                                pageNumber++;
                            }
                            // click on category which contains subcategory
                            else {
                                var productCatalogs = [];
                                var productCatalogList = {};
                                for (var key in myTreeData) {
                                    if (myTreeData.hasOwnProperty(key) && myTreeData[key].productCatalogId == productCatalogId) {
                                        var childrenJson = myTreeData[key].children;
                                        getClickedCategory(childrenJson, productCategoryId);

                                    }
                                }
                            }
                        }
                    }

                    // recursive function call for getting sub-category of clicked  
                    function getClickedCategory(clickedJsonObj, productCategoryId) {
                        for (var key in clickedJsonObj) {
                            var val = clickedJsonObj[key].children;
                            if (clickedJsonObj.hasOwnProperty(key) && clickedJsonObj[key].productCatalogId == productCategoryId) {
                                latestJsonObj = clickedJsonObj[key].children;
                                var clickedJsonObj1 = clickedJsonObj[key].children;
                                var productCategory = [];
                                var productCategoryList = {};
                                for (var key in clickedJsonObj1) {
                                    if (clickedJsonObj1.hasOwnProperty(key)) {
                                        productCategory
                                            .push({
                                                "productCatalogId": clickedJsonObj1[key].productCatalogId,
                                                "hasParts": clickedJsonObj1[key].children,
                                                "description": clickedJsonObj1[key].description,
                                                "catalogDocumentLink": clickedJsonObj[key].catalogDocumentLink,
                                                "text": clickedJsonObj1[key].text,
                                                "mediaId": clickedJsonObj1[key].mediaId,
                                                "children": clickedJsonObj1[key].children,
                                                "pcatalogId": clickedJsonObj1[key].pcatalogId
                                            });

                                        if (typeof clickedJsonObj[key].catalogDocumentLink == "undefined" || clickedJsonObj[key].catalogDocumentLink == "") {
                                            $("#catalog-page").hide();
                                        } else {
                                            $("#catalog-page").show();
                                            $("#catalog-page > a").attr("href", clickedJsonObj[key].catalogDocumentLink);
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
                            var img = $(this).parents(".search-parts-template").children("div:first-child").html();
                            var partId = $(this).parent().siblings('.cart-item-info')
                                .find('a').attr('data-itemId');

                            var mediaId = $(this).parent().siblings('.cart-item-info')
                                .find('a').attr('data-mediaId');
                            var quantity = $(this).parent()
                                .siblings('.quantity-change').find('.total-items')
                                .val();
                            var organizationId = $(this).parent().attr('data-orgId');
                            var itemNumber = $(this).parent().siblings('.cart-item-info')
                                .find('a').attr('data-itemNumber');



                            var dataItemVal = null;

                            //dataItemVal=$(this).parent().data('allval');

                            console.log(dataItemVal);
                            $.ajax({
                                type: "POST",
                                data: {
                                    partId: partId,
                                    mediaId: mediaId,
                                    quantity: quantity,
                                    organizationId: organizationId,
                                    dataItemVal: JSON.stringify(dataItemVal)
                                },
                                url: "addtocart",
                                success: function(response) {
                                    console.log('shop' + response);
                                    getShoppingCartCount();
                                    if (response == '') {
                                        /* alert("Part is not added...") */
                                        $('div.pageLoader').hide();
                                        $("body").css("overflow", "auto");
                                        $(".cart-popover").css({
                                            "opacity": 1
                                        });
                                        $(".cart-popover").show().stop().fadeOut(5000);
                                        /*$(".close-popup").delegate("click",function(){
									$(this).parents(".cart-popover").fadeout("fast");
								})*/
                                        $(".cart-popover").find(".cart-popover-img").html(img).children().css({
                                            "height": "100px",
                                            "margin-top": "0"
                                        }).prop("onclick", null).hover(function() {
                                            $(this).css("text-decoration", "none");
                                        });
                                        $(".cart-popover").find(".cart-popover-title").text("<spring:message code='quick.search.item' javaScriptEscape='true'/> " + itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
                                    } else {
                                        var jsonResponse = JSON.parse(response);

                                        if (typeof jsonResponse.errorMessage == "undefined") {
                                            $('div.pageLoader').hide();
                                            $("body").css("overflow", "auto");
                                            $(".cart-popover").css({
                                                "opacity": 1
                                            });
                                            $(".cart-popover").show().stop().fadeOut(5000);
                                            /*$(".close-popup").delegate("click",function(){
										$(this).parents(".cart-popover").fadeout("fast");
									})*/
                                            $(".cart-popover").find(".cart-popover-img").children().attr("src", '${properties['
                                                docserver.url ']}?media=' + mediaId + '&thumbnail=true&user=' + userid + '&token=' + authtoken);
                                          	//NREV-1511 fix starts
											if(jsonResponse.isActualImage == false){
												$(".waterMarkForCartPopOver").show();
											}
											//NREV-1511 fix ends
                                            $(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" + ":" + itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
                                        } else {
                                            $('div.pageLoader').hide();
                                            $("body").css("overflow", "auto");
                                            $('.modal-body').text(jsonResponse.errorMessage);
                                            $("#myModal").show();
                                        }
                                        /* alert("Part is added to your cart..."); */
                                    }

                                },
                                error: function(e) {
                                    $('div.pageLoader').hide();
                                }
                            });
                            /*$(".close-popup").on("click",function(){
									$(this).parents(".cart-popover").hide();
								});*/
                        });

                    function getPriceForItems(items, organizationId) {
                      /*   var locale = $ {
                            locale
                        }; */

                        $.ajax({
                            type: "Get",
                            data: {
                                items: JSON.stringify(items),
                                organizationId: organizationId
                            },
                            contentType: 'application/json',
                            mimeType: 'application/json',
                            url: "getcategoryPartPrice",
                            success: function(response) {
                              /*   var locale = $ {
                                    locale
                                }; */
                                console.log(response);
                                var partItemListPriceAvail = response.partItemVOList;
                                for (var i = 0; i < partItemListPriceAvail.length; i++) {

                                    if (partItemListPriceAvail[i].priceNotShown == true) {
                                        $("span.msrpShowHide").text("contact customer service").removeClass('price-loader');
                                        $("div.your-price, div.savePriceShowHide").hide();
                                        $("div.savePriceShowHide span.save-price").siblings("span").text("");
                                        $("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
                                        var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
                                        $("div.cart-item-info .stock-count").text(inventoryMsg); //set inventory Message text
                                    } else {

                                        if (partItemListPriceAvail[i].msrpStr != "-1") {
                                            $("div.erp-price-avail .msrpShowHide[data-msrpShowHide='" + partItemListPriceAvail[i].partId + "']").show();
                                            $("div.erp-price-avail .msrp-price[data-msrp='" + partItemListPriceAvail[i].partId + "']").text(partItemListPriceAvail[i].msrpStr + " " + (typeof partItemListPriceAvail[i].currencyCode == "undefined" ? "" : partItemListPriceAvail[i].currencyCode)).removeClass('price-loader'); //set MSRP
                                        } else {
                                            $("div.erp-price-avail .msrpShowHide[data-msrpShowHide='" + partItemListPriceAvail[i].partId + "']").hide();
                                        }

                                        if (partItemListPriceAvail[i].priceStr != "-1") {
                                            $("div.erp-price-avail .your-price1[data-price='" + partItemListPriceAvail[i].partId + "']").show();
                                            $("div.erp-price-avail .your-price[data-price='" + partItemListPriceAvail[i].partId + "']").text(partItemListPriceAvail[i].priceStr + " " + (typeof partItemListPriceAvail[i].currencyCode == "undefined" ? "" : partItemListPriceAvail[i].currencyCode)).removeClass('price-loader'); //set price
                                        } else {
                                            $("div.erp-price-avail .your-price1[data-price='" + partItemListPriceAvail[i].partId + "']").hide();
                                        }

                                        if (partItemListPriceAvail[i].savedPriceStr != "-1") {
                                            $("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='" + partItemListPriceAvail[i].partId + "']").show();
                                            $("div.erp-price-avail .save-price[data-saved='" + partItemListPriceAvail[i].partId + "']").text(partItemListPriceAvail[i].savedPriceStr + " " + (typeof partItemListPriceAvail[i].currencyCode == "undefined" ? "" : partItemListPriceAvail[i].currencyCode)).removeClass('price-loader'); //set saved price
                                        } else {
                                            $("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='" + partItemListPriceAvail[i].partId + "']").hide();
                                        }

                                        //$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);
                                        $(".msrpShowHide[data-msrpShowHide='" + partItemListPriceAvail[i].partId + "']").parent(".erp-price-avail").data('allval', partItemListPriceAvail[i]);
                                        console.log(partItemListPriceAvail[i]);
                                        /* $("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);//set inventory Message text
						
							if(partItemListPriceAvail[i].msrp!=undefined){
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								// null check for currency code 16th/Oct/2015 by ganeshan
								$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode));//set MSRP
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode))//set price
								$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode));//set saved price
								
								$($('.erp-price-avail')[i]).data('allval',partItemListPriceAvail[i]);
							}else{
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode))//set price
								
								$($('.erp-price-avail')[i]).data('allval',partItemListPriceAvail[i]);
							} */
                                    }


                                    /* if(partItemListPriceAvail[i].savedPrice>=0){
							$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode));//set MSRP
							$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode));//set saved price
						
							$($('.erp-price-avail')[i]).data('allval',partItemListPriceAvail[i]);
						}
						else{
							$("div.erp-price-avail .msrpHide[data-msrp='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.erp-price-avail .youSaveHide[data-saved='"+partItemListPriceAvail[i].partId+"']").hide();
						}
						//alert((typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode))
						//$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].availableQuantity);//set saved price
						$("div.cart-item-info .lead-time[data-leadtime='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].leadTime);//set saved price */
                                    $('span.unit').text(partItemListPriceAvail[i].uom);

                                    $(".msrpShowHide[data-msrpShowHide='" + partItemListPriceAvail[i].partId + "']").parents('.erp-price-avail').find('button').each(function() {
                                        $(this).removeClass('not-active');
                                    });
                                    $(".msrpShowHide[data-msrpShowHide='" + partItemListPriceAvail[i].partId + "']").parents('.erp-price-avail').siblings('.quantity-change').find('.spinner-control').removeClass('not-active');
                                }

                                $('div.lazyLoader').addClass('hidden');
                            },
                            error: function(e) {
                                //$('div.pageLoader').hide();
                                $('div.lazyLoader').addClass('hidden');
                            }
                        });
                    }

                    $('.paginate_button').on('click', function() {
                        var pageNumber = $(this).text();
                        if ($(this).hasClass('disabled')) {
                            return false;
                        }


                        if (pageNumber == "First") {
                            pageNumber = 1;
                            $('.paginate_button.active').removeClass('active');
                            $('.page1').addClass('active');
                            //$('.paginate_button.active').removeClass('active');
                        } else if (pageNumber == "Previous") {
                            pageNumber = $('.paginate_button.active').children('a').text() - 1;
                        } else if (pageNumber == "Next") {
                            pageNumber = $('.paginate_button.active').children('a').text();
                            pageNumber = parseInt(pageNumber) + 1;

                        } else if (pageNumber = "Last") {
                            pageNumber = paginationCount;
                        } else {
                            $('.paginate_button.active').removeClass('active');
                            $(this).addClass('active');
                        }

                        getItemsForCategory(prodCategoryId, prodCatalogId, pageNumber)
                    })

                    $('#result-per-page').on('change', function() {
                        var pageNumber = 1;
                        getItemsForCategory(prodCategoryId, prodCatalogId, pageNumber);
                    })

                    $('#sort-by').on('change', function() {
                        pageNumber = 1;
                        counter = 1;
                        sortChange = true;
                        $("#product-catalog-hldr").html('');
                        $('.cart-details').html('');
                        $(this).prop('disabled', false);
                        var filterValue = JSON.parse(mainArr);
                        filterValue["isFromSearch"] = false;
                        mainArr = JSON.stringify(filterValue);
                        getItemsForCategory(prodCategoryId, prodCatalogId, pageNumber, mainArr);
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

                    function getPaginationCount(resultPerPage, totalItemCount) {
                        var pageCount = 0;
                        if (resultPerPage >= totalItemCount) {
                            pageCount = 1;
                        } else {
                            pageCount = parseInt((totalItemCount / resultPerPage));
                            if (totalItemCount % resultPerPage != 0)
                                pageCount = pageCount + 1;
                        }
                        return pageCount;
                    }

                    function resetPagination(paginationCount) {
                        for (var i = 1; i <= paginationCount; i++) {
                            $('.page' + i).remove();
                        }
                    }

                    function setpaginationCount(paginationCount, startPoint) {
                        if (paginationCount > 5)
                            paginationCount = startPoint + 4;

                        var count = 1;
                        for (var i = startPoint; i <= paginationCount; i++) {
                            $('#pageUl li:eq(' + (count) + ')').after('<li class="paginate_button page' + i + '" aria-controls="quote-list" tabindex="' + i + '" onclick="pageNumberClicked(' + i + ')"><a href="#">' + i + '</a></li>');
                            count = count + 1;
                        }
                    }

                    function pageNumberClicked(pageNumber) {
                        getItemsForCategory(prodCategoryId, prodCatalogId, pageNumber);
                    }

                    function check(itemId, organizationId) {
                        var itemCategory = $("#headerName").text();
                        document.location.href = "getfullitemdetails?itemId=" + itemId + "&itemCategory=" + itemCategory + "&organizationId=" + organizationId;
                    }

                    function handelSearchproductCatalog(productCatalogId, hasParts, displayName, productCategoryId) {
                            var productCategoryId = productCategoryId;
                            var productCatalogId = productCatalogId;
                            var hasParts = hasParts;
                            var lastClickedText = displayName;
                            $("#headerName").text(lastClickedText);
                            foundClickedItem = false;
                            levelCount = 0;
                            arr1 = [];
                            arr2 = [];
                            var myTreeDataString = '${productCatalogTreeData}';

                            myTreeData = JSON.parse(myTreeDataString);
                            console.log(myTreeData);
                            var flag = false;
                            var searchflag = false;
                            var searchVariable = '${searchflag}';
                            if (null != searchVariable && searchVariable != "") {
                                searchflag = '${searchflag}';
                            }

                            // for catalog click
                            if (typeof productCatalogId == "undefined" && typeof hasParts == "undefined") {
                                // get only catalog details from json tree structure 
                                var productCatalogs = [];
                                var productCatalogList = {};
                                for (var key in myTreeData) {
                                    if (myTreeData.hasOwnProperty(key) && myTreeData[key].productCatalogId == productCategoryId) {
                                        latestJsonObj = myTreeData[key].children;
                                        var clickedJsonObj = myTreeData[key].children;

                                        var productCategory = [];
                                        var productCategoryList = {};
                                        for (var key in clickedJsonObj) {
                                            if (clickedJsonObj.hasOwnProperty(key)) {
                                                productCategory
                                                    .push({
                                                        "productCatalogId": clickedJsonObj[key].productCatalogId,
                                                        "hasParts": clickedJsonObj[key].children,
                                                        "description": clickedJsonObj[key].description,
                                                        "catalogDocumentLink": clickedJsonObj[key].catalogDocumentLink,
                                                        "text": clickedJsonObj[key].text,
                                                        "mediaId": clickedJsonObj[key].mediaId,
                                                        "children": clickedJsonObj[key].children,
                                                        "pcatalogId": clickedJsonObj[key].pcatalogId
                                                    });

                                                if (typeof clickedJsonObj[key].catalogDocumentLink == "undefined" || clickedJsonObj[key].catalogDocumentLink == "") {
                                                    $("#catalog-page").hide();
                                                } else {
                                                    $("#catalog-page").show();
                                                    $("#catalog-page > a").attr("href", clickedJsonObj[key].catalogDocumentLink);
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
                                    pageNumber = 1;
                                    counter = 1;
                                    getItemsForCategory(productCategoryId, productCatalogId, pageNumber);
                                    pageNumber++;
                                }
                                // click on category which contains subcategory
                                else {
                                    var productCatalogs = [];
                                    var productCatalogList = {};
                                    for (var key in myTreeData) {
                                        if (myTreeData.hasOwnProperty(key) && myTreeData[key].productCatalogId == productCatalogId) {
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



                    function fullItemDetails(itemId, organizationId) {
                            var itemCategory = $("#headerName").text();
                            var phrase = "";

                            $('.breadcrumb').find('li').each(function() {
                                // cache jquery var
                                var current = $(this);
                                if (phrase == "") {
                                    phrase = current.text();
                                } else {
                                    var parameter = null;
                                    var subcategoryParameter = $('#treeShopforParts a.jstree-clicked').closest('li').attr('id');
                                    var str = $(this).find('a').attr('onclick');
                                    if (str == "breadCrumb()") {

                                    } else if (str) {
                                        parameter = str.split("jstreeBreadCrumb('")[1].split("')")[0];
                                    }
                                    if (parameter != null) {
                                        phrase = phrase + "," + current.text() + "_" + parameter;
                                    } else if (subcategoryParameter != null) {
                                        phrase = phrase + "," + current.text() + "_" + subcategoryParameter;
                                    } else {
                                        phrase = phrase + "," + current.text();
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

                            document.location.href = "getfullitemdetails?itemId=" + itemId + "&itemCategory=" + itemCategory + "&organizationId=" + organizationId + "&shopforpartbreadcrumb=" + replaceWith(phrase); //+"&jsonTreeFlag=true&jsonData="+jsonVal.replace(new RegExp('#', 'g'), '%23');
                            // alert('**'+$('.breadcrumb li a').length);


                        }
                        //Added by krupa on 19-10-2015 for issue breadcrumbs was breaking for phrase contaning '&' as the system interpreted as a URL parameter. 
                    function replaceWith(content) {
                            return content.toString().replace(new RegExp('&', 'g'), '%26');
                        }
                        // end of Added by krupa on 19-10-2015 for issue breadcrumbs was breaking for phrase contaning '&' as the system interpreted as a URL parameter. 
                    $(document).delegate('.total-items.output', 'change', function() {
                        var itemCount = $(this).val();
                        var partId = $(this).attr('id');

                        if (!(/^ *[0-9]+ *$/.test(itemCount))) {
                            var msg = "<spring:message code='alert.shopforparts.valid.specialchar' javaScriptEscape='true'/>";
                            $('.modal-body').text(msg)
                            $("#myModal").show();
                            $('.total-items.output').val(1);
                            //editQuantity(1,partId);
                        }
                        if (itemCount == 0) {
                            var msg = "<spring:message code='alert.shopforparts.valid.qty.lessthan.one' javaScriptEscape='true'/>";
                            $('.modal-body').text(msg)
                            $("#myModal").show();
                            $("#myModal").draggable({
                                handle: ".modal-header"
                            });
                            $('.total-items.output').val(1);
                            //editQuantity(1,partId);
                        } else if (itemCount < 0) {
                            var msg = "<spring:message code='alert.shopforparts.valid.qty.lessthan.one' javaScriptEscape='true'/>";
                            $('.modal-body').text(msg)
                            $("#myModal").show();
                            $("#myModal").draggable({
                                handle: ".modal-header"
                            });
                            $('.total-items.output').val(1);
                            //editQuantity(1,partId);
                        } else {
                            //editQuantity($('.total-items.output').val(),partId);
                        }

                    });
                    $(".custom-close").click(function() {
                        $("#myModal").hide();
                    });
                    var sortChange = false;

                    //commented to remove Lazy loading
                    /* $(window).on('scroll',function(e){
            var $document=$(document);
            var $window=$(this);
			var filterValue = JSON.parse(mainArr);
            filterValue["isFromSearch"]=false;
         	mainArr = JSON.stringify(filterValue);
          
           	if($('#product-catalog-hldr > .cart-details').is(':visible') && $('.pageLoader').is(':hidden')){
           		if($document.scrollTop() >= $document.height() - $window.height() - 100){
            	var results = $('.cart-details').length;
   	            	if(typeof totalItems !== 'undefined' && totalItems > results && pageNumber===counter){
	            		$('div.lazyLoader').removeClass('hidden');
		                getItemsForCategory(prodCategoryId, prodCatalogId,pageNumber,mainArr);
		                //setInterval(function () {$('div.lazyLoader').addClass('hidden');}, 3000);
		                pageNumber++;
	            	}
   	            
	            }else{
	            	$('div.lazyLoader').addClass('hidden');
	            } 	
           	}
        });
		 */


                    // buy now click
                    $(document).delegate('.buynow-click', 'click', function(e) {
                        e.preventDefault();
                        var organizationId = $(this).parent().attr('data-orgId');
                        var partId = $(this).parent().siblings('.cart-item-info').find('a').attr('data-itemId');
                        var quantity = $(this).parent().siblings('.quantity-change').find('.total-items').val();

                        $('div.pageLoader').show();
                        $.ajax({
                            type: "Get",
                            /* data : "cartItemId=" + cartItemId, */
                            data: {
                                organizationId: organizationId
                            },
                            contentType: 'application/json',
                            mimeType: 'application/json',
                            url: "isdivisionmapped",
                            cache: false,
                            success: function(response) {
                                window.location.href = 'directorderinit?organizationId=' + organizationId + '&isFromOrderBrand=true&partId=' + partId + '&quantity=' + quantity + '&isDivisionMapped=' + response;
                            },
                            error: function(e) {
                                $('div.pageLoader').hide();
                            }
                        });
                    })


                    // Onclick of Bread crumb 

                    function jstreeBreadCrumb(prodId) {
                        $("#treeShopforParts").jstree(true).deselect_all();
                        $("#treeShopforParts").jstree(true).select_node(prodId);
                    }

                    $(function() {

                        $("#treeShopforParts.treeview-hldr").on('ready.jstree', function(e, data) {
                            var productCatalogId = '${productCatalogId}';
                            var searchflag = false;
                            var searchVariable = '${searchflag}';
                            if (null != searchVariable && searchVariable != "") {
                                searchflag = '${searchflag}';
                            }
                            if (searchflag) {
                                $('#treeShopforParts.treeview-hldr').jstree(true).select_node(productCatalogId);
                            }

                        });

                    })

                    function editQuantity(quantity, partId) {
                        $.ajax({
                            type: "Get",
                            data: {
                                partId: partId,
                                quantity: quantity
                            },
                            contentType: 'application/json',
                            mimeType: 'application/json',
                            url: "editquoteitemquantity",
                            cache: false,
                            success: function(response) {

                            },
                            error: function(xhr, status, error) {}
                        });
                    }

                    //back button starts 
                    var manualStateChange = true;
                    History.Adapter.bind(window, 'statechange', function() {
                        if (manualStateChange == true) {
                            if ($('.breadcrumb li a:last').attr('onclick') != undefined && $('.breadcrumb li a:last').attr('onclick') != null && $('.breadcrumb li a:last').attr('onclick') != "") {
                                callBreadfunction = $('.breadcrumb li a:last').attr('onclick').split("'")[1];
                                jstreeBreadCrumb(callBreadfunction);
                            } else if ($('.breadcrumb li a:last').attr('href') != undefined && $('.breadcrumb li a:last').attr('href') != null && $('.breadcrumb li a:last').attr('href') != "") {
                                var callhreffunction = $('.breadcrumb li a:last').attr('href');
                                //window.location.href='http://localhost:8080/gensuite/web/'+callhreffunction ;
                                window.location.href = "${properties['base.url']}" + '/gensuite/web/' + callhreffunction;

                            }
                        }
                        manualStateChange = true;
                    });

                    $('.breadcrumbs-list ul').bind('DOMNodeInserted', function(event) {
                        if ($('.breadcrumbs-list ul > li').hasClass('active')) {
                            manualStateChange = false;
                            History.pushState({
                                state: $('.breadcrumbs-list ul li a').size()
                            }, '${properties['global.page.title']}', "./shopforparts?state=" + $('.breadcrumbs-list ul li a').size());
                        }
                    });
                   
                </script>

</body>

</html>

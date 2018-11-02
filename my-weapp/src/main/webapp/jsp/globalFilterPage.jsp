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
<body>

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
					<div id="facetfilter">
						<h3>Show Results for</h3>
						<div class="subFilters">
							<!-- Accordian Implementation -->
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#category"> Product Categories <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="category" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="filterBody">
												<div id="custom-search-input">
													<div class="input-group col-md-12">
														<input type="text" id="category-keyword"
															class="form-control input-lg" placeholder="Search" /> <span
															class="input-group-btn">
															<button class="btn btn-info btn-lg" id="category-search"
																type="button">
																<i class="glyphicon glyphicon-search"></i>
															</button>
														</span>
													</div>
												</div>
												<ul>
													<!-- <li><input type="checkbox" name="Axle" value="Axle"><a href="getcategoryinformation" >Axles &amp; Axle Parts </a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Engine Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Heater/AC Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Hinges &amp; Hardware Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Hydraulic Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="getcategoryinformation" >Axles &amp; Axle Parts </a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Engine Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Heater/AC Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Hinges &amp; Hardware Parts</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a href="#" >Hydraulic Parts</a></li> -->
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Plates </a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Components</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Surface Finishing</a></li>
													<li><input type="checkbox" name="Axle" value="Axle"><a
														href="#">Temperature Controllers</a></li>
												</ul>
												<!-- 	<a href="#" class="moreFacets">View More</a> -->

											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#material"> Material <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="material" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="filterBody">
												<ul>
													<li><input type="checkbox" id="steel1">DME01
														(Aluminium)</li>
													<li><input type="checkbox" id="steel2">DME03
														(Steel)</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#model"> Model <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="model" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="filterBody">
												<ul>
													<li><input type="checkbox">Model 453 (2)</li>
													<li><input type="checkbox">Model 457 (1)</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
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
													<li><input type="checkbox">5/32" (3)</li>
													<li><input type="checkbox">11/64" (2)</li>
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
												href="#length"> Length <span
												class="glyphicon glyphicon-chevron-down"></span>
											</a>
										</h4>
									</div>
									<div id="length" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="filterBody">
												<ul>
													<li><input type="checkbox">27/32" (1)</li>
													<li><input type="checkbox">27/32" (1)</li>
												</ul>
											</div>

										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												href="#brand"> Brand <span
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
													<li><input type="checkbox">Blow Molding
														Machines</li>
													<li><input type="checkbox" checked="true">DME
														- Mold Technologies EU</li>
													<li><input type="checkbox">DME - Mold
														Technologies US</li>
													<li><input type="checkbox">Injection Machines
														- Ferromatik</li>
													<li><input type="checkbox">Injection Machines
														- Milacron</li>
												</ul>
												<!-- 	<a href="#" class="moreFacets">View More</a> -->

											</div>
										</div>
									</div>
								</div>
							</div>
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
							hidden><spring:message code="label.button.msds.text" /></a>
					</div>

					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="resultInfo" style="border-bottom: 1px solid #eee;">


						<div class="dummyHold">

							<div
								class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
								<div class="product-info" data-id="144" data-pcatalog="144"
									data-parent="" data-cataloglink="" data-hasparts="false"
									data-catalogid="144">
									<a href="getcategoryinformation" class="productCatalogClick"><span
										class="helper"></span><img
										src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=136754&thumbnail=true&user=null&token=0eae6184-7758-44ff-9571-bbee45b2c254"></a>
									<a href="#" class="productCatalogClick" title="Plates">Plates</a>
								</div>
							</div>
							<div
								class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
								<div class="product-info" data-id="144" data-pcatalog="144"
									data-parent="" data-cataloglink="" data-hasparts="false"
									data-catalogid="144">
									<a href="javascript:void(0);" class="productCatalogClick"><span
										class="helper"></span><img
										src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134549&thumbnail=true&user=null&token=0eae6184-7758-44ff-9571-bbee45b2c254"></a>
									<a href="#" class="productCatalogClick" title="Components">Components</a>
								</div>
							</div>
							<div
								class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
								<div class="product-info" data-id="144" data-pcatalog="144"
									data-parent="" data-cataloglink="" data-hasparts="false"
									data-catalogid="144">
									<a href="javascript:void(0);" class="productCatalogClick"><span
										class="helper"></span><img
										src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134549&thumbnail=true&user=null&token=0eae6184-7758-44ff-9571-bbee45b2c254"></a>
									<a href="#" class="productCatalogClick"
										title="Surface Finishing">Surface Finishing</a>
								</div>
							</div>
							<div
								class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
								<div class="product-info" data-id="144" data-pcatalog="144"
									data-parent="" data-cataloglink="" data-hasparts="false"
									data-catalogid="144">
									<a href="javascript:void(0);" class="productCatalogClick"><span
										class="helper"></span><img
										src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134876&thumbnail=true&user=null&token=0eae6184-7758-44ff-9571-bbee45b2c254"></a>
									<a href="#" class="productCatalogClick"
										title="Temperature Controllers">Temperature Controllers</a>
								</div>
							</div>
							<div
								class="product-info-container col-lg-4 col-md-4 col-sm-3 col-xs-12">
								<div class="product-info" data-id="144" data-pcatalog="144"
									data-parent="" data-cataloglink="" data-hasparts="false"
									data-catalogid="144">
									<a href="javascript:void(0);" class="productCatalogClick"><span
										class="helper"></span><img
										src="https://milacronuat.genalphacatalog.com/catalogdoc/document?media=134591&thumbnail=true&user=null&token=0eae6184-7758-44ff-9571-bbee45b2c254"></a>
									<a href="#" class="productCatalogClick"
										title="Hot Runner Spare Parts">Hot Runner Spare Parts</a>
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
						id="product-catalog-hldr"></div>

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
	   var facetListJson = '${globalSearchResult}';
	    $(document).ready(function($){
	    	$(".panel-group").empty();
	    	var result = jQuery.parseJSON(facetListJson);
	    	/* if(result.facetdetails == ""){
	    		result = result ;
	    	}else{
	    		result = result.facetdetails;
	    	} */
	    	$("#leftPanel").tmpl(result).appendTo(".panel-group");
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
	      
	   
	    	 
	      $('.filterBody ul li').click(function(e){
	    	  if($(this).find('input[type=checkbox]').prop("checked") == true){
	    		  $(this).find('input[type=checkbox]').prop( "checked", false );
	    	  }else{
	    		  $(this).find('input[type=checkbox]').prop( "checked", true );
	    	  }
	    	 	$('div.pageLoader').show();	
	    	    //window.location.href = 'getcategoryinformation?appliedFilter='+$(this).parent().parent().parent().parent().siblings().text()+"&value="+$(this).text();
	    	 	window.location.href = 'getShoppingItems?selectedItems='+$(this).text();
	    	});
	      $('.product-info').click(function(e){
	    	 	$('div.pageLoader').show();	
	    	    window.location.href = 'getcategoryinformation?appliedFilter= Product Categories'+"&value="+$(this).children("a:nth-child(2)").text();
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
		}
		
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
							   <a href="#" class="productCatalogClick" title="${'${'}text}">${'${'}text}</a>
                              {{else}}
								<a href="javascript:void(0);" class="no-image productCatalogClick">${'${'}text}</a>
							 {{/if}}
                        </div>
                    </div>
    </script>
	<script id="productItemTemplate" type="text/x-jquery-tmpl">

					<div class="row search-parts-template cart-details add-cartpopover">
                       <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            {{if mediaId!=0}}
                                 <a href="javascript:void(0)" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"></a>
                             {{else}}
									 <a href="javascript:void(0);" class="no-image" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})">${'${'}commercialDescription}</a>
							 {{/if}}
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 cart-item-info">
                            <h4><a href="javascript:void(0);" onclick="fullItemDetails(${'${'}itemId},${'${'}organizationId})" data-itemId="${'${'}itemId}" data-mediaId="${'${'}mediaId}" data-itemNumber="${'${'}itemNumber}"><spring:message code="label.item.shop"/> # ${'${'}itemNumber}</a></h4>

                            <div><strong>${'${'}commercialDescription}</strong></div>
                            <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
								<div>${'${'}engineeringDescription}</div>
							</sec:authorize>
							<div class="b-label">
                            <div>${'${'}organizationName} <spring:message code="search.part" /></div>
                          <!--  <strong><span class="stock-count" data-avail="${'${'}itemId}"></span> <spring:message code="label.promotion.instock"/>, <spring:message code="label.promotion.leadtime"/> <span class="lead-time" data-leadtime="${'${'}itemId}"></span> Day(s)</strong></div> -->
							<strong><span class="stock-count" data-avail="${'${'}itemId}"></span></strong></div>
 
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
                            <span class="unit" style="">${'${'}uom}</span> 
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail" data-allVal="" data-orgId="${'${'}organizationId}">

                            <div data-msrpShowHide="${'${'}itemId}" data-msrp="${'${'}itemId}" class="msrpShowHide msrpHide hidden"><spring:message code="label.msrp"/>: <span class="msrp-price price-loader" data-msrp="${'${'}itemId}"></span></div>
                            <div class="your-price1 hidden" data-price="${'${'}itemId}"><spring:message code="label.your.price"/>: <span class="your-price price-loader" data-price="${'${'}itemId}"></span></div>
                            <div data-savePriceShowHide="${'${'}itemId}" data-saved="${'${'}itemId}" class="blueColor youSaveHide savePriceShowHide hidden"><spring:message code="label.save"/>: <span class="save-price price-loader" data-saved="${'${'}itemId}"></span> <span><spring:message code="lable.item.each" /></span></div>

							
							<sec:authorize access="hasRole('ROLE_CART')">

								{{if isOrderable && !priceNotShown}}
                            		<button class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 add-to-cart" style="height:35px;"><spring:message code="quick.search.addtocart"/></button>
									<sec:authorize access="hasRole('ROLE_ORDER')"> 
										{{if canPlaceOrderPOCC}}
											<button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 buynow-click" style="height:35px;"><spring:message code="label.buynow"/></button>
										{{else}}
											<button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;"><spring:message code="label.buynow"/></button>
										{{/if}}										
									</sec:authorize>
									<sec:authorize access="!hasRole('ROLE_ORDER')"> 
										<button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;"><spring:message code="label.buynow"/></button>
									</sec:authorize>
									
								{{else}}
									<button class="btn btn-addtocart cart-small mtop10 col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;"><spring:message code="quick.search.addtocart"/></button>
									<button class="btn btn-buynow cart-small col-lg-9 col-md-12 col-xs-12 not-active" style="height:35px;"><spring:message code="label.buynow"/></button>
								{{/if}}
								
                            </sec:authorize>
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
	//Removed function for loading issue
			userid=$('#userId').val();
			authtoken = $('#authToken').val();
			$('#callingLocation').val('shopforparts');
			$("#main-menu-list > li:nth-child(2)").addClass("active");
			
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
			
			$('.moreFacets').click(function(){
				$('.filterBody ul').removeClass('scroll');
				$(this).siblings('.filterBody ul').addClass('scroll');
			});
			
			
			
			
			/* $('#treeShopforParts').jstree(true).hide_icons(false); */
			
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
			
			if(!searchflag){
			/*	$(".breadcrumb").append('<li><a href='+$("#main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#main-menu-list >li:nth-child(1)").text()+'</a></li>');
				$(".breadcrumb").append('<li class="active"><a href='+$("#main-menu-list > li.active a").attr('href')+'>'+$("#main-menu-list > li.active a").text()+'</a></li>');*/
			}
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
			var resultPerPage = pageSize;//$('#result-per-page').val();
			var sortBy = $('#sort-by').val();
 			if(pageNumber === 1 || sortChange){
				$('.pageLoader').show();
			}
 			$.ajax({
				type : "Get",
				data : {
					productCategoryId : productCategoryId,
					productCatalogId : productCatalogId,
					resultPerPage : resultPerPage,
					pageNumber : pageNumber,
					sortBy : sortBy,
					filterJson : filterJson
				},
				contentType : 'application/json',
				mimeType : 'application/json',
				url : "getitemsforcategory",
				success : function(response) {
					console.log(response);
					
					var filterValue = JSON.parse(filterJson);
                    console.log(filterValue);
                    
                      if(filterValue['isFilterRequired']==true){  
                         renderFilter(response.advancefilters);
                     }
                      
                      
                    
					if(pageNumber===1){
						//$("#product-catalog-hldr").html('');
					}
					 
					/*  $("#productItemTemplate").tmpl(response.itemDetails)
							.appendTo("#product-catalog-hldr"); */

					//Bing Increment click Event
					$('.item-increment').on('click',function(){
						var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
						if(parseInt(itemVal)>=999){
				            $(this).parents('.spinner-control').children('.total-items').val("999");
				            return false;
				          }
					});
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
                    }
                    
                    totalItems = parseInt($('#allResult').text());
 					if(filterValue['isFromSearch']==true && totalItems  == 0){
						  //$('#product-catalog-hldr').append('<p class="errorText"><spring:message code="message.noPart.filter" javaScriptEscape="true"/></p>');
					}else if(totalItems  == 0){
						  //$('#product-catalog-hldr').append('<p class="errorText"><spring:message code="message.noPart" javaScriptEscape="true"/></p>');

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
                	   //getPriceForItems(partVoList,organizationId); 
                   }
					else{
						 $("#pagination").hide();
						 
					}
                   $('div.lazyLoader').addClass('hidden');
                   if($('.pageLoader').is(':visible')){
                   	$('.pageLoader').hide();
                   }
            
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

						//$("#product-catalog-hldr").html('');
					/* 	$("#productCatalogTemplate").tmpl(
								productCategoryList.productCategory).appendTo(
								"#product-catalog-hldr"); */
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
					//$("#product-catalog-hldr").html('');
					/*$("#productCatalogTemplate").tmpl(
							productCategoryList.productCategory).appendTo(
							"#product-catalog-hldr"); */
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
					var img =$(this).parents(".search-parts-template").children("div:first-child").html();
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
									$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
									//NREV-1511 fix starts
									if(jsonResponse.isActualImage == false){
										$(".waterMarkForCartPopOver").show();
									}
									//NREV-1511 fix ends
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

			$.ajax({
				type : "Get",
				data : {items:JSON.stringify(items),organizationId:organizationId},
				contentType : 'application/json',
				mimeType : 'application/json',
				url : "getcategoryPartPrice",
				success : function(response) {
                var locale=${locale};
					console.log(response);
					var partItemListPriceAvail = response.partItemVOList;
					for(var i=0;i<partItemListPriceAvail.length;i++){
						
						if(partItemListPriceAvail[i].priceNotShown == true){
							$("span.msrpShowHide").text("contact customer service").removeClass('price-loader');
							$("div.your-price, div.savePriceShowHide").hide();
							$("div.savePriceShowHide span.save-price").siblings("span").text("");
							$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
							var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
							$("div.cart-item-info .stock-count").text(inventoryMsg);//set inventory Message text
						}
						else{
							
							if(partItemListPriceAvail[i].msrpStr != "-1"){
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set MSRP
							}
							else{
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							}
							
							if(partItemListPriceAvail[i].priceStr != "-1"){
								$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set price
							}
							else{
								$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").hide();
							}
							
							if(partItemListPriceAvail[i].savedPriceStr != "-1"){
								$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set saved price
							}
							else{
								$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							}
							
							//$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);
							$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").parent(".erp-price-avail").data('allval',partItemListPriceAvail[i]);
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

						$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").parents('.erp-price-avail').find('button').each(function(){
							$(this).removeClass('not-active');
						});
						$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").parents('.erp-price-avail').siblings('.quantity-change').find('.spinner-control').removeClass('not-active');
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
		})
		
		  $('#sort-by').on('change', function(){
			pageNumber = 1;
			counter = 1;
 			sortChange = true;
 			//$("#product-catalog-hldr").html('');
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
						/* $("#product-catalog-hldr").html('');
						$("#productCatalogTemplate").tmpl(
								productCategoryList.productCategory).appendTo(
								"#product-catalog-hldr"); */
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
			   
			   document.location.href="getfullitemdetails?itemId="+itemId+"&itemCategory="+itemCategory+"&organizationId="+organizationId+"&shopforpartbreadcrumb="+replaceWith(phrase);//+"&jsonTreeFlag=true&jsonData="+jsonVal.replace(new RegExp('#', 'g'), '%23');
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
		var sortChange = false;
		$(window).on('scroll',function(e){
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
		
		
		
		// buy now click
		$(document).delegate('.buynow-click','click',function(e) {
     	   e.preventDefault();
    	   var organizationId = $(this).parent().attr('data-orgId');
     	   var partId = $(this).parent().siblings('.cart-item-info').find('a').attr('data-itemId');
     	   var quantity = $(this).parent().siblings('.quantity-change').find('.total-items').val();
     	   
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
		        	  window.location.href = 'directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response;
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
			History.pushState({state: '#'},"${properties['global.page.title']}","./shopforparts?search=");
			bookMarkSearch = false;
		}
		//back button starts 
		var manualStateChange = true;
		History.Adapter.bind(window,'statechange',function(e){
			e.preventDefault();
			var searchFlow = document.referrer.split("/");
			// Fix for milacron production issue of back button
			if(searchFlow[searchFlow.length-1].indexOf('searchrequest') != -1){
				document.forms[0].action="searchrequest";
           		document.forms[0].submit(); 
           		/* breadCrumb();
           		return false; */
			}
		$(".category-search").click(function(){
			
		});	
		</script>

</body>
</html>

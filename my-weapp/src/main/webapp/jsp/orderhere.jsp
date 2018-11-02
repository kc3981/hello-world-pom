<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="googleAnalytics.jsp" />
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
<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.4/jquery.i18n.js"
	defer></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}"
	defer></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}"
	defer></script>
<script
	src="../js/jquery.bootpag.js?version=${properties['application.version']}"
	defer type="text/javascript"></script>
<!-- <script src="../js/jquery.history.js"></script> -->
<!-- <script src="https://github.com/balupton/History.js"></script> -->
<!-- <script type="text/javascript" src="https://github.com/devote/HTML5-History-API/blob/master/history.js"></script> -->

</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<style>
ol.order-here-list {
	list-style: none;
	margin-top: 2.5em;
	font-size: 14px;
	display: inline;
}

.marginRight0 {
	margin-right: 0 !important;
}

.order-here-list li {
	counter-increment: item;
	margin-bottom: 25px;
	border-bottom: 1px solid #f1f1f1;
}

.order-here-list li:before {
	margin-right: 10px;
	background: #333;
	border-radius: 50%;
	color: #fff;
	width: 1.5em;
	text-align: center;
	display: inline-block;
	vertical-align: top;
}

.order-here-list .media {
	display: inline-block;
	width: 100%;
	text-align: justify;
}

img.media-object {
	width: 90px;
	height: 90px;
}

.order-here-list .media .media-left {
	opacity: .7;
}

.order-here-list .media .media-left:hover {
	opacity: 1;
}

.orderoptionmedia .media-body {
	vertical-align: middle;
	padding-left: 14px;
}

.bulkuploadWidget {
	width: 70px !important;
}

.orderlistborder {
	padding-top: 15px;
	margin: 20px 20px 10px 0px;
	min-height: 199px;
	width: 49%;
	box-shadow: 0px 0px 7px 0px;
	transition: 0.5s;
}

.orderlistborder:hover {
	box-shadow: none;
}

a .orderlistborder {
	color: #000 !important;
}
/* 
  ##Device = Tablets, Ipads (portrait)
  ##Screen = B/w 768px to 1024px
*/
@media ( min-width : 768px) and (max-width: 1024px) {
	.order-here-list .orderlistborder {
		width: 48%;
	}
}

/* 
  ##Device = Most of the Smartphones Mobiles (Portrait)
  ##Screen = B/w 320px to 479px
*/
@media ( min-width : 320px) and (max-width: 767px) {
	.order-here-list .orderlistborder {
		width: 100%;
	}
}
</style>
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
					<li class='active'><spring:message code="label.order.options" /></li>

				</ul>
			</div>

			<div class="container-fluid content-wrapper">
				<ol class="order-here-list">
					<div class="col-12">
						<a href="quickorder?type=speedorder&orderhere=true">
							<div class="col-xs-12 col-sm-6 col-md-6 orderlistborder">
								<div class="media orderoptionmedia">
									<div class="media-left">

										<img alt="Speed Order" class="media-object"
											src="../images/orderhere-speedorder.png"
											data-holder-rendered="true">

									</div>
									<div class="media-body">
										<h3>
											<spring:message code="label.speed.order" />
										</h3>
										<spring:message
											code="label.ui.orderhere.speedorder.description" />
									</div>
								</div>
							</div>
						</a> <a href="quickorder?orderhere=true">
							<div
								class="col-xs-12 col-sm-6 col-md-6 orderlistborder marginRight0">
								<sec:authorize access="hasRole('ROLE_ORDER')">

									<div class="media-left">

										<img alt="Quick Order" class="media-object"
											src="../images/orderhere-quickorder.png"
											data-holder-rendered="true">

									</div>
									<div class="media-body">
										<h3>
											<spring:message code="label.footer.quickorder" />
										</h3>
										<spring:message
											code="label.ui.orderhere.quickorder.description" />
									</div>

								</sec:authorize>
							</div>
						</a>
						<c:choose>
							<c:when
								test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
							</c:when>
							<c:otherwise>
								<sec:authorize access="hasRole('ROLE_CART')">
									<a href="cartbulkpartupload?orderhere=true">
										<div class="col-xs-12 col-sm-6 col-md-6 orderlistborder">
											<div class="media orderoptionmedia">
												<div class="media-left">

													<img alt="Bulk Upload"
														class="media-object bulkuploadWidget"
														src="../images/orderhere-bulkupload.png"
														data-holder-rendered="true">

												</div>
												<div class="media-body">
													<h3>
														<spring:message code="label.footer.bulk.upload" />
													</h3>
													<spring:message
														code="label.ui.orderhere.bulkupload.description" />
												</div>
											</div>
										</div>
									</a>
								</sec:authorize>
							</c:otherwise>
						</c:choose>
						<sec:authorize
							access="hasRole('ROLE_ORDER') and hasRole('ROLE_PRICE')">
							<a href="directorderbrand?orderhere=true">
							<div
								class="col-xs-12 col-sm-6 col-md-6 orderlistborder marginRight0">
									<div class="media orderoptionmedias">
										<div class="media-left">

											<img alt="Place Order" class="media-object"
												src="../images/orderhere-placeorder.png"
												data-holder-rendered="true">

										</div>
										<div class="media-body">
											<h3>
												<spring:message code="tooltip.order.placeorder" />
											</h3>
											<spring:message
												code="label.ui.orderhere.placeorder.description" />
										</div>
									</div>			
								</div>
							</a>	
						</sec:authorize>

					</div>
				</ol>
				<!-- <a href="speedorder"> <h3>Speed Order </h3></a> -->
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
		</form>
		<!-- Javascript Plugins -->
		<script
			src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
			defer type="text/javascript"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
			defer type="text/javascript"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
			defer type="text/javascript"></script>
		<script
			src="../js/jstree.js?version=${properties['application.version']}"
			type="text/javascript" defer></script>
		<script
			src="../js/jquery.jscroll.min.js?version=${properties['application.version']}"
			defer type="text/javascript"></script>
		<script
			src="../js/gensuite-ui.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script
			src="../js/custom.scripts.js?version=${properties['application.version']}" type="text/javascript"></script>
		<script type="text/javascript">
	$("#new-main-menu-list > li:nth-child(2)").addClass("active");
	</script>
</body>
</html>
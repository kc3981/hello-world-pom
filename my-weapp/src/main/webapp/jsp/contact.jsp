<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<!-- build:css ../assets/globalstyles.min.css -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>
<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
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
<!-- <link rel="shortcut icon" href="images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>


</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed hidden-xsx responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<li class="active"><spring:message
							code="label.header.contactus" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="label.contactus.brands" />
					</h3>
					<div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings brand-template-container">
							<c:forEach items="${contactList}" var="entry">
								<div
									class="col-lg-3 col-md-3 col-sm-4 col-xs-12 column-paddings brand-template">
									<div
										class="brand-container contact-${entry.organizationAddressId} slider">


										<img src="${entry.orglogoName}" class='brand'
											style="transform: none; top: 1%" />
										<!-- SUPPORT Img alignment 230216 -->
										<div class="item active">
											<c:if test="${entry.organizationId!=3}">
												<p class="address" style="height: 60px;">
													${entry.address1} ${entry.address2}
													<c:if test="${entry.address3 != null}">	 
																	${entry.address3} 
																</c:if>
													${entry.city}, ${entry.state}, <br>${entry.country}
													${entry.zipCode}
												</p>
											</c:if>

											<p class="contact-details">
												<span class="phoneDet"> <i class="fa fa-phone"></i>&nbsp;&nbsp;${entry.phoneNumber}&nbsp;&nbsp;</br>
													<!-- INC - 2583 Added by vinay reviwed by Chinnam --> <c:forTokens
														items="${entry.site}" delims="," var="mySplit">
														<i class="fa fa-envelope"></i>&nbsp;&nbsp;
																		<c:set var="dateParts"
															value="${fn:split(mySplit, ':')}" />
														<c:choose>
															<c:when test="${fn:length(dateParts) gt 1}">
																<a href="mailto:${dateParts[0]}" target="_blank"
																	title="${dateParts[0]}">${dateParts[0]}</a> (${dateParts[1]})
																	     </c:when>
															<c:otherwise>
																<a href="mailto:${dateParts[0]}" target="_blank"
																	title="${dateParts[0]}">${dateParts[0]}</a>
															</c:otherwise>
														</c:choose>
														</br>
													</c:forTokens> <%-- <i class="fa fa-envelope"></i>&nbsp;&nbsp;<a
																	href="mailto:${entry.site}" title="${entry.site}">${entry.site}</a></br> --%>
													<!-- INC - 2583 Added by vinay reviwed by Chinnam end--> <%-- commented while merging with Hillphoenix
																	<i class="fa fa-desktop"></i>&nbsp;&nbsp;<a
																	href="http://${entry.siteUrl}" target="_blank" title="${entry.siteUrl }">${entry.siteUrl }</a>
																  --%> <c:if test="item.siteUrl"></c:if> <c:forTokens
														items="${entry.siteUrl}" delims="," var="mySiteSplit">
														<i class="fa fa-desktop"></i>&nbsp;&nbsp;<a
															href="http://${mySiteSplit}" target="_blank"
															title="${mySiteSplit }">${mySiteSplit}<%-- ${item.siteUrl } --%></a>
														</br>
													</c:forTokens>
												</span>
											</p>

										</div>


									</div>
								</div>
							</c:forEach>

						</div>

					</div>

				</div>
			</div>

			<!-- footer container -->
			<footer>
				<%@ include file="footer.jsp"%>
			</footer>
		</form>
	</div>
	<!-- Javascript Plugins -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('.carousel').each(function() {
				var $this = $(this);
				$this.carousel({
					interval : false
				});

				if ($this.find('.carousel-inner div').length === 1) {
					$this.find('.carousel-control').hide();
				}
			});

		});
	</script>
</body>

</html>
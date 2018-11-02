<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Analytics</title>
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
<link rel="stylesheet"
	href="../css/owl.carousel.css?version=${properties['application.version']}">
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
<!-- build:css ../assets/owl.carousel.min.css -->
<!-- /build -->

<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>


<jsp:include page="googleAnalytics.jsp" />

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
<!-- build:js  ../assets/globalscripts.js -->
<script
	src="../js/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script type="text/javascript"
	src="../js/jquery.i18n.properties.js?version=${properties['application.version']}"></script>
<script
	src="../js/less.min.js?version=${properties['application.version']}"></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/bootstrap.min.js?version=${properties['application.version']}"></script>

<!-- /build -->
<style>
html, body, .wrap {
	height: 100% !important;
	width: 100% !important
}

header {
	padding: 15px 0px 0px 0px;
}

.wrap {
	font-family: "Arial", "sans-serif", "helvetica";
	overflow-y: overlay;
}

iframe {
	margin-top: 130px
}

ul.tab {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #ccc;
}

/* Float the list items side by side */
ul.tab li {
	float: left;
	margin-right: 1px;
	border-right: 1px solid #53585A;
}

/* Style the links inside the list items */
ul.tab li a {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 12px 16px;
	text-decoration: none;
	transition: 0.3s;
	font-size: 15px;
}


/* Create an active/current tablink class */

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

#headerlogo {
	display: inline-block;
	margin: 0px 10px 10px;
}

#userDivision {
	float: right;
	margin-right: 15px;
	margin-top: 15px;
}

#dropdownMenu1 {
	width: 100%;
}

.dropdown-menu {
	background: #000 !important;
	opacity: 0.8;
	right: 0px !important;
	min-width: 91px;
	text-align: center;
}

.dropdown-menu li a {
	color: #f1f1f1;
}

.changeView {
	float: left;
	margin-right: 20px;
	color: #0e5bc5;
	font-weight: 600;
}

.dropdown {
	float: left;
	width: auto;
}

ul.dropdown-menu>li>a:hover {
	background: #000 !important
}
</style>
<script>
var intialUrl;
var intialValue;
var analyticsMap = ${analyticsMapJSON};
	 $(document).ready(function() {
		$('.tablinks').click(function(){
		$('#orgTab li').each(function(){
			if($(this).prop('class') == "active"){
				$(this).removeClass("active");
			}
		});
		
		$(this).parent().addClass("active");
			//var id = $(this).prop('id');
			var orgName = $(this).text();
			src = getDashboardSource(orgName,analyticsMap);
			$('#orgFrame').prop("src",src);
		});
		
		var orgName = $('#orgTab a').eq(0).text();
		intialUrl = getDashboardSource(orgName,analyticsMap);
		//intialUrl = $('#orgTab a').eq(0).attr('id');
		$('#orgTab li').eq(0).addClass("active");
			if(intialUrl != ""){
				$('#orgFrame').prop("src",intialUrl);
				$(intialUrl)
				intialUrl = "";
			}
	}); 
	
</script>
</head>
<body>

	<jsp:include page="googleAnalyticsbody.jsp" />

	<div class="wrap">
		<header>
			<a href="login"><img id="headerlogo" src="${sessionScope.logo}" /></a>
			<div id="userDivision">

				<c:if test="${isGolbalAdmin}">
					<a href="${properties['kibana.login.analitics.link']}"
						class="changeView"> Change View</a>
				</c:if>
				<div class="dropdown">
					<a class="dropdown-toggle" id="dropdownMenu1"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						<i class="fa fa-user"></i> <sec:authentication
							property="principal.firstName" /> <span class="caret"></span>
					</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a onclick="maskingForPage()" href="logout">log out</a></li>
					</ul>
				</div>

			</div>

			<div id="orgTab">
				<ul class="tab">
					<c:forEach items="${analyticsMap}" var="orgMap">
						<li id="${orgMap.description}"><a class="tablinks" href="#"
							id="${orgMap.configValue}"><c:out
									value="${orgMap.description}"></c:out></a></li>
						<c:set var="intialUrl" scope="page" value="${orgMap.configValue}" />
					</c:forEach>
				</ul>
			</div>
		</header>

		<iframe id="orgFrame" src="" width="100%" height="100%"></iframe>
	</div>
</body>
<script>
function getDashboardSource(orgName, analyticsMap){
	var src = "";
	for(var i = 0; i<analyticsMap.length; i ++){
		var org = analyticsMap[i].description;
		var value = analyticsMap[i].configValue;
		if(orgName == org){
			src = value;
			console.log(value);
			break;
		}
	}
	return src;
}
</script>
</html>
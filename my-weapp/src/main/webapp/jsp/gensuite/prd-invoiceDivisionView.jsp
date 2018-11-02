<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>


<jsp:include page="../googleAnalytics.jsp" />

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
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- Javascript Plugins -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
	defer type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<%--  <li><a href="homepage"><spring:message code="label.footer.home" /></a></li> --%>
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<li class="active"><spring:message code="label.brand.choose" /></li>
				</ul>
			</div>

			<div class="container-fluid content-wrapper">
				<!--- This is for Breadcrumbs -->

				<!--- This is for Page titles -->
				<%--  <h3><spring:message code="label.cart.place.order" /></h3>
                    <ul class="timeline">
                        <li class="indicator">
                            <span class="status start"><i class="fa fa-check"></i></span>
                            <span class="timeline-text"><spring:message code="label.brand.choose" /></span>
                        </li>
                        <li class="divider">
                            <span></span>
                        </li>
                        <li class="indicator">
                            <span class="status start"><i class="fa fa-check"></i></span>
                            <span class="timeline-text"><spring:message code="label.cart.place.order" /></span>
                        </li>
                        <li class="divider">
                            <span></span>
                        </li>
                        <li class="indicator">
                            <span class="status start"><i class="fa fa-check"></i></span>
                            <span class="timeline-text"><spring:message code="label.brand.review" /></span>
                        </li>
                        <li class="divider">
                            <span></span>
                        </li>
                        <li class="indicator">
                            <span class="status start"><i class="fa fa-check"></i></span>
                            <span class="timeline-text"><spring:message code="label.brand.confirm" /></span>
                        </li>
                    </ul> --%>
				<div class="choose-brand">
					<p id="orderBrandMessage"></p>
				</div>

				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings "
					id="brandBox"></div>
			</div>
			<!-- footer container -->
			<footer>
				<%@ include file="../../jsp/footer.jsp"%>
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
	</div>

	<script type="text/javascript">
        function maskingForPage(){
        	$('div.pageLoader').show(); 
        	
           }
        $(document).ready(function(){
        	
        	//Added by Krupa for Breadcrumbs Issue on 20-Oct-2015
   	 		var previousURL = '${previousURL}';
	        var oldURL = document.referrer;
	        var searchstring = "";
	        var searchType = "";
	        var itemNumber = "";
	        var isPromotions = "";
	        var promotionLink ="";
	        var isFromCartbc= false;
	        var cartLink="";
	        var breadcrumbsArray = '${breadcrumbsArray}';
	        var isFromCartBrand = '${isFromCartBrand}';
	        var isSearch = false;
	        var isQuoteOrder=false;
	        var isdirectflag = false;
	        var isFromCart = '${isFormCart}';
	        
        	var userId = $('#userId').val();
        	var authToken = $('#authToken').val();
        	
        	var brandsForCart = '${brandsForCart}';
        	
        	var brandsJson = JSON.parse(brandsForCart);
        	
        	console.log(brandsJson);
        	var string = "";
        	for(var i=0;i<brandsJson.length;i++){
        		var breadcrumbsPhrase = formBreadcrumbsArray(brandsJson[i].organizationName);
        		if(isFromCart=="true"){
        			
        			if(brandsJson[i].canPlaceOrderPOCC){
        				if(!brandsJson[i].createQuoteForNotMappedOrg){
        					
        					string += '<div class="horton col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings brand-template"> <a href="getinvoicelist?organizationId='+brandsJson[i].organizationId+'&isFromCartBrand=true&isDivisionMapped=false&breadcrumbsArray='+breadcrumbsPhrase+'"><div class="brand-container contact-capacity select_brand" id="capacity_brand" data-brand="Capacity"><i><img id="" src="${properties['docserver.url']}?media='+brandsJson[i].mediaId+'&thumbnail=true&user='+userId+'&token='+authToken+'" /></i></div></a></div>'
        				}
        				else{
        					string += '<div class="horton col-lg-4 col-md-3 col-sm-4 col-xs-12 column-paddings brand-template"> <a href="getinvoicelist?organizationId='+brandsJson[i].organizationId+'&isFromCartBrand=true&isDivisionMapped=true&breadcrumbsArray='+breadcrumbsPhrase+'"><div class="brand-container contact-capacity select_brand" id="capacity_brand" data-brand="Capacity"> <i><img id="" src="${properties['docserver.url']}?media='+brandsJson[i].mediaId+'&thumbnail=true&user='+userId+'&token='+authToken+'" /></i></div></a></div>'
        				}
        			}
        			else{
        				string += '<div class="horton col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings brand-template not-active" style="pointer-events:none;"> <a href="getinvoicelist?organizationId='+brandsJson[i].organizationId+'&isFromCartBrand=true&isDivisionMapped=true&breadcrumbsArray='+breadcrumbsPhrase+'"><div class="brand-container contact-capacity select_brand" id="capacity_brand" data-brand="Capacity"><i><img id="" src="${properties['docserver.url']}?media='+brandsJson[i].mediaId+'&thumbnail=true&user='+userId+'&token='+authToken+'" /></i> </div></a><p style="color: red;"><spring:message code="is.org.hasaccess" javaScriptEscape="true"/></p></div>'
        			}
        		}
        		else{
        			if(brandsJson[i].canPlaceOrderPOCC){
        				if(!brandsJson[i].createQuoteForNotMappedOrg){
        					string += '<div class="horton col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings brand-template">  <a href="getinvoicelist?organizationId='+brandsJson[i].organizationId+'&isFromOrderBrand=true&partId=&quantity=&isDivisionMapped=false&chooseBrand=true&breadcrumbsArray='+breadcrumbsPhrase+'" onclick="maskingForPage()"><div class="brand-container contact-capacity select_brand" id="capacity_brand" data-brand="Capacity"><i><img id="" src="${properties['docserver.url']}?media='+brandsJson[i].mediaId+'&thumbnail=true&user='+userId+'&token='+authToken+'" /></i></div></a> </div>'
        				}
        				else{
        					string += '<div class="horton col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings brand-template">  <a href="getinvoicelist?organizationId='+brandsJson[i].organizationId+'&isFromOrderBrand=true&partId=&quantity=&isDivisionMapped=true&chooseBrand=true&breadcrumbsArray='+breadcrumbsPhrase+'" onclick="maskingForPage()"><div class="brand-container contact-capacity select_brand" id="capacity_brand" data-brand="Capacity"><i><img id="" src="${properties['docserver.url']}?media='+brandsJson[i].mediaId+'&thumbnail=true&user='+userId+'&token='+authToken+'" /></i></div></a> </div>'
        				}
        			}
        			else{
        				string += '<div class="horton col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings brand-template not-active" style="pointer-events:none;">  <a href="getinvoicelist?organizationId='+brandsJson[i].organizationId+'&isFromOrderBrand=true&partId=&quantity=&isDivisionMapped=true&chooseBrand=true&breadcrumbsArray='+breadcrumbsPhrase+'" onclick="maskingForPage()"><div class="brand-container contact-capacity select_brand" id="capacity_brand" data-brand="Capacity"><i><img id="" src="${properties['docserver.url']}?media='+brandsJson[i].mediaId+'&thumbnail=true&user='+userId+'&token='+authToken+'" /></i></div></a> <p style="color: red;"><spring:message code="is.org.hasaccess" javaScriptEscape="true"/></p></div>'
        			}
        		}
        	}
        	$('#brandBox').append(string);

            // brand message
    		var msg = "<p class='text-left'><spring:message code='label.brand.viewinvoice' javaScriptEscape='true'/>";
            $('#orderBrandMessage').html("<p style='text-align:left;' >"+msg+ "</p>");         	        		
            
        });
        
     // added by krupa
        function formBreadcrumbsArray(orgname){
			   var itemCategory=$("#headerName").text();
			   var phrase="";
			   
			   $('.breadcrumb').find('li').each(function(){
			            // cache jquery var
			    var current = $(this);
			    var str = $(this).find('a').attr('href');
			    if(phrase=="" && str != null){
		             phrase = current.text()+"_"+str;
		        }else{
				    if(str != null){
				     phrase = phrase+","+current.text()+"_"+str;
				    }else{
				     var currentUrl = window.location.href.split("/")[window.location.href.split("/").length - 1];
				     phrase = phrase+","+ current.text()+"-"+orgname+"_"+currentUrl;
				    }
			    }
			  });
			   return phrase;
        };
        </script>
</body>

</html>
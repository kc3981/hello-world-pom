<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
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
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed  responsive-padding">
				<ul class="breadcrumb">
					<%--  <li><a href="homepage"><spring:message code="lable.home"/></a></li>
                    <li><a href="getquotes"><spring:message code="lable.quote.quotes" /></a></li> --%>
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<c:if test="${true == chooseBrand}">
						<li><a href="historicalorderbrand"><spring:message
									code="label.brand.choose" /> - ${orgName}</a></li>
					</c:if>
					<li><a href="#"><span id="breadcrumb-quoteorder"></span> <spring:message
								code="label.header.quote" /></a></li>
					<li class="active"><spring:message
							code="report.label.quotenumber" /> <span
						class="quoteNo"></span>
						<p class="quoteStatusMsg" style="display: none">
							<spring:message code="adapter.quote.exception" />
						</p></li>
				</ul>
			</div>
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-lg-sm col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="report.label.quotenumber" />
						<span class="quoteNo"></span>
					</h3>
					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.editquoteconfirm.edit.quote" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review.quote" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm.quote" /></span></li>
					</ul>
					<div class="confirm-quote-container">
						<p class="update-success" style="display: none;">
							<spring:message code="label.editquoteconfirm.edit.message" />
						</p>
						<p>
							<spring:message code="lable.quote.quoteNumber" />
							: <span class="green-text quoteNo"></span>
						</p>
						<p>
							<spring:message code="view.label.your.reference" />
							: <span class="green-text" id="ReferenceNo"></span>
						</p>
					</div>
					<sec:authorize access="hasRole('ROLE_ORDER')">
						<div>
							<a href="javascript:void(0);" class="blue-button not-active"
								id="place-order-click"><spring:message
									code="label.place.order" /></a>
							<p class="taxp flx-start">
								<spring:message code="message.quote.tax.disclaimer" />
							</p>
						</div>
					</sec:authorize>
				</div>
			</div>
			<!-- footer container -->
			<footer>
				<%@ include file="../../jsp/footer.jsp"%>
			</footer>
		</form>
	</div>
	<!-- Javascript Plugins -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>

	<script>
        var quoteJson;
        $(document).ready(function(){
        	 //$(".place-order-click").hide(); // success msg only based on the status id
        	  if (window.history && window.history.state) {

              	 /*  window.history.pushState('forward', null, './#forward'); */
              	  window.history.state('forward', null, 'homepage');
              	  $(window).on('popstate', function() {
              	   window.location.href = 'homepage';
              	  });

              	}
        	  	var quote = '${quoteConfirm}';
        	  	quoteJson = JSON.parse(quote);
        	  /**
            	Obtain Data values for Breadcrum 
            	**/
            	var today = new Date();
      			var fromDate=new Date();
      	    	var toDate=new Date();
      	    	var priorDate = new Date().setDate(today.getDate()-180);
      			var priorDateFormat = new Date(priorDate);
      	    	fromDate=dateFormat(priorDateFormat.toISOString().substring(0, 10));
      	    	toDate=dateFormat(today);
      			var cusNo= '${cusNo}';
            	var organizationId = quoteJson.organization.organizationId;
            	var orgName = '${orgName}';
            	var cusName = '${cusName}';
            	var chooseBrand = '${chooseBrand}';
            	if("${properties['user.application']}" == 'MILACRON'){
            		$("#breadcrumb-quoteorder").parent().attr("href","gethistoricalorders_breadCrum?customerReference="+cusNo+"&selectedOrganization="+organizationId+"&selectedOrgName="+orgName+"&fromDate="+fromDate+"&toDate="+toDate+"&cusName="+cusName+"&chooseBrand="+chooseBrand);
            	}else{
            		$("#breadcrumb-quoteorder").parent().attr("href","getquotes");
            	}
        	
      	  	if(quoteJson.hasPlaceOrderPOCC){
    	  		
	  			$('#place-order-click').removeClass('not-active');
	  		}
			console.log(quoteJson);
			$('.quoteNo').text(quoteJson.quoteNumber);
			$('#ReferenceNo').text(quoteJson.cartName==""?"-":quoteJson.cartName);
			var quoteStatus = quoteJson.cartStatusId;
			if(quoteStatus === 2 || quoteStatus === 4){
				 $('.quoteStatusMsg').show();
				   $(".place-order-click").hide();
				}else{
					$('.update-success').show();
				}
        });
        $('#place-order-click').on('click',function(){
        	 if("${properties['user.application']}" == 'MILACRON'){
      			window.location.href = 'quotetoorderinit?childCartId='+quoteJson.childCartId+'&isFromQuoteToOrder=true&organizationId='+quoteJson.organization.organizationId;      
     		}else{
        		window.location.href = 'quotetoorderinit?childCartId='+quoteJson.childCartId+'&isFromQuoteToOrder=true&organizationId='+${organizationId};
       		 }
	 })
        
        function dateFormat(d){
	        var date = new Date(d);
	        var dd = date.getDate();
	        var mm = date.getMonth()+1; //January is 0!
	        var yyyy = date.getFullYear();
	        if(dd<10) {
	            dd='0'+dd
	        } 
	        if(mm<10) {
	            mm='0'+mm
	        } 
	        today = mm+'/'+dd+'/'+yyyy;
	        return today;
	    }
        
        </script>

</body>

</html>
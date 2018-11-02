<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer></script>
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
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<!-- <li><a href="#">Shopping Cart</a></li> -->
					<li class="active"><spring:message code="lable.quote.quotes" /></li>
				</ul>
			</div>
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-lg-sm col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="label.brand.request.quote" />
						- <span id="brandName"></span>
					</h3>
					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.choose" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.create.quote" /></span></li>
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
							<spring:message
								code="label.createquotefromcartconfirm.create.success" />
						</p>
						<p>
							<spring:message code="lable.quote.quoteNumber" />
							: <span class="green-text" id="orderNo"></span>
						</p>
						<p class="quoteStatusMsg" style="display: none">
							<spring:message code="adapter.quote.exception" />
						</p>

						<%--  <p id="transactionId">Transaction ID: <span class="green-text" >${paymentresult}</span></p>     --%>
						<p>
							<spring:message code="view.label.your.reference" />
							: <span class="green-text" id="ReferenceNo"></span>
						</p>
					</div>
					<div class="column-paddings">
						<c:if test="${cartCountForMyQuote}">
							<a href="createquotefromcartbrand" class="green-button next"
								id="myQuotes"><spring:message
									code="label.createquotefromcartconfirm.next.quote" /></a>
						</c:if>
						<sec:authorize
							access="@customSpringSecurity.hasDivisionPermission('ROLE_ORDER',#organizationId)">
							<c:choose>
								<c:when
									test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
									<a href="javascript:void(0);" style="display: none;"
										class="blue-button" id="place-order-click"><spring:message
											code="label.place.order" /></a>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0);" class="blue-button not-active"
										id="place-order-click"><spring:message
											code="label.place.order" /></a>
								</c:otherwise>
							</c:choose>
						</sec:authorize>
						<sec:authorize
							access="@customSpringSecurity.hasDivisionPermission('ROLE_CART',#organizationId)">
							<c:choose>
								<c:when
									test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
									<a href="getquotes" class="blue-button" style="display: none;"><spring:message
											code="label.createquotefromcartconfirm.my.quote" /></a>
								</c:when>
								<c:otherwise>
									<a href="getquotes" class="blue-button"><spring:message
											code="label.createquotefromcartconfirm.my.quote" /></a>
								</c:otherwise>
							</c:choose>
						</sec:authorize>
						<p class="taxp flx-start">
							<spring:message code="message.quote.tax.disclaimer" />
						</p>
					</div>
				</div>
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
	<!-- Javascript Plugins -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script>
		var quoteJson;

        $(document).ready(function(){
            /* if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1){
                $('div.timeline').css({'margin':'33px 5% 7% 10%'});
              }*/
			  $('.pageLoader').show();
              
          	History.pushState({state: 2}, "${properties['global.page.title']}","./createquoteconfirm?state="+2);
			var manualStateChange = true;
			History.Adapter.bind(window,'statechange',function(){
            	manualStateChange = false;
            	 window.location.href = 'homepage';
            	var x = document.referrer.split("/");
            	if(x[x.length-1] == "createquotereview"){
            		/* document.forms[0].action="homepage";
            		document.forms[0].submit(); */
            		 window.location.href = 'homepage';
            	}
         	 
            });
			
         /*      if (window.history && window.history.state) {

              	 
            	   window.history.pushState('forward', null, './#forward'); 
            	   window.history.state('forward', null, 'homepage'); 

              	  $(window).on('popstate', function() {
              	   window.location.href = 'homepage';
              	  });

              	}*/ 
        		
              
        	var quote = '${quoteConfirm}';
      	  	quoteJson = JSON.parse(quote);
			console.log(quoteJson);
			if(quoteJson.hasPlaceOrderPOCC){
				$('#place-order-click').removeClass('not-active');
			}
			$('#orderNo').text(quoteJson.quoteNumber);
				
			$('#ReferenceNo').text(quoteJson.cartName==""?"":quoteJson.cartName);
			var quoteStatus = quoteJson.cartStatusId;
			if(quoteStatus === 2 || quoteStatus === 4){
				 $('.quoteStatusMsg').show();
				//$('.content-wrapper').attr("readonly", "readonly");
				 $("#place-order-click").hide();

			}else{
				 $('.update-success').show();
			}
			var myQuoteFlag = '${cartCountForMyQuote}';
			console.log(myQuoteFlag);
			if(myQuoteFlag=="false"){
				$('#myQuotes').hide();
			}
			$('#brandName').text(quoteJson.organization.organizationName)
            $('.pageLoader').hide();
        });
        
        $('#place-order-click').on('click',function(){
        	window.location.href = 'quotetoorderinit?childCartId='+quoteJson.childCartId+'&isFromQuoteToOrder=true'+'&organizationId='+${organizationId};
        })
        </script>
</body>

</html>
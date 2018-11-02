<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- link used for BU theme ended -->
<!-- build:css ../assets/globalstyles.min.css -->
<link rel="stylesheet" type="text/css" href="../css/theme.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/owl.carousel.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/less" href="../css/owl.theme.default.css?version=${properties['application.version']}">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>
<!-- /build -->
<!-- build:css ../assets/owl.carousel.min.css -->
<!-- /build -->
<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
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
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" ></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}"  defer ></script>
	<script	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer ></script>

<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="message.register.loading" />
			</h4>
			<div class="loader"></div>
		</div>
	</div>
	<!-- Main Wrapper having header,footer and content -->
	<div id="homepage-hldr" class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!--swetha changes starts here -->
			<input type="hidden" name="trackOrderURL" id="trackOrderURL"
				value="${properties['trackOrder.window.url']}" />
			<div class="modal fade track-order-form" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog modal-lg">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title" style="color: white;">Track Order</h4>
						</div>
						<div class="modal-body  confirm-modal-body">
							<div class="row">
								<div class="form-group">
									<label for="pwd">Source</label>
									<div>
										<input type='radio' name='choices' class="radio-option"
											title="Service Order#" value='A'
											onchange="rbtOrderNoOchnage();"> <span
											class="rd-label">Service Order#</span> <input type='radio'
											name='choices' class="radio-option" title="Online Order#"
											value='E' onchange="rbtOrderNoOchnage();"> <span
											class="rd-label">Online Order#</span> <input type='radio'
											name='choices' class="radio-option" title="Ticket#" value='Z'
											onchange="rbtOrderNoOchnage();"> <span
											class="rd-label">Ticket#</span>
									</div>
								</div>
								<div class="form-group">
									<span style="color: red">*</span>&nbsp;<label for="pwd"
										id="lblOrderNo">Service Order Number (Ex: 012345) </label> <input
										id="txtOrderNumber" type="text" class="form-control"
										tabindex="1" onkeypress="return isNumber(event,0);" /> <label
										id="lblmsg" style="color: red;"></label>
								</div>
								<div class="form-group">
									<a id="TrackOrder" href="#" class="btn btn-default"
										tabindex="2" onclick="return TrackOrderBL();">Track</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--swetha changes ends here -->
			<div id="home-featuted-banner">
				<div id="home-featuted-carousel" class="carousel slide">
					<div class="carousel-inner" role="listbox" id="carousel-div"></div>
					<ol class="carousel-indicators carousel_align"></ol>
					<!-- Controls -->
					<a class="carousel-control left hidden"
						href="#home-featuted-carousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
						style="display: none;"></span> <span class="sr-only"><spring:message
								code="label.homepage.previous" /></span>
					</a> <a class="carousel-control right hidden"
						href="#home-featuted-carousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
						style="display: none;"></span> <span class="sr-only"><spring:message
								code="label.homepage.next" /></span>
					</a>

				</div>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper p-t3">
				<div class="promotions" id="promotions">
					<div class="recommend-lbl">
						<h3 id="otherPromotions"></h3>
					</div>
					<div class="promotion-carousel"></div>
				</div>
			</div>

			<!-- custome confirm alert -->
			<div class="modal bs-example-modal-md" id="confirmationWindow"  data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title fgfg">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content">
								<spring:message code="label.bulkpartupload.replace.cart.message" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.export.no" /></a> <a
								class="col btn ok" href="javascript:;"><spring:message
									code="label.export.yes" /></a> <input type="hidden"
								id="confirmBoxType" />
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
	<!-- build:remove -->
	<%-- <script type="text/javascript" src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer  ></script> --%>
	 <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script	src="../js/jquery.tmpl.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<!-- /build -->
	<script	src="../js/owl.carousel.min.js?version=${properties['application.version']}" defer  type="text/javascript"></script>
	<script src="../js/gensuite-ui.js?${properties['application.version']}"	 type="text/javascript"></script>
	<script	src="../js/home.scripts.js?${properties['application.version']}" defer type="text/javascript"></script> 

	<!-- Templates -->
	<script id="promotiondeals" type="text/x-jquery-tmpl">
       <div class="item">
            <div id="overlay">
                <h4> ${'${'}promotionDesc}</h4>
            </div>
            <div class="item-wrapper">
              <a href="javascript:void(0);" onclick="navigate(${'${'}navigateType}, ${'${'}promotionId}, '${'${'}navigateUrl}')"> 
				<img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt='<spring:message code="label.homepage.promotion.tooltip"/>' title='<spring:message code="label.homepage.promotion.tooltip"/>'/>
				{{if !isActualImage}}
					<div class="waterMarkForPromotion">
						<span style="margin: 6px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
						<span style="font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
					</div>
				{{/if}}
				</a>
            </div>

        </div> 
    </script>

	<script id="promotiongeneral" type="text/x-jquery-tmpl">
		{{if count==1}}
    		 {{if  navigateType !=1}}
               <div class="item active" >
            	<a href="javascript:void(0);" onclick="navigate(${'${'}navigateType}, ${'${'}promotionId}, '${'${'}navigateUrl}')" class="productCatalogClick"> <img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="" title="" /></a>
        		</div>
                {{else}}
                  <div class="item active" >
            	  <img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="" title="" /> 
        	</div>
                {{/if}}
			<span class="countHide">${'${'}count=2}</span>
		{{else}}
			 {{if  navigateType !=1}}
             	<div class="item" >
            		<a href="javascript:void(0);" onclick="navigate(${'${'}navigateType}, ${'${'}promotionId}, '${'${'}navigateUrl}')" class="productCatalogClick"> <img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="" title="" /></a>
        		</div>
             {{else}}
               	<div class="item" >
            	  <img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="" title="" /> 
        		</div>
             {{/if}}
		{{/if}}
    </script>
	<!-- Templates END-->

	<script id="promotiongeneral" type="text/x-jquery-tmpl">
		{{if count==1}}
             <div class="item active" >
           		 <a href="javascript:void(0);" onclick="navigate(${'${'}navigateType}, ${'${'}promotionId}, '${'${'}navigateUrl}')" class="productCatalogClick"> <img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="" title="" /></a>
        	 </div>
			<span class="countHide">${'${'}count=2}</span>
		{{else}}
			<div class="item" >
            	<img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="" title="" />
        	</div>
		{{/if}}
    </script>
	<!-- Templates END-->

	<script type="text/javascript">
      var userid,authtoken, count,guestUserAccess,guestCartItemExist;
      var  myErrObj = new errnsp.errHandling.init();
      var privilege = "<spring:message code='guest.place.order.noprivilege' javaScriptEscape='true'/> ";
      var confirmation =" <spring:message code='view.label.items' javaScriptEscape='true'/>. <spring:message code='guest.place.order.mergecart.confirmation' javaScriptEscape='true'/> ";
      var msgForGuest = "<spring:message code='guest.place.order.mergecart.confirmation' javaScriptEscape='true'/>";
      guestUserAccess = "${guestUserAccess}";
	  guestCartItemExist = "${sessionScope['scopedTarget.genericUserProperties'].isGuestCartItemExist}";
		if(guestCartItemExist!="" && guestCartItemExist=="true" && guestUserAccess != "true"){
			var notPrivilegeItemsGuestToLogin = "${sessionScope['scopedTarget.genericUserProperties'].notPrivilegeItemsGuestToLogin}";
		}
		
		/* $(window).load(function() {
			setTimeout(function(){
				$('.pageLoader').hide();
			},500);
			 
		});
		$(document).ready(function() {
		      $('.pageLoader').show();
		}); */
    </script>

	<script
		src="../js/homepage.js?version${properties['application.version']}" defer  
		type="text/javascript"></script>
</body>
</html>
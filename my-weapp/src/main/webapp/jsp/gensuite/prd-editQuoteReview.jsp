
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!--  <link rel="shortcut icon" href="images/favicon.ico">
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
	<script type= "text/javascript" src = "../js/dealer.scripts.js" ></script>
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
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li><a href="getquotes"><spring:message
								code="lable.quote.quotes" /></a></li>
					<li class="active"><spring:message
							code="label.brand.request.quote" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="label.brand.request.quote" />
						<span class="qNumber"></span>
					</h3>
					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.editquoteconfirm.edit.quote" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review.quote" /></span></li>
						<li class="divider"><span></span></li>
						<li class="indicator"><span class="status start"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm.quote" /></span></li>
					</ul>

					<div class="form-inline section">

						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.by" />
								:
							</h5>
							<p class="inline" id="quotedBy"></p>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<h5 class="inline">
								<spring:message code="view.label.quoted.date" />
								:
							</h5>
							<p class="inline">
								<fmt:formatDate pattern="${dateformat}" value="${quoteDate}" />
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="section">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
							<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline" id="customer_dealer_name">
									<spring:message code="view.label.customer" />
									
								</h5>:
								<p class="inline" id="customerDetails"></p>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h5 class="inline">
									<spring:message code="view.label.your.reference" />
									:
								</h5>
								<p class="inline" id="referenceNo"></p>
							</div>

							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 column-paddings">
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12" id="billToReview">
									<div class="">
										<h5 class="inline">
											<spring:message code="view.label.bill.to" />
											:
										</h5>
										<!-- <p class="inline" id="bill-to"></p> -->
									</div>
									<div class="clearfix"></div>
									<div class="address-holder">
										<p id="bill-to-addr"></p>
									</div>
								</div>
								<div class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="">
										<h5 class="inline">
											<spring:message code="view.label.ship.to" />
											:
										</h5>
										<!-- <p class="inline" id="ship-to"></p> -->
									</div>
									<div class="clearfix"></div>
									<div class="address-holder">
										<p id="ship-to-addr"></p>
									</div>
								</div>
							</div>


							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
								<div
									class="form-horizontal col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_PAYMENTTERMS',#organizationId)">
										<h5 class="inline">
											<spring:message code="view.label.payment.terms" />
											:
										</h5>
										<p class="inline" id="carrierBillingOption"></p>
										<br>
									</sec:authorize>
									<h5 class="inline">
										<spring:message code="label.quote.order.shipping.method" />
										:
									</h5>
									<p class="inline" id="carrierId"></p>
									<br>
									<c:if
										test="${not empty transportApplicable && transportApplicable}">
										<h5 class="inline">
											<spring:message code="label.quote.order.transport.code" />
											:
										</h5>
										<p class="inline" id="transportModeId"></p>
										<br>
									</c:if>
									<sec:authorize
										access="@customSpringSecurity.hasDivisionPermission('ROLE_CHANGE_SALES_REP',#organizationId)">
										<h5 class="inline saleRepApplicable">
											<spring:message code="label.quote.order.sales.rep" />
											:
										</h5>
										<p class="inline" id="salesRepDetails"></p>
										<br />
									</sec:authorize>

									<h5 class="inline">
										<spring:message code="view.label.shipping.instructions" />
										:
									</h5>
									<p class="inline" id="shippingInst"></p>
								</div>
							</div>

							<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="endCustomer">
									<h5 class="inline">My Customer :</h5>
	                                <p class="inline endCustomerName" id="endCustomerName"></p><br> 
	                                     
                        </div> -->

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
									<h5 class="inline">
										<spring:message code="view.label.name" />
										:
									</h5>
									<p class="inline" id="contactName"></p>
								</div>
								<div
									class="col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
									<h5 class="inline">
										<spring:message code="view.label.email" />
										:
									</h5>
									<p class="inline" id="contactEmail"></p>
								</div>
								<!-- SUPPORT-MIL-223-170216 -->
								<div
									class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings"
									id="salesAreaDiv">
									<h5 class="inline">
										<spring:message code="label.sales.area" />
										:
									</h5>
									<p class="inline" id="salesArea"></p>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<c:out value="${renderHtml}" escapeXml="false" />


					<div class="">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<div id="cart-items-hldr"
								class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

							</div>

						</div>
						<div class="clearfix"></div>
						<c:if test="${properties['comments.section.required']==true}">
							<div class="section">
								<div class="clearfix">
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<h5 class="inline">
											<spring:message code="label.quote.order.comments" />
											:
										</h5>
										<p id="comments" class="inline"></p>
									</div>
									<c:if test="${properties['file.attachment.required']==true}">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 attachment">
											<h5>
												<spring:message code="view.label.attached.file" />
												:
											</h5>
											<p id="attachedFile"></p>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>

					<%-- <div class="section"  id = "SALES_REP_SECTION">
                    <div class="clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="inline"><spring:message code="view.label.sales.rep" /> : </h5>
                        <p class="inline" id="salesRepDetails"></p>  
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="inline"><spring:message code="view.label.auto.apply.charges" /> : </h5>
                        <p class="inline" id="autoApply"></p>  
                    </div>
                    </div>
                </div> --%>

					<div class="quote-total">
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">
								<spring:message code="label.quote.order.item.total.am" />
								(<span id="count"></span>
								<spring:message code="label.items" />
								:)
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4" id="subTotal"></h5>
						</div>
						<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">Handling/Labor</p>
                        <p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">$98.00 </p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
                        <p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">Minimum Order Charge</p>
                        <p class="col-lg-2 col-md-2 col-sm-2 col-xs-4">$28.00</p>
                    </div> -->
						<div id="chargesContainer"></div>

						<div id="additionalCharges" style="display: none">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-4 col-xs-8">
								<spring:message code="label.quote.sales.tax.am" />

							</h5>
							<h5
								class="col-lg-2 col-md-2 col-sm-4 col-xs-4 text-right padd-right40"
								id="taxVal"></h5>
						</div>
						<p class="alert-message pull-right" style="display: none;">
							<spring:message code="label.total.item.cart.msg" />
						</p>
						<div class="final-total col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h5
								class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8 font20">
								<spring:message code="view.label.quote.total" />
							</h5>
							<h5 class="col-lg-2 col-md-2 col-sm-2 col-xs-4" id="totalAmount"></h5>
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
							<a href="javascript:void(0);" class="pull-left green-button prev"
								id="edit-quote"><spring:message
									code="label.createorderFromcartreview.edit" /></a> <a
								href="javascript:void(0);" id="edit-quote-confirm" tabindex="-1"
								class="pull-right green-button next"><spring:message
									code="label.brand.confirm.quote" /></a>
							<p class="taxp">
								<spring:message code="message.quote.tax.disclaimer" />
							</p>
						</div>
						<div class="clearfix"></div>
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
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		 type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>

	<script id="createQuoteTemplate" type="text/x-jquery-tmpl">
		{{if active}}
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details text-center-xs">
                                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
									{{if mediaId!=0}}
                               			<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="catalog-img"></a>
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12 xs_img_center pt-xs-10">
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="search.part.partnumber"/>: ${'${'}partNumber}</a></h4>
                                    <%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
									<c:if test="${properties['display.legacy.part']}">
										<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div> 
									</c:if>
									<div><strong>${'${'}partCommercialDescription}</strong></div>
									<sec:authorize access="hasRole('ROLE_ENGG_DESC')">
                                    	<div>${'${'}partEngineeringDescription}</div>
									</sec:authorize>
                                    <div>${'${'}organizationName}</div>
                                    <div><strong>${'${'}inventoryMessage}</strong></div>
									<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p> 
                                   <c:if test="${properties['item.comments.section.required']==true}">
				    <div class="product-comments item-comments" comment-itemId="${'${'}partId}"></c:if>
                                        <h5><spring:message code="view.label.comments"/>: </h5>
                                        <p>${'${'}comments}</p>
                                    </div>
                                </div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 xs_img_center">
								<div class="spinner-control">
                                      <input type="text" class="total-items total-items-review output" value="${'${'}quantity}" style="width:40px;text-align:center" readonly>
                                      <span class="unit">${'${'}uom}</span> 
                                 </div>
								</div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 xs_img_center">
									{{if priceMSRPStr !== "-1" && priceMSRPStr !== priceStr}}
                                    	<div><spring:message code="label.msrp"/>: <span>${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
									{{/if}}
									{{if priceStr !== "-1"}}
                                   	 <div><strong><spring:message code="label.your.price"/>: ${'${'}priceStr} ${'${'}currencyCode}</strong></div>
									{{/if}}
									{{if savedPriceStr !== "-1" && priceMSRPStr !== priceStr}}
                                    	<div><spring:message code="label.save"/>: ${'${'}savedPriceStr} ${'${'}currencyCode} <spring:message code="lable.item.each" /></div>
									{{/if}}
									{{if itemTotalAmountStr !== "-1"}}
                                  	  <div><h5><spring:message code="label.item.total"/>: ${'${'}itemTotalAmountStr} ${'${'}currencyCode}</h5></div>
									{{else}}
										{{if itemTotalMSRPStr !== "-1"}}
                                  	  		<div><h5><spring:message code="label.item.total"/>: ${'${'}itemTotalMSRPStr} ${'${'}currencyCode}</h5></div>
										{{/if}}
									{{/if}}
                                </div>
                            </div>
			{{/if}}
    </script>
	<script id="chargesTemplate" type="text/x-jquery-tmpl">
		{{if active}}
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings" >
				<p class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-6 col-sm-4 col-sm-offset-6 col-xs-8">${'${'}name}</p>
				<p class="col-lg-2 col-md-2 col-sm-2 col-xs-4 " data-chargeId="${'${'}chargeId}">${'${'}overriddenAmountStr} ${'${'}overriddenCurrencyCode} </p>
			</div>
	
		{{/if}}
		
	</script>

	<script>
     var userid,authtoken;
     var defaultPartUOM = '${properties["default.part.uom"]}';
     var defaultPartOrderMultiple = ${properties['default.part.ordermultiple']};
     var ordMult;
     var valueHideOrShow;
     var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
     
    $(document).ready(function(){
        /*
         if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1){
            $('div.timeline').css({'margin':'33px 5% 7% 10%'});
          }*/
			$("#edit-quote-confirm").click(function(){
				$('div.pageLoader').show(); 
				$("#edit-quote-confirm").addClass('not-active');
	            $("#edit-quote-confirm").blur();    //INC-2424 ADDED BY ANIKET : TO PREVENT DUPLICATE ORDER CREATION : REVIEWED BY JK
				window.location.href="editquoteconfirm";
			});
          
          
           userid=$('#userId').val();
  		   authtoken = $('#authToken').val();
      	   var quote = '${quoteReview}';
           var quoteJson = JSON.parse(quote);
           console.log(quoteJson.cartItemList);
           var locale=${locale};
         
         if (window.history && window.history.state) {

         	  window.history.state('forward', null, 'editquoteinit?childCartId='+quoteJson.childCartId+'&isFromQuoteList=false');

         	  $(window).on('popstate', function() {
         		 window.location.href = 'editquoteinit?childCartId='+quoteJson.childCartId+'&isFromQuoteList=false';
         	  });

         }
          
    	
      	
      	 $("#createQuoteTemplate").tmpl(quoteJson.cartItemList).appendTo("#cart-items-hldr");
         
      	 var count = 0;
         $.each(quoteJson.cartItemList, function (key, data) {
                       if(data.active){
             	count++;
             }
         })
      	 
      	 $('#count').text(count);
         
         if(quoteJson.subtotalAmountStr!=="-1")
         	$('#subTotal').text(quoteJson.subtotalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
		 
		 console.log(quoteJson);
		 if((typeof quoteJson.chargeList)!="undefined"){
			 $("#chargesContainer").html('');
	         $("#chargesTemplate").tmpl(quoteJson.chargeList).appendTo("#chargesContainer");
		 }
		
		setDataForReview(quoteJson);
    	$('.total-items-review').prop('disabled','true');
    	if(typeof quoteJson.quotedBy!="undefined"){
    		var salesRep = quoteJson.quotedBy.userId + " - " + quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName;
    		$('#salesRepDetails').text(salesRep);
        	$('#quotedBy').text(quoteJson.quotedBy.firstName + " " + quoteJson.quotedBy.lastName);
    	}
    	else{
    		$('#quotedBy').text(quoteJson.contact.fullName);
    	}
    		
    	//$('#quotedDate').text(quoteJson.quoteCreatedDate);
    	if(quoteJson.carrierSelect == ""){
    		$('#salesRepDetails').hide().siblings('h5.saleRepApplicable').hide();
    	}
    	
    	$('#comments').text(quoteJson.comments==""?"-":quoteJson.comments);
    	$('#autoApply').text(quoteJson.autoApplyCharges?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
    	if(quoteJson.totalAmountStr!=="-1")
    		$('#totalAmount').text(quoteJson.totalAmountStr+" "+(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode));
    	
    	if(quoteJson.isGuestChildCart){
    		$('#SALES_REP_SECTION').hide();
    	}
    	
    	var fields = JSON.parse('${hideOrShowFields}');
    	valueHideOrShow = ${hideOrShowFields};
    	
    	if (valueHideOrShow["show.order.multiples"] == "TRUE")
    	{ 
    	 	$(".order-multiples-lbl").show();
        }
    	else
    	{
    		$(".order-multiples-lbl").hide();
        }
    	
        if(typeof quoteJson.taxAmount!="undefined" &&  fields["show.sales.tax"] == "TRUE" && quoteJson.taxAmountStr != "-1" ){		      	  
 				$('#additionalCharges').show();
			    $('#taxVal').text(quoteJson.taxAmountStr+ " ");
			   	$('#taxVal').append(typeof quoteJson.currencyCode=="undefined"?"":quoteJson.currencyCode);
		}
    	
    	$('#edit-quote').on('click', function(){
    		window.location.href = 'editquoteinit?childCartId='+quoteJson.childCartId+'&isFromQuoteList=false';
    	})
    	hideOrShowFields('${hideOrShowFields}'); //hide or show fields based on organization id
    });
	
	function setDataForReview(quoteJson){
		$('#customerDetails').text(((typeof quoteJson.isGuestChildCart!="undefined") && quoteJson.isGuestChildCart)?quoteJson.customerName : quoteJson.customer.customerReference+" - "+quoteJson.customer.customerName);
		$('#referenceNo').text(quoteJson.cartName==""?"-":quoteJson.cartName);
		$('#bill-to').text(((typeof quoteJson.billToAddress.addressReference=="undefined"))?quoteJson.billToAddress.addressName:quoteJson.billToAddress.addressReference+" - "+quoteJson.billToAddress.addressName);
		$('#ship-to').text(((typeof quoteJson.shipToAddress.addressReference=="undefined"))?quoteJson.shipToAddress.addressName:quoteJson.shipToAddress.addressReference+" - "+quoteJson.shipToAddress.addressName);
		$('#carrierId').text(typeof quoteJson.carrier=="undefined"?"-":quoteJson.carrier.carrierDescription);
		if(typeof quoteJson.carrierBillingOption !="undefined" && quoteJson.carrierBillingOption.description == "Prepay and Add"){
			$('#carrierId').hide();
			$('#carrierId').prev().hide();
		}
		var userApplication = $('#userApplication').val();
  	 	
  	 	if(userApplication == "REVFIRE"){
  	 		$('#carrierBillingOption').hide();
			$('#carrierBillingOption').prev().hide();
  	 	}
		$('#transportModeId').text(typeof quoteJson.transportMode=="undefined"?"-":quoteJson.transportMode.transportDescription);
		$('#carrierBillingOption').text(typeof quoteJson.carrierBillingOption=="undefined"?"-":quoteJson.carrierBillingOption.description);
		$('#shippingInst').text(quoteJson.deliveryInstructions1==""?"-":quoteJson.deliveryInstructions1);
		$('#contactName').text(((quoteJson.contact.fullName=="") || (quoteJson.contact.fullName=="undefined"))?"-":quoteJson.contact.fullName);
		$('#contactEmail').text(((quoteJson.contact.primaryEmail=="") || (quoteJson.contact.primaryEmail=="undefined"))?"-":quoteJson.contact.primaryEmail);
		$('#serialNumber').text(quoteJson.serialNumber==""?"-":quoteJson.serialNumber);
		$('#partialShipment').text(quoteJson.partialShipment?"<spring:message code='label.export.no' javaScriptEscape='true'/>":"<spring:message code='label.export.yes' javaScriptEscape='true'/>");
		$('#shipToday').text(quoteJson.isSameDayShipping?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		$('#unitDown').text(quoteJson.machineBreakdown?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		
		if(isDealerUser=='true'){
			  populateDealerInfoAndShipToAddress(quoteJson);
			 $('#carrierId').hide();
			$('#carrierId').prev().hide();
		 }else{
		$('#bill-to-addr').html(setAddress(quoteJson.billToAddress));
		$('#ship-to-addr').html(setAddress(quoteJson.shipToAddress));
		 }
		//Commented to not to show attachment
		$('#attachedFile').html(typeof quoteJson.attachedFileName=="undefined"?"-":quoteJson.attachedFileName);
		$('.qNumber').text(quoteJson.quoteNumber);
		//SUPPORT-MIL-223-170216
		$('#salesArea').text(typeof quoteJson.customerSalesAreaCurrencyVo=="undefined"? "-" :quoteJson.customerSalesAreaCurrencyVo.description);
		
		//consignmentOrderStatusInViews(quoteJson.customer.customerTypeId);
		$('#consignment-order').text(quoteJson.consignmentOrder?"<spring:message code='label.export.yes' javaScriptEscape='true'/>":"<spring:message code='label.export.no' javaScriptEscape='true'/>");
		
	}
	
	function setAddress(obj){
       	    var string="";
       	    string+= ((obj.addressName ===null || typeof obj.addressName==="undefined" || obj.addressName.trim() === "" )?"":obj.addressName+"<br/>");
  			string+=((obj.addressLine1===null || typeof obj.addressLine1==="undefined" || obj.addressLine1.trim()===""  )?"":obj.addressLine1+"<br/>");
  			string+=((obj.addressLine2===null || typeof obj.addressLine2==="undefined" || obj.addressLine2.trim()==="" )?"":obj.addressLine2+"<br/>");
  			string+=((obj.addressLine3===null || typeof obj.addressLine3==="undefined" || obj.addressLine3.trim()==="" )?"":obj.addressLine3+"<br/>");
  			string+=((obj.addressLine4===null || typeof obj.addressLine4==="undefined" || obj.addressLine4.trim()==="" )?"":obj.addressLine4+"<br/>");
  			string+=((obj.addressCity===null || typeof obj.addressCity==="undefined" || obj.addressCity.trim()==="" )?"":obj.addressCity+"<br/>");
  			string+=((obj.addressState===null || typeof obj.addressState==="undefined" || obj.addressState.trim()==="" )?"":obj.addressState+" ");
  			string+=((obj.addressZipCode===null || typeof obj.addressZipCode==="undefined" ||obj.addressZipCode.trim()=== ""  )?"":obj.addressZipCode);
  			if((obj.addressZipCode===null || typeof obj.addressZipCode==="undefined" ||obj.addressZipCode.trim()=== ""  ))
  				string = string.trim();
  			
  			if((obj.addressState===null || typeof obj.addressState==="undefined" || obj.addressState.trim()==="" ) && 
  					(obj.addressZipCode===null || typeof obj.addressZipCode==="undefined" ||obj.addressZipCode.trim()=== ""  ))
  				string += obj.addressCountry;
			else
  				string+=((obj.addressCountry===null || typeof obj.addressCountry==="undefined" || obj.addressCountry.trim()==="" )?"":", "+obj.addressCountry);
       	    return string; 
      }

	// full item details page redirect onclick line items
	function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   		window.open('getfullitemdetailsUsingCartId?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId+"&cartItemId="+cartItemId,'_blank');
     }
    
	
    </script>
</body>
</html>
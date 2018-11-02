<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

 <script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>

<!-- Google Tag Manager  -->
<jsp:include page="gtm.jsp" />


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

<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>

</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
	<!-- Changes made during Merge for GSP-952	 -->
		<form id='frmCheckOutwithorder' name='frmCheckOutwithorder' action=""
			method='post'>
			<input type='hidden' id="organizationCode" name='OrganizationCode'
				value="" /> <input type='hidden' id="userName" name='UserName'
				value="" /> <input type='hidden' id="addressLine1"
				name='AddressLine1' value="" /> <input type='hidden'
				id="addressLine2" name='AddressLine2' value="" /> <input
				type='hidden' id="addressLine3" name='AddressLine3' value="" /> <input
				type='hidden' id="addressLine4" name='AddressLine4' value="" /> <input
				type='hidden' id="city" name='City' value="" /> <input
				type='hidden' id="country" name='Country' value="" /> <input
				type='hidden' id="fax" name='Fax' value="" /> <input type='hidden'
				id="name" name='Name' value="" /> <input type='hidden' id="phone"
				name='Phone' value="" /> <input type='hidden' id="postalCode"
				name='PostalCode' value="" /> <input type='hidden' id="state"
				name='State' value="" /> <input type='hidden' id="orderCompany"
				name='OrderCompany' value="" /> <input type='hidden'
				id="orderNumber" name='OrderNumber' value="" /> <input
				type='hidden' id="orderType" name='OrderType' value="" /> <input
				type='hidden' id="amount" name='Amount' value="" /> <input
				type='hidden' id="currency" name='Currency' value="" /> <input
				type='hidden' id="isguestuser" name='IsGuestUser' value="" /> <input
				type='hidden' name='Callback'
				value='${properties["focus.callback"]}' />
		</form>
		<!--Payment Type 4 request form //Smarter Commerce - MIL-201-->
		<form id='frmCheckOutwithquote' name='frmCheckOutwithquote' action=""
			method='post'>
			<input type='hidden' id="orgCode" name='OrganizationCode' value="" />
			<input type='hidden' id="usrName" name='UserName' value="" /> <input
				type='hidden' id="addLine1" name='AddressLine1' value="" /> <input
				type='hidden' id="addLine2" name='AddressLine2' value="" /> <input
				type='hidden' id="addLine3" name='AddressLine3' value="" /> <input
				type='hidden' id="addLine4" name='AddressLine4' value="" /> <input
				type='hidden' id="city1" name='City' value="" /> <input
				type='hidden' id="country1" name='Country' value="" /> <input
				type='hidden' id="fax1" name='Fax' value="" /> <input type='hidden'
				id="name1" name='Name' value="" /> <input type='hidden' id="phone1"
				name='Phone' value="" /> <input type='hidden' id="postalCode1"
				name='PostalCode' value="" /> <input type='hidden' id="state1"
				name='State' value="" /> <input type='hidden' id="carrierCode"
				name='CarrierCode' value="" /> <input type='hidden' id="company1"
				name='Company' value="" /> <input type='hidden' id="customerPO"
				name='CustomerPO' value="" /> <input type='hidden' id="quoteNumber"
				name='QuoteNumber' value="" /> <input type='hidden' id="amount1"
				name='Amount' value="" /> <input type='hidden' id="currency1"
				name='Currency' value="" /> <input type='hidden' id="isguestuser1"
				name='IsGuestUser' value="" /> <input type='hidden' name='Callback'
				value='${properties["focus.callback"]}' />
		</form>
		<!-- End of Changes made during Merge for GSP-952	 -->
		<!--Payment Type 3 request form-->
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<!--  <li><a href="getshoppingdetails">Shopping Cart</a></li> -->
					<li class="active"><spring:message code="lable.order.orders" /></li>
				</ul>
			</div>
			<div class="container-fluid content-wrapper">
				<div class="col-lg-12 col-md-12 col-lg-12 col-xs-12 column-paddings">

					<h3>
						<spring:message code="label.place.order" />
						- <span id="brandName"></span>
					</h3>

					<ul class="timeline">
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.choose" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.place.order" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.review" /></span></li>
						<li class="divider"><span class="success"></span></li>
						<li class="indicator"><span class="status success"><i
								class="fa fa-check"></i></span> <span class="timeline-text"><spring:message
									code="label.brand.confirm" /></span></li>
					</ul>

					<div class="confirm-quote-container">
						<p id="successMessage" class="update-success" style="display: none;">
							<spring:message
								code="label.createorderfromcartconfirm.order.success" />
						</p>
						<p class="order-created-success" style="display: none;">
							<spring:message
								code="label.createorderfromcartconfirm.processpayment" />
						</p>
						<p class="payment-failure" style="display: none;">
							<spring:message
								code="label.createorderfromcartconfirm.payment.failure" />
						</p>
						<p class="processorder-faliure" style="display: none;">
							<spring:message
								code="label.createorderfromcartconfirm.processorder.faliure" />
						</p>
						<p class="order_number">
							<spring:message code="lable.order.orderNumber" />
							: <span class="green-text" id="orderNo"></span>
						</p>
						<p class="po_number">
							<spring:message code="label.quote.order.ponumber" />
							: <span class="green-text" id="poNumber"></span>
						</p>
						<p class="quoteStatusMsg" style="display: none">
							<spring:message code="adapter.order.exception" />
						</p>
						<p id="transactionId">
							<spring:message
								code="label.createorderfromcartconfirm.transactionid" />
							: <span class="green-text">${paymentresult}</span>
						</p>
						<p>
							<spring:message code="view.label.your.reference" />
							: <span class="green-text" id="ReferenceNo"></span>
						</p>
					</div>
					<div class="column-paddings">
						<!--                     GS-3236-Bug Fix on label Flicker -->
						<c:if
							test="${not empty  cartCountForMyOrder && cartCountForMyOrder}">
							<a href="createorderfromcartbrand" class="green-button next"
								id="next-order"><spring:message
									code="label.createorderfromcartconfirm.next.order" /></a>
						</c:if>
						<%-- <sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER')"> --%>
						<sec:authorize
							access="@customSpringSecurity.hasDivisionPermission('ROLE_HISTORICAL_ORDER',#organizationId)">
							<c:choose>
								<c:when
									test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
									<a href="javascript:gethistoricalorders_breadCrum();"
										class="blue-button" style="display: none;"><spring:message
											code="view.button.my.orders" /></a>
								</c:when>
								<c:when test="${isGuestUser}">
									<a href="javascript:gethistoricalorders_breadCrum();"
										class="blue-button" style="display: none;"><spring:message
											code="view.button.my.orders" /></a>
								</c:when>
								<c:when test="${properties['user.application']=='HILLPHOENIX'}">
										<a href="getorders" class="blue-button"><spring:message
												code="view.button.my.orders" /></a>
								</c:when>
								<c:otherwise>
									<a href="javascript:gethistoricalorders_breadCrum();"
											class="blue-button"><spring:message
												code="view.button.my.orders" /></a>
								</c:otherwise>
							</c:choose>
						</sec:authorize>
						<a href="#" class="green-button next" id="checkout-button"
							style="display: none;"><spring:message
								code="label.gensuitecreditcard.popup.checkoutbutton" /></a>
						<p class="taxp flx-start">
							<spring:message code="message.quote.tax.disclaimer" />
						</p>
					</div>
				</div>
			</div>

			<!-- gensuite_checkout_popup orderdetails_hldr  -->
			<div class="modal checkout_popup" id="gensuite_checkout_popup" data-backdrop="static" data-keyboard="false">
				<div class="vertical-alignment-helper">
					<div class="modal-dialog vertical-align-center">
						<div class="modal-content custom-modal-content">
							<div class="modal-header custom-modal-header">
								<button type="button" class="close custom-close"
									aria-hidden="true">
									<i class="fa fa-times"></i>
								</button>
								<h4 class="modal-title custom-modal-title">
									<spring:message code="label.gensuitecreditcard.popup" />
								</h4>
							</div>
							<div class="modal-body custom-modal-body">
								<!-- Content for the dialog / modal goes here. -->
								<div class="orderdetails_hldr">
									<div class="row">
										<div class="col-md-3">
											<spring:message code="label.gensuitecreditcard.popup.card" />
										</div>
										<div class="col-md-8">
											<select class="form-control checkout_selectcard">
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer custom-modal-footer">
								<a class="col btn"  href="javascript:void(0)"  id="Checkout_btn" >
									<spring:message code="label.gensuitecreditcard.popup.continuebutton" />
								</a>
							</div>				
						</div>
					</div>
				</div>
			</div>
			<!-- footer container -->
			<footer>
				<%@ include file="../../jsp/footer.jsp"%>
			</footer>
		</form>

		<form action="gethistoricalorders_breadCrum" method="GET"
			id="get-historicalorders" hidden>
			<input type="text" name="customerReference"
				id="get-customerReference" /> <input type="text"
				name="selectedOrganization" id="get-selectedOrganization" /> <input
				type="text" name="selectedOrgName" id="get-selectedOrgName" /> <input
				type="text" name="fromDate" id="get-fromDate" /> <input type="text"
				name="toDate" id="get-toDate" /> <input type="text" name="cusName"
				id="get-cusName" /> <input type="text" name="chooseBrand"
				id="get-chooseBrand" />
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
	<script
		src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js" defer></script>
	<script>
		var previousUrl = document.referrer;
		//INC-2266 added by Aniket : Prevent Duplicate Orders: Reviewed by Krupa
		var paymentFlag = true;
		var isOrderNumberVisible = '${isOrderNumberVisible}';
        $(function(){
        	 $('.update-success').hide();
        	 $('.quoteStatusMsg').hide();
        	 $('.payment-failure').hide();
        	 $('.processorder-faliure').hide();
        	 $('.order-created-success').hide();
        	 $('.po_number').hide();
        });
        
	$(document).ready(function(e){
				
				History.pushState({state: 2},"${properties['global.page.title']}","./createorderconfirm?state="+2);
				var manualStateChange = true;
				History.Adapter.bind(window,'statechange',function(){
	            	manualStateChange = false;
	            	//alert("dfsaf");
	            	var x = previousUrl.split("/");
	            	if(x[x.length-1] == "createorderreview"){
	            		/* document.forms[0].action="homepage";
	            		document.forms[0].submit(); */
	            		 window.location.href = 'homepage';
	            	}else{
	            		 window.location.href = previousUrl;
	            	}
         	 
            });
			//e.preventDefault();
			return false;
		});
        
        window.onload = function(){
        	var quote = '${quoteConfirm}';
      	  	var quoteJson = JSON.parse(quote);
      	  	var txnStatus='${txnStatus}';
      	    var isSavedCardTxn='${isSavedCardTxn}';
      		var isProcessOrderSuccessful='${isProcessOrderSuccessful}';
			console.log(quoteJson);
			console.log("QuoteNumber--"+quoteJson.orderNumber);
			var orderStatus = quoteJson.cartStatusId;
			$('#orderNo').text(quoteJson.orderNumber);
			$('#poNumber').text(quoteJson.customerPurchaseOrderNumber);
			$('#ReferenceNo').text(quoteJson.cartName==""?"":quoteJson.cartName);
			if(quoteJson.isReturnOrder){
				$('.timeline').hide();
				$('#successMessage').text('<spring:message code="lable.return.success" />');
			}else{
				$('.timeline').show();
			}
			
			var amount = 0;
			if(isGuestUser=="true")
				amount=quoteJson.totalMSRP;
			else
				amount=quoteJson.totalAmount;
			
			if(orderStatus === 13 ){
				 $('.quoteStatusMsg').show();
			}else{
				 /*For PO and Credit Card*/
				 if(quoteJson.paymentMethod.paymentMethodId==1 ||quoteJson.paymentMethod.paymentMethodId==2){
					if(orderStatus === 12){
						 $('.update-success').show();
					}
				}
				else{
				       /*For smarter commerce credit card*/
						if(orderStatus === 11 ||orderStatus === 3 || quoteJson.isReturnOrder){
							if(txnStatus){
								$('.order-created-success').hide();
								$('.payment-failure').show();
								$("#checkout-button").show();
							}else if(isProcessOrderSuccessful){
								$('.order-created-success').hide();
								$('.processorder-faliure').show();
								$("#checkout-button").show();
							}
						}
						if((orderStatus === 11 || orderStatus === 3 || quoteJson.isReturnOrder) && txnStatus==''&& isProcessOrderSuccessful==''){
							 $('.order-created-success').show();
							 $("#checkout-button").show();
						}else if(orderStatus === 12){
							 $('.update-success').show();
							 $("#checkout-button").hide();
						}
				               
				  }
				 if(((isOrderNumberVisible=='false') && (orderStatus === 11)) || ((isOrderNumberVisible=='false') && (quoteJson.isReturnOrder))){
					 $('#successMessage').text('<spring:message code="label.createorderfromcartconfirm.order.processing" />');
					 $('.update-success').show();
					 $('.order_number').hide();
					 $('.po_number').show();
				 }
			}
			
			getShoppingCartCount();
			
			// Hide Transaction Id
			if($("#transactionId > span").text() == ""){
				$("#transactionId").hide();
			}
			
			$('#brandName').text(quoteJson.organization.organizationName);
			
			var myQuoteFlag = '${cartCountForMyOrder}';
			console.log(myQuoteFlag);
			if(myQuoteFlag=="false"){
				$('#next-order').hide();
			}

			var isGuestUser = '${isGuestUser}';
			/*Checkout button onclick function*/
			$("#checkout-button").click(function(){
				var paymentMethodId = $("#paymentMethodId").val();
	    		
       			/*Constructing Checkout POPUP*/
       			var customerCardDetails = quoteJson.customerCardDetails;
       			
       			var doc = $('.checkout_selectcard');
       			
       			doc.find('option').remove();
       			var opt = $("<option value='New Card'>New Card</option>");
       			opt.attr("selected","selected");
       		 	doc.append(opt);
       		   /*Saved card option only for logged in user*/
       		 	if(isGuestUser=="false"){
       		 		for(var i=0; i<customerCardDetails.length;i++){
	       			   var opt = $("<option></option>");
	                   opt.text(customerCardDetails[i].cardNumber);
	                   opt.val(customerCardDetails[i].cardId);
	         	       doc.append(opt);
	        	    } 
       		 	}
       			
           		$("#gensuite_checkout_popup").show();
				
			});
			
        $("#gensuite_checkout_popup  #Checkout_btn").on("click", function(e) {
			e.preventDefault();
			//INC-1912 PREVENT RE-CLICKING OF CONTINUE BUTTON : ADDED BY ANIKET : REVIEWED BY HARI
			$(".pageLoader").show().css('z-index','9999999');
			//END
		 var cardId = $('.checkout_selectcard').val();
			//alert("Test >>"+quoteJson.paymentMethod.paymentMethodId);
			if (cardId == "New Card") {
				if (quoteJson.paymentMethod.paymentMethodId == 3)
					smarterCommerceWithOrderNumber(quoteJson);
				else
					smarterCommerceWithQuoteNumber(quoteJson);
			} else if (quoteJson.paymentMethod.paymentMethodId == 3) {
				if(paymentFlag){ //INC-2266 added by Aniket : Prevent Duplicate Orders: Reviewed by Krupa
					$("#Checkout_btn").addClass('not-active');
					paymentFlag=false;
					window.location.href = "authorizePaymentForSmarterCommerce?organizationId="	+ quoteJson.organization.organizationId+ "&cardId=" + cardId;
				}
				
			} else if (quoteJson.paymentMethod.paymentMethodId == 4) {
				if(paymentFlag){ //INC-2266 added by Aniket : Prevent Duplicate Orders: Reviewed by Krupa
					$("#Checkout_btn").addClass('not-active');
					paymentFlag=false;
					window.location.href = "authorizepaymentforaftermarket?organizationId="+ quoteJson.organization.organizationId+ "&cardId=" + cardId;
				}
				
			} 

		});
        }
        
        /*Checkout popup cancel button onclick function*/
        $(".custom-close").click(function(){
 		   $("#gensuite_checkout_popup").hide();
 		});
        </script>

	<script type="text/javascript">
         /*Form sumbit for payment type 3*/
        function smarterCommerceWithOrderNumber(quoteJson){
        	var isGuestUser = '${isGuestUser}';
        	$.ajax({
	            type : "Get",
	            url : 'getmerchantdetails',
	            cache: false,
	            success : function(data) {
                   // $('.pageLoader').hide();
	            	var response = jQuery.parseJSON(data);
	            	console.log(response);
	            	
	            	if(response!="Merchant Details Not Found"){
		       			$("#frmCheckOutwithorder").attr("action",response.paymentGatewayUrl); 
						$("#organizationCode").val(quoteJson.organization.organizationId);  
						$("#addressLine1").val(quoteJson.billToAddress.addressLine1);
						$("#addressLine2").val(""); 
						$("#addressLine3").val(""); 
						$("#addressLine4").val(""); 
						$("#city").val(""); 
						$("#country").val(""); 
						$("#fax").val(""); 
						$("#phone").val(""); 
						$("#postalCode").val(quoteJson.billToAddress.addressZipCode); 
						$("#state").val(""); 
						$("#orderCompany").val(quoteJson.branchPlant.companyReference); 
						$("#orderNumber").val(quoteJson.orderNumber); 
						$("#orderType").val(""); 
						$("#currency").val(quoteJson.currencyCode); 
						$("#amount").val(quoteJson.totalAmount);
						if(isGuestUser=="true"){
							$("#isguestuser").val('1');
							$("#userName").val(quoteJson.contact.primaryEmail);//code change for MIL-260 / INC-565
							$("#name").val(quoteJson.billToAddress.addressName); //code change for MIL-260 / INC-565
						}
						else{
							$("#isguestuser").val('0');
							$("#userName").val(quoteJson.quotedBy.email);//code change for MIL-260 / INC-565
							$("#name").val(quoteJson.billToAddress.addressName);//code change for MIL-260 / INC-565
						}
						$("#frmCheckOutwithorder").submit();	
	                }else
		            	  window.location.href="createorderreviewpayment";  
		            
		            },  
		            error : function(e) {  
		            }  
		          });
        }
        
        /*Form sumbit for payment type 4 //Smarter Commerce - MIL-201*/
        function smarterCommerceWithQuoteNumber(quoteJson){
        	var isGuestUser = '${isGuestUser}';
        	$.ajax({
	            type : "Get",
	            url : 'getmerchantdetails',
	            cache: false,
	            success : function(data) {
                   // $('.pageLoader').hide();
	            	var response = jQuery.parseJSON(data);
	            	console.log(response);
	            	
	            	if(response!="Merchant Details Not Found"){
		       			$("#frmCheckOutwithquote").attr("action",response.paymentGatewayUrl); 
						$("#orgCode").val(quoteJson.organization.organizationId); 
						$("#addLine1").val(quoteJson.billToAddress.addressLine1);
						$("#addLine2").val(""); 
						$("#addLine3").val(""); 
						$("#addLine4").val(""); 
						$("#city1").val(""); 
						$("#country1").val(""); 
						$("#fax1").val(""); 
						$("#phone1").val(""); 
						$("#postalCode1").val(quoteJson.billToAddress.addressZipCode); 
						$("#state1").val(""); 
						$("#carrierCode").val(quoteJson.carrier.carrierReference); 
						$("#company1").val(quoteJson.branchPlant.companyReference); 
						$("#customerPO").val("CREDIT CARD"); 
						$("#quoteNumber").val(quoteJson.quoteNumber);
						$("#amount1").val(quoteJson.totalAmount);
						$("#currency1").val(quoteJson.currencyCode); 
						if(isGuestUser=="true"){
							$("#isguestuser1").val('1');
							$("#usrName").val(quoteJson.contact.primaryEmail);//code change for MIL-260 / INC-565
							$("#name1").val(quoteJson.billToAddress.addressName); //code change for MIL-260 / INC-565
						}
						else{
							$("#isguestuser1").val('0');
							$("#usrName").val(quoteJson.quotedBy.email);//code change for MIL-260 / INC-565
							$("#name1").val(quoteJson.billToAddress.addressName); //code change for MIL-260 / INC-565
						}
						$("#frmCheckOutwithquote").submit();
	                }else
		            	  window.location.href="createorderreviewpayment";  
		            
		            },  
		            error : function(e) {  
		            }  
		          });
        }
        
    
        function dateFormat(d) {
			var date = new Date(d);
			var dd = date.getDate();
			var mm = date.getMonth() + 1; //January is 0!
			var yyyy = date.getFullYear();
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = mm + '/' + dd + '/' + yyyy;
			return today;
		}
        function gethistoricalorders_breadCrum(){
        	var today = new Date();
    		var priorDate = new Date().setDate(today.getDate()-180);
    		var priorDateFormat = new Date(priorDate);
        	var quote = '${quoteConfirm}';
      	  	var quoteJson = JSON.parse(quote);
  		 	var customerReference = quoteJson["customer"].customerReference;
  		 	var selectedOrganization = quoteJson["organization"].organizationId;
  		 	var orgName = JSON.stringify(quoteJson["organization"].organizationName);
  		 	var selectedOrgName = new String();
  		 	selectedOrgName = orgName.toString().replace(/"/g, "");
  		 	var fromDate = dateFormat(priorDateFormat.toISOString().substring(0, 10)); // '${fromDate}';
	        var toDate = dateFormat(today.toISOString().substring(0, 10));  //'${toDate}';
  		 	var cusName = quoteJson["customer"].customerName;
  		 	var chooseBrand = "false";
  	     
	  		  	$("#get-customerReference").val(customerReference);
	  		  	$("#get-selectedOrganization").val(selectedOrganization);
	  		  	$("#get-selectedOrgName").val(selectedOrgName);
	  		  	$("#get-fromDate").val(fromDate);
	  		  	$("#get-toDate").val(toDate);
	  			$("#get-cusName").val(cusName);
	  			$("#get-chooseBrand").val(chooseBrand);
	  		  	$("form#get-historicalorders").submit();
  		  		  
  	  };
        </script>
</body>

</html>
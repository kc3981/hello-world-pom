<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="../css/IFrameStyleSheet.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<jsp:include page="googleAnalytics.jsp" />
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>

<style>
.sampleBody .payment-content {
	background: #e8ecef;
}

.billing-content {
	width: 45%;
	margin: 0 auto;
	padding-bottom: 20px;
}

.line-sep {
	width: auto;
}

.form-group {
	margin-bottom: 15px;
	text-align: left !Important;
}

.btn-pay {
	margin-left: 33%;
}

html, body, .sampleBody {
	height: 100%
}

header {
	color: #000000;
	background: #FFFFFF;
}

.logo-wrap {
	padding: 5px;
	color: #fff;
}

header h3 {
	line-height: 14px;
	text-align: center;
}

.iframe-packetxml {
	white-space: pre-wrap;
	width: 775px;
	height: 550px;
	overflow-x: auto;
}

.sampleBody {
	background: #e8ecef !important
}

#IFrame {
	border: 1px solid transparent;
	height: 100% !Important;
	width: 60% !Important;
}

.marbot {
	margin-bottom: 25px;
}

.form-group label span {
	color: red;
	font-size: 20px;
	top: 0;
}

.btn-pay {
	border-color: #910a0a; */
	color: #fff;
}

.btn-pay:hover, .btn-pay:focus {
	border-color: #7d0000; */
	color: #fff;
}

.line-sep {
	border-color: #ccc;
	width: 550px
}

.labelhold {
	display: inline-block;
	width: 22%;
	padding-left: 5%;
}

input#RememberMeCheckbox {
	margin-left: 25%;
}

#city, #state, #postalCode {
	width: 53%;
}
</style>
<script>
	$(document).ready(function(){  
		$('.numericVal').on('input', function (event) { 
	    this.value = this.value.replace(/[^0-9]/g, '');
		});
		
		$('#RememberMeCheckbox').change(function() {
		if ($('#RememberMeCheckbox').is(":checked")){
			 var rememberMe =  "false";
			 if(document.getElementById('RememberMeCheckbox') != null && document.getElementById('RememberMeCheckbox').checked) {
	              rememberMe = "true";
 	            }
	            $('#param1').val(rememberMe);
		}
		});
	});
	  
	    function cancel(){
        	$('div.pageLoader').show();
       	  	$('#status').val('cancel');
      		$('#message').val('cancel');
            $('#iFrameHandler').attr("action","iFrameHandler");
   			$('#iFrameHandler').submit();
       }
         
          
          
         
    </script>
</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<div class="sampleBody">
		<header>
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-2 col-xs-4 brand">
					<a class="hidden-xs hidden-sm"
						href="${properties['default.landing.page']}"> <img
						id="headerlogo" src="${sessionScope.logo}" alt=""> <!--   <img id="headerlogo" src="https://store.milacron.com/gensuite-logo/milacron-logo.png" alt=""> -->
					</a> <a class="visible-xs visible-sm"
						href="${properties['default.landing.page']}"> <img
						id="headerlogo" src="${sessionScope.iPadLogo}" alt="">
					</a>
				</div>
				<div class="col-lg-8">
					<h3>

						<span id="lblHeader">Payment Checkout</span>
					</h3>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</header>
		<div class="payment-content">
			<!--  <div class="merchant-logo"></div> -->
			<div class="billing-content">
				<div class="billing-header">Welcome ${name} , Please complete
					this form to process your payment</div>
				<hr class="line-sep">
				<div class="billing-info">
					<form id="iFrameHandler" name="iFrameHandler" method="post"
						action="iFrameHandler">
						<div class="sixColumn">
							<div class="form-group">
								<label class="labelhold">Address<span>*</span></label> <input
									name="address1" id="address1"
									value="${transactionResponse.cardHolderAddress.addressLine1}"
									required>
							</div>
							<div class="form-group">
								<label class="labelhold">City <span>*</span></label> <input
									name="city" id="city"
									value="${transactionResponse.cardHolderAddress.addressCity}"
									required>

							</div>
							<div class="form-group">
								<label class="labelhold">ZIP Code<span>*</span></label> <input
									name="postalCode" id="postalCode"
									value="${transactionResponse.cardHolderAddress.addressZipCode}"
									required>
							</div>


						</div>
						<div class="sixColumn">
							<div class="form-group">
								<label class="labelhold">Address2</label> <input name="address2"
									id="address2"
									value="${transactionResponse.cardHolderAddress.addressLine2}">
							</div>
							<div class="form-group">
								<label class="labelhold">State<span>*</span></label>
								<%-- 		<select name="state" id="state" value="${transactionResponse.cardHolderAddress.addressState}" required>
    							 <option>AL</option>
    							</select> --%>
								<input name="state" id="state"
									value="${transactionResponse.cardHolderAddress.addressState}"
									maxlength="3" required>
							</div>
							<div class="form-group">
								<label class="labelhold">CVV Number<span>*</span></label> <input
									type="text" name="cvv" id="cvv" value="" minlength="3"
									maxlength="4" class="numericVal" required>
							</div>
						</div>

						<div class="form-group">
							<input name="cardId" id="cardId" type="hidden" value="${cardId}"
								required> <input name="randomId" id="randomId"
								type="hidden" value="${randomId}" required> <input
								type="hidden" id="status" name="status" value="" /> <input
								type="hidden" id="message" name="message" value="" /> <input
								type="hidden" id="param1" name="param1" value="false" />
							${IsGuestUser}
						</div>
						<hr class="line-sep">
						<div class="form-group">
							<button type="submit" class="btn btn-default btn-pay">Submit</button>
							<button onclick="cancel();return false;"
								class="IFrameButton btn-cancel">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>
</body>
</html>
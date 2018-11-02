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
 <jsp:include page="googleAnalytics.jsp"/>
<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="../css/payment.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css">
<link rel="stylesheet" type="text/css"	href="../css/font-awesome.min.css">
<!-- Moved scripts to head section-->
<script src="../js/jquery.min.js" type="text/javascript"></script>
<script src="../js/payment.js" type="text/javascript"></script>
<script src="../js/jquery.tmpl.min.js" type="text/javascript"></script>
<script src="${dIeCommUrl}/Scripts/XIFrame/XIFrame-1.1.0.js?v=3.7.0.12"
	type="text/javascript" language="javascript"></script>
<!-- GPD-51: Venkatasiva, Added for dependent country and state drop down list-->
	<script type= "text/javascript" src = "../js/countries.js"></script>
<link rel="stylesheet" type="text/css" 	href="../css/theme.css">
	<!-- End -->	
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css" 	href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->	
<style type="text/css">
#IFrame {
	width: 100% !important;
	display: inline-block;
	border: none;
}

.xiInputError {
	border: 1px solid #b94a48 !important;
	background-color: #fef5f5 !important;
}
 #AddressSelect, #AddressForm,#IframeHold{
	 display: block !important; 
}
#savedCard{
display: none !important
}
div#IframeHold {
    margin: 0px 5px;
    width: 99%;
    text-align: center;
    padding-left: 5%;
}
@media ( min-width : 300px) and (max-width: 767px) {
	div#IframeHold {
		height:335px;
	}
	#IFrame {
		height:335px;
	}
}

@media ( min-width : 768px) {
#IFrame {
		height: 250px;
	}
}
</style>
<script type="text/javascript">
	if(!(window.console && console.log)) {console = {log: function(){},debug: function(){},info: function(){},warn: function(){},error: function(){}};}
</script>

<!--  NREV-773 Moved the function to head from body as the function is not loaded in few scenarios -->
<script type="text/javascript"> 		function IFrame_OnLoad() {
		var iframe = document.getElementsByName('dieCommFrame');
		if (iframe) {
			console.log("iFrame==" + iframe);
			$XIFrame
					.onload({
						iFrameId : 'dieCommFrame',
						targetUrl : iframe[0].getAttribute("src"),
						autosizeheight : true,
						autosizewidth : true,
						onCardTypeChange : function(e) {
						},
						onSuccess : function(msg) {
							console
									.log('A form for the merchant guid and access token combination is loading in the iFrame successfully.');
						},
						onError : function(msg) {
							console
									.log('A form for the merchant guid and access token combination has FAILED to load.');
						}
					});
		}
		//Venkatasiva
		//Get state and country values
		/* var OrgId = ${organizationId};
		$.ajax({ 
   	              type : "get",
   	              data : {organizationId:OrgId},
   	              url : "state",
   	              success : function(response) {
   	              console.log("State :"+response);
		   	              $('#state').children().remove();
		   	               	var selectObj = jQuery.parseJSON(response);
		   	            	console.log("dfsdfs"+selectObj);
		   	            	var option = $('<option/>');
		   	            	option.attr({ 'value': "" }).text('Select State');
		   					$('#state').append(option);
		   	             	$.each(selectObj, function(index, itemData) {
		   					   var option = $('<option/>');
		   					   var country = itemData.countryReference;
		   						option.attr({ 'value': itemData.stateReference,'data-countryName': itemData.countryReference,'data-stateId': itemData.stateId  }).text(itemData.stateName+"-"+itemData.stateReference);
		   						
		   						$('#state').append(option);
		   					}); 
   	             }
     				}); */
	}
</script>
</head>
<body>
 <%@ include file="googleAnalyticsbody.jsp" %>
<form id="iFrameHandler" name="iFrameHandler" method="post"
										action="iFrameHandlerSave">
	<div class="paymentHold">
		<div class="row">
			<div class="col-lg-12">
				<main>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-offset-2 col-md-8">

							<div>
								<div id="IframeHold" class="cardInfo">
									<iframe id="IFrame" src="${iFrameUrl}" name="dieCommFrame"
										onload="IFrame_OnLoad();return false;" width="100%"
										height="100%"></iframe>
								</div>
								<!-- EO Iframe -->
								<div id="savedCard" class="cardInfo">
									
										<div class="input-group">
											<label>Card Type</label>
											<!-- <input type="text" name="cardType" id="cardType" class="form-control"> -->
											<select name="cardType" id="cardType" disabled
												class="form-control">
												<option value="vi">VISA</option>
												<option value="ax">AMEX</option>
												<option value="mc">MASTER CARD</option>
												<option value="di">DISCOVER</option>
											</select>
										</div>
										<div class="input-group">
											<label>Card Number</label> <input type="text"
												name="cardNumber" id="cardNumber" class="form-control"
												disabled>
										</div>
										<div class="input-group">
											<label>Name on Card</label> <input type="text" name="card"
												id="cardHolder" class="form-control" disabled>
										</div>
										<div class="input-group">
											<label>Exp Date</label> <input type="text" name="expDate"
												id="expDate" class="form-control" disabled>
										</div>
										<div class="input-group c-cvv">
											<label>CVV Number</label> <input type="password" name="cvv"
												id="cvv" max-length="3" class="form-control">
										</div>
										
								</div>
							</div>
						</div>
					</div>
						<div class="col-md-8 col-md-offset-2 pad30">
							<div class="cardInfo" id="AddressForm">
								<div class="col-md-6 ">
									<div class="input-group">
										<label>Address1</label><span style="color: red;font-size:15px;font-weight: bold;" id="span">*</span> <span id="address1-error"
											style="font-style: italic; font-size: 10px; color: red; display: none">Address
											1 cannot be empty</span> <input type="text" name="address1"
											id="address1" class="form-control" required>
									</div>
									<div class="input-group">
										<label>Address2</label> <input type="text" name="address2"
											id="address2" class="form-control">
									</div>
									<div class="input-group">
										<label>City</label><span style="color: red;font-size:15px;font-weight: bold;" id="span">*</span> <span id="city-error"
											style="font-style: italic; font-size: 10px; color: red; display: none">City
											cannot be empty</span> <input type="text" name="city" id="city"
											class="form-control" required>
									</div>
								</div>
								<div class="col-md-6 ">
									<div class="input-group">
									<label>Country</label>
										<!-- <input type="text" name="country" id="country" class="form-control" required readonly> -->
										<select id="country" name="country" required>
			                                    <option>----- <spring:message code="label.quote.order.select" /> ------</option>
			                             </select>
									</div>
									<div class="input-group">

										<label>State</label><span style="color: red;font-size:15px;font-weight: bold;" id="span">*</span> 
										 <span id="state-error"	style="font-style: italic; font-size: 10px; color: red; display: none">State cannot be empty</span>
										 
										 <select id="state" name="state" required>
			                                    <option>----- <spring:message code="label.quote.order.select" /> ------</option>
			                             </select>
										<!-- <input type="text" name="state" maxlength="3"
											id="state" class="form-control" required> -->
									</div>
									
									<div class="input-group">
										<label>Zip Code</label><span style="color: red;font-size:15px;font-weight: bold;" id="span">*</span> <span id="zip-error"
											style="font-style: italic; font-size: 10px; color: red; display: none">Zip
											code cannot be empty</span> <input type="text" name="postalCode"
											id="postalCode" class="form-control" required>
									</div>
									<%-- <div id="rememberMeDiv" class="input-group">
										${IsGuestUser}</div> --%>
								</div>
							</div>
						</div>
				</div>
				<!-- EO Credit Crd Row -->
				<div class="row center">
					
					<!-- <button type="submit" class="btn-pay">Pay</button> -->
					<button onclick="submitform();return false;"
						class="IFrameButton btn-save">Save</button>
					<!-- <button type="submit" class="btn-cancel">Cancel</button> -->
					<button onclick="cancel();return false;"
						class="IFrameButton btn-cancel">Cancel</button>
				</div>
				</main>
			</div>
		</div>

	</div>
	<input name="cardId" id="cardId" type="hidden" value="" required>
	<input type="hidden" id="AccessToken" name="id" value="${accessToken}" />
	<input type="hidden" id="SignedToken" name="s" value="${signature}" />
	<input type="hidden" id="iframeUrl" value="${iFrameUrl}" />
	<input type="hidden" id="randomId" name="randomId" value="${randomId}" />
	<input type="hidden" id="status" name="status" value="" />
	<input type="hidden" id="message" name="message" value="" />
	<input type="hidden" id="param1" name="param1" value="" />
	<input type="hidden" id="organizationId" name="organizationId" value="${organizationId}" />
	<input type="hidden" id="customerId" name="customerId" value="${customerId}" />
	<input type="hidden" id="customerReference" name="customerReference" value="${customerReference}" />
	<input type="hidden" id="savedCardReferenceField1" name="savedCardReferenceField1" value="" />
	<input type="hidden" id="savedCardReferenceField2" name="savedCardReferenceField2" value="" />
	</form>
	<!-- custome alert -->
        <div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
	   	<div class="modal-dialog">
	      <div class="modal-content custom-modal-content">
	        <div class="modal-header custom-modal-header">
	          <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
	          <h4 class="modal-title custom-modal-title"><spring:message code="label.bulkpartupload.information" /></h4>
	        </div>
	        <div class="modal-body custom-modal-body">
	          <!-- Content for the dialog / modal goes here. -->
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
	<!-- GPD-51: Venkatasiva -->
	<script language="javascript">
		populateCountries("country", "state"); // first parameter is id of country drop-down and second parameter is id of state drop-down
			
	</script>
	
	<!-- End -->
	<script type="text/javascript">
		var customerCardInfo = null; 
		var shipToAddress = null;
		var newCardFlag = false;
		var newAddressFlag = false;
		var updateFlag = false;
		$(function() {		
			var message = "${message}";
			if(message != "" && message != "undefined"){
				$('#myModal .modal-body').text(message);
				$("#myModal").show();
			}
			
			$('.NewAddress')
					.click(
							function() {
								console.log("Showing new address==");
								$('#AddressForm').find('input').val('');
								$('#AddressForm').show();
								$('#AddressForm').find('input').prop('disabled', false);
                                $('#AddressForm').find('input').attr('readonly', false);
								$('#choose-address').val('select');
								if ($('.savedCardDetail input[type=radio]')
										.prop('checked') == true
										&& updateFlag == false) {
									$('.NewCrdRemember').css('display', 'none');
								} else {
									$('.NewCrdRemember')
											.css('display', 'block');
								}
								newAddressFlag = true;
 
								
								});
							});

			//Address change
			$("#choose-address")
					.change(
							function() {
								resetAddressValidation();
								if ($("#choose-address").val() == "shipTo") {
									//fix for NREV-640: for guest user, the user is supposed to enter bill to ship to address, where address reference will differ
									//fix: if address reference is undefined, then we are not appending addressReference with address name
									if(shipToAddress.hasOwnProperty('addressReference')){
										$("#address1")
										.val(
												shipToAddress.addressReference
														+ "-"
														+ shipToAddress.addressName);
									}else{
										$("#address1")
										.val(
												 shipToAddress.addressName);
									}
									
									$("#address2").val(
											shipToAddress.addressName);
									$("#city").val(shipToAddress.addressCity);
									//Venkatasiva
									$("#country").val(shipToAddress.addressCountry);
									populateStates( "country", "state" );
									$("#state").val(shipToAddress.addressState);
					   	            //Append the Ship To state to dropdown
									/* $('#state').children().remove();
					   	            	var option = $('<option/>');
					   	            	option.attr({ 'value': shipToAddress.addressState}).text(shipToAddress.addressState);
					   				$('#state').append(option); */
					   				//Append the Ship To state to dropdown
									$("#postalCode").val(shipToAddress.addressZipCode);									
									$("#postalCode").val(
											shipToAddress.addressZipCode);
									$('#AddressForm').show();
									if (updateFlag == false) {
											$('#AddressForm').find('input').attr('readonly', true);
									}

									$('.NewCrdRemember')
											.css('display', 'block');

								} else if ($("#choose-address").val() == "select") {
									var newAddressFlag = true;
									$('.NewAddress').trigger( "click" );
									//$('#AddressForm').hide();
								} else {
									$('#AddressForm').show();
									if (updateFlag == false) {
										$('#AddressForm').find('input').attr('readonly', false);
									}
									var cardId = $("#choose-address").val();
									$
											.each(
													customerCardInfo,
													function(index, item) {
														if (cardId == item.cardId) {
															var customerCardAdd = item.cardHolderAddress;
															$("#address1")
																	.val(
																			customerCardAdd.addressLine1);
															$("#address2")
																	.val(
																			customerCardAdd.addressLine2);
															$("#city")
																	.val(
																			customerCardAdd.addressCity);
															$("#state")
																	.val(
																			customerCardAdd.addressState);
															$("#postalCode")
																	.val(
																			customerCardAdd.addressZipCode);
														}
													});
								}
								
							});

			$('.NewCard').click(
					function() {
						$('.NewCrdRemember').css('display', 'block');
						$('#choose-address').val('select');
						updateFlag = false;

						$('.savedCardDetail').find('input[type=radio]').prop(
								'checked', false);
						$('#savedCard, #AddressSelect').hide();

						$('#IframeHold, #AddressSelect').show();
						//$('.NewCrdRemember').css('display','block');
						newCardFlag = true;	
						newAddressFlag = true;
						$('.NewAddress').trigger( "click" );
			});
			
			//Autocomplete of CVV
			 $("#cvv").attr("autocomplete", "off");
				setTimeout('$("#cvv").val("");', 2000); 
			
			 //Onclick of remember me 
			 $(".NewCrdRemember").find("input").click(function(){
			
			 
			 });
			 
			 $(".custom-close").click(function(){
				   $("#myModal").hide();
			});
		 
	
		function resetAddressValidation(){
			/*$('#address1').removeClass('xiInputError');
			$("#city").removeClass('xiInputError');
			$("#state").removeClass('xiInputError');
			$("#postalCode").removeClass('xiInputError');*/
			$('#address1-error').css('display','none');
			$('#city-error').css('display','none');
			$('#state-error').css('display','none');
			$('#zip-error').css('display','none');
		}
		
		function submitform() {
			var status = $("#status").val();
			var orgId = ${organizationId};
			var address1 = $("#address1").val();
			var address2 = $("#address2").val();
			var city = $("#city").val();
			var state = $("#state").val();
			var country = $("#country").val();
			var postalCode = $("#postalCode").val();
			var custId = $("#customerId").val();
			var custRef = $("#customerReference").val();
			var id = $("#AccessToken").val();
			var cardAddedMsg = "<spring:message code='label.card.add'/>";
			if(newCardFlag && newAddressFlag){
				//Scenario two
				$("#savedCardReferenceField2").val("2");
			} else if(newCardFlag && !newAddressFlag){
				//Scenario One
				$("#savedCardReferenceField2").val("1");
			}else if(!newCardFlag && newAddressFlag){
				//Scenario three
				$("#savedCardReferenceField2").val("3");
			}else{
				//Scenario four
				$("#savedCardReferenceField2").val("4");
			}
			var iframe = document.getElementsByName('dieCommFrame');
			var randomId = $('#randomId').val();
			if(newAddressFlag){
				if(!addrcheck()){
					return false;
					}
				}
			if (iframe) {
				$XIFrame
						.submit({
							iFrameId : 'dieCommFrame',
							targetUrl : iframe[0].getAttribute("src"),
							onSuccess : function(msg) {
								console.log(msg);
								var message = JSON.parse(msg);
								//alert("msg : "+ message);
								if (message && message.data.HasPassed) {
									/* var rememberMe = "false";
									if (document
											.getElementById('RememberMeCheckbox') != null
											&& document
													.getElementById('RememberMeCheckbox').checked) {
										rememberMe = "true";
									}
									$('#param1').val(rememberMe); */
									
									
								} else {
									$('#status').val('cancel');
								}
								/*if(newAddressFlag){
									if(!addrcheck()){
										return false;
										}
									} */
								$('div.pageLoader').show();
								$('#message').val(msg);
								/* $('#iFrameHandler').attr("action",
										"iFrameHandlerSave");
								
								$('#iFrameHandler').submit(); */
					           $.ajax({
									type : "POST",
									data : {
										"id" : id,
										"status" : status,
									 	/* "message" : msg, */
										"organizationId" : orgId,
										"customerId" : custId,
										"customerReference" : custRef,
										"address1" : address1,
										"address2" : address2,
										"city" : city,
										"postalCode" : postalCode,
										"state" : state,
										"country": country,
										"randomId" : randomId   
									},
								    dataType:"text",
								    crossDomain: true,
									url : "iFrameHandlerSave",
									success : function(response) {
										  console.log("response :"+response);
											$('#message').val(response);
										if(response == cardAddedMsg) {
											window.location="accountsetting?selectedOrganization="+orgId+"&defaultTab=addCard&organizationTab=3"
										} else {
											document.forms[0].action="addcard"; 
							        	  	document.forms[0].submit();
										}
									},
									error : function(e) {
										console.log("error : " + e);
									}
								}); 
							},
							onError : function(msg) {
								$('#status').val('cancel');
								$('#message').val(msg);
							}
						});
			}
				
			/* }else{
				$('#myModal .modal-body').text('Please Select a Saved Card or add a new Card');
    			$("#myModal").show();
			} */

		}
		
		function addrcheck(){
			var address1 = $("#address1").val();
			var city = $("#city").val();
			var state = $("#state").val();
			var postalCode = $("#postalCode").val();
			if (address1 == "") {
				$('#address1-error').css('display','block');
				//$('#address1').addClass('xiInputError');
				//return false;
			} else {
				$('#address1-error').css('display','none');
				//$('#address1').removeClass('xiInputError');
			}
			
			if (city == "") {
				//$("#city").addClass('xiInputError');
				$('#city-error').css('display','block');
				//return false;
			} else {
				$('#city-error').css('display','none');
				//$("#city").removeClass('xiInputError');
			}
			if (state == "") {
				$('#state-error').css('display','block');
				//$("#state").addClass('xiInputError');
				//return false;
			} else {
				$('#state-error').css('display','none');
				//$("#state").removeClass('xiInputError');
			}
			if (postalCode == "") {
				$('#zip-error').css('display','block');
				//$("#zip-error").show();
				//$("#postalCode").addClass('xiInputError');
				//return false;
			} /* else if( !( /(^\d{5}$)|(^\d{5}-\d{4}$)/).test(postalCode)) {
				$("#postalCode").addClass('xiInputError');
			} */else{
				$('#zip-error').css('display','none');
				//$("#zip-error").hide();
				//$("#postalCode").removeClass('xiInputError');
			}
			
			if(address1 && city && state && postalCode){
			return( true );
			}else{ return false}
			
			}
		/* function updateCard(cardId) {
			updateFlag = false;
			newCardFlag = false;
			$('#IframeHold, #AddressSelect, #AddressForm').hide();
			$('#savedCard, #AddressSelect').show();
			//$("#RememberMeCheckbox").siblings("label").text("Would you like to change the address.");
			$('NewCrdRemember').css('display', 'block');
			var OrgId = ${organizationId};
			$.ajax({ 
   	              type : "get",
   	              data : {organizationId:OrgId},
   	              url : "state",
   	              success : function(response) {
   	              console.log("State :"+response);
		   	              $('#state').children().remove();
		   	               	var selectObj = jQuery.parseJSON(response);
		   	            	console.log("dfsdfs"+selectObj);
		   	            	var option = $('<option/>');
		   	            	option.attr({ 'value': "" }).text('Select State');
		   					$('#state').append(option);
		   	             	$.each(selectObj, function(index, itemData) {
		   					   var option = $('<option/>');
		   					   var country = itemData.countryReference;
		   						option.attr({ 'value': itemData.stateReference,'data-countryName': itemData.countryReference,'data-stateId': itemData.stateId  }).text(itemData.stateName+"-"+itemData.stateReference);
		   						
		   						$('#state').append(option);
		   					}); 
   	             }
   				});
			$.each(customerCardInfo,
					function(index, item) {
						if (cardId == item.cardId) {
							$("#choose-address").val(cardId);
							$("#cardId").val(cardId);
							$("#cardType").val(item.cardType);
							$("#cardHolder").val(item.cardHolderName);
							$("#expDate").val(
									item.expiryMonth + "-" + item.expiryYear);
							$("#cardNumber").val(item.cardNumber);
							var customerCardAdd = item.cardHolderAddress;
							$("#address1").val(customerCardAdd.addressLine1);
							$("#address2").val(customerCardAdd.addressLine2);
							$("#city").val(customerCardAdd.addressCity);
							$("#state").val(customerCardAdd.addressState);
							$("#postalCode")
									.val(customerCardAdd.addressZipCode);

						}
					});
		} */
		function cancel() {
			var orgId = ${organizationId};
			window.location="accountsetting?selectedOrganization="+orgId+"&defaultTab=addCard&organizationTab=3"
		}
		//Venkatasiva 
		/* $('#state').on('change',function(){
			  var stateSelected = $('#state').find("option:selected" ).text().slice(-2);
			  var addressCountry = $('#state').find('option:selected').data('countryname');
			  $("#country").val(addressCountry).attr('readonly','readonly'); 
		}); */
		
		$('#country').on('change',function(){
			  if($('#country').find("option:selected" ).index()!=0){
				  //To get the option value i.e., country code
				  var country = $('#country').val();
				  console.log("country: " + country);				  
				  $("#country").val(country); 				  
			  }else{
				  $('#country').val('-1');				  
			  }
		}); 
		
		$('#state').on('change',function(){
			  if($('#state').find("option:selected" ).index()!=0){				  
				 //To get the option value i.e., state code
				  var state = $('#state').val();		
				  console.log("state: " + state);							  
				  $("#state").val(state); 				 			  
			  }else{
				  $("#state").val('');
			  }
		});
		
		
		
		
		
		
	</script>
</body>
</html>
function loadBundles() {
	
	  $.ajax({
			type: "GET",
			async:false,
			url: "getLanguage",
			success: function(response){
			    var scriptContent = $($.parseHTML(response, document, true)).filter('script').text();
			    $.globalEval(scriptContent);
			},
			error: function(e){
			}
		});	
	}

function fillShipToDetailsForDealerUser(json,quoteJson){
	var customer = json.customer;
	$("#customer-no").val(customer.customerName);
  	$("#customerVal").val(customer.customerId);
  	
  	var billToAddresses = json.billToAddress;
 	var docBillTo = $('#billtoSelect');
 	var defaultBillToId = json.billToAddressId;
 	appendOption($.makeArray(billToAddresses),docBillTo,defaultBillToId);
 	
 	var shipToAddress = json.shipToAddress;
 	var docShipTo = $('#shiptoSelect');
 	var defaultShipToId = json.shipToAddressId;
	appendOption($.makeArray(shipToAddress),docShipTo,defaultShipToId);
	loadBundles();
	$('#customer_dealer_name').text(strings['label.dealer']);
	$('#customer-no').prop('readOnly',true);
	$('#billToDivHide').addClass('hide'); //to hide billTo details for Dealer User
	//$("#ship-to-add-div").css("display","");
   	//$("#shiptoSelect").hide();
	//$("#ship-to-add").click();
	//	populateShipToAddress(quoteJson);	
		
		 $('#shipToDetails').html();
	   	 $('#shipToDetails').html(setAddress(json.shipToAddress));
}
function populateShipToAddress(quoteJson) {
	var country=quoteJson["shipToAddress"].addressCountry
	country=country.split(" ");
	$("#ship-to-cancel").css("display","none");
	$("#shipToAddressName").val(quoteJson["shipToAddress"].addressName);
	$("#shipToAddressLine1").val(quoteJson["shipToAddress"].addressLine1);
	$("#shipToAddressLine2").val(quoteJson["shipToAddress"].addressLine2);
	$("#shipToAddressLine3").val(quoteJson["shipToAddress"].addressLine3);
	$("#shipToAddressCity").val(quoteJson["shipToAddress"].addressCity);
	//Venkatasiva : GPD-2430
	if(typeof quoteJson["shipToAddress"].addressCountry==="undefined"){
		populateCountries("shipToAddressCountry", "stateSelect");
	}else{
		
		$("#shipToAddressCountry").val(country[0]);
	}
	populateStates("shipToAddressCountry", "stateSelect");
	$("#shipToAddressState").val(quoteJson["shipToAddress"].addressState);
	$("#stateSelect").val(quoteJson["shipToAddress"].addressState);
	$("#shipToAddressZipCode").val(quoteJson["shipToAddress"].addressZipCode);
}

function populateDealerInfoAndShipToAddress(quoteJson){
	loadBundles();
	$('#customer_dealer_name').text(strings['label.dealer']);
	$('#customer-no').prop('readOnly',true);	
	$('#billToReview').addClass('hide');
	$('#ship-to').text(quoteJson.shipToAddress.addressName);
	$('#ship-to-addr').html(setAddressforDealer(quoteJson.shipToAddress));	
}

function setAddressforDealer(obj){
    var string="";
    string = ((obj.addressName ===null || typeof obj.addressName==="undefined" || obj.addressName.trim() === "" )?"":obj.addressName+"<br/>");
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

function updateDealerAndBillToForQuoteToOrder(){
	loadBundles();
	$('#quoteToOrderCustomerDealerLabel').text(strings['label.dealer']);
	$('#quoteToOrderBillTo').hide();
}
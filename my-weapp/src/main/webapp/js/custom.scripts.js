/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var currencyConvertorObj = { 'USD':'$', 'EUR':'€'};

function loadBundles() {
	  var lang = document.getElementById('language_id_').value;
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


$(function(e) {
	// currency symbol convertor object
	 $('input[id=keyword]').focus(function(){
	     $(this).data('placeholder',$(this).attr('placeholder'))
	     $(this).attr('placeholder','');
	  });
	  $('input[id=keyword]').blur(function(){
	     $(this).attr('placeholder',$(this).data('placeholder'));
	  });
	
	 $("#shoppingButton").click(function() {
		 window.location.href="getshoppingdetails";
	 });

  var fetchOrgLogo = function(){
	 $.ajax({  
      type : "Get",
      contentType: 'application/json',
      mimeType: 'application/json',
      url : "getorglogo",
      success : function(response) {
        if(response){
          $('#logo').css({'background-image':'url('+response.orgLogoUrl+')', 'background-repeat':'no-repeat', 'background-position': '50%', 'background-size' : '100%' });
       	}
      },  
      error : function(e) {  
      } 
    });
  }();
});


function addItemToCart(partId, mediaId){
	var quantity = 1;
	 $.ajax({  
        type : "POST",
        data : {partId: partId,mediaId: mediaId,quantity:quantity},
        url : "addtocart",
        success : function(response) {

         if(response==''){
        	 alert("Part is not added...")
         }
         else{
        	 getShoppingCartCount();
        	 alert("Part is added to your cart...")
         }
         
        },  
        error : function(e) {  
        }  
    });
}

//Use this function to format currency amounts based on locale and currency code
function formatAmount(currencyCode, amount)
{
	var languageCode=null;
	 if(currencyCode!="") {
		
		 if(currencyCode=="USD"){
			 languageCode='en-US';
		 }else if(currencyCode=="EUR"){
			 languageCode='de-DE';
		 }else{
			 languageCode='en-US';
		 }
		
		 var number = parseFloat(amount);
		 var result = number.toLocaleString(languageCode,{minimumFractionDigits: 2});
		 result=result.concat(" "+currencyCode);
		 
	   return result;
	 }
	
}
function formatAmountWithDecimal(locale,currencyCode, amount){
	
	if(currencyCode!="") {
	   locale = locale.replace("_","-");
	   var number = parseFloat(amount);
	   var options = { style: 'currency', currency: 'USD', minimumFractionDigits: 2};
	   options.currency = currencyCode;
	   var result = number.toLocaleString(locale, options);
	   result=result.concat(" "+currencyCode);
	   var isSafari = navigator.vendor && navigator.vendor.indexOf('Apple') > -1;
	   if(isSafari){
	    return result;
	   }
	   result=result.substring(1);
	   return result;
	 }
	
}

function formatAmountWithOutCurrency(locale,currencyCode, amount){
	
	locale = locale.replace("_","-");
	var number = parseFloat(amount);
	var options = { style: 'currency', currency: 'USD',minimumFractionDigits: 2};
	options.currency = currencyCode;
	var result = number.toLocaleString(locale, options);
	var isSafari = navigator.vendor && navigator.vendor.indexOf('Apple') > -1;
	if(isSafari){
		return result;
		
	}
	result=result.substring(1);
	return result;
	
}
function validateSpecialCharacterAndAlphanumeric(amountString){
	// Below REGEX will return true if amountString is a Special characters or Alphabets
	var amountFilter = /^\d+([\.\,]\d{1})?\d*$/;
	return !amountFilter.test(amountString);
}

//transportModeApplicable and transportModeMap are the Json String,convert to JSON object.
function reloadDropDown(transportModeApplicable,transportModeJson,isReadOnly,carrierId){
    	if(transportModeApplicable == 2 || transportModeApplicable == 1){
   		var myMap = {};
		$('#transportModeDiv').show();
 	  	 if(isReadOnly == 1){ // isreadOnly means page doesnt have autolookup for the customer and the address field.
	  	 	$('#transportMode').empty(); 
	  	 	for(var item in transportModeJson)
	 		{	
	 		 var subItem =  transportModeJson[item];
	 			if((carrierId == item && transportModeApplicable == 2) || (transportModeApplicable == 1) ){ 
	 				for(var i in subItem)
	 				{	
 	 				     var transportModeId = subItem[i].transportModeId;
	 				     if((!myMap.hasOwnProperty(transportModeId) && transportModeApplicable == 1) || (transportModeApplicable == 2) ) { 
	 				     $("<option />", {
	 					        val: subItem[i].transportModeId,
	 					        text: subItem[i].transportDescription
	 					    }).appendTo('#transportMode');	
	 				    	myMap[transportModeId] = transportModeId;

	 				     } 
	 				 }
	 			}
	 		}
	 	}
 	}else{
	  	$('#transportModeDiv').hide();
	}
 }

function handleTransportModeOnAjax(responseJson){
	transPortflag = true;
  	var transportModeApplicable = responseJson.transportModeApplicable ;
  	transportModeJson =  responseJson.transportModeMap;
		var carrierList = responseJson.carrierList;
	 if(transportModeApplicable == 2 || transportModeApplicable == 1){
		  	$('#transportModeDiv').show();
		}else{
	  	$('#transportModeDiv').hide();

		}
		fillCarrierSelect(carrierList);
}
function fillCarrierSelect(carrierList){
	$('#carrierSelect').empty();
	$('#transportMode').empty();
	//Venkatasiva : GPD-1866
	console.log("carrier length : "+carrierList.length);
	if(carrierList.length>1){
		$("<option />", {
	        val: '',
	        text: '----- Select ------'
	    }).appendTo('#carrierSelect');
	}
	for(var item in carrierList){	
		var subItem =  carrierList[item];
		 $("<option />", {
	        val: subItem .carrierId,
	        text: subItem .carrierDescription
	    }).appendTo('#carrierSelect'); 
	} 
} 
var transPortflag = true;
function handleTransportModeDropDown(transportModeJson,value,transportModeApplicable){
  	if(!/^\d+$/.test(value)){
  		$('#transportMode').empty(); 
		transPortflag = true;
	}	
 	    	if( transportModeApplicable == 1 ){ 
 	    		var myMap = {};
 	    		if(transPortflag && /^\d+$/.test(value)){ 
  	    		$('#transportMode').empty(); 
 				for(var item in transportModeJson)
				{	
					var subItem =  transportModeJson[item];
					 
						for(var i in subItem)
						{	
 						      var transportModeId = subItem[i].transportModeId;
						      if((!myMap.hasOwnProperty(transportModeId) && transportModeApplicable == 1)){
							     $("<option />", {
							        val: subItem[i].transportModeId,
							        text: subItem[i].transportDescription	
							    }).appendTo('#transportMode');	
			 				    	myMap[transportModeId] = transportModeId;

						      } 
						 }
			 	}
 				transPortflag = false;
 	    	}
		}else{ 
			$('#transportMode').empty(); 
			for(var item in transportModeJson)
		{	
			var subItem =  transportModeJson[item];	
			if(value == item ){ 
				for(var i in subItem)
				{	
 				     var transportModeId = subItem[i].transportModeId;
				     $("<option />", {
					        val: subItem[i].transportModeId,
					        text: subItem[i].transportDescription
					    }).appendTo('#transportMode');	
				 }
				break;
			}
		}
	}
	
}

function getTransportModeBasedOnShippingTerms(cboId,transportmodeId){
	console.log("Carrier Billing Option Id :"+cboId);
 	$.ajax({  
        type : "GET",
        data : {carrierBillingOptionId: cboId},
        url : "gettransportmode",
        success : function(response) {
        		console.log('Res Transport Mode :'+response);
				var responseJson = JSON.parse(response);
				if(responseJson.length != 0){					
					$('#transportMode').empty();					
					$.each(responseJson.transportMode,function(index,item){
						console.log("Populate"+item.transportDescription);
						$("<option />", {
					        val: item.transportModeId,
					        text: item.transportDescription
					    }).appendTo('#transportMode');	
					
					});
					//Venkatasiva : GPD-2041
    				if(document.getElementsByName("shipValue").length==1){
    		     		 $('.shipValue').prop('checked', true);    		     		 
    		                var optionValue =  $('.shipValue').attr('id');
    		    			console.log("optionValue "+optionValue);    		    			
    		    			$("#transportMode").val(optionValue); 
    		    			serialNumberRequired();
    		     	  }else{
    		     		 if(typeof transportmodeId=="undefined"){
    							$('#transportMode').find('option[value="'+transportmodeId+'"]').prop("selected",true);
    							//selected TransportMode should be checked in checkbox 
    							checkSelectedTransportMode();
    				 			serialNumberRequired();
    						}
    		     	  }
				}
				if(typeof transportmodeId!="undefined"){
					$('#transportMode').find('option[value="'+transportmodeId+'"]').prop("selected",true);
					//selected TransportMode should be checked in checkbox 
					checkSelectedTransportMode();
		 			 serialNumberRequired();
				}
				
        },  
        error : function(e) {    
        }  
    });	
} 

function checkSelectedTransportMode(){	
	var optionValue =	$('#transportMode').val();    		 			
		console.log("transportMode id : "+optionValue);		
		 $("input[value='" + optionValue + "']").prop('checked', true);
}

function serialNumberRequired(){
			var cboId = $("#transportMode > option:selected").val();
			 if (undefined != ruleMap && undefined != ruleMap.get(cboId+"_"+3) && undefined != ruleMap.get(cboId+"_"+3).get(3) && ruleMap.get(cboId+"_"+3).get(3)=="true" ){
					$('#machine-serial-no-label').addClass('required');
				}
			 else{
				 	$('#machine-serial-no-label').removeClass('required');
				 }
 }
 	//function to copy the bill to address. Added by Pooja.H.S
 	$(function(){ 		
		
		  $('#CopyAddress input[type="checkbox"]').click(function(){			
				
			    var Name = $("#billToAddressName").val();
	   			var Line1 = $("#billToAddressLine1").val();
	   			var Line2 = $("#billToAddressLine2").val();
	 			var Line3 = $("#billToAddressLine3").val();
				var City = $("#billToAddressCity").val();
				var state = $("#billToAddressState").val();
		   		var zipcode = $("#billToAddressZipCode").val();
		   		var country = $("#billToAddressCountry").val();	   		
		   		
		   		var countryCode= $('#billToAddressCountry').val();
		    	var countryId= $('#billToAddressCountry').find('option:selected').attr('id');
		    	
				var $el = $("#shipToAddressState");
		    	$el.empty();		   		
		  
	            if($(this).prop("checked") == true){	            	
	            	
	            	
		            if(City && state){
		            	
		            	zipCodeAsRequiredField(country,"shipToAddressCountry");
		            	
		            	$("#shipToAddressName").val(Name);
		            	$("#shipToAddressLine1").val(Line1);
		 	   			$("#shipToAddressLine2").val(Line2);
		 	 			$("#shipToAddressLine3").val(Line3);
		 				$("#shipToAddressCity").val(City);
		 				$("#shipToAddressCountry").val(country);
		 				//$("#stateSelect").val($("#billToStateSelect :selected").text());
		 				//$('#stateSelect option[value=' + state + ']').attr('selected','selected');
		 				//$( "#billToStateSelect option:selected" ).text()
		 			    // Populate States for ship to address is same as bill to address
		 				//console.log("Scope guest user : " + ${sessionScope['scopedTarget.genericUserProperties'].isGuestUser});
		 				var userid=$('#userId').val();		 				
		 				//console.log("userid  :  " + userid);
		 				//console.log("typeof Line2  :  " + typeof Line2);
		 				//For storefront-demo Line2 is present, so added Line2 check
		 				if(userid == "null" ||  typeof Line2!="undefined"){
		 					populateStates("billToAddressCountry", "shipToStateSelect");
		 					$('#shipToStateSelect').val($('#billToStateSelect :selected').val()).attr("selected", "selected");
		 					
		 				}else {			 					
		 					populateStates("billToAddressCountry", "stateSelect");
		 					$('#stateSelect').val($('#billToStateSelect :selected').val()).attr("selected", "selected");
		 				}		 			
		 				
		 				//$('#shipToStateSelect').val($('#billToStateSelect :selected').val()).attr("selected", "selected");		 				
					   	$("#shipToAddressZipCode").val(zipcode);
					   	$('#shipToAddressState').val(state);					   
				   		  	
					  	$.ajax({  
					        type : "GET",
					        data : {countryCode: countryCode,countryId: countryId},
					        url : "getstatesforcountry",
					        success : function(response) {
					        	var obj = jQuery.parseJSON(response);
					        	$el.append($("<option disabled selected></option>")
						        	     .attr("value","").text('<spring:message code="label.creteordercartinit.address.state" />').attr("style","color:gray;")); 
					        	$.each(obj, function(key,item) {
					        	  $el.append($("<option></option>")
					        	     .attr("value", item.stateCode+"-"+item.stateName).text(item.stateName).attr("id", item.stateId));
					        		$("#shipToAddressState").val(state);
					        	});
					        },  
					        error : function(e) {     
					        }
					    });
					  
		            }else{ 
		            	$('.modal-body').text("Please Fill In Bill To Details")
		        		$("#myModal").show();
		            	$('#CopyAddress input[type="checkbox"]').prop( "checked", false );
		            
		            	}
		         }else{
		        	 
		        	 $("#shipToAddressName").val('');
		            	$("#shipToAddressLine1").val('');
		 	   			$("#shipToAddressLine2").val('');
		 	 			$("#shipToAddressLine3").val('');
		 				$("#shipToAddressCity").val('');
		 				$("#shipToAddressCountry").val('-1');
		 				$("#shipToStateSelect").val('');
		 				$('#stateSelect').val('');
					   	$("#shipToAddressZipCode").val('');	
					   	$('#shipToAddressZipCodeAsterisk').removeClass('asterisk_input_required');
					    
		         }
	            
	           
	        });		
	});

//START Bring From MILACRON_CODE_BASE
//FavList
function addItemToFavListPage(partId, mediaId, quantity,organizationId, evt){
	  var dataItemVal = null;
	  $('div.pageLoader').show();
		 $.ajax({  
	        type : "POST",
	        data : {partId: partId,mediaId: mediaId,quantity: quantity,organizationId: organizationId, dataItemVal:dataItemVal},
	        url : "addToFavoritesCart",
	        cache : false,
	        success : function(response) {
	         	if(response){
	         		var jsonResponse = JSON.parse(response);
	        	 	if(typeof jsonResponse.errorMessage != "undefined"){
	        	 		$('.modal-body').text(jsonResponse.errorMessage);
		    			$("#myModal").show();	
	        	 	}
	        	 	evt.preventDefault();
	        	 	$(evt.target).removeClass("no-fav-item").addClass("fav-item");
	        	 	$(evt.target).parent().attr("title", "Remove from favorites");
	        	 	$('div.pageLoader').hide();
	        	 	infoAlertBox("Added to favorites list");
	         	}
	         	$('div.pageLoader').hide();
	        },  
	        error : function(e) {  
	        	console.log($(evt).target);
     		$('div.pageLoader').hide();
	        }  
	    });
};

//Delete Fav
function deleteFromFavList(dataItemLst, evt){
   	$('div.pageLoader').show();
	$.ajax({
          type : "Get",
          data : {"objectRef":"{\"dataItemLst\":" + JSON.stringify(dataItemLst) + "}"},
          contentType: 'application/json;charset=utf-8',
          mimeType: 'application/json',
          dataType:"json",
          url : "deleteFavoritesCartItemFromPart",
      	cache : false,
  		success : function(response) {
  			evt.preventDefault();
   	  		$(evt.target).removeClass("fav-item").addClass("no-fav-item");
   	  		$(evt.target).parent().attr("title", "Add to favorites");
			$('div.pageLoader').hide();
			infoAlertBox("Removed from favorites list");
      	},  
      	error : function(e) {  
   	  		$('div.pageLoader').hide();
      	}  
   	});
	evt.preventDefault();
};

function infoAlertBox (msgText){
	var msgMrk = '<div id="generalInfobox"><div class="alert alert-info alert-dismissible" role="alert">';
	msgMrk += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
	msgMrk += '<strong>Information!</strong> ' +  msgText + '</div></div>'
	
	$("body").append($(msgMrk));
	$("#generalInfobox").show().fadeOut(2000, function(){
		$(this).remove();
	});
}
//END Bring From MILACRON_CODE_BASE
//Venkatasiva : GPD-2041
function populateRuleMap(transportModeRulesCheckbox){
	var shipmentRules = transportModeRulesCheckbox;
	var shipmentRuleCheckbox ;
	if(shipmentRules != null && shipmentRules!=""){
		shipmentRuleCheckbox = JSON.parse(shipmentRules);
	}
	var shipMentRuleMap = new Map();
	
	$.each(shipmentRuleCheckbox, function (key, data) { 
		
		var carrierBillingOptionId = data.transportModeId;
		var description = data.description;
		var shipmentTermRuleId = data.transportModeRuleId;
		var shipmentTermRuleValue = data.transportModeRuleValue;
		var childMap = new Map();
		childMap.set(shipmentTermRuleId,shipmentTermRuleValue);
		ruleMap.set(carrierBillingOptionId+"_"+shipmentTermRuleId,childMap);
		if(shipmentTermRuleId == 2 && shipmentTermRuleValue =="true"){
			/* var divtag = document.createElement("div");
			divtag.setAttribute('style', 'display: inline-block;'); */
    	   	var newCheckbox = document.createElement("input");
    		newCheckbox.type = "checkbox";
    		newCheckbox.value = data.transportModeId;
    		newCheckbox.id = data.transportModeId;
    		newCheckbox.name = "shipValue";
    		newCheckbox.setAttribute('class', 'shipValue');
    		document.getElementById("checkboxes").appendChild(newCheckbox);
    	    var newlabel = document.createElement("Label");
    	    newlabel.innerHTML = data.description;
    		document.getElementById("checkboxes").appendChild(newlabel); 
		}
	});
	    	
} 

function minimumOrderValidation(validateResult){
	loadBundles();
	var cboId = $("#transportMode > option:selected").val();
	var minimumOrderMessage= strings['label.minimum_order_value'];	
	var minimumOrderMsgStr=minimumOrderMessage.split("/");
	if (validateResult==true && undefined != ruleMap && undefined != ruleMap.get(cboId+"_"+1) && undefined != ruleMap.get(cboId+"_"+1).get(1)){
		//Validation for MinimumOrder Amount
		var minimumOrderAmount = parseFloat(ruleMap.get(cboId+"_"+1).get(1));
		var subTotalAmount =  parseFloat($('#subTotal').text());
		if(subTotalAmount < minimumOrderAmount){
			$('.modal-body').text(""+minimumOrderMsgStr[0]+" "+minimumOrderAmount+minimumOrderMsgStr[1]+$("#transportMode > option:selected").text()+minimumOrderMsgStr[2]+"" );
			$("#myModalSerialNo").show();
			validateResult=false;
			minimumChargesApplied =false;
			$('#isMiniOrderDiscApplicable').val("false");
		}else{
			minimumChargesApplied =true;
			$('#isMiniOrderDiscApplicable').val("true");
		}
	}
	return validateResult;
}

function validateSerialNo(ruleMap){
	loadBundles();
	var cboId = $("#transportMode > option:selected").val();
	if (undefined != ruleMap && undefined != ruleMap.get(cboId+"_"+3) && undefined != ruleMap.get(cboId+"_"+3).get(3) && ruleMap.get(cboId+"_"+3).get(3)=="true" ){
		if($('#machine-serial-no').val()==""){
			var serialNoValidationMsg = strings['label.serial.number.validation'];
			$('.modal-body').text(""+$("#transportMode > option:selected").text() +  " " + serialNoValidationMsg);
			$("#myModalSerialNo").show();
			return false;
		}		
	}
	return true;
}



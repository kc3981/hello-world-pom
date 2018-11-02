/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(function() {
	//custom close
	var  myErrObj = new errnsp.errHandling.init();
	$(".custom-close").click(function(){
		   $("#myModal, #gensuite_checkout_popup,#gensuite_quote_popup,#gensuite_order_popup,#gensuite_order_update,#gensuite_quote_update,#gensuite_email_popup").hide();
		});
	$('#save,#continue_btn').on("click",function() {
		
		var aPlateThickness = $('#thickness-AP option:selected').text();
		var bPlateThickness = $('#thickness-BP option:selected').text();
		var moldname = $("#moldName").val();
		retrnValArr.moldName = $('#moldName').val();
		
		if(aPlateThickness == 'Select'){
			//alert(enterAPlateThicknessMsg);
			$('.modal-body').text(enterAPlateThicknessMsg)
			$("#myModal").show();
		}else if(bPlateThickness == 'Select'){
			$('.modal-body').text(enterBPlateThicknessMsg)
			$("#myModal").show();
			//alert(enterBPlateThicknessMsg);
		}else if(checkLiftHoleSelection()){
			
		}else if (moldname == '') {
		//	$('.modal-body').text(emptyConfiguratorMsg)
		//	$("#myModal").show();
			$("#gensuite_checkout_popup").show();
			//alert(emptyConfiguratorMsg);
		}else {
			ajaxindicatorstart();
			addStaticRemark();
			$.ajax({
				type : "POST",
				data : {
					configuratorSave : JSON.stringify(retrnValArr)
				},
				url : "saveMold",
				success : function(response) {
					$("#gensuite_checkout_popup").hide();
				//	alert(successfulCreateConfiguratorMsg);
					$('.modal-body').text(successfulCreateConfiguratorMsg);
					$("#myModal").show();
					
					var configuredMoldObj = JSON.parse(response);
					//SUPPORT-MIL-216-250116
					window.location.href = "getConfiguredMoldEditPage?configuredMoldId="+
					configuredMoldObj.configuredMoldId;
				},
				error : function(jqxhr, textStatus, error) {
		            var err = jqxhr.status;
		            var msg = jqxhr.responseText;
		            $(".pageLoader").hide();
		            console.log( "Request Failed: " + err );
		            console.log( "Request Failed: " + jqxhr.responseText );
		            myErrObj.raise(err,msg,textStatus);
				//	alert("error: " + r + " status: " + status + " er:" + er);
					$('.modal-body').text("error: " + r + " status: " + status + " er:" + er);
					$("#myModal").show();
					
					ajaxindicatorstop();
				}
			});
		} 
	});
	$("#updateMold").click(function(){
		$("#gensuite_checkout_popup").show();	 
	});
	$('#continue_update_btn').click(function() {
		var id = configuredMoldId;
		var aPlateThickness = $('#thickness-AP option:selected').text();
		var bPlateThickness = $('#thickness-BP option:selected').text();
		var moldname = $("#moldName").val().trim();
		retrnValArr.moldName = $('#moldName').val();
		
		if(aPlateThickness == 'Select'){
			//alert(enterAPlateThicknessMsg);
			$('.modal-body').text(enterAPlateThicknessMsg)
			$("#myModal").show();
		}else if(bPlateThickness == 'Select'){
			//alert(enterBPlateThicknessMsg);
			$('.modal-body').text(enterBPlateThicknessMsg)
			$("#myModal").show();
			
		}else if(checkLiftHoleSelection()){
			
		}else if (moldname == '') {
		//	alert(emptyConfiguratorMsg);
		/*	$('.modal-body').text(emptyConfiguratorMsg)
			$("#myModal").show();*/
			$("#gensuite_checkout_popup").show();
		}else {
			 ajaxindicatorstart();
			addStaticRemark();
			$.ajax({
				url : "updateConfiguredMold?configuredMoldId=" + id,
				type : "POST",
				data : {
					configuratorQuote : JSON.stringify(retrnValArr)
				},
				success : function(response) {
					//alert(successfulUpdateConfiguratorMsg);
					$("#gensuite_checkout_popup").hide();
					$('.modal-body').text(successfulUpdateConfiguratorMsg)
					$("#myModal").show();
					
					window.location.href = "naconfiguratorlist";
				},
				error : function(jqxhr, textStatus, error) {
		            var err = jqxhr.status;
		            var msg = jqxhr.responseText;
		            $(".pageLoader").hide();
		            console.log( "Request Failed: " + err );
		            console.log( "Request Failed: " + jqxhr.responseText );
		            myErrObj.raise(err,msg,textStatus);	
					//alert("error: " + r + " status: " + status + " er:" + er);
					$('.modal-body').text("error: " + r + " status: " + status + " er:" + er);
					$("#myModal").show();
					ajaxindicatorstop();
				}
			}); 
		}
	});
	$("#quote_update").click(function(){
		$("#gensuite_quote_update").show();
	});
	$("#order_update").click(function(){
		$("#gensuite_order_update").show();
	});
	$('#quote,#continue_quote_btn').click(function() {
		var aPlateThickness = $('#thickness-AP option:selected').text();
		var bPlateThickness = $('#thickness-BP option:selected').text();
		var moldname = $("#moldName_quote").val().trim();
		retrnValArr.moldName = $('#moldName_quote').val();
		if(aPlateThickness == 'Select'){
			//alert(enterAPlateThicknessMsg);
			$('.modal-body').text(enterAPlateThicknessMsg)
			$("#myModal").show();
		}else if(bPlateThickness == 'Select'){
			//alert(enterBPlateThicknessMsg);
			$('.modal-body').text(enterBPlateThicknessMsg);
			$("#myModal").show();
		}else if(checkLiftHoleSelection()){
			
		}else if (moldname == '') {
		/*	$('.modal-body').text(emptyConfiguratorMsg)
			$("#myModal").show();*/
			$("#gensuite_quote_popup").show();
			//alert(emptyConfiguratorMsg);
		}else {
			ajaxindicatorstart();
			addStaticRemark();
			$.ajax({
				url : 'requestQuote',
				type : "POST",
				data : {
					configuratorQuote : JSON.stringify(retrnValArr)
				},
				success : function(response) {
					//alert(successfulQuoteConfiguratorMsg.replace("{Number}",response));
					$("#gensuite_quote_popup").hide();
					$('.modal-body').text(successfulQuoteConfiguratorMsg.replace("{Number}",response));
					$("#myModal").show();
					
					window.location.href = "naconfiguratorlist";
				},
				error : function(data, status, er) {
					//alert("data:" + data + "status :" + status + "er:" + er);
					$('.modal-body').text("error: " + r + " status: " + status + " er:" + er);
					$("#myModal").show();
					ajaxindicatorstop();
				}
			});
		}
	});
	
	$('#order,#continue_order_btn').click(function() {
		var aPlateThickness = $('#thickness-AP option:selected').text();
		var bPlateThickness = $('#thickness-BP option:selected').text();
		var moldname = $("#moldName_order").val().trim();
		retrnValArr.moldName = $('#moldName_order').val();
		if(aPlateThickness == 'Select'){
			//alert(enterAPlateThicknessMsg);
			$('.modal-body').text(enterAPlateThicknessMsg)
			$("#myModal").show();
		}else if(bPlateThickness == 'Select'){
			//alert(enterBPlateThicknessMsg);
			$('.modal-body').text(enterBPlateThicknessMsg)
			$("#myModal").show();
		}else if(checkLiftHoleSelection()){
			
		}else if (moldname == '') {
			/*	$('.modal-body').text(emptyConfiguratorMsg)
			$("#myModal").show();*/
			$("#gensuite_order_popup").show();
			//alert(emptyConfiguratorMsg);gensuite_quote_popup
		}else {
			ajaxindicatorstart();
			addStaticRemark();
			$.ajax({
				url : 'placeOrder',
				type : "POST",
				data : {
					configuratorQuote : JSON.stringify(retrnValArr)
				},
				success : function(response) {
					$("#gensuite_quote_popup").hide();
					//alert(successfulOrderConfiguratorMsg.replace("{Number}",response));
					$('.modal-body').text(successfulOrderConfiguratorMsg.replace("{Number}",response));
					$("#myModal").show();
					window.location.href = "naconfiguratorlist";
				},
				error : function(data, status, er) {
					//alert("data:" + data + "status :" + status + "er:" + er);
					$('.modal-body').text("error: " + r + " status: " + status + " er:" + er);
					$("#myModal").show();
					ajaxindicatorstop();
				}
			});
		}
	});
	
	$('#guestorder,#continue_email_btn').click(function() {
		
		var aPlateThickness = $('#thickness-AP option:selected').text();
		var bPlateThickness = $('#thickness-BP option:selected').text();
		retrnValArr.moldName = "GUEST-ORDER";
		var guestEmail = $("#guestemail").val();
		$('#gensuite_email_popup').find('.modal-header h4').css('display','block');
		$('#gensuite_email_popup').find('.modal-header h4.quoteSpring').css('display','none');
		if(guestEmail == ''){
			//alert(enterAPlateThicknessMsg);
			$("#gensuite_email_popup").show();
		}
		else if(aPlateThickness == 'Select'){
			//alert(enterAPlateThicknessMsg);
			$('.modal-body').text(enterAPlateThicknessMsg)
			$("#myModal").show();
		}else if(bPlateThickness == 'Select'){
			//alert(enterBPlateThicknessMsg);
			$('.modal-body').text(enterBPlateThicknessMsg)
			$("#myModal").show();
		}else if(checkLiftHoleSelection()){
			
		}else if(guestEmail == ''){
			//alert(enterAPlateThicknessMsg);
			$("#gensuite_email_popup").show();
		}
		else if(ValidateEmail(guestEmail) == false){
			//alert(invalidEmailIdMsg);
			$('.modal-body').text(invalidEmailIdMsg)
			$("#myModal").show();
			$("#guestemail").val("");
		}else {
			ajaxindicatorstart();
			addStaticRemark();
			$.ajax({
				url : 'placeGuestOrder',
				type : "POST",
				data : {
					configuratorQuote : JSON.stringify(retrnValArr),
					guestEmailId:guestEmail
				},
				success : function(response) {
					//alert(successfulOrderConfiguratorMsg.replace("{Number}",response));
					$('.modal-body').text(successfulOrderConfiguratorMsg.replace("{Number}",response));
					$("#myModal").show();
					window.location.href = "naconfiguratorlist";
				},
				error : function(data, status, er) {
					//alert("data:" + data + "status :" + status + "er:" + er);
					$('.modal-body').text("error: " + r + " status: " + status + " er:" + er);
					$("#myModal").show();
					ajaxindicatorstop();
				}
			});
		}
	});
	$('#guestquote,#continue_email_btn').click(function() {
		var aPlateThickness = $('#thickness-AP option:selected').text();
		var bPlateThickness = $('#thickness-BP option:selected').text();
		var guestEmail = $("#guestemail").val();
		retrnValArr.moldName = "GUEST-QUOTE";
		if(aPlateThickness == 'Select'){
			//alert(enterAPlateThicknessMsg);
			$('.modal-body').text(enterAPlateThicknessMsg)
			$("#myModal").show();
		}else if(bPlateThickness == 'Select'){
			/*alert(enterBPlateThicknessMsg);*/
			$('.modal-body').text(enterBPlateThicknessMsg);
			$("#myModal").show();
		}else if(checkLiftHoleSelection()){
			
		}else if(guestEmail == ''){
			//alert(enterAPlateThicknessMsg);
			$("#gensuite_email_popup").show();
			$('#gensuite_email_popup').find('.modal-header h4').css('display','none');
			$('#gensuite_email_popup').find('.modal-header h4.quoteSpring').css('display','block');
		}
		else if(ValidateEmail(guestEmail) == false){
			//alert(invalidEmailIdMsg);
			$('.modal-body').text(invalidEmailIdMsg)
			$("#myModal").show();
			$("#guestemail").val("");
		}else  {
			ajaxindicatorstart();
			addStaticRemark();
			$.ajax({
				url : 'requestGuestQuote',
				type : "POST",
				data : {
					configuratorQuote : JSON.stringify(retrnValArr),
					guestEmailId:guestEmail
				},
				success : function(response) {
					//alert(successfulQuoteConfiguratorMsg.replace("{Number}",response));
					$('.modal-body').text(successfulQuoteConfiguratorMsg.replace("{Number}",response));
					$("#myModal").show();
					window.location.href = "naconfiguratorlist";
				},
				error : function(data, status, er) {
					//alert("data:" + data + "status :" + status + "er:" + er);
					$('.modal-body').text("error: " + r + " status: " + status + " er:" + er);
					$("#myModal").show();
					ajaxindicatorstop();
				}
			});
		}
	});
});

function ValidateEmail(email){

    var validEmail=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if(!validEmail.test(email)){
      return false;
    }else{
      return true;
    }
  }

function addRemark() {
}


function addStaticRemark() {
	 $.each(retrnValArr.componentList, function(index, component) {  
	  if (component.name == locatingRingVar) {  
	   component.isSupplyPart = ( $('input[name=locating_supply]:checked').val() == 1) ? true : false;
	   component.machining = $('select[name=locating-machining]').val();
	  } else if (component.name == upasc) {  
	   component.isSupplyPart = ( $('input[name=upper_supply]:checked').val() == 1) ? true : false;
	   component.machining = $('select[name=upper-machining]').val();
	  } else if (component.name == lpBushingsVar) {  
	   component.isSupplyPart = ( $('input[name=lpbushings_supply]:checked').val()  == 1) ? true : false;
	   component.machining = $('select[name=lpbushings-machining]').val();
	  } else if (component.name == lwasc) {  
	   component.isSupplyPart = ( $('input[name=lower_supply]:checked').val()  == 1) ? true : false;
	   component.machining = $('select[name=lower-machining]').val();
	  } else if (component.name == ejasc) {  
	   component.isSupplyPart = ( $('input[name=ejector_supply]:checked').val()  == 1) ? true : false;
	   component.machining = $('select[name=ejector-machining]').val();
	  } else if (component.name == sprueBushVar) {  
	   component.isSupplyPart = ( $('input[name=spruebush_supply]:checked').val()  == 1) ? true : false;
	   component.machining = $('select[name=spruebush-machining]').val();
	  } 
	 });  
	 $.each(retrnValArr.pinList, function(index, pin) {
	   if (pin.name == spruePullerVar) {  
	    pin.isSupplyPart = ( $('input[name=sprue_supply]:checked').val()  == 1) ? true : false;
	    pin.machining = $('select[name=sprue-machining]').val();
	  }else if (pin.name == leaderPinVar) {  
	    pin.isSupplyPart = ( $('input[name=leader_pin_supply]:checked').val()  == 1) ? true : false;
	    pin.machining = $('select[name=leader_pin-machining]').val();
	  }else if (pin.name == stopPinVar) {  
	    pin.isSupplyPart = ( $('input[name=sp_supply]:checked').val() == 1) ? true : false;
	    pin.machining = $('select[name=sp-machining]').val();
	  }else if (pin.name == returnPinVar) {  
	    pin.isSupplyPart = ( $('input[name=return_supply]:checked').val() == 1) ? true : false;
	    pin.machining = $('select[name=return-machining]').val();
	  }
	 });
	 
	}
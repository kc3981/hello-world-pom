/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(document).ready(function(){
		
	  $('.NewCrdRemember').css('display','none');
	  
		$('.NewCard' ).click(function(){
			
		   $('.savedCardDetail').find('input[type=radio]').prop('checked', false); 
		   $('#savedCard, #AddressSelect, #AddressForm').hide();
		   $('#IframeHold, #AddressSelect').show();
		   $('.NewCrdRemember').css('display','block');
		 //  $("#RememberMeCheckbox").siblings("label").text("Remember Me");
		});
		
		$('.addressUpdate' ).click(function(){
			   $('#IframeHold, #AddressSelect, #AddressForm').hide();
			   $('#savedCard, #AddressSelect').show();
			   // $('#savedCard, #AddressSelect, #AddressForm').fadeToggle();
		//	$("#RememberMeCheckbox").siblings("label").text("Would you like to change the address.");
		});
		
		$('.savedCardDetail input[type=radio]').on('change', function() {
		    $('.savedCardDetail input[type=radio]').not(this).prop('checked', false);  
		    
		   
		});
	 

/*EO Ready*/
});

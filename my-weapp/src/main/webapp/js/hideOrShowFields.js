/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
/**
 * true = visible, false=hide
 * 
 * 1.Show with checked, 
 * 2.Show with unchecked, 
 * 3.Hide with checked, 
 * 4.Hide with unchecked
 * 
 */
/** Function to handle form elements to show or hide in edit/create pages **/
var userApplication = $('#userApplication').val();
//hide Or Show fields 
function hideOrShowFields(val) {
 	//var val = '${hideOrShowFields}';
	console.log("val : " + val);
	var json = JSON.parse(val);
  
	if (json["is.unit.down.flag.visible"] == "1"){
		$('#unit-down').prop('checked', true).siblings().show();
		$('#machine-serial').addClass('form-inline section');
	}
	else if (json["is.unit.down.flag.visible"] == "2"){
		$('#unit-down').prop('checked', false).siblings().show();
		$('#machine-serial').addClass('form-inline section');
	}
	else if (json["is.unit.down.flag.visible"] == "3")
		$('#unit-down').prop('checked', true).hide().siblings().hide();
	else if (json["is.unit.down.flag.visible"] == "4")
		$('#unit-down').prop('checked', false).hide().siblings().hide();

	if (json["is.ship.today.flag.visible"] == "1"){
		$('#ship-today').prop('checked', true).siblings().show();
		$('#machine-serial').addClass('form-inline section');
	}
	else if (json["is.ship.today.flag.visible"] == "2"){
		$('#ship-today').prop('checked', false).siblings().show();
		$('#machine-serial').addClass('form-inline section');
	}
	else if (json["is.ship.today.flag.visible"] == "3")
		$('#ship-today').prop('checked', true).hide().siblings().hide();
	else if (json["is.ship.today.flag.visible"] == "4")
		$('#ship-today').prop('checked', false).hide().siblings().hide();

	if (json["is.ship.complete.flag.visible"] == "1"){
		$('#partial-shipment').prop('checked', true).siblings().show();
		$('#machine-serial').addClass('form-inline section');

}
	else if (json["is.ship.complete.flag.visible"] == "2"){
		$('#partial-shipment').prop('checked', false).siblings().show();
		$('#machine-serial').addClass('form-inline section');

}
	else if (json["is.ship.complete.flag.visible"] == "3")
		$('#partial-shipment').prop('checked', true).hide().siblings().hide();
	else if (json["is.ship.complete.flag.visible"] == "4")
		$('#partial-shipment').prop('checked', false).hide().siblings().hide();
		

	if (json["is.auto.apply.charges.visible"] == "1")
		$('#autoaply-charges').prop('checked', true).siblings().show();
	else if (json["is.auto.apply.charges.visible"] == "2")
		$('#autoaply-charges').prop('checked', false).siblings().show();
	else if (json["is.auto.apply.charges.visible"] == "3")
		$('#autoaply-charges').prop('checked', true).hide().siblings().hide();
	else if (json["is.auto.apply.charges.visible"] == "4")
	{	
		$('#autoaply-charges').prop('checked', false).hide().siblings().hide();
		$('#auto-apply-id').hide();
	} 	
	
	if (json["show.serial.num.for.order"] == "TRUE"){
		$('#machine-serial-no').show();
		$('#machine-serial').show();
	}
	else  {
		$('#machine-serial-no').hide();	
		$('#machine-serial').hide();

	}
	 
	if (json["is.sales.rep.visible"] == "false")
	 $('#sales-id').hide();
		
	if(json["is.charges.visible"] == "false")
	{	
		$('#charges-id').hide();
		$('#charge-value-id').hide();
	}
	
	if (json["is.sales.rep.visible"] == "false" && json["is.charges.visible"] == "false" && (json["is.auto.apply.charges.visible"] == "3" || json["is.auto.apply.charges.visible"] == "4"))
	 	$('#SALES_REP_SECTION').hide();
	
	hideOrShowFieldsInViews(val);
	 
	if (json["is.newshipto.required"] == "TRUE"){ 
	 	$("#ship-to-add").show();
	}
	else{$("#ship-to-add").hide();
	}
	
	// Sales Area feature check, Added by Ganeshan 16th Feb 2016
	//SUPPORT-MIL-223-170216
	//START Bring From MILACRON_CODE_BASE , Milacron we have below code
	//if (typeof json["sales.area.feature"]!="undefined" && (json["sales.area.feature"] == "TRUE" || json["sales.area.feature"] == "true")){ 
	if (typeof json["show.sales.area"]!="undefined" && (json["show.sales.area"] == "TRUE" || json["show.sales.area"] == "true")){ 
	 	$("#salesAreaDiv").show();
	}
		else{$("#salesAreaDiv").hide();
	}
	 //GPD-829 : Estimated Ship Date in Order History
	if(json["estimated.ship.date.flag.visible"] == "false")
	{	
		$('#estimatedShipDate').hide();			
	}else{
		$('#estimatedShipDate').show();	
	}
}
function hideOrShowSalestax(val){
	var json = JSON.parse(val);
	
	 if (json["show.sales.tax"] == "TRUE")
		 $('#additionalCharges').show();
	  
}

function hideOrShowAddressLines(val){
	var json = JSON.parse(val);
	
	 if (json["show.addressline.two"] == "TRUE"){
		 $('#shipToAddressLine2').show();		
		 $('#billToAddressLine2').show();		 
	 }else if (json["show.addressline.three"] == "TRUE"){		 
		 $('#shipToAddressLine3').show();		
		 $('#billToAddressLine3').show();		 
	 }	
	 else{
		 $('#shipToAddressLine2').hide();	
		 $('#billToAddressLine2').hide();
		 $('#shipToAddressLine3').hide();	
		 $('#billToAddressLine3').hide();
	 }
	  
}

function hideOrShowTransportModeFieldsOrders(val){
	var json = JSON.parse(val);
	
	 if (json["is.shipment.terms.flag.visible"] == "TRUE" || json["is.shipment.terms.flag.visible"] == "true"){
		 $("#carrierBillingSelect").parent().parent().show(); 
		 //For Review Page
		 $('#carrierBillingOption').show();
		 $('#carrierBillingOption').prev().show();
	
	 }
	 else{
		 $("#carrierBillingSelect").parent().parent().hide(); 
		 //For Review Page
		 $('#carrierBillingOption').hide();
		 $('#carrierBillingOption').prev().hide();
		
		 
	 }
	  
}

function hideOrShowTransportModeFieldsQuotes(val){
	var json = JSON.parse(val);
	
	 if (json["is.shipment.terms.flag.visible"] == "TRUE" || json["is.shipment.terms.flag.visible"] == "true"){
		 $("#carrierBillingSelect").parent().show(); 
		 $("#carrierBillingOptionLable").show(); 
		 $("#carrierSelect").show(); 
		 //For Review Page
		 $('#paymentTermsLable').show(); 
		 $('#carrierBillingOption').show();
		 $('#shippingMethodLable').show();
		 $('#carrierId').show();
	 }
	 else{
		 $("#carrierBillingSelect").parent().hide(); 
		 $("#carrierBillingOptionLable").hide();
		 $("#carrierSelect").hide(); 
		 //For Review Page
		 $('#paymentTermsLable').hide(); 
		 $('#carrierBillingOption').hide();
		 $('#shippingMethodLable').hide();
		 $('#carrierId').hide();
		 
	 }
	  
}

/** Function to handle form elements to show or hide in view/review pages **/
function hideOrShowFieldsInViews(val){
	//var val = '${hideOrShowFields}';
	console.log("val : " + val);
	var json = JSON.parse(val);
	
	 

	
	if (json["is.ship.complete.flag.visible"] == "3" || json["is.ship.complete.flag.visible"] == "4")
		$('#partialShipment').hide().siblings().hide();
	if (json["is.ship.today.flag.visible"] == "3" || json["is.ship.today.flag.visible"] == "4" )
		$('#shipToday').hide().siblings().hide();
	if (json["is.unit.down.flag.visible"] == "3" || json["is.unit.down.flag.visible"] == "4")
		$('#unitDown').hide().siblings().hide();
	if (json["is.auto.apply.charges.visible"] == "3" || json["is.auto.apply.charges.visible"] == "4" )
	{
		$('#autoApply').hide().siblings().hide();
		$('#SALES_REP_SECTION1').hide();
	}
	if (json["is.sales.rep.visible"] == "false" )
		if(userApplication == "MILACRON"){
			//OM-1390 : ADDED BY ANIKET : ONLY SALES REP SHOULD BE HIDDEN 
			//$('#salesRepDetails').hide().siblings().hide();
			$('.saleRepApplicable').hide();
		}else{
			$('#salesRepDetails').hide().siblings('h5.saleRepApplicable').hide();
		}
	if ((json["is.auto.apply.charges.visible"] == "3" || json["is.auto.apply.charges.visible"] == "4")  && json["is.sales.rep.visible"] == "false" )
		$('#SALES_REP_SECTION').hide(); 
	
	if (json["show.serial.num.for.order"] == "TRUE"){
		$('#machine-serial-no').show();
		$('#machine-serial').show();
	}
	else  {
		$('#machine-serial-no').hide();	
		$('#machine-serial').hide();
	}
}
  function handlepo(){
	var salesCodeId  = $('#salesCodeSelect').val();
	  if (salesCodeId!="undefined" && (salesCodeId == 2||  salesCodeId == 3)){
     	$("#purchase-orderno").attr("readonly", "readonly");
   	}
	  
	  
}
  
  function consignmentOrderStatus(visiblity){
  	
	if(visiblity ==4){
  		$('#consignmentOrderDiv').show();
  	}else{
  		$('#consignmentOrderDiv').hide();
  		$('#consignment-order').prop('checked', false);
  		return;
  	}
  	
  	/*if(typeof value!="undefined")
			$('#consignment-order').prop('checked', value==true?true:false);
  	else
  		$('#consignment-order').prop('checked', false);*/
  } 
  
  function consignmentOrderStatusInViews(visiblity){
	  	if(visiblity ==4){
	  		$('#consignmentOrderDiv').show();
	  	}else{
	  		$('#consignmentOrderDiv').hide();
	  		return;
	  	}
  }
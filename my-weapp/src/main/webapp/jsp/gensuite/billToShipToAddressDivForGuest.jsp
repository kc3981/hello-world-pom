
<script  src="../js/hideOrShowFields.js?version=${properties['application.version']}" type="text/javascript"></script>

<div
	class="col-lg-7 col-md-12 col-sm-12 col-xs-12 column-paddings">
	<div
		class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12  rev-padding-left-right-xs">
		<div class="rev-custom-row column-paddings">
			<label id="labelbillto"
				class="control-label col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings required"><spring:message
					code="label.quote.order.billto" /></label>
	</div>
	<div class="clearfix"></div>
	<div class="bill-to-address">
			<div class="nopadding address-holder" id="bill-to-add-div">
			<!-- Added by Pushpa reviewed by Rajesh - INC-2444 Change in address field structure of Bill To and Ship To in gensuite -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings new-address">
			<span class="required"><i>*</i><input class="form-control" name="billToAddressName" type="text" maxlength="${addressLineMaxLength}" placeholder="<spring:message code="label.creteordercartinit.address.name" />" id="billToAddressName"/></span>
			<!-- Added by Pushpa reviewed by JK - Shipping Addres -> On entering maximum legnth chars into address fields and review quote/order, getting error -->
			<span class="required"><i>*</i><input class="form-control" name="billToAddressLine1" type="text" maxlength="${addressLineMaxLength}" placeholder="<spring:message code="label.creteordercartinit.address.one" />" id="billToAddressLine1"/></span>
		   
		   <!-- Venkatasiva : GPD-2451 -->					
			<input class="form-control" name="billToAddressLine2" type="text" maxlength="${addressLineMaxLength}"
				placeholder="<spring:message code="label.creteordercartinit.address.two" />"
				id="billToAddressLine2" />
			<input class="form-control" name="billToAddressLine3" type="text" maxlength="${addressLineMaxLength}"
				placeholder="<spring:message code="label.creteordercartinit.address.three" />"
				id="billToAddressLine3" />				
			<!-- End : GPD-2451 -->
			<span class="required"><i class="i_required">*</i><input class="form-control" name="billToAddressCity" type="text" placeholder="<spring:message code="label.creteordercartinit.address.city" />" id="billToAddressCity"/></span>
			<!-- Support-MIL-206-020416 For guest user state field is mandatory --> 
			<input class="form-control" name="billToAddressState" type="hidden"  id="billToAddressState"/>
			<!-- GPD-64 -->
			<span id="billToAddressZipCodeAsterisk"><input class="form-control" name="billToAddressZipCode" type="text" placeholder="<spring:message code="label.creteordercartinit.address.zipcode" />" id="billToAddressZipCode"/></span>
			<!-- Venkatasiva -->
						
			<span
				class="required"><i class="i_required">*</i> <select
				class="form-control" id="billToAddressCountry" name="billToAddressCountry">
					<option>-----
						<spring:message code="label.quote.order.select" />
						------
					</option>
			</select> </span>
			<span
				class="required"><i class="i_required">*</i><select
				class="form-control" id="billToStateSelect" name="state">
					<option>-----
						<spring:message code="label.quote.order.select" />
						------
					</option>
			</select> </span>
			<!-- Venkatasiva End -->
		</div>
			</div>
			<input type="hidden" id="billToNewAddExist"
				name="billToNewAddExist" value="true" />
		</div>

	</div>
	<div
		class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 rev-padding-left-right-xs" >
		<div class="rev-custom-row column-paddings">
			<label style="width: 100px"
				class="control-label col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings required"><spring:message
					code="label.quote.order.shipto" /></label>
			<div id="CopyAddress"
				style="vertical-align: middle; margin: 11px 0; font-size: 15px; display: inline-block; margin-top: 0px"> 
				<input type="checkbox"
					style="margin-right: 9px; vertical-align: top;"><spring:message code="label.same.as.billto" />
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="ship-to-address">

			<div class="nopadding address-holder" id="ship-to-add-div">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings new-address" >
				<span class="required"><i>*</i><input class="form-control" name="shipToAddressName" type="text" maxlength="${addressLineMaxLength}" placeholder="<spring:message code="label.creteordercartinit.address.name" />" id="shipToAddressName"/></span>
				<!-- Added by Pushpa reviewed by JK - Shipping Addres -> On entering maximum legnth chars into address fields and review quote/order, getting error -->
				<span class="required"><i class="i_required">*</i><input class="form-control" name="shipToAddressLine1"  type="text" maxlength="${addressLineMaxLength}" placeholder="<spring:message code="label.creteordercartinit.address.one" />" id="shipToAddressLine1"/></span>
				<!-- Venkatasiva : GPD-2451 -->
				<input class="form-control"
						name="shipToAddressLine2" type="text" maxlength="${addressLineMaxLength}"
						placeholder="<spring:message code="label.creteordercartinit.address.two" />"
						id="shipToAddressLine2"/> <input class="form-control"
						name="shipToAddressLine3" type="text" maxlength="${addressLineMaxLength}"
						placeholder="<spring:message code="label.creteordercartinit.address.three" />"
						id="shipToAddressLine3"/>
				<!-- End : GPD-2451 --> 
				<span class="required"><i class="i_required">*</i><input class="form-control" name="shipToAddressCity" type="text" placeholder="<spring:message code="label.creteordercartinit.address.city" />" id="shipToAddressCity"/></span>
				<!-- Support-MIL-206-020416 For guest user state field is mandatory --> 
				<input class="form-control" name="shipToAddressState" type="hidden"  id="shipToAddressState"/>
				<!-- Venkatasiva --> <!-- GPD-64 -->
				<span id="shipToAddressZipCodeAsterisk"><input
				class="form-control" name="shipToAddressZipCode"
				type="text"
				placeholder="<spring:message code="label.creteordercartinit.address.zipcode" />"
				id="shipToAddressZipCode" /></span> 
				<span
				class="required"><i class="i_required">*</i> <select
				class="form-control" id="shipToAddressCountry" name="shipToAddressCountry">
					<option>-----
						<spring:message code="label.quote.order.select" />
						------
					</option>
			</select> </span>
			<!-- Venkatasiva End -->
				<span class="required"><i class="i_required">*</i>
				<select class="form-control" id="shipToStateSelect" name="stateShipTo">
					<option>----- <spring:message code="label.quote.order.select" /> ------</option>
				</select>
				</span>
			</div>
			</div>
			<input type="hidden" id="shipToNewAddExist"
				name="shipToNewAddExist" value="true" />
		</div>
	</div>
</div>

<script>
//Venkatasiva : GPD-2451
$(document).ready(function(){
	hideOrShowAddressLines('${hideOrShowFields}'); //hide or show fields based on organization id
});
function validateBillToShipToAddressGuest(){
	
	var zipcodeValidationCountries = "${properties['zipcode.validation.countries']}";//GPD-64
	
	if($('#billToAddressName').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.billto.name.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#billToAddressLine1').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.billto.addline1.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#billToAddressCity').val()==""){
		$('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtocity.notempty' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}else if($('#billToAddressState').val()==""){
		//Support-MIL-206-020416 For guest user state field is mandatory 
		      $('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtostate.notempty' javaScriptEscape='true'/>");
          $("#myModal").show();
          return false;
    }
	else if((zipcodeValidationCountries.indexOf($('#billToAddressCountry').val())>-1) && $('#billToAddressZipCode').val()==""){
		$('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtozipcode.notempty' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($.trim($('#shipToAddressName').val())==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addname.validation' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}
	else if($.trim($('#shipToAddressLine1').val())==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addname.empty.validation' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}
	else if($('#shipToAddressCity').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addcity..validation' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}// GPD-64 
	else if((zipcodeValidationCountries.indexOf($('#shipToAddressCountry').val())>-1) && $('#shipToAddressZipCode').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addzip.validation' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}
	//INC-2805 -- COUNTRY VALIDATION -- ADDED BY ANIKET-- REVIEWED BY JK
	else if($('#shipToAddressCountry').val()=="-1"){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addcountry.empty.validation' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}
	//INC-2805 ENDS
	else if($('#shipToAddressState').val()==""){
		//Support-MIL-206-020416 For guest user state field is mandatory 
		  $('.modal-body').text("<spring:message code='alert.quote.order.shipto.addState.validation' javaScriptEscape='true'/>");
          $("#myModal").show();
          return false;
	}
	else if($('#contactNameInput').val()==""){
		$('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.contactname.notempty' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}
	else if($('#contactEmailInput').val()==""){
		$('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.email.notempty' javaScriptEscape='true'/>");
		$("#myModal").show();
		return false;
	}	
	else{
		 return true;
	}
}

</script>


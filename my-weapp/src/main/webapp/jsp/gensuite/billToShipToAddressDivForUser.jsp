<script  src="../js/hideOrShowFields.js?version=${properties['application.version']}" type="text/javascript"></script>

<div
	class="col-lg-7 col-md-12 col-sm-12 col-xs-12 column-paddings">
	<div
		class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 rev-padding-left-right-xs" id="billToDivHide">
		<div class="rev-custom-row column-paddings">
			<label 
				class="control-label col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings required"><spring:message
					code="label.quote.order.billto" /></label>
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 nopadding">

				<select class="form-control selectwidth" id="billtoSelect"
					name="billToAddress">
				</select>
			</div>
			<div
				class="col-lg-3 col-md-3 col-sm-3 bill-to-add nopadding-xs"
				id="div-bill-to">
				<a href="javascript:;" class="btn-addtocart add "
					id="bill-to-add" data-toggle="tooltip" data-placement="top"
					title="<spring:message code="label.quote.reference.message" />"><spring:message
						code="label.quote.order.add" /></a> <a href="javascript:;"
					class="btn-addtocart add " style="display: none;"
					id="bill-to-cancel" data-toggle="tooltip"
					data-placement="top"
					title="<spring:message code="label.creteordercartinit.msg.cancel.address" />"><spring:message
						code="label.quote.order.reset" /></a>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="bill-to-address">

			<div class="column-paddings address-holder">
				<p id="billToDetails"></p>
			</div>
			<!-- Added by Pushpa reviewed by Rajesh - INC-2444 Change in address field structure of Bill To and Ship To in gensuite -->
			<div class="nopadding address-holder" style="display: none;"
				id="bill-to-add-div">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings new-address">
					<span class="required"><i>*</i><input
						class="form-control" name="billToAddressName"
						maxlength="${addressLineMaxLength}" type="text"
						placeholder="<spring:message code="label.creteordercartinit.address.name" />"
						id="billToAddressName" /></span>
					<!-- Added by Pushpa reviewed by JK - Shipping Addres -> On entering maximum legnth chars into address fields and review quote/order, getting error -->
					<span class="required"><i>*</i><input
						class="form-control" name="billToAddressLine1" type="text"
						maxlength="${addressLineMaxLength}"
						placeholder="<spring:message code="label.creteordercartinit.address.one" />"
						id="billToAddressLine1" /></span>
					<!-- <input class="form-control" name="billToAddressLine2" type="text" placeholder="<spring:message code="label.creteordercartinit.address.two" />" id="billToAddressLine2"/>
			<input class="form-control" name="billToAddressLine3" type="text" placeholder="<spring:message code="label.creteordercartinit.address.three" />" id="billToAddressLine3"/>-->
					<span class="required"><i class="i_required">*</i><input
						class="form-control" name="billToAddressCity" type="text"
						placeholder="<spring:message code="label.creteordercartinit.address.city" />"
						id="billToAddressCity" /></span>
					<!-- Support-MIL-206-020416 For guest user state field is mandatory  -->
					<%-- <span class="required"><i>*</i><input class="form-control" name="billToAddressState" maxlength="3" type="text" placeholder="<spring:message code="label.creteordercartinit.address.state" />" id="billToAddressState"/></span> --%>
					<input class="form-control" name="billToAddressState"
						type="hidden" id="billToAddressState" /> 
						<!-- GSP-51 Venkatasiva --> <!-- GPD-64 -->
						 <span id="billToAddressZipCodeAsterisk"><input class="form-control"
						name="billToAddressZipCode" type="text"
						placeholder="<spring:message code="label.creteordercartinit.address.zipcode" />"
						id="billToAddressZipCode" /></span> 																							
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
						
				</div>
			</div>
			<input type="hidden" id="billToNewAddExist"
				name="billToNewAddExist" value="false" />
		</div>

	</div>
	<div
		class="form-inline col-lg-6 col-md-6 col-sm-6 col-xs-12 rev-padding-left-right-xs">

		<div class="rev-custom-row column-paddings">
			<div class="col-lg-6 col-xs-12 rev-padding-left-right" >
				<label 
					class="control-label col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings required"><spring:message
						code="label.quote.order.shipto" /> </label>
			</div>
			<div class="col-xs-6 rev-padding-left-right"
				>
				<c:if test="${isRetailUser == true}">
					<span id="CopyAddress"> <input type="checkbox">Same
						as Bill To
					</span>
				</c:if>
			</div>
			<div class="rev-custom-row ">
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 nopadding">
				<select class="form-control selectwidth sel"
					id="shiptoSelect" name="shipToAddress">

				</select>
			</div>
			<div
				class="col-lg-4 col-md-4 col-sm-4 col-xs-4 bill-to-add nopadding-xs"
				style="margin: 0px; padding: 0px 2px 0px 5px;">
				<div class="shipToEdit"
					style=" display: inline-block;">
					<button type="button" class="btn " data-toggle="modal"
						data-target="#shiptoTable">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</div>
				<!-- GPD-51: Modified by Venkatasiva, Add and Reset data changed from static content to dynamic content and Reset button moved to bottom of the address -->											
				<a href="javascript:;" class="btn-addtocart add spaceLeft10"
					id="ship-to-add" data-toggle="tooltip" data-placement="top"
					title=""
					data-original-title="<spring:message code="label.creteordercartinit.msg.add.address" />"
					style="margin-left: 0px; margin-top: 1px;"><span class="glyphicon glyphicon-edit"></span></a> 
					<!-- GPD-51 End -->

				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="ship-to-address">
			<div class="column-paddings address-holder" style="margin-top:-9px;">
				<p id="shipToDetails"></p>
			</div>
			<!-- Added by Pushpa reviewed by Rajesh - INC-2444 Change in address field structure of Bill To and Ship To in gensuite -->
			<div class="nopadding address-holder" style="display: none;"
				id="ship-to-add-div">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings new-address">
					<span class="required"><i>*</i><input
						class="form-control" name="shipToAddressName" type="text" maxlength="${addressLineMaxLength}"						
						placeholder="<spring:message code="label.creteordercartinit.address.name" />"
						id="shipToAddressName" /></span>
					<!-- Added by Pushpa reviewed by JK - Shipping Addres -> On entering maximum legnth chars into address fields and review quote/order, getting error -->
					<span class="required"><i>*</i><input
						class="form-control" name="shipToAddressLine1"
						type="text" maxlength="${addressLineMaxLength}"
						placeholder="<spring:message code="label.creteordercartinit.address.one" />"
						id="shipToAddressLine1" /></span>
						<!-- Venkatasiva : GPD-2451 -->
					<input class="form-control"
								name="shipToAddressLine2" type="text" maxlength="${addressLineMaxLength}"
								placeholder="<spring:message code="label.creteordercartinit.address.two" />"
								id="shipToAddressLine2"/> <input class="form-control"
								name="shipToAddressLine3" type="text" maxlength="${addressLineMaxLength}"
								placeholder="<spring:message code="label.creteordercartinit.address.three" />"
								id="shipToAddressLine3"/>
						<!-- End : GPD-2451 --> 
					<!-- <input class="form-control" name="shipToAddressLine2" type="text" placeholder="<spring:message code="label.creteordercartinit.address.two" />" id="shipToAddressLine2"/>
				<input class="form-control" name="shipToAddressLine3" type="text" placeholder="<spring:message code="label.creteordercartinit.address.three" />" id="shipToAddressLine3"/>-->
					<span class="required"><i class="i_required">*</i><input
						class="form-control" name="shipToAddressCity" type="text"
						placeholder="<spring:message code="label.creteordercartinit.address.city" />"
						id="shipToAddressCity" /></span>
					<!-- Support-MIL-206-020416 For guest user state field is mandatory -->
					<input class="form-control" name="shipToAddressState"
						type="hidden" id="shipToAddressState" /> 
						<!-- GPD-51: Modified by Venkatasiva --><!-- GPD-64 -->
						<span id="shipToAddressZipCodeAsterisk"><input
						class="form-control"													
						name="shipToAddressZipCode" type="text"
						placeholder="<spring:message code="label.creteordercartinit.address.zipcode" />"
						id="shipToAddressZipCode" /></span> 
						<span
							class="required"><i>*</i> <select
							class="form-control" id="shipToAddressCountry" name="shipToAddressCountry">
								<option>-----
									<spring:message code="label.quote.order.select" />
									------
								</option>
						</select> </span>
						<span
							class="required"><i style="margin-left: -10px;">*</i><select
							class="form-control" id="stateSelect" name="state">
								<option>-----
									<spring:message code="label.quote.order.select" />
									------
								</option>
						</select> </span>												
						<br />		
						<a
						href="javascript:;" class="btn-addtocart add "
						id="ship-to-cancel"
						data-toggle="tooltip" data-placement="top" title=""
						data-original-title="<spring:message code="label.creteordercartinit.msg.cancel.address" />"><spring:message
						code="label.quote.order.reset" /></a>	
						<!-- GPD-51: Venkatasiva End  -->
				</div>
			</div>
			<input type="hidden" id="shipToNewAddExist"
				name="shipToNewAddExist" value="false" />
		</div>
	</div>
</div>

<script type="text/javascript">
//Venkatasiva : GPD-2452
$(document).ready(function(){
	hideOrShowAddressLines('${hideOrShowFields}'); //hide or show fields based on organization id
});
function validateBillToShipToAddressUser(){
	
	var customer = $('#customer-no').val();
	var billTo = $('#billtoSelect').val();
	var shipTo = $('#shiptoSelect').val();	
	var cartItemCount = $('#count').text();
	var zipcodeValidationCountries = "${properties['zipcode.validation.countries']}";//GPD-64
	if(customer===null || customer==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.customer.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}	
	else if(billTo===null || billTo==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.billto.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if(shipTo===null || shipTo==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if(cartItemCount==0){
		$('.modal-body').text("<spring:message code='alert.order.lineitem.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	
	else if($('#billToNewAddExist').val()=="true" && $('#billToAddressName').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.billto.name.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#billToNewAddExist').val()=="true" && $('#billToAddressLine1').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.billto.addline1.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#billToNewAddExist').val()=="true" && $('#billToAddressCity').val()==""){
		$('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtocity.notempty' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#billToNewAddExist').val()=="true" && ($('#billToAddressState').val()=="" || $('#billToStateSelect').val()=="")){
		    //Support-MIL-206-020416 For guest user state field is mandatory 
	      $('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtostate.notempty' javaScriptEscape='true'/>")
	      $("#myModal").show();
	      return false;
	}
	else if($('#billToNewAddExist').val()=="true" && (zipcodeValidationCountries.indexOf($('#billToAddressCountry').val())>-1) && $('#billToAddressZipCode').val()==""){
		$('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtozipcode.notempty' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#shipToNewAddExist').val()=="true" && $.trim($('#shipToAddressName').val())==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addname.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#shipToNewAddExist').val()=="true" && $.trim($('#shipToAddressLine1').val())==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addname.empty.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
	else if($('#shipToNewAddExist').val()=="true" && $('#shipToAddressCity').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addcity..validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}		// GPD-64 
	else if($('#shipToNewAddExist').val()=="true" && (zipcodeValidationCountries.indexOf($('#shipToAddressCountry').val())>-1) && $('#shipToAddressZipCode').val()==""){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addzip.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
    //INC-2805 -- COUNTRY VALIDATION -- ADDED BY ANIKET-- REVIEWED BY JK
    else if($('#shipToNewAddExist').val()=="true" && $('#shipToAddressCountry').val()=="-1"){
		$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addcountry.empty.validation' javaScriptEscape='true'/>")
		$("#myModal").show();
		return false;
	}
    //INC-2805 ENDS
    else if($('#shipToNewAddExist').val()=="true" && ($('#shipToAddressState').val()=="" || $('#shipToStateSelect').val()=="")){
	    //Support-MIL-206-020416 For guest user state field is mandatory 
      $('.modal-body').text("<spring:message code='alert.quote.order.shipto.addState.validation' javaScriptEscape='true'/>")
      $("#myModal").show();
      return false;
	}  
	else{
		return true
	}
	
}
</script>
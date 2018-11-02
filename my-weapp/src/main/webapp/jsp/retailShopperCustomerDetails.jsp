<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value='en_US' />
<fmt:setBundle basename='messages' />
<script src="../js/errorHandler.js" type="text/javascript"></script>
<script src="../js/cart-count.js" type="text/javascript"></script>
<!-- GPD-51: Venkatasiva, Added for dependent country and state drop down list-->
	<script type= "text/javascript" src = "../js/countries.js"></script>
	<!-- End -->
<style>
.new-address > .required i{
    position: absolute;
    left: -10px;
    top:5px;
  }
</style>
<div id="profile-settigs-container"	class="tab-content profile-data">


										<div class="col-sm-6 col-md-6 col-lg-6 profileBox account-details-padding">
				                            <label for="customer-no" class="control-label column-paddings required"><spring:message code="lable.customerName" /></label>
				                            
				                                <input type="text" id="customer-name" class="ui-input-wt-help form-control ui-autocomplete-input" ng-model="customerName" name="customerName" required/>
												<input type="hidden" id="customerVal" class="form-control" /> 
												<input type="hidden" id="billToAddressId" class="form-control" /> 
												<input type="hidden" id="shipToAddressId" class="form-control" /> 
												<input type="hidden" id="selectedorg" class="form-control" /> 
				                           
				                             <div class="col-lg-1">
			                            </div>
			                            </div>
										<div class="clearfix spaceTop20 "></div>
										<%-- <c:forEach items="${profileDetailsVO.organizationDetailList}"
											var="organization" varStatus="status"> --%>
								 <div id="tabs-<c:out value="${status.count}"/>" class="billShipDetails nav nav-pills nav-justified column-paddings ui-tabs ui-widget ui-widget-content ui-corner-all">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pull-left bill-ship">
										 <div class="col-sm-6 col-md-6 col-lg-6 account-details-padding">
				                                <div class="column-paddings">
				                                    <span class="control-label col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings required"><b><spring:message code="label.quote.order.billto" /></b></span>
				                                </div>
				                                <div class="clearfix"></div>
												<div class="bill-to-address">
				
				                                
												<div class="nopadding address-holder" id="bill-to-add-div">
												
				                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings new-address">
				                                    	<!-- NREV-1338: for address line 1 and address line 2 limiting the number of characters to 40. Added by Pooja. Reviewed by Rajesh  -->
				                                    	<span class="required"><i>*</i><input ng-model="billToAddressName" required class="form-control" name="billToAddressName" maxlength="40" type="text" placeholder="<spring:message code="label.creteordercartinit.address.name" />" id="billToAddressName"/></span>
				                                        <span class="required"><i>*</i><input ng-model="billToAddressLine1" required class="form-control" name="billToAddressLine1" maxlength="40" type="text" placeholder="<spring:message code="label.creteordercartinit.address.one" />" id="billToAddressLine1"/></span>
				                                        <%-- <input class="form-control" ng-model="billToAddressLine2" name="billToAddressLine2" type="text" placeholder="<spring:message code="label.creteordercartinit.address.two" />" id="billToAddressLine2"/>
				                                        <input class="form-control" ng-model="billToAddressLine3" name="billToAddressLine3" type="text" placeholder="<spring:message code="label.creteordercartinit.address.three" />" id="billToAddressLine3"/> --%>                    
				                                        <span class="required"><i>*</i><input ng-model="billToAddressCity" required class="form-control" name="billToAddressCity" type="text" placeholder="<spring:message code="label.creteordercartinit.address.city" />" id="billToAddressCity"/></span>
				                                        <input class="form-control" name="billToAddressState" type="hidden"  id="billToAddressState"/>
					                                    <!-- GPD-64 -->
				                                        <span id="billToAddressZipCodeAsterisk"><input ng-model="billToAddressZipCode" required class="form-control" name="billToAddressZipCode" type="text" placeholder="<spring:message code="label.creteordercartinit.address.zipcode" />" id="billToAddressZipCode"/></span>
				                                       <!-- Venkatasiva -->
				                                        <%-- <input class="form-control" ng-model="billToAddressCountry"  name="billToAddressCountry" type="text" maxlength="2" placeholder="<spring:message code="label.creteordercartinit.address.country" />" id="billToAddressCountry"/> --%>
				                                        <span
																class="required"><i >*</i> <select
																class="form-control" id="billToAddressCountry" name="billToAddressCountry">
																	<option>-----
																		<spring:message code="label.creteordercartinit.address.country" />
																		------
																	</option>
															</select> </span>
															<span
																class="required"><i >*</i><select
																class="form-control" id="billToStateSelect" name="billToStateSelect">
																	<option>-----
																		<spring:message code="label.quote.order.select" />
																		------
																	</option>
															</select> </span>
				                                        
				                                        <%-- <span class="required"><i>*</i>
							                                <select class="form-control" id="billToStateSelect" name="billToStateSelect" ng-model="billToStateSelect" required>
							                                    <option>----- <spring:message code="label.quote.order.select" /> ------</option>
							                                </select>
							                                </span> --%>
				                                    </div>
				                                   
				                                </div>
												<input type="hidden" id="billToNewAddExist" name="billToNewAddExist" value="true"/> 
				                                </div>
				                            </div>
											<div class="col-sm-6 col-md-6 col-lg-6 account-details-padding">
				                                <div class="column-paddings">
												<span class="control-label col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings required" style="margin-top:-6px;"><b><spring:message code="label.quote.order.shipto" /></b>
													<label id="CopyAddress" for="copyAddress">
														<input type="checkbox" id="copyAddress" ng-model="CopyAddress" name="copyAddress"
															style="margin-right: 9px; vertical-align: top;"><spring:message code="label.same.as.billto" />
													</label> 
												</span>
													
												</div>
				                                <div class="clearfix"></div>
												 <div class="ship-to-address">
				                                
												<div class="nopadding address-holder" id="ship-to-add-div">
					                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings new-address">
					                                    	<!-- NREV-1338: for address line 1 and address line 2 limiting the number of characters to 40. Added by Pooja. Reviewed by Rajesh  -->
				                                    		<span class="required"><i>*</i><input class="form-control" ng-model="shipToAddressName" required name="shipToAddressName" maxlength="40" type="text" placeholder="<spring:message code="label.creteordercartinit.address.name" />" id="shipToAddressName"/></span>
					                                        <span class="required"><i>*</i><input class="form-control" ng-model="shipToAddressLine1" required name="shipToAddressLine1" maxlength="40" type="text" placeholder="<spring:message code="label.creteordercartinit.address.one" />" id="shipToAddressLine1"/></span>
					                                        <%-- <input class="form-control" ng-model="shipToAddressLine2" name="shipToAddressLine2" type="text" placeholder="<spring:message code="label.creteordercartinit.address.two" />" id="shipToAddressLine2"/>
					                                        <input class="form-control" ng-model="shipToAddressLine3" name="shipToAddressLine3" type="text" placeholder="<spring:message code="label.creteordercartinit.address.three" />" id="shipToAddressLine3"/> --%>
					                                        
					                                        <span class="required"><i>*</i><input class="form-control" ng-model="shipToAddressCity" required name="shipToAddressCity" type="text" placeholder="<spring:message code="label.creteordercartinit.address.city" />" id="shipToAddressCity"/></span>
					                                        <!-- Support-MIL-206-020416 For guest user state field is mandatory --> 
					                                        <input class="form-control" ng-model="shipToAddressState" name="shipToAddressState" type="hidden"  id="shipToAddressState"/>
					                                        <%-- <span class="required"><i>*</i>
							                                <select class="form-control" id="shipToStateSelect" name="shipToStateSelect" ng-model="shipToStateSelect" required>
							                                    <option>----- <spring:message code="label.quote.order.select" /> ------</option>
							                                </select>
							                                </span> --%>
							                                <!-- GPD-64 -->
					                                        <span id="shipToAddressZipCodeAsterisk"><input class="form-control" ng-model="shipToAddressZipCode" required name="shipToAddressZipCode" type="text" placeholder="<spring:message code="label.creteordercartinit.address.zipcode" />" id="shipToAddressZipCode"/></span>
					                                       <%--  <input class="form-control" ng-model="shipToAddressCountry" name="shipToAddressCountry" type="text" maxlength="2" placeholder="<spring:message code="label.creteordercartinit.address.country" />" id="shipToAddressCountry"/> --%>
					                                       <span
																class="required"><i >*</i> <select
																class="form-control" id="shipToAddressCountry" name="shipToAddressCountry">
																	<option>-----
																		<spring:message code="label.creteordercartinit.address.country" />
																		------
																	</option>
															</select> </span>
															<span
																class="required"><i >*</i><select
																class="form-control" id="shipToStateSelect" name="shipToStateSelect">
																	<option>-----
																		<spring:message code="label.quote.order.select" />
																		------
																	</option>
															</select> </span>
					                                    </div>
					                                </div>
													<input type="hidden" id="shipToNewAddExist" name="shipToNewAddExist" value="true"/> 
				                                </div>
				                            </div> 
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pull-left column-paddings">
										<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 btn-group">
										<label class="alignLeft"><spring:message code="label.myaccount.defaultlanguage"/> </label>
											<select name="language" id="languageList"
												class="form-control selectBtn language">
											<c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
         												<option value="${item.key}" ${item.key == sessionScope['scopedTarget.genericUserProperties'].languageId ? 'selected' : ''}>${item.value}</option>
      												</c:forEach>
											</select>
										</div>
									</div>												
								    <div class="col-sm-6 col-md-6 col-lg-6"></div>
										<div class="save-info col-lg-12 col-md-12 col-sm-12 col-xs-12 save-profile">
												<!-- Error Msgs --> 
												<p class="text-danger"
													 ng-show="
													 formCtrl.customerName.$error.required || 
													 formCtrl.billToAddressName.$error.required ||
													 formCtrl.billToAddressLine1.$error.required ||
													 formCtrl.billToAddressCity.$error.required ||
													 formCtrl.billToStateSelect.$error.required ||
													 formCtrl.billToAddressZipCode.$error.required ||
													 formCtrl.shipToAddressName.$error.required ||
													 formCtrl.shipToAddressLine1.$error.required ||
													 formCtrl.shipToAddressCity.$error.required ||
													 formCtrl.shipToStateSelect.$error.required ||
													 formCtrl.shipToAddressZipCode.$error.required
													 "><%-- <spring:message code="alert.quote.order.customer.validation"/> --%></p>
									 		<p style="color: #006400;" class="profile-update"> ${saveResult} </p>
											<p class="validation-message" style="visibility: hidden"></p>
										<button class="save-button profile-save ui-no-border" formnovalidate id="retail-profile-save">
											<span
											class="glyphicon glyphicon-floppy-save"></span><spring:message code="label.mymachines.save"/></button>
									</div> 
								</div> 
							<%-- </c:forEach> --%>
	
</div>
 <!-- custome alert Added by krupa reviewed by Chinnam for Alert message for address validation-->
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
	  <!-- GPD-51: Venkatasiva -->
	<script language="javascript">
		populateCountries("billToAddressCountry", "billToStateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	</script>
	<script language="javascript">
		populateCountries("shipToAddressCountry", "shipToStateSelect"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	</script>
	<!-- End -->
	<script>
	
	
	
	

	function loadinitialvalues() {
		$('#retail-profile-save').removeClass('not-active');
	}
	function getRetailShoperCustomerDetails(organizationID){
        $.ajax({
     	    type: "GET",
     	    url: "profileSettingRetailShopper",
     	    data: {selectedOrganization:organizationID},
     	    success: function(data){
     	     console.log("Success :"+data);
         	    var profileVoObj;
    			var val = data;
    			var json = JSON.parse(val).userProfileVo;
    			globalJson = json;//Global JSON value
    			globalProfileBoolean = false;
    			console.log("json: " + json);
    			var orgList = json.organizationDetailList ; 
    			var defaultCustomer = json.customer;
    			var defaultCustomerId = json.customerId;
    			var defaultBillToAddress = json.billToAddress;
    			var defaultBillToAddressId = json.billToAddressId;
    			var defaultShipToAddress = json.shipToAddress;
    			var defaultShipToAddressId = json.shipToAddressId;
    			var selectedorg = jQuery.parseJSON(val).selectedOrganization;
    			if(selectedorg!=null){
		    			$("#selectedorg").val(selectedorg);
    			}
    			//Venkatasiva
    			//Set Customer Reference Values 
    			if(defaultCustomer!=null){
    				if(null!=defaultCustomer.customerName){
		    			$("#customer-name").val(defaultCustomer.customerName);
    				}
    			}
    			
    			
    			//Set Bill To Drop For Default 
    			if(null!=defaultBillToAddress && null!=defaultBillToAddressId){
    				
    				var scope = angular.element($('#myaccount-form')).scope();
    		           scope.$apply(function(){
    		            $("#billToAddressId").val(defaultBillToAddressId);
    		            scope.billToAddressName= json.billToAddress.addressName;
    		            scope.billToAddressLine1= json.billToAddress.addressLine1; //* Please fill shipToAddressName
    		            scope.billToAddressLine2= json.billToAddress.addressLine2;
    		            scope.billToAddressLine3= json.billToAddress.addressLine3; 
    		            scope.billToAddressCity = json.billToAddress.addressCity; //* Please fill shipToAddressCity
    		            scope.billToAddressZipCode= json.billToAddress.addressZipCode; //* Please fill shipToAddressZipCode
    		            scope.billToAddressCountry= json.billToAddress.addressCountry === null ? "-" :json.billToAddress.addressCountry;
    		           
    		           //Venkatasiva
    					  console.log("billToAddressCountry: " + json.billToAddress.addressCountry);
    					  if(typeof json.billToAddress.addressCountry!="undefined"){    						 
    						  $("#billToAddressCountry").val(json.billToAddress.addressCountry); 
    					  }else {
    						  $("#billToAddressCountry").val("-1"); 
    					  }    					 
    					  populateStates( "billToAddressCountry", "billToStateSelect" );
    					  $("#billToAddressState").val(json.billToAddress.addressState);
    					  $("#billToStateSelect").val(json.billToAddress.addressState);
    		        	  // $("#billToStateSelect").trigger('change');
    		           });
    			 
    			}
    			//Set Ship To Drop For Default 
    			if(null!=defaultShipToAddress && null!=defaultShipToAddressId){
    				
    				 var scope = angular.element($('#myaccount-form')).scope();
    		          scope.$apply(function(){
    		           $("#shipToAddressId").val(defaultShipToAddressId);
    		           scope.shipToAddressName= defaultShipToAddress.addressName;
    		           scope.shipToAddressLine1= defaultShipToAddress.addressLine1; //* Please fill shipToAddressName
    		           scope.shipToAddressLine2= defaultShipToAddress.addressLine2;
    		           scope.shipToAddressLine3= defaultShipToAddress.addressLine3; 
    		           scope.shipToAddressCity = defaultShipToAddress.addressCity; //* Please fill shipToAddressCity
    		           scope.shipToAddressZipCode= defaultShipToAddress.addressZipCode; //* Please fill shipToAddressZipCode
    		           scope.shipToAddressCountry= defaultShipToAddress.addressCountry === null ? "-" :defaultShipToAddress.addressCountry; 
    		           //Venkatasiva
    		          console.log("shipToAddressCountry: " + defaultShipToAddress.addressCountry);
    		          if(typeof json.shipToAddress.addressCountry!="undefined"){    		        	  
    		        	  $("#shipToAddressCountry").val(defaultShipToAddress.addressCountry);
    		          }else{
    		        	  $("#shipToAddressCountry").val("-1"); 
    		          } 					  
 					  populateStates( "shipToAddressCountry", "shipToStateSelect" );
 					  $("#shipToAddressState").val(defaultShipToAddress.addressState);
 					  $("#shipToStateSelect").val(defaultShipToAddress.addressState);
 					  scope.shipToStateSelect = $("#shipToStateSelect").val(); 
    		          });
    		          
    			}
    			//Set Customer Id 
    			$("#customerVal").val(defaultCustomerId);
    			
    			
    			
		hideOrShowFields(json.hideOrShowFieldsJSON);
				$('div.pageLoader').hide();
     	    },
     	    error: function(jqxhr, textStatus, error) {
     	    	$('div.pageLoader').hide();
     	     // 15-01-2015-EH Handling
              var err = jqxhr.status;
              var msg = jqxhr.responseText;
              $(".pageLoader").hide();
              myErrObj.raise(err,msg,textStatus);
     	    }
     	  });
	}
	//Copy Bill to Address to ship To.
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
	            	 var scope1 = angular.element($('#copyAddress')).scope();
	 	     		scope1.$apply(function(){
	 	     			scope1.shipToAddressName= Name;
	 	     			scope1.shipToAddressLine1= Line1; //* Please fill shipToAddressName
	 	     			scope1.shipToAddressLine2= Line2;
	 	     			scope1.shipToAddressLine3= Line3; 
	 	     			scope1.shipToAddressCity= City; //* Please fill shipToAddressCity
	 	     			scope1.shipToAddressZipCode= zipcode; //* Please fill shipToAddressZipCode
	 	     			scope1.shipToAddressCountry= country; 
	 	     			//Venkatasiva
	 	     			$("#shipToAddressCountry").val(country);
	 	     			populateStates("billToAddressCountry", "shipToStateSelect");
	 	     			$('#shipToAddressState').val(state);
	 	     			$("#shipToStateSelect").val($("#billToStateSelect").val());
	 	     			$("#shipToStateSelect").trigger('change');
	 	     			scope1.shipToStateSelect = $("#billToStateSelect").val(); 
	 	     		}); 
	            }else{ 
	            	$('.modal-body').text("Please Fill In Bill To Details")
	        		$("#myModal").show();
	            	$('#CopyAddress input[type="checkbox"]').prop( "checked", false );
	            
	            	}
	         }else{
	        	 var scope = angular.element($('#copyAddress')).scope();
	     		scope.$apply(function(){
	     			debugger;
	     			scope.shipToAddressName="";
	     			scope.shipToAddressLine1=""; //* Please fill shipToAddressName
	     			scope.shipToAddressLine2="";
	     			scope.shipToAddressLine3=""; 
	     			scope.shipToAddressCity=""; //* Please fill shipToAddressCity
	     			scope.shipToAddressZipCode=""; //* Please fill shipToAddressZipCode
	     			scope.shipToAddressCountry="";
	     			scope.shipToAddressState="";
	     			scope.shipToAddressCountry="";
	     			$("#shipToAddressCountry").val("-1");
	     			if(typeof state!="undefined"){
						var stateId =$("#shipToStateSelect").find('option:contains(----- Select ------):first').val();
						$("#shipToStateSelect").val(stateId);
						var scope1 = angular.element($('#copyAddress')).scope();
		 	     		scope1.$apply(function(){
		 	     			scope.shipToStateSelect=stateId; 
		 	     			});
						
					}
	     		}); 
	     		
      });
	//submit form action for Profile setting
	$('#retail-profile-save').click(function() {
						if($(this).hasClass('not-active')){
							e.preventDefault();
							return false;
						}
			//Added by krupa reviewed by Chinnam for Alert message for address validation		
			var validateResult = addressValidation();
        	if(validateResult){  
        		$('div.pageLoader').show();
				var selectedBillTo = $("#billToAddressName").val();//$(this).parent('.save-profile').siblings('.bill-ship').find('.billto').find('.billToList option:selected').val();
				var selectedShipTo = $("#shipToAddressName").val();//$(this).parent().siblings('.bill-ship').find('.shipto').find('.shipToList option:selected').val();
				var selectedOrganization = $("#selectedorg").val();
				var selectedCustomer =$('#customer-name').val();// $(this).parent().siblings('.bill-ship').find('.billto').find('.customerVal').val().trim();
				var selectedLanguage= $('#languageList option:selected').val();
				$.ajax({
     	    type: "POST",
     	    url: "saveretailuserprofiledetails",
     	    data: {	
     	    	billToAddressName:$("#billToAddressName").val(),
     	    	billToAddressLine1:$("#billToAddressLine1").val(),
     	    	billToAddressLine2:$("#billToAddressLine2").val(),
     	    	billToAddressLine3:$("#billToAddressLine3").val(),
     	    	billToAddressCity:$("#billToAddressCity").val(),
     	    	billToStateSelect:$("#billToStateSelect").val(),
     	    	billToAddressState:$("#billToAddressState").val(),
     	    	billToAddressZipCode:$("#billToAddressZipCode").val(),
     	    	billToAddressCountry:$("#billToAddressCountry").val(),
     	    	billToAddressId:$("#billToAddressId").val(),
     	    	
     	    	shipToAddressName:$("#shipToAddressName").val(),
     	    	shipToAddressLine1:$("#shipToAddressLine1").val(),
     	    	shipToAddressLine2:$("#shipToAddressLine2").val(),
     	    	shipToAddressLine3:$("#shipToAddressLine3").val(),
     	    	shipToAddressCity:$("#shipToAddressCity").val(),
     	    	shipToStateSelect:$("#shipToStateSelect").val(),
     	    	shipToAddressState:$("#shipToAddressState").val(),
     	    	shipToAddressZipCode:$("#shipToAddressZipCode").val(),
     	    	shipToAddressCountry:$("#shipToAddressCountry").val(),
     	    	shipToAddressId:$("#shipToAddressId").val(),
     	    	selectedOrganization:selectedOrganization,
     	    	selectedCustomerName:selectedCustomer,
     	    	selectedCustomerId:$("#customerVal").val(),
     	    	selectedLanguage:selectedLanguage,
		     	organizationTab:$(this).parents('.profileSubMenu').find('.ui-tabs-active').index(),defaultTab:"profileSetting"},
		     	
     	    success: function(data){
     	    	
     	    	var msg = JSON.parse(data).responseMessage;
     	    	$('div.pageLoader').hide();
     	    	   $(".profile-update").show();
     	    	   $(".update-success").hide();
	     	    	  if (msg.match(/<(\w+)((?:\s+\w+(?:\s*=\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/)) {
	     	    		 msg = 	"<spring:message code='configurator.error'/>";
	            	   $(".profile-update").css("color","red");
	     	    	  }else{
		            	   $(".profile-update").css("color","green");
	     	    	  }
            	   $(".profile-update").text(msg);  
            	   var billToAddressId = JSON.parse(data).billToAddressId;
            	   var shipToAddressId = JSON.parse(data).shipToAddressId;
            	   $("#billToAddressId").val(billToAddressId);
            	   $("#shipToAddressId").val(shipToAddressId);
     	    	},error: function(jqxhr, textStatus, error) {
     	    		$('div.pageLoader').hide();
     	     	  // 15-01-2015-EH Handling
 	              var err = jqxhr.status;
 	              var msg = jqxhr.responseText;
 	              $(".pageLoader").hide();
 	              myErrObj.raise(err,msg,textStatus);
 	     	    }
				});
        	}
	 });
	//Venkatasiva
//Venkatasiva End
//Added by krupa reviewed by Chinnam for Alert message for address validation
   function addressValidation(){
		var customer = $('#customer-name').val();
		var zipcodeValidationCountries = "${properties['zipcode.validation.countries']}";//GPD-64
		if(customer===null || customer==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.customer.validation' javaScriptEscape='true'/>")
			$("#myModal").show();
			return false;
		}
		else if($('#billToAddressName').val()==""){
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
		}else if($('#billToAddressState').val()==""||$('#billToAddressState').val()=="--"){
			//Support-MIL-206-020416 For guest user state field is mandatory 
			    $('.modal-body').text("<spring:message code='label.createquotefromcartinit.messages.billtostate.notempty' javaScriptEscape='true'/>");
		      $("#myModal").show();
		      return false;
		}// GPD-64
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
		}else if($('#shipToAddressState').val()==""||$('#shipToAddressState').val()=="--"){
			//Support-MIL-206-020416 For guest user state field is mandatory 
			    $('.modal-body').text("<spring:message code='alert.quote.order.shipto.addState.validation' javaScriptEscape='true'/>");
		      $("#myModal").show();
		      return false;
		}// GPD-64 
		else if((zipcodeValidationCountries.indexOf($('#shipToAddressCountry').val())>-1) && $('#shipToAddressZipCode').val()==""){
			$('.modal-body').text("<spring:message code='alert.quote.order.shipto.addzip.validation' javaScriptEscape='true'/>");
			$("#myModal").show();
			return false;
		}
		else{ 
			return true;
		}
	}
   $(".custom-close").click(function(){
	   $("#myModal").hide();
	});
	</script>

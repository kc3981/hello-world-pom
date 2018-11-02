/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var customerString = [];	
function loadDataForCustomer(selectedOrganizationForCard,selectedCustomerForCard){
   		 selectedOrganizationForCard = typeof selectedOrganizationForCard =="undefined" ? null : selectedOrganizationForCard;
 		 selectedCustomerForCard = typeof selectedCustomerForCard =="undefined" ? null : selectedCustomerForCard;
 		$('div.pageLoader').show();
		 $.ajax({
				type : "get",
				data : {
					selectedOrganizationForCard : selectedOrganizationForCard,
					selectedCustomerForCard : selectedCustomerForCard
				},
				url : "getCustomerForOrganization",
				success : function(data) {
					$('div.pageLoader').hide();
					var container = "";
					var response = jQuery.parseJSON(data);
					customerList = response["customerList"];
					selectedOrganizationForCard = response["selectedOrganizationForCard"];
					selectedCustomerForCard = response["selectedCustomerForCard"];
					populateErrorMessage(response["message"]);
					var customerLabel = "";
					var customerId = "";
					console.log("data==="+selectedOrganizationForCard);
					customerString.length = 0;

					//Adding Customer List
					for (var i = 0; i < customerList.length; i++) {
						var obj = customerList[i];
						var item = {};
						item["label"] = obj.customerReference + ' - '
								+ obj.customerName;
						item["value"] = obj.customerId;
						customerString.push(item);
						if(selectedCustomerForCard == obj.customerId){
							customerLabel  = obj.customerReference + ' - ' + obj.customerName;
							customerId = obj.customerId;
						}
					}
					/*if(customerList.length > 0){
						var obj = customerList[0];
						$('.customerNoInput1').val(obj.customerReference + ' - ' + obj.customerName);
						$('.customerVal1').val(obj.customerId);

					}else{
						$('.customerNoInput1').val('');
						$('.customerVal1').val('');
					}*/
					$('.customerNoInput1').val(customerLabel);
					$('.customerVal1').val(customerId);
					 //Adding Organization List
					var organizationList = response["organizationDetailsList"];
					$('#cardDivision option').remove();
 					for(var i = 0;i<organizationList.length;i++){
 							$('.orgSection1').append($('<option>', {value:organizationList[i].organizationId, text:organizationList[i].organizationName}));
					}
 					$(".orgSection1").val($(".orgSection1 option:first").val());
 					$("#cardDivision").val(selectedOrganizationForCard);
					
				 //Putting card Details
					var customerCardMap = response["customerCardMap"];
					if(customerCardMap != undefined) {
						populateCustomerCardDetails(customerCardMap);
					}
 					
 				},
				error : function(jqxhr, textStatus, error) {
					$('div.pageLoader').hide();
				}
			});
 	 }
	 
function populateErrorMessage(message){
	if(message != ""){
	$("#currencyModal .modal-body").html(message);
	$("#currencyModal").show();
	}
}
	 function populateCustomerCardDetails(customerCardMap){
		 var row = "";
			$("#cardTable tbody").remove()
			for(var i = 0;i<customerCardMap.length;i++){
				row = "";
				row =  '<tr>';
//				row += '<td>'+customerCardMap[i].cardId+'</td>'; 
				row += '<td>'+customerCardMap[i].cardNumber+'</td>';
				nickName = typeof  customerCardMap[i].displayValue ===  "undefined" ? "" : customerCardMap[i].displayValue;
				currencyCode = typeof  customerCardMap[i].currencyCode ===  "undefined" ? "USD" : customerCardMap[i].currencyCode;
				row += '<td>'+currencyCode+'</td>';
//				row += '<td><a href="" class="editCard" data-id="'+customerCardMap[i].cardId+'" data-toggle="modal" data-target="#currencyModal">Edit</a></td>';
 				if(nickName==""){
					row += '<td class="nickNme"></td>';	
				}else{
					row += '<td class="nickNme"><label>'+nickName +'</label></td>';	
				}
 				/* NREV-742 removing the actions column no need to display delete and update actions as they are not supported as of now 
 				 * Change made by Kameshwari Popuri, Reviewed by Subrahmanya Bhat*/
				/*<a  class="editCard editCardRef pointer" ><span class="glyphicon glyphicon-pencil" title="Edit Card Reference"></span></a> &nbsp;&nbsp;<a data-id="'+customerCardMap[i].cardId+'" class="deleteCard icon-delete pointer" title="Delete"></a>*/
				row += '<td><input type="hidden" id="param_'+customerCardMap[i].cardId+'" value="'+nickName+'"></td>';
				
			    $('#cardTable').append(row);
			}
	 }
	 $(document).on("click", ".deleteCard", function () {
	     /*var cardId = $(this).data('id');
	     var rowRef = $(this);
 		 $.ajax({
				type : "get",
				data : {
					cardId : cardId
 				},
				url : "deleteCard",
				success : function(data) {
 	            	console.log(data);
// 	            	$("#currencyModal .modal-body").html(data);
//		 			$("#currencyModal").show();
  	            	rowRef.parents('tr').remove();
				},
				error : function(jqxhr, textStatus, error) {
					alert("Error");
				}
			});*/

 	});
	 
	 
	 $(document).on("click", ".editCardRef", function () {
//		var labelValue=$(this).parent('td').siblings('td.nickNme').find('label').html();
		var labelValue = $(this).parent('td').find('input').val();
		labelValue = typeof  labelValue ===  "undefined" ? "" : labelValue;
  		 $(this).parent('td').siblings('td.nickNme').html('<input type="text" maxlength="15" value="'+labelValue+'">&nbsp;<a  class="btn btn-primary btn-xs checkNickName save-machine-btn"><i class="fa fa-check fa-fw" title="save"></i></a>&nbsp;<a class="btn btn-primary btn-xs  theme-maroon crossNickName"><i class="fa fa-times fa-fw" title="cancel"></i></a>');
		   console.log('edit label:  '+labelValue);
 		 $(".crossNickName").click(function () {
  				console.log('prev label value'+labelValue);
			   $(this).parent('td.nickNme').html('<label>'+ labelValue+'</label>');
			 });
	 });
	 
	 $(document).on("click", ".checkNickName", function () {
	     var cardId = $(this).parent('td').siblings('td:last').find('a.deleteCard').attr('data-id'); 
 		 //var nickName = $('#nickName_' + cardId).val();
	     var nickName = $(this).parent('td.nickNme').find('input').val();
 		 console.log('dataid'+cardId+' '+nickName);
 		 
		 $.ajax({
				type : "get",
				data : {
					cardId : cardId,
					nickName : nickName
				},
				url : "saveNickName",
				success : function(data) {
//					$("#currencyModal .modal-body").html(data);
//		 			$("#currencyModal").show();
 	            	console.log(data);
 				},
				error : function(jqxhr, textStatus, error) {
				}
			});
			//$(this).parent('td.nickNme').html('');
			$(this).parent('td.nickNme').html('<label>'+ nickName+'</label>');
			$('#param_'+cardId).val(nickName);
			console.log('right  '+nickName);
			
 	});
	 
	 
	
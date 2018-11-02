/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(function(){
$(".modal-quotes .close").on("click", function(){
	$("#quotes-table").hide();
});
$("#open").on("click", function(){
    $('#searchText').val('');
    $('#searchType').prop("selectedIndex", 0);
	$(this).parents(".content-wrapper").find("#quotes-table").hide();
    $(".emptyText p").text('');
});

$(".modal-quotes #searchAddress").on("click",function(e){
	e.preventDefault();
	
	if($('#profile-save').length)
		$('#profile-save').removeClass('not-active');
	
	var searchString = $("#searchText").val();
	var searchType = $("#searchType").val();
	var customerId = $("#customerVal").val();
	console.log("searchString:::"+searchString+",,,searchType:::"+searchType+", customerId:::::"+customerId);
	
	if(searchString=="" || searchType==null){
		// set the message here
		$(".emptyText p").text($.i18n.prop('sales.area.search.input.empty'));
        $('#quotes-table').hide();
		return false;
	}else{
        $('.preload-icon').show();
    }
	
	// Ajax call for search items.
	$.ajax({  
        type : "Get",
        contentType: 'application/json;charset=ISO-8859-1',
        mimeType: 'application/json;charset=ISO-8859-1',
        url : "searchforsalesarea",
        data : {
      	    searchString : searchString,
      	    searchType : searchType,
      	    customerId : customerId
			},
        success : function(response) { 
            $('.preload-icon').hide(); 
        	console.log(response);
        	$("#quotes-table tr:nth-child(n+2)").empty();
        	var customerSalesAreaCurrencyVos = response.customerSalesAreaCurrencyVos;
        	if(customerSalesAreaCurrencyVos.length == 0){
        		// set the message here
        		$(".emptyText p").text($.i18n.prop('sales.area.search.no.result'));
                $('#quotes-table').hide();
        		return false;
        	}
        	else{
        		$(".emptyText p").text("");
        	}
        	for(var j=0; j<customerSalesAreaCurrencyVos.length;j++){
        		console.log(customerSalesAreaCurrencyVos[j]);
        		var row = $('<tr>');
        		row.append($('<td>').html('<input type="radio" class="selectSalesArea" name="selectSalesArea" value="'+j+'">'));
        	    row.append($('<td>').html(customerSalesAreaCurrencyVos[j].salesOrgReference));
        	    row.append($('<td>').html(customerSalesAreaCurrencyVos[j].salesOrgName));
        	    row.append($('<td>').html(customerSalesAreaCurrencyVos[j].distributionChannelRef));
        	    row.append($('<td>').html(customerSalesAreaCurrencyVos[j].description));
        	   
        	    $('#quotes-table').append(row);
        	    $("#quotes-table input[type='radio']").on("click", function(){
        	    	var $this = $(this);
        	    	var value = $this.attr("value");
        	    	var customerSalesAreaCurrencyVo = customerSalesAreaCurrencyVos[value];
        	    	$("#salesArea").val(customerSalesAreaCurrencyVo.description);
        	    	if($("#salesAreaId").length)
        	    		$("#salesAreaId").val(customerSalesAreaCurrencyVo.salesAreaId);
        	    	/*$this.parents(".modal-quotes").removeClass("in");*/
        	    	//$(".modal-quotes").hide();
        	    	setSalesArea(customerSalesAreaCurrencyVo.salesAreaId);
        	    	$(".modal-quotes .close").click();
        	    	console.log(value);
        	    	
        	    });
        	}
        	        	
        	$(".modal-body").find("#quotes-table").show();
        },  
        error: function (jqxhr, status, error) {	  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.  						    	  
			
        } 
   });
	
})

$('#searchText').on('keypress',function(evt){
  if ( evt.which == 13 ) {
    $(".modal-quotes #searchAddress").click();
     evt.preventDefault();
  }
});


function setSalesArea(salesAreaId){
	$.ajax({  
        type : "Get",
        contentType: 'application/json;charset=ISO-8859-1',
        mimeType: 'application/json;charset=ISO-8859-1',
        url : "setsalesarea",
        data : {
        	salesAreaId : salesAreaId
			},
        success : function(response) { 
		//START Bring From MILACRON_CODE_BASE IF BLOCk 
        	if(fromAccountSetting==false){
        		updateEndCustomers();
        		getRefreshedPriceForItems();
               }
        },  
        error: function (jqxhr, status, error) {	  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.  						    	  
			
        } 
   });
}
});

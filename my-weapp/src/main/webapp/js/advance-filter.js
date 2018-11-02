/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var searchJson;
var mainArr;
//Start Bring From Milacron
var selectedItem = sessionStorage.getItem("SelectedItem"); 
/*$(".advanceFilter").find(":selected").text(selectedItem);*/
$('.advanceFilter').find('select').attr('selectedIndex',sessionStorage.getItem("SelectedItem"));
//End Bring From Milacron

$(function(){
	/*$(".menu-icon").on("click", function(){
		$(this).parents("div#resultInfo").siblings(".block-wrapper").children(".block").slideToggle();
		$(this).toggleClass("active");
	})*/
	//Start Bring From Milacron .block replaced to #advanceFilterId .block
	$("#advanceFilterId .block").on("click", "h3>span", function(){
		$(this).parents(".block").children("div.col-sm-12").slideToggle();
		$(this).toggleClass("dropDown-icon")
	});
	
	$("body").keypress(function (e) {
        if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
            $('#catalog-content-hldr #searchAdvFilter').click();
            return false;
        } else {
            return true;
        }
    });
});

function renderFilter(data) {
//	$
//			.ajax({
//				type : "Get",
//				url : "http://localhost:84/gensuite/css/json5.json",
//				mimeType : "application/json",
//				success : function(data) {
					searchJson = data;
					renderJson(searchJson);
//				}
//
//			})
}

function escapeHtml(str) {
    return str
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;");
 }

function renderJson(data){
	 console.log(data);
	//OM-606-180316
	  var filterMesage= strings['message.attribute.filter'];

	$("#advanceFilterId .block").html('');
	if(data.length > 0){
	//OM-608-210316
	var container = ''
	+ '<h3>'+filterMesage+'<span class="glyphicon glyphicon-chevron-down pull-right"></span></h3><div class="col-sm-12">';
	for (var i = 0, size = data.length; i < size; i++) {
		if( i+1 == size){
			var columnno = ((((4*size) % 12) / 4) == 1) ? 12 : ((((4*size) % 12) / 4) == 2) ? 8 : 4;  
			container += '<div class="col-sm-' + columnno + '"><div class="advanceFilter">';
		}else{
			container += '<div class="col-sm-4"><div class="advanceFilter">';
		}
		var filterType = data[i];
		console.log(filterType);
		var filerId = filterType['filterId'];
		container += '<p><label>' + filterType['attributeName'].toLowerCase()
				+ '</label></p>';
		container += '<p>';
		if (filerId == "1" || filerId == "2") {
			var flag  = false;
			// For Drop Down
			container += '<select id=param_' 
					+ filterType['attributeId']+' '+'onchange="yera()"' + '>'; //onchange="yera() Milacron Change
			var dropDownList = filterType['advanceFilterValues'];
//			container += '<option value="" selected=\'selected\'>Select</option>';
			//Commented from Milacron
			/*if(dropDownList.length > 1){
				container += '<option value=\'All~All\'>All</option>';
			}*/
			//INC-1728
			container += '<option value=\'All~All\'>All</option>';
 			for (j = 0; j < dropDownList.length; j++) {
				var dropDownMap = dropDownList[j];
				var tmp1 =   escapeHtml(dropDownMap['attributeValue'])+'~'+dropDownMap['attributeUom']; 
				container += '<option value="'+tmp1+'">'
						+ dropDownMap['attributeWithUomValue']
						+ '</option>';
				 
			}
			container += '</select>';
		} else if (filerId == "3") {
			// Between
			//OM-597
			var dropDownList = filterType['values'];
			//IF ELSE CONDITIONS FROM MILACRON_CODE_BASE 
			if(dropDownList.length > 1){
				container += '<select class="betweenSelect" id=param_'
					+ filterType['attributeId'] + ' >';
			}else{
			container += '<select class="betweenSelect unitM" id=param_'
					+ filterType['attributeId'] + ' >';
			}
			//if(dropDownList.length > 0)
			//	container += '<option value="" selected=\'selected\'>Select Unit</option>';
			for (j = 0; j < dropDownList.length; j++) {
 				container += '<option value=' + dropDownList[j]
						+ '>' + dropDownList[j] + '</option>';
			}
			container += '</select>';
			container += '<input type="text" placeholder="From" id=param_'
					+ filterType['attributeId'] + '_0 class="qty"/>';
			container += '<input type="text" placeholder="To" id=param_'
					+ filterType['attributeId'] + '_1 class="qty" />';

		} else if (filerId == "4") {
			// Custom Search
			var dropDownList = filterType['advanceFilterValues'];
			container += '<select id=param_'
					+ filterType['attributeId'] + '>';
			//container += '<option value="">Select</option>';
			for (j = 0; j < dropDownList.length; j++) {
				var dropDownMap = dropDownList[j];
				container += '<option value='
						+ dropDownMap['attributeValue'] + '>'
						+ dropDownMap['attributeWithUomValue']
						+ '</option>';
			}
			container += '</select>';
			container += '<input type="text" id=param_'
				+ filterType['attributeId'] + '_0 >';
		} else if (filerId == "2") {
			// Check Box
			container += '<select id=param_'+ filterType['attributeId'] + '>';
			container += '<option value="0">No</option><option value="1">Yes</option></select>';
			}
		container += '</p>';
		container += '</div></div>';

	}
	
	
	//container += '<div class="col-sm-12 btns"><a href="javascript:void(0);" title="Search" class="btn btn-addtocart cart-small pull-right" id="search" onclick="searchFilterPart(); return false;">Search for Parts</a>';
	container += '<div class="col-sm-12 btns"><button type="submit" title="Search" class="btn btn-addtocart cart-small pull-right" id="searchAdvFilter" onclick="searchFilterPart(); return false;" >Search for Parts</button>'; //>Search replaced with >Search for Parts From MILACRON_CODE_BASE
	container += '<a href="javascript:void(0);" title="Reset" class="btn btn-buynow cart-small" onclick="resetFilter(); return false;">Reset all Values</a>';
	container += '<span id="errorBlock"></span>';

	container += '</div></div>';
	$("#advanceFilterId .block").html(container);
	$("#advanceFilterId .block select option:first-child").prop('selected',true);
	
	}
}
$(document).on("keypress", ".qty", function (e) {
    if (e.which != 8 && e.which != 0 && e.which != 44 && e.which != 46 && (e.which < 48 || e.which > 57)) {
       //display error message
              return false;
   }   
});

function prepareDynamicQuery() {
	jsonArr = [];
	var searchBy = "";
	var searchString= "";
	var isSuccess = true;
	var isCheckBoxAccessed  = true;
	var message = "";
 	for (var j = 0; j < searchJson.length; j++) {
		var filterType = searchJson[j];
		var attributeId = filterType['attributeId'];
		var filterId = filterType['filterId'];
		if (filterId == "1" || filterId == "2") {
			// // Drop Down
			var uom = $('#param_' + attributeId).val();
 			if(uom != ""){
				var splitArr = uom.split("~");
				if(splitArr[0]!="All"){
					splitArr[1] = ""
					jsonArr.push({
						filterId : filterId,
						attributeId : attributeId,
						attributeValue : splitArr[0],
						UOM : splitArr[1]
					});
				}
		  }
		} else if (filterId == "2") {
			var uom = $('#param_' + attributeId).val();
 			if(uom != ""){
				 jsonArr.push({
					filterId : filterId,
					attributeId : attributeId,
					attributeValue : uom,
					UOM :""
				});
		  }
			
		} else if (filterId == "3") {
			// Between
 			var uom = $('#param_' + attributeId).val();
			var tmp = $('#param_' + attributeId + '_0').val();
 			var tmp2 = $('#param_' + attributeId + '_1').val();
 			if(tmp.length > 0 && tmp2.length > 0 && uom.length > 0){
 				if((/^[0-9]+(\.[0-9]+)?$/.test(tmp)) && (/^[0-9]+(\.[0-9]+)?$/.test(tmp2))){
 	 				if(uom == "All"){
	 					uom = "";
	 				}
					 tmp = tmp + "," + tmp2;
					jsonArr.push({
						filterId : filterId,
						attributeId : attributeId,
						attributeValue : tmp,
						UOM : uom
					});
 				}else{
 	 				message = "message.advancesearch.Invalid.data";
 	 				isSuccess = false;
 				}
 			}else if((tmp.length  > 0 && tmp2.length == 0) || (tmp.length  == 0 && tmp2.length > 0) ){
 				message = "message.advancesearch.validation";
 				if(tmp.length==0){
					$('#param_' + attributeId + '_0').css("border","1px solid red");
 				}
 				if(tmp2.length==0){
 					$('#param_' + attributeId + '_1').css("border","1px solid red");
 				}
 				if(uom.length == 0){
					$('#param_' + attributeId).css("border","1px solid red");
 				}
 				isSuccess = false;
 			} 
 			
		} else if (filterId == "4") {
			  searchBy = $('#param_' + attributeId).val();
			  searchString = $('#param_' + attributeId + '_0').val();
			  searchString = searchString.trim();
 		}

	}
 	 
// 	if((searchString.length == 0 && searchBy.length > 0) || (searchBy.length == 0 && searchString.length > 0)){
// 		if(searchString.length==0){
// 			message = "message.custom.search.validation";
//		}else if(searchBy.length == 0 ){
// 			message = "message.custom.search.validation.select";
// 		}
// 		  isSuccess = false;
//	  }
	 if(!isSuccess){
		 $("#errorBlock").html(strings[message]);
	 }else{
		 $("#errorBlock").html('');
	 }
 	mainArr= {};
 	mainArr["inputString"]=jsonArr;
 	mainArr["searchBy"]=searchBy;
 	mainArr["searchString"]=searchString;
 	mainArr["isSuccess"]=isSuccess;
 	mainArr["isFilterRequired"]="false";
 	mainArr["isFromSearch"]=true;
 	mainArr = JSON.stringify(mainArr);
 	console.log("mainArr"+mainArr);
 	return mainArr;
	
}
$(document).on("blur","#advanceFilterId .block .qty, #advanceFilterId .block .betweenSelect", function(){
	if($(this).val() == ""){
		//$(this).css("border","1px solid red");
		$(this).siblings(".qty").css("border","1px solid #aaa");
	}else{
		$(this).css("border","1px solid #aaa");
	}
})
$(document).on("focus","#advanceFilterId .block select:not(.betweenSelect)", function(){
	$(".betweenSelect").css("border","1px solid #aaa").siblings().css("border","1px solid #aaa");
})
$(document).delegate('#advanceFilterId .block .qty','change',function() {
	var itemCount = $(this).val();
	if(!/^[0-9]+(\.[0-9]+)?$/.test(itemCount)){
		$(this).val("");
	}
});

function validateGlobalCheck(){
	
	var isValid = true;
 	$('#advanceFilterId .block input[type="text"]').each(function() { // For Input Type Text
   	    if ($.trim($(this).val()) != '') {
   	    	isValid =  false;
 	    }	    
	 });
  	 if(isValid){
	    $('[id^=param_] option:selected').each(function(){  // For Input type select;
  	          if ($.trim($(this).val()) != '') {
	        	  isValid =  false;
	 	    }
	    }); 
	 }
  	 if(isValid){    
		 var inputElements = document.getElementsByClassName('chk');  // For Input type Check Box
		for (var i = 0; inputElements[i]; ++i) {
				if (inputElements[i].checked) {
		        	  isValid =  false;
				}
		}
	 } 
 	 if(isValid){
		 message = "message.advancesearch.global.validation";
 	 	$("#errorBlock").html(strings[message]);
	 }else{
		 $("#errorBlock").html('');
	 }
     return isValid;
}

function yera(){
	sessionStorage.setItem("SelectedItem", $(".advanceFilter").find(":selected").val());
}


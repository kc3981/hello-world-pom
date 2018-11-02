/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var rows="";
var count=1;
var msg="Cant add more then 10 items";
var partNumtemp;
var partIdTemp;
var mediaIdTemp;
var orgIdTemp;
var qtyTemp;
var commDescTemp;
var enggDescTemp;
var orgNameTemp;

var jsonObject;
var jsonArray;
var tableHeader ;

var rowLength ;
var columnLength ;
var row ;
var json;
var propertyName;
var seletedFromAutoComplete = false;
var seletedPartNumber;

var partUOM;
var partOrderMult;

var valueHideOrShow = false;
var orderable = false;

$(document)
		.ready(
				function(e) {
	 //loadBundles();
	 $("#add-to-table").addClass('not-active');
	 $(".ordPara").hide();
	 var defaultPartUOM = '${properties["default.part.uom"]}';
	 var defaultPartOrderMultiple = '${properties["default.part.ordermultiple"]}';
	 
	 var keyword1 = document.getElementById("keyword1");
	 if(keyword1 != null)
	 {
		keyword1.addEventListener('keydown', function (event) {
		    if (event.keyCode == 8) {
								seletedFromAutoComplete=false;
		    	resetKeyword();
								//event.preventDefault();
		    }
		    if (event.keyCode == 46) {
								seletedFromAutoComplete=false;
		    	resetKeyword();
								//event.preventDefault();
		    }
		});
	 }
	 function resetKeyword(){
						if(!seletedFromAutoComplete)
		 $("#add-to-table").addClass('not-active');
						//$('#keyword1').val("");
						//$('#part-qty').val("1");
	 }
	 
					$("#keyword1")
							.autocomplete(
									{
		source : function(request, response) {
											var searchString = document
													.getElementById('keyword1').value;
											var organizationDropDownVal = $(
													'#org-select :selected')
													.attr('value');
			 seletedFromAutoComplete = false;
											// alert('selected value is ----- >
											// '+organizationDropDownVal);
			 //START - INC-924
											console
													.log("organizationDropDownVal==="
															+ organizationDropDownVal);
			 if(organizationDropDownVal == "0"){
				 //$('#keyword1').attr('title',$.i18n.prop('label.brand.choose')).tooltip('show');
				 return false;
			 }
			 //END

			//NREV-1552 - Added by Pushpa. Reviewed by JK // Modified for GSP-930 during merge
			 var escString = escape(searchString)+"&specificOrganization="+organizationDropDownVal+"&typeDropDown="+$("#typedropdown").val()
			$.ajax({
				type : "post",
				//url : "quicksearchautocomplete?searchString="+searchString+"&specificOrganization="+organizationDropDownVal+"&typeDropDown="+$("#typedropdown").val(),
				//data : request.term.toLowerCase(),
				url : "quicksearchautocomplete?searchString="+escString,
				dataType : "json",
				contentType : 'application/json;charset=ISO-8859-1',
														// mimeType :
														// 'application/json;charset=ISO-8859-1',
				success : function(data) {
															response($
																	.map(
																			data,
																			function(
																					item) {
						valueHideOrShow = item.orderMultipleLabelVisibilityValue;
						orderable = item.orderable;
																				// if(orderable
																				// ==
																				// 'true'){
							return {
								desc : item.description,
								value : item.lable,
								data : item.value,
								orderable : orderable
							};
						//}
					}));
				},
			});
		},
		autoFocus : true,
		change :  function(event, ui) {
			$('#fuzzy').val('');
		},
	    open:function(event) {
	       var width = $(window).width();
	        if(width >= 1100){
												$('.ui-autocomplete').css({
													'width' : 249 + 'px',
													'max-height' : 150 + 'px',
													'zIndex' : 0
												});
											} else if (width >= 900) {
												$('.ui-autocomplete').css({
													'width' : 214 + 'px',
													'max-height' : 150 + 'px',
													'zIndex' : 0
												});
											} else {
												$('.ui-autocomplete').css({
													'width' : 335 + 'px',
													'max-height' : 150 + 'px',
													'zIndex' : 0
												});
	        }
	    },                  
		select : function(event, ui) {
			$('#keyword1').val(ui.item.label);
											$(this).prev('a.clear-search')
													.removeClass('hidden');
	       
											quickSearch(ui.item.value, $(
													'#org-select :selected')
													.attr('value'));
			$("#quickSearchDiv").show();
			commDescTemp=ui.item.desc;
			if(ui.item.orderable == 'true'){
												$("#add-to-table").removeClass(
														'not-active');
			}else{
												$("#add-to-table").addClass(
														'not-active');
			}
			seletedFromAutoComplete = true;
			seletedPartNumber = ui.item.data;
			return false;
		},
		minLength : 2 
	});
	
					/*
					 * if($('#org-select').find(":selected").val()==="0"){
					 * $('#keyword1').attr('title',$.i18n.prop('label.brand.choose')).tooltip('show'); }
					 */
	
	if ($('#org-select option:visible').length == 1) {
	    $('#org-select option:visible').attr('selected', true);
	}
	
	 $("#add-to-table").addClass('not-active');
	 $(".ordPara").hide();
	 var defaultPartUOM = '${properties["default.part.uom"]}';
	 var defaultPartOrderMultiple = '${properties["default.part.ordermultiple"]}';
	 
	 var keyword1 = document.getElementById("keyword1");
	 if(keyword1 != null){
		 keyword1.addEventListener('keydown', function (event) {
			    if (event.keyCode == 8) {
			    	resetKeyword();
			        //event.preventDefault();
			    }
			    if (event.keyCode == 46) {
			    	resetKeyword();
			        //event.preventDefault();
			    }
			});
	 }
	
	 
	 function resetKeyword(){
		 $("#add-to-table").addClass('not-active');
		 //$('#keyword1').val("");
		 $('#part-qty').val("1");
	 }
	});

	$('#org-select').on('change',function(event){
 		$('#keyword1').val("");
		var qty = $('#part-qty').val();
 		if(null != qty){
 			$('#part-qty').val(qty);
 		}else{
 			$('#part-qty').val("1");
 		}
	/*
	 * if($('#org-select').find(":selected").val()!=="0"){
	 * $('#keyword1').tooltip('hide') .attr('data-original-title', '');
	 * 
	 * }else{ $('#keyword1').tooltip('hide') .attr('data-original-title',
	 * $.i18n.prop('label.brand.choose')) .tooltip('fixTitle') .tooltip('show'); }
	 */
          	
	/*
	 * if($('#table-body > tr').length !== 0){ $('#confirmationWindow').show(); }
	 */
	});
	
	$('.cancel').on('click',function(){
		$('#confirmationWindow').hide();
	});
	$('.charge-ok').on('click',function(){
		$("#table-body").empty();
		$('#confirmationWindow').hide();
	});
	//START Bring From MILACRON_CODE_BASE This below code is not commented in Milacron
	/*$('#part-qty').on('keypress',function(event){
		if(!((event.charCode >= 48 && event.charCode <= 57)|| ((event.keyCode == 46 && event.charCode!== 46) || event.keyCode == 8))){
			return false;
	}
	});*/
/*
 * $('#part-qty').on('keypress',function(event){ if(!((event.charCode >= 48 &&
 * event.charCode <= 57)|| ((event.keyCode == 46 && event.charCode!== 46) ||
 * event.keyCode == 8))){ return false; } });
 */
	
$("#add-to-table").click(function() {
	$(".ordPara").hide();
	qtyTemp=parseFloat($('#part-qty').val());
	var organizationId = $('#org-select :selected').attr('value');
	var selectedVal = $('#org-select').find(":selected").val();
	var searchQuery = $('#keyword1').val();
	$('.UOMClass').html("");
	var qty = $('#part-qty').val();
	if(selectedVal == "0" || searchQuery=="" || qty==""){
		$('#alertModal .modal-body').text($.i18n.prop('lable.fillallfields'));
		$('#alertModal').show();
	}
	if(qtyTemp <=0){		
		$('#alertModal .modal-body').text($.i18n.prop('lable.qtymorethenzero'));
		$('#alertModal').show();		
	}
			
	// Added for OM-938: 2 validation messages are getting for
	// Single action in Quick Order on 12/07/2016
	else if ((partNumtemp === undefined || partNumtemp === null)&& searchQuery !== "" && organizationId !== "0") {
		quickSearch(searchQuery, organizationId);
		var waitFunction = setInterval(
		function() {
			console.log(partNumtemp)
			if (partNumtemp !== undefined && quickSearchFeedback == false && partNumtemp != null) {
				if(commDescTemp==undefined){
					commDescTemp="";
				}
				rows = "<tr class='length'><td>"
						+ partNumtemp
						+ "</td><td>"
						+ commDescTemp
						+ "</td><td>"
						+ qtyTemp
						+ "</td><td>"
						+ partUOM
						+ "</td><td>"
						+ "<a href='#' class='icon-delete' onclick='deletePart(event)' id='delete-part'></a>"
						+ "</td><td style='display:none;'>"
						+ partIdTemp
						+ "</td><td style='display:none;'>"
						+ organizationId 
						+ "</td><td style='display:none;'>"
						+ mediaIdTemp
						+ "</td></tr>";
				 partNumtemp=null;
				 commDescTemp=null;
				 qtyTemp=null;
				 partIdTemp=null;
				 $(rows).appendTo("#table-body"); 
				$('#keyword1').val("");
				$('#part-qty').val("1");
				$('a.clear-search').addClass('hidden');
				$(".ordPara").hide();
				clearInterval(waitFunction);
				$('.part-table-controls > input').each(function() {
					$(this).removeClass('not-active');
				});
			}else if(quickSearchFeedback === true){
				$('#alertModal .modal-body').text($.i18n.prop('lable.invalidpart'));
				$('#alertModal').show();
				clearInterval(waitFunction);
			}
		},1000);
						
	} else if (qty === "0") {
		$('#alertModal .modal-body').text($.i18n.prop('lable.qtymorethenzero'));
		$('#alertModal').show();
		$('#part-qty').val("");
	} else {
			$('.part-table-controls > input').each(function(){
				$(this).removeClass('not-active');
			});
			if(commDescTemp == null || commDescTemp == 'undefined'){
				commDescTemp="";
			}
			 //getQuickSearchData(partNumtemp,organizationId);
						// Added for OM-938: 2 validation messages are getting
						// for Single action in Quick Order on 13/07/2016
			if (organizationId !== "0" && searchQuery !== undefined
					&& searchQuery !== "") {
				rows = "<tr class='length'><td>"
						+ partNumtemp
						+ "</td><td>"
						+ commDescTemp
						+ "</td><td>"
						+ qtyTemp
						+ "</td><td>"
						+ partUOM
						+ "</td><td>"
						+ "<a href='#' class='icon-delete' onclick='deletePart(event)' id='delete-part'></a>"
						+ "</td><td style='display:none;'>"
						+ partIdTemp
						+ "</td><td style='display:none;'>"
						+ organizationId + "</td>"
						+"<td style='display:none;'>"
						+ mediaIdTemp
						+ "</td></tr>";
			partNumtemp=null;
			commDescTemp=null;
			qtyTemp=null;
			partIdTemp=null;
			$(rows).appendTo("#table-body");
			count=count+1;
			$("#add-to-table").addClass('not-active');
			$('#keyword1').val("");
			$('#part-qty').val("1");
			$('a.clear-search').addClass('hidden');
			$(".ordPara").hide();
			}
		}
		
	});
	
	$('.custom-close').on('click',function(){
		$('#alertModal').hide();
	});
	function validateInput(){
		var selectedVal = $('#org-select').find(":selected").val();
		var searchQuery = $('#keyword1').val();
		var qty = $('#part-qty').val();
		
		if(selectedVal != "0" || searchQuery=="" || qty==""){
			return false;
		}else{
			return true;
		}
	}

	$("#clear-input-data").click(function(){
		$("#keyword1").val("");
		$("#part-qty").val("");
		$('a.clear-search').addClass('hidden');
		$(".ordPara").hide();
	});
	$("a.clear-search").click(function(){
		 $("#add-to-table").addClass('not-active');
		 $('#keyword1').val("");
		 $('#part-qty').val("1");
		$('a.clear-search').addClass('hidden');
		$(".ordPara").hide();
		
	});
	$("#clear-all").click(function(){
		$("#table-body").empty();
		$('.part-table-controls > input').addClass('not-active');
		
	});

	$("#append-to-cart").click(function(){
		jsonObject = {};
		jsonArray = [];
		tableHeader = $("#parts-table th");
		console.log(tableHeader);
		rowLength = $("#table-body tr.length").length;  
		columnLength = $($("#table-body tr.length")[0]).find('td').length;
		//var text = $("#table-body tr.length");
	for(var i=0; i<rowLength;i++){
		row = $("#table-body tr.length")[i];
		json={};
		for(var j=0; j<columnLength;j++){
			//console.log($($(row).find('td')[j]).text());
			propertyName = $(tableHeader[j]).data('name');
			json['prop'+propertyName] = $($(row).find('td')[j]).text();
		}
		jsonArray.push(json);
	}
	jsonObject.data = jsonArray;
	//var jsonString = JSON.stringify(jsonObject,null,2);
	//console.log(jsonString);
	if(jsonObject!=null){
		//alert('jason nt null');
		$('.pageLoader').show();
		 $.ajax({  
			 type : "POST",
	 	     url : "quickorderdata",
			data : {
				itemDetails : JSON.stringify(jsonArray)
			},
			     success : function(data) { 
			    	 window.location.href=data;
					 $('.pageLoader').hide();
			     },
			     error : function(e) {    
			    	alert('failure'+e);
					$('.pageLoader').hide();
		 	     } 
		 });
	} else {
		alert('json is null');
	}

	});
	
	var quickSearchFeedback;
	
	function quickSearch(searchString,organizationDropDownVal){
	$
			.ajax({
	 type : "Get",
	 contentType : 'application/json;charset=ISO-8859-1',
	 mimeType : 'application/json;charset=ISO-8859-1',
	 url : "searchonparts",
	 data : {
		    searchString : searchString,
		    specificOrganization : organizationDropDownVal,
		},
	 success : function(response) {  
	  console.log(response[1]);
					if (response[0].totalhits === 0) {
		  quickSearchFeedback = true;
					} else {
		  quickSearchFeedback = false;
		  
		  var commDesc="",enggDesc="";
		  
						/*if (locale = "en_US") {
			commDesc = response[1].source.commercialDescription_en_US;
			enggDesc = response[1].source.engineeringDescription_en_US;
						} else {
			commDesc = response[1].source.commercialDescription_de_DE;
			enggDesc = response[1].source.engineeringDescription_de_DE;
		  }*/
		  commDesc = response[1].source.commDesc;
		enggDesc = response[1].source.enggDesc;
					
		partNumtemp=response[1].source.partNumber;
		partUOM=response[1].source.uom;
		partOrderMult=parseFloat(response[1].source.orderMultiple);
		
						if (valueHideOrShow == true) {
      	 	$(".ordPara").show();
						} else {
        	$(".ordPara").hide();
        }			
		document.getElementById('lblPartUOM').value=partUOM;
		document.getElementById('lblPartMultiple').innerHTML=partOrderMult;
						$('.spinner-control').attr('data-ordermultiplekey',
								partOrderMult);
		$('#part-qty').val(partOrderMult);
		// $(".ordPara").show();
		$('.UOMClass').html(partUOM);
						if (searchString != partNumtemp
								&& seletedFromAutoComplete == false) {
			quickSearchFeedback = true;
			partNumtemp=null;
			commDescTemp=null;
			qtyTemp=null;
			partIdTemp=null;
			return false;
						} else {
			partIdTemp=response[1].source.partId;
			mediaIdTemp=response[1].source.mediaId;
			orgIdTemp=response[1].source.organizationId;
			commDescTemp=commDesc;
							orgNameTemp = response[1].source.organizationName
									+ " Part";
		}
		
	  }
	          },  
	 error : function(e) {    
	 }  
	});
}
	
	function deletePart(event){
		var $this = $(event.currentTarget);
		$this.parents('tr').remove();
		if($('#table-body > tr').length === 0){
			$('.part-table-controls > input').addClass('not-active');
		}
	}
	
$(document).ready(
		function() {
			$(document).delegate(
					'.total-items.output',
					'change',
					function() {
						$(this).parents('.spinner-control').attr(
								"ordermultiplekey", partOrderMult);
						$(this).parents('.spinner-control').data(
								"ordermultiplekey", partOrderMult);
						console.log('output**'
								+ $(this).parents('.spinner-control').data(
										"ordermultiplekey"));
		 });
			$('.content-wrapper').on(
					'click',
					'.item-decrement',
					function() {
						$(this).parents('.spinner-control').data(
								"ordermultiplekey", partOrderMult);
			 
						console.log('dec**'
								+ $(this).parents('.spinner-control').data(
										"ordermultiplekey"));
			 
		 });
			$('.content-wrapper').on(
					'click',
					'.item-increment',
					function() {
						$(this).parents('.spinner-control').data(
								"ordermultiplekey", partOrderMult);
						console.log('inc**'
								+ $(this).parents('.spinner-control').data(
										"ordermultiplekey"));
		 });
	})

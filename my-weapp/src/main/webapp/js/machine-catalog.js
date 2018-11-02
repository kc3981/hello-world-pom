/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
/*global variables */
var userApplication = $('#userApplication').val();

var catalogMediaExists  = $("#catalogMediaExistsModel").text(); 
if(catalogMediaExists === 'false'){
	$("#fullitemsMediaContainer").hide();
	$("#hide_bom").hide();
	$(".catalogweb-hldr .mediacontrols").hide();
	$("#datatable-container").height(this.height + $("#fullitemsMediaContainer").height());
}else{
	$("#fullitemsMediaContainer").show();
	$("#hide_bom").show();
	$(".catalogweb-hldr .mediacontrols").show();
}

var imageMediaArray = null;
var twoDMediaArray = null;
var threeDMediaArray = null;
var enableHotSpot = true;
var documentArray = null;

var this2d =null;
var this3d=null;		
var lastBomItemNumber=null;
var lastNodeNumber = null;
var saveMidiaId=null;
var groupObject;

var navigationFlag=null;
var svgDocument;		
var check2dFilesArray = [];
var pageHeight = null;
var height = null;
var mcTable = null;
var partId = null;
var childrenIdList = [];
var deselect_node;		
var svgImageTag = null;
var found2dBom = false;

var removehighlight= false;
var partNotShown = false;
var currentView = null;
if(userApplication == "MILACRON"){
	currentView = "image";
}else{
	currentView = "2D";
}
var catalogImageLoaded = false;
var viewVendorPart = document.getElementById('viewVendorPart'); 
var viewEngDesc = document.getElementById('viewEngDesc');
var viewVendorPartVisible = false;
var viewEngDescVisible = false;
var Searchflag=true;
var jtreeData = {};
var ordMult =1;

if(null != viewVendorPart && viewVendorPart.value == 'true'){
	 viewVendorPartVisible = true;
}
if(null != viewEngDesc && viewEngDesc.value == 'true'){
	viewEngDescVisible = true;
}

/*jstree ajax call*/ 
/*Rajesh Chinnam : The below line added to fix GS-408 on 2015/10/26*/
$.ajaxSetup({ cache: false });
$.getJSON( "getTreeJson", function( tempdata ) {
	jtreeData = tempdata;
	$("#treemachine-catalog.treeview-hldr").jstree(
			{ 'core' : {
				"themes" : {
					"variant" : "large"
				},
				'data' : tempdata
			},
			'types' :{
				"retrofit" :{
					"icon" : "retrofit",
					"valid_children" : []
				},
				"media2d" : {
					"icon" : "media2d",
					"valid_children" : []
				},
				"media3d" : {
					"icon" : "media3d",
					"valid_children" : []
				}
			},
			"plugins": ["search", "wholerow", "types","sort"]
			}
	);
	$('#name').text(tempdata[0].name);
	$('#model').text(tempdata[0].model);
	$('#commDescription').text(tempdata[0].comm_desc);
	$('#vendor').text(tempdata[0].vendor);
	$('#jobId').text(tempdata[0].jobId);
	$('#customerName').text(tempdata[0].customerName);
	/**
	 * Add Serial,Model Info to Information Bar
	 */
	$('.serial_name').text(tempdata[0].name);
	$('.serial_model').text(tempdata[0].model);
	if(tempdata[0].has_aftermarket_item == "true"){
		
		$("#retrofitlbl").text(retrofitmsg);
	}
	partId = tempdata[0].id;
	partNumber = $("#where-used").text(); 
	$("#treemachine-catalog.treeview-hldr").on('ready.jstree', function (e, data) {
		//$('ul.jstree-container-ul li.jstree-node div').addClass('jstree-wholerow-clicked');	
		$("#treemachine-catalog.treeview-hldr i.retrofit").parents("a").css({"color":"#FF0000"});
		$("#treemachine-catalog.treeview-hldr i.media2d").parents("a").css({"color":"#45bf45"});
		$("#treemachine-catalog.treeview-hldr i.media3d").parents("a").css({"color":"#006cbd"});
		$("#treemachine-catalog.treeview-hldr").jstree(true).open_node(partId);
		$("#treemachine-catalog.treeview-hldr").jstree(true).select_node(partId);
		//$("#treemachine-catalog.treeview-hldr").jstree(true).open_node(partId);
	});

	$("#treemachine-catalog.treeview-hldr").on('open_node.jstree', function (data) {
		$("#treemachine-catalog.treeview-hldr i.retrofit").parents("a").css({"color":"#FF0000"});
		$("#treemachine-catalog.treeview-hldr i.media2d").parents("a").css({"color":"#45bf45"});
		$("#treemachine-catalog.treeview-hldr i.media3d").parents("a").css({"color":"#006cbd"});
	});
	/*
	 * on-load bom tree part details
	 */
	if(null != $("#where-used").val() && $("#where-used").val() !="" && $("#where-used").val()!=1){
		$.ajax({
			type : "Get",
			data : "partId=" +partId,
			dataType : "json",
			url : "getBomTreeByPartNumber",
			success :function(data) {
				var out = data;
				var part = out.bom.part.part;
				var mediaObj = out.bom.media;
				//alert("the file  " + JSON.stringify(mediaObj));
				var mediaArray = $.makeArray( mediaObj );
				imageMediaArray = new Array();
				twoDMediaArray = new Array();
				threeDMediaArray = new Array();
				documentArray = new Array();
				for (var int = 0; int < mediaArray.length; int++) {
					if(mediaArray[int].type == 'image'){
						imageMediaArray.push(mediaArray[int].id)
					}else if(mediaArray[int].type == 2 || mediaArray[int].type == '2D'){
						twoDMediaArray.push(mediaArray[int].id);
					}else if(mediaArray[int].type == 3 || mediaArray[int].type == '3D'){
						threeDMediaArray.push(mediaArray[int].id);
					}else if( mediaArray[int].type == 'partmanual'){
						documentArray.push(mediaArray[int]);
					}
				}
				$(".mediacontrols > a#tab_4").addClass('disabled');
				$(".mediacontrols > a#tab_5").addClass('disabled');

				if(twoDMediaArray.length === 0) {
					$(".mediacontrols > a#tab_2").addClass('disabled');
				}
				if(threeDMediaArray.length === 0) {
					$(".mediacontrols > a#tab_3").addClass('disabled');
				}
				if(documentArray.length === 0) {
					$(".mediacontrols > a#tab_6").addClass('disabled');
				}

				var jsonData;
				if(out.bom.part.part.length == undefined){
					var abc = JSON.stringify(out.bom.part.part);
					jsonData = jQuery.parseJSON( "["+abc+"]");
					console.log("Check :"+"["+abc+"]");
				}else{
					jsonData = out.bom.part.part;
					console.log("Else Response"+out.bom.part.part.length);
				} 	 

				$('#datatable-list').dataTable().fnClearTable(); 
				$('#datatable-list').dataTable().fnDestroy();  
				if(viewVendorPartVisible && viewEngDescVisible ){
						mcTable =  $('#datatable-list').DataTable({
							"scrollY": pageHeight*0.35,
							"scrollCollapse": true,
							"bPaginate": false,
							"bInfo": true,
							"bFilter": true,
							"aaData": jsonData,
							"language": {
			              "processing": processing_msg,
			              "lengthMenu": lengthMenu_msg,
			              "search": search_msg,
			              "loadingRecords": loadingRecords_msg,
			              "zeroRecords":    zeroRecords_msg,
			              "emptyTable": emptyTable_msg,
			              "paginate": {
			                  "first": first_page_msg,
			                  "previous": previous_page_msg,
			                  "next": next_page_msg,
			                  "last": last_page_msg
			              },
			          },
						"aoColumns": [
						              { "mData": "balloon_number" },
						              { "mData": "number" },
						              { "mData": "legacy_part_number" },
						              { "mData": "vendor_part_number" },
						              { "mData": "action" },
						              { "mData": "engg_desc" },
						              { "mData": "comm_desc" },
						              { "mData": "qty" },
						              { "mData": "UOM" }
									 //, { "mData": "document_part_number"}
						              ],
						              "aoColumnDefs": [
						                               { "sType": "numeric-comma", "aTargets": [ 0 ] }
						                               ],
						                               "columnDefs": [
					                                              { "className": "text-center", "targets": 7 },
					                                              { "className": "text-center", "targets": 8 }
					                                              ]
						});
				}else{
					mcTable =  $('#datatable-list').DataTable({
						"scrollY": pageHeight*0.35,
						"scrollCollapse": true,
						"bPaginate": false,
						"bInfo": true,
						"bFilter": true,
						"aaData": jsonData,
						"language": {
		              "processing": processing_msg,
		              "lengthMenu": lengthMenu_msg,
		              "search": search_msg,
		              "loadingRecords": loadingRecords_msg,
		              "zeroRecords":    zeroRecords_msg,
		              "emptyTable": emptyTable_msg,
		              "paginate": {
		                  "first": first_page_msg,
		                  "previous": previous_page_msg,
		                  "next": next_page_msg,
		                  "last": last_page_msg
		              },
		          },
					"aoColumns": [
					              { "mData": "balloon_number" },
					              { "mData": "number" },
					              { "mData": "legacy_part_number" },
					              { "mData": "action" },
					              { "mData": "comm_desc" },
					              { "mData": "qty" },
					              { "mData": "UOM" }
								   //,{ "mData": "document_part_number"}
					              ],
					              "aoColumnDefs": [
					                               { "sType": "numeric-comma", "aTargets": [ 0 ] }
					                               ],
					                               "columnDefs": [
				                                              { "className": "text-center", "targets": 5 },
				                                              { "className": "text-center", "targets": 6 }
				                                              ]
					});
				}
				$("#datatable-container input[type='search']").attr("placeholder", strings['label.search.bom']);
				$("#datatable-container input[type='search']").closest('div').addClass('searchBomWrap');
				$("#datatable-container input[type='search']").parent().append('<span class="glyphicon search-ico-bg"><i class="search-glass-ico"></i></span>');
				$('body div.dataTables_scrollBody thead tr:first').hide();
				mcTable.columns.adjust().draw();
				if(showOrHideLegacyPart.value == 'false'){
					oTable = $('#datatable-list').dataTable().api();
					oTable.column(2).visible(false);
					$("#legacyNumber").hide();
				}
				//currentView = "2D";
				if(currentView == "image"){
					initializeImage();
					currentView == "image";
				}else if(currentView == "2D") {
					if(twoDMediaArray != '' && null != twoDMediaArray){
						initialize2d(null);
					} else {
						initializeImage();
						currentView = "image";
					}
				}else if(currentView == "3D"){
					if(threeDMediaArray != '' && null != threeDMediaArray){
						initialize3d(e);
						currentView = "3D";
					} else {
						initializeImage();
						currentView = "image";
					}
				}else if(currentView == "Document"){
					if(documentArray != '' && null != documentArray){
						initializeDocuments();
						currentView = "Document";
					}else {
						initializeImage();
						currentView = "image";
					}
				}
				/*hiding preloader*/
				$("div.pageLoader").hide();
			},
			error :function(e){
				//alert('Error: ' + error);
				$("div.pageLoader").hide();
			}
		}); //end of ajax
	}  //end of if
	//alert("ON Load jstreee"+$("#where-used").val());
	if($("#where-used").val()==1)
	{
		whereUsedHighlight();
	}
});  //end of getJSON

//functions

function isMSieversion() {

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");
    var spViewer;
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)){
    	// If Internet Explorer, return version number
        //alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
    	spViewer = true;
    }
    else{
        // If another browser, return 0
        //alert('otherbrowser');
    	spViewer = false;
    }   
    return spViewer;
};

function removeHighlights(e) {	
	clearNodeHighlight();
	removeBomGriDHighlight();
	$('#msg3dArea p').css('visibility','hidden');
	lastBomItemNumber = null;
	lastBomPartNumber = null;
	e.stopImmediatePropagation();		
};

function getBomForSelectedPartId(partId,parentPartId) {
	$("div.pageLoader").show();
	$.ajax({
		type : "Get",
		dataType : "json",
		url : "getBomJsonTreeByPartNumber?partId=" + partId,
		success : function(data) {		
			var jsonData;
			var out = data;
			if(out.bom.part.part.length == undefined){
				var abc = JSON.stringify(out.bom.part.part);
				jsonData = jQuery.parseJSON( "["+abc+"]");
				console.log("Check :"+"["+abc+"]");
			}else{
				jsonData = out.bom.part.part;
				console.log("Else Response"+out.bom.part.part.length);
			}
			
			console.log("--------------------------**");
			console.log(jsonData);
			console.log("--------------------------**");
			
			
			$('#datatable-list').dataTable().fnClearTable(); 
			$('#datatable-list').dataTable().fnDestroy(); 
			//START NREV-824: 'Where Used 'button  for a part is missing for guest user and logged in user Fix by Rajesh
			if(viewVendorPartVisible && viewEngDescVisible ){
				mcTable = $('#datatable-list').DataTable({
					"scrollY": pageHeight*0.35,
					"scrollX": true,
					"scrollCollapse": true,
					"bPaginate": false,
					"bInfo": true,
					"bFilter": true,
					"aaData": jsonData,
					"language": {
		              "processing": processing_msg,
		              "lengthMenu": lengthMenu_msg,
		              "search": search_msg,
		              "loadingRecords": loadingRecords_msg,
		              "zeroRecords":    zeroRecords_msg,
		              "emptyTable": emptyTable_msg,
		              "paginate": {
		                  "first": first_page_msg,
		                  "previous": previous_page_msg,
		                  "next": next_page_msg,
		                  "last": last_page_msg
		              },
		          },
					"aoColumns": [
					              { "mData": "balloon_number" },
					              { "mData": "number" },
					              { "mData": "legacy_part_number" },
					              { "mData": "vendor_part_number" },
					              { "mData": "action" },
					              { "mData": "engg_desc" },
					              { "mData": "comm_desc" },
					              { "mData": "qty" },
					              { "mData": "UOM" }
								 //, { "mData": "document_part_number"}
					              ],
					              "aoColumnDefs": [
					                               { "sType": "numeric-comma", "aTargets": [ 0 ] }
					                               ],
					                               "columnDefs": [
					                                              { "className": "text-center", "targets": 7 },
					                                              { "className": "text-center", "targets": 8 }
					                                              ]
				});	
				}else{
					mcTable = $('#datatable-list').DataTable({
						"scrollY": pageHeight*0.35,
						"scrollX": true,
						"scrollCollapse": true,
						"bPaginate": false,
						"bInfo": true,
						"bFilter": true,
						"aaData": jsonData,
						"language": {
			              "processing": processing_msg,
			              "lengthMenu": lengthMenu_msg,
			              "search": search_msg,
			              "loadingRecords": loadingRecords_msg,
			              "zeroRecords":    zeroRecords_msg,
			              "emptyTable": emptyTable_msg,
			              "paginate": {
			                  "first": first_page_msg,
			                  "previous": previous_page_msg,
			                  "next": next_page_msg,
			                  "last": last_page_msg
			              },
			          },
						"aoColumns": [
						              { "mData": "balloon_number" },
						              { "mData": "number" },
						              { "mData": "legacy_part_number" },
						              { "mData": "action" },
						              { "mData": "comm_desc" },
						              { "mData": "qty" },
						              { "mData": "UOM" }
									  //,{ "mData": "document_part_number"}
						              ],
						              "aoColumnDefs": [
						                               { "sType": "numeric-comma", "aTargets": [ 0 ] }
						                               ],
						                               "columnDefs": [
						                                              { "className": "text-center", "targets": 5 },
						                                              { "className": "text-center", "targets": 6 }
						                                              ]
					});	
				}
			
			console.log("Part Number :"+out.bom.part.number);		
			$('#treemachine-catalog.treeview-hldr').jstree('open_node',out.bom.part.id+"_"+parentPartId, function(e,d) {
				console.log("Open - parents--------"+ e.parents.length);
				if(e.parents.length){
					$("#treemachine-catalog.treeview-hldr").jstree('open_node', e.parent);
					$('#treemachine-catalog.treeview-hldr li [aria-selected="true"]').scrollintoview();
				};
			});

			$("#treemachine-catalog.treeview-hldr").jstree(true).deselect_node(deselect_node);
			$("#treemachine-catalog.treeview-hldr").jstree("select_node", out.bom.part.id+"_"+parentPartId);
			$('#treemachine-catalog.treeview-hldr li [aria-selected="true"]').scrollintoview();
			mcTable.columns.adjust().draw();
			if(showOrHideLegacyPart.value == 'false'){
				oTable = $('#datatable-list').dataTable().api();
				oTable.column(2).visible(false);
				$("#legacyNumber").hide();
			}
		},
		error : function(e) {
 		}
	});
};

/* This function is used to clear Highlight node */
function clearNodeHighlight(){	
	if(groupObject !=null || groupObject != undefined ) {
		var nodeElements = groupObject.getElementsByClassName(lastNodeNumber);		
		for(var i = 0; i<nodeElements.length ; i++){
			nodeElements[i].setAttribute("fill","#FFFFFF");
			//ADDED BY VINAY to handle the opacity after clear highlight node
			nodeElements[i].setAttribute("fill-opacity","0");
		}
	}
}
/* This function is used to remove the bom grid row highlight */	
function removeBomGriDHighlight(){	
	var rows = $("#datatable-list").dataTable().fnGetNodes();
	for(var i=0;i<rows.length;i++){
		var tdValByItemNumber = $(rows[i]).find("td:eq(0)").text();
		var tdValByPartNumber = $(rows[i]).find("td:eq(1)").text();
		var finalTdVal = tdValByItemNumber;			
		$(rows[i]).removeClass('selected');
		$(rows[i]).css({ 'background-color' : ""})			
	}	
}

/*
This function used to highlight bom grid row
 */
function highlightBomRow(itemNumber){
	//console.log("bom row highlight"+itemNumber);	
	found2dBom = false;
	var rows = $("#datatable-list").dataTable().fnGetNodes();
	var tdPartNumber = null;
	var tdDocumentPartNumber = null;
	for(var i=0;i<rows.length;i++)
	{ 
		var tdItemNumber = $(rows[i]).find("td:eq(0)").text();
		tdPartNumber = $(rows[i]).find("td:eq(1)").text();			
		tdDocumentPartNumber = $(rows[i]).find("td:eq(9)").text();
		if(tdItemNumber == itemNumber || tdPartNumber == itemNumber || (null != tdDocumentPartNumber && "" != tdDocumentPartNumber && tdDocumentPartNumber == itemNumber)) {
			$(rows[i]).css({ 'background-color' : '#4ab2ea'})
			$(rows[i]).addClass('selected');
			found2dBom = true;
			lastBomItemNumber = tdItemNumber;
			//console.log("bom row highlight lastBomItemNumber:"+lastBomItemNumber);	
		}

	}
	if(!found2dBom) {
		document.getElementById("msgA").innerHTML = "Part not available in BOM";
		$('#msg3dArea p').css('visibility','visible');
	} else {
		$('#msg3dArea p').css('visibility','hidden');	
	}
	$('#datatable-list tbody tr.selected').scrollintoview();
	//highlightHtml3dNode();
}

/* This function Resets the last highlight balloons. */
/* Reseting the last highlight BOM part number.*/
function clearRowHighlight(){
	if(groupObject !=null || groupObject != undefined ) {
		var bomElements = document.getElementsByClassName(lastBomPartNumber);		
		for(var i = 0; i<bomElements.length ; i++){
			bomElements[i].style.backgroundColor="#FFFFFF";
		}
	}
}
function callShopForParts(partId,catagoryItem,orgId) {
	location.href = "getfullitemdetails?itemId="+partId+"&itemCategory="+catagoryItem+"&organizationId="+orgId;
}

function callFullItemDetails(partId,catagoryItem,orgId) {
	var treeItem = $('#treemachine-catalog a.jstree-clicked').text().split(':')[0];
	//location.href = "getfullitemdetails?itemId="+partId+"&itemCategory="+catagoryItem+"&organizationId="+orgId+"&treeItem="+treeItem;
	window.open("getfullitemdetails?itemId="+partId+"&itemCategory="+catagoryItem+"&organizationId="+orgId+"&treeItem="+treeItem,'_blank');
}
//Swetha changes starts to pass catalog Name
function callWhereUsed(partId,partNumber,catalogName) {	
	$("div.pageLoader").show(); 
	window.location.href = "whereUsed?partId="+partId+"&partNumber="+partNumber+"&catalogName="+catalogName+"&whereUsedOrigin=MyMachine";
	$("div.pageLoader").hide(); 
	return false;
}
function exportBomMediaToPdf(){
	$("div.pageLoader").show(); 
	window.location.href="exportbomimageaspdf?partId="+partId;
	$("div.pageLoader").hide(); 
	return false;
}

function whereUsedHighlight(){	 
	if($("#where-used").val()==1){
		console.log("-fdgsfdg--"+$("#partNum").text()+"-dfsafa--"+$("#assemblyUsed").val());
		searchKey = $("#assemblyUsed").val();
		console.log("Search --"+searchKey);
		$("#treemachine-catalog.treeview-hldr").on('ready.jstree', function (e, data) {
			//NREV-1298 : fixed by Aniket : Reviewed by JK
			$("#treemachine-catalog.treeview-hldr").jstree(true).select_node(partId);
			$("#treemachine-catalog.treeview-hldr").jstree(true).open_node(partId);
			//NREV-1298 ends
			$('#treemachine-catalog.treeview-hldr').jstree(true).deselect_all();
			$('#treemachine-catalog.treeview-hldr').jstree(true).search(searchKey);
			$('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
			//NREV-1014 fix starts (Developed by : Swetha)
			$("#origin-from").val("fromWhereUsed");
			$('#treemachine-catalog.treeview-hldr').jstree(true).select_node($(".jstree-search").parent().attr("id"));			
			//NREV-1014 fix ends
			$("#treemachine-catalog.treeview-hldr").jstree(true).open_node($(".jstree-search").parent().attr("id"));
			console.log("Search -completed-"+searchKey);


		});			 				
	}	 
}

function addToCartMyMachine(partId,mediaId,orgId,partNumber,event) {
	
	var items =[];
	var partVoList = {};
	var partVo = {};
	partVo['partId'] = partId;
	partVo['partNumber'] = partNumber;
	items.push(partVo);
	partVoList['partVoList'] = items;
	//$('div.pageLoader').show();
	$('.cart-popup-4grid .msrp-container').hide();
	$('.cart-popup-4grid .error-text').empty();
	$('.cart-popup-4grid').show().slideDown(500);
	$('.cart-popup-4grid .partNumber').text(partNumber);
	$('.cart-popup-4grid .spinner-control .total-items').val(1);
	$('.cart-popup-4grid .msrploader').show();
	if($("#viewer3dDiv")[0]){
		//$("#viewer3dDiv").hide();
		//$("#viewer3dDiv").css({"visibility":"hidden"});
	}
	$.ajax({
		type : "Get",
		//data : {items:JSON.stringify(items),organizationId:orgId},
		data : {items:JSON.stringify(partVoList),organizationId:orgId},
		contentType : 'application/json',
		mimeType : 'application/json',
		url : "getcategoryPartPrice",
		success : function(response) {
			var partItemListPriceAvail = response.partItemVOList;
			$('.cart-popup-4grid .msrploader').hide();

			//JSON Sample
			//{"partItemVOList":[{"partId":14726,"price":-1,"msrp":-1,"currencyCode":"",
			// "savedPrice":-1,"availableQuantity":0,"leadTime":0,"partNumber":"",
			// "tariffCode":"","weight1M":0,"uom":"","weight1UOM":"",
			// "branchPlantCode":"javax.xml.bind.JAXBElement@b654df5",
			// "inventoryMessage":"0 In Stock, Lead Time 0 Day(s)","priceNotShown":false,
			// "organizationId":1,"priceStr":"Contact Customer Service",
			// "msrpStr":"-1","savedPriceStr":"-1"}]}


			if(partItemListPriceAvail[0].priceNotShown == true){
				var priceMsg = guestpricemsg;
				console.log("guestpricemsg - > " + guestpricemsg);
				$(".cart-popup-4grid .your-price").text(priceMsg);
				$(".cart-popup-4grid .msrp, .cart-popup-4grid .save-price").hide();
				$('.quote-button').addClass('not-active');
				$('.spinner-control').addClass('not-active');
				//$('.cart-popup-4grid .error-text').html("<p class=\"text-center\" Contact customer support for assistance.</p>");
				$('.cart-popup-4grid .error-text').html("<p class=\"text-center\">" + customermsg + "</p>");
			}
			else{
				if(partItemListPriceAvail[0].orderMultiple != undefined && partItemListPriceAvail[0].orderMultiple != null){
					ordMult=partItemListPriceAvail[0].orderMultiple;
					$('.cart-popup-4grid .spinner-control .total-items').val(ordMult);
				} 
				if(partItemListPriceAvail[0].inventoryMessage){
					//$(".cart-popup-4grid .inventoryMessage").text(partItemListPriceAvail[0].inventoryMessage);
					var str = partItemListPriceAvail[0].inventoryMessage;
					if(userApplication == "MILACRON" && orgId==1){	
						var strContent = str.substring(0, 10);
						if(strContent=="0 In Stock"){
							$(".cart-popup-4grid .inventoryMessage").text('0 In Stock, Please call 855-737- 8835');
					     } else {
					    	 $(".cart-popup-4grid .inventoryMessage").text(partItemListPriceAvail[0].inventoryMessage);
					     }
						
					} else {
						var hasRoleAvailability = document.getElementById("hasRoleAvailability");
						if(hasRoleAvailability!=null && hasRoleAvailability.value=="true")
						$(".cart-popup-4grid .inventoryMessage").text(partItemListPriceAvail[0].inventoryMessage);
			        }
				}
				//Modified for NREV-1410, by krupa reviewed by Jayakumar
				if(partItemListPriceAvail[0].msrpStr != "-1"){
					$(".cart-popup-4grid .msrp").text(strings['label.msrp']+": " + partItemListPriceAvail[0].msrpStr + " " + partItemListPriceAvail[0].currencyCode ).show();
				}else{
					$(".cart-popup-4grid .msrp").hide();
				}
				if(partItemListPriceAvail[0].priceStr !="-1"){
					$(".cart-popup-4grid .your-price").text(strings['label.item.yourPrice']+": " + partItemListPriceAvail[0].priceStr + " " + partItemListPriceAvail[0].currencyCode ).show();
				}
				else{
					$(".cart-popup-4grid .your-price").hide();
				}
				if(partItemListPriceAvail[0].savedPriceStr != "-1"){
					$(".cart-popup-4grid .save-price").text(strings['label.you.save']+": " + partItemListPriceAvail[0].savedPriceStr + " " + partItemListPriceAvail[0].currencyCode).show();
				}else{
					$(".cart-popup-4grid .save-price").hide();
				}
				//End of Modified for NREV-1410, by krupa reviewed by Jayakumar
			}
			$('.cart-popup-4grid .msrp-container').data("part-id", partId);
			$('.cart-popup-4grid .msrp-container').data("media-id", mediaId);
			$('.cart-popup-4grid .msrp-container').data("org-id", orgId);
			$('.cart-popup-4grid .msrp-container').data("partNumber", partNumber);

			$('.cart-popup-4grid .msrp-container').show();

			/*
			for(var i=0;i<partItemListPriceAvail.length;i++){
				if(partItemListPriceAvail[i].priceNotShown == true){
					var priceMsg = "<spring:message code='guest.price.msg' javaScriptEscape='true'/>";
					$("span.your-price").text(priceMsg);
					$("div.msrpShowHide, div.savePriceShowHide").hide();
					$("div.savePriceShowHide span.save-price").siblings("span").text("");
					$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
					var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
					
					$(".inventoryMsg").text(inventoryMsg);//set inventory Message text
				}
				else{
					
					if(partItemListPriceAvail[i].msrpStr != "-1"){
						$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").show();
						$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode));//set MSRP
					}
					else{
						$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
					}
					
					if(partItemListPriceAvail[i].priceStr != "-1"){
						$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").show();
						$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode))//set price
					}
					else{
						$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").hide();
					}
					
					if(partItemListPriceAvail[i].savedPriceStr != "-1"){
						$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").show();
						$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode));//set saved price
					}
					else{
						$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
					}
					
					$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);
				}
			}
			*/
		},
			error : function(e) {
				$('.cart-popup-4grid').hide();
				if($("#viewer3dDiv")[0]){
					//$("#viewer3dDiv").show();
					$("#viewer3dDiv").css({"visibility":"visible"});
				}
			}
	});
};

function addToCartDirectMyMachine(partId,mediaId,orgId,partNumber, totalItems) {
	var userid=$('#userId').val();
	var authtoken = $('#authToken').val();
	var cartItemCount;
	var img;
	var partNumber = partNumber; //$($(event.target).closest('tr').find('td')[1]).text();

	$('div.pageLoader').show();
	$.ajax({
		type : "POST",
		data : {
			partId : partId,
			mediaId : mediaId,
			quantity : totalItems,
			organizationId : orgId,
			dataItemVal:null,
			isAddToCartFromBOM:true
		},
		url : "addtocart",
		success : function(response) {
			var jsonResponse = JSON.parse(response);
			// getShoppingCartCount();
			
			if (response == '') {
				$('div.pageLoader').hide();
				$(".cart-popover").css({"opacity": 1});
				//$(".cart-popover").show().stop().fadeOut(5000);

				$(".cart-popover").show(); //.stop().fadeOut(5000)
				setTimeout(function(){ $(".cart-popover").hide(); }, 5000);

				$(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
					$(this).css("text-decoration","none");
				});
				$(".cart-popover").find(".cart-popover-title").text(strings['label.catalogweb.part']+":"+ partNumber);
			} else {
				//docServerUrl
				if(typeof jsonResponse.errorMessage=="undefined"){
					$('div.pageLoader').hide();
					//START NREV-730 : RRG QA -> On adding item to cart from view machine, the notification image shows as "catalog-img" (Reproducible in Prod also)
					var docServerUrl_prop = document.getElementById("docServerUrl").value;
					var docServerUrl = docServerUrl_prop+"?media="+mediaId+"&thumbnail=true";
					$(".cart-popover").find(".cart-popover-img img").attr('src',docServerUrl);
					//END NREV-730 : RRG QA -> On adding item to cart from view machine, the notification image shows as "catalog-img" (Reproducible in Prod also)
					$(".cart-popover").css({"opacity": 1});
					//$(".cart-popover").show().stop().fadeOut(5000);
					$(".cart-popover").show(); //.stop().fadeOut(5000)
					setTimeout(function(){ $(".cart-popover").hide(); }, 5000);

					if(mediaId != "0"){
						$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties["docserver.url"]}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
					}else{
						$(".cart-popover").find(".cart-popover-img").children().attr("class",'no-image');
					}

					// alert("Part is added to your cart..."); 
					//$(".cart-popover").find(".cart-popover-img").children().attr(("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken));
					$(".cart-popover").find(".cart-popover-title").text(strings['label.catalogweb.part'] + partNumber);
					getShoppingCartCount();
				}
				else{
					$('div.pageLoader').hide();
					$('.modal-body').text(jsonResponse.errorMessage);
					$("#myModal").show();
					
					//alert("erro for multicurrency");
				}
			}
			if($("#viewer3dDiv")[0]){
				$("#viewer3dDiv").css({"visibility":"visible"});
			}
		},
		error : function(e) {
			$('div.pageLoader').hide();
		}
	});
};

/*function loadBundles() {
	var lang = document.getElementById('language_id_').value;
	jQuery.i18n.properties({
		name:'messages', 
		path:'../localization/', 
		mode:'both',
		language:lang 
		callback: function() { 
			$("#msg_welcome").text(strings['msg_welcome']); $("#msg_selLang").text(strings['msg_selLang', lang]); 
		}
	});
};*/
function loadBundles() {
	  var lang = document.getElementById('language_id_').value;
	  $.ajax({
			type: "GET",
			async:false,
			url: "getLanguage",
			success: function(response){
			    var scriptContent = $($.parseHTML(response, document, true)).filter('script').text();
			    $.globalEval(scriptContent);
			},
			error: function(e){
			}
		});	
	}

$(document).ready(function() {
	
	//Setting place holder based on the roles:
	if(viewVendorPartVisible && viewEngDescVisible){
		var descriptionSearchPlaceholder = $("#descriptionSearchPlaceholder").val();
		$("#searchtree").attr("placeholder",  descriptionSearchPlaceholder);
		$("#searchtree").attr("title",descriptionSearchPlaceholder);
	}else{
		var partNumberPlaceholder = $("#partNumberPlaceholder").val();
		$("#searchtree").attr("placeholder", partNumberPlaceholder);
		$("#searchtree").attr("title",partNumberPlaceholder);
	}
	$("div.pageLoader").show();
	getShoppingCartCount();
	
	if(isMSieversion()){
		$(".cart-popover").css({"padding" : "0", "left" : "-320px"});
	}
	//START Bring From MILACRON_CODE_BASE This code commented from Milacron, but product not commneted
/*	if (window.history && window.history.state) {
		window.history.state('forward', null, 'homepage'); 
   	$(window).on('popstate', function() {
    	window.location.href = 'homepage';
   	});

 }*/
	
	// Find matches
	var sWidth = $(window).width();
	if (sWidth <= 992) {
		var mql = window.matchMedia("(orientation: portrait)");
		$("input[aria-controls='order-list']")
		.parent("div")
		.children('input')
		.attr("placeholder", "<spring:message code='label.whereused.search'/>");
		$(".dataTables_length")
		.find("strong")
		.hide()
		.text("<spring:message code='search.resultsperpage'/>")
		.show();
		$("input[aria-controls='quote-list']").parent("div").contents().filter(function(){
			return this.nodeType === 3;
		}).remove();

		$("td.dataTables_empty:contains('No data available in table')")
		.text("")
		.append("<p><spring:message code='label.results.nodata'/></p>");
		$("td.dataTables_empty:contains('No matching records found')")
		.text("")
		.append("<p><spring:message code='label.catalogweb.record.not.found'/></p>");
		// If there are matches, we're in portrait
		if (mql.matches) {
			// Portrait orientation
			$("#myModal").show();
			$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
			/*alert("This page is best viewed in landscape mode for better usability");*/
		} else {
			// Landscape orientation
			$("#myModal").hide();
			/*alert("Landscape");*/
		}
		// Add a media query change listener
		mql.addListener(function(m) {
			if (m.matches) {
				// Changed to portrait
				$("#myModal").show();
				$(".custom-modal-body")
				.text(
				"This page is best viewed in landscape mode for better usability");
				/*alert("This page is best viewed in landscape mode for better usability");*/
			} else {
				// Changed to landscape
				$("#myModal").hide();
				/*$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
				alert("Landscape");*/
			}
		});
	};

	loadBundles();

	var url = window.location.href;
	var firstIndex = url.indexOf('&partNumber=');
	var lastIndex = url.indexOf('&partId');
	var partNumber = url.substring(firstIndex, lastIndex);
	var newPart= partNumber.toString().replace(new RegExp('&partNumber=', 'g'), ''); 

	$("#treemachine-catalog.treeview-hldr").on('ready.jstree', function (e, data) {
		if(newPart!=""){
			$('#treemachine-catalog.treeview-hldr').jstree(true).search(newPart);
			$('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
		}
	});

	/*catalogweb variables   */ 
	height=  $(window).height();
	$("#treemachine-catalog").css({"height": height-270});
	pageHeight = $(window).height()-57;


	$(".mediawrap").height(pageHeight*0.52);
	$(".section_datatable").height(pageHeight*0.5);
	$(".belt").height(pageHeight*0.55);
	$(".three-dimension").height(pageHeight*0.55);   
	$("#imageviewre-hldr img").height( $(".mediawrap").height());

	function toggleMenu()
	{  
		var w = $("#page").width();
		var winWidth = $(window).width();
		if(w==winWidth)
		{	
			if(winWidth == 1024){
				$(".data_tables_title span").css({'position':'relative','left':'90px'});
				$("#page").animate({width:'60%'},function(){
					$("#menu").css({minWidth:'40%'});
					$(".data_tables_title span").css({'position':'relative','left':'90px'});
					mcTable.columns.adjust().draw();
					if(showOrHideLegacyPart.value == 'false'){
						oTable = $('#datatable-list').dataTable().api();
						oTable.column(2).visible(false);
						$("#legacyNumber").hide();
					}
					initializeImageReset();
					// $('#imageIdCatWeb').smartZoom('destroy');
					// $('#imageIdCatWeb').smartZoom();
				});
			}else if(winWidth ==768){
				$("#page").animate({width:'55%'},function(){
					$("#menu").css({minWidth:'45%'});
					mcTable.columns.adjust().draw();
					if(showOrHideLegacyPart.value == 'false'){
						oTable = $('#datatable-list').dataTable().api();
						oTable.column(2).visible(false);
						$("#legacyNumber").hide();
					}
					initializeImageReset();
				});
			}else{
				$("#page").animate({width:'75%'},function(){
					mcTable.columns.adjust().draw();
					if(showOrHideLegacyPart.value == 'false'){
						oTable = $('#datatable-list').dataTable().api();
						oTable.column(2).visible(false);
						$("#legacyNumber").hide();
					}
					initializeImageReset();
					// $('#imageIdCatWeb').smartZoom('destroy');
					// $('#imageIdCatWeb').smartZoom();
				});
			}
			console.log("collapse");
			return 'collapse';
		}
		else
		{
			$("#page").animate({width:'100%'},function(){
				mcTable.columns.adjust().draw();
				if(showOrHideLegacyPart.value == 'false'){
					oTable = $('#datatable-list').dataTable().api();
					oTable.column(2).visible(false);
					$("#legacyNumber").hide();
				}
				initializeImageReset();
				// $('#imageIdCatWeb').smartZoom('destroy');
				// $('#imageIdCatWeb').smartZoom();
				console.log("expand....");
			});

			return 'expand';
		}
	}

	$( ".menu_slide" ).click( function(e) {
		var status= toggleMenu();
		if(status == 'expand'){
			$('.menu_slide').attr('title','Collapse');

		}else{  
			$('.menu_slide').attr('title','Expand');
		}
		var mediaView = $('.mediawrap').find('.tab-pane.active').attr('id');
		if(mediaView=="tab_c"){
			initialize3d(e); 
			var mediawrapHeight = $('.mediawrap').height();
			$('#ev3d').height(mediawrapHeight); 
		}
		
	});

	// Function to Hide the BOM to the bottom of the screen 
	$("#hide_bom").click(function(){
		var arrowSrc = $(this).children('img').attr('src');
		$(this).children('img').attr('src',arrowSrc=="../images/hide_bom.png"?"../images/show_bom.png":"../images/hide_bom.png");
		$(this).parents('.data_tables_title').toggleClass("bottom0");
		if($('.data_tables_title').hasClass('bottom0')){
			$('#hide_bom').attr('title','Show BOM');
		}else{
			$('#hide_bom').attr('title','Hide BOM');
		}

		$('#datatable-container').toggle();
		var pHeight = pageHeight*0.52;
		var mediawrapHeight = $(".mediawrap").height();
		var imageIdCatWebHeight = $("#imageIdCatWeb").height();
		if(mediawrapHeight<=pHeight){
			$(".mediawrap").height(pageHeight-7);
			$("#imageIdCatWeb").height(pageHeight-7);
			$(".belt").height(pageHeight-7);
			$("#viewer2dDiv").height(pageHeight-7);
			$("#ev2d").height(pageHeight-7);
			$("#ev3d").height(pageHeight-7);
			$('#canvas').height(pageHeight-7);
			$(".section_datatable").height(24);
		}else{
			$(".mediawrap").height(pageHeight*0.52);
			$("#imageIdCatWeb").height(pageHeight*0.52);
			$(".belt").height(pageHeight*0.52);
			$("#viewer2dDiv").height(pageHeight*0.52);
			$("#ev2d").height(pageHeight*0.52);
			$("#ev3d").height(pageHeight*0.52);
			$('#canvas').height(pageHeight*0.52);
			$(".section_datatable").height(pageHeight*0.5);
		}
		$('#imageIdCatWeb').smartZoom('destroy');
		$('#imageIdCatWeb').smartZoom();
		mcTable.columns.adjust().draw();
		if(showOrHideLegacyPart.value == 'false'){
			oTable = $('#datatable-list').dataTable().api();
			oTable.column(2).visible(false);
			$("#legacyNumber").hide();
		}
	});

	/*tabs traversing*/

	$(".mediacontrols a[data-toggle='pill']").click(function(e){                    
		var id = $(this).attr("id");   	 
		if($(this).hasClass("disabled")){		
			e.stopImmediatePropagation();
		}else if(id == "tab_1"){						
			//initializeImageReset();
			removeBomGriDHighlight();
			initializeImage();
			//added by Vinay, to bring the image to center
			initializeImageReset();
			$(this).addClass("active").siblings().removeClass("active");
			

		}else if(id =="tab_2"){
			removeBomGriDHighlight();
			initialize2d(null,e);
			var height=  $(window).height();
			$('#ev2d').height(pageHeight*0.52);
			$(".belt").height(pageHeight*0.52);
			$('#viewer2dDiv').height(pageHeight*0.52);						
			$(this).addClass("active").siblings().removeClass("active");
			//added by Vinay, to bring the image to center
			//initializeImageReset();
		}else if(id == "tab_3"){
			$("div.pageLoader").show();
			initialize3d(e);
			$("div.pageLoader").hide();
			var height=  $(window).height();
			$('#ev3d').height(pageHeight*0.52);
			$("#viewer3dDiv div.alert").css({'margin-top':pageHeight*0.22});						
			$(this).addClass("active").siblings().removeClass("active"); 
			//added by Vinay, to bring the image to center                       
			//initializeImageReset();
			
		}
		else if(id == "tab_4"){
			removeBomGriDHighlight();
			$(this).addClass("active").siblings().removeClass("active");                      
		}
		else if(id == "tab_5"){
			removeBomGriDHighlight();
			$(this).addClass("active").siblings().removeClass("active");                        
		}
		else{	
			removeBomGriDHighlight();
			$(this).addClass("active").siblings().removeClass("active");                        
			initializeDocuments();
		}
		$(".zoomOption1>button, .zoomOption>button").removeClass("button-border");

	});

	/* zoom controls */	
	$(".zoomOption > div.pull-right > button").on("click", function() {
		$(".zoomOption > div.pull-right > button").removeClass("button-border");
		$(this).addClass("button-border");
	});
	$(".zoomOption1 > div.pull-right > button").on("click", function() {
		$(".zoomOption1 > div.pull-right > button").removeClass("button-border");
		$(this).addClass("button-border");
	});

	$( "#treemachine-catalog ul li a" ).on( "hover_node.jstree", function() {
		alert('hover');
	});

	$("#imageview-zoomin").on("click",function(){
		var scaleToAdd = 0.8;
		$("#imageIdCatWeb").smartZoom("zoom", scaleToAdd);
	});
	$("#imageview-zoomout").on("click",function(){
		var scaleToOut = -0.8;
		$("#imageIdCatWeb").smartZoom("zoom", scaleToOut);
	});
	$("#imageviewre-hldr").on("click",function(){
			removeBomGriDHighlight();
	});
	$("#imageIdCatWeb")
		.load(function(){
			catalogImageLoaded = true;
			initializeImageReset();
			console.log("imageIdCatWeb loaded...");
		})
		.error(function(){
			catalogImageLoaded = false;
		});
	//NREV-1686 changed by Aniket -- Reviewed by JK
	$('.cart-popup-4grid').on('click', '.item-increment', function() {
		var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
		if(parseInt(itemVal)>999){
			var value= findMaxValue(itemVal,ordMult);
            $(this).parents('.spinner-control').children('.total-items').val(value);
            return false;
        }
		$(this).parents('.spinner-control').children('.total-items').val(function(i, val) { return val*1+ordMult });
  });

  $('.cart-popup-4grid').on('click', '.item-decrement', function() {
    var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
    if(itemVal>ordMult){
    	$(this).parents('.spinner-control').children('.total-items').val(function(i, val) { return val*1-ordMult });
    }else{
      //Please select quantity to add to cart
    }
  });
  
  $('.cart-popup-4grid').on('change', '.total-items.output', function() {
	    var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	    if(itemVal>ordMult){
	    	var value=getNextValue(itemVal,ordMult);
	    	$(this).parents('.spinner-control').children('.total-items').val(value);
	    }else{
	    	$(this).parents('.spinner-control').children('.total-items').val(ordMult);
	    }
	  });
	//NREV-1686 END
  
var addtoCartCalled = false;

	$(".cart-popup-4grid .btn-primary.quote-button").on('click',function(){
 		var m_partId 	= $('.cart-popup-4grid .msrp-container').data("part-id");
		var m_mediaId = $('.cart-popup-4grid .msrp-container').data("media-id");
		var m_orgId 	= $('.cart-popup-4grid .msrp-container').data("org-id");
		var m_partNumber = $('.cart-popup-4grid .msrp-container').data("partNumber");

		var m_totalItems =  $('.cart-popup-4grid .total-items').val();
		m_totalItems = (parseInt(m_totalItems)) ? m_totalItems: 1;
 		addToCartDirectMyMachine(m_partId, m_mediaId, m_orgId, m_partNumber, m_totalItems);
 		addtoCartCalled = true;
 		$(".cart-popup-4grid a.close-button").click();
	});

	$(".cart-popup-4grid a.close-button").on('click',function(){
		$('.cart-popup-4grid').slideUp(400);
		$('.cart-popup-4grid .msrp-container').data("part-id", "");
		$('.cart-popup-4grid .msrp-container').data("media-id", "");
		$('.cart-popup-4grid .msrp-container').data("org-id", "");
		$('.cart-popup-4grid .msrp-container').data("partNumber", "");
		if($("#viewer3dDiv")[0]  && !addtoCartCalled ){
			$("#viewer3dDiv").css({"visibility":"visible"});
			//$("#viewer3dDiv").show();
		}
	});

	function downloadMedia(mediaId){
		var docserverUrl = $('#docserverUrl').val(); 
		var userId=  $('#userId').val(); 
		var authToken =  $('#authToken').val();
		var downloadURL = docserverUrl+"?media="+mediaId+"&user="+userId+"&token="+authToken;
		window.location = downloadURL;
	}
	jQuery.fn.dataTableExt.oSort['numeric-comma-asc']  = function(a,b) {
		var colValuea = a.toString();
		var colValueb = b.toString();
		var x= colValuea.substr(0, (colValuea.indexOf("<") > -1 ? colValuea.indexOf("<") : colValuea.length) );
		var y= colValueb.substr(0, (colValueb.indexOf("<") > -1 ? colValueb.indexOf("<") : colValueb.length) );
		x = parseInt( x );
		y = parseInt( y );
		return ((x < y) ? -1 : ((x > y) ?  1 : 0));
	};

	jQuery.fn.dataTableExt.oSort['numeric-comma-desc'] = function(a,b) {
		var colValuea = a.toString();
		var colValueb = b.toString();
		var x= colValuea.substr(0, (colValuea.indexOf("<") > -1 ? colValuea.indexOf("<") : colValuea.length) );
		var y= colValueb.substr(0, (colValueb.indexOf("<") > -1 ? colValueb.indexOf("<") : colValueb.length) );
		x = parseInt( x );
		y = parseInt( y );					
		return ((x < y) ?  1 : ((x > y) ? -1 : 0));
	};

});

//Selector - Events

$(".custom-close").click(function() {
	$("#myModal").hide();
});

var searchKey = null;
/*jstree search*/
/******* For Enter Submit Function *****/
$('#search-tree').click(function () {
	searchKey = $("#searchtree").val();
	var searchKeyLength = searchKey.length;
	if(searchKeyLength>=3){
		$('#treemachine-catalog.treeview-hldr').jstree(true).search(searchKey);
		$('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
	}else if(searchKeyLength==0){
		$('#treemachine-catalog.treeview-hldr').jstree(true).clear_search();
	}
	return false;
});
$('#searchtree').bind("enterKey",function(e){
	e.preventDefault();
	searchKey = $("#searchtree").val();
	var searchKeyLength = searchKey.length;
	if(searchKeyLength>=3){
		$('#treemachine-catalog.treeview-hldr').jstree(true).search(searchKey);
		$('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
	}else if(searchKeyLength==0){
		$('#treemachine-catalog.treeview-hldr').jstree(true).clear_search();
	}
	return false;
});
$('#searchtree').bind("removeKey",function(e){
	searchKey = $("#searchtree").val();
	$('#treemachine-catalog.treeview-hldr').jstree(true).clear_search();
});


$('#searchtree').keyup(function(e){
	e.preventDefault();
	if(e.keyCode == 13)
	{
		$(this).trigger("enterKey");
		searchKey = $("#searchtree").val();
		//$('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
	}else if(e.keyCode == 8){
		$(this).trigger("removeKey");
	}
	return false;
});
//START Bring From MILACRON_CODE_BASE , Below code is not commented in MILACRON
/* On-click of the Jstree */
/*$("#treemachine-catalog.treeview-hldr").bind("search.jstree", function (evt, data) {
	if (data.res.length == 0){
		$('#treeError').show();
	}else{
		$('#treeError').hide();
	}
});*/
/*
/*
This click event is used for onclikc bom table highlight row and highlight svg ballon
 */
$("#datatable-list").delegate("tr", "click", function() {
	navigationFlag = false;	
	check2dFilesArray.length = 0;
	$('#msg3dArea p').css('visibility','hidden');
	var rows = $("#datatable-list").dataTable().fnGetNodes();	
	var tdBomItemNumber = $("td:first", this).text();	
	var tdBomPartNumber = $("td:eq(1)", this).text();
	//var data_ = $('#datatable-list').dataTable().row($(this)).data();
	 var documentPartNumber = null;
	 if(null != $("td:eq(9)", this).text()){
		 documentPartNumber = $("td:eq(9)", this).text();
	 }
	// alert(documentPartNumber +"=="+hotspotType);
	lastBomItemNumber = tdBomItemNumber;		
	if(null != documentPartNumber && hotspotType == 2){
		lastBomPartNumber = documentPartNumber;
	}else{
		lastBomPartNumber = tdBomPartNumber;
	}
			
	if(typeof lastBomItemNumber !== 'undefined') {
		removeBomGriDHighlight();		
	}if(similarBomActive) {		
		removeBomGriDHighlight();	
	}else{ 	
		// INC-2401 Fixed by Aniket
		if(tdBomItemNumber != "")   
			highlightBomRow(tdBomItemNumber);		   
	    else
	    	highlightBomRow(tdBomPartNumber);
	}
//	alert("high " + lastBomPartNumber);
	if(this2d && hotspotType == 1) {
		highlight2dNode('_'+lastBomItemNumber);
		removehighlight = false;
	}
	if(this3d) {
		highlight3dNode(lastBomPartNumber);		
	}	 
	if(thisImage) {
		$('#msg3dArea p').css('visibility','hidden');
	}
});

$("#treemachine-catalog.treeview-hldr").bind( "select_node.jstree", function(evt, data){	
	if(userApplication == "MILACRON"){
		currentView = "image";
	}else{
		currentView = "2D";
	}
	var part_id;
	deselect_node = data.node.id;		
	console.log("Test value "+ data.node["original"].depth);
	
	if(data.node["original"].depth!="0"){
		console.log("true");
		part_id = data.node.id.split("_")[0];
	}else{
		part_id = data.node.id; 
	}
	var childCatalog =$('#childCatalogName').val();
	childrenIdList= [];
	if(data.node["original"].direction == "2" || data.node["original"].name == childCatalog ){
		var currentNode = $("#treemachine-catalog.treeview-hldr").jstree("get_selected");
		var childrens = $("#treemachine-catalog.treeview-hldr").jstree("get_children_dom",currentNode);
		
		   for(var i=0;i<childrens.length;i++)
		   {
			  // alert(childrens[i].innerText);
			   childrenIdList.push(childrens[i].id);
		   }
	}
	$("div.pageLoader").show(); 
	$('.mediacontrols a:first').tab('show')		
	console.log("NUmber ==========="+part_id);
	//NREV-1014 fix starts(Developed by : Swetha)
	if($("#where-used").val()==1 && $("#origin-from").val()=="fromWhereUsed"){
		part_id = $("#part_id").val();
		$("#origin-from").val("jsonTree");
	}	
	//NREV-1014 fix ends
	partId = part_id;
	$.ajax({
		type : "Get",
		data : { partId:partId , childrenIdList:childrenIdList},
		contentType : 'application/json',
		url : "getBomTreeByPartNumber",
		success :function(data) {
			var out = $.parseJSON(data);
			console.log("the assemble tree " + out);
			var mediaObj = out.bom.media;								
			var mediaArray = $.makeArray( mediaObj );
			imageMediaArray = new Array();
			twoDMediaArray = new Array();
			threeDMediaArray = new Array();
			documentArray = new Array();
			for (var int = 0; int < mediaArray.length; int++) {
				if(mediaArray[int].type == 'image'){
					imageMediaArray.push(mediaArray[int].id)
				}else if(mediaArray[int].type == 2 || mediaArray[int].type == '2D'){
					twoDMediaArray.push(mediaArray[int].id);
				}else if(mediaArray[int].type == 3 || mediaArray[int].type == '3D'){
					threeDMediaArray.push(mediaArray[int].id);
				}else if(mediaArray[int].type == 'partmanual' ||  mediaArray[int].type == 6){		
					documentArray.push(mediaArray[int]);
				}
			}

			// if(twoDMediaArray.length === 0) {
			// 	$(".mediacontrols > a#tab_2").addClass('disabled').removeClass("active");									
			// }else{
			// 	$(".mediacontrols > a#tab_2").removeClass('disabled');
			// }
			// if(threeDMediaArray.length === 0) {				
			// 	$(".mediacontrols > a#tab_3").addClass('disabled').removeClass("active");					
			// }else{
			// 	$(".mediacontrols > a#tab_3").removeClass('disabled');
			// }
			// if(documentArray.length === 0) {
			// 	$(".mediacontrols > a#tab_6").addClass('disabled').removeClass("active");					
			// }else{
			// 	$(".mediacontrols > a#tab_6").removeClass('disabled');
			// }					
			removeBomGriDHighlight();
			lastBomItemNumber = "_undefined";
			lastBomPartNumber=null;
			clearNodeHighlight();
			var jsonData;
			if(out.bom.part.part.length == undefined){
				var abc = JSON.stringify(out.bom.part.part);
				jsonData = jQuery.parseJSON( "["+abc+"]");
				console.log("Check :"+"["+abc+"]");
			}else{
				jsonData = out.bom.part.part;
				console.log("Else Response"+out.bom.part.part.length);
			} 	 					  
			$('#datatable-list').dataTable().fnClearTable(); 
			$('#datatable-list').dataTable().fnDestroy(); 
			if(viewVendorPartVisible && viewEngDescVisible ){
			mcTable = $('#datatable-list').DataTable({
				"scrollY": pageHeight*0.35,
				"scrollX": true,
				"scrollCollapse": true,
				"bPaginate": false,
				"bInfo": true,
				"bFilter": true,
				"aaData": jsonData,
				"language": {
	              "processing": processing_msg,
	              "lengthMenu": lengthMenu_msg,
	              "search": search_msg,
	              "loadingRecords": loadingRecords_msg,
	              "zeroRecords":    zeroRecords_msg,
	              "emptyTable": emptyTable_msg,
	              "paginate": {
	                  "first": first_page_msg,
	                  "previous": previous_page_msg,
	                  "next": next_page_msg,
	                  "last": last_page_msg
	              },
	          },
				"aoColumns": [
				              { "mData": "balloon_number" },
				              { "mData": "number" },
				              { "mData": "legacy_part_number" },
				              { "mData": "vendor_part_number" },
				              { "mData": "action" },
				              { "mData": "engg_desc" },
				              { "mData": "comm_desc" },
				              { "mData": "qty" },
				              { "mData": "UOM" }
							  //,{ "mData": "document_part_number"}
				              ],
				              "aoColumnDefs": [
				                               { "sType": "numeric-comma", "aTargets": [ 0 ] }
				                               ],
				                               "columnDefs": [
				                                              { "className": "text-center", "targets": 7 },
				                                              { "className": "text-center", "targets": 8 }
				                                              ]
			});	
			}else{
				mcTable = $('#datatable-list').DataTable({
					"scrollY": pageHeight*0.35,
					"scrollX": true,
					"scrollCollapse": true,
					"bPaginate": false,
					"bInfo": true,
					"bFilter": true,
					"aaData": jsonData,
					"language": {
		              "processing": processing_msg,
		              "lengthMenu": lengthMenu_msg,
		              "search": search_msg,
		              "loadingRecords": loadingRecords_msg,
		              "zeroRecords":    zeroRecords_msg,
		              "emptyTable": emptyTable_msg,
		              "paginate": {
		                  "first": first_page_msg,
		                  "previous": previous_page_msg,
		                  "next": next_page_msg,
		                  "last": last_page_msg
		              },
		          },
					"aoColumns": [
					              { "mData": "balloon_number" },
					              { "mData": "number" },
					              { "mData": "legacy_part_number" },
					              { "mData": "action" },
					              { "mData": "comm_desc" },
					              { "mData": "qty" },
					              { "mData": "UOM" }
								  //,{ "mData": "document_part_number"}
					              ],
					              "aoColumnDefs": [
					                               { "sType": "numeric-comma", "aTargets": [ 0 ] }
					                               ],
					                               "columnDefs": [
					                                              { "className": "text-center", "targets": 5 },
					                                              { "className": "text-center", "targets": 6 }
					                                              ]
				});	
			}
			//Start fix for GSP-936
			$("#datatable-container input[type='search']").attr("placeholder",  strings['label.search.bom']);
			//END fix for GSP-936
			$("#datatable-container input[type='search']").closest('div').addClass('searchBomWrap');
			$("#datatable-container input[type='search']").parent().append('<span class="glyphicon search-ico-bg"><i class="search-glass-ico"></i></span>');
			$('body div.dataTables_scrollBody thead tr:first').hide();  
			mcTable.columns.adjust().draw();
			if(showOrHideLegacyPart.value == 'false'){
				oTable = $('#datatable-list').dataTable().api();
				oTable.column(2).visible(false);
				$("#legacyNumber").hide();
			}
			//currentView = "2D";
			if(currentView == "image"){
				initializeImage();
				currentView = "image";
			}else if(currentView == "2D") {
				if(twoDMediaArray != '' && null != twoDMediaArray){
					initialize2d(null);
					$(".mediacontrols").children().removeAttr('style');
					$(".mediacontrols").children("a#tab_2").addClass('active ').siblings('a').removeClass('active ');			                 
					$("#fullitems-graphic-hldr").find('div#tab_b').addClass('active').siblings('.tab-pane').removeClass('active');								
					currentView = "2D";
				} else {
					$(".mediacontrols").children("a#tab_1").addClass('active ').siblings('a').removeClass('active ');			                 
					$("#fullitems-graphic-hldr").find('div#tab_a').addClass('active').siblings('.tab-pane').removeClass('active');		
					initializeImage();
					currentView = "image";
				}
			}else if(currentView == "3D"){
				if(threeDMediaArray != '' && null != threeDMediaArray){				
					$("div.pageLoader").hide();				  
					initialize3d(e);	
					var height=  $(window).height();
					$('#ev3d').height(pageHeight*0.52);								   
					currentView = "3D";
				} else {
					$(".mediacontrols").children("a#tab_1").addClass('active ').siblings('a').removeClass('active ');			                 
					$("#fullitems-graphic-hldr").find('div#tab_a').addClass('active').siblings('.tab-pane').removeClass('active');	
					initializeImage();
					currentView = "image";
				}
			}else if(currentView == "Document"){						   
				if(documentArray != '' && null != documentArray){							  
					initializeDocuments();	
					$(".mediacontrols").children().removeAttr('style');
					$(".mediacontrols").children("a#tab_6").addClass('active ').siblings('a').removeClass('active ');			                 
					$("#fullitems-graphic-hldr").find('div#tab_f').addClass('active').siblings('.tab-pane').removeClass('active');
					currentView = "Document";
				}else {	
					$(".mediacontrols").children("a#tab_1").addClass('active ').siblings('a').removeClass('active ');			                 
					$("#fullitems-graphic-hldr").find('div#tab_a').addClass('active').siblings('.tab-pane').removeClass('active');	
					initializeImage();
					currentView = "image";
				}
			}
			if(twoDMediaArray.length === 0) {
				$(".mediacontrols > a#tab_2").addClass('disabled').removeClass("active");									
			}else{
				$(".mediacontrols > a#tab_2").removeClass('disabled');
			}
			if(threeDMediaArray.length === 0) {				
				$(".mediacontrols > a#tab_3").addClass('disabled').removeClass("active");					
			}else{
				$(".mediacontrols > a#tab_3").removeClass('disabled');
			}
			if(documentArray.length === 0) {
				$(".mediacontrols > a#tab_6").addClass('disabled').removeClass("active");					
			}else{
				$(".mediacontrols > a#tab_6").removeClass('disabled');
			}	
			//$("div.pageLoader").hide();		
			if($("#where-used").val()==1){
				lastBomPartNumber = $("#partNum").val();
				var rows = $("#datatable-list").dataTable().fnGetNodes();
				for(var i=0;i<rows.length;i++)
				{ 							
					whereUsedTdPartNumber = $(rows[i]).find("td:eq(1)").text();			
					if(whereUsedTdPartNumber == lastBomPartNumber) {
						var whereUsedTdItemNumber = $(rows[i]).find("td:eq(0)").text();
						lastBomItemNumber = whereUsedTdItemNumber;
						navigationFlag = false;
					}									
				}			
				var searchText = $("#partNum").val();
				//removeBomGriDHighlight();
				var firstInstance  = 0;
				if (null != searchText && searchText != ""){
					var row = null;
					for(var j=0 ; j < $("#datatable-list tr:contains("+searchText+")").length ; j++){
						var row = $("#datatable-list tr:contains("+searchText+")")[j];
						searchText = $("#partNum").val().toLowerCase();
						if($(row).find('td').length >6 && ($(row).find('td')[1].innerHTML.toLowerCase().indexOf(searchText) != -1 || $(row).find('td')[2].innerHTML.toLowerCase().indexOf(searchText) != -1 || $(row).find('td')[3].innerHTML.toLowerCase().indexOf(searchText) != -1 || $(row).find('td')[5].innerHTML.toLowerCase().indexOf(searchText) != -1 || $(row).find('td')[6].innerHTML.toLowerCase().indexOf(searchText) != -1)){
							if(firstInstance == 0){
								$(row).scrollintoview();
								$(row).css('background','lightblue');
								firstInstance++;
							}else{
								$(row).css('background','lightblue');
								firstInstance++;
							}
						}else if(($(row).find('td')[1].innerHTML.toLowerCase().indexOf(searchText) != -1 || $(row).find('td')[2].innerHTML.toLowerCase().indexOf(searchText) != -1 || $(row).find('td')[4].innerHTML.toLowerCase().indexOf(searchText) != -1 )){
							if(firstInstance == 0){
								$(row).scrollintoview();
								$(row).css('background','lightblue');
								firstInstance++;
							}else{
								$(row).css('background','lightblue');
								firstInstance++;
							}
						}
					}
					
						
					console.log("searchText=="+j);
				}
			}			
			$("div.pageLoader").hide();	
		},
		error :
			function(e) { /*alert('Error: ' + error);*/	$("div.pageLoader").hide();  } 		    
	});
	//NREV-1433:20-9-2017: overriding :contains function to ignore case sensitivity.Added by Pooja
	$.expr[":"].contains = $.expr.createPseudo(function(arg) {
        return function( elem ) {
            return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
        };
    });
	
	$('#treemachine-catalog.treeview-hldr').jstree('open_node.jstree',data.node.id, function(e,d) {
		console.log("Open - parents--------"+ e.parents.length);
		if(e.parents.length){
			$("#treemachine-catalog.treeview-hldr").jstree('open_node', e.parent);
			$('#treemachine-catalog.treeview-hldr li [aria-selected="true"]').scrollintoview();
		};
	}); 
	
});	 
//Added by Amrutha to get part number search
function getAssembliesForPartNumber(searchKey){
	//Input searchh key as part number and catalog id to get assemblies used
	$("div.pageLoader").show();
	

	//$('#treemachine-catalog.treeview-hldr').jstree(true).clear_search();
	$.ajax({
		type : "POST",
		data : {
			partNumber : searchKey
		},
		url : "searchforassemblies",
		success : function(response) {
			$("div.pageLoader").hide();
			$("#where-used").val("1");
			$("#partNum").val(searchKey);
			//List of assemblies used
			// $('#treemachine-catalog.treeview-hldr').jstree(true).clear_search();
			var resJson = jQuery.parseJSON(response);
			//Searchflag=false;
			 if(resJson.map.whereused.map != "undefined" && $.makeArray(resJson.map.whereused.map.parent.myArrayList).length > 1 ){
				 var assmblyList = [];
				 var highlight = false;
				 $('#treeError').hide();
				 $.each($.makeArray(resJson.map.whereused.map.parent.myArrayList),function(index,item){
					 if(index === 0){
						highlight = true;
					 }
					 //assmblyList.push(item.map.partidparentid);
					 $("#treemachine-catalog.treeview-hldr li[id*='"+ item.map.partidparentid +"'")
					 //Added for 1453,1454 by Krupa reviewed by Dibu
					 $.each($.makeArray(getObjects(jtreeData, 'id',item.map.partidparentid)),function(index,childitem){
						 if(highlight && index ===0){
							 $('#treemachine-catalog.treeview-hldr').jstree(true).deselect_all();
							 /**commented as the first index may not be first element in the tree **/
							// $("#treemachine-catalog.treeview-hldr").jstree("select_node", childitem.id);
							 highlight = false;
						 }
						 $('#treemachine-catalog.treeview-hldr').jstree('open_node',childitem.id, function(e,d) {
								console.log("Open - parents--------"+ e.parents.length);
								if(e.parents.length){
									$("#treemachine-catalog.treeview-hldr").jstree('_open_to', e);
									$("#"+childitem.id).children("a").addClass("jstree-search");
								};
							});
					 });
				 });
				 //Added to highlight the first element in the tree that matches the search records. By Krupa
				 var highlightedId = $("#treemachine-catalog.treeview-hldr").children("ul").find("a.jstree-search").first().attr("id");
				 $("#treemachine-catalog.treeview-hldr").jstree("select_node", highlightedId);
			 }else{
				 if(resJson.map.whereused.map != "undefined"){
					 $('#treeError').hide();
					 // deselect of the tree as we cannot select or highlight the tree which is already selected 
					 //Fix for GPD-1795,GPD-1789
					 $('#treemachine-catalog.treeview-hldr').jstree(true).deselect_all();
					 var item=resJson.map.whereused.map.parent;
					 var searchAssembly = item.map.partidparentid;
					 console.log("searchAssembly=="+searchAssembly)
					 $('#treemachine-catalog.treeview-hldr').jstree('open_node',searchAssembly, function(e,d) {
						console.log("Open - parents--------"+ e.parents.length);
						if(e.parents.length){
							$("#treemachine-catalog.treeview-hldr").jstree('_open_to', e);
							$("#treemachine-catalog.treeview-hldr").jstree("select_node", e.a_attr.id);
							$("#"+searchAssembly).children("a").addClass("jstree-search");						
						};
					});
				 }
			 }
			 $('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
		},error:function(e){
			console.log("Error :"+e)
		}
		}); 
}

//Added for 1453,1454 by Krupa reviewed by Dibu
function getObjects(obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else if (i == key && obj[key].startsWith(val)) {
            objects.push(obj);
        }
    }
    return objects;
}
//Added by Rajesh to define statsWith Function as It doesn't work in IE defaulty
if (!String.prototype.startsWith) {
	
	String.prototype.startsWith = function(search, pos) {
		console.log("calling statswith=="+this.substr(!pos || pos < 0 ? 0 : +pos, search.length) === search);
		return this.substr(!pos || pos < 0 ? 0 : +pos, search.length) === search;
	};
}
$("#treemachine-catalog.treeview-hldr").bind("search.jstree", function (evt, data) {
	//Searchflag=true;
	/**commented for GPD-834 Not restricting the search only to JSTree and searching in BOM details aswell **/
	//if (data.res.length == 0){
		if($("#where-used").val()==1 && $("#origin-from").val()=="fromWhereUsed"){
			var whereUsedPart = $("#partNum").val();
			console.log("Coming from where used=="+whereUsedPart);
			getAssembliesForPartNumber(whereUsedPart);
		}else{
			getAssembliesForPartNumber(searchKey);
		}
		if ($(".jstree-container-ul li .jstree-search").length == 0) {
			$('#treeError').show();
		}else{
			$('#treeError').hide();
		}
		
	/**commented for GPD-834 Not restricting the search only to JSTree and searching in BOM details aswell **/
	/*}else{
		$('#treeError').hide();
		$('#treemachine-catalog.treeview-hldr li a.jstree-search').scrollintoview();
	}*/
});


$("#treemachine-catalog.treeview-hldr").bind("clear_search.jstree", function (evt, data) {
	$("#treemachine-catalog.treeview-hldr").children("ul").find("a.jstree-search").removeClass("jstree-search");
});

/* Export Bom PDF */

	$('#catalogBOM').on('click','#exportpdf',function(e){
		   e.preventDefault();
		   
		   $("div.pageLoader").show(); 
		   $('#childrenIdList').val(childrenIdList);
		   $('#part_id').val(partId);
		   document.forms[0].action="exportbomimageaspdf";
		   document.forms[0].submit();
		  /* var loc = "exportbomimageaspdf?partId="+partId+"&childrenIdList="+null;
		   if(childrenIdList!=null && childrenIdList.length>0){
			   loc = "exportbomimageaspdf?partId="+partId+"&childrenIdList="+childrenIdList;
		   }
			//var loc = "exportbomimageaspdf?partId="+partId;
			//var loc = 'homepage';
			window.location.href= loc;*/
	
			$("div.pageLoader").hide(); 
			return false;
			
	}); 
	
	/*}else{
	 Export Bom PDF
	   $('#catalogBOM').on('click','#exportpdf',function(e){
		   e.preventDefault();
	  
			$("div.pageLoader").show(); 
			$('#childrenIdList').val(childrenIdList);
			$('#part_id').val(partId);
			document.forms[0].action="exportbomimageaspdf";
			document.forms[0].submit();
			$("div.pageLoader").hide(); 
			return false;
			
	  }); 
} */

//NREV-1686 added by Aniket -- Reviewed by JK
function getNextValue(itemVal,ordMult){
	var value= parseInt(itemVal);
	var mult = parseInt(ordMult);
	if(mult==1)
		return value;
	var missing=value%mult;
	value = value + (mult - missing);
	if(value>999){
		value=value-mult;
	}
	
	return value;
}

function findMaxValue(itemVal,ordMult){
	var value= parseInt(itemVal);
	var mult = parseInt(ordMult);
	var lastmult= parseInt(999/mult);
	value = lastmult*mult;
	return value;
}
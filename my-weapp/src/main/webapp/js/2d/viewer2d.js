/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/

$(document).ready(function(){
	loadBundles();
});
/*function loadBundles() {
	var lang = document.getElementById('language_id_').value;
		jQuery.i18n.properties({
			name:'messages', 
			path:'../localization/', 
			mode:'both',
			language:lang 
			
		});
	}*/
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
			//alert('Error: ' + e);
			}
		});	
	}
var docServerUrl = document.getElementById("docServerUrl").value;
var mediaIndex=null;
var similarBomActive = false;
var panZoom;
var span=null;
var mediaIndex=null;

var thisImage=false;


/*
This function is used onclick of next button thumbnail
*/
function loadNxtImage() {	
	span = $('#next').text();
	mediaIndex++;
	navigateSvgFile(span);	
}


/*This function is used to intialize documents*/
function initializeDocuments() {
	currentView = "Document";
 $('#docPart').empty(); 
 if(documentArray.length>0){   
     for (var i = 0; i < documentArray.length; i++) {
      //alert("file " + documentArray[i].Filetype + " desc " + documentArray[i].description + " " + documentArray[i].id)
         if(documentArray[i].Filetype == "pdf") {          
           var docTest1 = '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="pd">'+         
                  '<div class="firstArticle">'+
                  '<img src="../images/pdf.png">'+
                  '<div>'+
                  '<h3><a href='+docServerUrl+'?media='+documentArray[i].id+'&user='+$('#userId').val()+'&token='+$('#authToken').val()+' id="pdfName" >'+documentArray[i].orig_file+'</a></h3>'+
                  '<p>'+documentArray[i].description+'</p>'+
                  '</div>'+
                  '</div>'+
         '</div>'
                  $('#docPart').append(docTest1);         
         }else if(documentArray[i].Filetype == "doc") {
     var docTest2 = '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="pd">'+
         '<div class="firstArticle">'+
          '<img src="../images/word.png">'+
          '<div>'+
         '<h3><a href='+docServerUrl+'?media='+documentArray[i].id+'&user='+$('#userId').val()+'&token='+$('#authToken').val()+' id="pdfWord">'+documentArray[i].orig_file+'</a></h3>'+
         '<p>'+documentArray[i].description+'</p>'+
         '</div>'+
         '</div>'+
         '</div>'
         $('#docPart').append(docTest2);           
         }else if(documentArray[i].Filetype == "excel") {
     var docTest3 = '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="pd">'+
         '<div class="firstArticle">'+
         '<img src="../images/excel.png">'+
         '<div>'+
         '<h3><a href='+docServerUrl+'?media='+documentArray[i].id+'&user='+$('#userId').val()+'&token='+$('#authToken').val()+' id="pdfExcel">'+documentArray[i].orig_file+'</a></h3>'+
         '<p>'+documentArray[i].description+'</p>'+
         '</div>'+
         '</div>'+
         '</div>'
         $('#docPart').append(docTest3);          
         }else if(documentArray[i].Filetype == "zip") {
     var docTest3 = '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="pd">'+
         '<div class="firstArticle">'+
         '<img src="../images/zip.jpg">'+
         '<div>'+
         '<h3><a href='+docServerUrl+'?media='+documentArray[i].id+'&user='+$('#userId').val()+'&token='+$('#authToken').val()+' id="pdfExcel">'+documentArray[i].orig_file+'</a></h3>'+
         '<p>'+documentArray[i].description+'</p>'+
         '</div>'+
         '</div>'+
         '</div>'
         $('#docPart').append(docTest3);          
         }             
     }
 }else {
 // alert("No documents available to display");
  return false;  
 } 
}

/*
This function is used onclick of previous button thumbnail
*/
function loadPrevImage() {	
	span = $('#prev').text();
	mediaIndex--;
	navigateSvgFile(span);
} 

/*
This function is used to iterate the array of files to display dynamic svg image on click of pre/nxt button thumbnail
*/
function navigateSvgFile(navigateFlag) {	
	var length = twoDMediaArray.length;	
	var len1 = length-1;
	//alert("len1 " + len1);
	if(length >1) {
	//	alert("media index " + mediaIndex);
		if(navigateFlag == 'Previous'){
			if(mediaIndex <0){
				$('#prevSvg').attr("disabled",true);
				$('#prevSvg').removeClass('glyphiconcolor');
				$('#nextSvg').attr("disabled",false);
				$('#nextSvg').addClass('glyphiconcolor');	
				mediaIndex = 0;
				return false;
			}else{
				if(mediaIndex == 0) {
					$('#prevSvg').attr("disabled",true);
					$('#prevSvg').removeClass('glyphiconcolor');
					$('#nextSvg').attr("disabled",false);
					$('#nextSvg').addClass('glyphiconcolor');		
				}
				navigationFlag = true;
				initialize2d(twoDMediaArray[mediaIndex]);					
			}
		}else{
			if(mediaIndex > len1){
				$('#nextSvg').attr("disabled",true);
				$('#nextSvg').removeClass('glyphiconcolor');
				$('#prevSvg').attr("disabled",false);
				$('#prevSvg').addClass('glyphiconcolor');				
				mediaIndex = len1;
				return false;
			}else{
			//	alert("media in " + mediaIndex);
				if(mediaIndex == len1) {
					$('#nextSvg').attr("disabled",true);
					$('#nextSvg').removeClass('glyphiconcolor');
					$('#prevSvg').attr("disabled",false);
					$('#prevSvg').addClass('glyphiconcolor');
				}
				navigationFlag = true;
				initialize2d(twoDMediaArray[mediaIndex]);					
			}
		}		
	}
};

$('#tab_1').click(function (e) {
	 $("div.pageLoader").show();
	thisImage = true;
	setTimeout(function(){
		initializeImageReset();  
		}, 4000);
	$('#msg3dArea p').css('visibility','hidden');
	 $("div.pageLoader").hide();
});

$('#resetImage,#reset1').click(function(e){
	 $("div.pageLoader").show();
	initializeImageReset();
});


/*
This function used to intialize image
*/
function initializeImageReset(){
	loadBundles();
	thisImage = true;
	this2d = false;
	this3d = false;
	currentView = "image";
	$(".noimg-hldr").hide();
	$('#msg3dArea p').css('visibility','hidden');
	$('#imageIdCatWeb').hide();
	$('#imageIdCatWeb').smartZoom('destroy');
	
	var imageSrc = document.getElementById("imageIdCatWeb");
	
	//Start Bought from Milacron
	if( $(".marketing-hldr.main-img-list li.active img").attr("src") ){
		imageSrc.src=  $(".marketing-hldr.main-img-list li.active img").attr("src");
	}else if( $(".marketing-hldr.main-img-list li") ){
		imageSrc.src=  $(".marketing-hldr.main-img-list li:first img").attr("src");
	}
	//End Bought from Milacron
	if(imageMediaArray.length>0){
		//Start If condition Bought from Milacron
		if(!($(".marketing-hldr.main-img-list li")[0])){
			imageSrc.src= docServerUrl+"?media="+imageMediaArray[0]+"&user="+$('#userId').val()+"&token="+$('#authToken').val();
		}
		$(imageSrc).show();
		$('#tab_a .btn-group-vertical').show();
		$("div.pageLoader").hide();
		$('#imageIdCatWeb').smartZoom();
	}else{
		$('#imageIdCatWeb').hide();
		$("#noImgAvailable").text(strings['label.noimageavailable.message']);
		$(".noimg-hldr").show();
		$('#tab_a .btn-group-vertical').hide();
		$('#imageIdCatWeb').smartZoom('destroy');
		return false;
	}
}

/*
This function used to intialize image
*/
function initializeImage(){	
	loadBundles();
	thisImage = true;
	this2d = false;
	this3d = false;
	currentView = "image";
	$(".noimg-hldr").hide();
	$('#msg3dArea p').css('visibility','hidden');
	//$('#imageIdCatWeb').hide();
	//$('#imageIdCatWeb').smartZoom('destroy');
	$("div.pageLoader").show();
	var imageSrc = document.getElementById("imageIdCatWeb");
	if(imageMediaArray.length>0){
		imageSrc.src= docServerUrl+"?media="+imageMediaArray[0]+"&user="+$('#userId').val()+"&token="+$('#authToken').val();
		$(imageSrc).show();
		$('#tab_a .btn-group-vertical').show();
		$("div.pageLoader").hide();
		$('#imageIdCatWeb').smartZoom();
	}else{
		$('#imageIdCatWeb').hide();
		$("#noImgAvailable").text(strings['label.noimageavailable.message']);
		$(".noimg-hldr").show();
		$('#tab_a .btn-group-vertical').hide();
		$('#imageIdCatWeb').smartZoom('destroy');
		$("div.pageLoader").hide();
		return false;
	}
}

/*
This function used to initilize the filepath on load of page
*/
function initialize2d(mediaId,e){
	this3d=false;
	this2d=true;
	currentView = "2D";
	$('#msg3dArea p').css('visibility','hidden');		
	browserSupportStatus = browserSupportForSvg();
	if(browserSupportStatus) {
	 	var svgjsLink = $("<script type='text/javascript' src='../js/2d/viewer2dSvg.js'>");
     	$("head").append(svgjsLink);		
	}else {
		var pngjsLink = $("<script type='text/javascript' src='../js/2d/viewer2dPng.js'>");
     	$("head").append(pngjsLink);
	}	
	if(twoDMediaArray.length>0){
		//Start Bought from Milacron
		if(twoDMediaArray.length >= 3 && twoDMediaArray[2] !== 'undefined' && document.getElementById("2dIframe") != null){
			var webPath = twoDMediaArray[2];
			var imageSrc = document.getElementById("2dIframe");
			imageSrc.src=webPath;
			return false;
		}
		//End Bought from Milacron
		if(twoDMediaArray.length==1) {
			$('.carousel-control').hide();
		}else{
			$('.carousel-control').show();
		}
		if(mediaId == null){
			mediaIndex = 0;
			load2dFile(twoDMediaArray[0]);
		}else{						
			load2dFile(mediaId);
		}
	}else{
		e.preventDefault();
		return false;
	}
}


/*
	Check the browser and its version.
	For IE8 and below version, only PNG will load.
	Else PNG with svg hotspot will load.
*/
function browserSupportForSvg(){	
	if(browserName == 'Microsoft Internet Explorer' && majorVersion <= 8)
		return false;
	else
		return true;
}

/*
This function Highlights the BOM grid.
*/
function callbackClickedNodeNumber(nodeNumber){	
	var splitedNodenumber = nodeNumber.split("_");
	var finalNodeNumber = splitedNodenumber[1];
    var rows = $("#datatable-list").dataTable().fnGetNodes();		
		if(typeof lastBomItemNumber !== 'undefined') {
			removeBomGriDHighlight();			
		}
		if(similarBomActive){
			removeBomGriDHighlight();				
		}else {
			highlightBomRow(finalNodeNumber);
		}
	var rows = $("#datatable-list").dataTable().fnGetNodes();
		for(var i=0;i<rows.length;i++) {
			if($(rows[i]).find("td:eq(0)").text() == finalNodeNumber) {
				//$(rows[i]).css({ 'background-color' : ""})
				lastBomPartNumber = $(rows[i]).find("td:eq(1)").text();
			}
		}
	lastBomItemNumber = finalNodeNumber;
}



/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var groupObject;
var svgDoc;
var lastNodeNumber;
var multiNodeActive = false;
var magValue ;
var lastBomPartNumber;
var similarBomActive = false;  //highlight
var currentMediaId;

/*
This function loads the png image with browser IE <8  version and load e-samrt plugin for png zoom
*/
function load2dFile(mediaId) {	
	currentMediaId = mediaId;	
	//document.getElementById("viewer2dDiv").innerHTML="";
	//document.getElementById("viewer2dDiv").innerHTML="<img id='imageFullScreen' width='100%' height='600px'/>";
	document.getElementById("imgContainer").innerHTML="";
	document.getElementById("imgContainer").innerHTML="<img id='imageFullScreen' width='800px' height='600px'/>";
	document.getElementById("imageFullScreen").src = docServerUrl+"?media="+mediaId + "&exportFile=jpeg";	
	var loadPngZoomJsLink = $("<script type='text/javascript' src='../js/2d/e-smart-zoom-jquery.min.js'>");
	$("head").append(loadPngZoomJsLink);	
	$('#imageFullScreen').smartZoom({'containerClass':'zoomableContainer'});
	$('#imag2dMagnifier').remove();
	var obj = $('<img id="imag2dMagnifier" class="small" height="100%" width="100%" margin="0" >');
	obj.attr('src', docServerUrl+"?media="+mediaId + "&exportFile=jpeg");	
	$('.large').css("background-image", "url("+ docServerUrl+"?media="+mediaId + "&exportFile=jpeg)");
	obj.appendTo('#magnifier2dDiv');
	$('#viewer2dDiv').show();
}
/*
This function used to highlight the clicked bom row
*/
function highlight2dNode(nodeNumber){
	if(magValue == "enableMag") {
			refreshPage();
			$('#magnifier2dDiv').hide();
			$('#viewer2dDiv').show();
			magValue = "disableMag";					
	 }
	var nodeId=nodeNumber;	
	groupObject = document.getElementById("ev2d").getSVGDocument();
	svgDoc = groupObject.getElementById("svgDoc");
	var nodeNumber = svgDoc.getElementById(nodeId).getAttribute('name');  // by ID, get 'name' attribute value.
	if(typeof lastNodeNumber !== 'undefined'){
		clearNodeHighlight();
	}				
	if(multiNodeActive){			
		var nodeElements = groupObject.getElementsByClassName(nodeNumber);			
		for(var i = 0; i<nodeElements.length ; i++){
			//Modified by Vinay for ballon alignment and opacity increasing, starts
			nodeElements[i].setAttribute("fill","#C80000");
			nodeElements[i].setAttribute("fill-opacity","0.4");
			//Modified by Vinay, ends
		}
	 }
	else{
//Modified by Vinay for ballon alignment and opacity increasing, starts
		svgDoc.getElementById(nodeId).setAttribute("fill","#C80000");
		svgDoc.getElementById(nodeId).setAttribute("fill-opacity","0.4");
//Modified by Vinay, ends
	}	
	lastNodeNumber = nodeNumber;		
	callbackClickedNodeNumber(nodeId);
	
}


/*
	This function Resets the last highlight balloons.
*/
function clearNodeHighlight(){	
	if(groupObject !=null || groupObject != undefined ) {
		var nodeElements = groupObject.getElementsByClassName(lastNodeNumber);
		for(var i = 0; i<nodeElements.length ; i++){
			nodeElements[i].setAttribute("fill","#FFFFFF");
			
		}
	}
}
/*
	Reseting the last highlight BOM part number.
*/
function clearRowHighlight(){
	if(groupObject !=null || groupObject != undefined ) {
		var bomElements = document.getElementsByClassName(lastBomPartNumber);		
		for(var i = 0; i<bomElements.length ; i++){
			bomElements[i].style.backgroundColor="#FFFFFF";
			
		}
	}
}
$(document).ready(function() {	
	/*
	  This event triggers on click of enable button,which will hide the svg image and shows magnifier image.
	*/
	$('#emag').click(function() {				
			magValue = $(this).val();
			clearRowHighlight();		
			$('#viewer2dDiv').hide();
			$('#magnifier2dDiv').show();
	});
	/*
	  This event triggers on click of disable button,which will hide the magnifier image and shows  image
	*/
	$('#dmag').click(function() {
			magValue = $(this).val();
			//location.reload(true);
			clearRowHighlight();	
			$('#viewer2dDiv').show();
			$('#magnifier2dDiv').hide();
	});	
	
	/*
	 This click event for svg and png zoom-in and out
	 */
	$('#zoom-in,#zoom-out').click(function() {										
			if(magValue == "enableMag") {						
				//panZoom.resetZoom()
				$('#magnifier2dDiv').hide();
				$('#viewer2dDiv').show();								
			 } else if(magValue == "disableMag" || magValue == null) {				 	
						return false;												
			 }		
	});		
	
	
	/*
	 This click event for png zoom-in and out and suppots ie<8
	 */
	$('#imageFullScreen').smartZoom({'containerClass':'zoomableContainer'});
	$('#zoom-in,#zoom-out').bind("click", zoomButtonClickHandler);
	function zoomButtonClickHandler(e){
		var scaleToAdd = 0.5;
		if(e.target.id == 'zoom-out')
			scaleToAdd = -scaleToAdd;
			$('#imageFullScreen').smartZoom('zoom', scaleToAdd);
	}
	
	
	/*
	 This reset event for reset the png/svg image to normal size
	 */
	$('#reset').click(function() {		
		//$('#viewer2dDiv').hide();
		if(magValue == "enableMag") {	
		$('#magnifier2dDiv').hide();
		$('#viewer2dDiv').show();	
		}
		load2dFile(currentMediaId);
		//$('#viewer2dDiv').show();	
	});
	
});

/*
This function reloads the web page
*/
function refreshPage() {	
	location.reload(true);
}


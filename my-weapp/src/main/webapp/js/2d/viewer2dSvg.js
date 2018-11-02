/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/

$(document).ready(function(){
	loadBundles();
});
/*function loadBundles() {
	if(document.getElementById('language_id_')){
		var lang = document.getElementById('language_id_').value;
		jQuery.i18n.properties({
			name:'messages', 
			path:'../localization/', 
			mode:'both',
			language:lang 
		});
	}
}*/

function loadBundles() {
	  //var lang = document.getElementById('language_id_').value;
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

var alreadyJsLoaded=null;
var lastEmbed=null;
var embed = null;
var multiNodeActive = null;
var zoomMode = "IN";
var panZoom;
var saveMediaId;

/*
This function used to apply zoom,pan functionality for svg image.
*/ 
function registerEvents() {	
	if(typeof(panZoom) == "undefined"){
		document.getElementById('zoom-in').addEventListener('click', function(ev){		
		 ev.preventDefault();
		 panZoom.enablePan();
		 panZoom.zoomIn();
		 panZoom.enableZoom();
		 zoomMode = "IN";
		 svgImageTag.setAttribute('style', 'cursor: zoom-in;');
		});
		document.getElementById('zoom-out').addEventListener('click', function(ev){			
		  ev.preventDefault();
		  panZoom.zoomOut();
		  panZoom.enableZoom();
		  zoomMode = "OUT";
		  svgImageTag.setAttribute('style', 'cursor:zoom-out ;');
		});
		document.getElementById('pan1').addEventListener('click',function(ev){
		  ev.stopImmediatePropagation();
		  ev.preventDefault()
		  panZoom.enablePan();		 
		  svgImageTag.setAttribute('style', 'cursor: move;');
		});
		document.getElementById('reset').addEventListener('click', function(ev){										 
		  center:true,
		  panZoom.resetZoom();
		  panZoom.disablePan();
		  panZoom.disableZoom();
		  panZoom.center();
		  svgImageTag.setAttribute('style', 'cursor: default;');
		});  
	}
	panZoom = svgPanZoom('#ev2d', {
	  zoomEnabled: true,
	  controlIconsEnabled: false,			
	  panEnabled: false,		
	  fit: true,
	  beforeZoom: function(){		
		}
		, onZoom: function(){
		}
		, beforePan: function(){
		}
		, onPan: function(){			
		}
	});	      	 
  };
       	 
 
/*
This function used to load svg specific image and js files .
*/
function load2dFile(mediaId) {	
	 thisImage=false;
	 this2d = true;
	 this3d = false;	
	if(!alreadyJsLoaded) {
		var loadSvgZoomJsPlugin = $("<script type='text/javascript' src='../js/2d/svg-pan-zoom.js'>");//loads the svg zoom plugin js	
		$("head").append(loadSvgZoomJsPlugin);	
		alreadyJsLoaded = true;			
	}
	if(saveMediaId != mediaId && !thisImage)	 {	
		document.getElementById("viewer2dDiv").innerHTML="";	
		if(lastEmbed == null){			
			 lastEmbed = createNewEmbed(mediaId);				 
		}else{			
			//removeEmbed();
			lastEmbed = null;
			lastEmbed = createNewEmbed(mediaId);
		}			
		//setTimeout(registerEvents, 100);   
		saveMediaId = mediaId;			
	}else if(enableHotSpot){
		highlight2dNode('_'+lastBomItemNumber);	
		removehighlight = false;
	}
}

/*
This function used to highlight the clicked bom row
*/
function highlight2dNode(nodeNumber){
	//alert("nodeNumber:"+nodeNumber)
	removehighlight = true;//used for removing highlight outside click of 2d
	if(nodeNumber == null){
		removeBomGriDHighlight();
		return false;
	}
	if(this3d){
		this2d = false;
	}
	//Added by Rajesh
	if(this2d){
		this3d = false;
	}
	if(enableHotSpot){	
		saveNodenumber = nodeNumber;			
		var nodeId=nodeNumber;
		if(document.getElementById("ev2d") != null) {  //this line added for first 3d click 			
			groupObject = document.getElementById("ev2d").getSVGDocument();					
			if(groupObject == null) {
				clearNodeHighlight();
				return false;
			}else{
				var highlight =	false;
				if(groupObject != null && groupObject.getElementById("svgDoc").getElementById(nodeId) != null ){					
					highlight = highlightSvgNode(groupObject,nodeId);										
					return false;
				}else if(!(nodeId == '_null') && !highlight && this2d && navigationFlag == false){															
						check2dFilesArray.push(saveMediaId);						
						if(twoDMediaArray.length>1){						
								for(var i=0;i<twoDMediaArray.length;i++){	
									//alert("two  file " +  twoDMediaArray[i]);
									if(jQuery.inArray(twoDMediaArray[i], check2dFilesArray ) == -1){	
										//alert("push media " + check2dFilesArray.length);
										check2dFilesArray.push(twoDMediaArray[i]);										
										//removeEmbed();
										load2dFile(twoDMediaArray[i]);
										registerEvents();
									}				
								}					
								if(!highlight){
									clearNodeHighlight();
									if(lastBomPartNumber != null && !thisImage){	
										document.getElementById("msgA").innerHTML =lastBomPartNumber+ " - "+strings['label.vehicle.partnotshown']+" in 2D Drawing";
										
										$('#msg3dArea p').css('visibility','visible');
									}
									//alert("Not found savedCurrentMediaId=="+savedCurrentMediaId);
									//load2dFile(savedCurrentMediaId);
								}		
						}else {							
							clearNodeHighlight();
							if(lastBomPartNumber != null && !thisImage){
							document.getElementById("msgA").innerHTML =lastBomPartNumber+ " - "+strings['label.vehicle.partnotshown']+" in 2D Drawing";
							$('#msg3dArea p').css('visibility','visible');
							}
						}										
				}			
			}
		}	
		 else {
			highlight3dNode(lastBomPartNumber);
		}
	}
}


/*
This function used to highlight svg node
*/
function highlightSvgNode(groupObject,nodeId){	
//alert("svg highlight " + nodeId);
	if(enableHotSpot){
		var svgDoc = groupObject.getElementById("svgDoc");	
		if(svgDoc.getElementById(nodeId)!=null) {		
			var nodeNumber = svgDoc.getElementById(nodeId).getAttribute('name');  // by ID, get 'name' attribute value.				
			var nodeElements = groupObject.getElementsByClassName(nodeNumber);	
			if(nodeElements.length>1) {
				 multiNodeActive = true;
			}
			if(typeof lastNodeNumber !== 'undefined'){			
				clearNodeHighlight();
			}				
			if(multiNodeActive){			
				var nodeElements = groupObject.getElementsByClassName(nodeNumber);			
				for(var i = 0; i<nodeElements.length ; i++){
					//Modified by Vinay for 2D ballon alignment and opacity increasing, starts
					nodeElements[i].setAttribute("fill","#4ab2ea");
					nodeElements[i].setAttribute("fill-opacity","0.4");
					//Modified by Vinay, ends
				}
			}
			else{				
				//Modified by Vinay for 2D ballon alignment and opacity increasing, starts
				svgDoc.getElementById(nodeId).setAttribute("fill","#4ab2ea");
				svgDoc.getElementById(nodeId).setAttribute("fill-opacity","0.4");
				//Modified by Vinay, ends
			}	
			lastNodeNumber = nodeNumber;			
			callbackClickedNodeNumber(nodeId);	
			return true;
		}else{
			clearNodeHighlight();
			return false;
		}	
	}
}

/*
This function used to create svg object tag
*/
function createNewEmbed(mediaId){
console.log("create new embed")	;
    var embed = document.createElement('embed');
	embed.setAttribute('id', 'ev2d');	
    embed.setAttribute('style', 'width: 100%; height: 100%;');
    embed.setAttribute('type', 'image/svg+xml');
	var svgDocUrl = docServerUrl+"?media="+mediaId+"&user="+$('#userId').val()+"&token="+$('#authToken').val();
    embed.setAttribute('src', svgDocUrl );	 	 	
    document.getElementById('viewer2dDiv').appendChild(embed);
	console.log("loaded and highlighted  -----");	
    embed.addEventListener('load', function() {	    	
    	if(enableHotSpot){
    		highlight2dNode('_'+lastBomItemNumber);
    		removehighlight = false;
    	}
		addDynamicSvgUrl();					
		registerEvents();		
		 svgPanZoom(embed, {
				zoomEnabled: true,
				controlIconsEnabled: false
			  });
		
	});
	return embed;		
}

/*
This function used to dynamically setting url to xlink:href inside image tag of svg file from docserver 
*/
/*function addDynamicSvgUrl() {
	svgDocument = document.getElementById("ev2d").getSVGDocument();		
	if (svgDocument == null) {  	
		//setTimeout("addDynamicSvgUrl()", 50);
	} else {     
		svgDoc = svgDocument.getElementById("svgDoc");	
		svgImageTag = svgDoc.getElementById("svgImage");
		svgImageTag.setAttribute('xlink:href',"");
		var svgDocUrl = docServerUrl+"?media="+saveMediaId+"&user="+$('#userId').val()+"&token="+$('#authToken').val()+"&exportFile=jpeg";		
		svgImageTag.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href",svgDocUrl );	
	}
}*/

function addDynamicSvgUrl() {
	svgDocument = document.getElementById("ev2d").getSVGDocument();		
	if (svgDocument == null) {  	
		//setTimeout("addDynamicSvgUrl()", 50);
	} else {     
		svgDoc = svgDocument.getElementById("svgDoc");	
		 svgDoc.addEventListener('click', function(e) {				
			if( !removehighlight) {				
				removeHighlights(e)
			}
			removehighlight = false;
			
		 });		
		//svgDoc.setAttribute('onclick', 'window.parent.removeHighlights(e);');
		svgImageTag = svgDoc.getElementById("svgImage");
		svgImageTag.setAttribute('xlink:href',"");		
		 svgImageTag.addEventListener('click', function(e) {
			if(!removehighlight) {				
				removeHighlights(e);			
			}
			removehighlight = false;
		 });
		
		//svgImageTag.setAttribute('onclick', 'call();');
		var svgDocUrl = docServerUrl+"?media="+saveMediaId+"&user="+$('#userId').val()+"&token="+$('#authToken').val()+"&exportFile=jpeg";		
		svgImageTag.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href",svgDocUrl );	
	}
}




/*
This function used to remove the created svg object tag
*/
function removeEmbed(){	
	setTimeout(function(){
		svgPanZoom(lastEmbed).destroy();	
	},20);
    lastEmbed.removeEventListener('load', lastEventListener);
    lastEventListener = null;
    document.getElementById('viewer2dDiv').removeChild(lastEmbed);
    lastEmbed = null;
	return false;
	
}
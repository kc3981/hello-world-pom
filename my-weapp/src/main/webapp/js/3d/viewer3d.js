/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(document).ready(function(){
	loadBundles();
});

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
			//alert('Error: ' + e);
			}
		});	
	}

//Variable Declaration
var vev;
var REQUIRED_3D_VIEWER =  document.getElementById("required3DViewerVersionUrl").value;
var sapInstallerLink =  document.getElementById("sapInstalledUrl").value;
var htmlMediaId;
this3d = true;
var loaded3dMediaId = null;
var sysConfig= null;
var nodesCount = 0;
var threeDClicked = false;
var olderSapVersionInstalled = false;

/*vev.addEventListener('click', function(e) {
	alert("nodeUnselected===="+nodeUnselected)
	if(nodeUnselected) {				
		removeBomGriDHighlight();		
	}
	nodeUnselected = true;
 });*/

function detectIE() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }
    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }
    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
       // IE 12 => return version number
       return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }
    // other browser
    return false;
}

function getSystemConfiguration(){
	sysConfig=new Object();
	//Check OS
	sysConfig.os = navigator.platform;
	//Check browser
	//Note: 3D viewer is supported only for IE on Windows
	sysConfig.browserRaw=navigator.userAgent;
	var ua = navigator.userAgent;
	var IE11Plus = null;	
	var ieVersion = detectIE();	
	if (ieVersion != false && ieVersion >=7){
		sysConfig.browser="Internet Explorer "+ieVersion;
		if (sysConfig.os.indexOf("Win")>-1){
			//3D viewer supported
			//GPD-1962	Edge - 3D Viewer - Enable Html Viewer for Dege Browser
			var ua = window.navigator.userAgent;
			var edge = ua.indexOf('Edge/');
			if (edge > 0) {
				sysConfig.isViewer3dSupportedForHtml=true;
			}else{
				sysConfig.isViewer3dSupportedForIE=true;
			}
		}
		else{
			sysConfig.isViewer3dSupportedForIE=false;
		}
		//To support 3d in iphone,ipad and android browser 	
	}else if(ua.match(/iPhone/i) || ua.match(/iPad/i)|| ua.match(/Android/i) || ua.match(/Mac OS X/)){
		sysConfig.notWindowsPlatform=true;		
		//To support 3d in android native browser and chrome > 37 version		
		if(ua.match(/Android/i)) {									
			if(ua.match(/Chrome/) &&  ua.indexOf("Version")>37 || ua.indexOf("Android") > -1) {										
				sysConfig.isViewer3dSupportedForHtml=true;
			}else {			
				sysConfig.isViewer3dSupportedForHtml=false;
			}
		//To support ipad os with safari browser > 7.1			
		}else if(ua.match(/iPad/i)) {			
			if(ua.match(/Safari/) && ua.indexOf("Version")>7.1) {				
				sysConfig.isViewer3dSupportedForHtml=true;
			}else {
				sysConfig.isViewer3dSupportedForHtml=false;
			}
		}else if(ua.match(/Mac OS X/) ){			
			var browserName,fullVersion,verOffset,OrginalVersion;					
				if ((verOffset=ua.indexOf("Chrome"))!=-1) {
			//		alert("chrome " + ua.indexOf("version"));
					 browserName = "Chrome";
					 fullVersion = ua.substring(verOffset+7);
					 OrginalVersion = fullVersion.substring(0,3);				
				if(OrginalVersion >=37) {					
					sysConfig.isViewer3dSupportedForHtml=true;
				}
			}else if (( verOffset=ua.indexOf("Safari"))!=-1) {				
				browserName = "Safari";
				fullVersion = ua.substring(verOffset+7);				
				 if ((verOffset=ua.indexOf("Version"))!=-1) 					 
				   fullVersion = ua.substring(verOffset+8);
				   OrginalVersion = fullVersion.substring(0,3);
				   //alert("full version " + fullVersion + "orig vers " + OrginalVersion);
				   if(OrginalVersion > 7.1) {					   
					   sysConfig.isViewer3dSupportedForHtml=true;	
					}
			}else{
				sysConfig.isViewer3dSupportedForHtml=false;
			}
		}
		  return sysConfig;
	}else if(ua.match(/Chrome/)){
		//webkitBrowserName=" Chrome";
		
		if (sysConfig.os.indexOf("Win")>-1){
			sysConfig.isViewer3dSupportedForChrome=true;
		}else{
			sysConfig.isViewer3dSupportedForChrome=false;
		}
	}else if(ua.match(/Firefox/)){		
		//webkitBrowserName=" Chrome";
		if (sysConfig.os.indexOf("Win")>-1){
			sysConfig.isViewer3dSupportedForMozilla=true;
		}else{
			sysConfig.isViewer3dSupportedForMozilla=false;
		}
	}
	if (sysConfig.isViewer3dSupportedForIE==true){
		sysConfig.isViewer3dInstalled = is3dViewerInstalled();
	}else if(sysConfig.isViewer3dSupportedForMozilla == true){
		//sysConfig.isViewer3dInstalled = is3dViewerInstalledForMozillaAndChrome();
		sysConfig.isViewer3dSupportedForHtml=true;
	}else if(sysConfig.isViewer3dSupportedForChrome == true){
		//sysConfig.isViewer3dInstalled = is3dViewerInstalledForMozillaAndChrome();
		sysConfig.isViewer3dSupportedForHtml=true; // Fix for INC-2322 Changes made by Kameshwari, Reviewed By Jayakumar 
	}
	else{
		sysConfig.isViewer3dInstalled=false;
	}
	return sysConfig;
}

/**
	This function checks the 3d viewer 
*/
function is3dViewerInstalled(){
	try{	
		var sapViewer = new ActiveXObject("ExplorationX.mainSTA.1");
		viewer3dVersionNum = sapViewer.Version;		
		if (viewer3dVersionNum == null){
			return false;
		}
		else if (viewer3dVersionNum!=REQUIRED_3D_VIEWER){
			olderSapVersionInstalled = true;
			return false;
		}
		else {
			return true;
		}
	}
	catch(err){
		return false;
	}
}
/**
	This function will check the Sap viewer installed and the installed version is supported or not on browsers chrome & firefox
*/
function is3dViewerInstalledForMozillaAndChrome(){	
	
	var sapPluginObj = navigator.plugins["SAP VEViewer"];
	var oldSapPluginObj = navigator.plugins["SAP Visual Enterprise Viewer"];
	var oldSapPluginObjComplete = navigator.plugins["SAP Visual Enterprise Viewer Complete"];
	if(oldSapPluginObj == null && oldSapPluginObjComplete != null){
		oldSapPluginObj = oldSapPluginObjComplete;
	}
	
	if(oldSapPluginObj!= null && oldSapPluginObj.version != REQUIRED_3D_VIEWER){
		olderSapVersionInstalled = true;
		return false;
	}
	if( sapPluginObj != null){
		return true;
	}else{
		return false;
	}
}

/**
	Load the Model file into the  Model Object
*/
function initialize3d(e){

	$("div.pageLoader").show(); 
	$(".mediacontrols a#tab_3").addClass('active').siblings().removeClass('active ');			                 
	$("#fullitems-graphic-hldr").find('div#tab_c').addClass('active').siblings().removeClass('active');	
	$(".noimg-hldr").hide();
	this3d = true;
	this2d=false;
	thisImage=false;
	currentView = "3D";
	$('#msg3dArea p').css('visibility','hidden');
	//START Bring From Milacron
	if(threeDMediaArray.length >= 3){
		var webPath = threeDMediaArray[2];
		var imageSrc = document.getElementById("3dIframe");
		imageSrc.src=webPath;
		$("div.pageLoader").hide();
		return false;
	}
	//End Bring From Milacron
	
	if(sysConfig == null){
		sysConfig = getSystemConfiguration();	
	}
	if(olderSapVersionInstalled){
		var sapViewerUnistallLink = "<div role='alert' class='alert alert-info'>You seem to have an older version of 3D SAP Viewer installed on your PC or laptop. Please uninstall that version using the steps provided in this <strong><a href='../documents/Uninstalling_Older_3D_Viewer_Versions.pdf' target='_blank'>document</a></strong>. After uninstall is completed, please restart your browser and access this page again for installing the newer version of 3D SAP Viewer.</div>";
		document.getElementById("viewer3dDiv").innerHTML = sapViewerUnistallLink; 
		$("div.pageLoader").hide();
		return false;
	}
	if(threeDMediaArray.length>0){
		
		if(loaded3dMediaId != threeDMediaArray[0] || sysConfig.isViewer3dSupportedForMozilla == true){
			//sysConfig.isViewer3dSupportedForHtml=true;
				if(sysConfig.isViewer3dSupportedForHtml){
					currentView = "3D";
					//document.getElementById("viewer3dDiv").innerHTML="";
					document.getElementById("viewer3dDiv").innerHTML="<canvas id='canvas' height='auto' width='100%' class='belt'></canvas>";
					//setTimeout(function(){
						vev = document.getElementById("canvas");
					//},1000); 	
					htmlMediaId = threeDMediaArray[0];				
					var support3dJsLink = $("<script type='text/javascript' src='../js/3d/htmlViewer.js'  defer>");
					var locoJsLink = $("<script type='text/javascript' src='../js/3d/Loco.js'  defer>");
					var dvlJsLink = $("<script type='text/javascript' src='../js/3d/dvl.js'  defer>");
					$("head").append(locoJsLink);			
					$("head").append(dvlJsLink);		
					$("head").append(support3dJsLink);
					load3dHtmlFile();
					$("div.pageLoader").hide();
				}else if(sysConfig.notWindowsPlatform && !sysConfig.isViewer3dSupportedForHtml){					
					$(".noimg-hldr").show(); //3d viewer won't support
					$("div.pageLoader").hide();
					return false;
				}else if(sysConfig!=null && sysConfig.isViewer3dInstalled == true){ 				
					document.getElementById("viewer3dDiv").innerHTML="<object id='ev3d' style='width:100%;height:100%;' type='application/rh' class='belt'></object>";
					vev = document.getElementById("ev3d");					
					//setTimeout(function(){
						if (vev.version == REQUIRED_3D_VIEWER){
							disableMenuItems();
							handleToolBarVisibility();							
							
							var loaded = load3dFile(threeDMediaArray[0]);
							if(enableHotSpot) {
							   var rows = $("#datatable-list").dataTable().fnGetNodes();
							}
							/*if(sysConfig.isViewer3dSupportedForMozilla == true){*/
							if(sysConfig.isViewer3dSupportedForMozilla == true || sysConfig.isViewer3dInstalled == true){
								vev.SceneLoaded=sceneLoadedEvent;								
							}
							$("div.pageLoader").hide();
							return false;
						}else{
							var sapViewerDownloadLink = "<div role='alert' class='alert alert-info'>You need 3D SAP Viewer to view this model. Click <strong><a href="+sapInstallerLink+" >here</a></strong> to download. Once you download, double click the file to initiate the installation.</div>";
							document.getElementById("viewer3dDiv").innerHTML = sapViewerDownloadLink;
							$("div.pageLoader").hide();
							return false;
						}
					//},2000); 
				}else if(sysConfig!=null && sysConfig.isViewer3dInstalled == false){					
					// document.getElementById("sapDownloadLink").href=sapInstallerLink;
					var sapViewerDownloadLink = "<div role='alert' class='alert alert-info'>You need 3D SAP Viewer to view this model. Click <strong><a href="+sapInstallerLink+" >here</a></strong> to download. Once you download, double click the file to initiate the installation.</div>";
					document.getElementById("viewer3dDiv").innerHTML = sapViewerDownloadLink; 		
					$("div.pageLoader").hide();
					return false;
				}
			
			//alert("Loaded")
			//setTimeout(function(){
				//sceneLoadedEvent();
			//},0); 
			$("div.pageLoader").hide();
			return false;		
		}else if(enableHotSpot){
			//alert("enable hot spot " + enableHotSpot);
			vev.NodesSelected = getSelectedNodes;
			vev.SelectionChanges  = selectionChanged 
			var rows = $("#datatable-list").dataTable().fnGetNodes();
			//alert("last bom " + lastBomPartNumber)
			for(var i=0;i<rows.length;i++){
				if($(rows[i]).hasClass('selected')){					
						highlight3dNode(lastBomPartNumber);
						$("div.pageLoader").hide();
						return false;
				}
			}	
		}
			
		
	}else{
		//alert("No 3d media files associated to the  part/assembly");
		e.preventDefault();
		$("div.pageLoader").hide();
		return false;
	}	

	$("div.pageLoader").hide(); 
}


function sceneLoadedEvent(){
	 var creator = vev.Creator;
	 var runtime = vev.Runtime;
	// Create MouseEventHandler and attach it to DeepView runtime                
	var mouseEventHandler = creator.MouseEventHandler.Create();               
	mouseEventHandler.OnEvent = handleMouseEvent;                          
	mouseEventHandler.OnMouseDown  = true;                        
	runtime.AddEventHandler(mouseEventHandler);
	
	if(enableHotSpot){
		vev.NodesSelected = getSelectedNodes;
		var rows = $("#datatable-list").dataTable().fnGetNodes();
		for(var i=0;i<rows.length;i++){
			if($(rows[i]).hasClass('selected')){		
				highlight3dNode(lastBomPartNumber);
				return false;
			}
		}	
	}
}

/**
	This function Loads the file into the viewer
*/
function load3dFile(mediaId){	
	loaded3dMediaId = mediaId;
	//Below command will make unselected parts transparent
	if (vev.IsVANMode){
		//if viewer is in VAN mode, reset it to regular mode
		vev.ExecuteCommand("M2910");
	}
	vev.ExecuteCommand("M1717");
	return vev.LoadFile(docServerUrl+"?media="+mediaId+"&user="+$('#userId').val()+"&token="+$('#authToken').val());	
	
}

function reset3dViewer(){
	if(vev != null){
		vev.LoadFile("data:blank");
	}
}

/**
	This function is the callback function which returns the clicked part number
*/
function getSelectedNodes(nodes){
 threeDClicked = true;
 nodesCount = nodes.count;
 //clearRowHighlight();
	if(nodes.count > 0){
		//nodeUnselected = false;
		var nodeNameArray = new Array(nodes.count); 
			for(var i=0;i<nodes.count;i++){
				var node = nodes.item(i);
				nodeNameArray[i]=node.Name;
			//	selectedNodePartNum = nodeNameArray[i];
				//alert("the get selected nodes are " + nodeNameArray[i])
			}
		//	alert("the get selected node name array are " + nodeNameArray);
	callbackGetClickedNodes(nodeNameArray);
	}else if(nodes.count == 0){	
		// alert("getSelectedNodes=="+nodeUnselected)
		/*if(!nodeUnselected) {
			removeBomGriDHighlight();
			//nodeUnselected = true;
		 }*/
		  $('#msg3dArea p').css('visibility','hidden');
		  //lastBomItemNumber = "_undefined";
		  //lastBomPartNumber=null;
	}	 
}

 function handleMouseEvent(e){
	 threeDClicked = false;
	 if (e.IsMouseDown){
	//	 if(nodesCount==0 || threeDClicked == false){
		 if(nodesCount==0 ){
			removeBomGriDHighlight();     
			vev.Scene.ExecuteQuery('everything() unselect()');
		 }			
	}
 }

/**
	This function executes on model to highlight the part in the model
*/
function highlight3dNode(nodeNumber){	
	console.log("highlight 3d node " + nodeNumber);	
		if(sysConfig.isViewer3dSupportedForHtml){
			//highlightHtml3dNode(nodeNumber);
			highlightHtml3dNode(lastBomPartNumber);
			 //return false			 
		}else {			
			nodeNum = nodeNumber;
			var str =  vev.Scene.ExecuteQuery('everything() unselect() exact_match($name,"'+nodeNumber+'",false) select()');
			//alert("nodeNumber==="+nodeNumber);
			if(str.indexOf("Skipped") > -1 && enableHotSpot){
				partNotShown = true;
				lastBomPartNumber = nodeNum;
				selectedNodePartNum = nodeNum;				
				document.getElementById("msgA").innerHTML = lastBomPartNumber+ " - "+strings['label.vehicle.partnotshown']+" in 3D model.";
				this2d = false;
				if(this3d  && !this2d) {					
					$('#msg3dArea p').css('visibility','visible');
				}
				return false;
			}else{
				//alert("highlighted==="+nodeNumber)
				return false;
			}
		}	
}


/**
   Call back from the JS with the node i.e  clicked on
  */
function callbackGetClickedNodes(nodeNameArray){
	//alert("call bcke ge clicke nodes 3d " + nodeNameArray);
	clearRowHighlight();
	for(var i=0;i<nodeNameArray.length;i++){
		highlightNode(nodeNameArray[i]);
	}
 }
  
  /**
   highlights the bom row according to the node clicked on BOM 
  */

function highlightNode(nodeName){
	//alert("node name " + nodeName);
	$('#msg3dArea p').css('visibility','hidden');
//	alert("node name " + nodeName)
	var  foundInBom = false;
	var rows = $("#datatable-list").dataTable().fnGetNodes();	
	//if(document.getElementById(nodeName) != null){ 
	if(typeof selectedNodePartNum != 'undefined') {	
		for(var i=0;i<rows.length;i++)
		{ 
			if(hotspotType == 1 && $(rows[i]).find("td:eq(1)").text() == selectedNodePartNum) {
				ItemNumberddd = $(rows[i]).find("td:eq(0)").text();
				$(rows[i]).css({ 'background-color' : ""})
				$(rows[i]).removeClass('selected');
			}else if(hotspotType == 2 && $(rows[i]).find("td:eq(9)").text() == selectedNodePartNum){
				ItemNumberddd = $(rows[i]).find("td:eq(0)").text();
				$(rows[i]).css({ 'background-color' : ""})
				$(rows[i]).removeClass('selected');
			}
		}			
	} 
	
	if(nodeName !=null) {
	//	selectedNodePartNum = nodeName;
		for(var i=0;i<rows.length;i++){ 			
			if(hotspotType == 1 &&  $(rows[i]).find("td:eq(1)").text() == nodeName) {
				$(rows[i]).css({ 'background-color' : '#4ab2ea'})
				$(rows[i]).addClass('selected');
				lastBomItemNumber = $(rows[i]).find("td:eq(0)").text();
				foundInBom = true;
			}else if(hotspotType == 2 &&  $(rows[i]).find("td:eq(9)").text() == nodeName) {
				$(rows[i]).css({ 'background-color' : '#4ab2ea'})
				$(rows[i]).addClass('selected');
				lastBomItemNumber = $(rows[i]).find("td:eq(0)").text();
				foundInBom = true;
			}        
		}
		$('#datatable-list tbody tr.selected').scrollintoview();
    }
	//alert("found in bom " + foundInBom);
	if(!foundInBom){
		$('#msg3dArea p').css('visibility','visible');
		//alert("Part not available in BOM");
		document.getElementById("msgA").innerHTML =nodeName+ " - "+strings['label.vehicle.partnotshown']+" in BOM";
		return false;
    }
	selectedNodePartNum =   nodeName;
}

/**
	This function hides/shows the menu items by menuItemId
*/
function handleMenuItemVisibility(menuItemId,visibility){
	vev.ShowMenuItem(menuItemId,visibility);
}

/**
	This function hides/shows the 3d loader div
*/
function handle3dDivVisibility(visibility){
	if(visibility){
		document.getElementById("viewer3dDiv").style.display='block';
	}else{
		document.getElementById("viewer3dDiv").style.display='none';
	}
}

/**
	Disables Menu Items Not to be shown in the viewer
*/
function disableMenuItems(){
	handleMenuItemVisibility("M3000",false); 	//Page Layout - Toolbar Button
	handleMenuItemVisibility("M3002",false); 	//Cross Section - Toolbar Button
	handleMenuItemVisibility("M3018",false); 	//Visual Compare - Toolbar Button
	handleMenuItemVisibility("M3200",false); 	//Measurements - Toolbar Button
	//handleMenuItemVisibility("M1720",false);	//Turntable
	handleMenuItemVisibility("M1721",false); 	//Walk
	//handleMenuItemVisibility("M1702",false); 	//Pan
	handleMenuItemVisibility("M2902",false);  	//Projection
	handleMenuItemVisibility("M3011",false); 	//Fullscreen View - Toolbar Button
	handleMenuItemVisibility("M1704",false); 	//Mouse Mode\Fly
}

/**
	handles ToolBar Visibility
*/
function handleToolBarVisibility(){
	vev.ShowGuiElement("left_toolbar",false);
	vev.ShowGuiElement("right_toolbar",true);
	vev.ShowGuiElement("top_toolbar",true);
	vev.ShowGuiElement("bottom_toolbar",true);
	vev.ShowGuiElement("right_click_menu",false);
	vev.ShowGuiElement("HOTSPOT_TOOLTIP",true);
}
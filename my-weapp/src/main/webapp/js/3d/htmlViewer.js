/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
  /*
        * Create a new instance of jDVL and connect it to my canvas 
        * and start a rendering loop so that I can see changes to my 
        * scene as they occur
        */
		var url = docServerUrl+"?media="+htmlMediaId+"&threedType=html&user="+$('#userId').val()+"&token="+$('#authToken').val();
		
		var oDvl = sap.ve.dvl.createRuntime({ totalMemory: 128 * 1024 * 1024 }); // 128 MB
		oDvl.CreateCoreInstance("someUniqueString");
		oDvl.Core.Init(oDvl.Core.GetMajorVersion(), oDvl.Core.GetMinorVersion());
		
		//Setup canvas and activate DVL automatically
		var devicePixelRatio = window.devicePixelRatio || 1;
		
		var canvas = document.getElementById("canvas");
		var height = document.getElementById('fullitemsMediaContainer').style.height;		
		/*Applying canvas width dynamically to give hotspotting fix for screen resolution*/
		var width = $("#viewer3dDiv"). width();
		canvas.width = (width * devicePixelRatio);
		canvas.height = height.slice(0, -2);
		var webGLContext = oDvl.Core.CreateWebGLContext(canvas, { antialias: true, alpha: true });
		// Renderer
		oDvl.Core.InitRenderer();
		oDvl.Renderer.SetDimensions(canvas.width, canvas.height);
		oDvl.Renderer.SetBackgroundColor(0.2, 0.2, 0.2, 1, 0.8, 0.8, 0.8, 1);
		
		oDvl.Renderer.SetOptionF(sap.ve.dvl.DVLRENDEROPTIONF.DVLRENDEROPTIONF_DPI, 96 * devicePixelRatio);
		oDvl.Core.StartRenderLoop();
		
		//var url = "http://localhost:8080/mediaService/SAF-Holland/3D/10000016.vds";
		var sceneId = null;	

		function load3dHtmlFile() {
			if (url) {				
				var xhr = new XMLHttpRequest();
				xhr.onerror = function(event) {
					//TODO: report error
				};
				xhr.onload = function(event) {
					if (xhr.status === 200) {
						//xhr.response						
						oDvl.Core.CreateFileFromArrayBuffer(xhr.response, url, "remote");
						sceneId = oDvl.Core.LoadSceneByUrl(url, null, "remote");
						oDvl.Renderer.AttachScene(sceneId);
						oDvl.Scene.Release(sceneId);
					} else {
						// TODO: report error
						// xhr.status,
						// xhr.statusText
					}
				};
				xhr.onprogress = function(event) {
					//	loaded: event.loaded,
					//	total: event.total
				};
				xhr.open("GET", url, true);
				xhr.responseType = "arraybuffer";
				xhr.send(null);
			}
		}		
		
		/*This function is called on click of the html viewer node  */		
		oDvl.Client.OnNodeSelectionChanged =  function(clientId, sceneId, numberOfSelectedNodes, idFirstSelectedNode) {
			if (numberOfSelectedNodes == 0) {
				//displayOutputPane.value = ("");
			} else if (numberOfSelectedNodes == 1) {
				//Display Node Id
				//Get node name
				var info 			 = oDvl.Scene.RetrieveNodeInfo(sceneId, idFirstSelectedNode, (DvlEnums.DVLNODEINFO.DVLNODEINFO_UNIQUEID));
				var infoN 			 = JSON.stringify(oDvl.Scene.RetrieveNodeInfo(sceneId, idFirstSelectedNode, (DvlEnums.DVLNODEINFO.DVLNODEINFO_NAME)));
				var jsonData 		 = JSON.parse(infoN);				
				var partNumber  	 = jsonData.NodeName;
				removeBomGriDHighlight();
				lastBomPartNumber 	 = partNumber;
				highlightBomRow(partNumber);				
			} else if (numberOfSelectedNodes > 1) {
				//displayOutputPane.value = ("[Multiple Selected]");
			}

		};	
		var track = new sap.ve.Loco(oDvl, canvas, true);
		/*This function is used to highlight htmlviewer 3d node for android and ipad browsers*/
		function highlightHtml3dNode(rowId){
			//alert("hight light node " + rowId)
			oDvl.Scene.Execute(sceneId,DvlEnums.DVLEXECUTE.DVLEXECUTE_QUERY,'everything() unselect() exact_match($name,"'+rowId+'",false) select()');
			
		}
	  
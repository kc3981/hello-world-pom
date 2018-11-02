/*************************************************
/*! Gensuite - v1.0.0
/*  Copyright (c) 2016 Genalpha; Licensed 
/*		eStore Modules
/*		Description: eStore Marketing Banner - Disp/Add/Remove.
/*		Developer: Dibu John
/**************************************************/

var Systems = Systems || {};
if(!Systems.Classes){
	Systems.Classes ={};
}
Systems.Classes.dragElementNow = function() {
	this.elmntRefObj;
	var dragMouseDown = function(e) {
		e = e || window.event;
		// get the mouse cursor position at startup:
		pos3 = e.clientX;
		pos4 = e.clientY;
		document.onmouseup = closeDragElement;
		// call a function whenever the cursor moves:
		document.onmousemove = elementDrag;
		return true;
	};

	var elementDrag = function(e) {
		e = e || window.event;
		// calculate the new cursor position:
		pos1 = pos3 - e.clientX;
		pos2 = pos4 - e.clientY;
		pos3 = e.clientX;
		pos4 = e.clientY;
		// set the element's new position:
		elmntRefObj.style.top = (elmntRefObj.offsetTop - pos2) + "px";
		elmntRefObj.style.left = (elmntRefObj.offsetLeft - pos1) + "px";
		return true;
   };

   var closeDragElement = function() {
	   document.onmouseup = null;
	   document.onmousemove = null;
	   return true;
   };
   
   var _bindEvents = function(elmnt){
	   elmntRefObj = elmnt;
	   var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
	   if (document.getElementById(elmnt.id + "header")) {
	     /* if present, the header is where you move the DIV from:*/
		   document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
	   } else {
	     /* otherwise, move the DIV from anywhere inside the DIV:*/
	     elmnt.onmousedown = dragMouseDown;
	   }
   };
   return({
	   init:function(elmnt){
		   this.elmntRefObj = elmnt;
		   _bindEvents(elmnt);
	   } 
   });
};

Systems.Classes.bannerController = function(){
	var mkAccordionHldr;
	var mkPannelhldr, mkBannerImglist, mkBannerMainImg;
	var dragRefObj;
	//Private factories
	var constructTab = function(tabID, tabName, tfullTitle, tabContent,partCount){
		$(mkPannelhldr).find("ul.nav.nav-tabs").append('<li role="presentation" class=""><a href="#' + tabID +
		'" aria-controls="home" role="tab" data-shottitle="' + tabName +'" title="' + tfullTitle + '" data-toggle="tab">' + tabName + '</a></li>');
		if(partCount == 0){
			$(mkPannelhldr).find(".tab-content").append('<div role="tabpanel" class="tab-pane" id="' + tabID + '"><div  class="tab-content-box" style="max-height:255px">' + tabContent + '</div></div>');
		}else{
			$(mkPannelhldr).find(".tab-content").append('<div role="tabpanel" class="tab-pane" id="' + tabID + '"><div  class="tab-content-box" style="max-height:105px">' + tabContent + '</div></div>');
		}
		
		
		$(mkPannelhldr).find(".tab-content #" + tabID + " .tab-content-box").niceScroll({"autohidemode":"leave","hidecursordelay" : "500","fixed":"true"}); //{"autohidemode":"false","fixed":"true"}
	}

	var clearMktBanner = function(){
		$(mkPannelhldr).find("ul.nav.nav-tabs").empty();
		$(mkPannelhldr).find(".tab-content").empty();
		$(mkPannelhldr).find(".main-img-list").empty();
	    $(mkPannelhldr).find(".main-img-holder").empty();
	    $(mkPannelhldr).find(".main-img-list").hide();
	    $(mkAccordionHldr).hide();
	    $(mkPannelhldr).hide();
	    $('.mkt-banner-hldr').css({"min-height" : "0"});
	    $('.mkt-banner-hldr').empty();
	    if($(".tab-content-box").getNiceScroll()){
	    	$(".tab-content-box").getNiceScroll().remove();
	    }
	    return true;
	}
	//Public services
	this.loadMktXML101 = function(xmlFileName, docserverurl, userid, authtoken,partCount){
		 $.ajax({
		    type: "GET",
		    url: xmlFileName,
		    success: function (xmldata) {
		    	//console.log(xmldata);
		    	clearMktBanner();
		    	$(mkAccordionHldr).show();
		    	if(xmldata.getElementsByTagName('MainBanner')[0]){
		    		var imgPath = docserverurl +'?media='+ xmldata.getElementsByTagName('MainBanner')[0].textContent +'&thumbnail=true&user='+userid+'&token='+authtoken;
		    		$('.mkt-banner-hldr').css({"min-height" : "90px"});
		    		var mainimgObj = '<img alt="" class="col-sm-12 img-responsive" src="' + imgPath +'" />';
		    		if(xmldata.getElementsByTagName('MainBannerLink')[0]){
		    			mainimgObj = '<a href="'+ xmldata.getElementsByTagName('MainBannerLink')[0].textContent +'" target="_blank">' + mainimgObj +  '</a>';
		    		}
		    		$('.mkt-banner-hldr').html(mainimgObj);
		    		$('.mkt-banner-hldr img').ready(function(){
			    		$(mkPannelhldr).find(".tab-content #mTab1 .tab-content-box").getNiceScroll().resize();
			    	});
		    	}
		    	var mXdata = $(xmldata.getElementsByTagName('MktBanners')[0])[0];
		    	for(var xCount=0; xCount < mXdata.childNodes.length; xCount++){
		    		if (mXdata.childNodes[xCount].nodeName == "imgPath"){
		    			var imgpath = docserverurl +'?media='+ mXdata.childNodes[xCount].textContent +'&thumbnail=true&user='+userid+'&token='+authtoken;
			    		$(mkBannerImglist).append('<li data-mtype="image"><img data-mtype="image" src="' + imgpath + '" /></li>');
		    		}else if(mXdata.childNodes[xCount].nodeName == "vidPath"){
		    			var imgpath = "../images/video.png";
		    			var datapath = docserverurl +'?media='+ mXdata.childNodes[xCount].textContent +'&thumbnail=true&user='+userid+'&token='+authtoken;
		    			//var datapath = "../htmls/mbxml/dme-helicalgear-ipad.mp4";
		    			$(mkBannerImglist).append('<li data-mtype="video" data-path="'+ datapath +'" ><img src="' + imgpath + '" /></li>');
		    		}
		    		else if(mXdata.childNodes[xCount].nodeName == "aniPath"){
		    			var imgpath = "../images/rotate360.png";
		    			var datapath = mXdata.childNodes[xCount].textContent;
		    			$(mkBannerImglist).append('<li data-mtype="animation" data-path="'+ datapath +'" ><img src="' + imgpath + '" /></li>');
		    		}
		    	}
		    	
		    	$(xmldata).find('Tab').each(function(){
		    		var tTitle = $(this).find('TabShortName').text();
		    		var tfullTitle = $(this).find('TabFullName').text();
		    		var tContent = $(this).find('Content').text();
		    		constructTab("mTab" + ($(this).index() -1), tTitle, tfullTitle, tContent,partCount);
		    	});
		    	
		    	var mainImgpath =  docserverurl +'?media='+ $(xmldata).find('MktBanners imgPath:first').text() +'&thumbnail=true&user='+userid+'&token='+authtoken;
		    	
		    	$(mkBannerMainImg).append($('<img id="img-main-marketing" data-mtype="image" class="pin-main-img" src="' + mainImgpath + '" />'));
		    	
		    	if($(mkBannerImglist).find("li").length > 1){
		    		$(mkBannerImglist).show();
		    		$(mkBannerMainImg).css({"width" : "168px"});
		    	}else{
		    		$(mkBannerMainImg).css({"width" : "100%"});
		    	}
		    	$(mkPannelhldr).find("ul.nav.nav-tabs li:first-child").addClass("active");
		    	$(mkPannelhldr).find(".tab-content .tab-pane:first-child").addClass("active");
		    	$(mkPannelhldr).find("ul.nav.nav-tabs li:first-child a").text($(mkPannelhldr).find("ul.nav.nav-tabs li:first-child a").attr("title"));
		    	//Inner constructor.
		    	function createShowMoreBtn(target){
		    		var contentHeight = ($(target).find(".tab-content-list").prop("scrollHeight"));
		    		if( contentHeight >= 126){
		    			if( $(target).children(".action-read-more").length == 0 ){
		    				$(target).append('<a href="#" class="pull-right action-read-more" >Read more...</a>'); 
		    			}
		    		}
		    	};
		    	$('#marketing-pannel-hldr a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		    		var target = $(e.target).attr("href"); // activated tab
		    		createShowMoreBtn(target);
		    		$(e.target).text($(e.target).attr("title"));
		    		$(mkPannelhldr).find(".tab-content " + target + " .tab-content-box").getNiceScroll().resize();
		    	});
		    	$('#marketing-pannel-hldr a[data-toggle="tab"]').on('hidden.bs.tab', function (e) {
		    		$(e.target).text($(e.target).data("shottitle"));
		    	});
		    	var mIntr = setInterval(function(){ 
		    		//createShowMoreBtn("#mTab1");
		    		clearInterval(mIntr);
		    		$(mkPannelhldr).find(".tab-content #mTab1 .tab-content-box").getNiceScroll().resize();
		    		$(mkPannelhldr).find(".tab-content #mTab1 .tab-content-box").getNiceScroll().show();
		    	}, 1000);
		    	
		    	$(mkPannelhldr).show();
		    	$(mkAccordionHldr).show();
		    }
		});
		 return true;
	};
	
	this.selectMktImageLstItem = function(thisObj, callOrigin){
		$(mkBannerImglist).find("li").removeClass("active");
		$(mkBannerMainImg).empty();
		
		if(callOrigin =="shop4parts"){
			var datamtype = $(thisObj).data("mtype");
			var datapath  = $(thisObj).data("path");
			/*if(datamtype == 'video'){
				var videoDomElement = '<video id="img-main-marketing" data-path="'+ datapath +'" data-mtype="' + datamtype +'" width="100%" height="100%"  autoplay="pause" preload="auto" style="margin-left: 3%;margin-top: 15%;" > <source src="' + $(thisObj).data("path")+ '#t=0,2" type="video/mp4">';
				$(mkBannerMainImg).append(videoDomElement);
			}else{
				$(mkBannerMainImg).append($('<img id="img-main-marketing" data-path="'+ datapath +'" data-mtype="' + datamtype +'" class="pin-main-img" src="' + $(thisObj).children("img").attr("src") + '" />'));
			}*/
			$(mkBannerMainImg).append($('<img id="img-main-marketing" data-path="'+ datapath +'" data-mtype="' + datamtype +'" class="pin-main-img" src="' + $(thisObj).children("img").attr("src") + '" />'));
		} else if(callOrigin =="fullItems"){
			if($(thisObj).data("mtype") == "image"){
				$(".noimg-hldr").hide();
				$("#imageIdCatWeb").smartZoom("destroy");
				$("#imageIdCatWeb").css({"visibility" : "hidden"});
				$("#imageIdCatWeb").attr("src", $(thisObj).children("img").attr("src"));
				var myVar = setInterval(function(){ $("#imageIdCatWeb").smartZoom(); $("#imageIdCatWeb").css({"visibility" : "visible"}); $("#imageIdCatWeb").show(); clearInterval(myVar); }, 300);
			}else{
				this.enlargeImage(thisObj);
			}
		}
		
		$(thisObj).addClass("active");
		return true;
	};
	this.actionOnReadMore = function(thisObj){
		if($(thisObj).text() == "Read more..."){
			$(mkPannelhldr).css({"height" : "auto", "max-height" : "180px"});
			$(mkPannelhldr).find(".tab-content-list").css({"max-height" : "126px", "overflow-y" : "auto"});
			$(thisObj).text("Read less...");
		}else if($(thisObj).text() == "Read less..."){
			$(mkPannelhldr).css({"height" : "180px", "max-height" : "150px"});
			$(mkPannelhldr).find(".tab-content-list").css({"max-height" : "96px", "overflow-y" : "hidden"});
			$(".tab-content-list").scrollTop(0);
			$(thisObj).text("Read more...");
		}
		return true;
	}
	this.initDomElements = function(thatRef){
		mkAccordionHldr = $("#marketing-pannel-accordion")[0];
		mkPannelhldr = $("#marketing-pannel-hldr")[0];
		mkBannerImglist = ($(mkPannelhldr).find(".main-img-list")[0]) ? $(mkPannelhldr).find(".main-img-list")[0] : $(".marketing-hldr.main-img-list")[0];
		mkBannerMainImg = $(mkPannelhldr).find(".main-img-holder")[0];
		
		dragRefObj = new Systems.Classes.dragElementNow(thatRef);
		return true;
	};
	
	this.enlargeImage = function(thisObj){
		var newDomElement;
		$("#enlargeModal .custom-modal-body").empty();
		if($(thisObj).data("mtype") == "image"){
			newDomElement = '<img id="enlargeModalImage" src="'+ $(thisObj).attr("src") +'">';
		} else if($(thisObj).data("mtype") == "video"){
			newDomElement = '<video width="100%" height="100%" autoplay="pause" preload="auto" controls> <source src="' + $(thisObj).data("path")+ '" type="video/mp4">';
			newDomElement += 'Your browser does not support the video tag.</video>';
		}else if($(thisObj).data("mtype") == "animation"){
			newDomElement = '<iframe src="' + $(thisObj).data("path") + '" height="580" width="100%" style="margin-top: -14px; border:none;" />';
		}
		$("#enlargeModal .custom-modal-body").append($(newDomElement));
		$("#enlargeModal").show();
		
		dragRefObj.init(document.getElementById("moveModal"));
		
		return true;
	};
	this.clearbanner = function(){
		clearMktBanner();
		return true;
	};
};

Systems.Classes.registerBanner = function(){
	this.docserverurl;
	this.userid;
	this.authtoken;
	//Functional Inherits
	var ctrlObj =  new Systems.Classes.bannerController();
	//Private Factories
	var _bindEvents = function(callOrigin, thatRef){
		
		ctrlObj.initDomElements(thatRef);
		$(document).on('click','#img-main-marketing', function(){
			var thisObj = $(this);
			ctrlObj.enlargeImage(thisObj);
		});
		
		$(document).on("click", ".main-img-list li",  function(evt){
			var thisObj = $(this);
			ctrlObj.selectMktImageLstItem(thisObj, callOrigin);
		});
		
		$(document).on("click", ".action-read-more", function(evt){
			var thisObj = $(this);
			ctrlObj.actionOnReadMore(thisObj);
		});
		
		$(document).on ("click",".panel-title span.glyphicon", function(evt){
			 $(this).toggleClass("dropDown-icon");
		});
		
		return true;
	};
	//Interfaces methods
	return({
		init:function(docserverurl, userid, authtoken, callorigin){
			this.docserverurl = docserverurl;
			this.userid = userid;
			this.authtoken = authtoken;
			console.log(this);
			_bindEvents(callorigin, this);
			return true;
		},
		loadBanner:function(xmlFileName,partCount){
			ctrlObj.loadMktXML101(xmlFileName, this.docserverurl, this.userid, this.authtoken,partCount);
			return true;
		},
		clearall:function(){
			ctrlObj.clearbanner();
		}
	});
	
}(window.jQuery);
/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var count, size;
var  myErrObj = new errnsp.errHandling.init();
var userApplication = $('#userApplication').val();
$(function(){
	//SUPPORT-MIL-188-200116
	if(isExternalLink.trim().toLowerCase() == 'true')
	{
		$("#externalDocumentsDiv").show();
		$("#internalDocumentsDiv").hide();
	}
	else
	{
		$("#externalDocumentsDiv").hide();
		$("#internalDocumentsDiv").show();
	//SUPPORT-MIL-188-200116
		var latestJsonObj;
     	size = $('#result-per-page').val();
        $(function(){
        	$('div.pageLoader').show();	
        	//START IF ACONDITION Added for MILACRON_CODE_BASE
        	if(userApplication == "MILACRON"){
        		 $("#new-main-menu-list > li:nth-child(6)").addClass("active");
        	}else{
        		$("#new-main-menu-list > li:nth-child(5)").addClass("active");
        	}
        	//END IF ACONDITION Added for MILACRON_CODE_BASE
            $.getJSON('getdocumenthierarchy',function(response){
            	
            	$('#treeMediaDocuments.treeview-hldr').jstree(
                        { 'core' : {
                        		"multiple" : false,
      					  		"expand_selected_onload":false,
                                "themes" : {
                                  "variant" : "large"
                                },
                                'data' : response
                            },
                         
                            "plugins": ["search", "wholerow", "types"]
                        }
                      );
         	myTreeData = response;
//         	if(null != myTreeData)
//         		count = Object.keys(myTreeData).length;
//         	else
//         		count = 0;
         	 $('#treeMediaDocuments.treeview-hldr').on('ready.jstree', function (e, data) {
                 var treeinstance = $('#treeMediaDocuments.treeview-hldr').jstree(true);
                 treeinstance.hide_dots();
                 treeinstance.hide_stripes();
             });
            	       
              //   get only catalog details from json tree structure 
         	 
               var documents = [];
                var documentsList = {};
                for (var key in myTreeData) {
                    if (myTreeData.hasOwnProperty(key)) {
						console.log("Level 1"+myTreeData[key].organizationName);
                    	documents.push({ 
                    	        "organizationId" : myTreeData[key].organizationId,
                    	        "description"  : myTreeData[key].organizationDesc,
                    	        "mediaFileType" : 0,
                    	        "text" : myTreeData[key].text
                    	    });
                    }
                 } 
                
                
                documentsList.documents = documents;
                console.log("the document list " + documentsList);
                if(documentsList.documents.length > 0){
                	count = Object.keys(myTreeData).length;
	                $("#documentContent").html('');
	                $("#documentTemplate").tmpl(documentsList.documents).appendTo("#documentContent");
	                $(count).appendTo("#documentSize>label");
	                document.getElementById('hdnResultVal').value= count;
                } else {
					$("#documentTemplate").html('');
					$("#documentContent").html('<p>'+document.getElementById('hdnmsg').value+'</p>');
					$("#documentSize>label").html(documentsList.documents.length);
                }
              
              //  latestJsonObj = myTreeData;
                $("#headerName").text('Document');  
                
                
                size = document.getElementById('result-per-page').value;
                createpage(size, count);
                $('div.pageLoader').hide();	


            }).fail(function(jqxhr, textStatus, error) {
                var err = jqxhr.status;
                var msg = jqxhr.responseText;
                $(".pageLoader").hide();
                console.log( "Request Failed: " + err );
                 console.log( "Request Failed: " + jqxhr.responseText );
                 myErrObj.raise(err,msg,textStatus);
            });
           
			
        });

     
        
        // onclick of document
        $(document).delegate('.docClick','click', function(){
        //	$('div.pageLoader').show();	
        //  alert("Document triggered");
        	console.log(JSON.stringify(latestJsonObj));
        	var documentJsonObj = null;
        	var organizationId = $(this).parents('.document-info').attr('id');
        	var text = $(this).parents('.document-info').find('a').text();
        	console.log(text+"=-----=="+organizationId);
        	$("#treeMediaDocuments").jstree().deselect_all(true);
        	$("#treeMediaDocuments").jstree("select_node", organizationId);
        	$("#headerName").text(text);
        //	$('div.pageLoader').hide();	
 
        }); 
        
         $("#treeMediaDocuments").bind( "select_node.jstree", function(evt, data){
          	console.log("Selected Tree"+data.node.id);
        	$('div.pageLoader').show();	
			$("#documentContent").html('');		
			$("#mediaContent").html('');
			$("#treeMediaDocuments").jstree("select_node", data.node.id);
			$("#treeMediaDocuments").jstree("open_node", data.node.id);
          	var t = JSON.parse(JSON.stringify(data.node));
          	count = 0;
          	console.log("Node Value"+t);
          	console.log("Test"+JSON.stringify(data.node));
			 var	latestJsonObj = myTreeData;
				console.log("Id :"+t["original"].organizationId);
				var doc = [];
               	var docList = {};
			if(t["original"].organizationId != undefined){
				var childArray = new Array();
						if(t["children"]!=undefined){
							console.log("Children"+t["children"]);
							childArray = t["children"];
							for(i=0;i<childArray.length;i++){	
								var desc = $("#treeMediaDocuments").jstree("get_node", childArray[i]);		
								  	doc.push({ 
                            	        "organizationId" : childArray[i],
                            	        "description" : desc["original"].description,
                             	        "mediaFileType" : 0,
                            	        "text" : $("#"+childArray[i]+"_anchor").text(),
                            	        "mediaId" : t["original"].mediaList,
                            	        "children" : childArray[i],                        	     
                            	    }); 
								
							}
						}
						
						
				count += childArray.length;	
				docList.doc = doc;
				if(docList.doc.length >0){
				$("#documentTemplate").tmpl(docList.doc).appendTo("#documentContent");
				$("#documentSize>label").html('');
                $(count).appendTo("#documentSize>label");
				} else {
					$("#documentTemplate").html('');
					$("#documentContent").html('<h4 class="text-center">'+document.getElementById('hdnmsg').value+'</h4>');
					$("#documentSize>label").html(docList.doc.length);
//	                $(docList.doc.length).appendTo("#documentSize");
				}
                document.getElementById('hdnResultVal').value= count;
                size = document.getElementById('result-per-page').value;
                createpage(size, count);
				
			}
			else if(t["original"].documentId != undefined){
						var mediaArray = new Array();
						var childArray = new Array();
						var mediaFile = [];
                        var mediaFileList = {};
                        count = 0;
						console.log("Document Id :"+t["original"].documentId);
						/**
						 * Method to getMedia for the selected document.
						 * 
						 * Fix to improve the performance of fetching documents.
						 * FS-1680
						 */
						var selectedDocumentId = t["original"].documentId;
						console.log("Media Id :"+t["original"].mediaList);
						/**
						 * Method to getMedia for the selected document.
						 * 
						 * Fix to improve the performance of fetching documents.
						 * FS-1680
						 */
						mediaArray = getMediaForSelectedDocument(selectedDocumentId);
							console.log("Media Id :"+mediaArray.length);
							count += mediaArray.length;
							childArray = t["children"];
							for(m=0;m<mediaArray.length;m++){
								console.log("Media List Id :"+mediaArray[m].id);
								mediaFile.push({ 
//	                             	        "organizationId" : mediaJsonObj[key].id,
	                            	        "mediaFileType" : mediaArray[m].mediaFileType,
	                            	        "description" : mediaArray[m].description,
	                            	        "text" :  mediaArray[m].mediaFileName,
	                            	        "mediaId" :mediaArray[m].id,
//	                             	        "children" : mediaJsonObj[key].children,
//	                             	        "documentId" : mediaJsonObj[key].mediaFileType
	                            	    });
							}     
				   	
				 		var doc = [];
                        var docList = {};
						count += childArray.length;
							for(i=0;i<childArray.length;i++){
								var desc = $("#treeMediaDocuments").jstree("get_node", childArray[i]);
								  	doc.push({ 
                            	        "organizationId" : childArray[i],
                             	        "mediaFileType" : 0,
                            	        "text" : $("#"+childArray[i]+"_anchor").text(),
                            	        "description" : desc["original"].description,
                            	        "mediaId" : t["original"].mediaList,
                            	        "children" : childArray[i],  
										"documentId" : childArray[i]																	
                            	    }); 
								
							}
					 
					mediaFileList.mediaFile = mediaFile;
					docList.doc = doc;
					
					if(docList.doc.length >0 || mediaFileList.mediaFile.length > 0){
						$("#documentTemplate").html('');
						$("#documentTemplate").tmpl(docList.doc).appendTo("#documentContent");
						$("#documentTemplate").tmpl(mediaFileList.mediaFile).appendTo("#documentContent");
						$("#documentSize>label").html('');
		                $(count).appendTo("#documentSize>label");
					} else {
						$("#documentTemplate").html('');
						$("#documentContent").html('<h4 class="text-center">'+document.getElementById('hdnmsg').value+'</h4>');
						$("#documentSize>label").html(docList.doc.length);
//		                $(count).appendTo("#documentSize");
					}
	                document.getElementById('hdnResultVal').value= count;
	                size = document.getElementById('result-per-page').value;
	                createpage(size, count);
			}			
			console.log("Document List :"+docList.doc); 
        	$('div.pageLoader').hide();	
        		
         });
		 $(window).on('scroll',function(e){
	            var $document=$(document);
	            var $window=$(this);

	            if($document.scrollTop() >= $document.height() - $window.height() - 100){
	            	
	            	if( $('#documentContent .document-info:hidden').length ){
	            		$('div.lazyLoader').removeClass('hidden');
	            		
	            		for(var i =0;i<10;i++){
	            			$($('#documentContent .document-info:hidden')[i]).css({'display':'inline-block'});
	            		}
	            		
	            		$('div.lazyLoader').addClass('hidden');
	            	}
	            }
	        });
         
	}//SUPPORT-MIL-188-200116
});



function downloadMedia(docserverUrl,mediaId){
	var userId=  $('#userId').val(); 
	var authToken =  $('#authToken').val(); 
	var downloadURL = docserverUrl+"?media="+mediaId+"&user="+userId+"&token="+authToken;
 	window.location = downloadURL;
}



function createpage(tpage, count)
{
		//how much items per page to show
	var show_per_page = tpage; 
	//getting the amount of elements inside documentContent div
	var number_of_items = count;
	//calculate the number of pages we are going to have
	var number_of_pages = Math.ceil(number_of_items/show_per_page);
	
	//set the value of our hidden input fields
	$('#current_page').val(0);
	$('#show_per_page').val(show_per_page);
	
	//now when we got all we need for the navigation let's make it '
	
	/* 
	what are we going to have in the navigation?
		- link to previous page
		- links to specific pages
		- link to next page
	*/
	var navigation_html = '<li class="paginate_button first disabled"><a href="javascript:go_to_page(0);">First</a></li>';
	navigation_html += '<li class="paginate_button prev disabled"><a href="javascript:previouspage();">Previous</a></li>';
	var current_link = 0;
	while(number_of_pages > current_link){
		navigation_html += '<li class="page_link"><a href="javascript:go_to_page(' + current_link +')" longdesc="' + current_link +'">'+ (current_link + 1) +'</a></li>';
		current_link++;
	}
	navigation_html += '<li class="paginate_button next"><a href="javascript:nextpage();">Next</a></li>';
	navigation_html += '<li class="paginate_button last"><a href="javascript:go_to_page('+(number_of_pages-1)+');">Last</a></li>';
	
	$('#mediaDocPagination .pagination').html(navigation_html);
	
	$('#mediaDocPagination .pagination li.page_link:first').addClass('active');
	
	//add active_page class to the first page link
	//$('#mediaDocPagination .pagination .page_link:first').addClass('active_page');
	
	//hide all the elements inside content div
	$('#documentContent').children().css('display', 'none');
	
	//and show the first n (show_per_page) elements
	$('#documentContent').children().slice(0, show_per_page).css('display', 'inline-block');
	enableNavButtons(tpage, count);
}

function previouspage(){
	
	new_page = parseInt($('#current_page').val()) - 1;
	//if there is an item before the current active link run the function
	if($('.active').prev('.page_link').length==true){
		go_to_page(new_page);
	}
	
}

function nextpage(){
	new_page = parseInt($('#current_page').val()) + 1;
	//if there is an item after the current active link run the function
	if($('.active').next('.page_link').length==true){
		go_to_page(new_page);
	}
	
}
function go_to_page(page_num){
	//get the number of items shown per page
	var show_per_page = parseInt($('#show_per_page').val());
	
	//get the element number where to start the slice from
	start_from = page_num * show_per_page;
	
	//get the element number where to end the slice
	end_on = start_from + show_per_page;
	
	//hide all children elements of content div, get specific items and show them
	$('#documentContent').children().css('display', 'none').slice(start_from, end_on).css('display', 'inline-block');
	
	/*get the page link that has longdesc attribute of the current page and add active_page class to it
	and remove that class from previously active page link*/
	//$('.page_link[longdesc=' + page_num +']').addClass('active_page').siblings('.active_page').removeClass('active_page');
	
	$('.page_link [longdesc=' + page_num +']').parent().addClass('active').siblings('.active').removeClass('active');
	
	//update the current page input field
	$('#current_page').val(page_num);
	enableNavButtons();
}

function enableNavButtons(tpage, count){
	
	var number_of_pages = Math.ceil(parseInt(count)/ parseInt(size));
	if(number_of_pages > 1)
	{
		$('#mediaDocPagination .pagination li.next, #mediaDocPagination .pagination li.last').removeClass('disabled');
	}
	if( $('#current_page').val() > 0 ){
		$('#mediaDocPagination .pagination li.prev, #mediaDocPagination .pagination li.first').removeClass('disabled');
	}
	
	if( $('#current_page').val() == 0 ){
		$('#mediaDocPagination .pagination li.prev, #mediaDocPagination .pagination li.first').addClass('disabled');
		//$('#mediaDocPagination .pagination li.next, #mediaDocPagination .pagination li.last').addClass('disabled');
	}
	
	if( number_of_pages == (parseInt($('#current_page').val()) +1)) {
		$('#mediaDocPagination .pagination li.next, #mediaDocPagination .pagination li.last').addClass('disabled');
	}
	if( parseInt(count) <= parseInt(tpage)) {
	$('#mediaDocPagination .pagination li.next, #mediaDocPagination .pagination li.last').addClass('disabled');
	}
}

function getDropDownVal(noOfItems, totalVal){
	var totalRslt = document.getElementById(totalVal).value;
	createpage(noOfItems, totalRslt);
	
}

/**
 * Method to getMedia for the selected document.
 * 
 * Fix to improve the performance of fetching documents.
 * FS-1680
 */
function getMediaForSelectedDocument(selectedDocumentId){
	var mediaArray = new Array();
	$.ajax({
			type : "Get",
			dataType : 'json',
			url : "getMediaForSelectedDocument?documentId="+selectedDocumentId,
			async:false,
			success : function(response) {
				mediaArray = JSON.parse(JSON.stringify(response));
				/**
				 * INC-2134;Sorting of files in documents;ChangesBy:Subbu;ReviewedBy:JK
				 */
				mediaArray = mediaArray.sort(function(a, b) {
			            return (a['description'] > b['description']) ? 1 : ((a['description'] < b['description']) ? -1 : 0);
			    });
				console.log("media Data::"+JSON.stringify(response));
			},error:function(e) {
				console.log("error")
	   	}
	   	});
	return mediaArray;
}

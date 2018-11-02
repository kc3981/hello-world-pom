/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var userApplication = $('#userApplication').val();
$(document).ready(function(){
	loadBundles();
});
function loadBundles() {
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
document.addEventListener("DOMContentLoaded", function(event) {
  //Dynamically resize main menu
  //resizeMainMenu();

   //on window resize apply responsive changes
  $( window ).resize(function(){
      changeSearchWidth();
  });
  $(".header-links a:contains('Login'), .header-links a:contains('German'), .header-links a:contains('English')").css({"position":"relative","z-index":"11"});
  $(".header-links a:contains('Login') i, .header-links a:contains('Register') i ").css({"position":"relative","right":"3px","bottom": "1px"});
  $(".header-links a:contains('English') i, .header-links a:contains('German') i").css({"position":"relative","left":"3px","bottom": "1px"});
   $(".header-links .user-popup1 a:contains('German'), .header-links .user-popup1 a:contains('English'),.header-links .user-nonloggedin a:contains('German'), .header-links .user-nonloggedin  a:contains('English')").css({"position":"relative","right":"0"});

  $('.footer-menu-list > li:last-child > a, .quick-links-list >li:last-child > a').css({'border-right':'none'});
  
//var text = $("button.searchall-dpdown span.search-options-label").text();
  var inputPlace =  $("span.search-panel > ul#dropdown > li").parents(".search-panel").siblings("#keyword");
   
 var keywordsearch ;
 $(function (){
 	
 	//var text = $("button.searchall-dpdown span.search-options-label").text();
 	
 	var text = $("#typedropdown").val();
 	handleSearchTooltip(text);
 });
   
   $("span.search-panel > ul#dropdown > li").click(function(){
 	  
 	 // var text = $("button.searchall-dpdown span.search-options-label").text();
 	  var text = $(this).attr('data-value');
 	  handleSearchTooltip(text);
   });
   
   function handleSearchTooltip(text){
 	  if(text == "partNumber") {
 			inputPlace.attr("placeholder",strings['label.search.part']);
 		     //inputPlace.attr("placeholder","Search for a PartNumber");
 		    }
 		  else if(text == "partDescription"){
 			   inputPlace.attr("placeholder",strings['label.search.partdescription']);
 		      //inputPlace.attr("placeholder","Search for a Part Description");
 		    }
 		    else if(text=="category"){
 		       inputPlace.attr("placeholder",strings['label.search.productcateg']);
 		    }
 		    else if(text == "Vehicles" || text == "vehicles" || text == "catalog"){
 		     inputPlace.attr("placeholder", strings['label.search.vehicle']);
 		    }
 		    else if(text == "all"){
 		    	inputPlace.attr("placeholder",strings['label.search.all']);
 		    }
 		   else{
 			   if($("#viewMachineCatalog").val() == "true" && $("#viewProdCatalog").val() == "true"){
				   inputPlace.attr("placeholder",strings['label.search.all']);
			   }else if ($("#viewMachineCatalog").val() == "true"){
				   inputPlace.attr("placeholder",strings['label.search.viewmachine']);
			   }else if ($("#viewProdCatalog").val() == "true"){
				   inputPlace.attr("placeholder",strings['label.search.viewprodcat']);
			   }else{
				   inputPlace.attr("placeholder",strings['label.search.partnumdes']);
			   }
 			   
 		    }
   }
  $(document).delegate('input.get-input-price','keypress', function(e){
      if (e.which != 8 && e.which != 0 && e.which != 44 && e.which != 46 && (e.which < 48 || e.which > 57)) {
         //display error message
                return false;
     }
    var text = $(this).val();
    var cSymbol = $(this).parent("div").text();
    /*alert(cSymbol);*/
    if(cSymbol.indexOf("EUR") != -1){
       if ((text.indexOf(',') != -1) && (text.substring(text.indexOf(',')).length > 2) && e.which != 8 ) {
         e.preventDefault();
       } 
     }else{
     if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2) && e.which != 8 ) {
         e.preventDefault();
     } 
     }
  });
  $('.cart-popup-4grid .total-items').on('keypress',function(e){
	   var maxThree = /^\d{3}$/;
	   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	       return false;
	   }
	   if(maxThree.test($(this).val())){
	     e.preventDefault();
	   }
  });
  $('#keyword1').attr('title', strings['label.cart.search.for.parts']);
	  if($('#keyword').val()==""){
	  $(".input-group-btn").siblings("#keyword").val("");
	  }
  $('.sidebar-button').on('click',function(e){
    $('.sidebar-content').css({'visibility':'visible'})
    $('.sidebar').addClass('animate-sidebar');
    e.stopPropagation();
  });

  $('.sidebar-content').on('click',function(){
    $('.sidebar').removeClass('animate-sidebar');
    $(this).css({'visibility':'hidden'});
  });

  
  $('.sidebar').on('click',function(e){
    e.stopPropagation();
  });
  /* Bootstrap Tooltip init() */
  $('[data-toggle="tooltip"]').tooltip();

  $('.content-wrapper').on('click', '.item-increment', function() {
    $(this).parents('.spinner-control').children('.total-items').val(function(i, val) { 
    	var incFactor = (isNaN($(this).parents('.spinner-control').data("ordermultiplekey")) ?  1 : $(this).parents('.spinner-control').data("ordermultiplekey") ) * 1;
    	 
    	return parseFloat((parseFloat(val) + (incFactor)).toFixed(2))
    });
    var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	if(parseInt(itemVal)>=999){
    $(this).parents('.spinner-control').children('.total-items').val("999");
    return false;
  }
  });

  $('.item-increment').on('click',function(){
		
	});
  
  $('.content-wrapper').on('click', '.item-decrement', function() {
    /*var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
    if(itemVal>1){
      $(this).parents('.spinner-control').children('.total-items').val(function(i, val) { return val*1-1 });
    }else{
      //Please select quantity to add to cart
    }*/
	var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	var incFactor = (isNaN($(this).parents('.spinner-control').data("ordermultiplekey")) ?  1 : $(this).parents('.spinner-control').data("ordermultiplekey") ) * 1;
	
	if(itemVal>incFactor){
      $(this).parents('.spinner-control').children('.total-items').val(
		  function(i, val) {
			  
			  return parseFloat((parseFloat(val) - (incFactor)).toFixed(2))
			  //return val*1-1
		  }
      );
    }else{
      //Please select quantity to add to cart
    }
  });

 
  
  $(document).delegate('.total-items.output','change',function() {
		var itemCount = parseFloat($(this).val());
		var partId = $(this).attr('id');
		var incFactor = (isNaN($(this).parents('.spinner-control').data("ordermultiplekey")) ?  1.0 : $(this).parents('.spinner-control').data("ordermultiplekey") ) * 1.0;
		
		//itemCount = (itemCount >= 999.99) ? 999.99 : itemCount;
		var newVal = 0.0;
		if(itemCount >= 999.99){
			newVal = (999.99 - parseFloat((999.99 % incFactor).toFixed(2)));
		}
		else if( parseFloat((itemCount % incFactor).toFixed(2)) == 0)
		{
			newVal = itemCount;
		}
		else if (parseFloat((itemCount % incFactor).toFixed(2)) > 0.0){
			newVal = parseFloat(((itemCount - (itemCount % incFactor)) + incFactor ).toFixed(2)) ;
		}
		
		if(isNaN(itemCount) || itemCount == 0.0 ){
			newVal = incFactor;
		}
		
		newVal = (newVal >999.99) ? newVal - incFactor : newVal;
		
		if(newVal == 0.0 && incFactor!=null && incFactor != 0.0 && itemCount !=0.0 ){
			
			newVal = parseFloat((itemCount*incFactor).toFixed(2));
		}
		
		$(this).val(newVal);
		
		/*if (!/^\d{0,6}(?:\.\d{0,2})?$/.test(itemCount)) {
		
		}
		
		console.log();*/
		/*if(!(/^ *[0-9]+ *$/.test(itemCount))){
			var msg = "<spring:message code='alert.shopforparts.valid.specialchar' javaScriptEscape='true'/>";
			$('.modal-body').text(msg)
			  $("#myModal").show();
			$('.total-items.output').val(incFactor);
			//editQuantity(1,partId);
		}*/
  });
  $(document).keyup(function(e) {	 
	  if (e.keyCode === 27) $('.close').click();   // esc
  }); 
 
  $('.close').on('click',function(){
	  $('.modal').hide();
  });
  $(document).delegate('.total-items.output','keypress',function(e){
      //var maxThree = /^\d{0,5}(?:\.\d{0,1})?$/;  // /^[0-9]*\.[0-9]{2}$/;   ///^\d{5}$/; // /^[1-9]\d*(\.\d+)?$/; //
      //var valTxt = $('.total-items.output').val();
      
      var maxThree = /^\d{0,3}(?:\.\d{0,2})?$/;
      if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
          return false;
      }
     	
      if((e.which == 46) &&  ($(this).val().indexOf(".") > -1) ){
      	return false;
      }
     	
      if(! maxThree.test($(this).val())){
        e.preventDefault();
      }
  });
  
  /*$(document).on('change','.total-items.output',function (prev) {
	  console.log(prev);
	  
	  return function (evt) {
	        if (!/^\d{0,6}(?:\.\d{0,2})?$/.test(this.value)) {
	          this.value = prev;
	        }
	        else {
	          prev = this.value;
	        }
	    };
	    
  });
  */
  /* shopping cart item decrement */
  $('.content-wrapper').on('click', '.item-decrement-shopping-cart', function() {
	    var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
	    if(itemVal>0){
	      $(this).parents('.spinner-control').children('.total-items').val(function(i, val) { return val*1-1 });
	    }else{
	      //Please select quantity to add to cart
	    }
	 });

  /* logged in user click opens user popup*/
  $(document).on('click',function(e){
    if(! $('div.user-popup').hasClass('hidden')){
      $('div.user-popup').toggleClass('hidden');
    }

    if(! $('div.user-popup1').hasClass('hidden')){
      $('div.user-popup1').toggleClass('hidden');
    }

    if(!$('#keyword').is(':focus')){
      if($('#keyword').next().hasClass('tooltip')){
          $('#keyword').tooltip('hide');
      }
    }
    if(!$('#keyword1').is(':focus')){
      if($('#keyword1').next().hasClass('tooltip')){
          $('#keyword1').tooltip('hide');
      }
    }
    /*if($('.sidebar').is(':visible')){
      $('.sidebar').hide();
    }*/
  });

  $('#loggedin-user').on('click',function(e){
      $('div.user-popup').toggleClass('hidden');
      $("div.user-popup1").addClass("hidden");
     /* $('div.user-popup1').hide();*/
      return false;
  })
  $('#loggedin-user1').on('click',function(e){
      $('div.user-popup1').toggleClass('hidden');
      $("div.user-popup").addClass("hidden");
      /*$('div.user-popup').hide();*/
      return false;
  })
  
  $('#loggedin-user2').on('click',function(e){
      $('div.user-popup').toggleClass('hidden');
      $("div.user-popup1").addClass("hidden");
     /* $('div.user-popup1').hide();*/
      return false;
  })

  $("#btn-cart-handler").on('click',function(e){
    window.location.href="getshoppingdetails";
  });

  //IF TREE EXIST in a page.
  if($('.treeview-hldr')[0]){
    //Dummy Data
    /* Catalog Tree */

    if($('#treeCatalog.treeview-hldr')[0]){
      var treeCatalogRef = $('#treeCatalog.treeview-hldr').jstree(
          { 'core' : {
                'data' : myTreeData
              },
           'types' :{
                  "file" : {
                      "icon" : "file-glass",
                      "valid_children" : []
                  },
                  "leafobj" : {
                      "icon" : "leaf-obj",
                      "valid_children" : []
                  }
              },
              "plugins": ["search", "wholerow", "types"]
          }
      );
    }

  }

  //Search component
 /* $.getJSON( "js/tempsearch.json", function( tempdata ) {
    $(".keyword").autocomplete({
      delay: 0,
      source: tempdata,
      focus: function( event, ui ) {
        $( ".keyword" ).val( ui.item.label );
        return false;
      },select: function( event, ui ) {
        console.log(ui.item.label);
        $(".keyword").val( ui.item.label );
        //$(".keyword").val( ui.item.value );
        return false;
      }
    });


  });*/
  $('#agree-terms').on('click',function(e){
      if($('.multiselect-list').next('span').hasClass('check-pending') || $('.multiselect-list').next('span').hasClass('check-fail') && $(this).is(':checked')){
        $(this).prop('checked',false);
        $('.multiselect-list').addClass('input-invalid').next('span').removeClass('check-pending').addClass('check-fail');
      }
  });

  $('#searchclear').on('click',function(e){
	    var searchField=$(this).next('input');
	    if(searchField.val() !== ""){
	       searchField.val("");
	       $('#keyword').val("");
	       $(this).addClass('hidden');
	    }
      if($('#Search-result-page').length){
        document.forms[0].action = "searchrequest";
        document.forms[0].submit();
      }
	  });
  
	  $('a.clear-search').on('click',function(e){
		    var searchField=$(this).next('input');
		    if(searchField.val() !== ""){
		       searchField.val("");
           $("#quickSearchDiv").hide();
		       $(this).addClass('hidden');
		    }
		  });
		  

  $("#keyword").autocomplete({
		source : function(request, response) {
			$.ajax({
				type : "post",
				url : "autocomplete?typedropdown="+$("#typedropdown").val()+"&keyword="+escape(request.term.toLowerCase())+"&viewEngDesc="+$("#viewEngDesc").val()+"&viewVendorPart="+$("#viewVendorPart").val()+"&viewProdCatalog="+$("#viewProdCatalog").val()+"&viewMachineCatalog="+$("#viewMachineCatalog").val(),
				//url : "autocomplete?typedropdown="+$("#typedropdown").val()+"&"+escString,
				//alert("url="+url);
				//data : request.term.toLowerCase(),
				dataType : "json",
				contentType : 'application/json;charset=UTF-8',
				//mimeType : 'application/json;charset=UTF-8',
				success : function(data) {
					response($.map(data, function(item) {
						return {
							value : item.lable,
							data : item.value
						};
					}));
				}
			});
		},
		open:function(event) {
			 $('.ui-autocomplete > li:first-child a').addClass('ui-state-focus first_open');
	        $('.ui-autocomplete').css({'height':'auto'});
	        var $input = $(event.target),
	            inputTop = $input.offset().top,
	            inputHeight = $input.height(),
	            autocompleteHeight = $('.ui-autocomplete').height(),
	            windowHeight = $(window).height();
              windowWidth = $(window).width();
          if(windowWidth >= 768 && windowWidth <992){
            $('.ui-autocomplete').css("width", 330+'px');
          }
	        
	        if ((inputHeight + inputTop+ autocompleteHeight) > 430) {
	            $('.ui-autocomplete').css({"height": 430+'px', "position": "fixed"});
	        }
	    },
	    
	    //START Bring From MILACRON_CODE_BASE autoFocus : true, commonted from Mialcron and focus function bring in
		//autoFocus : true,
	    focus: function( event, ui ) {            
            if(ui.item.value != $('.ui-state-focus').text()){
                $('.first_open').removeClass('ui-state-focus first_open');
            }},
	    //END Bring From MILACRON_CODE_BASE autoFocus : true, commonted from Mialcron and focus function bring in
		change :  function(event, ui) {
			$('#fuzzy').val(ui.item ? ui.item.data : "");
		},
		select : function(event, ui) {
			$('#keyword').val(ui.item.label);
      $(this).prev('a.clear-search').removeClass('hidden');
			$('#fuzzy').val(ui.item.data);
			 var value = $.trim($("#keyword").val());
			if(value.length>0){
				 $('#searchsubmit').click();
			 }else if(value.length==0) {
				 $('#keyword').tooltip({'trigger':'manual', 'title': 'Please enter the search criteria','placement':'bottom'}).tooltip('show');
				 return false;
			 }
			 else{
				return true;
			 }
		},
		minLength : 2 
}).autocomplete( "widget" ).addClass('globalsearch');

  $(".searchbar .input-group .keyword").focusin(function(){
     $(this).parent().addClass("border-search");
  });
  $(".searchbar .input-group .keyword").focusout(function(){
     $(this).parent().removeClass("border-search");
  });

  /* Modal window handling for Signin and Register screens */
  $('a.overlay-close-button').on('click',function(e){
    var modalWindowId= $(this).parents('.modal').attr('id');
    $("#"+modalWindowId).modal('hide');
    return false;
  });

  $('.forgot-password-link > a , .register-link > a , a.back-link , a.continue-link').on('click',function(e){
    var currentModalWindowId= $(this).closest('.modal').attr('id');
    var modalWindowID = $(this).attr('href');
    $("#"+currentModalWindowId).modal('hide');
    $(modalWindowID).modal('show');
    $('.modal-footer a:first-child').focus();
    return false;
  });
/*
  $('#register-submit').on('click',function(e){
    var currentModalWindowId= $(this).closest('.modal').attr('id');
    e.preventDefault();
    $("#"+currentModalWindowId).modal('hide');
    $('#registered-modal').modal('show');
    return false;
  });*/
  
  
  //dropdown select event 
  $('span.search-panel > ul#dropdown > li > a').on('click',function(){
	  //$(this).siblings('button.searchall-dpdown > span.search-options-label').text($(this).text());
	  	$('button.searchall-dpdown > span.search-options-label').text($(this).text());
		$("#typedropdown").val($(this).data("value"));
  });
  
  /*********** Search Button click ****************/

  $('#searchsubmit').on('click',function(e){
	  var value = $.trim($("#keyword").val());
		  if (value.length > 0) {
			var fuz = $('#fuzzy').val();
			/*var  theForms = document.getElementsByTagName("form");  
		    for(i=0;i<theForms.length;i++)  
		    	alert("i" + i + "::"+theForms[i].name);  */
			//START Bring From MILACRON_CODE_BASE
			var formPos = 2;
			var url = window.location.href;
			/*if(url.indexOf("createorderfromquoteconfirm")>=0){
				formPos = 1;
			}*/
			//formPos for createorderfromquoteconfirm is zero by default. Added by Pooja.H.S
			//if(url.indexOf("createorderconfirm")>=0 || url.indexOf("confirmfocuspaytxn")>=0 || url.indexOf("createorderfromquoteconfirm")>=0){
			if(url.indexOf("createorderconfirm")>=0 || url.indexOf("confirmfocuspaytxn")>=0){
				document.forms[formPos].action = "searchrequest";
			document.forms[formPos].submit();
			}else{
				document.forms[0].action = "searchrequest";
				document.forms[0].submit();
			}
			return false;
			//END Bring From MILACRON_CODE_BASE	
		} 
		 else if (value.length == 0) {
			$('#keyword').tooltip({'trigger':'manual', 'title': strings['label.search.empty'],'placement':'bottom'}).tooltip('show');
			return false;
		}
  });
  /* Enter keydown event for search */
  $(document).on("keydown", function (e) {
    if (e.which === 8 && !$(e.target).is("input, textarea")) {
        e.preventDefault();
    }
  });
  /* Enter keypress event for search */
  $(document).on('keypress',function(e){
		 if(e.which === 13){

       if($('#keyword').is(':focus')){
          var mainSearch = $('#keyword').val();
          var value = $.trim($("#keyword").val());
          if(mainSearch !== "" && (value.length > 0)){
            $('#searchsubmit').click();
            return false;
          }else{
            $('#keyword').tooltip({'trigger':'manual', 'title': strings['label.search.empty'],'placement':'bottom'}).tooltip('show');
            return false;
          }
       }else if($('#keyword1').is(':focus')){
          var quickSearch = $('#keyword1').val();
          if(quickSearch !== ""){
           // $('#searchsubmit').click();
        	  e.preventDefault();
          }else{
            $('#keyword1').tooltip({'trigger':'manual', 'title': strings['label.search.empty'],'placement':'bottom'}).tooltip('show');
            return false;
          }
       }else{
    	   //commenting the code in Else To fix registration pg, as its preventing enter in text area, 
     	  //e.preventDefault();
         //e.stopPropagation();
//          return false;
       }
     //commenting the code in Else To fix registration pg, as its preventing enter in text area, 
      // e.preventDefault();
		 }
	 });

  /*On keypress hide tooltip */
  $('#keyword,#keyword1').on('keypress',function(e){
	 
	if($(this).val()== ""){
      $(".clear-search").addClass("hidden");
    }
    if(e.which !== 13){
      if($(this).is('#keyword')){
        $('#keyword').tooltip('hide');
      }else{
        $('#keyword1').tooltip('hide');
      }
    }
   
  });
  
  /***** Page Loader *****/
  $('a.page-load-link').on('click',function(e){
    $('div.pageLoader').toggleClass('hidden');
    return false;
  });

});


var myTreeData = [
    {
        "id" : "capacity",
        "text" : "Capacity Parts",
         "children" : [
            {
                "id" : "1",
                "text" : "Tank",
                "type" : "file"
            },{
                "id" : "2",
                "text" : "Valve"
            },{
                "id" : "3",
                "text" : "Chamber"
            },{
                "id" : "4",
                "text" : "Tube"
            }
         ]
    },
    {
        "id" : "eone",
        "text" : "E-One Parts",
        "state" : {
                   "opened" : false,
                   "selected" : false
                 },
        "children" : [
            {
                "id" : "5",
                "text" : "Bracket",
            },
            {
                "id" : "6",
                "text" : "Washer",
                "state" : {
                       "opened" : false,
                       "selected" : false
                     },
                "children" : [
                    {
                        "id" : "7",
                        "text" : "Washer Flat",
                        "type" : "file"
                    },{
                        "id" : "8",
                        "text" : "Washer Hardended",
                        "type" : "leafobj"
                    },{
                        "id" : "9",
                        "text" : "Washer Snubbing",
                        "type" : "leafobj"
                    }
                ]

            },{
                "id" : "10",
                "text" : "Nut"
            }
        ]
    }
];
var initilizeTreeCtrl = function(){ 
  var treeRef = $('#treeShopforParts.treeview-hldr').jstree(
    { 'core' : {
        "themes" : {
            "variant" : "large",
            "icons"  :false,
            "dots" : false 
        },
          'data' : {
			  'url':function(node){
				  //var id = node.id;
				  return 'getTopLevel';
			  },
			  'dataType' : 'json',
			  'data':function(node){
					  return { "productCatalogId" : node.id, "productCategoryId" : node.parent };
			  },
			  "success": function(data,node){
				  var productCatalogs = [];
				  var productCatalogList = {};

				  for(var i=0;i<data.length;i++){
					  productCatalogs.push({
							"mediaId" : data[i].mediaId,
							"languageId" : data[i].languageId,
							"descrption" : data[i].descrption,
							"text" : data[i].text,
							"children" : data[i]['children'],
							"hasParts" : "false",
							"pcatalogId" : data[i].productCatalogId,
							"parent" : data[i].parent,
							//INC-2498 fix starts(Developed by : Swetha)
							"isActualImage" : data[i].isActualImage,
							//INC-2498 fix ends
							"id" : data[i].id
						});
					  
				  }
				  
				  productCatalogList.productCatalogs = productCatalogs;
				  console.log(productCatalogList);
					
						$("#product-catalog-hldr").html('');
						$("#productCatalogTemplate").tmpl(
								productCatalogList.productCatalogs).appendTo(
								"#product-catalog-hldr"); 
						$("#treeShopforParts.treeview-hldr").jstree(true).select_node(node.id); 
						//START Bring From MILACRON_CODE_BASE
						$('#page-selection,#page-selection-top').hide();
			 			$('#partsPerPageDivFooter,#partsPerPageDivHeader').hide();
			 			$("#filterThumbnailImage").hide();
						//END Bring From MILACRON_CODE_BASE
			  }
		  },
		 
     'types' :{
            "file" : {
                "icon" : "file-glass",
                "valid_children" : []
            },
            "leafobj" : {
                "icon" : "leaf-obj",
                "valid_children" : []
            }
        },
        "plugins": ["search", "wholerow", "types"]
    	}
    }
  ).bind("loaded.jstree", function () {
	 
	  var productCategoryMappingId = $('#productCategoryMappingId').val();
	  console.log("productCategoryMappingId=="+productCategoryMappingId);
	  if(productCategoryMappingId != ""){
		  $(treeRef).trigger("after_open.jstree");
	  }

	  
  });
  $(treeRef).on('after_open.jstree',function(e,data){
	  // Use it only for Breadcrumb 
	  var productCategoryMappingId = $('#productCategoryMappingId').val();
	  if(productCategoryMappingId != ""){
		  var productCatalogId = productCategoryMappingId ;
		  var productCategoryId = productCategoryMappingId.substring(0,productCategoryMappingId.indexOf("_"));
		  if(!$('.pageLoader').is(':visible')){
			  $('.pageLoader').show();
		  }
		  $.ajax({
				type : "get",
				url : "getBreadcrumbs",
				data : { "productCatalogId" : productCatalogId, "productCategoryId" : productCategoryId },
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {
					var array =[];
					
					if(data != ""){
						array = data.toString().split(",");
					}
					
					console.log(array);
	                for(i=0;i<array.length;i++){
	                 console.log(array[i]);
		                 var tree = $('#treeShopforParts.treeview-hldr').on('loaded.jstree');
		     			if(tree!=null){
		     				if($('#treeShopforParts.treeview-hldr').jstree(true).is_loaded(array[i])){
		     					$("#treeShopforParts").jstree('select_node',array[i]);
		     					$("#treeShopforParts").jstree('open_node',array[i]);
		     				}else{
		     					//$("#treeShopforParts").jstree('open_node',array[i]);
		     					$("#treeShopforParts").jstree('after_open',function(e){
		     						$("#treeShopforParts").jstree('select_node',array[i]);
		     					});
		     					$("#treeShopforParts").jstree('select_node',array[i]);
		     				}
		     			}
		     			
	                }
	                if(array.length<=0){
	                	$('.pageLoader').hide();
	                	$('#myModal .custom-modal-body').text('No results found.');
	                	$('#myModal').show();
	                	$('.modal-footer a:first-child').focus();
	                	$('#productCategoryMappingId').val('');
	                	
	              	  	var issearch = false;
	                		issearch = $('#issearch').val();
	                		if(issearch){
	                			$(".breadcrumb > li:last-child()").before('<li><a id="breadcrumbsearch"  onclick="breadCrumb()" href="#">Search</a></li>');
	                		}
	                }
	     			
	                if($('#treeShopforParts.treeview-hldr').jstree(true).is_loaded(productCatalogId)){
	                	$('.pageLoader').hide();
	              	  $('#treeShopforParts.treeview-hldr').jstree(true).deselect_all();
	            	  $('#treeShopforParts.treeview-hldr').jstree(true).select_node(productCategoryMappingId);
	                  $('#productCategoryMappingId').val('');
	                  
	                }
				}
			});
	  }
  });
  var oldId = "";
  $(treeRef).on('select_node.jstree', function (e, data) {
	  $("body,html").animate({ scrollTop: 0 }, 1000);//INC-2460 Added by Vinay Reviewed by Dibu
	  var textLabel =  $(".breadcrumb > li:nth-child(2)").text(); // 28-12-2015 Get Shop For Parts Text localized
	  $(".breadcrumb > li:first-child").nextAll().remove();
	  $("#headerName").text(data.node.text);
	  var issearch = false;
	  issearch = $('#issearch').val();
	  if(issearch){
		  $(".breadcrumb > li:nth-child(1)").after('<li><a id="breadcrumbsearch"  onclick="breadCrumb()" href="#">Search</a></li>');
	  }else{
		  $(".breadcrumb > li:nth-child(1)").after('<li><a href="shopforparts">'+textLabel+'</li>');
	  }
	  //Get Node for First Time
//	  $("#treeShopforParts.treeview-hldr").jstree(true).deselect_all(); 
	  $("#treeShopforParts.treeview-hldr").jstree(true).open_node(data.node.id);  
 	
 	//Get Parts for Categories
 	if($('#treeShopforParts.treeview-hldr').jstree(true).is_leaf(data.node.id)){
 		$("body,html").animate({ scrollTop: 0 }, "fast");
 		partsPerPage=10;
 		pageNumber=1;
		counter = 1;
 		var pCat = data.node.id.split("_");
 		mainArr= {};
 		jsonArr = [];
 	 	mainArr["inputString"]= jsonArr;
 	 	mainArr["searchBy"]="";
 	 	mainArr["searchString"]="";
 	 	mainArr["isSuccess"]="";
 	 	mainArr["isFilterRequired"]=true;
 	 	mainArr["isFromSearch"]=true;
 	 	mainArr = JSON.stringify(mainArr);
  		getItemsForCategory(pCat[1], pCat[0],pageNumber,mainArr);
		pageNumber++;
		//INC - 1806 : Scroll down of item in a category stops working after coming back from full item details page/searching a category from global search in Milacron
        //Reviewed by Hari
		if(oldId == ""){
	 		oldId = data.node.id;
	 	}else 	if(oldId == data.node.id){
 			counter--;
 		}
		//INC - 1806 : Scroll down of item in a category stops working after coming back from full item details page/searching a category from global search in Milacron
        //Reviewed by Hari
 	}else{
 		$("body,html").animate({ scrollTop: 0 }, "fast");
 		var nodeData = $("#treeShopforParts.treeview-hldr").jstree(true).get_node(data.node.id);
 		console.log("Click Category Json Values :"+JSON.stringify(nodeData));
 		$(".block").html('');
 		var productCatalogs = [];
		var productCatalogList = {};
 		for(i=0;i<nodeData.children.length;i++){
 			var t = $("#treeShopforParts").jstree("get_node", nodeData.children[i]);
			productCatalogs.push({
				"productCatalogId" : nodeData.children[i],
				"mediaId" : t['original'].mediaId,
				"languageId" : t['original'].languageId,
				"descrption" : t['original'].descrption,
				"text" : t['original'].text,
				"children" : t['original'].children,
				"hasParts" : "false",
				"pcatalogId" : t['original'].productCatalogId,
				"catalogDocumentLink" : t['original'].catalogDocumentLink,
				"msdsLink" : t['original'].msdsLink,
				"parent" : t['original'].parent,
				"id" : t['original'].id
				});
 			}
 		productCatalogList.productCatalogs = productCatalogs;
		//console.log(productCatalogList);
 			$('#page-selection,#page-selection-top').hide();
 			$('#partsPerPageDivFooter,#partsPerPageDivHeader').hide();
			$("#product-catalog-hldr").html('');
			$("#productCatalogTemplate").tmpl(
					productCatalogList.productCatalogs).appendTo(
					"#product-catalog-hldr");
			$("#resultInfo").hide();
			$("#pagination").hide();
			$("#filterThumbnailImage").hide();
 		} 
 	
		/*var i, j, r = [];
	    for(i = 0, j = data.selected.length; i < j; i++) {
	      r.push(data.instance.get_node(data.selected[i]).id);
	    }*/
	    /*Category Header 
	    $("#resultInfo").show();
	    $("#headerName").text(data.node.text);
	    $("#sort-by").parent().hide();
		*/
		// Construct BreadCrumb 
		var node = $("#treeShopforParts").jstree("get_node", data.node.id);
		//Enable Catalog page link 
		if(typeof node.original.catalogDocumentLink=="undefined" || node.original.catalogDocumentLink==""){
			 
			$("#catalog-link").hide();
		}else{
			$("#catalog-page").show(); 
			$("#catalog-link").show();
		 	$("#catalog-link").attr("href",node.original.catalogDocumentLink);
		}
		//Enable Catalog page link 
		if(typeof node.original.msdsLink=="undefined" || node.original.msdsLink==""){
			 
			$("#msds-page").hide();
		}else{
			console.log("MSDS "+node.original.msdsLink);
			$("#catalog-page").show(); 
			$("#msds-page").show(); 
		 	$("#msds-page").attr("href",node.original.msdsLink);
		}
		//Enable Installation Information -- Support 
		if(typeof node.original.installationInformation=="undefined" || node.original.installationInformation==""){
			$("#installation-info").hide();
		}else{
			console.log("Installation Information "+node.original.installationInformation);
			$("#catalog-page").show();
			$("#installation-info").show(); 
		 	$("#installation-info").attr("href",node.original.installationInformation);
		}
		
		// Dynamic Values
		 		if(node.parents == "#" && node.parents.length == 1){
		 			$(".breadcrumb > li:last-child").after('<li class="active" id='+data.node.id+'>'+data.node.text+'</li>');
		 		}else{
		 			 console.log("Breadcrumb---"+node.parents.length);
			 		for(var b=node.parents.length-1;b>=0;b--){
			 			console.log("ID :---"+b+"--------"+node.parents[b]);
			 			 
			 			var t1 = $("#treeShopforParts").jstree("get_node", node.parents[b]);
			 			console.log("Parent Hierarchy"+b+"--------"+t1["text"]+"-----"+t1["id"]);
			 			if(typeof t1["text"]!="undefined"){
			 				var prodId = t1["id"].toString();
			 				$(".breadcrumb > li:last-child").after('<li><a href="#" onclick="jstreeBreadCrumb(\''+prodId+'\')">'+t1["text"]+'</a></li>');
			 			}
			 			//console.log("Test Value"+JSON.stringify(t));
			 		}	
			 		$(".breadcrumb > li:last-child").after('<li class="active">'+data.node.text+'</li>')
			 		
		 		}
		var data_node = true; 		
		///  $("#treeShopforParts.treeview-hldr").jstree(true).close_all();
		 // $(".pageLoader").hide();
		//START Bring From MILACRON_CODE_BASE
		//var capturePreviousPath = window.location.pathname;
		//var previousURL = capturePreviousPath.split("/"); 
		//alert(previousURL[3]);
		//if(previousURL[3] == "shopforparts"){
		if(bookMark){
				History.pushState({state: data.node.id},strings['global.page.title'],"./shopforparts?breadCrumFullItem="+data.node.id);
		}
		//END Bring From MILACRON_CODE_BASE
		//}  
		
  });
  
/*  $(treeRef).on('loaded.jstree', function (e, data) {
	  var searchflag = true;
	  if(searchflag){
			//		$("#treeShopforParts").jstree('select_node','${productCatalogId}');
				var array = ['3','3_3163','3_3199'];
				for(i=0;i<array.length;i++){
					var tree = $('#treeShopforParts.treeview-hldr').on('loaded.jstree');
					if(tree!=null){
						if($('#treeShopforParts.treeview-hldr').jstree(true).is_loaded(array[i])){
							$("#treeShopforParts").jstree('select_node',array[i]);
							$("#treeShopforParts").jstree('open_node',array[i]);
						}else{
							$("#treeShopforParts").jstree('open_node',array[i]);
							$("#treeShopforParts").jstree('select_node',array[i]);
						}
						
						
					}
				}
	  }
  });*/
  
  return(treeRef);
};


var loadCatalog = function(catalogName){
  var request= $.ajax({
    url: (catalogName + "-catalog.html"),
    cache: false
  })
  .done(function( html ) {
    $('#catalog-content-hldr').html( html );
    var treeinstance = $('#treeShopforParts.treeview-hldr').jstree(true);
    treeinstance.select_node('capacity');
    treeinstance.open_node('capacity');
  });
  request.fail(function( jqXHR, textStatus ) {
    //alert( "Request failed: " + textStatus );
  });
}


function breadCrumb(){
	document.forms[0].action="searchrequest";
	document.forms[0].submit();
};

jQuery(function($) {
	  // CLEARABLE INPUT
	  function tog(v){return v?'addClass':'removeClass';} 
	  $(document).on('input', '.clearable', function(){
	    $(this)[tog(this.value)]('x');
	  }).on('mousemove', '.x', function( e ){
	    $(this)[tog(this.offsetWidth-18 < e.clientX-this.getBoundingClientRect().left)]('onX');   
	  }).on('click', '.onX', function(){
	    $(this).removeClass('x onX').val('').change();
	  }); 
	});


/*$('#phone_register,#phone-forgotpassword').keydown(function (e) {
    var key = e.charCode || e.keyCode || 0;
    $phone = $(this);
    //var onlyNumber = $(this).data('number');
    // Auto-format- do not expose the mask as the user begins to type
    if (key !== 8 && key !== 9) {
        if ($phone.val().length === 4) {
            $phone.val($phone.val() + ')');
        }
        if ($phone.val().length === 5) {
            $phone.val($phone.val() + ' ');
        }           
        if ($phone.val().length === 9) {
            $phone.val($phone.val() + '-');
        }
    }

    // Allow numeric (and tab, backspace, delete) keys only
    return (key == 8 || 
            key == 9 ||
            key == 46 ||
            (key >= 48 && key <= 57) ||
            (key >= 96 && key <= 105)); 
    }).bind('focus click', function () {
        $phone = $(this);
        
        if ($phone.val().length === 0) {
            $phone.val('(');
        }
        else {
            var val = $phone.val();
            $phone.val('').val(val); // Ensure cursor remains at the end
        }
    })
    .blur(function () {
        $phone = $(this);
        $(this).data('number',$(this).val().replace('(','').replace(')','').replace('-','').replace(' ',''));
        //alert($(this).data('number'));
        if ($phone.val() === '(') {
            $phone.val('');
        }   
});*/

function changeSearchWidth(){
   var $keyword = $("#keyword");
   if($keyword && $keyword.length>0){
	  var searchBoxWidth = $keyword.outerWidth();
	  var leftOffset = $keyword.offset().left;
	  $('#ui-id-1').css({'width':searchBoxWidth,'left':leftOffset});
  }
}

function resizeMainMenu(){
  var menu_size = $('#main-menu-list li:not(:hidden :visible)').length;;
  switch(menu_size){
    case 4 :$('.main-menu nav ul li a').css({'padding':'6px 55px 0px'});
            break;
    case 3 :$('.main-menu nav ul li a').css({'padding':'6px 100px 0px'});
            break;
    case 2 :$('.main-menu nav ul li a').css({'padding':'6px 155px 0px'});
            break;
    default : break;
  }
}

function formatString(message,arguments){
	  var args = arguments;
	   return message.replace(/\{(\d+)\}/g, function() {
	        return args[arguments[1]];
	 });
}

/* Coupon Code Implementation */
$(function(){
	$(".delete-ok").click(function(){
		$('#confirmationWindow,#PromoRequiredConfirmation').hide();
	 });
	 $(".cancel").click(function(){
	       $('#confirmationWindow,#PromoRequiredConfirmation').hide();
	 });
		
});
 
$(function(){
	//	When Promo code Apply button is clicked
		
		$('#promoNotAvailedDiv').on('click','button#promoApply',function(){
			var promocode = $('#promocodeInput').val().trim();
			if(promocode=="" || promocode==undefined || promocode=="undefined" || promocode==null ){
				$("#PromoRequiredConfirmation").find('.dialog-content, .confirm-modal-body').text('Discount code is required');
				$("#PromoRequiredConfirmation").show();
				$('.modal-footer a:first-child').focus();
			}
			else{
				ajaxindicatorstart();
				//$('#promoAvailedDiv').hide();
				 $.ajax({
					 url : "applydiscountcoupon?promocode="+promocode+"&editQuoteFlow="+editQuoteFlow,
					 type : "GET",
					// data : { "promocode" : promocode },
					 dataType : "json",
					 contentType : 'application/json;charset=UTF-8',
					// cache: false,
					 success : function(data) {
						console.log("Success")
						var x = jQuery.parseJSON(data)
						
						//Fix for OM-1566
						//Start
						//check for invalid discount coupon
						if(x.isDiscountInvalid=="true"){
							$("#PromoRequiredConfirmation").find('.dialog-content, .confirm-modal-body').html('Invalid coupon code');
							$("#PromoRequiredConfirmation").show();
							$('#promoNotAvailedDiv').show();
							$('#promoAvailedDiv').hide();
							$('#promocodeInput').val("");
						}
						else{							
							var discount=Number(x.discountValue).toFixed(2);
							var customerPrice=Number(x.customerPrice).toFixed(2);
							 $('#promocodeDisplay').html(x.discountCoupon);
							 $(".discountPrice > span").html(Number(x.discountValue).toFixed(2)+" "+x.currencyCode);
							 $('#promoAvailedDiv').find('div.price h5.totalPrice span').html(Number(x.customerPrice).toFixed(2)+" "+x.currencyCode);
							 $('#promoNotAvailedDiv').hide();
							 $('#promoAvailedDiv').show();
						 }
						//End
						 ajaxindicatorstop();
					 },
					 error : function(data, status, er) {
						 console.log("Error" + er + "::status::" + status);
						 ajaxindicatorstop();
					 }
				 });
			
				//$('#promoNotAvailedDiv').hide();
				//$('#promoAvailedDiv').show();
			}
			return false;
		});



	//	Remove Button is clicked 
		$(document).on('click','button#promoCancel',function(e){
			//alert();
			 e.preventDefault();
			$('#promocodeInput').val('');
			$('#promoNotAvailedDiv').show();
			$('#promoAvailedDiv').hide();
			return false;
		});


});

/* EO  Coupon Code Implementation */

//full item details page redirect onclick line items
function fullItemRedirectUsingCartId(itemId, orgId,cartItemId){
	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
	  //if cart id is null bypassing the methord
	  if(cartItemId==""){
		fullItemRedirect(itemId,orgId);
	  	return;
	  }
	   window.open("getfullitemdetailsUsingCartId?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+'&isFromQuoteOrder=true&cartItemId='+cartItemId,'_blank');
 }
function fullItemRedirect(itemId, orgId){
   	  //window.location.href = 'getfullitemdetails?itemId='+itemId+'&itemCategory=itemCategory&organizationId='+orgId;
   	   window.open("getfullitemdetails?itemId="+itemId+"&itemCategory=itemCategory&organizationId="+orgId+'&isFromQuoteOrder=true','_blank');
}


//NREV-1321: 20-09-2017: validation for contact email. Added by Pooja
 function validateEmail(email){

    var validEmail=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if(!validEmail.test(email)){
      return false;
    }else{
      return true;
    }
};

$('.modal-footer a:first-child').focus();
/* Sigin at Chekout. To display the modal. GPD-10. Added by Pujith. Reviewed by Krupa. Starts*/
function displayPrompt(redirectUrl) {
	var toDisplayPrompt = $('#continueAsGuest').val();
	var isGuestUser = $('#isAGuestUser').val();
	if (isGuestUser=='true' && toDisplayPrompt != 'true') {
		$('#promptLoginModal').modal('show');
		$('.modal-footer a:first-child').focus();
		$('#checkoutLoginButton').click(function(){
			
			$.ajax({
				type : "post",
				url : "urlToRedirect",
				data: {
					setUrl:redirectUrl
				},
				success : function(response) {

				},
				error : function(e) {

				}
			});
			window.location.href = "login?forceLogin=true";
		});

		$('#checkoutContinueGuestButton').click(function() {
			window.location.href = redirectUrl;
			$.ajax({
				type : "post",
				url : "continueAsGuest",
				success : function(response) {

				},
				error : function(e) {

				}
			});
		});
		return false;
	} else {
		window.location.href = redirectUrl;
	}
	return true;
};
/*GPD-10 ends */
//Venkatasiva: GPD-1095
function fullItemDetails_BreadCrum(itemId,organizationId){			
	document.location.href="getfullitemdetails?itemId="+itemId+"&organizationId="+organizationId+"&itemCategory=''";
}	
//Venkatasiva GPD-1095

/*quick search. Added by Pooja. Reviewed by rajesh*/
$('#quickSearchAdd').on('click', function(e){
	e.preventDefault();
    $('div.pageLoader').show();
	//on adding item from quick search, if select all div is hidded it must be visible. Added by Pooja.H.S & reviewed by Rajesh
    if($('#checkboxDiv').css("display") == "none"){
        $('#checkboxDiv').show(); 
    } 
    //GPD-1286:Select All & Trash icon should be Reset, when user add Part using Quick Search.Added by Pooja.H.S & Reviewed by Rajesh
    $("#emptyCartButton").addClass('emptyCart');
	$("#selectall").removeAttr("checked");
	var partId = $(this).parent().find('input[type="hidden"][id="partId"]').text();
	   var mediaId = $(this).parent().find('input[type="hidden"][id="mediaId"]').text();
	   var ordMult = document.getElementById('ordermultiple').value;
   $('#keyword1').val("").siblings(".clear-search").hide();
		$.ajax({
        type : "Get",
        /* data : "cartItemId=" + cartItemId, */
        data : {partId: partId,mediaId: mediaId},
        contentType: 'application/json',
        mimeType: 'application/json',
      //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
        dataType:"json",
        url : 'quicksearchitem',
        cache : false,
        success : function(response) {
          var locale=JSON.parse($('#locale').val());
      	  console.log(response);
      	    $("#cart-items-hldr").html('');
      	    $("#editQuoteTemplate").tmpl(response.quoteDetails.cartItemList).appendTo("#cart-items-hldr");
      	    checkAlertMessage();
            filterComments();
		     valueHideOrShow = JSON.parse($('#hideOrShowFields').val());
            if (valueHideOrShow["show.order.multiples"] == "TRUE")
            { 
            	$(".order-multiples-lbl").show();
            }
            else
            {
            	$(".order-multiples-lbl").hide();
            }
      	    $('#count').text(response.quoteDetails.cartItemList.length);
            if(response.quoteDetails.subtotalAmountStr != "-1"){
                 $('#subTotal').text(response.quoteDetails.subtotalAmountStr+" "+(typeof response.quoteDetails.currencyCode=="undefined"?"":response.quoteDetails.currencyCode));
            }else{
                $('#subTotal').text();
            }
      	   
      	    $("#quickSearchDiv").css("display","none");
      	    if(($(".review-order").hasClass("not-active"))){
      	    	$(".review-order").removeClass("not-active");
      	    }
      	  if(($(".review-quote").hasClass("not-active"))){
    	    	$(".review-quote").removeClass("not-active");
    	    }
          $('div.pageLoader').hide();
          
          //$(".order-multiples-lbl").html('Order Multiples:'+ordMult);
          if (valueHideOrShow["show.order.multiples"] == "TRUE"){ 
      	 	$(".order-multiples-lbl").show();
          }
          else{$(".order-multiples-lbl").hide();
          }
          
          
        },  
        error : function(e) {  
         $('div.pageLoader').hide();
        }  
      });
});

$(document).ready(function(){
	$(document).on( 'scroll', function(){
		$('.globalsearch').hide();
	});
	
	$('#btn_folder').on('click', function(){
		$('#document_folder').toggleClass('document_toggle');
	});
	setTimeout(function(){
		var headerHeight = $('header').height();	
		// var breadcrumbHeight = $('.breadcrumbs-list').height();
		 var contentPadding  = headerHeight + 1;
		 $('.breadcrumbs-list').css("top", contentPadding);
	},1000);	
	  
	$("body").click(function(){	
		setTimeout(function(){
			 var headerHeight = $('header').height();
			// var breadcrumbHeight = $('.breadcrumbs-list').height();
			 var contentPadding  = headerHeight + 1;
			 $('.breadcrumbs-list').css("top", contentPadding);
		},1000);
	           
	});
	setTimeout(function(){
		if($('.owl-dot span').size() <= 1){
			$('.owl-dots').hide();
	}},1000);
	
});
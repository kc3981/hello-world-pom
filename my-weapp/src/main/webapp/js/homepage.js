/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(document).ready(function(e){
    	userid=$('#userId').val();
  		authtoken = $('#authToken').val();
  		loadBundles();
  		if(guestCartItemExist!="" && guestCartItemExist=="true" && guestUserAccess != "true"){
  			// customer box for ok, cancle option
  			//var notPrivilegeItemsGuestToLogin = "${sessionScope['scopedTarget.genericUserProperties'].notPrivilegeItemsGuestToLogin}";
  			var messageForGuestCartItems;
  			if(notPrivilegeItemsGuestToLogin!="")
  				messageForGuestCartItems = privilege +notPrivilegeItemsGuestToLogin+ confirmation;
  			else
  				messageForGuestCartItems = msgForGuest;
  				
  			$('.modal-body').text(messageForGuestCartItems);
  			$("#confirmationWindow").show();
              $("#confirmationWindow").draggable({
                  handle: ".modal-header"
     		});
  		}
		
  		 $(".cancel").click(function(){
      		$("#confirmationWindow").hide();
      		window.location.href = 'forcetologout';
      		//window.location.href = 'guestLogin';
      		//return false;
  		 });
		 
  		 $(".ok").click(function(){
     		 	$("#confirmationWindow").hide();
     		 	window.location.href = 'mergeguestcartitems';
     		 });
		
	     $("#new-main-menu-list > li:nth-child(1)").addClass("active");
          $.ajax({
       	    type: "POST",
       	    //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
       	    dataType:"json",
       	    url: "generalmarketingpromotions",
       	   /*  data: {userId: userId,languageId: languageId}, */
       	    success: function(data){
       	    	if(data.length>0){
               	 $(".glyphicon-chevron-left").show();
               	 $(".glyphicon-chevron-right").show();
                }
       	      //INC-1801 : CHANGED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
       	      var outputData = data;
       	      count = 1;
       	   	  $("#carousel-div").html('');
              $("#promotiongeneral").tmpl(outputData.generalMarketingPromotion).appendTo("#carousel-div");
              var carouselSize = $(".carousel-inner").find(".item").size();
              if(carouselSize > 1){
            	  $(".carousel-indicators").show();
              }else{
            	  $(".carousel-indicators").hide();
              }
              var promotionSize = $(".owl-stage-outer").find(".item").size();
              if(promotionSize > 1){
            	  $(".owl-controls").show();
              }else{
            	  $(".owl-controls").hide();
              }
              if(carouselSize == 1){
                $(".glyphicon.glyphicon-chevron-left, .glyphicon.glyphicon-chevron-right").hide();
              }
              $('.countHide').hide();
              if(outputData.generalMarketingPromotion.length > 1){
            	  for(i=0; i < outputData.generalMarketingPromotion.length; i++ ){
                  	 if(i == 0){
                  		 $(".carousel-indicators").append('<li data-target="#home-featuted-carousel" data-slide-to="'+i+'" class="active" "></li>');
                  	 }else{
                  		 $(".carousel-indicators").append('<li data-target="#home-featuted-carousel" data-slide-to="'+i+'"></li>'); 
                  	 }
                  	  
                    }
              }
              
       	    },
       	    error: function(jqxhr, textStatus, error) {
       	  // 15-01-2015-EH Handling
                var err = jqxhr.status;
                var msg = jqxhr.responseText;
                $(".pageLoader").hide();
                myErrObj.raise(err,msg,textStatus);
       	    }
       	  }); 
          var title = document.getElementsByTagName("title")[0].innerHTML;
        //added by kanishka to handle OM-1243
     	 History.pushState({},strings['global.page.title'],"./"+History.getState().url.split('web/')[1]+"?state=99");
     	 var manualStateChange = true;
 		History.Adapter.bind(window,'statechange',function(){
 		    if(manualStateChange == true){
 		     window.location.href=document.referrer;
 		    }
 		    manualStateChange = true;
 		});  
      });

		function loadBundles() {
			// var lang = document.getElementById('language_id_').value;
			$.ajax({
				type : "GET",
				async : false,
				url : "getLanguage",
				success : function(response) {
					var scriptContent = $($.parseHTML(response, document, true))
							.filter('script').text();
					$.globalEval(scriptContent);
				},
				error : function(e) {
				}
			});
		}

    	$.ajax({
         type: "POST",
         //INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
         dataType:"json",
         url: "otherpromotions",
         success: function(data){
           //INC-1801 : CHANGED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
           var outputData = data;
           var windowWidth = $(window).width();
           if(outputData.otherpromotions.length>0){
          	 $(".glyphicon-chevron-left").show();
          	 $(".glyphicon-chevron-right").show();
          	 $("#otherPromotions").text(outputData.otherpromotions[0].promotionTypeDesc);
              }
              $("#promotiondeals").tmpl(outputData.otherpromotions).appendTo("#promotions .promotion-carousel");
              owlCarouselsetup('#promotions .promotion-carousel');

            if(outputData.otherpromotions.length == 0){
              $("#otherPromotions").hide();
              $(".fa.fa-chevron-left, .fa.fa-chevron-right").hide();
            }
            if(outputData.otherpromotions.length < 4){
              if(windowWidth >= 1024){
                $(".owl-carousel .owl-stage-outer").css({"width":"37%","margin":"0 auto"});
              }
              else{
                $(".owl-carousel .owl-stage-outer").css({"width":"55%","margin":"0 auto"});
              }
              
              $(".fa.fa-chevron-left, .fa.fa-chevron-right").hide();
            }
            if(outputData.otherpromotions.length < 3){
              if(windowWidth >= 1024){
                $(".owl-carousel .owl-stage-outer").css({"width":"27%","margin":"0 auto"});
              }
              else{
                $(".owl-carousel .owl-stage-outer").css({"width":"35%","margin":"0 auto"});
              }
              
              $(".fa.fa-chevron-left, .fa.fa-chevron-right").hide();
            }
            if(outputData.otherpromotions.length < 2){
              if(windowWidth >= 1024){
                $(".owl-carousel .owl-stage-outer").css({"width":"13%","margin":"0 auto"});
              }
              else{
                $(".owl-carousel .owl-stage-outer").css({"width":"18%","margin":"0 auto"});
              }
              
              $(".fa.fa-chevron-left, .fa.fa-chevron-right").hide();
            }

         },
         error: function(jqxhr, textStatus, error) {
      	// 15-01-2015-EH Handling
             var err = jqxhr.status;
             var msg = jqxhr.responseText;
             $(".pageLoader").hide();
             myErrObj.raise(err,msg,textStatus);
         }
       });
  
	   function getPromotionParts(promotionId){
  		// <a href="javascript:void(0);" onclick="getPromotionParts(${'${'}promotionId})"> <img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}" alt="Promotions" title="Promotions"/></a>
  		document.location.href="getpromotionparts?promotionId="+promotionId;
  	 }
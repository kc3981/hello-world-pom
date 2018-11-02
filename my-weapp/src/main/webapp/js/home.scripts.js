/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(function(e) {
  $("#top-navbar-1 li:nth-child(1)").addClass("active");
    
  $("#home-featuted-carousel.carousel").carousel({
	  interval: 10000
  });
  
});

function owlCarouselsetup(carouselWrap){
    $(carouselWrap).owlCarousel({
      center: false,
      loop:true,
      margin:10,
      autoPlay: true ,
      nav:true,
      navigationText:true,
      responsive:{
        230:{
            items:4
        },
        600:{
            items:6
        },
        1000:{
            items:8
        }
      }
    });
  }

/*PROMOTION_NAVIGATION
 * navigateType (1l, "Not Clickable");
 * navigateType (2l, "Shop for Part");
 * navigateType (3l, "Promotion Part");
 * navigateType (4l, "External");
 */
function navigate(navigate,promotionId,navigateURL){

  if(navigate==2){
	  var facetTrue = '${properties["facetSearch.required"]}';
	  if(facetTrue == 'true'){
		  window.location.href="shopCentre";
	  }else{
		  window.location.href="shopforparts";
	  }
  }else if(navigate==4){
    //var url = document.getElementById(navigate).value;   
	  window.location.href=navigateURL;
  }else if(navigate==3){
     window.location.href="getpromotionparts?promotionId="+promotionId;
  }/* INC - 2320 Adding the code for clickable on Marketing Banner and to open in new tab Reviewed by Rajesh C */
  else if(navigate==5){
	  window.open(navigateURL);
  }/* END INC - 2320 Adding the code for clickable on Marketing Banner and to open in new tab Reviewed by Rajesh C*/
	else{
		window.location.href="#";
	}
 }

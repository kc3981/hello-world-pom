
function getShoppingCartCount(){
	
	var matches=document.getElementsByClassName("cartItemCount");
	
	if (matches.length==0)
	{
		return;
	}
	 /* Ajax call for cart item count*/
	$.ajax({
	  type : "post",
	  url : "getshoppingcount",
	  dataType : "json",
	  contentType : 'application/json;charset=ISO-8859-1',
	  success : function(data) {
	  for (var i=0; i<matches.length; i++) {
	    matches[i].innerHTML= data;
	  }
	  },
	  	error :function(jqxhr, textStatus, error) {
          var err = jqxhr.status;
          var msg = jqxhr.responseText;
		}
	 });
}

function loadPromotions() {
	userid=$('#userId').val();
	authtoken = $('#authToken').val();
	docServerUrl=$('#docServerUrl').val();
  $.ajax({
    type: "POST",
    dataType:"json",
    url: "generalmarketingpromotions",
    success: function(data){
	var outputData = data;
	if(outputData.generalMarketingPromotion.length > 0){
		  for(i=0; i < outputData.generalMarketingPromotion.length-6; i++ ){
	      	 if(i === 0){
	      		 $(".carousel-inner").append('<div class="limit-height carousel-item active"><img class="fill-available d-block w-100" src="' +
	      				docServerUrl + "?media=" + outputData.generalMarketingPromotion[i].mediaId + '&thumbnail=true&user=' + userid + 
	      				'&token=' + authtoken +'"></div>');
	      		 
	      	 }else{
	      		$(".carousel-inner").append('<div class="limit-height carousel-item"><img class="fill-available d-block w-100" src="' +
	      				docServerUrl + "?media=" + outputData.generalMarketingPromotion[i].mediaId + '&thumbnail=true&user=' + userid + 
	      				'&token=' + authtoken +'"></div>');
	      	 }          	
	    }
		  
	   	 if(outputData.generalMarketingPromotion.length > 0){
	     	  for(i=0; i < outputData.generalMarketingPromotion.length-6; i++ ){
	           	 if(i === 0){
	           		 $(".carousel-indicators").append('<li data-target="#home-featured-carousel" data-slide-to="'+i+'" class="active" ><img class="d-block w-100" src="' +
	 	      				docServerUrl + "?media=" + outputData.generalMarketingPromotion[i].mediaId + '&thumbnail=true&user=' + userid + 
		      				'&token=' + authtoken +'" class="img-fluid"></li>');
	           	 }else{
	           		 $(".carousel-indicators").append('<li data-target="#home-featured-carousel" data-slide-to="'+i+'"><img class="d-block w-100" src="' +
	 	      				docServerUrl + "?media=" + outputData.generalMarketingPromotion[i].mediaId + '&thumbnail=true&user=' + userid + 
		      				'&token=' + authtoken +'" class="img-fluid"></li>'); 
	           	 }
	            }
	       }
  }
    },
    error: function(jqxhr, textStatus, error) {
        var err = jqxhr.status;
        var msg = jqxhr.responseText;
        myErrObj.raise(err,msg,textStatus);
    }
  }); 
}

$(document).ready(function(e){

    // SideNav Initialization
	if ($(".button-collapse"))
	{
			$(".button-collapse").sideNav();
	}
	getShoppingCartCount();
	loadPromotions();
});


	
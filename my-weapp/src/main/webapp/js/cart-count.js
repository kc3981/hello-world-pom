/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/

var  myErrObj = new errnsp.errHandling.init();
$(function(e) {
	getShoppingCartCount();
});
function getShoppingCartCount(){
	 /* Ajax call for cart item count*/
	 $.ajax({
	  type : "post",
	  url : "getshoppingcount",
	  //data : request.term.toLowerCase(),
	  dataType : "json",
	  contentType : 'application/json;charset=ISO-8859-1',
	  //mimeType : 'application/json;charset=ISO-8859-1',
	  success : function(data) {
	   console.log(data);
	   	document.getElementsByClassName("cartItemCount")[0].innerHTML = data;
	   if(document.getElementsByClassName("cartItemCount")[1]){
	  	 document.getElementsByClassName("cartItemCount")[1].innerHTML = data;
	   }
	  },
	  	error :function(jqxhr, textStatus, error) {
	  	// 15-01-2015-EH Handling
           var err = jqxhr.status;
          var msg = jqxhr.responseText;
          $(".pageLoader").hide();
          console.log( "Request Failed: " + err );
           console.log( "Request Failed: " + jqxhr.responseText );
          // myErrObj.raise(err,msg,textStatus);
           //The above line is not commented in MILACRON_CODE_BASE
		}
	 });
}


 <!-- Javascript Library-->
 
   		dataLayer=[]; 
    //	var gTagObj = '${quoteConfirm}';
   		var gTagObj = "";
   		if(gTagObjTemp1 != ""){
   		    gTagObj = gTagObjTemp1; // OrderConfirmation
   		}else{
   			gTagObj = gTagObjTemp2; // QuoteFromOrder
   		}
      	var productObj = JSON.parse(gTagObj); 
      	var customgTagData = [];
      	customgTagData=[{
      		"orderNumber":productObj.orderNumber,
			"cartId":productObj.childCartId,
      		"totalAmount":productObj.totalAmount,
      		"products":[]
      	}];
	       	$.each(productObj.cartItemList, function(i, item){ 
	       		customgTagData[0]['products'].push({
	       			"name":productObj.cartItemList[i].partCommercialDescription, 
	       			"id":productObj.cartItemList[i].partId,
	       			"price":productObj.cartItemList[i].price, 
	       			"brand": productObj.cartItemList[i].organizationName,
	       			"category":productObj.cartItemList[i].partEngineeringDescription,
	       			"quantity":productObj.cartItemList[i].quantity,
	       			"currencyCode":productObj.cartItemList[i].currencyCode
	       			});
	       		
	      });
	      	
	       	/*** Modified Data **/
	       	dataLayer.push({customgTagData});
	       	
	       	/*** All the Data **/
	       	//dataLayer.push({gData}); 
      	
       
<!-- Google Tag Manager -->
		(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-PZ92KR8');
<!-- End Google Tag Manager -->
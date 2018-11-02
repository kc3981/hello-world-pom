<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- Google Analytics Tag Manager -->
<script>
var gTagObjTemp1 = '${quoteConfirm}'; 
var gTagObjTemp2 = '${orderConfirm}'; 
var gTagObj = "";
if(gTagObjTemp1 != ""){
    gTagObj = gTagObjTemp1; // OrderConfirmation
}else{
	gTagObj = gTagObjTemp2; // QuoteFromOrder
}
var productObj = JSON.parse(gTagObj); 

 
window.dataLayer = window.dataLayer || []
	 
var gTagObj = "";
if(gTagObjTemp1 != ""){
    gTagObj = gTagObjTemp1; // OrderConfirmation
}else{
	gTagObj = gTagObjTemp2; // QuoteFromOrder
}
var productObj = JSON.parse(gTagObj); 
   
var transactionProducts = []; 
$.each(productObj.cartItemList, function(i, item){ 
	transactionProducts.push({
		'sku': productObj.cartItemList[i].partNumber,
	    'name': productObj.cartItemList[i].partCommercialDescription,
	     'category': "",
	     'price': productObj.cartItemList[i].price,
	     'quantity': productObj.cartItemList[i].quantity
		});
});
	       
dataLayer.push({
   'transactionId': productObj.orderNumber,
   'transactionTotal': productObj.totalAmount,
   'transactionProducts' : transactionProducts
}); 

	       
</script>


<c:choose>
	<c:when test="${properties['enable.googletagmgr.analytics'] eq true}">
		<c:out value="${properties['googletagmgr.header2.js']}" escapeXml="false"/>
	</c:when>
</c:choose>
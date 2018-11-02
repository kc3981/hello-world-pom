<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript">
  var strings = new Array();
   strings['label.noimageavailable.message'] = "<spring:message code='label.noimageavailable.message' javaScriptEscape='true' />"
  strings['label.vehicle.partnotshown'] = "<spring:message code='label.vehicle.partnotshown' javaScriptEscape='true' />"
  strings['message.attribute.filter'] = "<spring:message code='message.attribute.filter' javaScriptEscape='true' />"
  strings['message.advancesearch.validation'] = "<spring:message code='message.advancesearch.validation' javaScriptEscape='true' />"
  strings['message.advancesearch.global.validation'] = "<spring:message code='message.advancesearch.global.validation' javaScriptEscape='true' />"
  strings['message.advancesearch.Invalid.data'] = "<spring:message code='message.advancesearch.Invalid.data' javaScriptEscape='true' />"
  strings['label.search.partnumdes'] = "<spring:message code='label.search.partnumdes' javaScriptEscape='true' />"
  strings['label.search.partdescription'] = "<spring:message code='label.search.partdescription' javaScriptEscape='true' />"
  strings['label.search.productcateg'] = "<spring:message code='label.search.productcateg' javaScriptEscape='true' />"
  strings['label.search.part'] = "<spring:message code='label.search.part' javaScriptEscape='true' />"
  strings['label.search.vehicle'] = "<spring:message code='label.search.vehicle' javaScriptEscape='true' />"
  strings['label.search.all'] = "<spring:message code='label.search.all' javaScriptEscape='true' />"
  strings['label.search.viewmachine'] = "<spring:message code='label.search.viewmachine' javaScriptEscape='true' />"
  strings['label.search.viewprodcat'] = "<spring:message code='label.search.viewprodcat' javaScriptEscape='true' />"
  strings['label.cart.search.for.parts'] = "<spring:message code='label.cart.search.for.parts' javaScriptEscape='true' />"
  strings['label.search.empty'] = "<spring:message code='label.search.empty' javaScriptEscape='true' />"
  strings['label.search.bom'] = "<spring:message code='label.search.bom' javaScriptEscape='true' />"
  strings['label.catalogweb.part'] = "<spring:message code='label.catalogweb.part' javaScriptEscape='true' />"
  strings['message.badCredentials'] = "<spring:message code='message.badCredentials' javaScriptEscape='true' />"
  strings['label.forgotpassword.email.invalid'] = "<spring:message code='label.forgotpassword.email.invalid' javaScriptEscape='true' />"
  strings['label.forgotpassword.invalid.password'] = "<spring:message code='label.forgotpassword.invalid.password' javaScriptEscape='true' />"
  strings['label.forgotpassword.invalid.phone.number'] = "<spring:message code='label.forgotpassword.invalid.phone.number' javaScriptEscape='true' />"
  strings['label.forgotpasswords.warning.message'] = "<spring:message code='label.forgotpasswords.warning.message' javaScriptEscape='true' />"
  strings['message.guest.log'] = "<spring:message code='message.guest.log' javaScriptEscape='true' />"
  strings['message.button.guest.continue'] = "<spring:message code='message.button.guest.continue' javaScriptEscape='true' />"
  strings['message.login'] = "<spring:message code='message.login' javaScriptEscape='true' />"
  strings['search.productcat'] = "<spring:message code='search.productcat' javaScriptEscape='true' />"
  strings['label.forgotpassword.userName.invalid'] = "<spring:message code='label.forgotpassword.userName.invalid' javaScriptEscape='true' />"
  strings['label.msrp'] = "<spring:message code='label.msrp' javaScriptEscape='true'/>"
  strings['label.item.yourPrice'] = "<spring:message code='label.item.yourPrice' javaScriptEscape='true'/>"
  strings['save'] = "<spring:message code='save' javaScriptEscape='true'/>"
  strings['label.select.country']= "<spring:message code='label.select.country' javaScriptEscape='true'/>"
  strings['label.select.state']= "<spring:message code='label.select.state' javaScriptEscape='true'/>"
  strings['label.dealer.name']= "<spring:message code='label.dealer.name' javaScriptEscape='true'/>"
  strings['label.dealer']= "<spring:message code='label.dealer' javaScriptEscape='true'/>"
  strings['label.message.one.brand']= "<spring:message code='label.message.one.brand' javaScriptEscape='true'/>"
  strings['label.show']= "<spring:message code='label.show' javaScriptEscape='true'/>"
  strings['label.hide']= "<spring:message code='label.hide' javaScriptEscape='true'/>"	  
  
	  	  
		  var myJsonString = JSON.stringify(strings);
	  	  $('#multi').val(myJsonString);


</script>

<input type="hidden" name="multi" id="multi" />
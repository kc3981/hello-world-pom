<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>


<jsp:include page="googleAnalytics.jsp" />

<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>

<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">

<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" 
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>

</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<div id="header-wrapper">
					<%@ include file="header.jsp"%>
				</div>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="label.home" /></a></li>
					<li class="active"><spring:message
							code="label.header.promotions" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<div style="border-bottom: 1px solid #eee;">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings"
							style="padding-bottom: 0px;">
							<h3 class="inline">
								<spring:message code="label.promotion.part" />
							</h3>
							( <span id="partCount"></span>
							<spring:message code="whereused.results" />
							)
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 marginNone">
							<div class="col-lg-6 pull-right text-right column-paddings"
								style="padding-top: 30px;">
								<label><spring:message code="label.sortby" /></label> <select
									id="sort-by">
									<option value="1"><spring:message
											code="label.item.shop" /> #
									</option>
									<option value="2"><spring:message
											code="label.desc.shop" /></option>
								</select>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					<div
						class="result-container col-lg-9 col-md-12 col-sm-12 col-xs-12 column-paddings"
						id="promotin-part-hldr"></div>
					<%-- <div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings text-center hidden"
					id="pagination">
					<div class="dataTables_paginate paging_full_numbers"
						id="quote-list_paginate">
						<ul class="pagination" id="pageUl">
							<li class="paginate_button first disabled"
								aria-controls="quote-list" tabindex="0" id="quote-list_first"><a
								href="#"><spring:message code="label.pagnation.first"/></a></li>
							<li class="paginate_button previous disabled"
								aria-controls="quote-list" tabindex="0" id="quote-list_previous"><a
								href="#"><spring:message code="label.pagnation.prev"/></a></li>

							<!-- <li class="paginate_button active page1" aria-controls="quote-list"
								tabindex="0"><a href="#">1</a></li> -->

							<li class="paginate_button next disabled"
								aria-controls="quote-list" tabindex="0" id="quote-list_next"><a
								href="#"><spring:message code="label.pagnation.next"/></a></li>
							<li class="paginate_button last disabled"
								aria-controls="quote-list" tabindex="0" id="quote-list_last"><a
								href="#"><spring:message code="label.pagnation.last"/></a></li>
						</ul>
					</div>
				</div> --%>
				</div>
		</form>
	</div>

	<!-- footer container -->
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>

	<input type="hidden" id="ordermultiple" />

	<!-- custome alert -->
	<div class="modal bs-example-modal-md" id="myModal"  data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content custom-modal-content">
				<div class="modal-header custom-modal-header">
					<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
					<h4 class="modal-title custom-modal-title">
						<spring:message code="label.bulkpartupload.information" />
					</h4>
				</div>
				<div class="modal-body custom-modal-body">
					<!-- Content for the dialog / modal goes here. -->
				</div>

			</div>
		</div>
	</div>
	</div>

	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="../js/jstree.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/hideOrShowFields.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>

	<script id="promotinPartTemplate" type="text/x-jquery-tmpl">

					<div class="row search-parts-template cart-details add-cartpopover">
                       <div class="col-lg-12">
                       <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 xs_img_center">
                            {{if mediaId!=0 && mediaId!=null }}
								 <!--INC-2498 fix starts(Developed by : Swetha) -->
                                 <a href="javascript:void(0)" onclick="fullItemDetails(${'${'}partId},${'${'}organizationId})">
									<img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}">
									{{if !isActualImage}}
										<div class="waterMarkForChildPartsForSearch waterPromotion">
											<span style="margin: 6px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
											<span style="font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
										</div>
									{{/if}}
								</a>
								<!--INC-2498 fix ends -->
                             {{else}}
									 <a href="javascript:void(0);" class="no-image" onclick="fullItemDetails(${'${'}partId},${'${'}organizationId})">${'${'}commercialDescription}</a>
							 {{/if}}
                        </div>
                        <div class="col-lg-5 col-md-4 col-sm-4 col-xs-12 cart-item-info xs_img_center pt-xs-10">
                            <h4><a href="javascript:void(0);" onclick="fullItemDetails(${'${'}partId},${'${'}organizationId})" data-itemId="${'${'}partId}" data-mediaId="${'${'}mediaId}" data-itemNumber="${'${'}partNumber}"><spring:message code="label.item.shop"/> # ${'${'}partNumber}</a></h4>
							<%--Fix for duplicate parts starts (Developed by : Swetha) --%>
							<c:if test="${properties['display.legacy.part']}">
								<div><spring:message code="label.legacy.part"/> ${'${'}legacyPartNumber}</div>
							</c:if>
                            <div><strong>${'${'}partCommercialDescription}</strong></div>
                            <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> 
								<div>${'${'}partEngineeringDescription}</div>
							</sec:authorize>
							<div class="b-label">
							<c:if test="${properties['display.organizationName']}">
                            <div>${'${'}organizationName} <spring:message code="search.part"/></div>
							</c:if>
                            <!-- GPD-2522:Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
							<div><strong class="inventoryMsg" data-avail="${'${'}partId}">${'${'}inventoryMessage}</strong></div> 
							</sec:authorize>
							<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 xs_img_center quantity-change">
                            <div class="spinner-control" data-ordermultiplekey="${'${'}orderMultiple}">
                              
							  <input type="text" id="${'${'}partId}" class="total-items output input-qty-box" maxlength="6" value="${'${'}orderMultiple}" style="width:40px;text-align:center;">
                              <div class="qty">  
                                <a href="javascript:void(0);" class="item-increment ">
                                    <i class="fa fa-caret-up"></i>
                                  </a>
                                  <a href="javascript:void(0);" class="item-decrement ">
                                    <i class="fa fa-caret-down"></i>
                                  </a>
                              </div> 
                              </div>
                              <span class="unit" data-uom="${'${'}partId}">${'${'}uom}</span> 
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 xs_img_center nopadding erp-price-avail" data-allVal="" data-priceVal="" data-msrpVal="" data-yousaveVal="" data-currencyVal="" data-uomVal="" data-orgId="${'${'}organizationId}">
                        <!-- GPD-2522: Added by Pujith, reviewed by Venkatasiva Reddy -->
						<sec:authorize access="hasRole('ROLE_PRICE')">
							<div data-msrpShowHide="${'${'}partId}" class="msrpShowHide"><spring:message code="label.msrp"/>: <span class="msrp-price price-loader" data-msrp="${'${'}partId}"></span></div>
                            <div class="your-price1" data-price="${'${'}partId}"><spring:message code="label.your.price"/>: <span class="your-price price-loader" data-price="${'${'}partId}"></span></div>
                            <div data-savepriceshowhide="${'${'}partId}" class="blueColor savePriceShowHide hidden"><spring:message code="label.save"/>: <span class="save-price price-loader" data-saved="${'${'}partId}"></span> <spring:message code="lable.item.each" /></div>
						</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_PRICE')">
						<div>
							<spring:message code="message.guest.login" />
						</div
						</sec:authorize>
						<!-- GPD-2524:ROLE_PRICE authorize Added by Pujith, reviewed by Venkatasiva Reddy -->
							<sec:authorize access="hasRole('ROLE_CART') and hasRole('ROLE_PRICE')">
	                            {{if isOrderable && ispriceShown}}
	                            	<button class="btn btn-addtocart cart-small mtop10 col-md-10 col-sm-12 add-to-cart b-w100"><spring:message code="quick.search.addtocart"/></button>
	                            	
									<sec:authorize access="hasRole('ROLE_ORDER')">
										{{if hasPlaceOrderPOCC}}
											<button class="btn btn-buynow cart-small xs-mt-5 col-md-10 col-sm-12 buynow-click b-w100"><spring:message code="label.buynow"/></button>
										{{else}}
											<button class="btn btn-buynow cart-small col-md-10 col-sm-12 buynow-click b-w100 not-active"><spring:message code="label.buynow"/></button>
										{{/if}} 
									</sec:authorize>
									<sec:authorize access="!hasRole('ROLE_ORDER')"> 
										<button class="btn btn-buynow cart-small col-md-10 col-sm-12 not-active b-w100"><spring:message code="label.buynow"/></button>
									</sec:authorize>
									
								{{else}}
									<button class="btn btn-addtocart cart-small mtop10 col-md-10 col-sm-12 not-active b-w100"><spring:message code="quick.search.addtocart"/></button>
									<button class="btn btn-buynow cart-small col-md-10 col-sm-12 not-active b-w100"><spring:message code="label.buynow"/></button>
								{{/if}}
							</sec:authorize>
                        </div>
                      <input type="hidden"	value="${'${'}promotionId}"	class="promotionField" />
                    </div>
               </div>
    </script>

	<script type="text/javascript">
	var paginationCount;
	var startPoint = 1;
    var json;
    var pageNumber = 1;
    var promotionId;
    var pageSize=10;
    var counter = 1;
 
    var defaultPartUOM = '${properties["default.part.uom"]}';
    var defaultPartOrderMultiple = '${properties["default.part.ordermultiple"]}';
    var valueHideOrShow; 
    var userid,authtoken;
        $(function(){
        	userid=$('#userId').val();
			authtoken = $('#authToken').val();
        	 var resultPerPage = $('#result-per-page').val();
        	 
   	      
        	 
            $("#main-menu-list > li:nth-child(2)").addClass("active");
            // Initilizing Catalog Tree
            initilizeTreeCtrl();
            $('#treeShopforParts.treeview-hldr').on('ready.jstree', function (e, data) {
                var treeinstance = $('#treeShopforParts.treeview-hldr').jstree(true);
                treeinstance.hide_dots();
                treeinstance.hide_stripes();
                treeinstance.hide_icons ();
                treeinstance.select_node('2');
            });
         
         var promotionPartsList='${listOfPromotionPart}';
         var partCount='${totalItemCount}';
        // console.log(promotionPartsList);
        $('div.pageLoader').show();
         var json=JSON.parse(promotionPartsList);
         console.log(json);
         console.log(json['promotionId']);
         $("#promotinPartTemplate").tmpl(json.data)
			.appendTo("#promotin-part-hldr");

         valueHideOrShow = ${hideOrShowFields};
	      if (valueHideOrShow["show.order.multiples"] == "TRUE")
	      { 
	    	  $(".order-multiples-lbl").show();
	      }
	      else
	      {
	    	  $(".order-multiples-lbl").hide();
	      }
         
		//Bing Increment click Event
			$('.item-increment').on('click',function(){
				var itemVal = $(this).parents('.spinner-control').children('.total-items').val();
				if(parseInt(itemVal)>=999){
		            $(this).parents('.spinner-control').children('.total-items').val("999");
		            return false;
		          }
			});
		//Bing Keypress Event
          $('.total-items.output').on('keypress',function(e){
            var maxThree = /^\d{3}$/;
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
            if(maxThree.test($(this).val())){
              e.preventDefault();
            }
          });
		$('div.pageLoader').hide();
         $('#partCount').text(partCount);
      	if(json.data.length!=0){
         $('#promotionType').text(json.data[0].promotionType);
/*          $("#pagination").show(); */
      	}
		if(json.data.length==0)
		  $('#promotin-part-hldr').append('<p class="errorText"><spring:message code="message.noPart" javaScriptEscape="true"/></p>');
		
		
        
       /* ERP call */
		var partVoList = {};
		var items = [];
		var organizationId;
		$.each(json.data, function(idx, obj) {
			
			organizationId = obj.organizationId;
			var partVo = {};
			partVo['partId'] = obj.partId;
			partVo['partNumber'] = obj.partNumber;
			partVo['orderMultiple'] = obj.orderMultiple;
			partVo['uom'] = obj.uom;
			
			/* if(obj.orderMultiple != null)
			{
				$('.total-items').val(obj.orderMultiple);
			} */			
			/* if(obj.ispriceShown != true){
				$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
			} */
			items.push(partVo);
		});
		partVoList['partVoList'] = items;
       if(json.data.length>0){
    	  /*  $("#pagination").show(); */
    	   getPriceForItems(partVoList,organizationId);
    	   pageNumber++;
       }
		else{
			  /*   $("#pagination").hide();*/
			 $('div.pageLoader').hide();
		} 

        });
        
        // direct change of quantity
	      $(document).delegate('.total-items.output','change', function(){
	    	  var itemVal = $(this).parents('.spinner-control').children('.total-items.output').val();
	          var cartItemId = $(this).parents('.spinner-control').attr('id');
	          var partId = $(this).attr('id');
	          var organizationId = $(this).parents('.spinner-control').attr('data-orgId');
	          var returnVal=validateQty(itemVal);
	         
	          if(returnVal){
	          	//editQuantity($(this).val(),partId);
	          }else{
	        	  $(this).val(1);
	          	//editQuantity(1,partId)
	          }
               
   	  		});
        
	    var pageNumber=1
		var counter = 2;
		var pageSize=10;
		var totalItems='${totalItemCount}';
		function validateQty(itemQty){
	    	  if(itemQty==""){
	    			$('.modal-body').text("<spring:message code='alert.cart.enter.qty' javaScriptEscape='true'/>");
	    			$("#myModal").show();
	    			return false;
	    		}
	    		else if(itemQty<=0){
	    			$('.modal-body').text("<spring:message code='alert.cart.qty.notless.one' javaScriptEscape='true'/>");
	    			$("#myModal").show();
	    			return false;
	    		}else if(validateSpecialCharacterAndAlphanumeric(itemQty) == true){
	    			$('.modal-body').text("<spring:message code='alert.quote.order.special.char.not.allowed' javaScriptEscape='true'/>");
	    			$("#myModal").show();
	    			return false;
	    		}else
	    			return true;
		}
		function getPriceForItems(items, organizationId) {
			var locale='${locale}';
			var priceMsg = "<spring:message code='message.contact.customer.service' javaScriptEscape='true'/>";
			$.ajax({
				type : "Get",
				data : {items:JSON.stringify(items),organizationId:organizationId},
				contentType : 'application/json',
				mimeType : 'application/json',
				url : "getcategoryPartPrice",
				success : function(response) {
                 //   var locale='${locale}';
					//console.log(response);
					var partItemListPriceAvail = response.partItemVOList;
					for(var i=0;i<partItemListPriceAvail.length;i++){
						if(partItemListPriceAvail[i].priceNotShown == true){
							/* var priceMsg = "<spring:message code='guest.price.msg' javaScriptEscape='true'/>"; */
							$("span.your-price").removeClass("strike-through").text(priceMsg);
							$(document).find('.price-loader').removeClass();
							//$("span.msrpShowHide").text('contact customer service').removeClass('price-loader');
							$("div.your-price, div.savePriceShowHide").hide();
							$("div.savePriceShowHide span.save-price").siblings("span").text("");
							$("div.search-parts-template .btn-addtocart.cart-small, div.search-parts-template .btn-buynow.cart-small").addClass("disabled");
							
						   /*  $("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set MSRP
							$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader')//set price
						    $("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader'); */
							var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
							
							$(".inventoryMsg").text(inventoryMsg);//set inventory Message text
						}
						else{
							
							if(partItemListPriceAvail[i].msrpStr != "-1"){
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set MSRP
							}
							else{
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							}
							
							if(partItemListPriceAvail[i].priceStr != "-1"){
								$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader')//set price
							}
							else{
								$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+"']").hide();
							}
							
							if(partItemListPriceAvail[i].savedPriceStr != "-1"){
								$("div.erp-price-avail .savePriceShowHide[data-savepriceshowhide='"+partItemListPriceAvail[i].partId+"']").removeClass("hidden");

								$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set saved price
							}
							else{
								$("div.erp-price-avail .savePriceShowHide[data-savepriceshowhide='"+partItemListPriceAvail[i].partId+"']").hide();
							}
							
							$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);
							
							$("div.cart-item-info .inventoryMsg[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].inventoryMessage);//set inventory Message text
							$($('.erp-price-avail')[i]).data('allval',partItemListPriceAvail[i]);
							//$($('.inventoryMsg')[i]).text(partItemListPriceAvail[i].inventoryMessage);//set inventory Message text
							
							/* $("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").hide();
							if(typeof partItemListPriceAvail[i].msrp!="undefined" && typeof partItemListPriceAvail[i].price!="undefined" && 
							partItemListPriceAvail[i].savedPrice>=0){
								$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+"']").show();
								$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].msrpStr+" "+partItemListPriceAvail[i].currencyCode);//set MSRP
								$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+partItemListPriceAvail[i].currencyCode)//set price
								$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+partItemListPriceAvail[i].currencyCode);//set saved price
							}
							$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].priceStr+" "+partItemListPriceAvail[i].currencyCode)//set price
							$("div.cart-item-info .stock-count[data-avail='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].availableQuantity);//set available quantity
							$("div.cart-item-info .lead-time[data-leadtime='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].leadTime);//set lead time
							
							//GS-1942 bug fix on 22-10-2015
			        		// Vishal agarwal 
							$(".unit[data-uom='"+partItemListPriceAvail[i].partId+"']").text(partItemListPriceAvail[i].uom);//set uom
							
							$($('.erp-price-avail')[i]).data('priceval',partItemListPriceAvail[i].price);
							$($('.erp-price-avail')[i]).data('msrpval',partItemListPriceAvail[i].msrp);
							$($('.erp-price-avail')[i]).data('yousaveval',partItemListPriceAvail[i].savedPrice);
							$($('.erp-price-avail')[i]).data('currencyval',partItemListPriceAvail[i].currencyCode);
							$($('.erp-price-avail')[i]).data('uomval',partItemListPriceAvail[i].uom);
							$($('.erp-price-avail')[i]).data('allval',partItemListPriceAvail[i]); */
						}
						/* $(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").parents('.erp-price-avail').find('button').each(function(){
							$(this).removeClass('not-active');
						});
						$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+"']").parents('.erp-price-avail').siblings('.quantity-change').find('.spinner-control').removeClass('not-active'); */
					}
                    $('div.pageLoader').hide();
				},
				error : function(e) {
                    $('div.pageLoader').hide();
				}
			});
		}
		
		function fullItemDetails(partId,organizationId){
			var itemCategory=null;
			document.location.href="getfullitemdetails?itemId="+partId+"&itemCategory="+itemCategory+"&organizationId="+organizationId;
		}
		
		$(document).delegate('.qty-box','change',function() {
			if($(this).val()<1){
				$('.modal-body').text("<spring:message code='alert.cart.qty.notless.one' javaScriptEscape='true'/>")
				  $("#myModal").show();
				  $("#myModal").draggable({
	            handle: ".modal-header"
	        });
				$('.qty-box').val(1);
			}else if(!(/^ *[0-9]+ *$/.test($(this).val()))){
				$('.modal-body').text("<spring:message code='alert.quote.order.special.char.not.allowed' javaScriptEscape='true'/>");
				  $("#myModal").show();
				  $("#myModal").draggable({
	            handle: ".modal-header"
	        });
				$('.qty-box').val(1);
			}
		
		});
		$(".custom-close").click(function(){
			   $("#myModal").hide();
			});
		
		$(document).delegate(
				'.add-to-cart',
				'click',

			/* 	function() { */

				function(e) {
					 $('div.pageLoader').show();
					e.preventDefault();
					var img =$(this).parents(".search-parts-template").children("div:first-child").html();
					var partId = $(this).parent().siblings('.cart-item-info')
							.find('a').attr('data-itemId');
					
					var mediaId = $(this).parent().siblings('.cart-item-info')
							.find('a').attr('data-mediaId');
					var quantity = $(this).parent()
							.siblings('.quantity-change').find('.total-items')
							.val();
					var organizationId = $(this).parent().attr('data-orgId');
					var itemNumber = $(this).parent().siblings('.cart-item-info')
					.find('a').attr('data-itemNumber');
					
					
					var dataItemVal = null
					
					//dataItemVal = $(this).parent().data('allval');
					
					
					console.log(dataItemVal);
					
					$.ajax({
						type : "POST",
						data : {
							partId : partId,
							mediaId : mediaId,
							quantity : quantity,
							organizationId : organizationId,
							dataItemVal : JSON.stringify(dataItemVal),
							isAddToCartFromBOM:false // INC-2438 Track BOM Catalog Usages (product - Milacron and REV), Changes done by Kameshwari, Reviewed by Jayakumar
						},
						url : "addtocart",
						success : function(response) {
                        getShoppingCartCount();
                        
							if (response == '') {
								/* alert("Part is not added...") */
								$('div.pageLoader').hide();
								$(".cart-popover").css({"opacity": 1});
								$(".cart-popover").show().stop().fadeOut(5000);
								/*$(".close-popup").delegate("click",function(){
									$(this).parents(".cart-popover").fadeout("fast");
								})*/
								$(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
									$(this).css("text-decoration","none");
								});
								$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
							} else {
								var jsonResponse = JSON.parse(response);
								if(typeof jsonResponse.errorMessage=="undefined"){
								$('div.pageLoader').hide();
								$(".cart-popover").css({"opacity": 1});
								$(".cart-popover").show().stop().fadeOut(5000);
								/*$(".close-popup").delegate("click",function(){
									$(this).parents(".cart-popover").fadeout("fast");
								})*/
								
								
								$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
								//NREV-1511 fix starts
								if(jsonResponse.isActualImage == false){
									$(".waterMarkForCartPopOver").show();
								}
								//NREV-1511 fix ends
								$(".cart-popover").find(".cart-popover-title").text("<spring:message code='search.part.partnumber' javaScriptEscape='true'/>" +":"+ itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
								/* alert("Part is added to your cart..."); */
								}else{
		    	        	 		$('div.pageLoader').hide();
		    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
		    		    			$("#myModal").show();	
		    	        	 	}
							}
							 
						},
						error : function(e) {
							 $('div.pageLoader').hide();
						}
					});
				});
		$('#sort-by').on('change', function(){
			pageNumber = 1;
			counter = 1;
			if(totalItems>0){
	 			getParts(pageNumber);
	 			pageNumber++;
			}else{
				return null;
			}
		});
		
		$(window).on('scroll',function(e){
            var $document=$(document);
            var $window=$(this);
            
           	if($('#promotin-part-hldr > .cart-details').is(':visible') && $('.pageLoader').is(':hidden')){

            if($document.scrollTop() >= $document.height() - $window.height() - 100){
            	var results = $('.cart-details').length;
				
            	if(typeof totalItems !== 'undefined' && totalItems > results && pageNumber===counter){
            		$('div.lazyLoader').removeClass('hidden');
            		getParts(pageNumber);
	                //setInterval(function () {$('div.lazyLoader').addClass('hidden');}, 3000);
	                pageNumber++;
	                
            	}
            }
            }
        });
		
		
      function getParts(pageNumber) {
    	  $('div.pageLoader').show();
			var promotionId=$('.promotionField').val();
			var sortBy = $('#sort-by').val();
			var resultPerPage = $('#result-per-page').val();
 			$.ajax({
				type : "Get",
				data : {
					promotionId : promotionId,
					sortBy : sortBy,
 					pageNumber : pageNumber
				},
				contentType : 'application/json',
				mimeType : 'application/json',
				url : "getparts",
				success : function(response) {
// 					$("#promotin-part-hldr > div.row").remove();
					if(pageNumber===1){
						$("#promotin-part-hldr").html('');
			 			$('.cart-details').html('');
					}
					 $("#promotinPartTemplate").tmpl(response.data)
							.appendTo("#promotin-part-hldr");
					$('#partCount').text(response.totalItemCount);
					
					//valueHideOrShow = ${hideOrShowFields};
				      if (valueHideOrShow["show.order.multiples"] == "TRUE")
				      { 
				    	  $(".order-multiples-lbl").show();
				      }
				      else
				      {
				    	  $(".order-multiples-lbl").hide();
				      }
					
					if(response.data.length==0){
						//$('#promotin-part-hldr').html('<p><spring:message code="label.order.customer.message" javaScriptEscape="true"/></p>');
					}
					/*Pagination */
					paginationCount = getPaginationCount(resultPerPage,response.totalItemCount);
					
					
					resetPagination(startPoint+4);
					startPoint = 1;
					
					/*$("#promotinPartTemplate").tmpl(response.itemDetails)
					.appendTo("#promotin-part-hldr");
					$("#resultCount").text(response.itemDetails.length);
					$("#resultInfo").show();
					$("#pagination").show();*/
					$('#allResult').text(response.totalItemCount);
					totalItems = parseInt($('#partCount').text());
					/*if(response.itemDetails.length==0)
						$('#promotin-part-hldr').append('<p><spring:message code='label.order.customer.message' javaScriptEscape='true'/></p>');*/
					
					counter++;
					//$('.paginate_button.active').after('<li class="paginate_button" aria-controls="quote-list" tabindex="1"><a href="#">2</a></li>');
					paginationCount = getPaginationCount(resultPerPage,response.totalItemCount);
					
					
					resetPagination(startPoint+4);
					startPoint = 1;
					
 					
					if(paginationCount==1){
						$('.paginate_button.next').addClass('not-active');
						$('.paginate_button.last').addClass('not-active');
					}
					$('.page1').addClass('active');
					
					// active clicked button and inactive previous active button
					$('.paginate_button.active').removeClass('active');
					$('.page'+pageNumber+'').addClass('active');
					
					
					
					// get item id list for getting price
					var partVoList = {};
					var items = [];
					var organizationId;
					//console.log(response.data);
					$.each(response.data, function(idx, obj) {
						
						organizationId = obj.organizationId;
						var partVo = {};
						partVo['partId'] = obj.partId;
						partVo['partNumber'] = obj.partNumber;
						items.push(partVo);
					});
					partVoList['partVoList'] = items;
                   if(response.data.length>0){
                	   $('div.pageLoader').hide();
                	   getPriceForItems(partVoList,organizationId);
                   }
				  else{
						 $('div.pageLoader').hide();
					} 
				
				
				},
				error : function(jqxhr, textStatus, error) {
		            var err = jqxhr.status;
		            var msg = jqxhr.responseText;
		            $(".pageLoader").hide();
		            console.log( "Request Failed: " + err );
		            console.log( "Request Failed: " + jqxhr.responseText );
		            myErrObj.raise(err,msg,textStatus);	
				}
			});
		 }
      /* Onchange of result per page */
      $('#result-per-page').on('change', function(){
			var pageNumber = 1;
			getParts(pageNumber);
		})
      
  	 function getPaginationCount(resultPerPage, totalItemCount){
		var pageCount=0;
		if(resultPerPage>=totalItemCount){
			pageCount = 1;
		}
		else{
			pageCount = parseInt((totalItemCount/resultPerPage));
			if(totalItemCount%resultPerPage!=0)
				pageCount = pageCount + 1;
		}
		return pageCount;
	}
  	
  	function resetPagination(paginationCount){
		for(var i=1; i<=paginationCount;i++){
			$('.page'+i).remove();
		}
	}
	
	function setpaginationCount(paginationCount,startPoint){
		if(paginationCount>5)
			paginationCount = startPoint+4;
		
		var count = 1;
		for(var i=startPoint; i<=paginationCount;i++){
			$('#pageUl li:eq('+(count)+')').after('<li class="paginate_button page'+i+'" aria-controls="quote-list" tabindex="'+i+'" onclick="pageNumberClicked('+i+')"><a href="#">'+i+'</a></li>');
			count=count+1;
		}
	}
	
	/*On click of page number  */
	function pageNumberClicked(pageNumber){
		getParts(pageNumber);
	}
	
	/*On click of first/previous/next/last  */
	$('.paginate_button').on('click', function(){
		var pageNumber=$(this).text();
			if($(this).hasClass('not-active')){
	    return false;
	   }	
		
		
		if(pageNumber=="First"){
			pageNumber = 1;
			$('.paginate_button.active').removeClass('active');
			$('.page1').addClass('active');
			//$('.paginate_button.active').removeClass('active');
		}
		else if(pageNumber=="Previous"){
			pageNumber = $('.paginate_button.active').children('a').text()-1;
		}
		else if(pageNumber=="Next"){
			pageNumber = $('.paginate_button.active').children('a').text();
			pageNumber = parseInt(pageNumber)+1;
			
		}
		else if(pageNumber="Last"){
			pageNumber = paginationCount;
		}
		else{
			$('.paginate_button.active').removeClass('active');
			$(this).addClass('active');
		}
		
		getParts(pageNumber);
	})
	
	// buy now click
		$(document).delegate('.buynow-click','click',function(e) {
     	   e.preventDefault();
    	   var organizationId = $(this).parent().attr('data-orgId');
     	   var partId = $(this).parent().siblings('.cart-item-info').find('a').attr('data-itemId');
     	   var quantity = $(this).parent().siblings('.quantity-change').find('.total-items').val();
     	  var previousURL = '${previousURL}';
     	  $('div.pageLoader').show();
     	  $.ajax({
	          type : "Get",
	          /* data : "cartItemId=" + cartItemId, */
	          data : {organizationId: organizationId},
	          contentType: 'application/json',
	          mimeType: 'application/json',
	          url : "isdivisionmapped",
	          cache : false,
	          success : function(response) {
	        	  //Fix for OM-1419: Added PreviousURL parameter to the below URL, Fixed by Kameshwari & Reviewed by Harishankar 
	        	   displayPrompt('directorderinit?organizationId='+organizationId+'&isFromOrderBrand=true&partId='+partId+'&quantity='+quantity+'&isDivisionMapped='+response+'&previousURL='+previousURL); //Fixed by Pujith. JIRA GSP-1289. Reviwed by Chinnam.
	        	   
	        	   $('div.pageLoader').hide();
	          },  
	          error : function(e) {  
	        	  $('div.pageLoader').hide();
	          }  
        });
     	   
        })
		
		function editQuantity(quantity,partId){

			$.ajax({
	          type : "Get",
	          data : {partId: partId,quantity: quantity},
	          contentType: 'application/json',
	          mimeType: 'application/json',
	          url : "editquoteitemquantity",
	          cache : false,
	          success : function(response) {

	          },
	          error:function(xhr,status,error){

	          }
			});
		}
    </script>
</body>

</html>
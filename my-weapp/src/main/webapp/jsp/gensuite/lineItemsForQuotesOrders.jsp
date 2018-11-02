<style type="text/css">
.item_check {
	padding-left: 15px;
}

.checkBox-border {
    border: 1px solid #eee;
	color: #000000;
	font-size: 14px;
	margin-bottom: 5px;
	padding: 15px;
	
}

#deleteConfirmationWindow.modal{
	overflow: hidden;
}
</style>
<div id="checkboxDiv"
	class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template xs_img_center checkBox-border">
	<!-- div for checkbox -->

	<input id="selectall" type="checkbox" class="cart-checkbox" /> <span
		class="fa fa-trash-o delete-item_new emptyCart" id="emptyCartButton"
		onClick="deleteLineItems()" title="<spring:message code="tooltip.order.delete" />"></span>


</div>
<div class="modal bs-example-modal-md" id="deleteConfirmationWindow" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content custom-modal-content">
			<div class="modal-header custom-modal-header">
				<button type="button" class="close custom-close"
					data-dismiss="modal" aria-hidden="true">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title custom-modal-title">
					<spring:message code="label.bulkpartupload.information" />
				</h4>
			</div>
			<div class="modal-body confirm-modal-body">
				<p class="dialog-content"></p>
			</div>
			<div class="modal-footer custom-modal-footer">
				<a class="col btn cancel" href="javascript:;"><spring:message
						code="label.bulkpartupload.cancel" /></a> <a
					class="col btn ok" href="javascript:;"><spring:message
						code="label.bulkpartupload.ok" /></a>
			</div>
		</div>
	</div>
</div>
<script id="editQuoteTemplate" type="text/x-jquery-tmpl">
<div
	class="col-lg-12 col-md-12 col-sm-12 col-xs-12 search-parts-template cart-details xs_img_center">
	<c:choose>
		<c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser ||(!sessionScope['scopedTarget.genericUserProperties'].isGuestUser && !isDivisionMapped)}">
			<div class="col-lg-1 item_check nopadding prd_text_align">
				<input class="ind-empty-checkbox cart-checkbox" id="${'${'}partId}" type="checkbox" onclick="indCheckBox(${'${'}partId},event)" value="${'${'}partId}"> 
			</div>
				 <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 sm_lm_-50">
									{{if mediaId!=0}}
                               			<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img"></a>
                              		{{else}}
										<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<%--GSP-1051 fix(Fixed by Swetha) Closing brace was missing --%>
                                    <h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a></h4>
									<%--Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar --%>
									<c:if test="${properties['display.legacy.part']}">									
										<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div>
 									</c:if>
                                    <div><strong>${'${'}partCommercialDescription}</strong></div>
                                     <%-- <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> --%>
								   <sec:authorize access="@customSpringSecurity.hasDivisionPermission('ROLE_ENGG_DESC',#organizationId)">
                                     	<div>${'${'}partEngineeringDescription}</div>
                                    </sec:authorize>
									 <!-- Start: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
									{{if typeof(obsoletePartNumber) != "undefined" && obsoletePartNumber!=''}}
									<div id="cartSuperseeded"><spring:message code="search.part.superseededpartnumber" />${'${'}obsoletePartNumber} </div>
									{{/if}}
									<!--End: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
                                    <div class="b-label" data-cartItem="${'${'}partId}">
										<c:if test="${properties['display.organizationName']}">
                                        <div>${'${'}organizationName} Part</div>
										</c:if>
                                        <!-- <div><strong>${'${'}availableQuantity} In Stock</strong></div> -->
										<!-- GPD-2522: ROLE_AVAILABILITY added by Pujith, reviewed by Venkatasiva Reddy -->
										<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
										<div><strong>${'${'}inventoryMessage}</strong></div>
										</sec:authorize>
										<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p>

                                    </div>
				    <c:if test="${properties['item.comments.section.required']==true}">
                                    <div class="product-comments item-comments" comment-itemId="${'${'}partId}">
                                        <a href="javascript:;">Add Comments</a>
                                        <textarea maxlength="200" rows="1" placeholder="<spring:message code="label.quote.order.comment.limit" />" style="display: none" class="form-control comment-controller">${'${'}comments}</textarea>
                                    </div></c:if>
                                </div>
								 <div class="col-lg-3 col-md-2 col-sm-2 col-xs-12 nopadding price-box" data-itemId="${'${'}partId}">
                                    <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalMSRPStr}" />
									<!-- GPD-2522: ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
									<sec:authorize access="hasRole('ROLE_PRICE')">
									{{if priceMSRPStr !== "-1"}}
											<div><spring:message code="label.msrp"/>: <span class="cartItemMsrp" data-cartItem="${'${'}partId}">${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
									{{/if}}
									</sec:authorize>
                                    <sec:authorize access="!hasRole('ROLE_PRICE')">
										<spring:message code="message.guest.login"/>
									</sec:authorize>
										<!-- GPD-2522: ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
									<sec:authorize access="hasRole('ROLE_PRICE')">	
										<div><h5><spring:message code="label.shoppingcart.total" />: <span class="cartItemTotal" data-cartItem="${'${'}partId}"> 
                                            {{if itemTotalMSRPStr !== "-1"}}
                                                ${'${'}itemTotalMSRPStr} ${'${'}currencyCode}
                                            {{/if}}
                                            </span> </h5>
                                            <input type="hidden" value="${'${'}itemTotalMSRPStr}">
                                        </div>
									</sec:authorize>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <div class="spinner-control qty-change-div directorder-spinner" data-ordermultiplekey="${'${'}orderMultiple}" id="${'${'}partId}">
                                      <input type="text" class="total-items output input-qty-box" maxlength="6" value="${'${'}quantity}" style="width:40px;text-align:center;">  
                                      <div class="qty">  
                                        <a href="javascript:void(0);" class="item-increment plus-qty">
                                            <i class="fa fa-caret-up"></i>
                                          </a>
                                          <a href="javascript:void(0);" class="item-decrement minus-qty">
                                            <i class="fa fa-caret-down"></i>
                                          </a>
                                      </div> 
                                    </div>
                                    <span class="unit" style="">${'${'}uom}</span> 
                                </div>
                               
                               
		</c:when>
	 	<c:otherwise>
			<div class="col-lg-1 item_check nopadding">
				<input class="ind-empty-checkbox cart-checkbox" id="${'${'}partId}" type="checkbox" onclick="indCheckBox(${'${'}partId},event)" value="${'${'}partId}"> 
			</div>
			<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 sm_lm_-50">
								{{if mediaId!=0}}
										{{if cartItemId!=0}}
                               				<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})"><img id="image" src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img">
												{{if !isActualImage}}
													<div class="waterMarkForCart">
														<span style="font-size: 8px;margin: 6px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
														<span style="font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
													</div>
												{{/if}}
											</a>
                              			{{else}}
											<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId},'')"><img id="image" src="${properties['docserver.url']}?media=${'${'}mediaId}&thumbnail=true&user=${'${'}userid}&token=${'${'}authtoken}"  alt="catalog-img">
												{{if !isActualImage}}
													<div class="waterMarkForCart">
														<span style="margin: 6px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span>
														<span style="font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span>
													</div>
												{{/if}}
											</a>
							 			{{/if}}
                              		{{else}}
										{{if cartItemId!=0}}
											<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
										{{else}}
												<a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId}, ${'${'}cartItemId})" class="no-image"><p></p></a>
										 {{/if}}
							 		{{/if}}
                                    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                                {{if cartItemId!=0}}
                               				<h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId},${'${'}cartItemId})"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a></h4>
                              			{{else}}
											<h4><a href="javascript:void(0);" onclick="fullItemRedirectUsingCartId(${'${'}partId}, ${'${'}organizationId},'')"><spring:message code="quick.search.item" /> ${'${'}partNumber}</a></h4>
							 			{{/if}}
									<!-- Changes done for INC-2370: Changes done by kameshwari, Reviewed by Jayakumar -->
                                    <c:if test="${properties['display.legacy.part']}">
                                    	<div><strong><spring:message code="label.legacy.part" /> ${'${'}legacyNumber}</strong></div>
                                    </c:if> 
                                    <div><strong>${'${'}partCommercialDescription}</strong></div>
                                    <sec:authorize access="@customSpringSecurity.hasDivisionPermission('ROLE_ENGG_DESC',#organizationId)">
                                     	<div>${'${'}partEngineeringDescription}</div>
                                    </sec:authorize>
									 <!-- Start: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
									{{if typeof(obsoletePartNumber) != "undefined" && obsoletePartNumber!=''}}
									<div id="cartSuperseeded"><spring:message code="search.part.superseededpartnumber" />${'${'}obsoletePartNumber} </div>
									{{/if}}
									<!--End: Added By:Harish Bakale, GPD-1739, Reviewed by:Subbu -->
                                    <div class="b-label" data-cartItem="${'${'}partId}">
										<c:if test="${properties['display.organizationName']}">
                                        <div>${'${'}organizationName} Part</div>
										</c:if>
                                        <!-- <div><strong>${'${'}availableQuantity} In Stock</strong></div> -->
										<!-- GPD-2522: ROLE_AVAILABILITY authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
										<sec:authorize access="hasRole('ROLE_AVAILABILITY')">
 										<div><strong>${'${'}inventoryMessage}</strong></div>
										</sec:authorize>
										<p class="order-multiples-lbl" ><spring:message code="label.all.ordermultiples" javaScriptEscape="true"/> ${'${'}orderMultiple}</p>
                                    </div>
                                    <div class="product-comments item-comments" comment-itemId="${'${'}partId}">
                                        <a href="javascript:;"><spring:message code="label.your.price"/>:</a>
                                        <textarea maxlength="200" rows="1" placeholder="<spring:message code="label.quote.order.comment.limit" />" class="form-control comment-controller">${'${'}comments}</textarea>
                                    </div>
                                </div>
                               
                               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 div-part nopadding" data-itemId="${'${'}partId}">
                                <input type="hidden" class="alertFlagInput" value="${'${'}itemTotalAmountStr}" />
									{{if priceMSRPStr !== "-1" && priceMSRPStr!=priceStr }}
										<!-- GPD-2522:ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
										<sec:authorize access="hasRole('ROLE_PRICE')">
                                    	<div><spring:message code="label.msrp"/>: <span class="cartItemMsrp" data-cartItem="${'${'}partId}">${'${'}priceMSRPStr} ${'${'}currencyCode}</span></div>
										</sec:authorize>
										<sec:authorize access="!hasRole('ROLE_PRICE')">
											<spring:message code="message.guest.login" />
										</sec:authorize>
										
									 {{/if}}
                                    <div class="form-inline" data-your-price="${'${'}price}">
                                       <sec:authorize access="@customSpringSecurity.hasDivisionPermission('ROLE_OVERRIDE_CUSTOMER_PRICE',#organizationId)">
										{{if priceStr !== "-1"}}
										{{if typeof(price) != "undefined" &&  price>0}}
											<span><spring:message code="label.your.price"/>: </span>
                                        	<input type="text" data-cartItem="${'${'}partId}" class="input-price get-input-price cartItemYourPrice" value="${'${'}priceStr}" maxlength="10" minlength="0"/>
											${'${'}currencyCode}
										{{else}}
											<h5><spring:message code="label.your.price"/>: <span class="cartItemYourPrice" data-cartItem="${'${'}partId}">${'${'}priceStr} ${'${'}currencyCode}</span></h5>
										{{/if}}
										{{/if}}
                                      </sec:authorize>
                                      <sec:authorize access="!@customSpringSecurity.hasDivisionPermission('ROLE_OVERRIDE_CUSTOMER_PRICE',#organizationId)">
										{{if priceStr !== "-1"}}
                                        <h5><spring:message code="label.your.price"/>: <span class="cartItemYourPrice" data-cartItem="${'${'}partId}">${'${'}priceStr} ${'${'}currencyCode}</span></h5>
                                      {{/if}}
										</sec:authorize>
										<span class="errmsg"></span>
                                    </div>
									{{if savedPriceStr !== "-1" && priceMSRPStr!=priceStr }}
                                    	<div class="blueColor"><spring:message code="label.save"/>: <span class="cartItemSavedPrice" data-cartItem="${'${'}partId}">${'${'}savedPriceStr} ${'${'}currencyCode}</span> <spring:message code="lable.item.each" /></div>
									{{/if}}
										<!-- GPD-2522:ROLE_PRICE authorization Added by Pujith, reviewed by Venkatasiva Reddy -->
										<sec:authorize access="hasRole('ROLE_PRICE')">
                                 	   <div><h5><spring:message code="label.item.total"/>: <span class="cartItemTotal" data-cartItem="${'${'}partId}">
                                        {{if itemTotalAmountStr !== "-1"}}
                                            ${'${'}itemTotalAmountStr} ${'${'}currencyCode}</span>
                                        {{/if}}
                                       </h5></div>
										</sec:authorize>
 								</div>
                            	 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 nopadding">
                            <%--    <div class="spinner-control qty-change-div" id="${'${'}partId}">
                                      <input type="text" class="total-items output input-qty-box" maxlength="3" value="${'${'}quantity}" style="width:40px;text-align:center">  
 --%>
                                    <div class="spinner-control qty-change-div directorder-spinner" data-ordermultiplekey="${'${'}orderMultiple}" id="${'${'}partId}">
                                      <input type="text" class="total-items output input-qty-box" maxlength="6" value="${'${'}quantity}" style="width:40px;text-align:center;">  
                                      <div class="qty">  
                                        <a href="javascript:void(0);" class="item-increment plus-qty">
                                            <i class="fa fa-caret-up"></i>
                                          </a>
                                          <a href="javascript:void(0);" class="item-decrement minus-qty">
                                            <i class="fa fa-caret-down"></i>
                                          </a>
                                      </div> 
                                    </div>
									<span class="unit" style="">${'${'}uom}</span> 
                                </div>
								{{if typeof(price) != "undefined" &&  price==0 && isOrderAllowedWithPriceError !='true'}}
                                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<span style="color:red"><spring:message code="label.order.create.errormessage" /></span>
									</div>
								{{/if}}
								{{if typeof(price) != "undefined" &&  price==0 && isQuoteAllowedWithPriceError !='true'}}
                                	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<span style="color:red"><spring:message code="label.order.create.errormessage" /></span>
									</div>
								{{/if}}
	 	</c:otherwise>
     </c:choose>
</div>
 </script>

<script>

	function deleteLineItems() {
		if ($(".ind-empty-checkbox:checked").length > 1 || isSelectAll) {
			var msg = "<spring:message code='message.last.item.delete' javaScriptEscape='true'/>";
			$('.modal-body').text(msg)
			$("#deleteConfirmationWindow").show();
		} else {
			deleteItems();
		}

	}
	$("#deleteConfirmationWindow .cancel").click(function() {
		$("#deleteConfirmationWindow").hide();
		return false;
	});

	$("#deleteConfirmationWindow .ok").click(function() {
		$("#deleteConfirmationWindow").hide();
		deleteItems();
	});
	
	$(".custom-close").click(function(){
		   $("#deleteConfirmationWindow").hide();
	});

	function deleteItems() {
		var someObj = [];
		$('div.pageLoader').show();
		var inputElements = document
				.getElementsByClassName('ind-empty-checkbox');
		for (var i = 0; inputElements[i]; ++i) {
			if (inputElements[i].checked) {
				checkedValue = inputElements[i].id;
				someObj.push(checkedValue);
			}
		}

		$
				.ajax({
					type : "POST",
					data : {
						partIds : JSON.stringify(someObj),
						isSelectAll : isSelectAll
					},
					mimeType : 'application/json',
					url : "deleteLineItemInQuoteOrder",
					cache : false,
					success : function(response) {
						$("#emptyCartButton").addClass('emptyCart');
						$("#selectall").removeAttr("checked");
						var locale = $
						{
							locale
						}
						;
						console.log(response);
						$("#cart-items-hldr").html('');
						$("#editQuoteTemplate").tmpl(response.cartItemList)
								.appendTo("#cart-items-hldr");
						checkAlertMessage();
						filterComments();
						valueHideOrShow = $
						{
							hideOrShowFields
						}
						;
						if (valueHideOrShow["show.order.multiples"] == "TRUE") {
							$(".order-multiples-lbl").show();
						} else {
							$(".order-multiples-lbl").hide();
						}
						$('#count').text(response.cartItemList.length);
						var preveousCurrency = $('#subTotal').text().split(" ");

						if (response.cartItemList.length == 0) {
							$("#checkboxDiv").hide();
							$("#subTotal").text("0.00");
							$(".review-order").addClass("not-active");
							$(".review-quote").addClass("not-active");
						} else {
							$('#subTotal')
									.text(
											response.subtotalAmountStr
													+ " "
													+ (typeof response.currencyCode == "undefined" ? ""
															: response.currencyCode));
						}
						$('div.pageLoader').hide();
					},
					error : function(e) {
					}
				});
	}
	function indCheckBox(partId, e) {
		if ($(".ind-empty-checkbox").length == $(".ind-empty-checkbox:checked").length) {
			//Venkatasiva : Some times select all checkbox is not working if you select all individuals checkboxes that's why chenaged 'this.changed' to 'true'
			$("#selectall").prop('checked', true);
			isSelectAll = true;
		} else {
			$("#selectall").removeAttr("checked");
			isSelectAll = false;
		}
		if ($(".ind-empty-checkbox:checked").length != 0) {
			$("#emptyCartButton").removeClass('emptyCart');
		} else if ($(".ind-empty-checkbox:checked").length == 0) {
			$("#emptyCartButton").addClass('emptyCart');
		}
	}

	$("#selectall").click(function() {
		$('.ind-empty-checkbox').prop('checked', this.checked);
		if (this.checked == true) {
			$("#emptyCartButton").removeClass('emptyCart');
			isSelectAll = true;
		} else {
			$("#emptyCartButton").addClass('emptyCart');
			isSelectAll = false;
		}
	});
	
	
</script>

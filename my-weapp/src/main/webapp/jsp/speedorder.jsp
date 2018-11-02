<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="googleAnalytics.jsp" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>

<link rel="stylesheet" href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-responsive.css?version=${properties['application.version']}">
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
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/apple-touch-icon-57-precomposed.png">

<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"  type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer></script>
<script src="../js/jquery.bootpag.js?version=${properties['application.version']}" defer type="text/javascript"></script>
<!-- <script src="../js/jquery.history.js"></script> -->
<!-- <script src="https://github.com/balupton/History.js"></script> -->
<!-- <script type="text/javascript" src="https://github.com/devote/HTML5-History-API/blob/master/history.js"></script> -->
<style>
ol.speedorder-list {
	font-size: 14px;
	list-style: none;
	padding-left: 0;
}

.speedorder-list li {
	counter-increment: item;
	clear: both;
	height: 40px;
}

.speedorder-list li:before {
	margin-right: 10px;
	content: counter(item);
	background: #333;
	border-radius: 50%;
	color: #fff;
	float: left;
	width: 2.2em;
	text-align: center;
	display: inline-block;
	vertical-align: top;
}

.speedorder-list .speedorderkeyword {
	display: inline-block;
	width: 70%;
}

.speedorder-list .alert {
	margin-bottom: 2px;
	padding: 5px 10px;
}

.speedorder-list button.close {
	font-size: 20px;
	right: 0;
}

.speedorder-lis-hldr {
	padding: 10px 0;
	overflow-y: scroll;
	max-height: 400px;
}

ul#ui-id-1, .ui-autocomplete.ui-menu {
	z-index: 9999999 !important;
	position: fixed;
}

.hidden{
       display:none;
}

summary{
	font-size: 20px;
	outline: none;
	}
	
#instruction > li{
	padding-left: 25px!important;
}

.spedordbtnsize{
	padding: 5px;
	min-width: 182px;
	height: 37px;	
}

.select-organization{
	padding-top: 20px;
}

</style>
</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<!-- header container having logo and navigation -->
		<form method="post">
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>

					<c:choose>
						<c:when test="${true==param.orderhere}">
							<li><a href="orderhere"><spring:message
										code="label.order.options" /></a></li>
						</c:when>
					</c:choose>
					<li class='active'><spring:message code="label.speed.order" /></li>

				</ul>
			</div>

			<div class="container-fluid content-wrapper">

				<h3><spring:message code="label.speed.order" /></h3>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings ">
						<ui class="summary" title="Expand Instructions" id="instruction"  ><i id="arrow-down" class="fa fa-arrow-down" style="padding-right: 10px;" aria-hidden="true"></i><spring:message code="label.instructions" />
							<li class="hidden"><spring:message code="label.select.brand" /></li>
							<li class="hidden"><spring:message code="message.enter.item.part" /></li>
							<li class="hidden"><spring:message code="message.enter.tab.move" /></li>
							<li class="hidden"><spring:message code="message.press.add" /></li>
							<li class="hidden"><spring:message code="message.additional.item" /></li>
							<li class="hidden"><spring:message code="message.go.to.cart" /></li>
					</ui>
				</div>
				
				
				<div class="row">
					<div class="col-xs-12">
						<div class="select-organization">
							<label for="org-select" class="control-label required"><spring:message
									code="label.brand.choose" /></label> <select class="form-control"
								id="org-select">
								<c:if test="${fn:length(organizationsForUser) gt 1}">
									<option value="0" selected="selected"><spring:message
											code="label.brand.choose" /></option>
								</c:if>
								<c:forEach var="item" items="${organizationsForUser}">
									<option value="${item.organizationId}">${item.organizationName}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="row" style="margin-top:10px;">
							<div class="col-xs-12 col-md-6 col-sm-6">
								<button type="button" class="btn btn-buynow cart-small spedordbtnsize"
									id="btn-addrows-clear">
									<spring:message code="lable.clear" />
								</button>
								<button type="button" id="btn-addrows"
									class="btn btn-buynow cart-small spedordbtnsize">
									<spring:message code="label.add.rows" />
								</button>
								<button type="button" id="append-to-cart-speedorder"
									class="btn btn-addtocart cart-small spedordbtnsize">
									<spring:message code="lable.item.addToCart" />
								</button>
							</div>
						</div>
						
						<div class="search-part">
							<br /> <a class="clear-search hidden" href="#"><i
								style="right: 15px;" class="fa fa-times"></i></a>


							<ul style="list-style: none;">
								<li>
									<div class="col-md-6 col-sm-6 co-xs-12">
										<label for="keyword2" class="control-label required"><spring:message
												code="lable.partnumber" /></label>

										<div class="spinner-control pull-right" style="margin-top: 0px -12px 3px 0px">
											<label for="keyword2" class="control-label required"><spring:message
													code="lable.item.quantity" /></label>
										</div>
									</div>
									<div class="col-md-6 col-sm-6 co-xs-12">
										<label for="keyword2" class="control-label"
											style="margin-left: 25%;"><spring:message
												code="view.label.status" /></label>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>

							<div class="speedorder-lis-hldr">

								<ol class="speedorder-list">


								</ol>
							</div>
						</div>
					</div>
				</div>

				<div
					style="width: 40% !important; height: 30px !important; padding: 4px 10px !important; font-size: 15px; display: none;"
					id="showInvalidMsg" class="alert alert-danger alert-dismissible"
					role="alert">
					<!-- button type="button" class="close" data-dismiss="alert" aria-label="Close" style="font-size: 15px !important; margin-top: 5px !important; height:10px !important; width:10px !important;"><span aria-hidden="true" style="margin-left:-30px !important;">X</span></button-->
					Please add Part Number.
				</div>

				
			</div>

			<div id="speedorder-tmpl" style="display: none">
				<li>
					<div class="col-md-6 col-sm-6 co-xs-12">
						<input name="keyword" type="text" data-attr=""
							class="form-control keyword2 speedorderkeyword  pull-left"
							aria-label="Search"
							placeholder='<spring:message code="label.message.enter.item.part"/>'>
						<div class="spinner-control pull-right" style="margin-top: 0">
							<input type="text" class="total-items output" id="part-qty"
								maxlength="3" style="width: 50px; text-align: center;" value="1"
								data-name="PartNumber">
							<div class="qty">
								<a href="javascript:void(0);" class="item-increment plus-click"
									tabindex="-1"> <i class="fa fa-caret-up"></i>
								</a> <a href="javascript:void(0);"
									class="item-decrement minus-click" tabindex="-1"> <i
									class="fa fa-caret-down"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 co-xs-12">
						<!-- <div class="alert alert-success alert-dismissible" role="alert">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					  Added to Cart.
					</div> -->
					</div>
				</li>
			</div>
			<div id="speedorder-success-tmpl" style="display: none">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<spring:message code="label.add.to.cart" />
				</div>
			</div>

			<div id="speedorder-failure-tmpl" style="display: none">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<spring:message code="label.invalid.number" />
				</div>
			</div>
			
			<div id="speedorder-nonorderable-tmpl" style="display: none">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					Part is not orderable
				</div>
			</div>

			<!-- custome confirm alert -->
			<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content">
								<spring:message code="label.bulkpartupload.replace.cart.message" />
							</p>
						</div>
						<div class="modal-footer">
							<%-- <a class="btn btn-addtocart add pull-right cancel" style="height:35px;margin-left:3px" href="javascript:;"><spring:message code="label.bulkpartupload.cancel"/></a> --%>
							<a class="col btn ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>


			<div class="modal bs-example-modal-md" id="confirmationWindowClear" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content text-center"> <!-- GSP-1189 : Venkatasiva Pop-up aligned to center by adding style-->
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content">
								<spring:message code="label.bulkpartupload.replace.cart.message" />
							</p>
						</div>
						<div class="modal-footer">
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
								class="col btn ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>
			<!-- footer container -->
			<a href="javascript:void(0);" class="cd-top"
				title="<spring:message code='label.scroll.top'/>"><spring:message
					code="label.footer.top" /></a>
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
		</form>
		<!-- Javascript Plugins -->
		<script
			src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js" defer
			type="text/javascript"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		<script src="../js/jstree.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		<script src="../js/jquery.jscroll.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
		<script src="../js/gensuite-ui.js?version=${properties['application.version']}" type="text/javascript"></script>
		<script src="../js/custom.scripts.js?version=${properties['application.version']}"  type="text/javascript"></script>
		<script src="../js/quickOrder.js?version=${properties['application.version']}" defer></script>
		<script type="text/javascript">
	//Added by Nandakishore to enable the Order Option Tab when clicked from Order Option
	var test="${param.orderhere}";
	if(test == "true"){
		$("#main-menu-list > li:nth-child(2)").addClass("active");
	}
		
	</script>
		<script>
		function randomString(length, chars) {
		    var result = '';
		    for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)];
		    return result;
		}
	
	
		$(function(){
			
			function intialRows(){
			
				var count = 0;
				for(var nCount=0;nCount<15; nCount++ ){
					
					var rString = randomString(32, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
					
					var htmlContent = '';
					var textBoxId = 'keyword_'+rString;
					htmlContent += '<li>';
						htmlContent += '<div class="col-md-6 col-sm-6 co-xs-12">';
							htmlContent += '<input id="'+textBoxId+'" name="keyword" type="text" data-attr="" class="form-control keyword2 speedorderkeyword  pull-left" aria-label="Search" style="border: 1px solid #69696a;" placeholder="<spring:message code='label.message.enter.item.part' javaScriptEscape='true'/>">';
							htmlContent += '<div class="spinner-control pull-right" style="margin-top:0">';
								htmlContent += '<input type="text" class="total-items output" id= "part-qty" maxlength="3" style="width:50px;text-align:center;" value="1" data-name="PartNumber">';  
								htmlContent += '<div class="qty">';  
								htmlContent += '<a href="javascript:void(0);" class="item-increment plus-click" tabindex="-1">';
								htmlContent += '<i class="fa fa-caret-up"></i>';
								htmlContent += '</a>';
								htmlContent += '<a href="javascript:void(0);" class="item-decrement minus-click" tabindex="-1">';
								htmlContent += '<i class="fa fa-caret-down"></i>';
								htmlContent += '</a>';
							htmlContent += '</div>';
							htmlContent += '</div>';
						htmlContent += '</div>';
						htmlContent += '<div class="col-md-4 col-sm-6 co-xs-12" id="testMess">';
						htmlContent += '</div>';
					htmlContent += '</li>';
					$(".speedorder-lis-hldr .speedorder-list").append(htmlContent);
					count = nCount;
				}
				
				/* $("input.keyword2").autocomplete({
					source : function(request, response) {
						var searchString = this.bindings[0].value;
						 var organizationDropDownVal=$('#org-select :selected').attr('value');
						 seletedFromAutoComplete = false;
						//alert('selected value is ----- > '+organizationDropDownVal);
						 //START - INC-924
						 //console.log("organizationDropDownVal==="+organizationDropDownVal);
						 if(organizationDropDownVal == "0"){
							 //$('#keyword2').attr('title',$.i18n.prop('label.brand.choose')).tooltip('show');
							 return false;
						 }
						 //END
						$.ajax({
							type : "post",
							url : "quicksearchautocomplete?searchString="+searchString+"&specificOrganization="+organizationDropDownVal+"&typeDropDown="+$("#typedropdown").val(),
							//data : request.term.toLowerCase(),
							dataType : "json",
							contentType : 'application/json;charset=ISO-8859-1',
							//mimeType : 'application/json;charset=ISO-8859-1',
							success : function(data) {
								//console.log(data);
								response($.map(data, function(item) {
									return {
										desc : item.description,
										value : item.lable,
										data : item.value,
										partId: item.partId
									};
								}));
							},
						});
					},
					autoFocus : true,
					change :  function(event, ui) {
						$('#fuzzy').val('');
					},
				    open:function(event) {
				       var width = $(window).width();
				        if(width >= 1100){
				            $('.ui-autocomplete').css({'width': 249 + 'px','max-height': 150 + 'px','zIndex':0});  
				        }
				        else if(width >= 900){
				          $('.ui-autocomplete').css({'width': 214 + 'px','max-height': 150 + 'px','zIndex':0});  
				        }
				        else{
				            $('.ui-autocomplete').css({'width': 335 + 'px','max-height': 150 + 'px','zIndex':0});  
				        }
				    },                  
					select : function(event, ui) {
						$(this).val(ui.item.label);
				        $(this).prev('a.clear-search').removeClass('hidden');
						//console.log($('#org-select :selected').attr('value'));
						quickSearch(ui.item.value,$('#org-select :selected').attr('value'));
						$("#quickSearchDiv").show();
						commDescTemp=ui.item.desc;
						seletedFromAutoComplete = true;
						seletedPartNumber = ui.item.data;
						
						//console.log(ui.item.partId);
						
						$(this).attr('data-attr',ui.item.partId);
						//$(this).data("partId",ui.item.partId);
						
						return false;
					},
					minLength : 2 
				}); */
				
				return count;
			}
			
			intialRows();
			
			/*function addrows(){
				for(var nCount=0;nCount<15; nCount++ ){
					$(".speedorder-lis-hldr .speedorder-list").append($("#speedorder-tmpl").html());
				}
			}*/
			
			$("#btn-addrows").on("click",function(){
				intialRows();
			});
			
			$(".cancel").click(function(){
	    		$("#confirmationWindow,#confirmationWindowClear").hide();
	    		return false;
			});
			
			 $("#confirmationWindow .ok").click(function(){
	            	$("#confirmationWindow").hide();
	            	return false;
	         });
			 $("#confirmationWindowClear .ok").click(function(){
				 	location.reload();
	            	$("#confirmationWindowClear").hide();
	            	return false;
	         });
			 
			 $("#btn-addrows-clear").on('click',function(){
				var msgText= "<spring:message code='message.info.clear.all'/>";
     			$("#confirmationWindowClear .dialog-content").html(msgText);
     			$("#confirmationWindowClear").show();
			 });
			 
	
/* 			 $("input.keyword2").autocomplete({
					source : function(request, response) {
						var searchString = this.bindings[0].value;
						 var organizationDropDownVal=$('#org-select :selected').attr('value');
						 seletedFromAutoComplete = false;
						//alert('selected value is ----- > '+organizationDropDownVal);
						 //START - INC-924
						 //console.log("organizationDropDownVal==="+organizationDropDownVal);
						 if(organizationDropDownVal == "0"){
							 //$('#keyword2').attr('title',$.i18n.prop('label.brand.choose')).tooltip('show');
							 return false;
						 }
						 //END
						$.ajax({
							type : "post",
							url : "quicksearchautocomplete?searchString="+searchString+"&specificOrganization="+organizationDropDownVal+"&typeDropDown="+$("#typedropdown").val(),
							//data : request.term.toLowerCase(),
							dataType : "json",
							contentType : 'application/json;charset=ISO-8859-1',
							//mimeType : 'application/json;charset=ISO-8859-1',
							success : function(data) {
								//console.log(data);
								response($.map(data, function(item) {
									return {
										desc : item.description,
										value : item.lable,
										data : item.value,
										partId: item.partId
									};
								}));
							},
						});
					},
					autoFocus : true,
					change :  function(event, ui) {
						$('#fuzzy').val('');
					},
				    open:function(event) {
				       var width = $(window).width();
				        if(width >= 1100){
				            $('.ui-autocomplete').css({'width': 249 + 'px','max-height': 150 + 'px','zIndex':0});  
				        }
				        else if(width >= 900){
				          $('.ui-autocomplete').css({'width': 214 + 'px','max-height': 150 + 'px','zIndex':0});  
				        }
				        else{
				            $('.ui-autocomplete').css({'width': 335 + 'px','max-height': 150 + 'px','zIndex':0});  
				        }
				    },                  
					select : function(event, ui) {
						$(this).val(ui.item.label);
				        $(this).prev('a.clear-search').removeClass('hidden');
						//console.log($('#org-select :selected').attr('value'));
						quickSearch(ui.item.value,$('#org-select :selected').attr('value'));
						$("#quickSearchDiv").show();
						commDescTemp=ui.item.desc;
						seletedFromAutoComplete = true;
						seletedPartNumber = ui.item.data;
						
						//console.log(ui.item.partId);
						
						$(this).attr('data-attr',ui.item.partId);
						//$(this).data("partId",ui.item.partId);
						
						return false;
					},
					minLength : 2 
				}); */
				
			 $("#append-to-cart-speedorder").on('click',function(){
				 
				var notEmpty = 0;
			    $('.speedorderkeyword').each(function(){
			       if(this.value != "") {
			    	   notEmpty = 1;
			       }
			    })
			    var dropdown = document.getElementById("org-select");
			    var selectedValue = dropdown.options[dropdown.selectedIndex] ? dropdown.options[dropdown.selectedIndex].value : null;

			    if (selectedValue == "0") {
			    	var msgText= "<spring:message code='label.select.brand'/>";
        			$("#confirmationWindow .dialog-content").html(msgText);
        			$("#confirmationWindow").show();
			    }
			    else if(notEmpty == 0){
			    	//$('#showInvalidMsg').show();
			    	//alert('Please add Part Number');
			    	//$("#append-to-cart-speedorder").removeClass("not-active");
			    	var msgText= "<spring:message javaScriptEscape="true" code='message.enter.item.part'/>";
        			$("#confirmationWindow .dialog-content").html(msgText);
        			$("#confirmationWindow").show();
			    }else{
			    	//$('#showInvalidMsg').hide();
			    	var propOrganizationId = $('#org-select option:selected').val(); 
					jsonObj = [];
					$('.speedorderkeyword').each(function(){
							var propInputId = $(this).attr('id');
							var partID = $(this).attr('data-attr');
							
					        var textVal = $(this).val();
					        
					        
					        if((textVal != '') && !($(this).hasClass("not-active"))){
						        	var propQuantity = $(this).next('.spinner-control').children('.total-items').val();
						        	var arr = textVal.split(',');
						        	
						        	var propPartNumber = arr[0]; 
						        	var propDescription = arr[1];
						        	
						        	items = {};
						        	
						        	items ["propPartNumber"] = propPartNumber;
						            items ["propDescription"] = propDescription;
						            items ["propQuantity"] = propQuantity;
						            items ["propAction"] = '';
						            items ["propPartId"] = partID;
						            items ["propOrganizationId"] = propOrganizationId;
						            items ["propInputId"] = propInputId;
						        	
						            jsonObj.push(items);
				        	}
					});
					  
						  
					if(jsonObj!=null){
						//alert('jason nt null');
						$('.pageLoader').show();
						 $.ajax({  
							 type : "POST",
					 	     url : "speedorderdataAddToCart",
					 	     data : {itemDetails:JSON.stringify(jsonObj)} ,
							     success : function(data) { 
							    	
							    	 //To update the Status in spped Order Page
									var newString = data.replace(/'/g, '"');
									var finalString = newString.replace(/}{/g, '},{');
									var obj = JSON.parse(finalString);
							    	 $.each( obj, function( key, value ) {
							    		 
							    		  if(value.status == 'success'){
							    			  $(".speedorder-list input[id='"+value.inputId+"']").parent().siblings().html( $("#speedorder-success-tmpl").html());
							    			  $(".speedorder-list input[id='"+value.inputId+"']").addClass("not-active");
							    			  $(".speedorder-list input[id='"+value.inputId+"']").parent().parent().addClass("not-active");
							    			  $(".speedorder-list input[id='"+value.inputId+"']").parent().parent().css("font-weight", "700");
							    		  }
							    		  
							    		  if(value.status == 'failure'){
							    			  $(".speedorder-list input[id='"+value.inputId+"']").parent().siblings().html( $("#speedorder-failure-tmpl").html());
							    			  //$('.pageLoader').hide();
							    		  }
							    		  if(value.status == 'nonorderable'){
							    			  $(".speedorder-list input[id='"+value.inputId+"']").parent().siblings().html( $("#speedorder-nonorderable-tmpl").html());
							 
							    		  }
							    		  
						    		});	
						    		
									 $('.pageLoader').hide();
									 getShoppingCartCount();
							    	 /* $("body").css("overflow", "auto");
							    	 $(".cart-popover").css({"opacity": 1});
							    	 $(".cart-popover").show().stop().fadeOut(5000);
							    	  $(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
											$(this).css("text-decoration","none");
										});   */
							     },
							     error : function(e) {    
							    	alert('failure'+e);
									$('.pageLoader').hide();
						 	     } 
						 });
					}
					else{
						alert('json is null');
					}
			    }

				 
				
 
				});			 
				 
		});
		$(document).ready(function () {
		    $("#instruction").click(function () {
		        $("li", this).toggle();
		        $("li", this).removeClass('hidden');
		        if($('#arrow-down').hasClass("fa-arrow-down")){  
		        	 
		        	$('#arrow-down').removeClass("fa-arrow-down").addClass("fa-arrow-right"); 
		        }
		        else{
		        	$('#arrow-down').removeClass("fa-arrow-right").addClass("fa-arrow-down");  
		        }
		    });
		});
		
	</script>
</body>
</html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<jsp:include page="../googleAnalytics.jsp" />

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
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/less"
	href="../css/bootstrap-multiselect.css?version=${properties['application.version']}">
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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- Plugin to load properties from javascript file -->
<script type="text/javascript"
	src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer></script>
<style type="text/css">
.borwrap {
	border: 1px solid #ccc
}

.clearStyle {
	float: right;
	display: inline-block;
	margin-top: 24px
}

.marginT5 {
	margin-top: 5px;
}

@media ( min-width :300px) and (max-width:767px) {
	.xs-position {
		padding: 6px 0px 0px 0px;
	}
	.xs-pd-5 {
		padding: 5px;
	}
	.xs-goBtn {
		margin-top: 29px;
	}
	.calendarIcon {
		background-position-x: right;
		background-position-y: 6px;
	}
}

@media ( min-width :768px) {
	.xs-position {
		padding: 0px 0px 10px 0px;
	}
	.xs-pd-5 {
		padding: 0px 0px 10px 0px;
	}
	.xs-goBtn {
		margin-top: 3px;
	}
}
</style>
<sec:authorize access="hasRole('ROLE_DEALER_USER')" var="isDealerUser"></sec:authorize>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<div id="header-wrapper">
					<%@ include file="../../jsp/header.jsp"%>
				</div>
			</header>
			<div class="breadcrumbs-list responsive-padding fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<c:if test="${true == chooseBrand}">
						<li><a href="historicalorderbrand"><spring:message
									code="label.brand.choose" /> - <h10 class="orgTitle"></h10></a></li>
					</c:if>
					<li class="active"><spring:message code="label.header.order" /></li>
				</ul>
			</div>
			<!-- <script type="text/javascript">$('header').load('header.html')</script> -->
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<!--- This is for Breadcrumbs -->

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad0">
					<h3 class="orgTitle"></h3>
				</div>

				<div
					class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<c:choose>
						<c:when test="${isDealerUser == false}">
							<div
								class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
								<label for="customer-no" class="control-label column-paddings"><spring:message
										code="label.quote.order.customer" /></label>
								<div
									class="customerOrderList input-group col-lg-8 col-md-8 col-sm-8 col-xs-11">
									<input type="text" id="customer-no"
										class="form-control ui-autocomplete-input" /> <input
										type="hidden" id="customerVal" class="form-control" />
								</div>
								<a class="help-button customerOrderList" data-placement="left"
									data-toggle="tooltip" href="javascript:;"
									data-original-title="<spring:message code="label.order.customer.message" />">?</a>
							</div>
						</c:when>
						<c:otherwise>
							<div
								class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings">
								<div
									class="form-inline col-lg-12 col-md-4 col-sm-6 col-xs-12 column-paddings">
									<label class="control-label column-paddings"> <spring:message code="label.dealer.name" /></label>
									<div
									class="input-group col-lg-8 col-md-8 col-sm-8 col-xs-11">
									 <input type="text" class="form-control" readOnly
										id="customer-no"/>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					
					<div
						class="form-inline col-lg-8 col-md-8 col-sm-6 col-xs-12 column-paddings">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<label for="customer-no" class="control-label required"><spring:message
									code="label.quote.order.fromdate" /></label> <input type="text"
								id="fromdate" class="form-control calendarIcon" placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)'/>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<label for="customer-no" class="control-label required"><spring:message
									code="label.quote.order.todate" /></label> <input type="text"
								id="todate" class="form-control calendarIcon" placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)'/>
						</div>
						<!-- <div
						class="col-lg-2 col-md-2 col-sm-1 col-xs-1 column-paddings xs-position">
						<input class="btn btn-default btn-md goBtn xs-goBtn" type="button"
							onclick="orderList()">
						</div>-->
					</div>
				</div>
				<div class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<!-- Start  PO & Status -->
					<c:if test="${not isRetailUser}">
					<div
						class="col-lg-4 col-md-6 col-sm-6 col-xs-12 column-paddings">
						<label for="customer-no" class="control-label"><spring:message code="view.label.po.number" /></label> <input 
							type="text" class="form-control clearable" id="poNumber" style="width: 63%;"/>
					</div>
					</c:if>
					<div class="col-lg-8 col-md-4 col-sm-4 col-xs-12 column-paddings">
						<div class="col-xs-12 col-md-2 col-sm-3 col-lg-1" style="padding: 0px;">
							<label for="customer-no" class="control-label required" >Status</label>

						</div>
						<!-- Start : Added By : Harish Bakale, GSP-1153, Reviewed By: JK -->
						<div class="col-xs-12 col-md-2 col-sm-8 col-lg-8 smnopadding">
							 <select class="form-control" id="orderStatus"
												name="orderStatus" multiple="multiple">
												<!-- <option>----- Select ------</option> -->
												<c:forEach items="${allStatuses}" var="allStatuses">
													<option value="${allStatuses.cartStatusId}">${allStatuses.cartStatusValue}</option>
												</c:forEach>
							</select>
							
							<!-- End : Added By : Harish Bakale, GSP-1153, Reviewed By: JK -->
							<!-- Venkatasiva Added -->
							<input id="gobtnxs" class="btn btn-default btn-md goBtn xs-goBtn" type="button" 
							onclick="orderList()">
							<script type="text/javascript">
						$(function() {
							$('#orderStatus').multiselect({
								allSelectedText: 'All',
								includeSelectAllOption: true,
								selectAllNumber: false,
								nonSelectedText: 'Select order status',
								buttonWidth: 200
							});
							$("#orderStatus").multiselect('selectAll', false);
							$("#orderStatus").multiselect('updateButtonText');
						});
						
					</script>
						</div>
					</div>
					
					
					<!-- END  PO & Status -->
					<!--  GSP-1153 : Venkatasiva
					<div class="col-lg-2 col-md-2 col-sm-1 col-xs-1 column-paddings xs-position col-xs-offset-3 col-sm-offset-0 col-md-offset-0 col-lg-offset-0">
						<input class="btn btn-default btn-md goBtn xs-goBtn" type="button"
							onclick="orderList()">
					</div>
					-->
				</div>
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 responsive-padding borwrap">
					<h3 class="marbtm0">
						<spring:message code="lable.order.orders" />
						&nbsp;(<span id="count"></span>)
					</h3>
					<div
						class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
						<table id="order-list" class="table display table-striped"
							cellspacing="0" style="width: 100%; word-wrap:break-word;">
							<thead>
								<tr>
									<th><spring:message code="lable.order.orderNumber" /></th>
									<th><spring:message code="lable.reference" /></th>
									<%--   <th><spring:message code="lable.customerName"/></th>
                                <th><spring:message code="lable.brand"/></th> --%>
									<th><spring:message code="view.label.po.number" /></th>
									<th><spring:message code="lable.order.orderDate" /></th>
									<th><spring:message code="lable.status" /></th>
									<th><spring:message code="lable.action" /></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>


			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content" >
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
							<a class="col btn cancel" href="javascript:;"><spring:message
									code="label.bulkpartupload.cancel" /></a> <a
					class="col btn ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal bs-example-modal-md" id="reOrderConfirmationWindow" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content" >
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content" ></p>
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
			<div class="modal bs-example-modal-md"
				id="reOrderConfirmationWindowForZeroItem">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content" style="">
						<div class="modal-header custom-modal-header">
							<!-- <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true">×</button> -->
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body"
							style="padding: 21px 15px 44px;">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content" style="height: 30px; margin-bottom: 0;"></p>
						</div>
						<div class="modal-footer">
							<a class="btn btn-addtocart add pull-right ok" href="javascript:;"><spring:message
									code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal bs-example-modal-md" id="reorderProcessConfirmationWindow" data-backdrop="static" data-keyboard="false">
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
							<p class="dialog-content" >
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
			<footer>
				<%@ include file="../../jsp/footer.jsp"%>
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
	</div>
	<sec:authorize access="hasRole('ROLE_RETAIL_CUSTOMER')"
		var="isRetailUser"></sec:authorize>
	<!-- Javascript Library-->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<!-- Js library plugin -->
	<script type="text/javascript"
		src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer></script>
	<!-- Javascript Plugins -->
	<%-- <script
		src="../js/jquery-ui.min.js?version=${properties['application.version']}"
		type="text/javascript"></script> --%>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/errorHandler.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/jquery.dataTables.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/dataTables.bootstrap.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/dataTables.responsive.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/bootstrap-multiselect.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script type="text/javascript">
		function dateFormat(d) {
			//START INC-1288 - FIX BY RAJESH
			var date = new Date(d);
			var dd = date.getDate();
			var mm = date.getMonth() + 1; //January is 0!
			var yyyy = date.getFullYear();
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = mm + '/' + dd + '/' + yyyy;
			return today;
			//END INC-1288 - FIX BY RAJESH
		}
		var childcartId;
		var myErrObj = new errnsp.errHandling.init();
		$(document)
				.ready(
						function() {
							$('div.pageLoader').show();
							var customerReference = null;
							var selectedOrganization = null;
							var selectedOrgName = null;
							var fromDate = new Date();
							var toDate = new Date();
							var customerName = null;
							var chooseBrand = null;
							//Historical order list from Breadcrumbs							//Venkatasiva :ponumber required for product but not required for rev
							/* var poNumber = null ;//$('#poNumber').val();
							var orderStatusSelectedArray = null;// $('#orderStatus').val();
							var orderStatusSelected = null;
							if (null != orderStatusSelectedArray) {
								orderStatusSelected = orderStatusSelectedArray
										.join();
							} */
							
							
							var poNumber = $('#poNumber').val() ; 
							if(poNumber == undefined){
								poNumber = null;
							}else{
								poNumber = $('#poNumber').val(); 
							}
							
							//var orderStatusSelectedArray = null;  
							
							var orderStatusSelectedArray = $('#orderStatus').val();
							var orderStatusSelected = null;
						
							 if (null != orderStatusSelectedArray) {
								orderStatusSelected = orderStatusSelectedArray.join();
								orderStatusSelected = orderStatusSelectedArray.join(); 
							 }else{
								 var orderSelected = $('.multiselect-selected-text').text();
								 if(orderSelected == "Select order status"){
									 orderStatusSelected = "0";
								 }
							 }
							
							//Venkatasiva End :ponumber required for product but not required for rev							
							
							var val_breadCrum = '${getOrderList}';
							if (typeof val_breadCrum != "undefined"
									&& val_breadCrum != '') {
								var today = new Date();
								//START INC-1288 - FIX BY RAJESH
								var json_breadCrum = JSON.parse(val_breadCrum);
								//console.log('val_breadCrum'+val_breadCrum+"------"+json);
								//console.log(json.customerReference);
								customerReference = json_breadCrum.customerReference;
								selectedOrganization = json_breadCrum.organizationId;
								selectedOrgName = json_breadCrum.organizationName;
								if(json_breadCrum.fDate != undefined && json_breadCrum.fDate != ""){
									fromDate = json_breadCrum.fDate; 
								}else{
									var priorDate = new Date().setDate(today
											.getDate() - 180);
									var priorDateFormat = new Date(priorDate);
									fromDate = dateFormat(priorDateFormat
											.toISOString().substring(0, 10));
								}
								// '${fromDate}';
								//START INC-1288 - FIX BY RAJESH Order confimration page to Order List Flow
								//toDate=json_breadCrum.tDate;  //'${toDate}';
								toDate = dateFormat(today);
								//END INC-1288 - FIX BY RAJESH Order confimration page to Order List Flow
								customerName = json_breadCrum.customerName;
								chooseBrand = '${chooseBrand}';
								$('#customer-no').val(
										customerReference + " - "
												+ customerName);
								//console.log(cust);
							} else {

								console.log('inside else' + val_breadCrum);
								var today = new Date();
								var priorDate = new Date().setDate(today
										.getDate() - 180);
								var priorDateFormat = new Date(priorDate);
								customerReference = json["customer"].customerReference;
								selectedOrganization = json.organizationDetailList[0].organizationId;
								selectedOrgName = json.organizationDetailList[0].organizationName;
								fromDate = dateFormat(priorDateFormat
										.toISOString().substring(0, 10)); // '${fromDate}';
								//START INC-1288 - FIX BY RAJESH
								//toDate=dateFormat(today.toISOString().substring(0, 10));  //'${toDate}';
								toDate = dateFormat(today);
								//END INC-1288 - FIX BY RAJESH
								chooseBrand = '${chooseBrand}';
							}
							$('.orgTitle').text(selectedOrgName);
							
							
							//Added by Pushpa for customer performance improvements
					     	   getCustomerDropdown(selectedOrganization);
					     	   

							var table = $('#order-list')
									.on('xhr.dt', function(e, settings, json) {
										$('div.pageLoader').hide();
										$('#count').text(json.data.length)
									})
									.DataTable(
											{
												//"scrollY" : "600px",
												//"scrollCollapse" : true,
												"columnDefs" : [ {
													"orderable" : false,
													"targets" : 5
												} ],
												"order" : [ [ 0, "desc" ] ],
												"pagingType" : "full_numbers",
												"language" : {
													processing : "<spring:message code='label.processing'/>...",
													lengthMenu : "<spring:message code='search.resultsperpage'/> _MENU_",
													search : "<span class='alignSearch'><spring:message code='label.whereused.search'/><br/></span>",
													loadingRecords : "<spring:message code='label.footer.loading'/>...",
													zeroRecords : "<spring:message code='label.catalogweb.record.not.found'/>",
													emptyTable : "<spring:message code='label.results.nodata'/>",
													paginate : {
														first : "<spring:message code='label.pagnation.first'/>",
														previous : "<spring:message code='label.pagnation.prev'/>",
														next : "<spring:message code='label.pagnation.next'/>",
														last : "<spring:message code='label.pagnation.last'/>"
													},
												},

												"ajax" : {

													'url' : 'gethistoricalordersdetails',
													/*  'url': "gethistoricalordersdetails?customerId="+ui.item.value+"&selectedOrganization="+selectedOrganization
													 +"&fromDate="+fromDate+"&toDate="+toDate, */
													// 'url': 'getordersdetails',
													'data' : {
														customerReference : customerReference,
														selectedOrganization : selectedOrganization,
														selectedOrgName : selectedOrgName,
														fromDate : fromDate,
														toDate : toDate,
														chooseBrand : chooseBrand,
														poNumber : poNumber,
														orderStatusSelected : orderStatusSelected
													},

													'error' : function(jqxhr,
															textStatus, error) {
														$(".pageLoader").hide();
														var loading = $(
																".dataTables_empty")
																.text();
														if (loading == 'Loading...') {
															$(
																	".dataTables_empty")
																	.text("");
														}
														var err = jqxhr.status;
														var msg = jqxhr.responseText;

														console
																.log("Request Failed: "
																		+ err);
														console
																.log("Request Failed: "
																		+ jqxhr.responseText);

														myErrObj
																.raise(err,
																		msg,
																		textStatus);
													}
												},

											});

							//07-06-2017: hiding PO Number column for retail user. Added by Pooja.H.S & Reviewd by
							var oTable = $('#order-list').dataTable().api();
							var isRetail = ${isRetailUser};
							if (isRetail) {
							
								oTable
										.column(
												$(
														'th:contains("<spring:message code="view.label.po.number"/>")')
														.index())
										.visible(false);
							}
							table
									.on(
											'init.dt',
											function() {
												$('#order-list_filter')
														.prepend(
																"<!--<div class='dateSelector'><span style='float : left; margin-left: 5px;'><spring:message code='lable.order.orderDateFrom'/></span><br>  <input class='calendar_icon' type='text'  id='from-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="
																		+ fromDate
																		+ ">  </div>&nbsp;&nbsp;<div><span style='float : left; margin-left: 5px;'><spring:message code='lable.to'/></span><br> <input class='calendar_icon' type='text' id='to-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="
																		+ toDate
																		+ "> </div> <input class='btn btn-default btn-md lesspadding goButton' type='button' onclick='search()'/> --> <input class='btn btn-default btn-md lesspadding clearFilter clearStyle' type='button' onclick='clearFilter()'/> &nbsp;&nbsp;");
												$("#from-datepicker")
														.datepicker(
																{
																	changeMonth : true,
																	changeYear : true,
																	defaultDate : "0",
																	maxDate : "0",
																	onClose : function(
																			selectedDate) {
																		if (selectedDate)
																			$(
																					"#to-datepicker")
																					.datepicker(
																							"option",
																							"minDate",
																							selectedDate);
																	}
																});
												$("#to-datepicker")
														.datepicker(
																{
																	changeMonth : true,
																	changeYear : true,
																	defaultDate : "0",
																	maxDate : "0",
																	onClose : function(
																			selectedDate) {
																		if (selectedDate)
																			$(
																					"#from-datepicker")
																					.datepicker(
																							"option",
																							"maxDate",
																							selectedDate);
																	}
																});
											});
							//$('#order-list_length').css({"display":"none"});
							$('#order-list tbody').on(
									'click',
									'a.icon-delete',
									function() {
										table.row($(this).parents('tr'))
												.remove().draw();
									});

							console.log('Dateee' + fromDate + ' ,' + toDate);

							//Venkatasiva GPD-817: FromDate ToDate Validation
							$("#fromdate")
														.datepicker(
																{
																	dateFormat : 'mm/dd/yy',
																	changeMonth : true,
																	changeYear : true,
																	defaultDate : "0",
																	maxDate : "0",
																	onClose : function(
																			selectedDate) {
																		if (selectedDate)
																			$(
																					"#todate")
																					.datepicker(
																							"option",
																							"minDate",
																							selectedDate);
																	}
																});
												$("#todate")
														.datepicker(
																{
																	dateFormat : 'mm/dd/yy',
																	changeMonth : true,
																	changeYear : true,
																	defaultDate : "0",
																	maxDate : "0",
																	onClose : function(
																			selectedDate) {
																		if (selectedDate)
																			$(
																					"#fromdate")
																					.datepicker(
																							"option",
																							"maxDate",
																							selectedDate);
																	}
																});
												$('#fromdate').val(fromDate);
												$('#todate').val(toDate); 
												//Venkatasiva End						
							
							$('.dropdown-menu').css({'width':'fit-content','height': '165px','overflow-y': 'auto'});	
							
						});
		
		//Added by Pushpa for customer performance improvements
			var validCustomerNumber;
			var customerLoaded;
		  function getCustomerDropdown(orgId){
				$.ajax({
		         	    type: "GET",
		         	    url: "customerforOrganization",
		         	    data: {selectedOrganization:orgId},
		         	    success: function(data){
		         	   	profileVoObj = JSON.parse(data);
		         	   	console.log("Customer Lite :"+profileVoObj);
		         	   	var string = [];
						$.each(profileVoObj.CustomerLiteForUserOrg,function(index,item){
							//customerString.push(item.customerReference+'-'+item.customerName);
							//$("#tags").val(item.customerReference+'-'+item.customerName);
						 	var items = {};
							items["label"] = item.customerReference + ' - '
									+ item.customerName;
							items["value"] = item.customerId;  
							string.push(items);
							
						});
						$( "#customer-no" ).autocomplete({
									minLength: 2,
									source : function (request, response) {
											var results = $.ui.autocomplete.filter(string, request.term);
											response(results.slice(0, 1000));
										},
									select : function(e, ui) {
										e.preventDefault() // <--- Prevent the value from being inserted.
										onchangeDropDown = true;
										$("#customerVal").val(ui.item.value);
										console.log("Customer Values :"+JSON.stringify(ui.item));
										$("#customer-no").val(ui.item.label);
					                    customerLoaded = true;
					                    validCustomerNumber = true;
									},
									open:function(event) {
								        $('.ui-autocomplete').css({'height':'auto'});
									        var $input = $(event.target),
									            inputTop = $input.offset().top,
									            inputHeight = $input.height(),
									            autocompleteHeight = $('.ui-autocomplete').height(),
									            windowHeight = $(window).height();
								              windowWidth = $(window).width();
								          if(windowWidth >= 768 && windowWidth <992){
								            $('.ui-autocomplete').css("width", 340+'px');
								          }
									        
									        if ((inputHeight + inputTop+ autocompleteHeight) > 430) {
									            $('.ui-autocomplete').css({"height": 430+'px', "position": "fixed"});
									        }
									    },
									focus : function(event, ui) {
										event.preventDefault();
										$("#tags").val(ui.item.label);
									},
									close : function(e) {
										if ($("#customer-no").val() !== "") {
											validCustomerNumber = true;
										}
									}
								});
								    
		         	    },
		         	    error: function(jqxhr, textStatus, error) {
		         	  // 15-01-2015-EH Handling
		                  var err = jqxhr.status;
		                  var msg = jqxhr.responseText;
		                  $(".pageLoader").hide();
		                  myErrObj.raise(err,msg,textStatus);
		         	    }
		         	  });
			} 
	</script>

	<script type="text/javascript">
	var sWidth = $(window).width();
	if (sWidth <= 992) {
		var mql = window.matchMedia("(orientation: portrait)");
		if (mql.matches) {
			// Portrait orientation
			$("#myModal").show();
			$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
			/*alert("This page is best viewed in landscape mode for better usability");*/
		} else {
			// Landscape orientation
			$("#myModal").hide();
			/*alert("Landscape");*/
		}
		mql.addListener(function(m) {
			if (m.matches) {
				// Changed to portrait
				$("#myModal").show();
				$(".custom-modal-body")
				.text(
				"This page is best viewed in landscape mode for better usability");
				/*alert("This page is best viewed in landscape mode for better usability");*/
			} else {
				// Changed to landscape
				$("#myModal").hide();
				/*$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
				alert("Landscape");*/
			}
		});
	}
		function search() {
			var fromDate = document.getElementById('from-datepicker').value;
			var toDate = document.getElementById('to-datepicker').value;
			if (fromDate == "" || toDate == "") {
				$('.modal-body')
						.text(
								"<spring:message code='label.myquote.select.date' javaScriptEscape='true'/>");
				$("#myModal").show();
				return false;
			} else {
				var tmp  =new Date(fromDate); 
	    		
	    		var tmp1 = new Date(toDate);
	    		tmp1.setMonth(tmp1.getMonth() - 3);
	    		
	    		var timeDiff = Math.abs(tmp.getTime() - tmp1.getTime());
	    		var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
	    		 if(tmp >= tmp1) {
	 				document.location.href = "gethistoricalordersdetails?fromDate="
						+ fromDate + "&toDate=" + toDate;
	    		 }else{
	    			 $('.modal-body').text('<spring:message code="historical.order.date.message"/>');
	 				$("#myModal").show();
	 	    		return false;
	    		 }

			}

		}
		function isValidateDate(date) {
			var date_regex = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/;
			if (!(date_regex.test(date.value))) {
				$('.modal-body')
						.text(
								'<spring:message code='lable.dateIncorrect' javaScriptEscape='true'/>')
				$("#myModal").show();
				document.getElementById(date.id).value = '';
				return false;
			}
			//return true;
		}
		function clearFilter() {
			//table.ajax.reload();
			location.reload();

		}

		$(".custom-close").click(function() {
			$("#myModal").hide();
		});

		function reorderClick(orderNo, orderCompany, orderType, organizationId,
				orderBrand) {
			var paslsGetData = {
				"orderNumber" : orderNo,
				"orderCompany" : orderCompany,
				"orderType" : orderType,
				"orgCode" : organizationId,
				"orgName" : orderBrand
			};
			$("#reorderProcessConfirmationWindow").show();
			$("#reorderProcessConfirmationWindow").draggable({
				handle : ".modal-header"

			});
			$('.modal-footer a:first-child').focus();
			console.log("paslsGetData>>> ");
			console.log(paslsGetData);
			$("#reorderProcessConfirmationWindow .ok")
					.click(
							function() {
								$('div.pageLoader').show();
								$("#reorderProcessConfirmationWindow").hide();
								$
										.ajax({
											type : "Get",
											//data : passGetData,
											contentType : 'application/json',
											//url : "findItemCount",
											url : "getOrdersItemList?orderNumber="
													+ orderNo
													+ "&orderCompany="
													+ orderCompany
													+ "&orderType=" + orderType
													+ "&orgCode="
													+ organizationId
													+ "&orgName=" + orderBrand,
											success : function(response) {
												//$('div.pageLoader').hide();
												if (response) {
													var responseData = (JSON
															.parse(response));
													if (responseData.data.itemList.length == responseData.data.itemCnt) {
														console
																.log(responseData.data.itemList);
														callReordering(
																responseData.data.orderNumber,
																responseData.data);
													} else if (responseData.data.itemList.length != responseData.data.itemCnt) {
														if (responseData.data.itemCnt == 0) {
															$('div.pageLoader')
																	.hide();
															var msgText = "No Orderable Items available to Reorder.";
															$(
																	"#reOrderConfirmationWindowForZeroItem .dialog-content")
																	.html(
																			msgText);
															$(
																	"#reOrderConfirmationWindowForZeroItem")
																	.show();
														} else if (responseData.data.itemCnt != 0) {
															$('div.pageLoader')
																	.hide();
															$(
																	"#reOrderConfirmationWindow")
																	.data(
																			"reorderNo",
																			responseData.data.orderNumber);
															$(
																	"#reOrderConfirmationWindow")
																	.data(
																			"object",
																			responseData.data);
															var msgText = "You have "
																	+ responseData.data.itemCnt
																	+ " Items available against "
																	+ responseData.data.itemList.length
																	+ " Items selected in the Order, Do you want to still proceed?";
															$(
																	"#reOrderConfirmationWindow .dialog-content")
																	.html(
																			msgText);
															$(
																	"#reOrderConfirmationWindow")
																	.show();
														}
													}
												}
											}
										});
							});
			/* $('.modal-body').text("<spring:message code='label.replace.cart' javaScriptEscape='true'/>")
			$("#confirmationWindow").show();
			$("#confirmationWindow").draggable({
			    handle: ".modal-header"

			}); */
			$('.modal-footer a:first-child').focus();
		};

		$(".cancel")
				.click(
						function() {
							$(
									"#confirmationWindow, #reOrderConfirmationWindow, #reorderProcessConfirmationWindow")
									.hide();
							return false;
						});

		$("#reOrderConfirmationWindowForZeroItem .ok").click(function() {
			$("#reOrderConfirmationWindowForZeroItem").hide();
			return false;
		});

		$("#confirmationWindow .ok")
				.click(
						function() {
							$("#confirmationWindow").hide();
							$('div.pageLoader').show();
							$
									.ajax({
										type : "Get",
										data : {
											childCartId : childcartId
										},
										contentType : 'application/json',
										mimeType : 'application/json',
										url : "reorder",
										success : function(response) {
											if (response) {
												//Changed by Rajesh to fix GS-2625
												/*getShoppingCartCount();
												$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.success' javaScriptEscape='true'/>")
												$("#myModal").show();
												$("#myModal").draggable({
												    handle: ".modal-header"
												});*/

												window.location.href = "getshoppingdetails?reOrder=true";
											} else {
												$(
														'.modal-body.custom-modal-body')
														.text(
																"<spring:message code='label.viewquote.cart.fail' javaScriptEscape='true'/>")
												$("#myModal").show();
												$("#myModal").draggable({
													handle : ".modal-header"
												});
											}
											$('div.pageLoader').hide();
										},
										error : function(e) {
											$('div.pageLoader').hide();
										}
									});

						});

		$("#reOrderConfirmationWindow .ok").click(
				function() {
					$("#reOrderConfirmationWindow").hide();
					$('div.pageLoader').show();
					callReordering($("#reOrderConfirmationWindow").data(
							"reorderNo"), $("#reOrderConfirmationWindow").data(
							"object"));
				});

		var callReordering = function(orderNo, object) {
			var organizationId = object.organizationId;
			var iteration = object.itemList;
			var organizationName = object.organizationName;
			var dataItemVal = null;

			//$('div.pageLoader').show();
			$
					.ajax({
						type : "POST",
						//data : {orderNumber:orderNo, partNumber:partNumber, organizationName:JSON.stringify(organizationName), itmQty:itmQty, organizationId:JSON.stringify(organizationId)},
						//contentType: 'application/json',
						//mimeType: 'application/json',
						data : {
							"orderNumber" : orderNo,
							"organizationName" : JSON
									.stringify(organizationName),
							"organizationId" : organizationId,
							"dataItemVal" : JSON.stringify(dataItemVal),
							"objectRef" : JSON.stringify(iteration)
						},
						url : "hopreorder",
						success : function(response) {
							if (response) {
								window.location.href = "getshoppingdetails?reOrder=true";
							} else {
								$('.modal-body.custom-modal-body')
										.text(
												"<spring:message code='label.viewquote.cart.fail' javaScriptEscape='true'/>")
								$("#myModal").show();
								$("#myModal").draggable({
									handle : ".modal-header"
								});
							}
							$('div.pageLoader').hide();
						},
						error : function(e) {
							$('div.pageLoader').hide();
						}
					});
		};

		$(document)
				.ready(
						function() {
							$('div.pageLoader').show();
							$("input[aria-controls='order-list']")
									.parent("div")
									.children('input')
									.attr("placeholder",
											"<spring:message code='label.whereused.search'/>");
							$('#order-list_wrapper input[type="search"]')
							.parent().css({
								"text-align" : "left"
							})
							.find("input[aria-controls='order-list']")
							.addClass('xsSearchbox');
							$('#order-list_wrapper input[type="search"]')
									.parent().css({
										"text-align" : "left"
									})
									.find("input[aria-controls='order-list']")
									.css({
										"width" : "240px"
									});
							$("#order-list_length").css("margin-top", "20px");
							/* $("input[aria-controls='order-list']").parent("div").contents().filter(function () {
							     return this.nodeType === 3; 
							     }).remove();
							   $("input[aria-controls='order-list']").parent("div").prepend("<spring:message code='label.whereused.search'/>");
							   $("td.dataTables_empty:contains('No data available in table')").text("").append("<p><spring:message code='label.results.nodata'/></p>");
							  $("td.dataTables_empty:contains('No matching records found')").text("").append("<p><spring:message code='label.catalogweb.record.not.found'/></p>");*/
							// run test on initial page load
							checkSize();
							$(document).on('click',
									'#order-list tbody tr td:first-child a',
									function() {
										$('div.pageLoader').show();
									});
							// run test on resize of the window
							$(window).resize(checkSize);

						});

		//Function to the css rule
		function checkSize() {
			if ($(window).width() <= 1024) {
				$("#order-list_wrapper .row .col-sm-3").css("display", "none");
				$("#order-list_wrapper .row .col-sm-9").removeClass("col-sm-9")
						.addClass("col-sm-12");
				$("#order-list_wrapper").children().eq(2).children().first()
						.removeClass('col-sm-6').addClass('col-sm-4')
						.siblings().removeClass('col-sm-6')
						.addClass('col-sm-8');
			}
			if ($(window).width() >= 1025) {
				$("#order-list").removeClass("table-responsive");
			}
		}

		var val = '${userProfileDetails}';
		var json = JSON.parse(val);

		/*--Customer List Auto Complete*/
		var defaultCustomer = "";
		defaultCustomer = json["customer"].customerReference + " - "
		+ json["customer"].customerName;
		$('#customerVal').val(json["customer"].customerId);
		if (defaultCustomer.trim() != "") {
			// Set Default Customer    
			$('#customer-no').val(
					json["customer"].customerReference + " - "
							+ json["customer"].customerName);
		}

		// this variable is for customer number autocomplete validation
		$("#customer-no").on(
				'change',
				function(e) {
					if (customerLoaded == true) {
						if (typeof validCustomerNumber == 'undefined') {
							$(this).val("");
						}else if (!validCustomerNumber) {
							$(this).val("");
						}
					}
				});

		function orderList() {

			
			var myErrObj = new errnsp.errHandling.init();
			var selectedOrganization = json.organizationDetailList[0].organizationId;
			var selectedOrgName = json.organizationDetailList[0].organizationName;
			var customerValue = $('#customer-no').val();
			var customerReference = customerValue.split("-")[0];
			var fromDate = document.getElementById('fromdate').value;
			var toDate = document.getElementById('todate').value;		
			
			//Venkatasiva GPD-817: FromDate ToDate Validation
			  if(fromDate==""||toDate==""){		         
		          $('.modal-body').text("<spring:message code='label.myquote.select.date' javaScriptEscape='true'/>");
		        $("#myModal").show();
		                $("#myModal").draggable({
		                    handle: ".modal-header"
		                });
		          return false;
		          
		        }else{
		        	$('div.pageLoader').show();
		        	var chooseBrand = '${chooseBrand}';
					var poNumber = $('#poNumber').val() ; 
					if(poNumber == undefined){
						poNumber = null;
					}else{
						poNumber = $('#poNumber').val(); 
					}
					
					//var orderStatusSelectedArray = null;  
					
					var orderStatusSelectedArray = $('#orderStatus').val();
					var orderStatusSelected = null;
					//commented for NREV-1752
					 if (null != orderStatusSelectedArray) {
						orderStatusSelected = orderStatusSelectedArray.join();
						orderStatusSelected = orderStatusSelectedArray.join(); 
					 }else{
						 var orderSelected = $('.multiselect-selected-text').text();
						 if(orderSelected == "Select order status"){
							 orderStatusSelected = "0";
						 }
					 }
						
						$.ajax({
							method : "GET",
							url : 'gethistoricalordersdetails',
							data : {
								customerReference : customerReference,
								selectedOrganization : selectedOrganization,
								selectedOrgName : selectedOrgName,
								fromDate : fromDate,
								toDate : toDate,
								chooseBrand : chooseBrand,
								poNumber : poNumber,
								orderStatusSelected : orderStatusSelected
							},
							'error' : function(jqxhr, textStatus, error) {
								$(".pageLoader").hide();
								var loading = $(".dataTables_empty").text();
								if (loading == 'Loading...') {
									$(".dataTables_empty").text("");
								}
								var err = jqxhr.status;
								var msg = jqxhr.responseText;

								console.log("Request Failed: " + err);
								console.log("Request Failed: " + jqxhr.responseText);

								myErrObj.raise(err, msg, textStatus);
							},
							dataType : "json",
							success : function(response) {

								var orderList = $("#order-list").DataTable();
								orderList.clear();
								console.log('new response' + response.data);
								orderList.rows.add(response.data).draw();

								$('div.pageLoader').hide();
								$('#count').text(response.data.length);
							}
						});
		        }
			
			
			
			
			
			
			//commented for NREV-1752
			/* } else {
				$('.modal-body')
						.text(
								'<spring:message code='lable.selectorderstatus' javaScriptEscape='true'/>');
				$('div.pageLoader').hide();
				$("#myModal").show();
				return false;
			} */			

		}
			
		
	</script>
</body>

</html>
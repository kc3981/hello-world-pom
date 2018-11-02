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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- Plugin to load properties from javascript file -->
<script type="text/javascript" src="../js/jquery.i18n.properties.js" defer></script>
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
	margin-top: 5px
}
</style>
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
						<li><a href="invoicelistbrand"><spring:message
									code="label.brand.choose" /> - <h10 class="orgTitle"></h10></a></li>
					</c:if>
					<li class="active"><spring:message
							code="label.header.invoicelist" /></li>
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
					<div
						class="form-inline col-lg-4 col-md-4 col-sm-6 col-xs-12 column-paddings marginT5">

						<label for="customer-no"
							class="control-label column-paddings required"><spring:message
								code="label.quote.order.customer" /></label>
						<div class="input-group col-lg-8 col-md-8 col-sm-8 col-xs-10">
							<input type="text" id="customer-no"
								class="form-control ui-autocomplete-input" /> <input
								type="hidden" id="customerVal" class="form-control" />
						</div>
						<a class="help-button rev-help-button" data-placement="left"
							data-toggle="tooltip" href="javascript:;"
							data-original-title="<spring:message code="label.order.customer.message" />"
							>?</a>
					</div>
					<div
						class="form-inline col-lg-8 col-md-8 col-sm-8 col-xs-12 column-paddings">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
							<label for="customer-no" class="control-label required">From</label>
							<input type="text" id="fromdate"
								class="form-control calendarIcon" />
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
							<label for="customer-no" class="control-label required">To</label>
							<input type="text" id="todate" class="form-control calendarIcon" />
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 column-paddings">
							<input class="btn btn-default btn-md goBtn" type="button"
								onclick="orderList()">
						</div>
					</div>
				</div>

				<hr />


				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 responsive-padding borwrap">
					<%-- <h3 class="marbtm0"><spring:message code="label.header.invoicelist"/>&nbsp;(<span id="count"></span>)</h3> --%>
					<div
						class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
						<table id="order-list" class="table display table-striped"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th><spring:message code="lable.header.invoicenumber" /></th>
									<th><spring:message code="lable.header.invoicedate" /></th>
									<th><spring:message code="lable.header.invoicetotal" /></th>
									<th><spring:message code="lable.customerName" /></th>
									<th><spring:message code="lable.brand" /></th>

									<%-- <th><spring:message code="lable.status"/></th>  --%>
									<th><input type="checkbox" id="select_all"> Select
										all</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>


			<!-- custome alert -->
			<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
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

			<!-- custome confirm alert -->
			<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
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
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.cart.confirm" />
							</h4>
						</div>
						<div class="modal-body confirm-modal-body">
							<!-- Content for the dialog / modal goes here. -->
							<p class="dialog-content"></p>
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
			<div class="modal bs-example-modal-md" id="reOrderConfirmationWindowForZeroItem" data-backdrop="static" data-keyboard="false">
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
							<p class="dialog-content"></p>
						</div>
						<div class="modal-footer">
							<a class="col btn ok" href="javascript:;"><spring:message
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
	<!-- Javascript Library-->
	<%-- <script src="../js/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script> --%>
	<!-- Js library plugin -->
	<script type="text/javascript" src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer></script>
	<!-- Javascript Plugins -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		type="text/javascript"></script>
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

	<script type="text/javascript">
    var customerNumber ;
    function dateFormat(d){
        //START INC-1288 - FIX BY RAJESH
           var date = new Date(d);
           var dd = date.getDate();
           var mm = date.getMonth()+1; //January is 0!
           var yyyy = date.getFullYear();
           if(dd<10) {
               dd='0'+dd
           } 
           if(mm<10) {
               mm='0'+mm
           } 
           today = mm+'/'+dd+'/'+yyyy;
           return today;
           //END INC-1288 - FIX BY RAJESH
       }
    var childcartId;
    var  myErrObj = new errnsp.errHandling.init();
    var invoiceArr=[];

        $(document).ready(function(){
        	 $('div.pageLoader').show();
        	var customerReference = null;
       	 	var selectedOrganization = null;
       	 	var selectedOrgName = null;
        	var fromDate=new Date();
 	        var toDate=new Date();
 	       	var customerName = null;
 	       	var chooseBrand = null;
        	 //Historical order list from Breadcrumbs
            
          	var val_breadCrum = '${getOrderList}';
          	if(typeof val_breadCrum!="undefined" && val_breadCrum!=''){
          		var today = new Date();
          		 //START INC-1288 - FIX BY RAJESH
          		var json_breadCrum=JSON.parse(val_breadCrum);
          		customerReference = json_breadCrum.customerReference;
       	 	 	selectedOrganization = json_breadCrum.organizationId;
       	 	 	selectedOrgName = json_breadCrum.organizationName;
        	 	fromDate=json_breadCrum.fDate; // '${fromDate}';
        	 	//START INC-1288 - FIX BY RAJESH Order confimration page to Order List Flow
 	         	//toDate=json_breadCrum.tDate;  //'${toDate}';
 	         	toDate=dateFormat(today);
 	         	//END INC-1288 - FIX BY RAJESH Order confimration page to Order List Flow
 	         	customerName = json_breadCrum.customerName;
 	         	chooseBrand = '${chooseBrand}';
 	         	$('#customer-no').val(customerReference + " - " +customerName);
 	         	//console.log(cust);
          	}else{
              
          		console.log('inside else'+val_breadCrum);
                var today = new Date();
                var priorDate = new Date().setDate(today.getDate()-180);
                var priorDateFormat = new Date(priorDate);
                var customerValue = $('#customer-no').val();
                customerReference = customerValue.substr(0,customerValue.indexOf('-')); //added by Krupa //for NREV-816 
                customerName = customerValue.substr(customerValue.indexOf('-')+1);
                  selectedOrganization = json.organizationDetailList[0].organizationId;
                  selectedOrgName = json.organizationDetailList[0].organizationName;
                 fromDate=dateFormat(priorDateFormat.toISOString().substring(0, 10)); // '${fromDate}';
                  //START INC-1288 - FIX BY RAJESH
                  //toDate=dateFormat(today.toISOString().substring(0, 10));  //'${toDate}';
                 toDate=dateFormat(today);
                 //END INC-1288 - FIX BY RAJESH
                  chooseBrand = '${chooseBrand}';
                 var breadcrumbsArray = '${breadcrumbsArray}';
                 breadcrumbsArray = breadcrumbsArray +',' +$('.breadcrumb').find('li.active').html()+'_'+window.location.href.split("/")[window.location.href.split("/").length - 1];
          	}
 	       $('.orgTitle').text(selectedOrgName);
 	       
 	        
            var table =$('#order-list').on('xhr.dt', function ( e, settings, json ) {
                $('div.pageLoader').hide();
            	$('#count').text(json.data.length)
            } ).DataTable({
                //"scrollY":  "600px",
                //"scrollCollapse": true,
            	"columnDefs": [{ "orderable": false, "targets": 5 , 'checkboxes': {
                    'selectRow': true
                } }],
                    'select': {
                    'style': 'multi'
                 },
                "order": [[ 5, "desc" ]],
                "pagingType": "full_numbers",
                "language": {
                      processing:     "<spring:message code='label.processing'/>...",
                      lengthMenu:    "<spring:message code='search.resultsperpage'/> _MENU_",
                      search:         "<span class='alignSearch'><spring:message code='label.whereused.search'/><br/></span>",
                      loadingRecords: "<spring:message code='label.footer.loading'/>...",
                      zeroRecords:    "<spring:message code='label.catalogweb.record.not.found'/>",
                      emptyTable:     "<spring:message code='label.results.nodata'/>",
                      paginate: {
                          first:      "<spring:message code='label.pagnation.first'/>",
                          previous:   "<spring:message code='label.pagnation.prev'/>",
                          next:       "<spring:message code='label.pagnation.next'/>",
                          last:       "<spring:message code='label.pagnation.last'/>"
                      },
                  },
                  
                  
                                     
                	  "ajax": {
                    	  
                    	  'url': 'getinvoicelistdetails',
                     /*  'url': "gethistoricalordersdetails?customerId="+ui.item.value+"&selectedOrganization="+selectedOrganization
                      +"&fromDate="+fromDate+"&toDate="+toDate, */
                     // 'url': 'getordersdetails',
                      'data':  {customerReference: customerReference,customerName:customerName, selectedOrganization: selectedOrganization, selectedOrgName: selectedOrgName, 
                    	  fromDate: fromDate,toDate: toDate, breadcrumbsArray: breadcrumbsArray}, 
                    	  
                    	 
                      'error': function(jqxhr, textStatus, error){
                      	$(".pageLoader").hide();
                      	var loading = $(".dataTables_empty").text();
                      	if(loading ==  'Loading...'){
                      		$(".dataTables_empty").text("");
                      	}
              			var err = jqxhr.status;
                          var msg = jqxhr.responseText;
                          
                          console.log( "Request Failed: " + err );
                           console.log( "Request Failed: " + jqxhr.responseText );
                           
                           myErrObj.raise(err,msg,textStatus);
              			}
                  }
                  
            
            });
            
          
            
            table.on( 'init.dt', function () {
                $('#order-list_filter').prepend("<!--<div class='dateSelector'><span style='float : left; margin-left: 5px;'><spring:message code='lable.order.orderDateFrom'/></span><br>  <input class='calendar_icon' type='text'  id='from-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="+fromDate+">  </div>&nbsp;&nbsp;<div><span style='float : left; margin-left: 5px;'><spring:message code='lable.to'/></span><br> <input class='calendar_icon' type='text' id='to-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="+toDate+"> </div> <input class='btn btn-default btn-md lesspadding goButton' type='button' onclick='search()'/> --> <input class='btn btn-default btn-md lesspadding clearFilter clearStyle' type='button' onclick='clearFilter()'/><div class='downloadBtn'><a id='downloadPfd'  class='btn-addtocart' href='#' style='height: 32px;border: 1px'><spring:message code='label.invoice.download' javaScriptEscape='true'/></a></div> &nbsp;&nbsp;");
                $( "#from-datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  defaultDate: "0",
                  maxDate: 0,
                  onClose: function( selectedDate ) {
                    if(selectedDate)
                    $( "#to-datepicker" ).datepicker( "option", "minDate", selectedDate );
                  }
                });
                $( "#to-datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  defaultDate: "0",
                  maxDate: 0,
                  onClose: function( selectedDate ) {
                    if(selectedDate)
                    $( "#from-datepicker" ).datepicker( "option", "maxDate", selectedDate );
                  }
                });
            }); 
            
            
           
           
            $('#order-list').on( 'page.dt', function () {
               $('#select_all').prop('checked', false); 
            	
             });
            
            //$('#order-list_length').css({"display":"none"});
            $('#order-list tbody').on( 'click', 'a.icon-delete', function () {
                table.row( $(this).parents('tr') ).remove().draw();
            });
            
            var uniqArr=[];
            function CheckArray(){
            	  uniqArr=[];
            	$('#order-list tbody tr').each(function(){
                 	var checkbox = $(this).find('input[type=checkbox]');
                 	if($(checkbox).is(':checked')){
                 		
                 		var invoicestring = ''+$(this).find('td:first a').html()+'';
                 		invoiceArr.push(invoicestring);
                 		
                 	}else{
                 		var index = invoiceArr.indexOf($(this).find('td:first a').html());
                 		if (index > -1) {
                 			invoiceArr.splice(index, 1);
                 		}
                 	}
                 	uniqArr = $.unique(invoiceArr);
                 	 if (typeof uniqArr !== 'undefined' && uniqArr.length > 0) {
                   	   var invoiceNumbers = uniqArr;
                   	   var OrganizationId= json.organizationDetailList[0].organizationId;
                       var customerValue = $('#customer-no').val();
                       var customerNumber = customerValue.split("-")[0];
                      
                 		$('#downloadPfd').attr('href','exportMultipleInvoicesAsPDF?invoiceNumber=['+invoiceNumbers+']&orgId='+OrganizationId+'&cusNo='+customerNumber);
                 	
                       
                 	 }
                });
                 
            }
            $(document).on('click','.InputChk',function(){
            	CheckArray();
            	console.log(uniqArr);
                 
            });
            
            $(document).on('click','#downloadPfd',function(){
            	
            	if(uniqArr.length == 0){
            		$('.modal-body').text('<spring:message code='lable.invoice.downloaderror' javaScriptEscape='true'/>');
					$("#myModal").show();
					return false;
            	}
                 
            });
            
            $('#select_all').change(function(){
            	
            	
            	$('tbody tr td input[type="checkbox"]').prop('checked', $(this).prop('checked'));
            	
            	CheckArray();
            	console.log(uniqArr);
            	
            	
          	});
            
            console.log('Dateee'+fromDate+' ,'+toDate);
            
            $('#fromdate').datepicker({ 
            	dateFormat: 'mm/dd/yy',
            	changeMonth: true,
                changeYear: true,
                defaultDate: "0",
                maxDate: "0",
                onClose: function( selectedDate ) {
                  if(selectedDate)
                  $( "#to-datepicker" ).datepicker( "option", "minDate", selectedDate );
                }
            	
            });
            $('#fromdate').val(fromDate);
            $('#todate').datepicker({ dateFormat: 'mm/dd/yy' ,
            	 changeMonth: true,
                 changeYear: true,
                 defaultDate: "0",
                 maxDate: "0",
                 onClose: function( selectedDate ) {
                   if(selectedDate)
                   	$( "#from-datepicker" ).datepicker( "option", "maxDate", selectedDate );
                 }
            	});
            $('#todate').val(toDate);
            
            
           /*  $(document).on('click',".downloadBtn",function(e) {
                
                if (typeof uniqArr !== 'undefined' && uniqArr.length > 0) {
             	   var invoiceNumbers = uniqArr;
             	   var OrganizationId= json.organizationDetailList[0].organizationId;
                    var customerNumber = $('#customer-no').val();
                    
                    
                      $.ajax({
                         type: "GET",
                         url: "exportMultipleInvoicesAsPDF?invoiceNumber="+invoiceNumbers+"&orgId="+OrganizationId+"&cusNo="+customerNumber,
                         success: function(result) {
                             alert('ok');
                         },
                         error: function(result) {
                             alert('error');
                         }
                     });
    				}else{
    					$('.modal-body').text("Array Empty");
    					$("#myModal").show();
    				}
             }); */
        });
       
        
    </script>

	<script type="text/javascript">
	    function search()
	    {
	    	var fromDate=document.getElementById('from-datepicker').value;
	    	var toDate=document.getElementById('to-datepicker').value;
	    	if(fromDate==""||toDate==""){
	    		$('.modal-body').text("<spring:message code='label.myquote.select.date' javaScriptEscape='true'/>");
				$("#myModal").show();
	    		return false;
	    	}else{
	    		document.location.href="getordersfordaterange?fromDate="+fromDate+"&toDate="+toDate;
	    	}
	    	 
	     }
	    function isValidateDate(date){
	    	var date_regex = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;
	    	if(!(date_regex.test(date.value)))
	    	{
	    		$('.modal-body').text('<spring:message code='lable.dateIncorrect' javaScriptEscape='true'/>')
				$("#myModal").show();
	    		document.getElementById(date.id).value='';
	    		return false;
	    	}
	    	//return true;
	    }
	    function clearFilter()
	    {
	    	//table.ajax.reload();
	    	location.reload();
	    	
	    }
	    
	    $(".custom-close").click(function(){
			   $("#myModal").hide();
		});
	    
	    
	    function reorderClick(orderNo,orderCompany,orderType,organizationId,orderBrand){
	    	var paslsGetData= {"orderNumber":orderNo,"orderCompany": orderCompany,"orderType": orderType,"orgCode":organizationId,"orgName":orderBrand};
	    	$("#reorderProcessConfirmationWindow").show();
            $("#reorderProcessConfirmationWindow").draggable({
                handle: ".modal-header"

           });
	    	console.log("paslsGetData>>> ");
	    	console.log(paslsGetData);
	    	$("#reorderProcessConfirmationWindow .ok").click(function(){
	    		   $('div.pageLoader').show();
	    		  $("#reorderProcessConfirmationWindow").hide();
	    	$.ajax({  
	            type : "Get",
	            //data : passGetData,
	            contentType: 'application/json',
	            //url : "findItemCount",
	            url : "getOrdersItemList?orderNumber="+orderNo+"&orderCompany="+orderCompany+"&orderType="+orderType+"&orgCode="+organizationId+"&orgName="+orderBrand,
	            success : function(response) {
	            	   //$('div.pageLoader').hide();
	            	if(response){
	            		var responseData = (JSON.parse(response));
	            		if(responseData.data.itemList.length == responseData.data.itemCnt){
	            			console.log(responseData.data.itemList );
	            			callReordering(responseData.data.orderNumber,responseData.data);
	            		}
	            		else if(responseData.data.itemList.length != responseData.data.itemCnt){
	            			if(responseData.data.itemCnt == 0){
	            				$('div.pageLoader').hide();
	            				var msgText= "No Orderable Items available to Reorder.";
		            			$("#reOrderConfirmationWindowForZeroItem .dialog-content").html(msgText);
		            			$("#reOrderConfirmationWindowForZeroItem").show();
	            			}
	            			else if(responseData.data.itemCnt != 0){
		            			$('div.pageLoader').hide();
		            			$("#reOrderConfirmationWindow").data("reorderNo",responseData.data.orderNumber);
		            			$("#reOrderConfirmationWindow").data("object",responseData.data);
		            			var msgText= "You have "+ responseData.data.itemCnt +" Items available against "+ responseData.data.itemList.length +" Items selected in the Order, Do you want to still proceed?";
		            			$("#reOrderConfirmationWindow .dialog-content").html(msgText);
		            			$("#reOrderConfirmationWindow").show();
	            			}
	            		}
	            	}
	            }
	    	});
	    	$('.modal-footer a:first-child').focus();
	    	});
	    	/* $('.modal-body').text("<spring:message code='label.replace.cart' javaScriptEscape='true'/>")
			$("#confirmationWindow").show();
            $("#confirmationWindow").draggable({
                handle: ".modal-header"

           }); */
	    };
            
            $(".cancel").click(function(){
	    		$("#confirmationWindow, #reOrderConfirmationWindow, #reorderProcessConfirmationWindow").hide();
	    		return false;
			});
            
            $("#reOrderConfirmationWindowForZeroItem .ok").click(function(){
            	$("#reOrderConfirmationWindowForZeroItem").hide();
            	return false;
            });
	    	
    	  	$("#confirmationWindow .ok").click(function(){
	    		  $("#confirmationWindow").hide();
	    		  $('div.pageLoader').show();
	    	 		$.ajax({  
			            type : "Get",
			            data : {childCartId:childcartId},
			            contentType: 'application/json',
			            mimeType: 'application/json',
			            url : "reorder",
			            success : function(response) {
			            	if(response){
			            		//Changed by Rajesh to fix GS-2625
			            		/*getShoppingCartCount();
			            		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.success' javaScriptEscape='true'/>")
			    				$("#myModal").show();
		                        $("#myModal").draggable({
		                            handle: ".modal-header"
		                        });*/
		                       
			            		window.location.href="getshoppingdetails?reOrder=true";
			            	}
			            	else{
			            		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.fail' javaScriptEscape='true'/>")
			    				$("#myModal").show();
		                        $("#myModal").draggable({
		                            handle: ".modal-header"
		                        });
			            	}
			            	$('div.pageLoader').hide();
			            },  
			            error : function(e) {   
			            	$('div.pageLoader').hide();
			            }  
	    	 	   });
	    	 	
	    });
    	
   	  	$("#reOrderConfirmationWindow .ok").click(function(){
   	  		$("#reOrderConfirmationWindow").hide();
   	  		$('div.pageLoader').show();
   	  		callReordering($("#reOrderConfirmationWindow").data("reorderNo"), $("#reOrderConfirmationWindow").data("object"));
   	  	});
    	
   	  	var callReordering = function(orderNo,object){
   	  	var organizationId = object.organizationId;
   	  	var iteration = object.itemList;
   	 	var organizationName = object.organizationName;
   	 	var dataItemVal = null;
   	 	 
   	 	 //$('div.pageLoader').show();
			$.ajax({  
				type : "POST",
		         //data : {orderNumber:orderNo, partNumber:partNumber, organizationName:JSON.stringify(organizationName), itmQty:itmQty, organizationId:JSON.stringify(organizationId)},
		         //contentType: 'application/json',
		         //mimeType: 'application/json',
		         data : {
		        	 		"orderNumber":orderNo,
							"organizationName":JSON.stringify(organizationName),
							"organizationId": organizationId,
							"dataItemVal": JSON.stringify(dataItemVal),
							"objectRef":JSON.stringify(iteration)
						},
		         url : "hopreorder",
		         success : function(response) {
		         	if(response){
		         		window.location.href="getshoppingdetails?reOrder=true";
		         	}
		         	else{
		         		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.fail' javaScriptEscape='true'/>")
		 				$("#myModal").show();
		                 $("#myModal").draggable({
		                     handle: ".modal-header"
		                 });
		         	}
		         	$('div.pageLoader').hide();
		         },  
		         error : function(e) {   
		         	$('div.pageLoader').hide();
		         }  
		  	});
		};
   	  	
   	  	
   	  	
      $(document).ready(function() {
        $("input[aria-controls='order-list']").parent("div").children('input').attr("placeholder", "<spring:message code='label.whereused.search'/>");
        $('#order-list_wrapper input[type="search"]').parent().css({"text-align":"left"}).find("input[aria-controls='order-list']").css({
          "width": "240px"});
    	  $("#order-list_length").css("margin-top", "20px");
         /* $("input[aria-controls='order-list']").parent("div").contents().filter(function () {
              return this.nodeType === 3; 
              }).remove();
            $("input[aria-controls='order-list']").parent("div").prepend("<spring:message code='label.whereused.search'/>");
            $("td.dataTables_empty:contains('No data available in table')").text("").append("<p><spring:message code='label.results.nodata'/></p>");
           $("td.dataTables_empty:contains('No matching records found')").text("").append("<p><spring:message code='label.catalogweb.record.not.found'/></p>");*/
        // run test on initial page load
        checkSize();
           $(document).on('click','#order-list tbody tr td:first-child a',function(){
				$('div.pageLoader').show();
			});
          // run test on resize of the window
          $(window).resize(checkSize);
          
        
          
      });

      //Function to the css rule
      function checkSize(){
        if ($(window).width() <= 1024){  
          $("#order-list_wrapper .row .col-sm-3").css("display", "none");
          $("#order-list_wrapper .row .col-sm-9").removeClass("col-sm-9").addClass("col-sm-12");
          $("#order-list_wrapper").children().eq(2).children().first().removeClass('col-sm-6').addClass('col-sm-4').siblings().removeClass('col-sm-6').addClass('col-sm-8');
        }
        if ($(window).width() >= 1025){  
          $("#order-list").removeClass("table-responsive");
        }
      }
      
      
      var val = '${userProfileDetails}';
	  	var json = JSON.parse(val);
	  	/*--Customer List Auto Complete*/  
        var defaultCustomer="";
       var string = [];
        var customerList=json["CustomerLiteForUserOrg"];
 	 	 for (var i = 0; i<customerList.length; i++) {
 	 		    var obj = customerList[i];
	       	    if(json["customer"].customerId==obj.customerId){
	       	    	defaultCustomer = json["customer"].customerReference + " - " +json["customer"].customerName;
	       	    	$('#customerVal').val(json["customer"].customerId);
		 		}
	       	 	var item = {};
	            item ["label"] = obj.customerReference + " - " + obj.customerName;
	            item ["value"] = obj.customerId;
				string.push(item);
        }
 	 	if(defaultCustomer.trim()!=""){
 	 	// Set Default Customer 
 	 		customerNumber = json["customer"].customerReference;
	         $('#customer-no').val(json["customer"].customerReference + " - " +json["customer"].customerName);
 	 	}

       // this variable is for customer number autocomplete validation
       var validCustomerNumber;
       var customerLoaded;
 	     $( "#customer-no" ).autocomplete({
	 	     minLength: 2,
			 source : function (request, response) {
					var results = $.ui.autocomplete.filter(string, request.term);
					response(results.slice(0, 1000));
			 },
	         open:function(e){
	           validCustomerNumber=false;
	           customerLoaded = false;
	         },
	 	     select: function(e, ui) {
	          e.preventDefault() // <--- Prevent the value from being inserted.
	          var selectedOrganization = json.organizationDetailList[0].organizationId;
	         },
	         focus: function(event, ui) {
	            event.preventDefault();
	            $("#customer-no").val(ui.item.label);
	            validCustomerNumber = true;
	         },
	         close:function(e){
	           if($("#customer-no").val() !== ""){
	               validCustomerNumber = true;
	           }
	         }
		});
 	     
        $( "#customer-no" ).on('change',function(e){
           if(customerLoaded == true){
               if(typeof validCustomerNumber == 'undefined'){
                   $(this).val("");
               }else if (validCustomerNumber && $('#customerVal').data('label')!==$(this).val()){
                   $(this).val("");
                   validCustomerNumber=false;
               }else if(!validCustomerNumber){
                   $(this).val("");
               }
           }
      });

  
     
  
      
      function orderList()
        {
    	  invoiceArr.length = 0;
    	  $('div.pageLoader').show();
    	  $('#downloadPfd').attr('href','#');
    	  var  myErrObj = new errnsp.errHandling.init();
          var selectedOrganization = json.organizationDetailList[0].organizationId;
          var selectedOrgName = json.organizationDetailList[0].organizationName;
          var customerValue = $('#customer-no').val();
          var customerReference = customerValue.substr(0,customerValue.indexOf('-'));
          var customerName = customerValue.substr(customerValue.indexOf('-')+1);
          var fromDate=document.getElementById('fromdate').value;
          var toDate=document.getElementById('todate').value;
          var chooseBrand = '${chooseBrand}';
         var breadcrumbsArray = '${breadcrumbsArray}';
         breadcrumbsArray =  breadcrumbsArray +',' +$('.breadcrumb').find('li.active').html()+'_'+window.location.href.split("/")[window.location.href.split("/").length - 1];
          //alert(selectedOrganization + ' '+ selectedOrgName + ' '+ customerReference +' '+ fromDate +' '+ toDate);
       
          $.ajax({
            method : "GET",
            url: 'getinvoicelistdetails',
            data : {customerReference: customerReference,customerName:customerName, selectedOrganization: selectedOrganization, selectedOrgName: selectedOrgName, 
                        fromDate: fromDate,toDate: toDate,breadcrumbsArray: breadcrumbsArray}, 
                        'error': function(jqxhr, textStatus, error){
                          	$(".pageLoader").hide();
                          	var loading = $(".dataTables_empty").text();
                          	if(loading ==  'Loading...'){
                          		$(".dataTables_empty").text("");
                          	}
                  			var err = jqxhr.status;
                              var msg = jqxhr.responseText;
                              
                              console.log( "Request Failed: " + err );
                               console.log( "Request Failed: " + jqxhr.responseText );
                               
                               myErrObj.raise(err,msg,textStatus);
                  			},
            dataType:"json",
            success: function(response){
           
               var orderList = $("#order-list").DataTable();   
               orderList.clear();
               console.log('new response'+response.data);
               orderList.rows.add(response.data).draw();
                 $('div.pageLoader').hide();
            	$('#count').text(response.data.length);
                  
            }

          });
          
          $('#select_all').prop('checked', false);
          
        }

    </script>
</body>

</html>
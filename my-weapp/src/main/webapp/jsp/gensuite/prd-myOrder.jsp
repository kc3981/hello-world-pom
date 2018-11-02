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
<sec:authorize access="hasRole('ROLE_RETAIL_CUSTOMER')"
		var="isRetailUser"></sec:authorize>
<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js" defer></script>
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
<!-- Plugin to load properties from javascript file -->
<script type="text/javascript" src="../js/jquery.i18n.properties.js" defer></script>

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
			<!-- <script type="text/javascript">$('header').load('header.html')</script> -->
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<li class="active"><spring:message code="lable.order.orders" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="lable.order.orders" />
						&nbsp;(<span id="count"></span>)
					</h3>
					<div
						class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
						<table id="order-list" class="table display table-striped"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th><spring:message code="lable.order.orderNumber" /></th>
									<th><spring:message code="lable.reference" /></th>
									<th><spring:message code="lable.customerName" /></th>
									<th><spring:message code="label.quote.order.ponumber" /></th>
									<th><spring:message code="lable.order.payment" /></th>
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
							<a class="col btn cancel" href="javascript:;"><spring:message code="label.bulkpartupload.cancel" /></a> 
							<a class="col btn ok" href="javascript:;"><spring:message code="label.bulkpartupload.ok" /></a>
						</div>
					</div>
				</div>
			</div>
	<div class="modal bs-example-modal-md" id="reOrderConfirmationWindow" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
          <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
              <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button> 
              <h4 class="modal-title custom-modal-title"><spring:message code="label.cart.confirm"/></h4>
            </div>
            <div class="modal-body confirm-modal-body">
              <!-- Content for the dialog / modal goes here. -->
                <p class="dialog-content"></p>
            </div>
            <div class="modal-footer">
				<a class="col btn cancel" href="javascript:;"><spring:message code="label.bulkpartupload.cancel" /></a> 
				<a class="col btn ok" href="javascript:;"><spring:message code="label.bulkpartupload.ok" /></a>
			</div>
          </div>
        </div>
      </div>       
      <div class="modal bs-example-modal-md" id="reOrderConfirmationWindowForZeroItem" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
          <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
              <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button> 
              <h4 class="modal-title custom-modal-title"><spring:message code="label.cart.confirm"/></h4>
            </div>
            <div class="modal-body confirm-modal-body">
              <!-- Content for the dialog / modal goes here. -->
                <p class="dialog-content"></p>
            </div>
            <div class="modal-footer">
                <a class="col btn ok" href="javascript:;"><spring:message code="label.bulkpartupload.ok" /></a>
            </div>
          </div>
        </div>
      </div>
      
       <div class="modal bs-example-modal-md" id="reorderProcessConfirmationWindow" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
          <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
               <button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button> 
              <h4 class="modal-title custom-modal-title"><spring:message code="label.cart.confirm"/></h4>
            </div>
            <div class="modal-body confirm-modal-body">
              <!-- Content for the dialog / modal goes here. -->
                <p class="dialog-content"><spring:message code="label.bulkpartupload.replace.cart.message"/></p>
            </div>
            <div class="modal-footer">
				<a class="col btn cancel" href="javascript:;"><spring:message code="label.bulkpartupload.cancel" /></a>
				<a class="col btn ok" href="javascript:;"><spring:message code="label.bulkpartupload.ok" /></a>
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
		src="../js/jquery-ui.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
		type="text/javascript"></script>
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
	var sWidth = $(window).width();
	if (sWidth <= 992) {
		var mql = window.matchMedia("(orientation: portrait)");
		if (mql.matches) {
			// Portrait orientation
			$("#myModal").show();
			$(".custom-modal-body").text("This page is best viewed in landscape mode for better usability");
		} else {
			// Landscape orientation
			$("#myModal").hide();
		}
		mql.addListener(function(m) {
			if (m.matches) {
				// Changed to portrait
				$("#myModal").show();
				$(".custom-modal-body")
				.text(
				"This page is best viewed in landscape mode for better usability");
			} else {
				// Changed to landscape
				$("#myModal").hide();
			}
		});
		
	}
		
		
    var childcartId;
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
    var  myErrObj = new errnsp.errHandling.init();
        $(document).ready(function(){
        	var fromDate='${fromDate}';
 	        var toDate='${toDate}';
		//start of not in Mil
 	        /**
 	        *Historical Date set as max Date for From same as To-Date geting the 
 	        *Getting the Historical order to date from application.properties instead of messages.
 	        *
 	        *JIRA-727.
 	        */
 
			//Commented by Rajesh since this is not needed in Product 
 	        /* var maxToDate = '${properties['historical.order.todate']}';
 	        var maxYear = maxToDate.split("/")[2];
 	       	var maxMonth = maxToDate.split("/")[0];
 	      	var maxDate = maxToDate.split("/")[1];
 	      	if(fromDate==""){
	 	      var fromDateTmp = new Date(maxYear,maxMonth-1,maxDate);
	 	      fromDateTmp.setMonth(fromDateTmp.getMonth() - 3);
	 	      fromDate = fromDateTmp.getMonth() + 1
		 	  fromDate =  fromDate +"/"+fromDateTmp.getDate()+"/"+fromDateTmp.getFullYear(); 
		 	 console.log(fromDate);
 	      	} */
		//End of not in Mil
		 if(fromDate==""){
	 	        var today = new Date();
	            var priorDate = new Date().setDate(today.getDate()-180);
	            var priorDateFormat = new Date(priorDate);
	            
	           fromDate=dateFormat(priorDateFormat.toISOString().substring(0, 10)); // '${fromDate}';
	           toDate=dateFormat(today);
			}
            $('div.pageLoader').show();
            var table =$('#order-list').on('xhr.dt', function ( e, settings, json ) {
                $('div.pageLoader').hide();
            	$('#count').text(json.data.length)
            } ).DataTable({
                //"scrollY":  "600px",
                //"scrollCollapse": true,
                "columnDefs": [{ "orderable": false, "targets": 7 }],
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
                          'url': 'getordersdetails',
                          'data':  {fromDate: fromDate,toDate: toDate}, 
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
                      },
            
            });
          //hiding PO Number column for retail user. 
			var oTable = $('#order-list').dataTable().api();
			var isRetail = ${isRetailUser};
			if (isRetail!=null && isRetail) {
				oTable
						.column(
								$(
										'th:contains("<spring:message code="view.label.po.number"/>")')
										.index())
						.visible(false);
			}
            table.on( 'init.dt', function () {
			/**
 	        *Historical Date set as max Date for From same as To-Date geting the 
 	        *Getting the Historical order to date from application.properties instead of messages.
 	        *
 	        *JIRA-727.
 	        */
                $('#order-list_filter').prepend("<div class='dateSelector'><span style='float : left; margin-left: 5px;'><spring:message code='lable.order.orderDateFrom'/></span><br> <input class='calendar_icon' type='text'  id='from-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="+fromDate+"></div>&nbsp;&nbsp;<div><span style='float : left; margin-left: 5px;'><spring:message code='lable.to'/></span><br><input class='calendar_icon' type='text' id='to-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="+toDate+"></div><input class='btn btn-default btn-md lesspadding goButton' type='button' onclick='search()'/> <input class='btn btn-default btn-md lesspadding clearFilter' type='button' onclick='clearFilter()'/> &nbsp;&nbsp;");
/*                $("#order-list_first").children().empty().text("<spring:message code='label.pagnation.first'/>").show();
                $("#order-list_previous").children().empty().text("<spring:message code='label.pagnation.prev'/>").show();
                $("#order-list_next").children().empty().text("<spring:message code='label.pagnation.next'/>").show();
                $("#order-list_last").children().empty().text("<spring:message code='label.pagnation.last'/>").show();*/
                $( "#from-datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  defaultDate: "0",
                 // maxDate: new Date(maxYear,maxMonth-1,maxDate),
		  		  maxDate: "0",  //in milacron
                  onClose: function( selectedDate ) {
                    if(selectedDate)
                    $( "#to-datepicker" ).datepicker( "option", "minDate", selectedDate );
                  }
                });
                $( "#to-datepicker" ).datepicker({
                  changeMonth: false,  // true, in milacron
                  changeYear: false, // true, in milacron
                  defaultDate: "0",
                 // maxDate: new Date(maxYear,maxMonth-1,maxDate), //maxDate: "0", //in milacron
                  maxDate: "0", 
                  onClose: function( selectedDate ) {
                    if(selectedDate)
                    $( "#from-datepicker" ).datepicker( "option", "maxDate", selectedDate );
                  }
                });
               
                
            });
            //$('#order-list_length').css({"display":"none"});
            $('#order-list tbody').on( 'click', 'a.icon-delete', function () {
                table.row( $(this).parents('tr') ).remove().draw();
            } );
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
		//Not in Mil
	    		var tmp  =new Date(fromDate); 
	    		
	    		var tmp1 = new Date(toDate);
	    		tmp1.setMonth(tmp1.getMonth() - 3);
	    		
	    		var timeDiff = Math.abs(tmp.getTime() - tmp1.getTime());
	    		var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
	    		 if(tmp >= tmp1) {
	 	    		document.location.href="getordersfordaterange?fromDate="+fromDate+"&toDate="+toDate;
	    		 }else{
	    			 $('.modal-body').text('<spring:message code="historical.order.date.message"/>');
	 				$("#myModal").show();
	 	    		return false;
	    		 }
	    	}//End of not in Mil
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
	        document.location.href="getorders";
	    }
	    
	    $(".custom-close").click(function(){
			   $("#myModal").hide();
		});
	   /*  function reorderClick(childCartId){
	    	childcartId=childCartId;
	    	$('.modal-body').text("<spring:message code='label.replace.cart' javaScriptEscape='true'/>")
			$("#confirmationWindow").show();
            $("#confirmationWindow").draggable({
                handle: ".modal-header"

           });
	    } */
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
	    };
	    $("#reOrderConfirmationWindowForZeroItem .ok").click(function(){
        	$("#reOrderConfirmationWindowForZeroItem").hide();
        	return false;
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
	    
            
            $(".cancel").click(function(){
            	$("#confirmationWindow, #reOrderConfirmationWindow, #reorderProcessConfirmationWindow").hide();
	    		return false;
			});
	    	
	    	 /*  $(".ok").click(function(){
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
		                       // });
		                       
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
	    	 	
	    }); */
      $(document).ready(function() {
        $("input[aria-controls='order-list']").parent("div").children('input').attr("placeholder", "<spring:message code='label.whereused.search'/>");
        $('#order-list_wrapper input[type="search"]').parent().css({"float":"left","text-align":"left"}).find("input[aria-controls='order-list']").css({
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
    </script>
</body>

</html>
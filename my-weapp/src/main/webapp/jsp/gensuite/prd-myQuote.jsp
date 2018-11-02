<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
 src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer>
</script>

<style>
#quote-list tbody tr td:last-child {
	padding: 10px 0px;
}

@media (min-width:300px) and (max-width: 767px){
	div.dataTables_filter{
		text-align: left !important;
	}
	#quote-list_filter>div {
		  margin-bottom: 6px;
		  z-index: 12;
    	  position: relative;
	}
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
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<li class="active"><spring:message code="lable.quote.quotes" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
					<h3>
						<spring:message code="lable.quote.quotes" />
						&nbsp;(<span id="count"></span>)
					</h3>
					<div id="quotetable"
						class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
						<table id="quote-list" class="table display table-striped"
							cellspacing="0" style="width: 100%; word-wrap:break-word;">
							<thead>
								<tr>
									<th><spring:message code="lable.quote.quoteNumber" /></th>
									<th><spring:message code="lable.reference" /></th>
									<th><spring:message code="lable.customerName" /></th>
									<c:if test="${isBrandDisplayedOnQuoteList == true}">
										<th><spring:message code="lable.brand" /></th>
									</c:if>									
									<th><spring:message code="lable.quote.quoteDate" /></th>
									<th><spring:message code="lable.quote.expiryDate" /></th>
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
							<a class="col btn ok" href="javascript:;"><spring:message code="label.myaccount.ok" /></a>
							<input type="hidden" id="confirmBoxType" />
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

	<!-- Javascript Plugins -->
	<script
		src="../js/jquery-ui.min.js?version=${properties['application.version']}"
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
	<!-- <script src="../js/gensuite-ui.js" type="text/javascript"></script> -->

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
		
    var childcartId;
    var  myErrObj = new errnsp.errHandling.init();
        $(document).ready(function(){
          var fromDate='${fromDate}';
          var toDate='${toDate}';
          var isBrandDisplayedOnQuoteList='${isBrandDisplayedOnQuoteList}';
          var targets_num;
    	  var order_desc_num;
          if(isBrandDisplayedOnQuoteList=='true'){
        	  targets_num = 7;
        	  order_desc_num = 4;
        	  document.getElementById('quote-list').style.width = '102%';
        	  
          }else{
        	  targets_num = 6;
        	  order_desc_num = 3;
        	 // document.getElementById('quote-list').style.width = '100%';
          }
          
            $('div.pageLoader').show();
            var table = $('#quote-list').on('xhr.dt', function ( e, settings, json ) {
                $('div.pageLoader').hide();
              $('#count').text(json.data.length)
            } ).DataTable({
               // "scrollY":  "600px",
                "stateSave": true, // Added only in Milacron 
                //"scrollCollapse": true,
                "columnDefs": [{ "orderable": false, "targets": targets_num }],
                "order": [[ order_desc_num, "desc" ]],
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
                  //  'type': 'POST',
                    'url': 'getquotesdetails',
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
                }
               //"ajax": 'getquotesdetails',
            });
            table.on( 'init.dt', function () {
            	$('#quote-list_filter').prepend("&nbsp;<div class='datefilter'><span style='float : left;'><spring:message code='lable.quote.quoteDateForm'/></span><br> <input class='calendar_icon' type='text'  id='from-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>' onChange='isValidateDate(this)' value="+fromDate+"></div>&nbsp;<div class='datefilter'><span style='float : left; margin-left: 5px;'><spring:message code='lable.to'/> </span><br><span class='visible-xs-inline'>&nbsp;&nbsp;&nbsp;&nbsp;</span><input class='calendar_icon date-pick' type='text' id='to-datepicker' placeholder='<spring:message code='view.label.order.dateformat'/>'onChange='isValidateDate(this)' value="+toDate+" ></div>&nbsp;<div><input class='btn btn-default btn-md lesspadding goButton' type='button' onclick='search()'/><input  class='btn btn-default btn-md lesspadding clearFilter' type='button' onclick='clearFilter()'/></div>&nbsp;");
                /* $("#quote-list_first").children().empty().text("<spring:message code='label.pagnation.first'/>").show();
                $("#quote-list_previous").children().empty().text("<spring:message code='label.pagnation.prev'/>").show();
                $("#quote-list_next").children().empty().text("<spring:message code='label.pagnation.next' javaScriptEscape='true'/>").show();
                $("#quote-list_last").children().empty().text("<spring:message code='label.pagnation.last'/>").show(); */
                
                $( "#from-datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  defaultDate: "0",
                  maxDate: "0",
                  onClose: function( selectedDate ) {
                    if(selectedDate)
                    $( "#to-datepicker" ).datepicker( "option", "minDate", selectedDate );
                  }
                });
                $( "#to-datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  defaultDate: "0",
                  maxDate: "0",
                  onClose: function( selectedDate ) {
                    if(selectedDate)
                    	$( "#from-datepicker" ).datepicker( "option", "maxDate", selectedDate );
                  }
                });
            });
            //$('#quote-list_length').css({"display":"none"});
            var evnt;
             $('#quote-list tbody').on( 'click', 'a.icon-delete', function (e) {
              //  table.row( $(this).parents('tr') ).remove().draw();
              //  e.stopPropogation();
            	 evnt = this;
            } );
            $('#quote-list tbody').on('click', 'tr', function () {
                //alert('row clicked');
            });
            
            $(".ok").click(function(){
	    		  $("#confirmationWindow").hide();
	    		  $('div.pageLoader').show();
	    		  if($('#confirmBoxType').val()=="reorder"){
	    			  
	    			  $.ajax({  
				            type : "Get",
				            data : {childCartId:childcartId},
				            contentType: 'application/json',
				            mimeType: 'application/json',
				            url : "reorder",
				            success : function(response) {
				            	if(response){
				            		/* getShoppingCartCount();
				            		$('.modal-body.custom-modal-body').text("<spring:message code='label.viewquote.cart.success' javaScriptEscape='true'/>")
				    				$("#myModal").show();
			                        $("#myModal").draggable({
			                            handle: ".modal-header"
			                        }); */
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
				            }  
		    	 	   });
	    		  }
	    		  else{
	    			  
	    			  $.ajax({  
	    		            type : "Get",
	    		            data : {childCartId:childcartId},
	    		            contentType: 'application/json',
	    		            mimeType: 'application/json',
	    		            cache : false,
	    		            url : "cancelquote",
	    		            success : function(response) {
	    		            	
	    		            	if(response){
	    		            		table.row( $(evnt).parents('tr') ).remove().draw();
	    		            		$('.modal-body').text("<spring:message code='label.myquote.delete' javaScriptEscape='true'/>")
	    		    				$('div.pageLoader').hide();
	    		            		$("#myModal").show();
	    		            		var rowCount = $('#count').text();
	    		            		$('#count').text(rowCount-1)
	    		            		
	    		            	}
	    		            	else{
	    		            		$('.modal-body').text("<spring:message code='message.unable.to.process' javaScriptEscape='true'/>")
	    		    				$('div.pageLoader').hide();
	    		            		$("#myModal").show();
	    		            	}
	    		            },  
	    		            error : function(e) {    
	    		            }  

	    	           });
	    		  }
	    });
        });
    </script>
	<script type="text/javascript">
      function search()
      {
        var fromDate=document.getElementById('from-datepicker').value;
        var toDate=document.getElementById('to-datepicker').value;
        if(fromDate==""||toDate==""){
          //alert("Please select date");
          $('.modal-body').text("<spring:message code='label.myquote.select.date' javaScriptEscape='true'/>");
        $("#myModal").show();
                $("#myModal").draggable({
                    handle: ".modal-header"
                });
          return false;
          
        }else{
          //document.getElementById("form").submit();
          document.location.href="getquotesfordaterange?fromDate="+fromDate+"&toDate="+toDate;
        }
         
       }
      function isValidateDate(date){
        var date_regex = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;
        if(!(date_regex.test(date.value)))
        {
          $('.modal-body').text("<spring:message code='lable.dateIncorrect' javaScriptEscape='true'/>")
        $("#myModal").show();
                $("#myModal").draggable({
                    handle: ".modal-header"
                });
              document.getElementById(date.id).value='';
          return false;
        }
        //return true;
      }
      function clearFilter()
      {
          document.location.href="getquotes";
      }
      $(".custom-close").click(function(){
         $("#myModal").hide();
      });
      
      
      function reorderClick(childCartId){
        childcartId=childCartId;
        $('.modal-body').text("<spring:message code='label.replace.cart' javaScriptEscape='true'/>");
        $('#confirmBoxType').val("reorder");
		      $("#confirmationWindow").show();
		            $("#confirmationWindow").draggable({
		                handle: ".modal-header"

           });
		 $('.modal-footer a:first-child').focus();           
      }
            
            $(".cancel").click(function(){
	    		$("#confirmationWindow").hide();
	    		return false;
			});
	    	
	    	  
	    
	    
	    function cancleQuoteClick(childCartId, quoteNumber){
	    	childcartId=childCartId;
	    	$('.modal-body').text('<spring:message code='label.myquote.warning.delete' javaScriptEscape='true'/>'+quoteNumber+' ?');
	    	$('#confirmBoxType').val("cancleQuote");
		      $("#confirmationWindow").show();
		            $("#confirmationWindow").draggable({
		                handle: ".modal-header"

         	});
		    $('.modal-footer a:first-child').focus();   
      }

      $(document).ready(function() {
       /*  $('#quote-list_wrapper input[type="search"]').parent().css({"text-align":"left"}).find("input[aria-controls='quote-list']").css({
          "width": "240px"}); */
          $('#quote-list_wrapper input[type="search"]').parent().css({"float":"left","text-align":"left","z-index" : "1","position": "relative"}).find("input[aria-controls='quote-list']").css({
              "width": "240px"});
        $("#quote-list_length").css("margin-top", "20px");
/*    	  $(".dataTables_length").find("strong").hide().text("<spring:message code='search.resultsperpage'/>").show();
          $("input[aria-controls='quote-list']").parent("div").contents().filter(function () {
              return this.nodeType === 3; 
              }).remove();
          
           $("td.dataTables_empty:contains('No data available in table')").text("").append("<p><spring:message code='label.results.nodata'/></p>");
           $("td.dataTables_empty:contains('No matching records found')").text("").append("<p><spring:message code='label.catalogweb.record.not.found'/></p>");*/
		    // run test on initial page load
		    checkSize();
           $(document).on('click','#quote-list tbody tr td:first-child a',function(){
				$('div.pageLoader').show();
			});
		    // run test on resize of the window
		    $(window).resize(checkSize);
		});

		//Function to the css rule
		function checkSize(){
		 	if ($(window).width() <= 1024){	
				$("#quote-list_wrapper .row .col-sm-3").css("display", "none");
				$("#quote-list_wrapper .row .col-sm-9").removeClass("col-sm-9").addClass("col-sm-12");
        $("#quote-list_wrapper").children().eq(2).children().first().removeClass('col-sm-6').addClass('col-sm-4').siblings().removeClass('col-sm-6').addClass('col-sm-8');
			}
			if ($(window).width() >= 1025){	
				$("#quotetable").removeClass("table-responsive");
			}
		}
	//Added only in Milacron	
		var value=true;
		History.Adapter.bind(window, 'statechange', function() {
	    	 if(value){
	    		 console.log('shop for parts statechange*********************');
	    	 }
		});
	//End of Added only in Milacron	

		
    </script>
</body>

</html>
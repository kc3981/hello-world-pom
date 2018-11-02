<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<!--     <!-- Favicon and touch icons
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script type="text/javascript">
		$("#main-menu-list > li:nth-child(2)").addClass("active");
	</script>
</head>


<body>
    <%@ include file="../googleAnalyticsbody.jsp" %>  
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post" id="file-form" action="uploadfile">
			<!-- header container having logo and navigation -->
			<header>
				<div id="header-wrapper">
					<%@ include file="../../jsp/header.jsp"%>
				</div>
			</header>
			<div class="breadcrumbs-list fixed ">
				<ul class="breadcrumb">

					<li><a href="homepage"><spring:message code="lable.home" /></a></li>
					<c:choose>
						<c:when test="${true==param.orderhere}">
							<li><a href="orderhere"><spring:message
										code="label.order.options" /></a></li>
						</c:when>
					</c:choose>
					<li class="active"><spring:message
							code="label.footer.bulk.upload" /></li>
				</ul>
			</div>
			<div class="container-fluid content-wrapper">
				<div
					class="col-lg-12 col-md-12 col-lg-sm col-xs-12 column-paddings bulk-upload">
					<div class="col-md-12">
						<h3>
							<spring:message code="label.footer.bulk.upload" />
						</h3>
					</div>
					<div class="col-md-12">
						<p class="">
							<spring:message code="label.bulkpartupload.replace.cart.message" />
						</p>
					</div>
					<div class="col-md-12">
						<h4>
							<a href="downloadtemplete" style="text-decoration: underline;"><spring:message
									code="label.bulkpartupload.download.template" /></a>
						</h4>
					</div>
					<div class="col-md-12" id="setraMessageId" style="display: none;">
						<p class="">
							<spring:message	code="label.setra.bulkupload" />
						</p>
					</div>


					<!-- content wrapper for the current page contents -->
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="attach-file-section bulk-submit nopadding">
							<label class="" style="background: #fff !important;"><spring:message
									code="label.bulkpartupload.upload.parts" /></label> <input type="text"
								class="file-name" /> <input type="file" name="file"
								id="file-upload"> <label for="file-upload"
								class="attach-file"><spring:message
									code="label.bulkpartupload.browse" /></label>
							<!--  <input class="btn-addtocart upload" type="button" value="Upload"  id="upload-button"> -->
							<button class="btn-addtocart upload" id="upload-button">
								<spring:message code="label.bulkpartupload.upload" />
							</button>
							<div class="file-list"></div>
						</div>

					</div>
					<div class="col-lg-12 col-md-12 col-lg-sm col-xs-12 resultin-table"
						style="display: none; text-align: center">
						<p class="continue-box">
							<spring:message
								code="label.bulkpartupload.message.upload.failure" />
						</p>
						<button class="btn btn-addtocart green-button btn-ok create-cart"
							type="submit">
							<spring:message code="label.bulkpartupload.cart.replace" />
						</button>
						<button class="btn btn-addtocart green-button cancel">
							<spring:message code="label.bulkpartupload.cancel" />
						</button>
					</div>
				</div>
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings resultin-table responsive-padding"
					style="display: none;">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings"
						style="margin-top: 20px">
						<table id="bulkupload"
							class="table display table-striped table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th><spring:message code="search.type.part" /></th>
									<th><spring:message
											code="label.bulkpartupload.organization" /></th>
									<th><spring:message
											code="label.bulkpartupload.errormessage" /></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div align="center">
					<p id="msg-box"></p>
				</div>

			</div>
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
	<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/jquery.dataTables.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/dataTables.bootstrap.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/dataTables.responsive.js?version=${properties['application.version']}" defer type="text/javascript"></script>

	<script type="text/javascript">
  $(document).ready(function() {
	//Added by Nandakishore to enable the Order Option Tab when clicked from Order Option
		var test="${param.orderhere}";
		if(test == "true"){
			$("#main-menu-list > li:nth-child(2)").addClass("active");
		}
      //$(".close").text("x");
	  var msg='${bulkUpload}';
	  var haveData;
	  var haveParts;
	  var userApplication = $('#userApplication').val();
	  if(userApplication =="REV"){
		  $("#setraMessageId").show();
	  }
	 
	  if(msg!="undefine"||msg!=""||msg!="unknown"||msg!=null){
		  $('#msg-box').show();
		  $('#msg-box').text(msg);
	  }
	  
	  /*upload read excel ajax call */
    $('.upload').on('click',function(event){
 	event.preventDefault();//SUPPORT-MIL-178-190116
	if(	$('#file-upload').val()==""){
		var msg = "<spring:message code='label.bulkpartupload.select.file' javaScriptEscape='true'/>";
		 $('.modal-body').text(msg)
		 $("#myModal").show();
		return false;
	}
   	$('div.pageLoader').show();
	$('.upload').addClass('not-active');	
	var formData = new FormData($('form')[0]);
	formData.append( "enctype", "multipart/form-data" );
	formData.append( "encoding", "multipart/form-data" );
	   $.ajax({
           url: 'readfile',
           type: 'POST',
           data: formData,
           cache: false,
           contentType: false,
           processData: false,
           success: function (response) {
        	   console.log(response);
        	   $('div.pageLoader').show();
        	   $(".resultin-table").hide();
        	   var data=JSON.parse(response);
        	   haveData=data.dataFlag;
        	   haveParts=data.haveParts;
        	   if(data.errorFlag){
        		   $('div.pageLoader').show();
        		   $(".resultin-table").hide();
        		   $("#bulkupload").hide();
        		   $("#bulkupload_wrapper").hide();
        		   $('#msg-box').text(data.message);
        		   $(".create-cart").hide();
        		   $(".cancel").hide();
        		   $(".continue-box").hide();
        		   getShoppingCartCount();  
        		   $('div.pageLoader').hide();  
        	   }/* if(errorFlag==''){
        		   $('#msg-box').text("Some problem with the file");
        	   } */
        
        	   else{
        		   $('div.pageLoader').hide();  
        		   $(".resultin-table").show();
        		   $("#bulkupload").show();
        		   $(".create-cart").show();
        		   $(".cancel").show();
        		   $(".continue-box").show();
        		   $("#bulkupload_wrapper").show();
	        		   var json = JSON.parse(data.result);
	                   $('#bulkupload').dataTable({
	                	   destroy: true ,
	                	   "aaSorting": [],
	                	   'aaData': json.data,
                            "language": {
                              processing:     "<spring:message code='label.processing'/>...",
                              lengthMenu:    "<strong><spring:message code='search.resultsperpage'/></strong> _MENU_",
                              search:         "<spring:message code='label.whereused.search'/>",
                              loadingRecords: "<spring:message code='label.footer.loading'/>...",
                              zeroRecords:    "<spring:message code='label.catalogweb.record.not.found'/>",
                              emptyTable:     "<spring:message code='label.results.nodata'/>",
                              paginate: {
                                  first:      "<spring:message code='label.pagnation.first'/>",
                                  previous:   "<spring:message code='label.pagnation.prev'/>",
                                  next:       "<spring:message code='label.pagnation.next'/>",
                                  last:       "<spring:message code='label.pagnation.last'/>"
                              },
                            }
	                   });
	                   getShoppingCartCount();    
        	   }
        	   
           },
           error: function(){
               // $('div.pageLoader').hide();
               alert("Unkown Error");
           }
       }); 
	   $(".resultin-table").show(); 
});

    /*create cart form sumbit */
	 $('.create-cart').on('click',function(){ 
		   $('div.pageLoader').show(); ////SUPPORT-MIL-178-260116
	/* 	 if(!haveData){
			 $('.modal-body').text('Upload file is not in right format.')
	  			  $("#myModal").show();
			 //document.location.href = "cartbulkpartupload";
			 return false;
				 } */ if(haveParts){
						 	$('div.pageLoader').hide();//SUPPORT-MIL-178-260116
							var msg = "<spring:message code='label.bulkpartupload.no.parts' javaScriptEscape='true'/>";
						 	$('.modal-body').text(msg)
			 			  	$("#myModal").show();
				 //document.location.href = "cartbulkpartupload";
				 			return false;
					 }else
							 $("#file-form").submit();
					 });
	 $(".custom-close").click(function(){
		   $("#myModal").hide();
		   document.location.href = "cartbulkpartupload";
		});
    
	 /*browse button actions */
    $('#file-upload').on('change',function(e){
        $(this).siblings(".file-name").val("");
    	var fileName=$(this).val();
    	var fileExtension=fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
    	var filePath;
    	
    	var allowedFileFormat  = [];
    	allowedFileFormat[0] = "xls";
    	allowedFileFormat[1] = "xlsx";
    	if(userApplication == "REV"){
    		allowedFileFormat[2] = "xfr";
    	}
    	if($('.file-name').val()==""){
        	if(allowedFileFormat.indexOf(fileExtension)  > -1){
        	$('.upload').removeClass('not-active');
            $('#msg-box').text('');
            filePath=$(this).val().replace("C:\\fakepath\\", "");
            $('.file-name').val(filePath);
            $(".resultin-table").hide();
            $("#bulkupload_wrapper").hide();
            $("#bulkupload").hide();
        	}else{
        		/* alert("Please upload xls file"); */
                var msg = "<spring:message code='label.bulkpartupload.upload.xls' javaScriptEscape='true'/>";
                $('.modal-body').text(msg)
                $("#myModal").show();
                //document.location.href = "cartbulkpartupload";
        	}
    	}else{
    		if(allowedFileFormat.indexOf(fileExtension) > -1){
    			$('.upload').removeClass('not-active');
    	       var table = $('#bulkupload').DataTable();
    	       table.row().remove().destroy();
    	       $('.upload').removeClass('not-active');
    	       $('#msg-box').text('');
    	       filePath=$(this).val().replace("\\fakepath\\", "");
    	       $('.file-name').val(filePath);
    	       $(".resultin-table").hide();
    	       $("#bulkupload_wrapper").hide();
    	       $("#bulkupload").hide();
        	}else{
        		 var msg= "<spring:message code='label.bulkpartupload.upload.xls' javaScriptEscape='true'/>";
             $('.modal-body').text(msg);
             $("#myModal").show();
             //document.location.href = "cartbulkpartupload";
        	}
    	}
    		
    	
    });
    
    /*cancel button actions */
    $('.cancel').on('click',function(e){
    	 e.preventDefault();
	  	document.location.href = "cartbulkpartupload";
	  	
  });
    //Negate the Bulk upload for MAC
    if (navigator.userAgent.indexOf('Mac OS X') != -1 || ($(window).width() < 1199)) {
    	$('.footer-container ul#idlink').find('li:nth-child(4)').css('display','none');
    	} else {
    		$('.footer-container ul#idlink').find('li:nth-child(4)').css('display','inline-block');
    	}
});



</script>

</body>

</html>
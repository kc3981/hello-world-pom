<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<link rel="stylesheet" href="../css/simplePagination.css?version=${properties['application.version']}" />

<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js?version=${properties['application.version']}" defer></script>
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
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon-57-precomposed.png"> -->


</head>
<style>
/* .machine-image{margin:10px;float:left;width:40%!important;}
          .machine-image img{margin-top:0;}
          .machine-details{width:48%!important;}
          .search-parts-templates{width:32%!important;} */
.search-parts-templates .machine-details {
	margin-left: 12px;
	margin-top: 10px
}
#page-selection ul, #page-selection-top ul {
    float: right;
}
</style>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<!-- NREV-2219 fix starts(Developed by : Swetha) -->
	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>
	<!-- NREV-2219 fix ends -->
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper" id="whereUsed">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header> <%@ include file="header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed hidden-xsx responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li><a href="#" onclick="breadCrumb('searchResults');"><spring:message
								code="label.whereused.search" /></a></li>
					<li class="active"><spring:message code="whereused.item"></spring:message>
						${partNumber} <spring:message code="whereused.whereused"></spring:message></span></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
					
					<div class="col-lg-12 col-xs-12 nopadding"
						style="border-bottom: 1px solid #ccc; margin-bottom:10px !important;">
						<h3 class="inline" style="padding-bottom: 0px">
							<spring:message code="whereused.item"></spring:message>
							${partNumber}
							<spring:message code="whereused.whereused"></spring:message>
						</h3>
						<strong>(${whereusedresultCount} <spring:message
								code="whereused.results"></spring:message>)
						</strong>
					</div>
					<%@ include file="paginationHeader.jsp" %>
					<div id="whereuseddata"
						class="result-container col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					</div>
				</div>
				<%@ include file="paginationFooter.jsp" %>
			</div>
		

			<!-- footer container -->

			<footer> <%@ include file="footer.jsp"%>
			</footer>
		</form>
	</div>

	<!-- Javascript Plugins -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="../js/jstree.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>

	<!-- Libraries for pagination -->
	<!-- 	<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>  -->
	<script src="../js/jquery.simplePagination.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script src="../js/pagination.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js" defer></script>

	<script type="text/javascript">
    var previousURL = '${previousURL}';
    var isMachine = false;
    var oldURL = document.referrer;
    var isNonHome = false;
    var currentpageNumber = 1;
    if(previousURL !== '' && oldURL !== previousURL){
    	oldURL = previousURL;
    	$('#previousURL').val(oldURL);
    }else{
    	$('#previousURL').val(oldURL);
    }
	if(oldURL.indexOf("mymachine") != -1 ){
    	//$("#main-menu-list > li:nth-child(4)").addClass("active");
    }else if(oldURL.indexOf("homepage") != -1 ){
    	$("#main-menu-list > li:nth-child(1)").addClass("active");
    	isNonHome = true;
    }else if(oldURL.indexOf("shopforparts") != -1 ){
    	$("#main-menu-list > li:nth-child(2)").addClass("active");
    }else if(oldURL.indexOf("getmydocuments") != -1 ){
    	$("#main-menu-list > li:nth-child(5)").addClass("active");
    }
   /* else if(oldURL.indexOf("shopforparts") != -1 ){
	   //byuild vahicle
    	$("#main-menu-list > li:nth-child(3)").addClass("active");
    }else if(oldURL.indexOf("getmydocuments") != -1 ){
    	 //locate dealer
    	$("#main-menu-list > li:nth-child(6)").addClass("active");
    }*/
    else if(oldURL.indexOf("viewmachine") != -1 || (oldURL.indexOf("machinecatalogwhereused") != -1)){
    	$("#new-main-menu-list > li:nth-child(4)").addClass("active");
    	var assemblyUsedId = oldURL.substring(oldURL.lastIndexOf("=") + 1, oldURL.length);
    	var soldMachineURL = oldURL;
		isMachine = true;
		$(".breadcrumb").empty();
		$(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
		$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
		//Swetha changes starts to pass catalog Name	
		//$(".breadcrumb > li:last-child()").after('<li><a href="'+soldMachineURL+'">'+oldURL.substring(oldURL.lastIndexOf("=") + 1, oldURL.length)+'</li>');
		$(".breadcrumb > li:last-child()").after('<li><a href="'+soldMachineURL+'">${catalogName}</li>');
		$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="whereused.item"></spring:message> ${partNumber} <spring:message code="whereused.whereused"></spring:message></li>');							
    }
	if($("#new-main-menu-list > li").hasClass("active") && !isMachine){
		console.log("Bread Crumb"+$("#new-main-menu-list > li.active").html());
		if(!isNonHome){
			$(".breadcrumb > li:first-child").after('<li><a href="'+$("#new-main-menu-list > li.active a").attr('href')+'">'+$("#new-main-menu-list > li.active a > span").text()+'</li>');
		}
	} 
        $(function(){
            //$("#main-menu-list > li:nth-child(2)").addClass("active");
            // Initilizing Catalog Tree
            //initilizeTreeCtrl();
            $('#treeShopforParts.treeview-hldr').on('ready.jstree', function (e, data) {
                var treeinstance = $('#treeShopforParts.treeview-hldr').jstree(true);
                treeinstance.hide_dots();
                treeinstance.hide_stripes();
                treeinstance.hide_icons ();
                treeinstance.select_node('2');
            });
        });

    </script>

	<script type="text/javascript">
    var whereusedresultCount = ${whereusedresultCount};
    var size = ${size};
    var totalPage=Math.ceil(whereusedresultCount/size);
    if(whereusedresultCount>50){
		$('.hundred').removeClass('hidden');
	}else{
		$('.hundred').addClass('hidden');
	}
	if(whereusedresultCount>25){
		$('.fifty').removeClass('hidden');
	}else{
		$('.fifty').addClass('hidden');
	}
	if(whereusedresultCount>10){
		$('.twentyFive').removeClass('hidden');
	}else{
		$('.twentyFive').addClass('hidden');
	}
	if(whereusedresultCount>=1){
		$('.ten').removeClass('hidden');
	}else{
		$('.ten').addClass('hidden');
	}
	if(totalPage==0)
		$('#page-selection,#page-selection-top').hide();
	else{
		$('#page-selection,#page-selection-top').show();
		$('#partsPerPageDivFooter,#partsPerPageDivHeader').show();
	}
    
     $(document).ready(function() {
    	 $("#new-main-menu-list li a[href*='mymachine']").parent().addClass("active");
    	 var result = '${whereusedresult}';
    	 currentpageNumber = '${currentpageNumber}';
    	//added by kanishka
     	var previousUrl = document.referrer;
     	var manualStateChange = true;
     	//Fix for GSP-953 - Kameshwari Replaced ? with &
    	History.pushState({},"${properties['global.page.title']}","./"+History.getState().url.split('web/')[1]+"&state=99"); 
    	History.Adapter.bind(window,'statechange',function(){
    		    if(manualStateChange == true){
    		    	var x = previousUrl.split("/");
    		    	if(x[x.length-1] == "searchrequest"){//The state in Search result is defaulted to the adjacent one
    		    	 document.forms[0].action="searchrequest";
             	 	 document.forms[0].submit();
    	        	}else{
    	        		window.location.href = previousUrl;
    	        	}
    		    }
    		    manualStateChange = true;
    		});

    	
    	 //var currentpageNumber = '${currentpageNumber}';
    	 if(whereusedresultCount===0){
    	   $("#whereuseddata").append('<div class="tab-content"><p><spring:message code="search.noresultfound"></spring:message></p></div>');  
    	 }else{
    		 var whereusedobj = jQuery.parseJSON(result);//11-01-2015 A 5.5.2.0_EH_handling_Exception.
			 var partnum = "${partNumber}";
			 var partId = "${partId}";
    	  if(whereusedobj.whereused.parent instanceof Array){
    		  for (i = 0; i < size && i< whereusedresultCount; i++) { 
    			  var item=whereusedobj.whereused.parent[i];    			  
    			  var docServerUrl = "${properties['docserver.url']}";
	    			docServerUrl+='?media='+item.media_id+'&thumbnail=true&user='+$('#userId').val()+'&token='+$('#authToken').val();
	    			var appendStr  =  ' <a href="machinecatalogwhereused?catalogId='+item.catalog_id+'&catalogName='+item.catalog_name+'&partNumber='+partnum+'&partId='+partId+'&assemblyUsed='+ item.number +'">' +
		    		 '<div class="search-parts-templates clearfix  whereusedBox">' +
		             '<div class="machine-image">'+
		              ((item.media_id !== "" && item.media_id !== 0 )? '<img class="img-responsive" alt="catalog-img" src="'+docServerUrl+'">' : '<div class="no-image"></div> ')+
		             '</div>'+
		             '<div class="machine-details">'+
		               '<h4><span class="black font-nor"><spring:message code="whereused.assembly"></spring:message></span>' +((item.is_topic)? ' <spring:message code="whereused.group"></spring:message> ':" ")+ item.number + ' <span class="black font-nor"> <spring:message code="whereused.in"></spring:message></span></h4> '+
		                ' <span class="black font-nor"><spring:message code="whereused.catalog"></spring:message> ' +item.custom_field_3 + '</span>' + // Code changes for Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar)
		                ' <span>' +item.catalog_engg_desc +'</span> '+
		             '</div> '+
		        ' </div></a>' ;
		    	$("#whereuseddata").append(appendStr);
    		 }
    	 }
    	 else{
    		 var item=whereusedobj.whereused.parent;
    		
    		 var docServerUrl = "${properties['docserver.url']}";
 			docServerUrl+='?media='+item.media_id+'&thumbnail=true&user='+$('#userId').val()+'&token='+$('#authToken').val();
 			var appendStr  =  ' <a href="machinecatalogwhereused?catalogId='+item.catalog_id+'&catalogName='+item.catalog_name+'&partNumber='+partnum+'&partId='+partId+'&assemblyUsed='+ item.number +'">' +
	    		 '<div class="search-parts-templates clearfix  whereusedBox">' +
	             '<div class="machine-image">'+
	              ((item.media_id !== "" && item.media_id !== 0 )? '<img class="img-responsive" alt="catalog-img" src="'+docServerUrl+'">' : '<div class="no-image">  </div> ')+
	             '</div>'+
	             '<div class="machine-details">'+
	               '<h4><span class="black font-nor"><spring:message code="whereused.assembly"></spring:message></span>' +((item.is_topic)? ' <spring:message code="whereused.group"></spring:message> ':" ")+ item.number + ' <span class="black font-nor"> <spring:message code="whereused.in"></spring:message></span></h4> '+
	                ' <span class="black font-nor"><spring:message code="whereused.catalog"></spring:message> ' +item.custom_field_3+ '</span>' + // Code changes for Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar)
	                ' <span>' +item.catalog_engg_desc +'</span> '+
	             '</div> '+
	        ' </div></a>' ;
	    	$("#whereuseddata").append(appendStr);
    	 } 
    	      }
//     	 alert(size-dd);
    	  if(size!=""){
    		  $('#size').val(size);
    	  }
    	 $('#keyword').val('${search}');
 	    $('#typedropdown').val('${type}');

        if($('#keyword').val() != ""){
            $('a.clear-search').removeClass('hidden');
          }
                  
 	   //$('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value='+$("#typedropdown").val()+']').text());
 	    $('#fuzzy').val('${fuzzy}');
 	   $('div.no-image').each(function(){
      	 var containerHeight = $(this).height();
           var textHeight = $(this).find('p').height();
           var verticlePadding = (parseInt(containerHeight) - parseInt(textHeight))/2;
           $(this).find('p').css({'padding-top':verticlePadding ,'padding-bottom':verticlePadding});
      });
    }); 
    
	$( "#size" ).change(function(partId,partNumber) {
		 var result = '${whereusedresult}';
		 var whereusedobj = jQuery.parseJSON(result);
		 var part_id = whereusedobj.whereused.part_id;
		     var partnum = "\"${partNumber}\"";
			 var partId = "\"${partId}\"";
		document.forms[0].action="whereUsed?partId="+partId+"&partNumber="+partnum;
		document.forms[0].submit();	 
	});
	function performSearchPaging(number){
		$('#currentpageNumber').val(number);
		document.forms[0].action="searchrequest";
		document.forms[0].submit();
	};
	function setPartPerPage(arg){
		size = arg;
		fetchResultsforWhereused(1);
	}
	
	function breadCrumb(number){
		document.forms[0].action="searchrequest";
		document.forms[0].submit();
	};
	
	if(whereusedresultCount > size){
		paginationSetUp(totalPage,size,currentpageNumber);
		
	}else{
		$('#page-selection,#page-selection-top').hide();
	}
	
	function fetchResultsforWhereused(currentpageNumber){
		$(".pageLoader").show();
		//NREV-2219 fix starts(Developed by : Swetha)
		 var result1 = '';
		 var partId = '${partId}';
		 var partnum = "${partNumber}";
		 //currentpageNumber = '${currentpageNumber}';
		 totalPage  = Math.ceil(whereusedresultCount/size);
		 $.ajax({
			 type : "get",
			 url: "getWhereUsedResults?pageNumber="+currentpageNumber+"&partId="+partId+"&pageSize="+size, 
			 dataType : "json",
				 contentType : 'application/json;charset=ISO-8859-1',
			 success: function(result1){	
				 paginationSetUp(totalPage,size,currentpageNumber);
				
				 
			 var whereusedobj = result1;
			 $(".pageLoader").hide();
			$("#whereuseddata").empty();
	 		if(whereusedobj.whereused.parent instanceof Array){
		    		for (i = 0; i <= size ; i++) {
	    			item= whereusedobj.whereused.parent[i];
	    			var docServerUrl = "${properties['docserver.url']}";
	    			docServerUrl+='?media='+item.media_id+'&thumbnail=true&user='+$('#userId').val()+'&token='+$('#authToken').val();
	    			var appendStr  =  ' <a href="machinecatalogwhereused?catalogId='+item.catalog_id+'&catalogName='+item.catalog_name+'&partNumber='+partnum+'&partId='+partId+'&assemblyUsed='+ item.number +'">' +
		    		 '<div class="search-parts-templates clearfix  whereusedBox">' +
		             '<div class="machine-image">'+
		              ((item.media_id !== "" && item.media_id !== 0 )? '<img class="img-responsive" alt="catalog-img" src="'+docServerUrl+'">' : '<div class="no-image">  </div> ')+
		             '</div>'+
		             '<div class="machine-details">'+
		               '<h4><span class="black font-nor"><spring:message code="whereused.assembly"></spring:message></span>' +((item.is_topic)? ' <spring:message code="whereused.group"></spring:message> ':" ")+ item.number + ' <span class="black font-nor"> <spring:message code="whereused.in"></spring:message></span></h4> '+
		                ' <span class="black font-nor"><spring:message code="whereused.catalog"></spring:message> ' +item.custom_field_3+ '</span>' + // Code changes for Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar)
		                ' <span>' +item.catalog_engg_desc +'</span> '+
		             '</div> '+
		        ' </div></a>' ;
		    	$("#whereuseddata").append(appendStr);
	    	 }
	    	}else{
	    		 var item=whereusedobj.whereused.parent;
	    		 var docServerUrl = "${properties['docserver.url']}";
	    			docServerUrl+='?media='+item.media_id+'&thumbnail=true&user='+$('#userId').val()+'&token='+$('#authToken').val();
	    			var appendStr  =  ' <a href="machinecatalogwhereused?catalogId='+item.catalog_id+'&catalogName='+item.catalog_name+'&partNumber='+partnum+'&partId='+partId+'&assemblyUsed='+ item.number +'">' +
		    		 '<div class="search-parts-templates clearfix  whereusedBox">' +
		             '<div class="machine-image">'+
		              ((item.media_id !== "" && item.media_id !== 0 )? '<img class="img-responsive" alt="catalog-img" src="'+docServerUrl+'">' : '<div class="no-image">  </div> ')+
		             '</div>'+
		             '<div class="machine-details">'+
		               '<h4><span class="black font-nor"><spring:message code="whereused.assembly"></spring:message></span>' +((item.is_topic)? ' <spring:message code="whereused.group"></spring:message> ':" ")+ item.number + ' <span class="black font-nor"> <spring:message code="whereused.in"></spring:message></span></h4> '+
		                ' <span class="black font-nor"><spring:message code="whereused.catalog"></spring:message> ' +item.custom_field_3+ '</span>' + // // Code changes for Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar)
		                ' <span>' +item.catalog_engg_desc +'</span> '+
		             '</div> '+
		        ' </div></a>' ;
		    	$("#whereuseddata").append(appendStr);
	    	 }
			 },
			    error: function (jqxhr, status, error) {	  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.  						    	  
			    	 $(".pageLoader").hide();
			    	//alert("error text - "+jqxhr.responseText);	 
		    } 
		});
	}
		
	function paginationSetUp(totalPage,size,currentpageNumber){
		if(size == 12) size = 10;
		$('#page-selection,#page-selection-top').pagination({
			pages:  totalPage,
			itemsOnPage: size,
			currentPage: currentpageNumber,
			cssStyle: 'light-theme',
			onPageClick: function(pageNumber, event){
				fetchResultsforWhereused(pageNumber);
			}
		});
	}
	
	function replaceWith(content) {
		return content.toString().replace(new RegExp('<b>', 'g'), '').replace(new RegExp('</b>', 'g'), '');
	}
    </script>

</body>

</html>
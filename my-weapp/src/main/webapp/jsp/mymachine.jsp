<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="application/json"
	charset="ISO-8859-1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>


<jsp:include page="googleAnalytics.jsp" />

<!-- CSS -->
<!-- build:css ../assets/globalstyles.min.css -->
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
<!-- /build -->
<!-- build:css ../assets/default/tree-style.min.css -->
<!-- /build -->
<!-- build:css ../assets/theme.min.css -->
<!-- /build -->
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

<!-- <link rel="shortcut icon" href="../images/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/apple-touch-icon-57-precomposed.png"> -->
<!-- Javascript Plugins -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<!-- Libraries for pagination plugin-->
<script
	src="../js/jquery.bootpag.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="../js/jquery.bootpag.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>

</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper extn-machines">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header class="extn-machines">
				<%@ include file="header.jsp"%>
				<!--- This is for Breadcrumbs -->
				<div id="breadCrumb" class="breadcrumbs-list pt-xs-61">
					<ul class="breadcrumb">
						<li><a href="homepage"><spring:message
									code="labe.mymachines.home"></spring:message></a></li>
						<li class="active"><spring:message code="label.mymachines"></spring:message></li>
					</ul>
				</div>
				<div class="container-fluid content-wrapper extn-machines">
					<div class="row-fluid">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
							style="background-color: #ffffff;">
							<div class="col-md-3 col-sm-3 col-xs-12 pl-xs-0">
								<h3 style="margin: 0px 0px;">
									<spring:message code="label.mymachines"></spring:message>
									&nbsp;<span style="font-size: 13px;"> ( ${catalogCount }
										<spring:message code="label.mymachine.results"></spring:message>
										)
									</span>
								</h3>
							</div>
							<div class="col-md-4 col-sm-3 col-xs-12 nopadding">
								<div class="pull-right xs-no-pullright">
									<div class="col-md-2 pl-xs-0">
										<!-- Fix for GSP-327: added lbl-nowrap Modified by Kameshwari Popuri -->
										<label class="lbl-divisions-cmb lbl-nowrap"
											for="divisions-cmb"><spring:message
												code="display.organizationName" />:</label>
									</div>
									<div class="col-md-10 col-xs-12 text-right xs-search-style">
										<div class="dropdown pad0">
											<button
												class="btn btn-default dropdown-toggle cmb-divisions-dpdown"
												type="button" data-toggle="dropdown" aria-expanded="false">
												<span class="search-options-label hidden-xs divisionSearch">All</span>
												<span class="caret-big"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-left"
												id="divisions-dropdown" aria-labelledby="cmb-divisions">
												<li data-value="0"><a href="#"><spring:message
															code="search.searchall" /></a></li>
												<c:forEach var="type" items="${orgDropdownList}">
													<li data-value="${type.key}"><a href="#">${type.value}</a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-5 col-sm-6 nopadding">
								<div class="input-group" id="machine-search-hldr">
									<span class="input-group-btn search-panel">
										<button type="button"
											class="btn btn-default dropdown-toggle machine-searchall-dpdown"
											data-toggle="dropdown" aria-expanded="false">
											<span class="search-options-label hidden-xs"><spring:message
													code="view.label.serial.no" /></span> <span class="caret-big"></span>
										</button>
										 <c:set var = "isVinNoRequired" value="${properties['vinNo.required']}"></c:set>
										<ul class="dropdown-menu dropdown-menu-left"
											id="machine-dropdown" role="menu">
											<!-- changes done for VIN search feedback. -->
											<li data-value="1"><a href="#"><spring:message
														code="view.label.serial.no" /></a></li>
											<li data-value="2"><a href="#"><spring:message
														code="search.catalog.catalogReference" /></a></li>
											<li data-value="3"><a href="#"><spring:message
														code="search.catalog.model" /></a></li>
											<li data-value="4"><a href="#"><spring:message
														code="search.catalog.customerName" /></a></li>
											<!-- changes done for VIN search feedback. -->
											<c:if test="!${isVinNoRequired}">
												<li data-value="5"><a href="#"><spring:message
														code="search.catalog.vinNo" /></a></li>
											</c:if>
											<li data-value="6"><a href="#"><spring:message
														code="search.catalog.jobNo" /></a></li>
										</ul>
									</span> <input type="text" class="form-control search-input"
										placeholder="<spring:message code="label.search.search"/>" />
									<span class="input-group-addon search_icon" id="machine-search">
										<i class="fa fa-search fa-2x"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>

			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="row nopadding">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "
							style="border-bottom: 1px solid #ccc;">

							<%-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-8 nopadding pull-right"
								id="myVehiclesStats">
								<div class="pull-right">
									<input type="text" id="statusValue" value="${status}" hidden />
									<input type="text" id="catalogNameVal" value="${catalogName }"
										hidden /> <input type="text" id="editVal"
										value="${editValue }" hidden /> <input type="text"
										id="CatalogReferenceNameVal" value="${catalogReferenceName }"
										hidden /> <label><spring:message code="label.sortby" /></label>
									<select name="sortSelect" id="sortSelect"
										onchange="performSorting(this.value)">
										<option value="catalogName"><spring:message
												code="display.catalogserialnumber"></spring:message></option>
										<option value="catalogModel"><spring:message
												code="display.catalog.model"></spring:message></option>
										<option value="description"><spring:message
												code="label.export.commercialdescription"></spring:message></option>
										<option value="customerName"><spring:message
												code="display.catalog.customerName"></spring:message></option>
										<!--  
                              These 2 lines commented for DME since they don't need  VIN# & JOB# ,Need to enable for ASV
                              <option value="customField1"><spring:message code="display.catalog.customField1"></spring:message> </option>
                              <option value="customField2"><spring:message code="display.catalog.customField2"></spring:message> </option> -->
										<option value="organizationName"><spring:message
												code="display.organizationName"></spring:message></option>
									</select>
								</div>
							</div> --%>
						</div>
						<p id="Value" class="alert-text" style="text-align: center;">
							${statusCatalog}</p>
					</div>
					<div id="myMachineContent" class="mt-xs-150"></div>
				</div>
				<!-- <div class="row">
          <div class="col-sm-12 text-center hidden-xs" id="page-selection"></div>
                  <div class="col-sm-12 text-center visible-xs" id="page-selection-xs"></div> 
                      </div> -->
			</div>
			<a href="javascript:void(0);" class="cd-top"
				title='<spring:message code="label.scroll.top"/>'><spring:message
					code="label.footer.top" /></a>
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
			<div class="lazyLoader hidden">
				<div class="lazySpinner"></div>
			</div>
		</form>
	</div>

	<div class="modal bs-example-modal-md" id="confirmationWindow" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content custom-modal-content">
				<div class="modal-header custom-modal-header">
					<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
					<h4 class="modal-title custom-modal-title">
						<spring:message code="label.bulkpartupload.information" />
					</h4>
				</div>
				<div class="modal-body confirm-modal-body">
					<!-- Content for the dialog / modal goes here. -->
					<p class="dialog-content"></p>
				</div>
				<div class="modal-footer">
					<a class="col btn btn-ok" href="javascript:;"><spring:message
							code="label.myaccount.ok" /></a> <input type="hidden"
						id="confirmBoxType" />
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	var catalogCount = '${catalogCount}'; 
	var isVinNoRequired = "${properties['vinNo.required']}";
    if(catalogCount == 0){
      $("#myMachineContent").append('<div class="tab-content"><p class="errorText"><spring:message code="label.novehicles"></spring:message></p></div>');
      $("#myVehiclesStats").addClass('hidden');
    
    }
    //$("#main-menu-list > li:nth-child(4)").addClass("active");
    $("#new-main-menu-list > li:visible").find("a:contains(<spring:message code='label.header.myvehicle'/>)").parent().addClass('active')
    
    //var pageSize = '${pageSize}'; 
    var pageSize = 12;
    var pageNo = 1;
    var jPageNo = 1;
    var jsonCallOn = false;
    var populateingMac = false;
    var lastPageFetched = false;
    /* if('${pageNo}' != null && '${pageNo}'>1){
    	pageNo = '${pageNo}';
    }*/
    var mymachines = '${machineListJson}';
    var mymachineJSON = jQuery.parseJSON(mymachines);
    lastPageFetched = mymachineJSON.lastPage;
    mymachineJSON = mymachineJSON.catalogList;
    var mymachineJSON_temp = null;
    
    var organizationIdSelected = ${organizationIdSelected};
    var searchTypeSelected = ${searchTypeSelected};

    var searchStringkeyIn = null;
    if(null != '${searchStringkeyIn}'){
    	searchStringkeyIn = '${searchStringkeyIn}';
    }
	
    if(null != organizationIdSelected && organizationIdSelected != ""){
    	 $('.cmb-divisions-dpdown').val(organizationIdSelected);
    	 //Fix for NREV-750
    	 $('.cmb-divisions-dpdown > span.search-options-label').text( $("#divisions-dropdown li[data-value='"+organizationIdSelected+"'] a").text() );
    }
	if(null != searchTypeSelected && searchTypeSelected != ""){
		$('.machine-searchall-dpdown').val(searchTypeSelected);
		$('.machine-searchall-dpdown > span.search-options-label').text( $("#machine-dropdown li[data-value*='"+searchTypeSelected+"'] a").text() );
    }
	if(null != searchStringkeyIn && searchStringkeyIn != ""){
		$('#machine-search-hldr .search-input').val(searchStringkeyIn);
	}
    
    populateMachies((pageNo-1)*pageSize,(pageNo*pageSize)-1);
    $(window).on('scroll',function(e){
    	var $document=$(document);
        var $window=$(this);
        organizationIdSelected = ${organizationIdSelected};
        searchTypeSelected = ${searchTypeSelected};
        if(null != '${searchStringkeyIn}'){
        	searchStringkeyIn = '${searchStringkeyIn}';
        }

       
       	//if($('.pageLoader').is(':hidden')){ 
        if(!populateingMac){

          if(mymachineJSON_temp){
            mymachineJSON = mymachineJSON.concat(mymachineJSON_temp);
            mymachineJSON_temp = null;
          }

        	if($document.scrollTop() >= $document.height() - $window.height() - 100){
            var stindex = (pageNo-1)*pageSize;
            var length = (pageNo*pageSize) - 1;

            $('div.lazyLoader').removeClass('hidden');
            if((stindex <= catalogCount) && (mymachineJSON.length >= (stindex + length)) ){
              if(length > catalogCount)length = catalogCount;
              populateMachies(stindex,length);
              //setInterval(function () {$('div.lazyLoader').addClass('hidden');}, 3000);
              //$('div.lazyLoader').addClass('hidden');
              //console.log(pageNo);
            }else if(lastPageFetched && stindex < mymachineJSON.length){
              //$('div.lazyLoader').removeClass('hidden');
              populateMachies(stindex, mymachineJSON.length -1);
            }
        	}
      	}
        if($document.scrollTop() >= $document.height() - $window.height() - 100){
          if(!jsonCallOn && !lastPageFetched)fetchmachinejson(jPageNo);
          if(lastPageFetched)$('div.lazyLoader').addClass('hidden');
        }
    });
		
    $('#sortSelect').val("${sortBy}");
    $('.machine-edit-btn').on("click",function(){
      $(this).parents('.machine-edit').hide();
      $(this).parents('span').siblings('.save-machine').find('textarea').val($(this).parent().find('strong').text());
      $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'});
    });
         
    $('.add-machine').delegate(".save-machine-btn","click",function(){
  	  $(this).children('.save-machine').hide();
  	  $(this).children('.machine-edit').show().css({'display':'inline-block'}); 
  	  var input = $.trim($(this).children('.save-machine').find('textarea').val());
  	  $(this).children('.machine-edit').children('strong').html(input);
    });
     
    $('.add-machine').delegate(".cancel-machine-btn","click",function(){
      $(this).children('.save-machine').hide();
      $(this).children('.machine-edit').show(); 
    });
    $('.close-btn').on("click", function(){
      $(this).parents('.search-parts-templates').remove();
      //$("p.alert-text").addClass("close-message");
    });
		
	$('.add-machine-btn').click(function(){
      $(this).parents('.add-machine').hide();
      $(this).parents('.add-machine').children('.save-machine').show().css({'display':'inline-block'});
    });
		
	$('.cancel-machine-btn').on("click", function(){
		return false;
	});
    
    function performSorting(sortBy){
    	 $('div.pageLoader').show();	
    	var pagesize =  $('.whereusedBox').length;
    	window.location='mymachine?sortSelect='+sortBy;//+'&pageSize='+pagesize ;
    }

    //Change function for size
    $( "#result-per-page" ).change(function() {
	     $('div.pageLoader').show();	
    	var pagesize =  $('#result-per-page').val();
    	window.location='mymachine?sortSelect=catalogName';//&pageSize='+pagesize ;
    });
       
    function populateMachies(index ,size){
      populateingMac = true;
    	for(var i=index ; i <= size ; i++){
        //console.log("populateMachies index :" + i);
    		var item = mymachineJSON[i];
    		if(item && !isVinNoRequired){
    		  $("#myMachineContent").append(
                '<div class="search-parts-templates clearfix whereusedBox col-lg-4 col-md-4 col-sm-6 col-xs-12"> '+
                '<div class="machineTitle">'+ 
                /**
                *
                *changes made for RRG Vehicles Information.
                *Added the Label Messages.
                *moved VIN postion to searial number position.
                *
                **/
                //Code changes for Guest user myVehicles tab access starts(Developed By : Swetha , Reviewed By : Rajesh)
                ((undefined != item.customField1 )? ' <h4 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><spring:message code="search.catalog.vinNo"/> <span>'+item.customField1+'</span>' :'')+' </h4> '+               
                ((!item.isGuestCatalog)? ' <a id="'+item.catalogId+'" class="close-btn" onclick="deleteCatalog('+item.catalogId+',\''+item.catalogName+'\')"><i class="fa fa-trash-o delete-item hidden-xs" onclick="deleteCartItem(1042,event)"></i></a>' +
                (!(item.favorite)?' <a id="'+item.catalogId+'" class="fav-btn" title="Add to favorites" onclick="createfavorite('+item.catalogId+',\''+item.catalogName+'\')"><i class="fa fa-star no-fav-item hidden-xs"  ></i></a> ':' <a id="'+item.catalogId+'" class="fav-btn" title="Remove favorites" onclick="removefavorite('+item.catalogId+',\''+item.catalogName+'\')"><i class="fa fa-star fav-item hidden-xs"  ></i></a> '): '')+
                
                '</div>'+
               // ' <div class="machine-image"><img class="img-responsive" alt="catalog-img" src="../images/SABRE.jpg"></div> '+
               ((0 != item.mediaId)?'<div class="machine-image" onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><img class="img-responsive" alt="catalog-img" src="${properties['docserver.url']}?media='+item.mediaId+'&thumbnail=true&user='+$('#userId').val()+'&token='+$('#authToken').val()+'"></div>': '<div class="machine-image"><img class="img-responsive" alt="catalog-img" src="../images/gear_thumb.png"></div>' ) +
                ' <div class="machine-details"> '+
                ((undefined != item.customField2)? '<h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="search.catalog.jobNo"/></p><span>'+item.customField2+'</span></h6> ' :'')+
               /*  ' <strong><span> '+item.catalogEngineeringDescription+'</span> </strong>'+ */
                ((undefined != item.model)? '<h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="search.catalog.model"/></p><strong><span>'+item.model+'</span></strong></h6> ' :'')+
                
                /* ((undefined != item.customerName)? '<div style="margin-bottom:5px;"> <span>'+item.customerName+'</span> </div>' :'')+ */
                // Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar )
                ((undefined != item.customField3)?'<h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="view.label.serial.no"/></p> <span>'+item.customField3+'</span> </h6>':'')+
                
                '</div> <div class="machine-details machine-Detail100p"> '+
                ' <h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="lable.brand"/></p><span style="font-size:13px;line-height:2;">'+item.organizationName+'</span></h6> '+
            
                ' <span class="add-machine" style="margin-left: 0px; ">'+
                (!item.isGuestCatalog ? 
                ((undefined != item.catalogReference && item.catalogReference != "")? '<h6><p><spring:message code="search.catalog.catalogReference"/></p><span class="machine-edit"><strong>'+item.catalogReference+'</strong> <i class="fa fa-pencil machine-edit-btn" title="edit"></i></h6></span>':'<a href="javascript:void(0);" class="btn btn-primary btn-xs add-machine-btn theme-maroon" "><spring:message code="label.addreference"></spring:message></a>' ) +' </span>' : '')+
                ((item.isGuestCatalog && undefined != item.catalogReference && item.catalogReference != "")? '<h6><p><spring:message code="search.catalog.catalogReference"/></p><span class="machine-edit"><strong>'+item.catalogReference+'</strong> </h6></span>' : '')+' </span>'+
                ' <span class="save-machine"><textarea type="text" id="'+item.catalogId+'" style="width:90%"></textarea>'+
                ' <a onclick="editCatalog('+item.catalogId+',\''+escape(item.catalogReference)+'\',\''+item.catalogName+'\')"  class="btn btn-primary btn-xs save-machine-btn"><i class="fa fa-check fa-fw" title="save"></i></a> <a class="btn btn-xs cancel-machine-btn theme-maroon" onclick="masking()"><i class="fa fa-times fa-fw" title="cancel"></i></a></span> '+
                //Code changes for Guest user myVehicles tab access ends
                 '<input id="msg" type="hidden" value="<spring:message code="label.delete.confirm"></spring:message>"/> '+
                '<input id="msg-contact-admin" type="hidden" value="<spring:message code="label.delete.contact.admin"></spring:message>"/> '+
					'<input id="msg-deleted" type="hidden" value="<spring:message code="label.deleted"></spring:message>"/> '+
					'<input id="msg-edited" type="hidden" value="<spring:message code="label.edited"></spring:message>"/> '+
					'<input id="msg-edit-error" type="hidden" value="<spring:message code="label.edit.error"></spring:message>"/> '+
					'<input id="msg-edit-error-part" type="hidden" value="<spring:message code="label.edit.error.part"></spring:message>"/> '+
					'<input id="msg-add-reference" type="hidden" value="<spring:message code="label.reference.text"></spring:message>"/> '+
					'<input id="msg-add-msg" type="hidden" value="<spring:message code="label.added"></spring:message>"/> '+
                ' </div> '+
                ' </div>'
    		 );
    		}
    		else if(item && isVinNoRequired){
    			$("#myMachineContent").append(
    	                '<div class="search-parts-templates clearfix whereusedBox col-lg-4 col-md-4 col-sm-6 col-xs-12"> '+
    	                '<div class="machineTitle">'+ 
    	                /**
    	                *
    	                *changes made for RRG Vehicles Information.
    	                *Added the Label Messages.
    	                *moved VIN postion to searial number position.
    	                *
    	                **/
    	                //Code changes for Guest user myVehicles tab access starts(Developed By : Swetha , Reviewed By : Rajesh)
    	                ((undefined != item.customField3 )? ' <h4 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><spring:message code="view.label.serial.no"/> <span>'+item.customField3+'</span>' :'')+' </h4> '+               
    	                ((!item.isGuestCatalog)? ' <a id="'+item.catalogId+'" class="close-btn" onclick="deleteCatalog('+item.catalogId+',\''+item.catalogName+'\')"><i class="fa fa-trash-o delete-item hidden-xs" onclick="deleteCartItem(1042,event)"></i></a>' +
    	                (!(item.favorite)?' <a id="'+item.catalogId+'" class="fav-btn" title="Add to favorites" onclick="createfavorite('+item.catalogId+',\''+item.catalogName+'\')"><i class="fa fa-star no-fav-item hidden-xs"  ></i></a> ':' <a id="'+item.catalogId+'" class="fav-btn" title="Remove favorites" onclick="removefavorite('+item.catalogId+',\''+item.catalogName+'\')"><i class="fa fa-star fav-item hidden-xs"  ></i></a> '): '')+
    	                
    	                '</div>'+
    	               // ' <div class="machine-image"><img class="img-responsive" alt="catalog-img" src="../images/SABRE.jpg"></div> '+
    	               ((0 != item.mediaId)?'<div class="machine-image" onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><img class="img-responsive" alt="catalog-img" src="${properties['docserver.url']}?media='+item.mediaId+'&thumbnail=true&user='+$('#userId').val()+'&token='+$('#authToken').val()+'"></div>': '<div class="machine-image"><img class="img-responsive" alt="catalog-img" src="../images/gear_thumb.png"></div>' ) +
    	                ' <div class="machine-details"> '+
    	                ((undefined != item.customField2)? '<h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="search.catalog.jobNo"/></p><span>'+item.customField2+'</span></h6> ' :'')+
    	               /*  ' <strong><span> '+item.catalogEngineeringDescription+'</span> </strong>'+ */
    	                ((undefined != item.model)? '<h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="search.catalog.model"/></p><strong><span>'+item.model+'</span></strong></h6> ' :'')+
    	                
    	                /* ((undefined != item.customerName)? '<div style="margin-bottom:5px;"> <span>'+item.customerName+'</span> </div>' :'')+ */
    	                // Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar )
    	                //((undefined != item.customField3)?'<h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="view.label.serial.no"/></p> <span>'+item.customField3+'</span> </h6>':'')+
    	                
    	                '</div> <div class="machine-details machine-Detail100p"> '+
    	                ' <h6 onclick="window.location.href=\'viewmachine?catalogId='+item.catalogId+'&assemblyNumber='+item.catalogName+'&mediaId='+item.mediaId+'\'"><p><spring:message code="lable.brand"/></p><span style="font-size:13px;line-height:2;">'+item.organizationName+'</span></h6> '+
    	            
    	                ' <span class="add-machine" style="margin-left: 0px; ">'+
    	                (!item.isGuestCatalog ? 
    	                ((undefined != item.catalogReference && item.catalogReference != "")? '<h6><p><spring:message code="search.catalog.catalogReference"/></p><span class="machine-edit"><strong>'+item.catalogReference+'</strong> <i class="fa fa-pencil machine-edit-btn" title="edit"></i></h6></span>':'<a href="javascript:void(0);" class="btn btn-primary btn-xs add-machine-btn theme-maroon" "><spring:message code="label.addreference"></spring:message></a>' ) +' </span>' : '')+
    	                ((item.isGuestCatalog && undefined != item.catalogReference && item.catalogReference != "")? '<h6><p><spring:message code="search.catalog.catalogReference"/></p><span class="machine-edit"><strong>'+item.catalogReference+'</strong> </h6></span>' : '')+' </span>'+
    	                ' <span class="save-machine"><textarea type="text" id="'+item.catalogId+'" style="width:90%"></textarea>'+
    	                ' <a onclick="editCatalog('+item.catalogId+',\''+escape(item.catalogReference)+'\',\''+item.catalogName+'\')"  class="btn btn-primary btn-xs save-machine-btn"><i class="fa fa-check fa-fw" title="save"></i></a> <a class="btn btn-xs cancel-machine-btn theme-maroon" onclick="masking()"><i class="fa fa-times fa-fw" title="cancel"></i></a></span> '+
    	                //Code changes for Guest user myVehicles tab access ends
    	                 '<input id="msg" type="hidden" value="<spring:message code="label.delete.confirm"></spring:message>"/> '+
    	                '<input id="msg-contact-admin" type="hidden" value="<spring:message code="label.delete.contact.admin"></spring:message>"/> '+
    						'<input id="msg-deleted" type="hidden" value="<spring:message code="label.deleted"></spring:message>"/> '+
    						'<input id="msg-edited" type="hidden" value="<spring:message code="label.edited"></spring:message>"/> '+
    						'<input id="msg-edit-error" type="hidden" value="<spring:message code="label.edit.error"></spring:message>"/> '+
    						'<input id="msg-edit-error-part" type="hidden" value="<spring:message code="label.edit.error.part"></spring:message>"/> '+
    						'<input id="msg-add-reference" type="hidden" value="<spring:message code="label.reference.text"></spring:message>"/> '+
    						'<input id="msg-add-msg" type="hidden" value="<spring:message code="label.added"></spring:message>"/> '+
    	                ' </div> '+
    	                ' </div>'
    	    		 );
    		}
    		else{
          console.log("Empty ITEM #" + i);
        }
    	}
      //if(!jsonCallOn){
        $('div.lazyLoader').addClass('hidden');
      //}
      pageNo++;
      //console.log("populateMachies - " + pageNo);
      if(mymachineJSON_temp){
        mymachineJSON = mymachineJSON.concat(mymachineJSON_temp);
        mymachineJSON_temp = null;
      }
      populateingMac = false;


  		$('.machine-edit-btn').on("click", function(){
        $(this).parents('.machine-edit').hide();
       /*  $(this).parents('span').siblings('.save-machine').find('input').val($(this).parent().find('strong').text());
        $(this).parents('span').siblings('.save-machine').show(); */
        var value = $(this).siblings('strong').text();
          $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'}).children('textarea').val(value);
      });
  		 
		  $('.add-machine').delegate(".cancel-machine-btn","click",function(){
			   $('div.pageLoader').show();
         $(this).children('.save-machine').hide();
         $(this).children('.machine-edit').show(); 
         $('div.pageLoader').hide();
         /* $(this).parents('span').siblings('.machine-edit').show(); */
      });
  		 
		  $('.add-machine').delegate(".save-machine-btn","click",function(){
     	  $(this).children('.save-machine').hide();
     	  var input = $.trim($(this).siblings('.save-machine').find('textarea').val())
     	  $(this).children('.machine-edit').show().children('strong').html(input);
      });
  		 
      $('.close-btn').on("click", function(){
        $(this).parents('.search-parts-templates').remove();
      });

		  $('.add-machine-btn').on("click", function(){
        $(this).parents('.add-machine').hide();
        $(this).parents('span').siblings('.save-machine').show().css({'display':'inline-block'});
      });
		  $('alert-text').fadeOut(1000);
    };
        
    function editCatalog(catalogId,catalogRef,catalogName){
    	//var value=$('textarea#'+catalogId).text();
    	//Fix loader values 
    	$("div.pageLoader").find("h4").text("Loading......");
    	var textL = $('textarea').length
    	for(var i=0;i< textL; i++){
    		var myText = $('textarea')[i]
    		if( $(myText).attr('id') == catalogId ){
    			var value = $(myText).val();
    		}
    	}
    		
    	
    	value= value.trim();
    	var editedMsg=document.getElementById("msg-edited").value;
    	var addReference=document.getElementById("msg-add-reference").value;
    	var addReferenceMsg=document.getElementById("msg-add-msg").value;
    	editedMsg = editedMsg.trim();
  		if(value.length > 126){
  			alert("Exceeds 126 Characters");
  		} else {   	
        $('#Value').hide();
        $('div.pageLoader').show();
        var $containerwidth = $(window).width();
        if($containerwidth>768){
          var pageNumber =  $('#page-selection>.pagination.bootpag>li.active').children('a').text();
        }
        else{
          var pageNumber =  $('#page-selection-xs>.pagination.bootpag>li.active').children('a').text();
        }
			
  			if(catalogRef==value &&  value != ''){
  				 $('div.pageLoader').hide();	
  				 $('.machine-edit').show(); 
  				 $('.save-machine').hide();
  				 $('#Value').hide();
  			}
  			//console.log("Test =="+value);
  			//alert(value.length);
  			//if(value.length!=0){
  			else{
        		$.ajax({
        			type: "POST",
        			url: "editCatalog",
        			data: {catalogId:catalogId,value:value,catalogName:catalogName},
        			success: function(data){
        				var response=JSON.parse(data);
        				if(response.oldValue=="noOldValueFound"){
        					var mg=addReference+" "+response.catalogName + " " +addReferenceMsg;
        					$('.modal-body').text(mg);
        					$('div.pageLoader').hide();	
        					$("#confirmationWindow").show();
        					//window.location.href="machinestatus?message="+empty+"&pageNo="+pageNumber+"&pageSize="+pageSize;
        				}
        				else{
        					var editMessage = addReference+" "+response.catalogName + " " +editedMsg;
        					$('.modal-body').text(editMessage);
        					$('div.pageLoader').hide();	
        					$("#confirmationWindow").show();
            				//window.location.href="machinestatus?message="+empty+"&pageNo="+pageNumber+"&pageSize="+pageSize;
            				
        				}
        				//console.log("KR"+data+"=="+pageNo+"=="+pageSize);
        				/* if(data=="noValue"){
        					alert("no val in db");
        				} */
        				
        			},																					
        			error: function(e){
        				console.log( e);																				
        			} 
        		});  
        }
			}
    };
        
    function deleteCatalog(catalogId,catalogName){
    	var delateConfim=document.getElementById("msg").value;
    	var label=document.getElementById("msg-edit-error-part").value;
    	var result=1;//confirm(delateConfim+" "+catalogName+" "+label);
    	$('div.pageLoader').show();	
    	$("div.pageLoader").find("h4").text("Loading ...");	
    	 var $containerwidth = $(window).width();
    	 if($containerwidth>768){
	       var pageNo =  $('#page-selection>.pagination.bootpag>li.active').children('a').text();
    	 }
			 else{
				var pageNo =  $('#page-selection-xs>.pagination.bootpag>li.active').children('a').text();
			 }
	     if(result){	
        		var contactAdminMsg=document.getElementById("msg-contact-admin").value;
        		var deletedMsg= document.getElementById("msg-deleted").value;
        		$.ajax({
        			type: "POST",
        			url: "deleteCatalog",
        			data: {catalogId:catalogId},
        			 success: function(data){
        		      	var message = JSON.parse(data);
       				 	if(message.successMsg=="failure"){
       				 		editMessage=contactAdminMsg;
       				 		$('.modal-body').text(editMessage);
    						$('div.pageLoader').hide();	
    						$("#confirmationWindow").show();
       				 		//window.location.href="machinestatus?message="+editMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
       				 		//$('div.col-sm-12 text-center').show();
       				 		//$('#page-selection').show();
       				 	}
       				 	else{
       				 		editMessage=catalogName+" "+deletedMsg;
       				 		
	       				 	$('.modal-body').text(editMessage);
							$('div.pageLoader').hide();	
							$("#confirmationWindow").show();
       				 		
       				 		//window.location.href="machinestatus?message="+editMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
       				 	}
        			},																					
        			error: function(e){
        				console.log( e);																				
        			} 
        		}); 
       			}else{
       				//alert("in else");
       				//$('.alert-text').empty();
       				//$('div.pageLoader').hide();	
       				//location.reload(); 
       				var nullMessage="";
       				$.ajax({
       					type: "POST",
       					 url: "machinestatus?message="+nullMessage+"&pageNo="+pageNo+"&pageSize="+pageSize,
       					 success: function(data){
       						 if(data!=""){
       							$('div.pageLoader').show();	
       							window.location.href="machinestatus?message="+nullMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
       							 //window.loaction.href="machinestatus?message="+nullMessage+"&pageNo="+pageNo+"&pageSize="+pageSize;
       						 }
       					 }
       					
       				});
       				$('div.pageLoader').hide();	
        	}
        };
        
        function masking(){
        	 $('.save-machine').hide();
        	 $('.machine-edit').show(); 
        	 $('.add-machine').show();
        	 //alert($('#Value').val());
        	 $('#Value').hide();
        	 //$('#Value').show();
        	 
        }
        
        function fetchmachinejson(jnextpageno){
        	// Assign handlers immediately after making the request,
        	// and remember the jqxhr object for this request
        	var searchCriteria = "";
        	searchCriteria =  "&organizationId=" + (( $(".cmb-divisions-dpdown").val() == "" ) ? 0 : $(".cmb-divisions-dpdown").val());
        	searchCriteria += "&searchType=" + (($('.machine-searchall-dpdown').val() == "") ? 1 : $('.machine-searchall-dpdown').val());
        	searchCriteria += "&searchString=" + encodeURIComponent($('#machine-search-hldr .search-input').val()); //Special character handling INC-723
        	searchCriteria += "&isSearch=false";
        	
        	console.log("searchCriteria - " + searchCriteria);
        	
        	jsonCallOn = true;
        	var jUrl = "mymachineJson?pageSize=" + jnextpageno + searchCriteria;
          	$('div.lazyLoader').removeClass('hidden');
          	var jqxhr = $.getJSON( jUrl, function(result) {
            $('div.lazyLoader').addClass('hidden');
            if(!populateingMac){        	
          	  mymachineJSON= mymachineJSON.concat(result.catalogList);
              //mymachineJSON.concat(result.catalogList);
              //$('div.lazyLoader').removeClass('hidden');
              populateMachies((pageNo-1)*pageSize , (pageNo*pageSize) - 1);
            }else{
              mymachineJSON_temp = result.catalogList;
            }

            lastPageFetched = result.lastPage;
            jPageNo++;
            jsonCallOn = false;

        	})
    	  	.fail(function() {
    	    	console.log( "fetchmachinejson ...error" );
    	    	jsonCallOn = false;
    	  	});
        };
        $("#machine-search-hldr #machine-search").on("click", function(){
        	var searchCriteria = "";
        	searchCriteria =  "&organizationId=" + (( $(".cmb-divisions-dpdown").val() == "" ) ? 0 : $(".cmb-divisions-dpdown").val());
        	searchCriteria += "&searchType=" + (($('.machine-searchall-dpdown').val() == "") ? 1 : $('.machine-searchall-dpdown').val());
        	searchCriteria += "&searchString=" + encodeURIComponent($('#machine-search-hldr .search-input').val()); //Special character handling INC-723
        	
        	console.log("searchCriteria - " + searchCriteria);
        	//Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar )
        	window.location='mymachine?sortSelect=serialNumber'+searchCriteria;
        	/*pageNo = 1;
            jPageNo = 1;
            jsonCallOn = false;
            populateingMac = false;
            lastPageFetched = false;
            mymachineJSON = ""
            mymachineJSON_temp = null;
            
            $("#myMachineContent").empty();
            fetchmachinejson(pageNo);*/
            
        });
        $('#machine-search-hldr .search-input').on("keypress", function(evt){
        	if(evt.which ===13){
        		$("#machine-search-hldr #machine-search").click();
        	}
        });
        $(document).ready(function($){
          
       //   $('#callingLocation').val('mymachines');
         
          //dropdown select event
          $('#machine-dropdown.dropdown-menu li a, #divisions-dropdown li a').off( "click");
          $('#machine-dropdown.dropdown-menu li a').on('click',function(){
        	 $('.machine-searchall-dpdown > span.search-options-label').text($(this).text());
        	 $('.machine-searchall-dpdown').val($(this).parent().data("value"));
          });
          $('#divisions-dropdown.dropdown-menu li a').on('click',function(){
        	 $('.cmb-divisions-dpdown > span.search-options-label').text($(this).text());
        	 $('.cmb-divisions-dpdown').val($(this).parent().data("value"));
          });
          if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1)
          {
            $('#myMachineContent>.search-parts-templates').css({'display':'inline-block'});
          }
          // browser window scroll (in pixels) after which the "back to top" link is shown
          var offset = 300,
          //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
          offset_opacity = 1200,
          //duration of the top scrolling animation (in ms)
          scroll_top_duration = 700,
          //grab the "back to top" link
          $back_to_top = $('.cd-top');

          //hide or show the "back to top" link
          $(window).scroll(function(){
            ( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
            if( $(this).scrollTop() > offset_opacity ) { 
              $back_to_top.addClass('cd-fade-out');
            }
          });

          //smooth scroll to top
          $back_to_top.on('click', function(event){
            event.preventDefault();
            $('body,html').animate({
              scrollTop: 0 ,
              }, scroll_top_duration
            );
          });

        });
        
        $(".btn-ok").click(function(){
        	$('div.pageLoader').show();	
        	var $containerwidth = $(window).width();
        	if($containerwidth>768){
     	     	var pageNumber =  $('#page-selection>.pagination.bootpag>li.active').children('a').text();
         	 }
     		else{
     			var pageNumber =  $('#page-selection-xs>.pagination.bootpag>li.active').children('a').text();
     		}
        	var emptyMsg='';
        	//Using customField3 for Serial Number. (Developed By : Kameshwari , Reviewed By : Jayakumar )
        	window.location.href="mymachine?sortSelect=serialNumber";
        	
        });
       
        //Favorite catalog's INC-764
        function createfavorite(catalogId,catalogname){
        	console.log("Html ele" +this);
        		$.ajax({
         			type: "POST",
         			url: "addtofavorites",
         			data: {catalogId:catalogId},
         			success: function(data){
         				console.log("Result :"+data);
         				//alert("Catalog :  "+catalogname +" is added to favorites.");fav-btn
         				if(jQuery.parseJSON(data)){
         					$(".machineTitle").find("a#"+catalogId).find(".no-fav-item").addClass("fav-item");
             				$(".machineTitle").find("a#"+catalogId).find(".no-fav-item").removeClass("no-fav-item");
         					$("div.pageLoader").find("h4").text("<spring:message code="addremove.favourites"/> :  "+catalogname +" <spring:message code="label.added_favorites"/>");	
         					var event = $(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick").replace("createfavorite","removefavorite");
             				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick",event);
             				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("title","Remove favorites");
         				}else{
         					$("div.pageLoader").find("h4").text("<spring:message code="addremove.favourites"/> :  "+catalogname +" <spring:message code="label.already_favorites"/>");
         				}
         				$("div.pageLoader").show().fadeOut(5000);
         				//$("div.pageLoader").find("h4").text(x);
         			},error:function(e){
         				console.log(e);
         			}
         			});
        		$("div.pageLoader").find("h4").text("Loading ...");	
        	 
        }
        function removefavorite(catalogId,catalogname){
        	$.ajax({
     			type: "POST",
     			url: "removefavorites",
     			data: {catalogId:catalogId},
     			success: function(data){
     				console.log("Result :"+data);
     				$(".machineTitle").find("a#"+catalogId).find(".fav-item").addClass("no-fav-item");
     				$(".machineTitle").find("a#"+catalogId).find(".fav-item").removeClass("fav-item");
     				var event = $(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick").replace("removefavorite","createfavorite");
     				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("onclick",event);
     				$(".machineTitle").find("a#"+catalogId+".fav-btn").attr("title","Add to favorites");
     				$("div.pageLoader").find("h4").text("<spring:message code="addremove.favourites"/> :  "+catalogname +" <spring:message code="label.removed_favorites"/>");
     				$("div.pageLoader").show().fadeOut(5000);
     			//	alert("Catalog :  "+catalogname +" is removed to favorites.");
     				//$("div.pageLoader").find("h4").text(x);
     			},error:function(e){
     				console.log(e);
     			}
     			});
        	$("div.pageLoader").find("h4").text("Loading ...");	
        }
        
      </script>

	<script type="text/javascript">
 	 var hotspotType= '${hotspotType}';
  
  	 /*SUPPORT MIL-215 210116*/ 
  	 /*INC-1083 Hide usersnap in Production*/
      var flag='${properties['value.show.usersnap']}';
	  	if(flag=="true"){
	  		 (function() {
	 	    	var s = document.createElement("script");
	 	        s.type = "text/javascript";
	 	        s.async = true;
	 	        s.src = '//api.usersnap.com/load/'+'${properties['usersnap.api.key']}';
	 	        var x = document.getElementsByTagName('script')[0];
	 	        x.parentNode.insertBefore(s, x);
	 	        })(); 		
	  	}
		 
	</script>




</body>
</html>
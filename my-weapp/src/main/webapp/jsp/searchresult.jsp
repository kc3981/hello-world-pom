<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
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

<!-- <script src="//code.jquery.com/jquery-2.1.3.min.js?version=${properties['application.version']}"></script> -->
<script
	src="../js/jquery-2.1.0.min.js?version=${properties['application.version']}"></script>
<script
	src="../js/jquery.bootpag.min.js?version=${properties['application.version']}"></script>
<!-- Javascript Plugins -->
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
	type="text/javascript"></script>
<script
	src="../js/jquery-ui.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/bootstrap.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/jquery.bootpag.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/less.min.js?version=${properties['application.version']}"></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<!--19-01-2016  5.5.1.0_EH_ajax_error_msg.-->
<script
	src="../balupton-history.js-3d4593f/scripts/bundled/html4+html5/jquery.history.js"></script>

<ul id="hdnbdcrumb" style="display: none;">
	<li><sec:authorize access="hasRole('ROLE_CART')">
			<a id="createquotebreadcrumb" class="btn quote_continue quote-button"><span><spring:message
						code="label.create.quote" /></span></a>
		</sec:authorize></li>
	<li><sec:authorize access="hasRole('ROLE_ORDER')">
			<a id="placeorderbreadcrumb" class="btn quote_continue quote-button"><span><spring:message
						code="label.cart.place.order" /></span></a>
		</sec:authorize></li>
	<!-- <li><a id ="generalbread"  class="btn quote_continue quote-button"><span>Bread Crumb</span></a></li> -->
	<%--             <li><sec:authorize access="hasRole('ROLE_CREATE_DIRECT_QUOTE')"><a href="directquotebrand"><span>Request for Quote</span></a></sec:authorize></li> --%>
	<%--             <li><sec:authorize access="hasRole('ROLE_CREATE_DIRECT_ORDER')"><a href="directorderbrand"><span>Place Order</span></a> </sec:authorize></li> --%>
	<%--             <li><sec:authorize access="hasRole('ROLE_ADMIN')"><a href="../htmls/under-construction-page.html" target="_blank">Admin</a></sec:authorize></li> --%>
	<!--             <li><a href="cartbulkpartupload"><span>Bulk Order Parts</span></a></li> -->
	<%--             <li><sec:authorize access="hasRole('ROLE_DASHBOARD')"><a href="../htmls/under-construction-page.html" target="_blank">Analytics</a></sec:authorize></li> --%>
</ul>


<script type="text/javascript">
var searchGlobalKey = '${search}';
	function whereUsed(partId) { 
    			document.forms[0].action="whereUsed?partId="+partId;
    			document.forms[0].submit();					
    		}
			
	var from;
	var type ;

	$(document).ready(function() {
		//OM-1759: browser back button. Added by Pooja
		var previousUrl = document.referrer;
       	var manualStateChange = true;
   		History.Adapter.bind(window,'statechange',function(){
   		    if(manualStateChange == true){
   		    	var x = previousUrl.split("/");
   		    	if(x[x.length-1] == "searchrequest?state=99"){//The state in Search result is defaulted to the adjacent one
   		    	 document.forms[0].action="searchrequest";
            	 document.forms[0].submit();
	   	        	}else if(x[x.length-1] == "createorderreview"){
	   		       		window.location.href = "homepage";
   	        	}else{
   	        		window.location.href = previousUrl;
   	        	}
   		    }
   		    manualStateChange = true;
   		}); 
		/* History.replaceState({},null,History.getState().url+"?requestSearch"); */
		 var  myErrObj = new errnsp.errHandling.init();
		//clear active tab
		$('#main-menu-list > li').each(function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active');
			}
		});
		$('div.pageLoader').show();
		 var error ='${error}';	
		 if(error == "error"){
		 	//$('.error-msg').show();
		 	$('div.pageLoader').hide();
		 	$("#mywrapper").empty()
		 	//$('#mywrapper').html("<spring:message code='message.elastic.search' javaScriptEscape='true'/>");
		  //12-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.	            	
           // $('.modal-body').html("<p class='errorText'><spring:message code='message.elastic.search' javaScriptEscape='true'/></p>");
		  //  $("#myModal").show();		
		 	var err = "500";
		 	var status="500";
	        var msg ="<spring:message code="message.elastic.search"></spring:message>";
           	myErrObj.raise(err,msg,status);
		}else{		
		 var result = '${result}';
		 var search = '${search}';
		 var typedropdown = '${type}';
		 var lang ='${languageName}';
		 var viewEngDesc = '${viewEngDesc}';
		 var viewVendorPart = '${viewVendorPart}';
		 var fuzzy = '${fuzzy}'; 	
		 var desc=0;
		 var d, i;
		 var userid=$('#userId').val();
		 var authtoken = $('#authToken').val();
		 var prevURL = $('#previousURL').val().toString();
		 var whereusedflag = false;
		 var partVoList = {};
		 var items = [];
	 	 var organizationId;

			 var obj = jQuery.parseJSON(result);
			$.each( obj, function(i, item){
				if(i==0){
					if(item.totalhits<=10){
						$("#page-selection").hide();
					}
					else if(item.totalhits==0){
						 var clickresults = "";
						 ((!(typedropdown === "all")) ? clickresults =', <spring:message code="search.clickallresults"></spring:message>' :"");
						
						 $('.tab-content p').text('<spring:message code="search.noresultfound"></spring:message>'+clickresults).removeClass('alert-text').show();
								
					 }
					 $('#DisplayLength').html(JSON.stringify(item.totalhits));
					 $('#productName').html(search);
				 }else if(i==1 && item.catalogflag != null ){
						 catalogflag=item.catalogflag;
				 }else{
				 	if("category" === item.type ){	
				 	var hightlightItem=item.highlight;
					for(var hitem in hightlightItem){
							var source = item.source;
							var field = hitem.toString();
								source[field] = hightlightItem[hitem];
					}
					var categoryName = item.source.categoryName_en_US;
					var categoryDesc = item.source.categoryDescription_en_US;
					var productCatalogName = item.source.categoryProductCatalogName_en_US;
					if("en_US" === lang){
						categoryName = item.source.categoryName_en_US;
						categoryDesc = item.source.categoryDescription_en_US;
						productCatalogName = item.source.categoryProductCatalogName_en_US;
					}else if("de_DE" === lang){
						categoryName = item.source.categoryName_de_DE;
						categoryDesc = item.source.categoryDescription_de_DE;
						productCatalogName = item.source.categoryProductCatalogName_de_DE;
					}else if("sp_SP" === lang){
						categoryName = item.source.categoryName_sp_SP;
						categoryDesc = item.source.categoryDescription_sp_SP;
						productCatalogName = item.source.categoryProductCatalogName_sp_SP;
					}else if("fr_FR" === lang){
						categoryName = item.source.categoryName_fr_FR;
						categoryDesc = item.source.categoryDescription_fr_FR;
						productCatalogName = item.source.categoryProductCatalogName_fr_FR;
					}else if("cn_CN" === lang){
						categoryName = item.source.categoryName_cn_CN;
						categoryDesc = item.source.categoryDescription_cn_CN;
						productCatalogName = item.source.categoryProductCatalogName_cn_CN;
					}else if("nl_NL" === lang){
						categoryName = item.source.categoryName_nl_NL;
						categoryDesc = item.source.categoryDescription_nl_NL;
						productCatalogName = item.source.categoryProductCatalogName_nl_NL;
					}else if("cz_CZ" === lang){
						categoryName = item.source.categoryName_cz_CZ;
						categoryDesc = item.source.categoryDescription_cz_CZ;
						productCatalogName = item.source.categoryProductCatalogName_cz_CZ;
					}else if("sl_SI" === lang){
						categoryName = item.source.categoryName_sl_SI;
						categoryDesc = item.source.categoryDescription_sl_SI;
						productCatalogName = item.source.categoryProductCatalogName_sl_SI;
					}else if("hu_HU" === lang){
						categoryName = item.source.categoryName_hu_HU;
						categoryDesc = item.source.categoryDescription_hu_HU;
						productCatalogName = item.source.categoryProductCatalogName_hu_HU;
					}else if("ro_RO" === lang){
						categoryName = item.source.categoryName_ro_RO;
						categoryDesc = item.source.categoryDescription_ro_RO;
						productCatalogName = item.source.categoryProductCatalogName_ro_RO;
					}else if("it_IT" === lang){
						categoryName = item.source.categoryName_it_IT;
						categoryDesc = item.source.categoryDescription_it_IT;
						productCatalogName = item.source.categoryProductCatalogName_it_IT;
					}else if("ru_RU" === lang){
						categoryName = item.source.categoryName_ru_RU;
						categoryDesc = item.source.categoryDescription_ru_RU;
						productCatalogName = item.source.categoryProductCatalogName_ru_RU;
					}else if("sk_SK" === lang){
						categoryName = item.source.categoryName_sk_SK;
						categoryDesc = item.source.categoryDescription_sk_SK;
						productCatalogName = item.source.categoryProductCatalogName_sk_SK;
					}else if("pl_PL" === lang){
						categoryName = item.source.categoryName_pl_PL;
						categoryDesc = item.source.categoryDescription_pl_PL;
						productCatalogName = item.source.categoryProductCatalogName_pl_PL;
					}else if("pt_PT" === lang){
						categoryName = item.source.categoryName_pt_PT;
						categoryDesc = item.source.categoryDescription_pt_PT;
						productCatalogName = item.source.categoryProductCatalogName_pt_PT;
					}
					var itemtype = item.type;
						$("#"+typedropdown).append('<div class="allResultContent">'+
                        '<div class="search-parts-template cart-details">'+
                        //on click of the category should redirect to Shop for parts page with the respective category details
                        /* '<a href="#" onclick="searchredirect(\''+item.source.productCatalogId+','+item.source.catDescription[desc].categoryName+','+item.source.categoryId+'\',\'' + itemtype + '\');">'+ */
                        '<a href="shopforparts?productCatalogId='+item.source.productCatalogId+'&Name='+categoryName+'&productCategoryId='+item.source.categoryId+'&previousURL='+prevURL+'&searchflag=true&searchString='+search+'&searchType='+typedropdown+'" >'+ 
                        ' <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 xs_img_center" id="imagesample" id="imagesample">'+((item.source.mediaId !== "" && item.source.mediaId !== 0 )? '<img src="${properties['docserver.url']}?media='+item.source.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken+'" alt="catalog-img">': '<div class="no-image no_img_new"> <p >'+'</p> </div> ' )+' </div> '+
                       /*  '<div class="col-sm-2" id="imagesample"><img src="${properties['docserver.url']}?media='+item.source.mediaId+'&thumbnail=true"></div>'+ */
                          '<div class="imageContent col-lg-5 col-md-5 col-sm-5 col-xs-12 xs_img_center pt-xs-10" id="Content">'+
						  '<h4 class="alignLeftx blueColor"><span class="no-font"><spring:message code="search.category.categoryname"></spring:message>:</span>'+ ((null !==categoryName) ? categoryName : '<spring:message code="search.none"></spring:message>' )+'</h4></br>'+
						  '<div style="margin-top:5px"><p>'+((categoryDesc !== null) ? categoryDesc : '<spring:message code="search.none"></spring:message>' )+ '</p>'+
						   '<p><spring:message code="search.productcatalog.productcatalogname"></spring:message>:'+((productCatalogName !== null)? productCatalogName : '<spring:message code="search.none"></spring:message>' )+'</p></div>'+ 
						  /* '<p>'+((item.source.organizationName !==null)? item.source.organizationName+' <spring:message code="search.category"></spring:message>' : '<spring:message code="search.none"></spring:message>')+'</p>'+ */
                          '</div>'+
                          '</a>'+ 
                      '</div>'+
                    '</div>');	
					}else if("productcatalog" === item.type ){	
						
						var hightlightItem=item.highlight;
						for(var hitem in hightlightItem){
							var source = item.source;
							var field = hitem.toString();
								source[field] = hightlightItem[hitem];
						}
						var prodName = item.source.productCatalogName_en_US;
						var ProdDesc = item.source.productDescription_en_US ;
						if("en_US" === lang){
							prodName =  item.source.productCatalogName_en_US;
							ProdDesc = item.source.productDescription_en_US;
						}else if("de_DE" === lang){
							prodName =  item.source.productCatalogName_de_DE;
							ProdDesc = item.source.productDescription_de_DE;
						}else if("sp_SP" === lang){
							prodName =  item.source.productCatalogName_sp_SP;
							ProdDesc = item.source.productDescription_sp_SP;
						}else if("fr_FR" === lang){
							prodName =  item.source.productCatalogName_fr_FR;
							ProdDesc = item.source.productDescription_fr_FR;
						}else if("cn_CN" === lang){
							prodName =  item.source.productCatalogName_cn_CN;
							ProdDesc = item.source.productDescription_cn_CN;
						}else if("nl_NL" === lang){
							prodName =  item.source.productCatalogName_nl_NL;
							ProdDesc = item.source.productDescription_nl_NL;
						}else if("cz_CZ" === lang){
							prodName =  item.source.productCatalogName_cz_CZ;
							ProdDesc = item.source.productDescription_cz_CZ;
						}else if("sl_SI" === lang){
							prodName =  item.source.productCatalogName_sl_SI;
							ProdDesc = item.source.productDescription_sl_SI;
						}else if("hu_HU" === lang){
							prodName =  item.source.productCatalogName_hu_HU;
							ProdDesc = item.source.productDescription_hu_HU;
						}else if("ro_RO" === lang){
							prodName =  item.source.productCatalogName_ro_RO;
							ProdDesc = item.source.productDescription_ro_RO;
						}else if("it_IT" === lang){
							prodName =  item.source.productCatalogName_it_IT;
							ProdDesc = item.source.productDescription_it_IT;
						}else if("ru_RU" === lang){
							prodName =  item.source.productCatalogName_ru_RU;
							ProdDesc = item.source.productDescription_ru_RU;
						}else if("sk_SK" === lang){
							prodName =  item.source.productCatalogName_sk_SK;
							ProdDesc = item.source.productDescription_sk_SK;
						}else if("pl_PL" === lang){
							prodName =  item.source.productCatalogName_pl_PL;
							ProdDesc = item.source.productDescription_pl_PL;
						}else if("pt_PT" === lang){
							prodName =  item.source.productCatalogName_pt_PT;
							ProdDesc = item.source.productDescription_pt_PT;
						}
						var itemtype = item.type;
						$("#"+typedropdown).append('<div class="allResultContent">'+
                        '<div class="search-parts-template cart-details">'+
                      	//on click of the productcatalog should redirect to Shop for parts page with the respective productcatalog details
                        /* '<a href="#" onclick="searchredirect(\''+item.source.productCatalogId+','+item.source.prodDescription[desc].productCatalogName+'\',\'' + itemtype + '\');">'+ */
                        '<a href="shopforparts?productCatalogId='+item.source.productCatalogId+'&Name='+replaceWith(prodName)+'&productCategoryId=&previousURL='+prevURL+'&searchflag=true&searchString='+search+'&searchType='+typedropdown+'" >'+
                        '<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 xs_img_center" id="imagesample">'+((item.source.mediaId !== "" && item.source.mediaId !== 0 )? '<img src="${properties['docserver.url']}?media='+item.source.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken+'">' : '<div class="no-image no_img_new"> <p >'+'</p> </div> ') +' </div>'+
                          '<div class="imageContent col-lg-5 col-md-5 col-sm-5 col-xs-12 xs_img_center pt-xs-10" id="Content">'+
						  '<h4 class="alignLeftx blueColor"><span class="no-font"><spring:message code="search.productcatalog.productcatalogname"></spring:message>:</span>'+((prodName !== null)? prodName : '<spring:message code="search.none"></spring:message>' )+'</h4></br>'+
						  '<div style="margin-top:5px;"><p>'+((ProdDesc !== null)? ProdDesc : '<spring:message code="search.none"></spring:message>')+'</p></div>'+
                          '</div></a>'+
                      '</div>'+
                    '</div>');	
					}else if("part" === item.type ){	
						var partNumberWhereused = item.source.partNumber;
						/*SUPPORT-MIL-178 210116*/
						var isOrderable = item.source.orderable;
						var canOrderPart = item.canOrderPart;///*SUPPORT-MIL-178 210116*/
						var hightlightItem=item.highlight;
						for(var hitem in hightlightItem){
							var source = item.source;
							var field = hitem.toString();
							 //if the field is having parent child relation in json which is separated by a "." then split the string else popupate the field with required highlighted data
								source[field] = hightlightItem[hitem];
						}
						var commercialDesc = item.source.commercialDescription_en_US;
						var engginerringDesc = item.source.engineeringDescription_en_US ;
						if("en_US" === lang){
							commercialDesc =  item.source.commercialDescription_en_US;
							engginerringDesc = item.source.engineeringDescription_en_US;
						}else if("de_DE" === lang){
							commercialDesc = item.source.commercialDescription_de_DE;
							engginerringDesc = item.source.engineeringDescription_de_DE;
						}else if("sp_SP" === lang){
							commercialDesc = item.source.commercialDescription_sp_SP;
							engginerringDesc = item.source.engineeringDescription_sp_SP;
						}else if("fr_FR" === lang){
							commercialDesc = item.source.commercialDescription_fr_FR;
							engginerringDesc = item.source.engineeringDescription_fr_FR;
						}else if("cn_CN" === lang){
							commercialDesc = item.source.commercialDescription_cn_CN;
							engginerringDesc = item.source.engineeringDescription_cn_CN;
						}else if("nl_NL" === lang){
							commercialDesc = item.source.commercialDescription_nl_NL;
							engginerringDesc = item.source.engineeringDescription_nl_NL;
						}else if("cz_CZ" === lang){
							commercialDesc = item.source.commercialDescription_cz_CZ;
							engginerringDesc = item.source.engineeringDescription_cz_CZ;
						}else if("sl_SI" === lang){
							commercialDesc = item.source.commercialDescription_sl_SI;
							engginerringDesc = item.source.engineeringDescription_sl_SI;
						}else if("hu_HU" === lang){
							commercialDesc = item.source.commercialDescription_hu_HU;
							engginerringDesc = item.source.engineeringDescription_hu_HU;
						}else if("ro_RO" === lang){
							commercialDesc = item.source.commercialDescription_ro_RO;
							engginerringDesc = item.source.engineeringDescription_ro_RO;
						}else if("it_IT" === lang){
							commercialDesc = item.source.commercialDescription_it_IT;
							engginerringDesc = item.source.engineeringDescription_it_IT;
						}else if("ru_RU" === lang){
							commercialDesc = item.source.commercialDescription_ru_RU;
							engginerringDesc = item.source.engineeringDescription_ru_RU;
						}else if("sk_SK" === lang){
							commercialDesc = item.source.commercialDescription_sk_SK;
							engginerringDesc = item.source.engineeringDescription_sk_SK;
						}else if("pl_PL" === lang){
							commercialDesc = item.source.commercialDescription_pl_PL;
							engginerringDesc = item.source.engineeringDescription_pl_PL;
						}else if("pt_PT" === lang){
							commercialDesc = item.source.commercialDescription_pt_PT;
							engginerringDesc = item.source.engineeringDescription_pt_PT;
						}
						// SUPPORT-MIL-178 190116   
						var myFavMarkupHldr ="";
						if(item.myFavNonOrderableShown == "1"){
							<c:if test="${ not sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
						 	 myFavMarkupHldr = '<div class="fav-btn ng-scope" title="'+ ((item.myFavShown == "1") ? "<spring:message code='label.onhover.removefromfav' javaScriptEscape='true'/>":"<spring:message code='label.onhover.addtofav' javaScriptEscape='true'/>") +'" data-itemid="'+item.source.partId+'" data-mediaid="'+item.source.mediaId+'" data-orgid="'+item.source.organizationId+'"> <i class="fa fa-star '+ ( (item.myFavShown == "1") ? 'fav-item' : 'no-fav-item') +'"></i></div>';
						  	</c:if>
						}
						if(isOrderable == "true" && canOrderPart == "true"){
						//INC-2498 fix starts(Developed by : Swetha)
						var showWaterMark = '';
						if(!item.source.isActualImage){
							showWaterMark = '<div class="waterMarkForChildPartsForSearch"><span style="margin: 6px;font-weight: 600;" class="label1FontFamily"><spring:message code="label.watermark.text1"/> </span><span style="font-size: 7px; font-weight: 400;" class="label2FontFamily"><br><spring:message code="label.watermark.text2"/></br></span></div>';
						}
						//INC-2498 fix ends
						var itemtype = item.type.trim();
								$("#"+typedropdown).append('<div class="allResultContent">'+
		                        '<div class="search-parts-template cart-details">'+
		                      	//on click of the part should redirect to Shop for parts page with the respective part details
		                       //'<a href="shopforparts?productCatalogId='+item.source.partId+'&Name='+itemtype+'&productCategoryId=&organizationId='+item.source.organizationId+'&previousURL='+prevURL+'&searchflag=true&searchString='+search+'" >'+
		                       '<a href="getfullitemdetails?itemId='+item.source.partId+'&itemCategory=&organizationId='+item.source.organizationId+'&previousURL='+prevURL+'&searchType='+typedropdown+'&searchflag=true&searchString='+search+'" >'+	   
		                        '<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 xs_img_center" id="imagesample">'+((item.source.mediaId !== "" && item.source.mediaId !== 0 )? '<img src="${properties['docserver.url']}?media='+item.source.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken+'">'+showWaterMark : '<div class="no-image no_img_new"> <p >'+'</p> </div>' )+'</div>'+ 
		                          '<div class="imageContent col-lg-5 col-md-5 col-sm-5 col-xs-12 xs_img_center pt-xs-10" id="Content">'+
								  '<h4 class="alignLeftx blueColor"><span class="no-font"><spring:message code="search.part.partnumber"></spring:message>:</span>'+item.source.partNumber+
								   myFavMarkupHldr + '</h4></br>'+

								  /* '<h3><spring:message code="search.part.partnumber"></spring:message>'+item.source.partNumber+'</h3>'+ */
								  '<div style="margin-top:5px;clear: left;"><p>'+((commercialDesc !== null) ? commercialDesc : '<spring:message code="search.none"></spring:message>') +'</p>'+
								  '<sec:authorize access="hasRole('ROLE_ENGG_DESC')"><p>'+((engginerringDesc !==null) ? engginerringDesc: '<spring:message code="search.none"></spring:message>')  +'</p></sec:authorize></div>'+ '<div style="margin-top:5px;"><p><strong><spring:message code="search.part.legacypartnumber"></spring:message>:</strong>'+((item.source.legacyPartNumber !== null) ? item.source.legacyPartNumber : '<spring:message code="search.none"></spring:message>') +'</p>'+
								  '<sec:authorize access="hasRole('ROLE_VENDOR_PART')"><p><strong><spring:message code="search.part.vendorpartnumber"></spring:message>:</strong>'+((item.source.vendorPartNumber !== null) ? item.source.vendorPartNumber : '<spring:message code="search.none"></spring:message>') +'</p></sec:authorize></div>'+'<p><strong>Cross Reference Part Number:</strong>'+((item.source.crossReferencePartNumber !== null) ? item.source.crossReferencePartNumber : '<spring:message code="search.none"></spring:message>') +'</p>'+'<div class="b-label">' +
								  '<p>'+item.source.organizationName+' <spring:message code="search.part"></spring:message> </p>'+
		                          '</div>'+'</div>' +'<div class="imageContentRightPart col-lg-3 col-md-3 col-sm-3 col-xs-12 xs_img_center pt-xs-10">'+'<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding erp-price-avail" data-allVal="" data-orgId='+item.source.organizationId+' style="width:100%;height:auto;">'+'<div data-msrpShowHide='+item.source.partId+item.source.organizationId+' data-msrp='+item.source.partId+item.source.organizationId+' class="msrpShowHide msrpHide" style="font-size: 14px;font-weight: 400;width: 250px;"><spring:message code="label.msrp"/>:'+'<span class="msrp-price price-loader" data-msrp='+item.source.partId+item.source.organizationId+'></span>'+'</div>'+ '<div style="font-weight:bold;" class="your-price1 blueColor" data-price='+item.source.partId+item.source.organizationId+'><spring:message code="label.your.price"/>:'+'<span class="your-price price-loader" data-price='+item.source.partId+item.source.organizationId+'></span>'+'</div>'+
		                           '<div data-savePriceShowHide='+item.source.partId+item.source.organizationId+' data-saved='+item.source.partId+item.source.organizationId+' class="blueColor youSaveHide savePriceShowHide "><spring:message code="label.save"/>:'+' <span class="save-price price-loader" data-saved='+item.source.partId+item.source.organizationId+'></span>'+'</div>'+' <div>'+'<span class="stock-count" data-avail='+item.source.partId+item.source.organizationId+'></span>'+'</div>'+
		                          ((catalogflag) ? ((item.source.whereusedflag)? '<div class="left-align-xs"><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="javascript:void(0);" class="btn btn-buynow cart-small" id="whereUsed" style="width:200px;height:44px;line-height:2.8;" onclick="whereUsed('+item.source.partId+');"><spring:message code="search.whereused"></spring:message></sec:authorize></a></div>' : '<div></div>') : '<div></div>' )+
		                          //'<div class="left-align-xs"><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="javascript:void(0);" class="btn btn-buynow cart-small" id="whereUsed" style="width:200px;height:44px;line-height:2.8;" onclick="whereUsed('+item.source.partId+');"><spring:message code="search.whereused"></spring:message></sec:authorize></a></div>'+
		                          '<div class="right-align-xs">'+
		                           //'<a href="shopforparts?productCatalogId='+item.source.partId+'&Name='+itemtype+'&productCategoryId=&organizationId='+item.source.organizationId+'&previousURL='+prevURL+'&searchflag=true&searchString='+search+'" class="green iconRoundBlue"><span class="glyphicon glyphicon-shopping-cart"></span></a></div>'+
		                          '<sec:authorize access="hasRole('ROLE_CART')">'+
		                         <!-- '<a onclick="addItemToCart('+item.source.partId+','+item.source.mediaId+','+1+','+item.source.organizationId+',\''+replaceWith(item.source.partNumber)+'\')" class="btn btn-addtocart cart-small green iconRoundBlue"><spring:message code="quick.search.addtocart"></spring:message></a>'+ -->
		                         
		                         '<a onclick="addItemToCart('+item.source.partId+','+item.source.mediaId+','+item.source.orderMultiple+','+item.source.organizationId+',\''+replaceWith(item.source.partNumber)+'\')" class="btn btn-addtocart cart-small green iconRoundBlue"><spring:message code="quick.search.addtocart"></spring:message></a>'+
		                         
		                          '</sec:authorize></div>'+
		                          '</div></a>'+
		                      '</div>'+
		                    '</div>');	
						}else{
							$("#"+typedropdown).append('<div class="allResultContent">'+
			                        '<div class="search-parts-template cart-details">'+
			                      	//on click of the part should redirect to Shop for parts page with the respective part details
			                       //'<a href="shopforparts?productCatalogId='+item.source.partId+'&Name='+itemtype+'&productCategoryId=&organizationId='+item.source.organizationId+'&previousURL='+prevURL+'&searchflag=true&searchString='+search+'" >'+
			                       '<a href="getfullitemdetails?itemId='+item.source.partId+'&itemCategory=&organizationId='+item.source.organizationId+'&previousURL='+prevURL+'&searchType='+typedropdown+'&searchflag=true&searchString='+search+'" >'+	   

			                       '<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 xs_img_center" id="imagesample">'+((item.source.mediaId !== "" && item.source.mediaId !== 0 )? '<img src="${properties['docserver.url']}?media='+item.source.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken+'">' : '<div class="no-image no_img_new"> <p >'+'</p> </div>' )+'</div>'+ 
  			                          '<div class="imageContent  col-lg-5 col-md-5 col-sm-5 col-xs-12 xs_img_center pt-xs-10" id="Content">'+
  									  '<h4 class="alignLeftx blueColor"><span class="no-font"><spring:message code="search.part.partnumber"></spring:message>:</span>'+item.source.partNumber+
  									  myFavMarkupHldr +'</h4></br>'+
									  /* '<h3><spring:message code="search.part.partnumber"></spring:message>'+item.source.partNumber+'</h3>'+ */
									  '<div style="margin-top:5px;clear: left;"><p>'+((commercialDesc !== null) ? commercialDesc : '<spring:message code="search.none"></spring:message>') +'</p>'+
									  '<sec:authorize access="hasRole('ROLE_ENGG_DESC')"><p>'+((engginerringDesc !==null) ? engginerringDesc: '<spring:message code="search.none"></spring:message>')  +'</p></sec:authorize></div>'+ '<div style="margin-top:5px;"><p><strong><spring:message code="search.part.legacypartnumber"></spring:message>:</strong>'+((item.source.legacyPartNumber !== null) ? item.source.legacyPartNumber : '<spring:message code="search.none"></spring:message>') +'</p>'+
									  '<sec:authorize access="hasRole('ROLE_VENDOR_PART')"><p><strong><spring:message code="search.part.vendorpartnumber"></spring:message>:</strong>'+((item.source.vendorPartNumber !== null) ? item.source.vendorPartNumber : '<spring:message code="search.none"></spring:message>') +'</p></sec:authorize></div>'+'<p><strong>Cross Reference Part Number:</strong>'+((item.source.crossReferencePartNumber !== null) ? item.source.crossReferencePartNumber : '<spring:message code="search.none"></spring:message>') +'</p>'+'<div class="b-label">' +
									  '<p>'+item.source.organizationName+' <spring:message code="search.part"></spring:message> </p>'+
			                          '</div>'+'</div>' +'<div class="imageContentRightPart col-lg-3 col-md-3 col-sm-3 col-xs-12 xs_img_center pt-xs-10">'+
			                          ((catalogflag) ? ((item.source.whereusedflag)? '<div class="left-align-xs"><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="javascript:void(0);" class="btn btn-buynow cart-small" id="whereUsed" style="width:200px;height:44px;line-height:2.8;" onclick="whereUsed('+item.source.partId+');"><spring:message code="search.whereused"></spring:message></sec:authorize></a></div>' : '<div></div>') : '<div></div>' )+
			                          //'<div class="left-align-xs"><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="javascript:void(0);" class="btn btn-buynow cart-small" id="whereUsed" style="width:200px;height:44px;line-height:2.8;" onclick="whereUsed('+item.source.partId+');"><spring:message code="search.whereused"></spring:message></sec:authorize></a></div>'+
			                          '<div class="right-align-xs">'+
			                           //'<a href="shopforparts?productCatalogId='+item.source.partId+'&Name='+itemtype+'&productCategoryId=&organizationId='+item.source.organizationId+'&previousURL='+prevURL+'&searchflag=true&searchString='+search+'" class="green iconRoundBlue"><span class="glyphicon glyphicon-shopping-cart"></span></a></div>'+
			                          '<sec:authorize access="hasRole('ROLE_CART')">'+
			                          '<a onclick="addItemToCart('+item.source.partId+','+item.source.mediaId+','+item.source.orderMultiple+','+item.source.organizationId+',\''+replaceWith(item.source.partNumber)+'\')" class="btn btn-addtocart cart-small green iconRoundBlue disabled"><spring:message code="quick.search.addtocart"></spring:message></a>'+
			                          '</sec:authorize></div>'+
			                          '</div></a>'+
			                      '</div>'+
			                    '</div>');	
							
						}
						//End of MIL - 178
						var partVo = {};
						partVo['partId'] = item.source.partId;
						partVo['partNumber'] = item.source.partNumber;
						//partVo['partQuatity'] = obj.itemQuantity;
						partVo['organizationId'] = item.source.organizationId;
						items.push(partVo);
					}else if("catalog" === item.type ){	
						var hightlightItem=item.highlight;
						for(var hitem in hightlightItem){
							var source = item.source;
							var field = hitem.toString();
							source[field] = hightlightItem[hitem];
						}
						
						$("#"+typedropdown).append('<div class="allResultContent">'+
			                        '<div class="search-parts-template cart-details">'+
			                        ' <a style="cursor:pointer" onclick="catalogCheck('+item.source.catalogId+',\''+replaceWith(item.source.catalogName)+'\')">' +
			                        '<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 xs_img_center" id="imagesample">'+((item.source.mediaId !== "" && item.source.mediaId !== 0 && item.source.mediaId !== null )? '<img src="${properties['docserver.url']}?media='+item.source.mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken+'">': '<div class="machine-image"><img class="img-responsive" alt="catalog-img" src="../images/gear_thumb.png"></div>' ) + '</div>'+
			                          '<div class="imageContent col-lg-5 col-md-5 col-sm-5 col-xs-12 xs_img_center pt-xs-10" id="Content">'+
									  '<h4 class="alignLeftx blueColor"><span class="no-font"><spring:message code="search.catalog.catalogname"></spring:message>:</span>'+((item.source.customField3 !== "")? item.source.customField3 : '<spring:message code="search.none"></spring:message>')+'</h4></br>'+ // Using customField3 for Serial Number. INC-2321 (Developed By : Kameshwari , Reviewed By : Jayakumar )
									  '<div style="margin-top:5px"><p><spring:message code="search.catalog.model"></spring:message>:'+((item.source.model)?item.source.model : '<spring:message code="search.none"></spring:message>' )+'</p>'+
									  '<p>'+((item.source.catalogCommercialDescription !== null)? item.source.catalogCommercialDescription : ((item.source.catalogCommercialDescription === null)? ((item.source.catalogEngineeringDescription !== null)? item.source.catalogEngineeringDescription : '<spring:message code="search.none"></spring:message>' ) :'<spring:message code="search.none"></spring:message>' ))+'</p></div>'+
									 /*  '<p>'+((item.source.catalogEngineeringDescription !== null)? item.source.catalogEngineeringDescription : '<spring:message code="search.none"></spring:message>' )+'</p>'+  */
									  '<div style="margin-top:5px"><p><spring:message code="search.catalog.customerName"></spring:message>:'+((item.source.customerName !== null )? item.source.customerName :'<spring:message code="search.none"></spring:message>')+'</p>'+
									  '<p><spring:message code="search.catalog.catalogReference"></spring:message>:'+((item.source.catalogReference !== "")? item.source.catalogReference : '<spring:message code="search.none"></spring:message>')+'</p></div>'+
									 
									  /* These 2 lines commented for DME and HillPhoenix, since they don't need  VIN# & JOB# ,Need to enable for ASV*/
									 /*  '<div style="margin-top:5px"><p><spring:message code="search.catalog.customField1"></spring:message>:'+((item.source.customField1 !== "")? item.source.customField1 : '<spring:message code="search.none"></spring:message>')+'</p>'+ */
									 /*  '<p><spring:message code="search.catalog.customField2"></spring:message>:'+((item.source.customField2 !== "")? item.source.customField2 : '<spring:message code="search.none"></spring:message>')+'</p></div>'+ */
									  
									  '<div class="b-label"><p>'+((item.source.organizationName)?item.source.organizationName+' <spring:message code="search.vehicle"></spring:message>' : '<spring:message code="search.none"></spring:message>')+'</p></div>'+			                          '</div></a>'+
			                      '</div>'+
			                    '</div>');
					}
				 }
			});
		partVoList['partVoList'] = items;
        if(items.length>0){
        	
     	   getPriceForItems(partVoList); 
        }

	    $('#keyword').val(search);
	    if($('#keyword').val()!==""){
		 	$('a.clear-search').removeClass('hidden');
		 }
	    $('#typedropdown').val(typedropdown);
	    $('#fuzzy').val(fuzzy);
	    $('#size').val('${size}');
	    $("#"+typedropdown).attr("class","active");
	    
		$('div.allResultTabs li').filter('.active').removeClass('active');
		$('a[href="#'+typedropdown+'"]').closest('li').addClass('active');
		
		$('.searchall-dpdown > span.search-options-label').text($('.dropdown-menu li a[data-value='+typedropdown+']').text());
		
		if($('#authorization').val() === 'false'){
	    	document.getElementById('catalogview').style.display="none";
	    }
		
		$('div.pageLoader').hide();
		 }
		//Fav Add Call
		$(document).on("click", ".no-fav-item", function(evt){
			//alert("sadfsadsad");
			var partId = $(this).parent().data('itemid');
			var mediaId = $(this).parent().data('mediaid');
			var organizationId = $(this).parent().data('orgid');
			
			addItemToFavListPage(partId, mediaId, 1,organizationId, evt);
			evt.preventDefault();
	 	});
		 
		//Fav Del Call
 		$(document).on("click", ".fav-item", function(evt){
			//alert("sadfsadsad");
			var partId = $(this).parent().data('itemid');
			var organizationId = $(this).parent().data('orgid');
			
			var dataItemLst =[];
	    	dataItemLst.push({partId: partId,organizationId: organizationId});
	    	deleteFromFavList(dataItemLst, evt);
	    	evt.preventDefault();
		});
		 
	});//End of doc.ready()
	
			function replaceWith(content) {
				return content.toString().replace(new RegExp('<b>', 'g'), '').replace(new RegExp('</b>', 'g'), '');
			}
	function catalogCheck(catalogId,catalogName) {
		$.ajax({
			type : "get",
			url : "checkmachineaccess?catalogId="+catalogId,
			//data : request.term.toLowerCase(),
			dataType : "text",
			contentType : 'application/json;charset=ISO-8859-1',
			success : function(data) {
				if(data === 'true'){
					//NREV-885 fix starts
					document.forms[0].action="viewmachine?catalogId="+catalogId+"&assemblyNumber="+catalogName+"&searchflag=true&searchKey="+searchGlobalKey+"&typedropdown="+$("#typedropdown").val();
					//NREV-885 fix ends
	        		document.forms[0].submit();
				}else{
					//alert(data);
					$('.tab-content p > span').text(catalogName);
					$('.tab-content p').show().addClass('alert-text');
				}
			},
			error:function(){
				
			}
		});
	}
	
	function getPriceForItems(items) {
		 //$('div.pageLoader').show();
 		
 	
		 $.ajax({  
 			type : "POST",
 			data : {items:JSON.stringify(items)},
 	        url : "searchresultprice",
 	      	dataType : "json",
           success : function(response) {
           	 //$('div.pageLoader').hide();
 	        console.log(response);
 	        	var result = response;
 	        	console.log(result);
				var partItemListPriceAvail = result.partItemVOList;
				console.log(partItemListPriceAvail);
				
				for(var i=0;i<partItemListPriceAvail.length;i++){
					
					var orgId=partItemListPriceAvail[i].organizationId;
					var str = partItemListPriceAvail[i].inventoryMessage;
					var messCheck = 0; 
					
					if(partItemListPriceAvail[i].priceNotShown == true){
						var inventoryMsg = "<spring:message code='guest.inventory.msg' javaScriptEscape='true'/>";
						//console.log(inventoryMsg);
						$("div.cart-item-info .stock-count").text(inventoryMsg);//set inventory Message text
						/* $("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text("<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>").removeClass('price-loader'); */
						$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").append("${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}" ? "<spring:message code="message.guest.login" htmlEscape="false" javaScriptEscape="true"/>" : "<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>").removeClass('price-loader');
						/* $("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+"']").append("${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}" ? "<spring:message code="message.guest.login" htmlEscape="false" javaScriptEscape="true"/>" : "<spring:message code="message.contact.customer.service" javaScriptEscape="true"/>" ).removeClass('price-loader'); */
						$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").hide();
						$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").hide();
					}
					else{
						if(partItemListPriceAvail[i].msrpStr != "-1"){
							$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").show();
							$("div.erp-price-avail .msrp-price[data-msrp='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text(partItemListPriceAvail[i].msrpStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set MSRP
							
						}
						else{
							messCheck=1;
							$("div.erp-price-avail .msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").hide();
						}
						
						if(partItemListPriceAvail[i].priceStr != "-1"){
							if(partItemListPriceAvail[i].currencyCode!=""){
								messCheck = 0;
							}
							$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").show();
							$("div.erp-price-avail .your-price[data-price='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text(partItemListPriceAvail[i].priceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set price
						}
						else{
							$("div.erp-price-avail .your-price1[data-price='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").hide();
						}
						
						if(partItemListPriceAvail[i].savedPriceStr != "-1"){
							$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").show();
							$("div.erp-price-avail .save-price[data-saved='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text(partItemListPriceAvail[i].savedPriceStr+" "+(typeof partItemListPriceAvail[i].currencyCode=="undefined"?"":partItemListPriceAvail[i].currencyCode)).removeClass('price-loader');//set saved price
						}
						else{
							$("div.erp-price-avail .savePriceShowHide[data-savePriceShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").hide();
						}
						
					    //$("div.erp-price-avail .stock-count[data-avail='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text(partItemListPriceAvail[i].inventoryMessage);
						if(orgId!=1){	
									$("div.erp-price-avail .stock-count[data-avail='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text(partItemListPriceAvail[i].inventoryMessage);
						} else {
									var strContent = str.substring(0, 10);
									if(strContent=="0 In Stock"){
									
										 if(messCheck==0){
											 $("div.erp-price-avail .stock-count[data-avail='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text('0 In Stock, Please call 855-737-8835');
									        	 }
									     else{
									         $("div.erp-price-avail .stock-count[data-avail='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text('0 In Stock');
									        	 }
										
								     } else {
								    	 $("div.erp-price-avail .stock-count[data-avail='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").text(partItemListPriceAvail[i].inventoryMessage);
								     }
						        }
						$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").parent(".erp-price-avail").data('allval',partItemListPriceAvail[i]);
						console.log(partItemListPriceAvail[i]);
						
					}
					
					$('span.unit').text(partItemListPriceAvail[i].uom);

					$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").parents('.erp-price-avail').find('button').each(function(){
						$(this).removeClass('not-active');
					});
					$(".msrpShowHide[data-msrpShowHide='"+partItemListPriceAvail[i].partId+partItemListPriceAvail[i].organizationId+"']").parents('.erp-price-avail').siblings('.quantity-change').find('.spinner-control').removeClass('not-active');
				}

             $('div.lazyLoader').addClass('hidden');
			},
			error : function(e) {
             //$('div.pageLoader').hide();
             $('div.lazyLoader').addClass('hidden');
			}
		});
	}
	
/* 	 function loadBreadCrumb(isHome){
    	$(".breadcrumb").append('<li><a href='+$("#main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#main-menu-list >li:nth-child(1)").text()+'</a></li>');
    	if(!isHome){
			$(".breadcrumb > li:last-child()").after('<li><a href="'+$("#main-menu-list > li.active a").attr('href')+'">'+$("#main-menu-list > li.active a > span").text()+'</li>');
    	}
		$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="label.whereused.search"/></li>');
		
	}
	function loadNonHeaderBreadCrumb(dbCrumb, isQuoteQrder){
    	$(".breadcrumb").append('<li><a href='+$("#main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#main-menu-list >li:nth-child(1)").text()+'</a></li>');
    	if(!isQuoteQrder) {
			$(".breadcrumb > li:last-child()").after('<li><a href="'+$(dbCrumb+"> li.active a").attr('href')+'">'+$(dbCrumb+" > li.active a > span").text()+'</li>');
    	}
		$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="label.whereused.search"/></li>');
		
	} */

</script>
</head>
<body>
<jsp:include page="googleAnalyticsbody.jsp" />
	<style>
/*search Result styles starts here*/
.allResultTabs {
	padding: 0px 0px 4px 0px;
}

.allResultTabs li {
	/*border-top: 1px solid #d4d4d1; */
	border-right: 1px solid #e6e6e6;
	/* border-left: 1px solid #d4d4d1; */
	/* border-bottom: 4px solid #fff; */
	/* margin-right: 10px; */
	list-style-type: none;
	display: -webkit-inline-box;
	display: -moz-inline-stack;
    display: inline-block;
	/* border: none; */
	font-weight: bold;
	padding: 2px 17px 2px 17px;
}

.allResultTabs li:last-child {
	border-right: none;
}

.allResultTabs .ui-widget-header {
	background: #fff;
}

.ui-state-default {
	border: none !important;
}

.allResultTabs li.active {
	z-index: 5;
	/* padding-left: 10px; */
	/* padding-right: 7px; */
	padding: 2px 17px 2px 17px;
}

.allResultTabs  li a {
	padding-bottom: 6px;
	margin: auto;
	text-align: center;
	color: grey;
	text-decoration: none;
}

.allResultTabs .active a {
	/* color: #910a0a; */
	border-bottom: 4px solid #24418a !important;
}

.allResultTabs a:hover {
	color: #333333 !important;
}

#Content p {
	margin: 0px;
	color: #000000;
	word-break: break-all;
}

.search-parts-template a {
	color: #000000;
}

#imagesample>img {
	width: 90%;
}

.fa.fa-star.fav-item {
	font-size: 18px;
	color: #c52033;
	line-height: 30px;
	cursor: pointer;
}

.no-fav-item {
	color: #7b7b7b;
	cursor: pointer;
}



.fav-btn.ng-scope {
	display: inline-block;
	margin-left: 5px;
}

@media ( min-width : 300px) and (max-width: 767px) {
	.no_img_new {
		margin: 0 auto !important;
		text-align: center
	}
	.allResultTabs  li a {
		padding-bottom: 2px;
	}
	.allResultTabs .active a {
		/* color: #910a0a; */
		border-bottom: 2px solid #24418a !important;
	}
}
/*searchResults styles ends here*/
</style>
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper" id="Search-result-page">
		<form method="post">
			<input type="hidden" name="docServerUrl"
				value="${properties['docserver.url']}" id="docServerUrl"> <input
				type="hidden" name="search_param" value="all" id="search_param">
			<input type="hidden" name="searchitem" id="searchitem"> <input
				type="hidden" name="searchtype" id="searchtype">
			<!-- header container having logo and navigation -->
			<header> <%@ include file="header.jsp"%>
			</header>

			<%-- <div  class="number-of-product"><span id="DisplayLength"></span> <spring:message code="search.resultsfor"></spring:message> '<span id="productName"></span>'</div> --%>

			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">

				</ul>
			</div>
			<div class="content-wrapper container-fluid">
				<div id="mywrapper">
					<div class="error-msg" style="display: none;"></div>

					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
						<h3 class="inline">
							<spring:message code="search.searchresults"></spring:message>
						</h3>
						&nbsp; <strong>(<span id="DisplayLength"></span> <spring:message
								code="whereused.results" />)
						</strong>
						<!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<div class="pull-right" style="padding-top:20px;">
								<strong><spring:message code="search.resultsperpage"></spring:message></strong>
								<select id="size" name="size">
									<option>5</option>
									<option>10</option>
									<option>20</option>

								</select>
							</div>
						</div>-->
					</div>



					<div class="clearfix"></div>
					<div class="allResultTabs searchResultMenu">

						<ul class="allResultTabs">
							<li><a href="#all" data-toggle="pill"
								onclick="javascript:performSearch('all')"><spring:message
										code="search.type.allresults">
									</spring:message> <%--  (${allResultsTotalhits}) --%></a></li>
							<%-- <li><a href="#part" data-toggle="pill"
							onclick="performSearch('part');"><spring:message
									code="search.type.part"></spring:message> (${partTotalhits})</a></li> --%>
							<li><a href="#partNumber" data-toggle="pill"
								onclick="performSearch('partNumber');"><spring:message
										code="search.type.partnumber">
									</spring:message></a></li>
							<li><a href="#partDescription" data-toggle="pill"
								onclick="performSearch('partDescription');"><spring:message
										code="search.type.partdescription"></spring:message></a></li>
							<sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
								<li><a href="#category" data-toggle="pill"
									onclick="performSearch('category');"> <spring:message
											code="search.type.productcategories"></spring:message>
										${categoryTotalhits}
								</a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
								<li id="catalogview"><a href="#catalog" data-toggle="pill"
									onclick="performSearch('catalog');"><spring:message
											code="search.type.machinecatalogs"></spring:message> <%-- (${vehicleTotalhits}) --%></a></li>
							</sec:authorize>

							<%-- <sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')"><li><a href="#productcatalog" data-toggle="pill" onclick="performSearch('productcatalog');"><spring:message code="search.type.productcatalogs"></spring:message></a></li></sec:authorize> --%>
						</ul>
					</div>
				</div>

				<!--<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 resultBox1 marginNone">

					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding number-of-product">
						
					</div>
					<div class=" result-count col-lg-2 col-md-2 col-sm-3 col-xs-12 nopadding pull-right">
						
					</div>
				</div>-->
				<div class="clearfix"></div>


				<div class="tab-content" id="appendAll">
					<p style="display: none">
						<spring:message code="search.noaccesstomachinecatalog"></spring:message>
						<span></span>
						<spring:message code="search.pleasecontactadministrator"></spring:message>
					</p>
					<div class="tab-pane active" id="all">
						<!--All result content-->

					</div>
					<div class="clearfix"></div>
					<!-- <div class="tab-pane" id="part"></div> -->
					<div class="tab-pane" id="partNumber"></div>
					<div class="tab-pane" id="partDescription"></div>

					<div class="tab-pane" id="catalog"></div>
					<div class="tab-pane" id="category"></div>
					<!-- <div class="tab-pane" id="productcatalog"></div>  -->
				</div>
				<!-- 04-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found. -->
				<div class="modal bs-example-modal-md" id="myModal" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog">
						<div class="modal-content custom-modal-content">
							<div class="modal-header custom-modal-header">
								<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
								<h4 class="modal-title custom-modal-title">
									<spring:message code="label.bulkpartupload.information" />
								</h4>
							</div>
							<div class="modal-body custom-modal-body"></div>
						</div>
					</div>
				</div>

				<!--All result content ends here-->



			</div>


			<%-- 	<div class="numberOfPages">
		<c:if test="${currentpageNumber != 1}">
			<li><a href="#" onclick="performSearchPaging('${currentpageNumber - 1}');" >Previous</a></li>
		</c:if>
			<ul class="pagination">
				<c:forEach begin="1" end="${noOfPages}" var="i">
					<c:choose>
						<c:when test="${currentpageNumber eq i}">
							<li class="active" ><a href="#" onclick="performSearchPaging('${i}');">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onclick="performSearchPaging('${i}');">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<c:if test="${currentpageNumber lt noOfPages}">
			<li><a href="#" onclick="performSearchPaging('${currentpageNumber + 1}');" >Next</a></li>
		</c:if>
		</div> --%>

			<div class="column-paddings" style="height: 120px">
				<div class="col-sm-12 text-center hidden-xs" id="page-selection"></div>
				<div class="col-sm-12 text-center hidden-lg hidden-md hidden-sm"
					id="page-selection-xs"></div>
			</div>

			<footer> <%@ include file="footer.jsp"%>
			</footer>
		</form>

	</div>
	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>Loading...</h4>
			<div class="loader"></div>
		</div>
	</div>

	<script>
			//04-01-2015 A 5.5.1.0_EH_handling_exception_if_no_node_found.
			 $(".custom-close").click(function(){
		  			 $("#myModal").hide();
			});
			var previousUrl = document.referrer;
	        function addItemToCart(partId,mediaId,orderMultiple,organizationId,itemNumber){
	        	var userid = $("#userId").val();
	        	var authtoken = $('#authToken').val();
	        	var dataItemVal = null;
	        	var quantity = 0;
	        	//var ordMultiple = $(this).parents('.spinner-control').attr('data-ordermultiplekey');
	            quantity = getOrderMultiplesForQuantity(quantity, partId, orderMultiple);
	              
	        	  $('div.pageLoader').show();
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
						console.log(response)
                    getShoppingCartCount();
						if (response == '') {
							/* alert("Part is not added...") */
							$('div.pageLoader').hide();
							$("body").css("overflow", "auto");
							$(".cart-popover").css({"opacity": 1});
							$(".cart-popover").show().stop().fadeOut(5000);
							$(".cart-popover").find(".cart-popover-img").html(img).children().css({"height":"100px","margin-top":"0"}).prop("onclick",null).hover(function(){
								$(this).css("text-decoration","none");
							});
							$(".cart-popover").find(".cart-popover-title").text("<spring:message code='quick.search.item' javaScriptEscape='true'/> " + itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
						} else {
							var jsonResponse = JSON.parse(response);
							
							if(typeof jsonResponse.errorMessage=="undefined"){
								$('div.pageLoader').hide();
								$("body").css("overflow", "auto");
								$(".cart-popover").css({"opacity": 1});
								$(".cart-popover").show().stop().fadeOut(5000);
								
								if(mediaId != 0)
		    	        	 	{
									$(".cart-popover").find(".cart-popover-img").children().attr("src",'${properties['docserver.url']}?media='+mediaId+'&thumbnail=true&user='+userid+'&token='+authtoken);
									//NREV-1511 fix starts
									if(jsonResponse.isActualImage == false){
										$(".waterMarkForCartPopOver").show();
									}
									//NREV-1511 fix ends
		    	        	 	}else
								  {
		    	        	 		$(".cart-popover").find(".cart-popover-img").children().attr("class","no-image");   
									  
								  }
									$(".cart-popover").find(".cart-popover-title").text("<spring:message code='quick.search.item' javaScriptEscape='true'/> " + itemNumber + " <spring:message code='label.cart.add.success' javaScriptEscape='true'/>");
							}
							else{
								$('div.pageLoader').hide();
								$("body").css("overflow", "auto");
	    	        	 		$('.modal-body').text(jsonResponse.errorMessage);
	    		    			$("#myModal").show();	
							}
							/* alert("Part is added to your cart..."); */
						}
						 
					},
					error : function(e) {
						 $('div.pageLoader').hide();
					}
				});
	        	
	        	
	        }
       
        $(".breadcrumb").append('<li><a href='+$("#new-main-menu-list > li:nth-child(1)").find('a').attr('href')+'>'+$("#new-main-menu-list >li:nth-child(1)").text()+'</a></li>');
		$(".breadcrumb > li:last-child()").after('<li class="active"><spring:message code="label.whereused.search"/></li>');
	
        
        
            $('#pills-first a').hover(function (e) {
                e.preventDefault()
                $(this).tab('show')
            });
           
            $(document).ready(
                function() {
                $('#appendAll .tab-pane').click(function() {
                	  $('.allResultTabs li').removeClass('active');    
                	  $(this).addClass('active');
                	});
                
               
                }
               
            );
        	function performSearch(type){
        		var key=$("#keyword").val();
        		var fuz=$('#fuzzy').val();
        		var exampl= $("#typedropdown").val();
        		$('#typedropdown').val(type);
        		
        	 	document.forms[0].action="searchrequest"; 
        		document.forms[0].submit();
        	};
        	function performSearchPaging(number){
        		
        		$('#currentpageNumber').val(number);
        		document.forms[0].action="searchrequest";
        		document.forms[0].submit();
        	};
			function searchredirect(itemId,type){
        		$('#searchitem').val(itemId);
        		$('#searchtype').val(type);
        		document.forms[0].action="searchresultredirect";
        		document.forms[0].submit();
        	};
        	
        	//FavList
        	function addItemToFavListPage(partId, mediaId, quantity,organizationId, evt){
        		  var dataItemVal = null;
        		  $('div.pageLoader').show();
        			 $.ajax({  
        		        type : "POST",
        		        data : {partId: partId,mediaId: mediaId,quantity: quantity,organizationId: organizationId, dataItemVal:dataItemVal},
        		        url : "addToFavoritesCart",
        		        cache : false,
        		        success : function(response) {
        		         	if(response){
        		         		var jsonResponse = JSON.parse(response);
        		        	 	if(typeof jsonResponse.errorMessage != "undefined"){
        		        	 		$('.modal-body').text(jsonResponse.errorMessage);
        			    			$("#myModal").show();	
        		        	 	}
        		        	 	evt.preventDefault();
        		        	 	$(evt.target).removeClass("no-fav-item").addClass("fav-item");
        		        	 	$(evt.target).parent().attr("title", "<spring:message code='label.onhover.removefromfav' javaScriptEscape='true'/>");
        		        	 	$('div.pageLoader').hide();
        		         	}
        		         	$('div.pageLoader').hide();
        		         	infoAlertBox("Added to favorites list");
        		        },  
        		        error : function(e) {  
        		        	console.log($(evt).target);
        	     		$('div.pageLoader').hide();
        		        }  
        		    });
        	};

        	//Delete Fav
        	function deleteFromFavList(dataItemLst, evt){
        	   	$('div.pageLoader').show();
        		$.ajax({
        	          type : "Get",
        	          data : {"objectRef":"{\"dataItemLst\":" + JSON.stringify(dataItemLst) + "}"},
        	          contentType: 'application/json;charset=utf-8',
        	          mimeType: 'application/json',
        	          dataType:"json",
        	          url : "deleteFavoritesCartItemFromPart",
        	      	cache : false,
        	  		success : function(response) {
        	  			evt.preventDefault();
        	   	  		$(evt.target).removeClass("fav-item").addClass("no-fav-item");
        	   	  		$(evt.target).parent().attr("title", "<spring:message code='label.onhover.addtofav' javaScriptEscape='true'/>");
        				$('div.pageLoader').hide();
        				infoAlertBox("Removed from favorites list");
        	      	},  
        	      	error : function(e) {  
        	   	  		$('div.pageLoader').hide();
        	      	}  
        	   	});
        	        e.preventDefault();
        	};

        	function infoAlertBox (msgText){
        		var msgMrk = '<div id="generalInfobox"><div class="alert alert-info alert-dismissible" role="alert">';
        		msgMrk += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
        		msgMrk += '<strong>Information!</strong> ' +  msgText + '</div></div>'
        		
        		$("body").append($(msgMrk));
        		$("#generalInfobox").show().fadeOut(10000, function(){
        			$(this).remove();
        		});
        	};

        	
        	$( "#size" ).change(function() {
        		var currentpageNumber=$('#currentpageNumber').val();
        		document.forms[0].action="searchrequest";
        		document.forms[0].submit();
        	});
        	
        	
        	$('#page-selection').bootpag({
        		 total: '${noOfPages}',
                 page: '${currentpageNumber}', 
                 maxVisible:  10,
                 leaps: false,
                 firstLastUse: true,
                 first: '<spring:message code="label.homepage.first" javaScriptEscape="true"/>',
                 last: '<spring:message code="label.homepage.last" javaScriptEscape="true"/>',
                 next: '<spring:message code="label.homepage.next" javaScriptEscape="true"/>',
                 prev: '<spring:message code="label.homepage.previous" javaScriptEscape="true"/>'
        		}).on('page', function(event, num){
        			performSearchPaging(num); 
        		});
        		$('#page-selection-xs').bootpag({
        		 total: '${noOfPages}',
                 page: '${currentpageNumber}', 
                 maxVisible:  2,
                 leaps: true,
                 firstLastUse: true,
                 first: '<spring:message code="label.homepage.first" javaScriptEscape="true"/>',
                 last: '<spring:message code="label.homepage.last" javaScriptEscape="true"/>',
                 next: '<spring:message code="label.homepage.next" javaScriptEscape="true"/>',
                 prev: '<spring:message code="label.homepage.previous" javaScriptEscape="true"/>'
        		}).on('page', function(event, num){
        			performSearchPaging(num); 
        		});
        		
        	keywordsearch = $("#keyword").val();
        	 var totalNoOFPages =  '${noOfPages}';
        	 var currentPageNumber= '${currentpageNumber}'
        	if(currentPageNumber==totalNoOFPages){
        		  $("li.next, li.last").addClass("disabled");
        		} 
        	 
        	 
        	 
        	 
        	 function getOrderMultiplesForQuantity(quantity, partId, ordMultiple) {
     			var itemCount = parseFloat(quantity);			
     			var incFactor = parseFloat(ordMultiple);
     			
     			//itemCount = (itemCount >= 999.99) ? 999.99 : itemCount;
     			var newVal = 0.0;
     			if(itemCount >= 999.99){
     				newVal = (999.99 - (999.99 % incFactor));
     			}
     			else if((itemCount % incFactor) == 0)
     			{
     				newVal = itemCount;
     			}
     			else if ((itemCount % incFactor) > 0.0){
     				newVal = (itemCount - (itemCount % incFactor)) + incFactor ;
     			}
     			
     			if(isNaN(itemCount) || itemCount == 0.0 ){
     				newVal = incFactor;
     			}
     			
     			newVal = (newVal >999.99) ? newVal - incFactor : newVal;
     			
     			if(newVal == 0.0 && incFactor!=null && incFactor != 0.0 && itemCount !=0.0 ){
     				
     				newVal = itemCount*incFactor;
     			}
     			
     			return parseFloat(newVal);
     	  }
        	 
        	
        </script>

</body>
</html>

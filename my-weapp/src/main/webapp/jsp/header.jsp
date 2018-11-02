<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value='en_US' />
<fmt:setBundle basename='messages' />
<link rel="stylesheet"   type="text/css" href="../css/theme.css?version=${properties['application.version']}">	 
<script src="../js/errorHandler.js?version=${properties['application.version']}"    type="text/javascript"></script>
<script src="../js/cart-count.js?version=${properties['application.version']}" type="text/javascript"></script>
<!-- Display find a dealer link (Developed by : Swetha) -->
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css" href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->
<script type="text/javascript">
var isMobile = "${sessionScope['scopedTarget.genericUserProperties'].isMobileOnly}";
console.log("ismobile: " + isMobile);
var isGuest = "${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}";
console.log("isguest: " + isGuest);
var isLang = "${sessionScope['scopedTarget.genericUserProperties'].languageName}";
console.log("isLang: " + isLang);
if(isLang != 'en_US'){
	$('head').append('<link rel="stylesheet" href="../css/de_DE.css" type="text/css" />');
}
$(document).keyup(function(e) {	 
	  if (e.keyCode === 27) $('.close').click();   // esc
});
$(document).ready(function(e){	
	////to hide div in mobile. Added by Pooja. Reviewed by Krupa
				
		$("#loggedin-user2").hide();
		if(isMobile == 'true' && isGuest=='false'){
			$("#headerLink").hide();
			$(".side-collapse").css({"top": "42px"});
			/* $(".side-collapse").css({"height": "186px"}); */
		}else{
			$("#headerLink").show();
			/* $(".side-collapse").css({"top": "62px"}); */
			/* $(".side-collapse").css({"height": "159px"}); */
		}
		if(isMobile == 'true' && isGuest=='true'){
			$("#loggedin-user2").hide();
			$("#user-popupdd").hide();
			
		}
		else{
	   		$("#loggedin-user2").show();
	   		$("#user-popupdd").show();
	  	}

		if(isMobile == 'true' && isGuest=='false'){
			$(".mobile_search").css({"margin-top": "42px"});
			$(".main-wrapper").css({"padding-top": "85px"});
			$("header").css({"height": "85px"});
		}
		
		/* Responsive - Nav Bar - GSP-876 - on mobile Burger menu list control to another position by touch start*//* By Guru & Dibu */
		
		if(isMobile == 'true'){
			$(".menu_toggle").on("click", function(e){
			    e.stopPropagation();
			});
	
			$(document).on("click", function(e){
				
				if($(".side-collapse").hasClass("in")){
					$(".side-collapse").removeClass("in");
				}
			    e.stopPropagation();
			}); 
		}else
		{
			 $(".menu_toggle").off("click");
			 /* $(document).off("click");  */
		}
		
		/* Responsive - Nav Bar - GSP-876 - on mobile Burger menu list control to another position by touch Ends*/
});
</script>
<style>
.header-links a {
	padding: 5px 5px 5px 10px !important;
}

.navbar-toggle {
	padding: 0px 2px 0px 10px;
	margin-right: 6px;
}

.navbar-default .navbar-collapse, .navbar-default .navbar-form {
	border-color: #e7e7e7;
}


/*new css starts*/
@media ( min-width : 300px) {
	.nav li {
		border-bottom: 1px solid rgba(210, 210, 210, 0.4);
	}
	.header-container {
		height: auto;
	}
	.navbar-nav>li>a {
		color: #FFFFFF;
		width: auto !important;
		font-size: 13px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	.nav>li>a:focus, .nav>li>a:hover, .nav>li>a:active {
		text-decoration: none;
		color: #fff;
	}
	.navbar-nav>.active>a {
		color: #fff;
	}
}

@media ( min-width : 768px) {
	.navbar-nav>li {
		float: none;
		display: inline-block;
	}
	.nav>li>a:focus, .nav>li>a:hover, .nav>li>a:active {
		text-decoration: none;
	}
	.navbar-nav>li>a {
		color: #ffffff;
		width: auto !important;
		padding: 7px 10px 8px 10px;
		font-size: 16px;
	}
	.nav li {
		border-bottom: 0px solid rgba(255, 255, 255, 0.16);
		bottom: 1px;
		margin: -3px;
	}
	.nav li:first-child {
		border-left: none;
	}
	.navbar {
		border-radius: 0px;
		height: 35px;
		min-height: 35px;
	}

	.navbar-nav {
		text-align: center;
		margin: 0 auto;
		float: none;
	}
	.header-container {
		height: 80px;
	}
}

@media ( min-width : 890px) {
	.navbar-nav>li>a {
		padding: 7px 10px 8px 10px;
	}
}

@media ( min-width : 992px) {
	.navbar-nav {
		margin: 0;
		width: 100%;
		text-align: center;
		margin: 0px auto;;
	}
	.navbar-nav>li>a {
		padding: 7px 25px 8px 25px;
	}
}

@media ( min-width : 1338px) {
	.navbar-nav {
		float: left;
	}
}

.navbar-toggle {
	margin-top: 11px;
}

.main-menu {
	display: none;
}

.navbar-brand {
	padding: 1px 1px;
	height: 53px;
}

.custom_positon {
	float: left;
	height: 40px;
	padding: 4px 3px;
	font-size: 18px;
	line-height: 20px;
	position: absolute;
	background-color: #ffffff;
}

.brand {
	height: 100%;
	padding: 0px 0px 0px;
	position: relative;
	left: 0px;
	top: -2px;
	text-align: center;
}

.navbar {
	margin-bottom: 0px !important;
}

@media screen and (max-width: 767px) {
	.side-collapse {
		top: 62px;/* Responsive:Guru GSP-876- mobile menu hide on body click*/
		z-index: 99;
		bottom: 0;
		left: 0;
	    width: 0;
		position: fixed;
		overflow: hidden;
	}
	
	.div.user-popup, div.user-popup1 {
		top: 46px;
		right: 39px;
	}
}
</style>
<!-- Display find a dealer link ends -->
<!-- Javascript Plugins -->
<script type="text/javascript" src="../js/jquery.i18n.properties.js?version=${properties['application.version']}" defer  ></script>
<div class="header-container container-fluid">
    <div class="top-bar">
    <div id="headerLink" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 header-links text-right nopadding">
   			 <c:if test="${properties['enable.newsite.link']=='true'}">
     		   	<a href="storeComingSoon" class="hidden-xs">
                    <spring:message code="label.header.newsite"/>
                </a>
             </c:if>
             
                <a href="contact" class="hidden-xs">
                    <i class="fa fa-phone "></i>
                    <spring:message code="label.header.contactus"/>
                </a>
                <!-- Display find a dealer link (Developed by : Swetha) -->   <!--Added check for GSP-911-->     
                <c:if test="${properties['findADealer.link.required']=='true'}">
                	<a class="hidden-xs" href="findADealer" id="dealerLinkDiv"><spring:message code="label.header.findADealer" /></a>
              	</c:if>
                <!--Display find a dealer link ends -->
                <a href="${properties['base.url']}${properties['help.url']}" target="_blank" class="hidden-xs"><spring:message code="help.message"/></a>
                <c:set var="languages" value="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}"/>
                <c:choose>
                    <c:when test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
                       
                        <!-- language selection for non logged in user-->
                        <c:choose>
                        <c:when test="${sessionScope['scopedTarget.genericUserProperties'].languageDescription eq null}">
                         <a id="loggedin-user" class="currentLanguage" href="#">English (US)</a>
                        </c:when>
                        <c:otherwise>
                        
                        <a id="loggedin-user" class="currentLanguage" href="#">${sessionScope['scopedTarget.genericUserProperties'].languageDescription}
                           <c:if test="${fn:length(languages) gt 1}">
                          		 <i class="fa fa-sort-desc"></i>
                           </c:if>
                        </a>
                        </c:otherwise>
                        </c:choose>
                        <!-- language selection for non logged in user end-->
                        
                         <a id="" onclick="maskingForPage()" href="register-page" ><i class="fa fa-sign-in"></i><spring:message code="label.register.register"/></a>
                        <a id="" onclick="maskingForPage()" href="${sessionScope.loginUrl}?forceLogin=true"><i class="fa fa-user "></i><spring:message code="message.login"/></a>
                        
                        
                        <!-- Pop up for language selection for non logged in user-->
                        
                     <c:if test="${fn:length(languages) gt 1}">
                        <div class="user-popup user-nonloggedin hidden" style="right: 140px !important">
        				<ul class="nopadding" id="lang">
                    		<c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}" >
            					<li><a href="javascript:void(0);" id="${item.key}" class="languageClick">${item.value}</a></li>
         					</c:forEach>
                        </ul> 
                       </div><!-- Pop up for language selection for non logged in user end-->
                     </c:if>    
                    </c:when>
                    <c:otherwise>
                        <sec:authorize access="isAuthenticated()">
                        
                        <!-- language selection for logged in user-->                       
                        
                        <a id="loggedin-user1" class="currentLanguage" href="#">${sessionScope['scopedTarget.genericUserProperties'].languageDescription}
                          
                           <c:if test="${fn:length(languages) gt 1}">
                              <i class="fa fa-sort-desc"></i>
                           </c:if>   
                        </a>
                        
                        <!-- language selection for logged in user end--> 
                        <a id="loggedin-user" href="#">
                        <i class="fa fa-user"></i>
                        <sec:authentication property="principal.firstName" />
                        <i class="fa fa-sort-desc"></i>
                        </a>        
                        </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="user-popup hidden">
                        <ul class="nopadding">
			    		<%-- 	<c:if test="${properties['user.application']=='STANDALONE'}">
			  				<sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER')"><li><a onclick="maskingForPage()"href="getorders"> <spring:message code="label.header.historicalorder"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize> 
			    			</c:if>
			    			<c:if test="${properties['user.application']!='STANDALONE'}"> 
			    				<sec:authorize access="hasRole('ROLE_ORDER')"><li><a onclick="maskingForPage()"href="historicalorderbrand"> <spring:message code="label.header.order"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize>
			    				<!-- 03-07-2017: Hiding historical orders link for retail user. Added by Pooja & reviewed by Rajesh--> 
                            	<!--<sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER') and !hasRole('ROLE_RETAIL_CUSTOMER')"><li><a onclick="maskingForPage()"href="getorders"> <spring:message code="label.header.historicalorder"/> </a></li></sec:authorize>--> 
                           </c:if> --%>
			    			<c:choose>
								<%-- <c:when test="${properties['user.application']=='REV'}">
									<sec:authorize access="hasRole('ROLE_ORDER')"><li><a onclick="maskingForPage()"href="getorders"> <spring:message code="label.header.order"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize>
								</c:when> --%>
								<c:when test="${properties['user.application']=='STANDALONE'}">
									<sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER')"><li><a onclick="maskingForPage()"href="getorders"> <spring:message code="label.header.historicalorder"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize>
								</c:when>
								<c:otherwise>
       								<sec:authorize access="hasRole('ROLE_VIEW_ORDER')"><li><a onclick="maskingForPage()"href="historicalorderbrand"> <spring:message code="label.header.order"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize>
								</c:otherwise>
                             </c:choose>	
			    				    			 
                             <!-- Fuctanality commented for Demo Release -->
                            <sec:authorize access="hasRole('ROLE_CART')"><li><a onclick="maskingForPage()"href="getquotes"> <spring:message code="label.header.quote"/> <!--<i class="badge">4</i>>--></a></li></sec:authorize>
                            <!-- 03-07-2017: Hiding invoice link for retail user. Added by Pooja & reviewed by Rajesh--> 
							 <sec:authorize access="hasRole('ROLE_INVOICE') and !hasRole('ROLE_RETAIL_CUSTOMER')"><li><a onclick="maskingForPage()"href="invoicelistbrand"> <spring:message code="label.header.invoicelist"/></a></li></sec:authorize> 
			    <li><a onclick="maskingForPage()"href="myfavorites"> <spring:message code="label.header.favorites" /> <!--<i class="badge">4</i>>--></a></li>
			    <%-- <sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><li><a onclick="maskingForPage()" href="mymachine?sortSelect=catalogName"><spring:message code="label.header.vehicle"/> </a></li></sec:authorize> --%>
                             <!-- NREV-1447 :Added By Hari  -->
                             <c:choose>
				<c:when test="${properties['facetSearch.required']}">
					<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="machinecentre"><spring:message code="label.header.myvehicle"/></a></sec:authorize></li>
				</c:when>
				<c:otherwise>
       				<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
							<a href="mymachine?sortSelect=catalogName"
								onclick="maskingForPage()"><spring:message
										code="label.header.myvehicle" /></a>
						</sec:authorize></li>
				</c:otherwise>
			</c:choose>

                            <%-- <li><a onclick="maskingForPage()" href="userprofile?selectedOrganization=null&defaultTab=accountSetting&organizationTab=0"><spring:message code="label.header.account"/> </a></li> --%>
                            <%-- <li><a onclick="maskingForPage()" href="userprofile?selectedOrganization=null&defaultTab=changePassword&organizationTab=0"><spring:message code="label.header.password.change"/> </a></li> --%>
                           <!-- START ACCOUNT SETTING CLEANUP 20160525 -->
                            <li><a href="accountsetting"><spring:message code="label.header.account"/></a></li>
                            <li><a href="changePassword"><spring:message code="label.header.password.change"/></a></li>
                            <li><a onclick="maskingForPage()" href="logout"><spring:message code="label.header.signout"/></a></li>
                            <!-- END ACCOUNT SETTING CLEANUP 20160525 -->
                        </ul>
                    </div>
                    
                    <!-- Pop up for language selection for logged in user-->
                    
                    <c:if test="${fn:length(languages) gt 1}">
                    <div class="user-popup1 hidden">
                    	<ul class="nopadding" id="lang">
                    		<c:forEach var="item" items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
            					<li><a href="javascript:void(0);" id="${item.key}" class="languageClick">${item.value}</a></li>
         					</c:forEach>
                        </ul> 
                    </div><!-- Pop up for language selection for logged in user end-->
                    </c:if>
                    
                </sec:authorize>                         
                    </c:otherwise>
                </c:choose>
                
            </div>
            <section class="container-fluid">
       <div class="col-lg-3 col-md-3 col-sm-3 col-xs-4 brand hidden-xs">
            <a class="hidden-xsx hidden-smx" href="${properties['default.landing.page']}">
               <img id="headerlogo" src="${sessionScope.logo}" alt="" class="img-responsive" style="/*display: inline-block; width: 100%;height:auto */">
            </a>
                <a class="visible-xsx visible-smx" style="margin-top:10px;display: none;" href="${properties['default.landing.page']}">
                  <img id="headerlogo" src="${sessionScope.logo}" alt="" class="img-responsive" style="/* display: inline-block;width: auto;height:auto */">
            </a>
        </div>
        <input type="hidden" id="language_id_" value="${sessionScope['scopedTarget.genericUserProperties'].languageName}" />
        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 mobile_search">
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 search-bar">
                <div class="input-group">
                    <!--below four hidden tag used for geting docserver,sapinstaller and media url from properties file  -->
                    <input type="hidden" name="docServerUrl" value="${properties['docserver.url']}" id="docServerUrl">
                    <input type="hidden" name="sapInstalledUrl" value="${properties['sap.installer.link']}" id="sapInstalledUrl">

                    <input type="hidden" name="mediaUrl" value="${properties['media.Url']}" id="mediaUrl"> 
                    <input type="hidden" name="required3DViewerVersionUrl" value="${properties['threed.required.version']}" id="required3DViewerVersionUrl"> 
                    <input type="hidden" name="search_param" value="all" id="search_param"> 
                    <input type="hidden" id="fuzzy" name="fuzzy" /> 
                    <input type="hidden" name="currentpageNumber" id="currentpageNumber" /> 
                     <input type="hidden" name="locale" value='${locale}' id="locale" /> 
                      <input type="hidden" name="hideOrShowFields" value='${hideOrShowFields}' id="hideOrShowFields" /> 
                     <input	type="hidden" name="userApplication" value="${properties['user.application']}" id="userApplication">
                    
                   
                    <input type="hidden" name="typedropdown" id="typedropdown" value="all" />
                    
                    
                    <input type="hidden" name="callingLocation" id="callingLocation"/>
                    <input type="hidden" name="previousURL" id="previousURL" />
                     <input type="hidden" id="hdnQuoteOrder" value=""/>
                     <input type="hidden" id="breadcrumbsArray" name="breadcrumbsArray" value=""/>
                     <input type="hidden" id="productCategoryMappingId" name="productCategoryMappingId" value=""/>
                     <input type="hidden" id="issearch" name="issearch" value=""/>
                               <input type="hidden" id="hdnQuoteOrder" value=""/>
                    <!-- Below two properites help us to get the logged in user userId and Authtoken -->
                    <sec:authorize access="isAuthenticated()">
                        <input type="hidden" id="userId" value="<sec:authentication property='principal.id'></sec:authentication>">
                        <input type="hidden" id="authToken" value="<sec:authentication property='principal.authToken'></sec:authentication>">
                            </sec:authorize>

                    
                    <sec:authorize access="hasRole('ROLE_ENGG_DESC')"> <input type="hidden" name="viewEngDesc" id="viewEngDesc" value="true"/> </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_VENDOR_PART')"> <input type="hidden" name="viewVendorPart" id="viewVendorPart" value="true"/> </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')"> <input type="hidden" name="viewProdCatalog" id="viewProdCatalog" value="true"/> </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"> <input type="hidden" name="viewMachineCatalog" id="viewMachineCatalog" value="true"/></sec:authorize>
                    <!--div class="input-group-btn search-panel"> -->
                    <span class="input-group-btn search-panel">
                        <button  type="button" class="btn btn-default dropdown-toggle searchall-dpdown" data-toggle="dropdown" aria-expanded="false">
	                       	<span class="search-options-label hidden-xs"><!-- Search All --><spring:message code="search.searchall"/></span>
	                       	<span class="caret-big"></span>
                        </button>

                            <ul class="dropdown-menu dropdown-menu-left ul-width180" id="dropdown" role="menu">
                                <li data-value="all"><a href="javascript:void(0);" data-value="all"><!-- Search All --><spring:message code="search.searchall"></spring:message></a></li>
                                <li data-value="partNumber"><a href="javascript:void(0);" data-value="partNumber"><!-- Part Number --><spring:message code="search.type.partnumber"></spring:message></a></li>
                                <li data-value="partDescription"><a href="javascript:void(0);" data-value="partDescription"><!-- Part Description --><spring:message code="search.type.partdescription"></spring:message> </a></li>
								<c:choose>
								<c:when test="${properties['facetSearch.required']}">
								</c:when>
								<c:otherwise>
									<sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
										<li data-value="category"><a href="javascript:void(0);"
											data-value="category">
												<!-- Product Categories -->
												<spring:message code="search.type.productcategories"></spring:message>
										</a></li>
									</sec:authorize>
								</c:otherwise>
								</c:choose>
								<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"> <li data-value="Vehicles"><a href="javascript:void(0);" data-value="Vehicles"><!-- Machines --><spring:message code="search.type.machinecatalogs"></spring:message></a></li></sec:authorize>
							</ul>
						</span> <a href="javascript:void(0)" id="searchclear"
							class="clear-search"><i class="fa fa-times"></i></a> <input
							id="keyword" name="keyword" type="text"
							class="form-control keyword" aria-label="Search"> <span
							class="input-group-addon search_icon" id="searchsubmit"><i
							class="fa fa-search fa-2x"></i></span>
						<script>
                        $('#keyword').attr('placeholder','<spring:message code="label.header.search.part"/>');
                        </script>


						<sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
							<script>
                        var placeholder = $('#keyword').attr("placeholder");
                        $('#keyword').attr('placeholder',placeholder+", "+'<spring:message code="search.type.partdescription"/>');
                        
                       // $('#keyword').attr('placeholder',placeholder+", "+'<spring:message code="search.placeholder.productcategory"/>');
                        </script>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
							<script>
                        var placeholder = $('#keyword').attr("placeholder");
                        $('#keyword').attr('placeholder',placeholder+" or Machines");//+'<spring:message code="search.vehicle"/>'
                        </script>
							<script>
 
                     function maskingForPage(){
                    	 $("div.pageLoader").find("h4").text("Loading ...");
                         $('div.pageLoader').show();    
                        }

                    </script>
						</sec:authorize>
					</div>
				</div>
				<c:choose>
					<c:when
						test="${sessionScope['scopedTarget.genericUserProperties'].languageName eq 'de_DE'}">
						<input type="hidden" id="language_id_" value="de_DE" />
					</c:when>
					<c:otherwise>
						<input type="hidden" id="language_id_" value="en_US" />
					</c:otherwise>
				</c:choose>
				<div
					class="col-lg-2 col-md-2 col-sm-2 col-xs-4 cart-container hidden-xs hidden-smx">
					<sec:authorize access="hasRole('ROLE_CART')">
						<a href="getshoppingdetails"
							class="btn btn-addtocart cartbutton cart-large pull-right hidden-xs"
							style="margin-bottom: 0px; margin-left: 5px;"> <span
							class="cart-icon2"></span> <spring:message
								code="label.header.cart" /><span class="badge cartItemCount"></span>
						</a>
						<div class="cart-popover" style="display: none;">
							<div class="quick-search-cart">
								<div class="cart-popover-img">
									<img id="popOverImage" src="" alt="catalog-img"
										style="max-width: 105px;">
								</div>
								<div class="waterMarkForCartPopOver" style="display: none;">
									<span class="label1ForCartPopOver"
										style="margin: 6px; font-weight: 600;"><spring:message
											code="label.watermark.text1" /> </span> <span
										class="label2ForCartPopOver"
										style="font-size: 7px; font-weight: 400;"><br> <spring:message
											code="label.watermark.text2" /></br></span>
								</div>
								<span class="cart-popover-title"></span>
								<div class="clearfix"></div>
							</div>
						</div>
					</sec:authorize>
				</div>
			</div>
		</section>
	</div>
</div>

<nav class="navbar navbar-static" >
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="hidden-lg hidden-md hidden-sm"
				style="position: absolute; float: right; right: 15px; top: 5px; width: auto;">
				<sec:authorize access="isAuthenticated()">
					<!-- language selection for logged in user end 2-->
					<a id="loggedin-user2" href="#"
						style="width: 1px; height: 22px; color: #fff; margin: 3px 5px -3px; font-size: 22px;">
						<i class="fa fa-user"></i> <i class="fa fa-sort-desc"
						style="font-size: 14px;"></i>
					</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="user-popup hidden" id="user-popupdd">
						<ul class="nopadding">
							<%--   <sec:authorize access="hasRole('ROLE_ORDER')"><li><a onclick="maskingForPage()"href="historicalorderbrand"> <spring:message code="label.header.historicalorder"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize> --%>
							<%-- <sec:authorize access="hasRole('ROLE_ORDER')"><li><a onclick="maskingForPage()"href="getorders"> <spring:message code="label.header.order"/> <!--<i class="badge">2</i>>--></a></li></sec:authorize> --%>
							<%--   <sec:authorize access="hasRole('ROLE_CART')"><li><a onclick="maskingForPage()"href="getquotes"> <spring:message code="label.header.quote"/> <!--<i class="badge">4</i>>--></a></li></sec:authorize>   --%>

							<c:if test="${properties['user.application']=='STANDALONE'}">
								<sec:authorize access="hasRole('ROLE_HISTORICAL_ORDER')">
									<li><a onclick="maskingForPage()" href="getorders"> <spring:message
												code="label.header.historicalorder" /> <!--<i class="badge">2</i>>--></a></li>
								</sec:authorize>

							</c:if>
							
							<c:if test="${properties['user.application']!='STANDALONE'}">
								<sec:authorize access="hasRole('ROLE_VIEW_ORDER')">
									<li><a onclick="maskingForPage()"
										href="historicalorderbrand"> <spring:message
												code="label.header.order" /> <!--<i class="badge">2</i>>--></a></li>
								</sec:authorize>

							</c:if>

						

							<!-- Fuctanality commented for Demo Release -->

							<sec:authorize access="hasRole('ROLE_CART')">
								<li><a onclick="maskingForPage()" href="getquotes"> <spring:message
											code="label.header.quote" /> <!--<i class="badge">4</i>>--></a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_INVOICE')">
								<li><a onclick="maskingForPage()" href="invoicelistbrand">
										<spring:message code="label.header.invoicelist" />
								</a></li>
							</sec:authorize>

							<li><a onclick="maskingForPage()"href="myfavorites"> <spring:message code="label.header.favorites" /> <!--<i class="badge">4</i>>--></a></li>

							<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
								<c:choose>
								<c:when test="${properties['facetSearch.required']}">
									<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="machinecentre"><span><spring:message code="label.header.myvehicle"/></span></a></sec:authorize></li>
								</c:when>
								<c:otherwise>
				       				<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
											<a href="mymachine?sortSelect=catalogName"
												onclick="maskingForPage()"><span><spring:message
														code="label.header.myvehicle" /></span></a>
										</sec:authorize></li>
								</c:otherwise>
							</c:choose>
							</sec:authorize>
							
							<%-- <li><a onclick="maskingForPage()" href="userprofile?selectedOrganization=null&defaultTab=accountSetting&organizationTab=0"><spring:message code="label.header.account"/> </a></li> --%>
							<%-- <li><a onclick="maskingForPage()" href="userprofile?selectedOrganization=null&defaultTab=changePassword&organizationTab=0"><spring:message code="label.header.password.change"/> </a></li> --%>
							<!-- START ACCOUNT SETTING CLEANUP 20160525 -->
							<li><a href="accountsetting"><spring:message
										code="label.header.account" /></a></li>
							<li><a href="changePassword"><spring:message
										code="label.header.password.change" /></a></li>
							<li><a onclick="maskingForPage()" href="logout"><spring:message
										code="label.header.signout" /></a></li>
							<!-- END ACCOUNT SETTING CLEANUP 20160525 -->
						</ul>
					</div>

					<!-- Pop up for language selection for logged in user-->

					<c:if test="${fn:length(languages) gt 1}">
						<div class="user-popup1 hidden">
							<ul class="nopadding" id="lang">
								<c:forEach var="item"
									items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
									<li><a href="javascript:void(0);" id="${item.key}"
										class="languageClick">${item.value}</a></li>
								</c:forEach>
							</ul>
						</div>
						<!-- Pop up for language selection for logged in user end-->
					</c:if>

				</sec:authorize>
				<a href="getshoppingdetails" class="nav-cartx"> <span
					class="cart-icon2"></span> <span class="badge cartItemCount"
					style="margin-left: -7px;"></span>
				</a>

			</div>
			<!-- <button type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target="#myNavbar"> -->
			<button data-toggle="collapse-side" data-target=".side-collapse"
				data-target-2=".side-collapse-container" type="button"
				class="navbar-toggle pull-left menu_toggle">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand custom_positon hidden-md hidden-sm hidden-lg"
				href="homepage"><img id="headerlogo" src="${sessionScope.logo}" alt="" style="height: 33px;"/></a>
		
		</div>
		<!-- <div class="collapse navbar-collapse" id="myNavbar" > -->

		<div class="navbar-inversex side-collapse">
			<nav role="navigation" class="navbar-collapse">
				<ul class="nav navbar-nav" id="new-main-menu-list">
					<li><a href="homepage"><span><spring:message code="label.header.home" /> </span></a></li>
					<!--  Added by Rajesh to show Order Options if user has ROLE_ORDER -->
					<sec:authorize access="hasRole('ROLE_ORDER')">
						<li><a href="orderhere"><span><spring:message code="label.order.options" /></span></a></li>
					</sec:authorize>
				<c:choose>
				<c:when test="${properties['facetSearch.required']}">
					<li><sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')"><a href="shopCentre"><span><spring:message code="label.header.shopforparts"/></span></a></sec:authorize></li>
				</c:when>
				<c:otherwise>
       				<li><sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
							<a href="shopforparts"><span><spring:message
										code="label.header.shopforparts" /></span></a>
						</sec:authorize></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${properties['facetSearch.required']}">
					<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="machinecentre"><span><spring:message code="label.header.myvehicle"/></span></a></sec:authorize></li>
				</c:when>
				<c:otherwise>
       				<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
							<a href="mymachine?sortSelect=catalogName"
								onclick="maskingForPage()"><span><spring:message
										code="label.header.myvehicle" /></span></a>
						</sec:authorize></li>
				</c:otherwise>
			</c:choose>
					<li><sec:authorize
							access="hasRole('ROLE_DOCUMENT_REPOSITORY')">
							<a href="getmydocuments"><span><spring:message
										code="label.header.document" /></span></a>
						</sec:authorize></li>
					<li class="hide" hidden><a href="getorders"><span><spring:message
									code="label.header.order" /></span></a></li>
					<li class="hide" hidden><a href="getquotes"><span><spring:message
									code="label.header.quote" /></span></a></li>
					<li class="hide" hidden><a
						href="userprofile?selectedOrganization=null&defaultTab=accountSetting&organizationTab=0"><span><spring:message
									code="label.header.account" /></span></a></li>
					<li class="hide" hidden><a href="getshoppingdetails"><span><spring:message
									code="label.header.cart" /></span></a></li>
					<li class="hide" hidden><a><span><spring:message
									code="label.header.promotions" /></span></a></li>
					<li class="hide" hidden><a><span><spring:message
									code="label.header.fullitemdetail" /></span></a></li>
					<li class=""><a href="contact" class="hidden-sm hidden-md hidden-lg"> 
								<i class="fa fa-phone hidden-xs"></i> <spring:message
								code="label.header.contactus" />
					</a></li>
					<c:if test="${properties['enable.newsite.link']=='true'}">
						<li class=""><a href="storeComingSoon" class="hidden-sm hidden-md hidden-lg">
								 <spring:message code="label.header.newsite" />
						</a></li>
					</c:if>
					<li class="hidden-sm hidden-md hidden-lg"><a href="findADealer" id="dealerLinkDiv"><spring:message code="label.header.findADealer" /></a></li>
					<li><a
						href="${properties['base.url']}${properties['help.url']}"
						target="_blank" class="hidden-sm hidden-md hidden-lg"> <spring:message
								code="help.message" />
					</a></li>
				</ul>
			</nav>
		</div>
	</div>

</nav>
<!-- new menu ends -->


<div class="main-menu">
	<nav class="navbar hidden navbar-static" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse fade navbar-collapse" id="navbar">
				<ul class="nav navbar-nav">

					<li><a href="homepage"><span><spring:message
									code="label.header.home" /> </span></a></li>
				<c:choose>
				<c:when test="${properties['facetSearch.required']}">
					<li><sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')"><a href="shopCentre"><span><spring:message code="label.header.shopforparts"/></span></a></sec:authorize></li>
				</c:when>
				<c:otherwise>
       				<li><sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
							<a href="shopforparts"><span><spring:message
										code="label.header.shopforparts" /></span></a>
						</sec:authorize></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${properties['facetSearch.required']}">
					<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a href="machinecentre"><span><spring:message code="label.header.myvehicle"/></span></a></sec:authorize></li>
				</c:when>
				<c:otherwise>
       				<li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
							<a href="mymachine?sortSelect=catalogName"
								onclick="maskingForPage()"><span><spring:message
										code="label.header.myvehicle" /></span></a>
						</sec:authorize></li>
				</c:otherwise>
			</c:choose>
					<li><sec:authorize
							access="hasRole('ROLE_DOCUMENT_REPOSITORY')">
							<a href="getmydocuments"><span><spring:message
										code="label.header.document" /></span></a>
						</sec:authorize></li>
					<li class="hide" hidden><a href="getorders"><span><spring:message
									code="label.header.order" /></span></a></li>
					<li class="hide" hidden><a href="getquotes"><span><spring:message
									code="label.header.quote" /></span></a></li>
					<li class="hide" hidden><a
						href="userprofile?selectedOrganization=null&defaultTab=accountSetting&organizationTab=0"><span><spring:message
									code="label.header.account" /></span></a></li>
					<li class="hide" hidden><a href="getshoppingdetails"><span><spring:message
									code="label.header.cart" /></span></a></li>
					<li class="hide" hidden><a><span><spring:message
									code="label.header.promotions" /></span></a></li>
					<li class="hide" hidden><a><span><spring:message
									code="label.header.fullitemdetail" /></span></a></li>
				</ul>
				<ul class="visible-xs">
					<li><a href="getshoppingdetails" class="nav-cart"><span><spring:message
									code="label.header.cart" /></span> <span class="badge cartItemCount"></span></a></li>
				</ul>
			</div>
		</div>

	</nav>
</div>

<!--<div class="sidebar-content">
    <div class="sidebar">
        <ul>
            <li><a class="nav-home" href="homepage"><span>Home</span></a></li>
            <li><sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')"><a class="nav-parts" href="shopforparts"><span>Shop for Parts</span></a></sec:authorize></li>
            <li><a class="nav-build" href="../htmls/under-construction-page.html" target="_blank"><span>Build a Vehicle</span></a></li>
            <li><sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')"><a class="nav-machine" href="mymachine?sortSelect=catalogName" onclick="maskingForPage()"><span>My Vehicles</span></a></sec:authorize></li>
            <li><sec:authorize access="hasRole('ROLE_DOCUMENT_REPOSITORY')"><a class="nav-document" href="getmydocuments"><span>Documents</span></a></sec:authorize></li>
        </ul>
    </div>
</div>
<div class="cart-popover-xs" style="display:none; ">
    <div class="quick-search-cart">
        <div class="cart-popover-img"><img src="" alt="catalog-img" style="max-width:105px;"></div>
        <span class="cart-popover-title"></span>
        <div class="clearfix"></div>
    </div>
</div>-->

<script>

window.doOnOrientationChange = function(){

    var orientation = window.orientation;

    if (orientation === 0){
       $("#headerlogo").attr("src","../images/apple-touch-icon-57-precomposed.png").css({'position':'relative','bottom':'0px'});
    }

    else if (orientation === 90){
       $("#headerlogo").attr("src","../images/apple-touch-icon-57-precomposed.png").css({'position':'relative','bottom':'20px'});
    }

    else if (orientation === -90){
        $("#headerlogo").attr("src","../images/apple-touch-icon-57-precomposed.png").css({'position':'relative','bottom':'20px'});
    }

};
window.addEventListener('orientationchange', doOnOrientationChange);
doOnOrientationChange();

$(document).ready(function() {   
    var sideslider = $('[data-toggle=collapse-side]');
    var sel = sideslider.attr('data-target');
    var sel2 = sideslider.attr('data-target-2');
    sideslider.click(function(event){
        $(sel).toggleClass('in');
        $(sel2).toggleClass('out');
    });
});

$('.languageClick').click(function(){
	var languageId = $(this).attr('id');
	$.ajax({
	  type : "get",
	  cache: false,
	  url : "setlocale",
	  data : "languageId=" + languageId,
	  dataType : "json",
	  contentType : 'application/json;charset=ISO-8859-1',
	  success : function(data) {
		 //Added for issue GS-2697
		  var currentUrl =window.location.href;
		  if(currentUrl.indexOf("searchrequest") != -1 ){
			  document.forms[0].action = "searchrequest";
		      document.forms[0].submit();
		  }else if(currentUrl.indexOf("saveuserprofiledetails") != -1){
			  /*OM-657 */
			  window.location.href =  "userprofile?selectedOrganization=null&defaultTab=accountSetting&organizationTab=0";
 		  } else{
			  location.reload();
		  }
			
	  }
	 });
	
	
});


/*$("#main-menu-list").find("li.hide").remove();*/
var num= $("#main-menu-list").find("li a").length;
/*var winWidth = window.innerWidth;
if(num === 4 && winWidth>1024){
   $("#main-menu-list").css("paddingLeft","300px");
} else if (num === 3 && winWidth>1024){
   $("#main-menu-list").css("paddingLeft","450px"); 
}*/
var lang = $(".currentLanguage").text();
	if(lang === "English"){
      $("#lang").children("li").eq(0).css({"color":"#ffc321",'background': 'rgba(0, 0, 0, 0) url("../images/popover-arrowright-active.png") no-repeat scroll right center'});
    } else if(lang === "Deutsch"){
      $("#lang").children("li").eq(1).css({"color":"#ffc321",'background': 'rgba(0, 0, 0, 0) url("../images/popover-arrowright-active.png") no-repeat scroll right center'});
    }else if(lang === "Français"){
      $("#lang").children("li").eq(2).css({"color":"#ffc321",'background': 'rgba(0, 0, 0, 0) url("../images/popover-arrowright-active.png") no-repeat scroll right center'});
    }else if(lang === "Español"){
      $("#lang").children("li").eq(3).css({"color":"#ffc321",'background': 'rgba(0, 0, 0, 0) url("../images/popover-arrowright-active.png") no-repeat scroll right center'});
    }
var menu1 = $("#main-menu-list").find("span:contains('Shop for Parts')").size();
var menu2 = $("#main-menu-list").find("span:contains('Build a Vehicle')").size();
var menu3 = $("#main-menu-list").find("span:contains('Machines')").size();
var menu4 = $("#main-menu-list").find("span:contains('Documents')").size();
var screenwidth = $(window).width();
var languageS = $("#loggedin-user1").text();

/*SUPPORT UI CHANGES FOR CENTER ALIGNMENT*/
var offsetWidth = $("nav").width() - $("#main-menu-list > li:visible").size() * $("#main-menu-list > li").width() 
var centerMainMenu  = (offsetWidth/3) + "px";
$("#main-menu-list").css("margin-left",centerMainMenu);
$("ul#dropdown").css("width","180px");

$(document).ready(function() { 
	$( "ul#dropdown li:first-child a" ).addClass('activeSearch');
	$('ul#dropdown li a').click(function(){
			$('ul#dropdown li a').removeClass('activeSearch');
			$(this).addClass('activeSearch');
	});
});
</script>
<%@page import="com.gensuite.ecommerce.util.Constants" session="true"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<link rel="stylesheet" type="text/less" href="../css/theme.css?version=${properties['application.version']}">
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

<!-- Javascript Library-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- SUPPORT-MIL-188-200116 -->
<script type="text/javascript">
    
    var isExternalLink = "${properties['is.mydocuments.external.link']}";
    </script>
<!-- SUPPORT-MIL-188-200116 -->
</head>
<body>
<jsp:include page="googleAnalyticsbody.jsp" />

	<style>
.machine-image img {
	width: 100px;
}

.download img {
	margin-right: 10px;
}

.mediaDocPagination {
	border-top: 2px solid #eee;
	padding-top: 10px;
	margin-top: 15px;
}

.noTopBdr {
	border-top: none;
}

.leftSpace20 {
	margin-left: 20px;
}

.active_page {
	background: darkblue;
	color: white !important;
}
</style>
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>

			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list hidden-xsx responsive-padding fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.document.home"></spring:message></a></li>
					<li class="active"><spring:message
							code="label.header.document" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<div class="row nopadding" id="internalDocumentsDiv">
				<div class="btn hidden-md hidden-lg" id="btn_folder">
					<i class="fa fa-folder" aria-hidden="true"></i>
				</div>
				
					<div
						class="col-lg-3 col-md-3 col-xs-11 document_toggle column-paddings responsive-padding" id="document_folder">
						<h3>
							<spring:message code="label.header.document" />
						</h3>
						<div class="tabs">
							<!--<div id="capacity">Capacity</div> not required 
                <div id="eone">eone</div> -->
						</div>
						<div id="treeMediaDocuments" class="treeview-hldr tabNavigation"
							style="overflow: auto;"></div>
						<!--  <ul id="tree" class="treeview-hldr"></ul>-->
					</div>

					<div
						class="col-lg-9 col-md-9 col-sm-12 col-xs-12 column-paddings responsive-padding">

						<div style="border-bottom: 1px solid #eee">
							<h3 class="inline">&nbsp;</h3>
							<strong class="leftSpace30" id="documentSize"><label></label></strong>
							<strong class="leftSpace30"><spring:message
									code="whereused.results" /> </strong> <input type='hidden'
								id="hdnResultVal" value="" />
						</div>
						<div
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings hidden">

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">

							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 nopadding">
								<div class="nopadding hidden-xs pull-right">
									<label><spring:message code="search.resultsperpage" /></label>
									<select id="result-per-page"
										onchange="javascript:getDropDownVal(this.value, 'hdnResultVal')">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
									</select>
								</div>
								<div class="nopadding visible-xs">
									<label><spring:message code="search.resultsperpage" /></label>
									<select id="result-per-page"
										onchange="javascript:getDropDownVal(this.value, 'hdnResultVal')">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
									</select>
								</div>
							</div>
						</div>


						<!-- Content area for pdf part-->
						<div
							class="result-container text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 responsive-padding"
							id="documentContent"></div>
					</div>
				</div>

				<!--     <div class="row">
         
           <div class="col-md-12 text-center" id="mediaDocPagination">
                <ul class="pagination"></ul>
           </div>
        </div> -->
				<!-- 			<div id='page_navigation'></div>  -->
				<input type="hidden" id="userId"
					value="<sec:authentication property='principal.id'></sec:authentication>">
				<input type="hidden" id="authToken"
					value="<sec:authentication property='principal.authToken'></sec:authentication>">
				<input type="hidden" id="hdnmsg"
					value="<spring:message code="document.folder"></spring:message>">

				<input type='hidden' id='current_page' /> <input type='hidden'
					id='show_per_page' />
				<!-- SUPPORT-MIL-188-200116 -->
				<div class="row nopadding" id="externalDocumentsDiv">
					<iframe id="external-docs-frame"
						src="${properties['document.iframe.url']}" width="100%"
						height="620px"></iframe>
				</div>
				<!-- SUPPORT-MIL-188-200116 -->
			</div>
			<!-- footer container -->
			<footer>
				<%@ include file="footer.jsp"%>

			</footer>
		</form>
	</div>

	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="message.register.loading" />
			</h4>
			<div class="loader"></div>
		</div>
	</div>
	<%
    	
     	int jpg = Constants.MEDIA_FILE_TYPE_JPG;
    	int swf = Constants.MEDIA_FILE_TYPE_SWF;
    	int pdf = Constants.MEDIA_FILE_TYPE_PDF;
    	int excel = Constants.MEDIA_FILE_TYPE_EXCEL;
    	int doc = Constants.MEDIA_FILE_TYPE_DOC;
    	int audio = Constants.MEDIA_FILE_TYPE_AUDIO;
    	int video = Constants.MEDIA_FILE_TYPE_VIDEO; 
    	
    	%>

</body>
<!-- Javascript Plugins -->
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
	type="text/javascript" defer></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
	defer type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
	defer type="text/javascript"></script>
<script
	src="../js/jstree.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="../js/errorHandler.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/custom-documents.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>

<script id="documentTemplate" type="text/x-jquery-tmpl">
        <div id="${'${'}organizationId}" class="document-info col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">

			<div class="firstArticle">
				{{if mediaFileType == 1}}
				<a href="#" class="download pull-left nopadding" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">
					<img src="../images/File-Pictures-icon.png"></a>
				{{/if}}
				{{if mediaFileType == 3}}
				<a href="#" class="download pull-left nopadding" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">
					<img src="../images/pdf.png"></a>
				{{/if}}
				{{if mediaFileType == 6}}
				<a href="#" class="download pull-left nopadding" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">
					<img src="../images/excel.png"></a>
				{{/if}}
				{{if mediaFileType == 7}}
				<a href="#" class="download pull-left nopadding" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">
					<img src="../images/word.png"></a>
				{{/if}}
				{{if mediaFileType == 8}}
				<a href="#" class="download pull-left nopadding" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">
					<img src="../images/File-Audio-icon.png"></a>
				{{/if}}
				{{if mediaFileType == 9}}
				<a href="#" class="download pull-left nopadding" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">
					<img src="../images/File-Video-icon.png"></a>
				{{/if}}
				{{if mediaFileType == 0}}
				<a href="#" class="download pull-left" onclick="docClick">
					<img class="docClick" src="../images/folder-icon-small.png"></a>
                    <div class="media-desc pull-left">
						<h3 class="text-left"><a href="#" class="docClick">${'${'}text}</a></h3>
						<p class="text-left">${'${'}description} &nbsp;</p>
                    </div>
  				{{else}} 
                    <div class="media-desc pull-left"> 
						<h3 class="text-left"><a href="#" onclick="javascript:downloadMedia('${properties['docserver.url']}','${'${'}mediaId}')">${'${'}text}</a></h3>
						<p class="text-left">${'${'}description} &nbsp;</p>
                    </div>
  				{{/if}}  

			</div>         
		</div>
    </script>
<script>
    /*SUPPORT MIL - 188 210116*/
    	$(document).ready(function(){
    		//$("#main-menu-list > li:nth-child(5)").addClass("active");
    		//$("#new-main-menu-list > li:nth-child(4)").addClass("active");
    		$("#new-main-menu-list li a[href*='documents']").parent().addClass("active");
    	});
    </script>
</html>
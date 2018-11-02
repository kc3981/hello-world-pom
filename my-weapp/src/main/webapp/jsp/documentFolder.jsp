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
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
	rel="stylesheet" type='text/css'>

<link rel="stylesheet"
	href="../css/owl.carousel.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/TreeStyle.css?version=${properties['application.version']}" />
<link rel="stylesheet"
	href="../css/layouts.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/styles.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/layouts.responsive.css?version=${properties['application.version']}">
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

<link rel="stylesheet" href="../css/default/tree-style.min.css?version=${properties['application.version']}" />
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">

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
	src="../js/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/jstree.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/less.min.js?version=${properties['application.version']}"></script>

</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<form method="post">
		<div id="header-wrapper">
			<!-- header includes -->
			<%@ include file="header.jsp"%>
		</div>
		<div class="content-wrapper">
			<div id="current-path">
				<ul class="breadcrumb">
					<li><a href="#"><spring:message code="label.footer.home" /></a></li>
					<li><a href="#"><spring:message
								code="label.header.document" /></a></li>
				</ul>
			</div>

			<div class="container col-lg-12 col-md-12 col-sm-12 col-xs-12">


				<section class="left-section">
					<div class="col-lg-3 ">
						<h2>
							<spring:message code="label.header.document" />
						</h2>
						<div id="documentTreeContainer"></div>
					</div>
				</section>

			</div>
		</div>

		<div id="footer">
			<!-- Header includes -->
			<%@ include file="footer.jsp"%>
		</div>

		<!-- Templates -->

		<!-- Javascript Plugins -->
		<script
			src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
			type="text/javascript"></script>
		<script
			src="../js/jquery-ui.min.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script
			src="../js/owl.carousel.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script
			src="../js/jsonTree.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script
			src="../js/jquery.nicescroll.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script
			src="../js/jquery.bootpag.min.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script
			src="../js/bootstrap.min.js?version=${properties['application.version']}"
			type="text/javascript"></script>
		<script>
       var itemPerPage = 4;
         $(document).ready(function(){
//         	 var searchflag = '${searchflag}';
//         	 var searchItem ='${searchItem}';
//         	 alert(searchflag+searchItem);
//           $("#top-navbar-1 li:nth-child(2)").addClass("active");
//           $.ajax({  
//              type : "Get",
//              contentType: 'application/json',
//              mimeType: 'application/json',
//          //    url : "getcategoryhierarchy",
//              success : function(response) {  
//               console.log(response);
//               if(!(searchflag === "")){
//             	  $("div.serch-result-container").html('');
//             	  if(searchflag === "part"){
//             	  	getBasicItemDetails(searchItem);
//             	  }else if(searchflag === "productcatalog"){
// 					  var prodcatstring = searchItem.split(",");
// 					  prodcatstring[1] = prodcatstring[1].replace(new RegExp('<b>', 'g'), '');
// 					  prodcatstring[1] = prodcatstring[1].replace(new RegExp('</b>', 'g'), '');
					  
// 					  getCategoryPart(prodcatstring[0] +','+'undefined'+','+prodcatstring[0]+','+prodcatstring[1], 1);
// 					  getCategoryPart(prodcatstring[0] +','+'undefined'+','+prodcatstring[0], 1);

// 	             }else if(searchflag === "category"){
// 	            	 var categorystring = searchItem.split(",");
// 	            	 categorystring[1] = categorystring[1].replace(new RegExp('<b>', 'g'), '');
// 	            	 categorystring[1] = categorystring[1].replace(new RegExp('</b>', 'g'), '');
// 					  getCategoryPart(categorystring[2] +','+categorystring[3]+','+categorystring[0]+','+categorystring[1], 1);
// 					  getCategoryPart(categorystring[2] +','+categorystring[3]+','+categorystring[0], 1);
// 	             }
//               }
//               else{
//             	  $("div.serch-result-container").html('');
//                   $("#productCatalogTemplate").tmpl(response.catalogDetails).appendTo("div.serch-result-container");
//               }
//               $('#simpleTreeContainer').jsonTree(response.catalogDetails, {
//                   mandatorySelect: true,
//                   selectedIdElementName: 'simpleTreeContainer',
//                   selectedproductCatalogId: '5'
//               });
//              },  
//              error : function(e) {  
//               alert('Error: ' + e);   
//              }  
//             });
          
          
          
//           if ($('#treeShopforParts.treeview-hldr')[0]) {
        	  
        	  
//           }
  			
         
          
          if ($('#documentTreeContainer')[0]) {
   			$.ajax({
   				type : "Get",
   				contentType : 'application/json',
   				mimeType : 'application/json',
   				dataType : 'json',
   				url : "getdocumenthierarchy",
   				success : function(response) {
//    					alert(JSON.stringify(response));
   					 $('#documentTreeContainer').jstree({
   						 "expand_selected_onload":false,
   						  "core" : {
   							  "data" : response,
   							  "multiple" : false,
   							  "expand_selected_onload":false,
   							  "themes" : {
   								  "variant" : "large",
   								  "dots"    :  true,
   								  "stripes"   : true,
   								  "responsive":true,
   							  			}
   						  	},
   						 });
   				},error:function(e) {
   					//alert("error")
   					}
   				});
           };
          
            $('button#simpleTreeBtn').click(function () {
                alert("selected item: " + $('#simpleTreeContainer').val());
            });
         });
         
      </script>
	</form>
</body>
<html>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="../css/dataTables.responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
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
        <script src="../https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="../https://oss.maxcdn.com/libs/respond.javascripts/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Favicon and touch icons -->
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script src="../js/jquery.min.js" type="text/javascript"></script>
<sec:authorize access="hasRole('ROLE_RETAIL_CUSTOMER')"
	var="retailPermission"></sec:authorize>
<style type="text/css">
header {
	background-color: #ffffff;
}

.main-menu {
	background-color: #24418a;
}

footer {
	border-top: 3px solid #24418a;
}

.main-menu nav ul li {
	border-left: 1px solid #8c2232;
	border-right: 1px solid #c52033;
}

.header-links a, .header-links span {
	color: #24418a;
}
</style>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<form method="post">
			<header>
				<!-- header includes -->
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="invoice.label.home" /></a></li>
					<%-- <li><a href="gethistoricalorders_breadCrum?customerReference=${getOrderDetailsres.customerReference}&selectedOrganization=${getOrderDetailsres.organizationId}&selectedOrgName=${getOrderDetailsres.organizationName}&fromDate=${getOrderDetailsres.fDate}&toDate=${getOrderDetailsres.tDate}&cusName=${getOrderDetailsres.customerName}&chooseBrand=${chooseBrand}"><spring:message code="label.header.order"/></a></li>
                 <li ><a href="getorders"><spring:message code="invoice.label.myorders"/></a></li>  --%>
					<!-- Start: Added by: Harish Bakale, GPD-60, Reviewed By: Rajesh C-->
					<c:if
						test="${not empty invoiceVO.invoiceList[0].invoiceGrandTotal}">
						<c:choose>
							<c:when test="${invoiceVO.invoiceList[0].invoiceGrandTotal ge 0}">
								<li class="active"><spring:message
										code="invoice.label.invoice" /> # ${invoiceVO.invoiceNumber}</li>
							</c:when>
							<c:otherwise>
								<li class="active"><spring:message
										code="credit.order.pdf.header" /> #
									${invoiceVO.invoiceNumber}</li>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${empty invoiceVO.invoiceList[0].invoiceGrandTotal}">
						<li class="active"><spring:message
								code="invoice.label.invoice" /> # ${invoiceVO.invoiceNumber}</li>
					</c:if>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper">
				<c:if test="${not empty invoiceVO.invoiceList[0].invoiceGrandTotal}">
					<c:choose>
						<c:when test="${invoiceVO.invoiceList[0].invoiceGrandTotal ge 0}">
							<h3>
								<spring:message code="invoice.label.invoice" />
								# ${invoiceVO.invoiceNumber}
							</h3>
						</c:when>
						<c:otherwise>
							<h3>
								<spring:message code="credit.order.pdf.header" />
								# ${invoiceVO.invoiceNumber}
							</h3>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${empty invoiceVO.invoiceList[0].invoiceGrandTotal}">
					<h3>
						<spring:message code="invoice.label.invoice" />
						# ${invoiceVO.invoiceNumber}
					</h3>
				</c:if>
				<!-- End: Added by: Harish Bakale, GPD-60, Reviewed By: Rajesh C-->
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">

					<section class="section">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<p>
								<label><spring:message code="invoice.label.bill.to" />
									:</label>
								<c:if test="${not empty invoiceVO.billToAddressReference}">
									<c:if test="${not empty invoiceVO.billToAddressName}">
										<!-- 03-07-2017: hiding bill to reference for retail user. Added by Pooja -->
										<span class="inline"><c:if
												test="${retailPermission != true}">
			                  				${invoiceVO.billToAddressReference} - 
									</c:if>${invoiceVO.billToAddressName}</span>
									</c:if>
								</c:if>
							</p>
							<p>
								<c:if test="${not empty invoiceVO.billToAddressName}">
	                  				${invoiceVO.billToAddressName}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.billToAddressLine1}">
	                  				${invoiceVO.billToAddressLine1}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.billToAddressLine2}">
	                  				${invoiceVO.billToAddressLine2}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.billToAddressLine3}">
	                  				${invoiceVO.billToAddressLine3}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.billToAddressLine4}">
	                  				${invoiceVO.billToAddressLine4}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.billToAddressCity}">
	                  				${invoiceVO.billToAddressCity}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.billToAddressState}">
	                  				${invoiceVO.billToAddressState}&nbsp; 
							</c:if>
								<c:if test="${not empty invoiceVO.billToAddressZipCode}">
	                  				${invoiceVO.billToAddressZipCode}
							</c:if>
								<c:if test="${not empty invoiceVO.billToAddressCountry}">
	                  				,&nbsp;${invoiceVO.billToAddressCountry}<br />
								</c:if>
							</p>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<p>
								<label><spring:message code="invoice.label.ship.to" />
									:</label>
								<c:if test="${not empty invoiceVO.shipToAddressReference}">
									<c:if test="${not empty invoiceVO.shipToAddressName}">
										<!-- 03-07-2017: hiding ship to reference for retail user. Added by Pooja -->
										<span class="inline"><c:if
												test="${retailPermission != true}">
			                  				${invoiceVO.shipToAddressReference} - 
									</c:if>${invoiceVO.shipToAddressName}</span>
									</c:if>
								</c:if>
							</p>
							<p>
								<c:if test="${not empty invoiceVO.shipToAddressName}">
	                  				${invoiceVO.shipToAddressName}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressLine1}">
	                  				${invoiceVO.shipToAddressLine1}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressLine2}">
	                  				${invoiceVO.shipToAddressLine2}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressLine3}">
	                  				${invoiceVO.shipToAddressLine3}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressLine4}">
	                  				${invoiceVO.shipToAddressLine4}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressCity}">
	                  				${invoiceVO.shipToAddressCity}<br />
								</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressState}">
	                  				${invoiceVO.shipToAddressState}&nbsp; 
							</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressZipCode}">
	                  				${invoiceVO.shipToAddressZipCode}
							</c:if>
								<c:if test="${not empty invoiceVO.shipToAddressCountry}">
	                  				,&nbsp;${invoiceVO.shipToAddressCountry}<br />
								</c:if>
							</p>
						</div>
						<div class="clearfix"></div>
					</section>

					<section class="section">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<label class="nopadding"><spring:message
											code="invoice.label.invoice" /> # : </label>
								</div>
								<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<div class="pull-left">
										<p class="inline nopadding">${invoiceVO.invoiceNumber}</p>
										<%--  <a href="../#"><spring:message code="invoice.label.shipment"/></a> --%>
									</div>
								</div>
								<div class="clearfix"></div>

								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<label class="nopadding"><spring:message
											code="invoice.label.invoice.date" /> : </label>
								</div>
								<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<!--  GPD-1890 Changes by Pujith. Reviewed by Krupa-->
									<c:if test="${not empty invoiceVO.invoiceList[0].invoiceDate}">
										<p class="nopadding">
											<fmt:formatDate pattern="${dateformat}"
												value="${invoiceVO.invoiceList[0].invoiceDate}" />
										</p>
									</c:if>
									<c:if test="${empty invoiceVO.invoiceList[0].invoiceDate}">
				                  			-
									</c:if>
								</div>
								<div class="clearfix"></div>

								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<label class="nopadding"><label class="nopadding"><spring:message
												code="invoice.label.due.date" /> : </label>
								</div>
								<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<c:if test="${not empty invoiceVO.invoiceList[0].dueDate}">
										<p class="nopadding">
											<fmt:formatDate pattern="${dateformat}"
												value="${invoiceVO.invoiceList[0].dueDate}" />
										</p>
									</c:if>
									<c:if test="${empty invoiceVO.invoiceList[0].dueDate}">
				                  				-
										</c:if>
								</div>
								<div class="clearfix"></div>

								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<label class="nopadding"><spring:message
											code="invoice.label.terms" /> : </label>
								</div>
								<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
									<p class="nopadding">
										<c:if test="${not empty invoiceVO.carrierBillingOption}">
				                  				${invoiceVO.carrierBillingOption}
										</c:if>
										<c:if test="${empty invoiceVO.carrierBillingOption}">
				                  				-
										</c:if>
									</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<label class="nopadding"><spring:message
										code="invoice.label.order" /> # : </label>
							</div>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<p class="nopadding">${invoiceVO.orderNumber}</p>
							</div>
							<%-- <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings"><p class="nopadding"><a href="vieworder?childCartId=${invoiceVO.orderNumber}">${invoiceVO.orderNumber}</a></p></div> --%>
							<div class="clearfix"></div>

							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<label class="nopadding"><spring:message
										code="invoice.label.invoice.total" /> : </label>
							</div>
							<!-- <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings"><p class="nopadding" id="invoice_total"></p></div> -->
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<p class="nopadding">
									<c:if
										test="${not empty invoiceVO.invoiceList[0].invoiceGrandTotalStr}">
				                  				${invoiceVO.invoiceList[0].invoiceGrandTotalStr}  ${invoiceVO.currencyCode}
										</c:if>
									<c:if
										test="${empty invoiceVO.invoiceList[0].invoiceGrandTotalStr}">
				                  				-
										</c:if>
								</p>
							</div>
							<div class="clearfix"></div>

							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<label class="nopadding"><spring:message
										code="invoice.label.po" /> # : </label>
							</div>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<p class="nopadding">${invoiceVO.customerPO}</p>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<label class="nopadding"><spring:message
										code="view.label.sales.code" /> : </label>
							</div>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<p class="nopadding">
									<c:if test="${not empty invoiceVO.paymentType}">
				                  				${invoiceVO.paymentType}
										</c:if>
									<c:if test="${empty invoiceVO.paymentType}">
				                  				-
										</c:if>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</section>

					<section>


						<div class="mtop10">
							<div
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings table-border">
								<table id="invoice-list" class="table table-striped table-hover" cellspacing="0"
									width="100%" style="margin-bottom: 0">
									<thead>
										<tr class="tableHead">
											<th width="20%"><spring:message
													code="invoice.label.item" /> #</th>
											<th width="20%"><spring:message
													code="invoice.label.description" /></th>
											<th width="20%"><spring:message
													code="invoice.label.qty.uom" /></th>
											<th width="20%"><spring:message
													code="invoice.label.price" /></th>
											<th width="20%" class="nowrap"><spring:message
													code="invoice.label.extended.price" /></th>
										</tr>
									</thead>
									<tbody id="cart-items-hldr">
										<!--  invoiceCartItemTemplate body goes here -->
									</tbody>
								</table>
							</div>
						</div>


						<c:if
							test="${not empty invoiceVO.invoiceList[0].invoiceGrandTotal}">
							<c:choose>
								<c:when
									test="${invoiceVO.invoiceList[0].invoiceGrandTotal ge 0}">
									<a href="exportInvoiceAsPDF" class="blue-button"
										id="edit-order"><spring:message
											code="invoice.button..download" /></a>
								</c:when>
								<c:otherwise>
									<a href="exportInvoiceAsPDF" class="blue-button"
										id="edit-order"><spring:message
											code="creditmemo.button.download" /></a>
								</c:otherwise>
							</c:choose>
						</c:if>

					</section>
				</div>
			</div>
			<!-- footer container -->
			<footer>
				<!-- Header includes -->
				<%@ include file="../../jsp/footer.jsp"%>
			</footer>
		</form>
	</div>
	<script id="invoiceCartItemTemplate" type="text/x-jquery-tmpl">
						
	  </script>
	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
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
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
</body>

<script type="text/javascript">
        $(document).ready(function(e){
     		var json = ${invoiceCartItemVOList};
     		var dataConstruction="";
    		console.log("json"+json);
           	//To set the data for cartItemList and cart-items-hldr
    	    $("#cart-items-hldr").html('');
           	for(var i=0;i<Object.keys(json.itemList).length;i++){
           		$("#invoiceCartItemTemplate").tmpl(json.itemList[i]).appendTo("#cart-items-hldr");
				if(json.itemList[i].itemExistForOrg){
					dataConstruction = '<tr>'+'<td><a target="_blank" href="hopgetfullitemdetailsView?partNumber='+encodeURIComponent(json.itemList[i].itemNumber)+'&itemCategory='+json.itemList[i].description1+'&organizationId='+json.itemList[i].organizationId+'">'+json.itemList[i].itemNumber+'</a></td>'
				} else {
					dataConstruction = '<tr>'+' <td>' +json.itemList[i].itemNumber+ '</td>'
				}
				dataConstruction += '<td style="word-wrap: break-word">' +json.itemList[i].description1 + '</td>'
				+ '<td align="center">'+ json.itemList[i].itemQty + ' / ' + json.itemList[i].itemUnitOfMeasure + '</td>' 
				+ '<td align="left">' + json.itemList[i].itemUnitPriceStr + " " + json.itemList[i].currencyCode + '</td>'
				+ '<td align="left">' + json.itemList[i].itemUnitPriceTotal + " " + json.itemList[i].currencyCode + '</td>'+'</tr>'
				$("#cart-items-hldr").append(dataConstruction);           		
           	}
          //Added by Krupa for Breadcrumbs Issue 
          var orderListBc =null;
          var isFromInvoiceList = false;
          isFromInvoiceList =${isFromInvoiceList};
          if(isFromInvoiceList!=null && isFromInvoiceList!=false && isFromInvoiceList!=undefined){
        		 orderListBc = '${orderListBreadcrumbs}';
        	  if(null !=orderListBc || orderListBc != '' ){
        		  $(".breadcrumb > li:last-child()").prev().remove();
    	          var stringSplit = orderListBc.toString().split(",");
    	          var previouspagebreadcrumb = "";
    	          for(i=0;i<stringSplit.length;i++){
    	           console.log(stringSplit[i]);
    	           if(stringSplit[i].indexOf('_') > 0){
    	           		var name = stringSplit[i].substring(0,stringSplit[i].indexOf("_"));
    	           		var hrefLink = stringSplit[i].substring(stringSplit[i].indexOf("_")+1,stringSplit[i].length)
    	           		if(hrefLink.indexOf('getinvoicelist')==0){
	    	           		var oldURL = document.referrer;
	 	    	       		if(oldURL!="" || oldURL!=null){
	 	    	       			var ordersLinkString =oldURL.split("web/");
	 	    	       			hrefLink = ordersLinkString[ordersLinkString.length - 1];
	 	    	       		}
    	           		}
    	           		$(".breadcrumb > li:last-child()").before('<li><a href="'+hrefLink+'">'+name+'</a></li>'); 
    	           }else{
    	        	   $(".breadcrumb > li:last-child()").addClass("active");
    	           }
    	          }
    		}
          }else{
           	 orderListBc = '${orderListBreadcrumbs}';
    		if(orderListBc!='' && orderListBc!=null){
    			$(".breadcrumb > li:last-child()").before('<li><a href="'+orderListBc+'"><spring:message code="invoice.label.myorders"/></a></li>');
    		}
	        var oldURL = document.referrer;
    		if(oldURL!="" || oldURL!=null){
    			var ordersLinkString =oldURL.split("web/");
    			var ordersLink = ordersLinkString[ordersLinkString.length - 1];
    			$(".breadcrumb > li:last-child()").before('<li><a href="'+ordersLink+'"><spring:message code="shipment.label.order.no"/>${invoiceVO.orderNumber}</a></li>');
    		}
          }
    		//End of added for Breadcrumbs issue
      	 }); 

       
        //END OF SCRIPT */
        
    </script>
</html>
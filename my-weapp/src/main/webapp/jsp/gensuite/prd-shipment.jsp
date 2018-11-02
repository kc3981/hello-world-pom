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
	href="../https://fonts.googleapis.com/css?family=Open+Sans:400italic,400"
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
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
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
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<sec:authorize access="hasRole('ROLE_RETAIL_CUSTOMER')" var="retailPermission"></sec:authorize>
<script src="../js/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/less.min.js?version=${properties['application.version']}"></script>

<style>
.table {
	background-color: transparent;
	border: none !important;
	border-top: 0 !important;
}

.tableHead, .table th {
	/* background: #FFF !important; */
	border-top: 0 !important;
	text-transform: capitalize !important;
}

.odd {
	background-color: #F9F9F9 !important;
}

.even {
	background-color: #fff !important;
}

.tr:hover {
	background: #f2f2f2 !important;
}
</style>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper ">
		<form method="post">
			<header>
				<!-- header includes -->
				<%@ include file="../../jsp/header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message code="label.home" /></a></li>
					<%--   <li><a href="getorders"><spring:message code="shipment.label.my.order"/></a></li> <!--  Fix for GS-527 --> --%>
					<%--  <li><a href="vieworder?childCartId=${shipmentVO.childCartId}"><spring:message code="shipment.label.order.no"/>${shipmentVO.orderNumber}</a></li> --%>
					<li class="active"><spring:message
							code="shipment.label.shipment.no" />${shipmentVO.shipmentNumber}</li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper quoteview ">
				<!-- 3rd section box starts here -->
				<div class="spaceTop20">
					<h3 class="col-lg-11 col-md-11">
						<spring:message code="shipment.label.shipment.no" />
						${shipmentVO.shipmentNumber}
					</h3>
					<div
						class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings section">
						<div class="col-lg-4 col-md-4 address-holder">

							<p>
								<label><spring:message code="shipment.label.ship.to" />:</label>
                        <!-- 03-07-2017: hiding ship to reference for retail user. Added by Pooja -->
                        <span class="inline"><c:if test="${retailPermission != true}">
			                  				${shipmentVO.shipToAddressReference} - 
									</c:if>${shipmentVO.shipToAddressName}</span>
							</p>
							<p>
								<c:if test="${not empty shipmentVO.shipToAddressName}">
	                  				${shipmentVO.shipToAddressName}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressLine1}">
	                  				${shipmentVO.shipToAddressLine1}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressLine2}">
	                  				${shipmentVO.shipToAddressLine2}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressLine3}">
	                  				${shipmentVO.shipToAddressLine3}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressLine4}">
	                  				${shipmentVO.shipToAddressLine4}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressCity}">
	                  				${shipmentVO.shipToAddressCity}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressState}">
	                  				${shipmentVO.shipToAddressState}&nbsp; 
							</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressZipCode}">
	                  				${shipmentVO.shipToAddressZipCode}
							</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressCountry}">
	                  				,&nbsp;${shipmentVO.shipToAddressCountry}<br />
								</c:if>
							</p>
							<!-- </div> -->
						</div>

						<div
							class="col-sm-6 col-md-4 col-lg-4 contact-eldorado-ks quoteDetail">
							<p>
								<label><spring:message code="shipment.label.order.no" />:
								</label> <span>${shipmentVO.orderNumber}</span>
							</p>

							<p>
								<label><spring:message
										code="shipment.label.shipment.method" />:</label> <span> <c:if
										test="${not empty shipmentVO.carrierCodeDescription}">
	                  				${shipmentVO.carrierCodeDescription}
							</c:if> <c:if test="${empty shipmentVO.carrierCodeDescription}">
	                  				-
							</c:if>
								</span>
							</p>

							<p>
								<label><spring:message code="shipment.label.tracking.no" />:</label>
								<!-- Changes for CR : Displaying tracking number as hyperlink. if tracking URL is null then text will be displayed
							Changes made by Kameshwari Popuri Reviewed by Jayakumar M-->
								<c:choose>
									<c:when
										test="${not empty shipmentVO.shipmentList[0].trackingURL}">
										<c:if
											test="${not empty shipmentVO.shipmentList[0].trackingNumber}">
											<a href="${shipmentVO.shipmentList[0].trackingURL}"
												target="_blank">${shipmentVO.shipmentList[0].trackingNumber}</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if
											test="${not empty shipmentVO.shipmentList[0].trackingNumber}">
										${shipmentVO.shipmentList[0].trackingNumber}
									</c:if>
									</c:otherwise>
								</c:choose>
							</p>

							<p>
								<label><spring:message code="shipment.label.status" />:</label>
								<span>  <c:if test="${not empty shipmentVO.shipmentList[0].statusName}">
		                  				${shipmentVO.shipmentList[0].statusName}
								</c:if>
								<c:if test="${empty shipmentVO.shipmentList[0].statusName}">
		                  				-
								</c:if> 
								</span>
							</p>
							<p>
								<label><spring:message code="shipment.label.warehouse" />:</label>
								<span> <c:if
										test="${not empty shipmentVO.shipmentList[0].warehouse}">
		                  				${shipmentVO.shipmentList[0].warehouse}
								</c:if> <c:if test="${empty shipmentVO.shipmentList[0].warehouse}">
		                  				-
								</c:if>
								</span>
							</p>
						</div>

						<div
							class="col-sm-6 col-md-4 col-lg-4 contact-eldorado-ks quoteDetail">
							<p>
								<label><spring:message code="shipment.label.shipment.no" />:</label>
								<span>${shipmentVO.shipmentNumber}</span>
							</p>

							<p>
								<label><spring:message code="shipment.label.ship.date" />:</label>
								<c:if test="${empty shipmentVO.shipmentList[0].shipDate}">
									<span>-</span>
								</c:if>
								<c:if test="${not empty shipmentVO.shipmentList[0].shipDate}">
									<span><fmt:formatDate pattern="${dateformat}"
											value="${shipmentVO.shipmentList[0].shipDate}" /></span>
								</c:if>
							</p>

							<p>
								<label><spring:message code="shipment.label.ship.weight" />:</label>
								<c:if test="${empty shipmentVO.shipmentList[0].shipWeight}">
									<c:if
										test="${empty shipmentVO.shipmentList[0].itemList[0].weightUOM}">
		                  			-
								</c:if>
								</c:if>
								<c:if test="${not empty shipmentVO.shipmentList[0].shipWeight}">

									<span>${shipmentVO.shipmentList[0].shipWeight} <c:if
											test="${not empty shipmentVO.shipmentList[0].itemList[0].weightUOM}">
											${shipmentVO.shipmentList[0].itemList[0].weightUOM}
											</c:if>
									</span>

								</c:if>
							</p>

							<%-- <p>
                           <label><spring:message code="shipment.label.invoice"/>:</label> 
                           <c:if test="${empty shipmentVO.invoiceId}">
		                  			<c:if test="${empty shipmentVO.invoiceReference}">
		                  				-
									</c:if>	
							</c:if>
							 <c:if test="${not empty shipmentVO.invoiceId}">
		                  			<c:if test="${not empty shipmentVO.invoiceReference}">
		                  					<span><a href="getinvoice?invoiceId=${shipmentVO.invoiceId}">${shipmentVO.invoiceReference}</a></span>
									</c:if>	
							</c:if>
                        </p> --%>
						</div>

					</div>
				</div>

				<div class="mtop10">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings table-border">
						<table id="shipment-list" class="table table-striped table-hover" cellspacing="0"
							width="100%" style="margin-bottom: 0">
							<thead>
								<tr class="tableHead">
									<th width="15%" class="text-center"><span><spring:message
												code="shipment.label.item.no" /></span>
									</td>
									<th width="25%" class="text-center"><span><spring:message
												code="shipment.label.tem.description" /></span>
									</td>
									<th width="15%" class="text-center nowrap"><span><spring:message
												code="shipment.label.order.quantity" /></span>
									</td>
									<th width="15%" class="text-center"><span><spring:message
												code="shipment.label.ship.quantity" /></span>
									</td>
									<th width="15%" class="text-center"><span><spring:message
												code="shipment.label.price" /></span>
									</td>
									<th width="15%" class="text-center nowrap"><span><spring:message
												code="shipment.label.extended.price" /></span>
									</td>
								</tr>
							</thead>
							<tbody id="cart-items-hldr">
								<!--  shipmentCartItemTemplate body goes here -->
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
					<%--  <a href="vieworder?childCartId=${shipmentVO.childCartId}" class="green-button prev"><spring:message code="shipment.button.back"/></a> --%>
				</div>

			</div>



			<!-- footer container -->
			<footer>
				<!-- Header includes -->
				<%@ include file="../../jsp/footer.jsp"%>
			</footer>
		</form>
	</div>
	<script id="shipmentCartItemTemplate" type="text/x-jquery-tmpl">
						<tr>
            	<td class="text-center"><a target="_blank" href="hopgetfullitemdetailsView?partNumber=encodeURIComponent(${'${'}itemNumber})&itemCategory=${'${'}description1}&organizationId=${'${'}organizationId}">${'${'}itemNumber}</a></td>
							<td class="text-center">${'${'}description1}</td>
							<td class="text-center">${'${'}itemOrderedQty}</td>
							<td class="text-center">${'${'}itemQty}</td>
							<td class="text-center">${'${'}itemUnitPriceStr + " " + currencyCode}</td>
							<td class="text-center">${'${'}itemUnitPriceTotal + " " + currencyCode}</td>
						</tr>
	  </script>
	<!-- Javascript Plugins -->
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"
		defer type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/jquery.dataTables.min.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script src="../js/dataTables.bootstrap.js?version=${properties['application.version']}" defer type="text/javascript"></script>
	<script
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		defer type="text/javascript"></script>
	<script type="text/javascript">
     	$(document).ready(function(e){
     		var json = ${shipmentCartItemVOList};
    		console.log("json"+json);
           	//To set the data for cartItemList and cart-items-hldr
    	    $("#cart-items-hldr").html('');
    	    for(var i=0;i<Object.keys(json.itemList).length;i++){
    	    	//13-07-2017:NREV-1124: User leads to unexpected error page, on clicking on a line item in the shipment page. Added by Pooja
           		//$("#shipmentCartItemTemplate").tmpl(json.itemList[i]).appendTo("#cart-items-hldr");
           		if(json.itemList[i].itemExistForOrg){
					dataConstruction = '<tr>'+'<td class="text-center"><a target="_blank" href="hopgetfullitemdetailsView?partNumber='+json.itemList[i].itemNumber+'&itemCategory='+encodeURIComponent(json.itemList[i].description1)+'&organizationId='+json.itemList[i].organizationId+'">'+json.itemList[i].itemNumber+'</a></td>'
				} else {
					dataConstruction = '<tr>'+' <td class="text-center">' +json.itemList[i].itemNumber+ '</td>'
				}
				dataConstruction += '<td>' +json.itemList[i].description1 + '</td>'
				+ '<td class="text-center">'+ json.itemList[i].itemOrderedQty + ' </td>' //2017-10-4 Added by Rajesh to fix NREV-1495
				+ '<td class="text-center">'+ json.itemList[i].itemQty + ' </td>'
				+ '<td class="text-center">' + json.itemList[i].itemUnitPriceStr + " " + json.itemList[i].currencyCode + '</td>'
				+ '<td class="text-center">' + json.itemList[i].itemUnitPriceTotal + " " + json.itemList[i].currencyCode + '</td>'+'</tr>'
				$("#cart-items-hldr").append(dataConstruction); 
           	}
    	    
    	 	//Added by Krupa for Breadcrumbs Issue 
    		var orderListBc = '${orderListBreadcrumbs}';
    		if(orderListBc!="" || orderListBc!=null){
    			$(".breadcrumb > li:last-child()").before('<li><a href="'+orderListBc+'"><spring:message code="invoice.label.myorders"/></a></li>');
    		}
	        var oldURL = document.referrer;
    		if(oldURL!="" || oldURL!=null){
    			var ordersLinkString =oldURL.split("web/");
    			var ordersLink = ordersLinkString[ordersLinkString.length - 1];
    			$(".breadcrumb > li:last-child()").before('<li><a href="'+ordersLink+'"><spring:message code="shipment.label.order.no"/>${shipmentVO.orderNumber}</a></li>')
    		}
    		//End of added for Breadcrumbs issue
    		
      	 }); //END OF SCRIPT */
      	</script>
</body>
</html>
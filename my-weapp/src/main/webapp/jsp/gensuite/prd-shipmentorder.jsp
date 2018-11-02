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
<!-- JIRA ID REV-475 -->
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
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>

<!-- link used for BU theme ended -->
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
<!--  <link rel="shortcut icon" href="../images/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->
<link rel="stylesheet" type="text/css" href="../css/page-styles.css">
<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<style>
.table {
	background-color: transparent;
	border: none !important;
	border-top: 0 !important;
}

.tableHead, .table th {
	background: #FFF !important;
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
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper quoteview ">
				<!--- This is for Breadcrumbs -->
				<div class="breadcrumbs-list hidden-xs">
					<ul class="breadcrumb">
						<li><a href="homepage"><spring:message code="label.home" /></a></li>
						<li><a href="getorders"><spring:message
									code="shipment.label.my.order" /></a></li>
						<!--  Fix for GS-527 -->
						<li><a href="vieworder?childCartId=${shipmentVO.childCartId}"><spring:message
									code="shipment.label.order.no" />${shipmentVO.orderNumber}</a></li>
						<li class="active"><spring:message
								code="shipment.label.shipment.no" />${shipmentVO.shipmentReference}</li>
					</ul>
				</div>
				<!-- 3rd section box starts here -->
				<div class="spaceTop20">
					<h3 class="col-lg-11 col-md-11">
						<spring:message code="shipment.label.shipment.no" />
						${shipmentVO.shipmentReference}
					</h3>
					<div
						class="form-inline col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings section">
						<div class="col-lg-4 col-md-4 address-holder">
							<!-- <div class="address-holder">
                        <h5 class="inline"><spring:message code="shipment.label.ship.to"/>:</h5>
                        <p class="inline">${shipmentVO.shipToAddressVO.addressReference} - ${shipmentVO.shipToAddressVO.addressName}</p>
                       <div class="clearfix"></div> -->
							<p>
								<label><spring:message code="shipment.label.ship.to" />:</label>
								<span class="inline">${shipmentVO.shipToAddressVO.addressReference}
									- ${shipmentVO.shipToAddressVO.addressName}</span>
							</p>
							<p>
								<c:if test="${not empty shipmentVO.shipToAddressVO.addressName}">
	                  				${shipmentVO.shipToAddressVO.addressName}<br />
								</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressLine1}">
	                  				${shipmentVO.shipToAddressVO.addressLine1}<br />
								</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressLine2}">
	                  				${shipmentVO.shipToAddressVO.addressLine2}<br />
								</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressLine3}">
	                  				${shipmentVO.shipToAddressVO.addressLine3}<br />
								</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressLine4}">
	                  				${shipmentVO.shipToAddressVO.addressLine4}<br />
								</c:if>
								<c:if test="${not empty shipmentVO.shipToAddressVO.addressCity}">
	                  				${shipmentVO.shipToAddressVO.addressCity}<br />
								</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressState}">
	                  				${shipmentVO.shipToAddressVO.addressState}&nbsp; 
							</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressZipCode}">
	                  				${shipmentVO.shipToAddressVO.addressZipCode}
							</c:if>
								<c:if
									test="${not empty shipmentVO.shipToAddressVO.addressCountry}">
	                  				,&nbsp;${shipmentVO.shipToAddressVO.addressCountry}<br />
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
										test="${not empty shipmentVO.carrierDescription}">
	                  				${shipmentVO.carrierDescription}
							</c:if> <c:if test="${empty shipmentVO.carrierDescription}">
	                  				-
							</c:if>
								</span>
							</p>

							<p>
								<label><spring:message code="shipment.label.tracking.no" />:</label>
								<c:if test="${empty shipmentVO.carrierTrackingURL}">
									<c:if test="${empty shipmentVO.trackingReference}">
										<span>-</span>
									</c:if>
								</c:if>
								<c:if test="${not empty shipmentVO.carrierTrackingURL}">
									<%-- <c:if test="${not empty shipmentVO.trackingReference}">
		                  				<span><a href="${shipmentVO.carrierTrackingURL}" target="_blank" id="shipment-tracker">${shipmentVO.trackingReference}</a></span> <!--  fix for LEV-45 & LEV-46 -->
								</c:if> --%>
									<!-- REV - 763 -->
									<c:if test="${not empty shipmentVO.trackingReference}">
										<c:if test="${shipmentVO.carrierTrackingURL != '#'}">
											<span><a href="${shipmentVO.carrierTrackingURL}"
												target="_blank">${shipmentVO.trackingReference}</a></span>
											<!--  fix for LEV-45 & LEV-46 -->
										</c:if>
										<c:if test="${shipmentVO.carrierTrackingURL == '#'}">
											<span><a>${shipmentVO.trackingReference}</a></span>
											<!--  fix for LEV-45 & LEV-46 -->
										</c:if>
									</c:if>
									<!-- REV - 763 -->
								</c:if>
							</p>

							<p>
								<label><spring:message code="shipment.label.status" />:</label>
								<span> <c:if test="${not empty shipmentVO.statusName}">
		                  				${shipmentVO.statusName}
								</c:if> <c:if test="${empty shipmentVO.statusName}">
		                  				-
								</c:if>
								</span>
							</p>
							<p>
								<label><spring:message code="shipment.label.warehouse" />:</label>
								<span> <c:if
										test="${not empty shipmentVO.plantReference}">
		                  				${shipmentVO.plantReference}
								</c:if> <c:if test="${empty shipmentVO.plantReference}">
		                  				-
								</c:if>
								</span>
							</p>
						</div>

						<div
							class="col-sm-6 col-md-4 col-lg-4 contact-eldorado-ks quoteDetail">
							<p>
								<label><spring:message code="shipment.label.shipment.no" />:</label>
								<span>${shipmentVO.shipmentReference}</span>
							</p>

							<p>
								<label><spring:message code="shipment.label.ship.date" />:</label>
								<c:if test="${empty shipmentVO.shipmentDate}">
									<span>-</span>
								</c:if>
								<c:if test="${not empty shipmentVO.shipmentDate}">
									<span><fmt:formatDate pattern="${dateformat}"
											value="${shipmentVO.shipmentDate}" /></span>
								</c:if>
							</p>

							<p>
								<label><spring:message code="shipment.label.ship.weight" />:</label>
								<c:if test="${empty shipmentVO.shipmentWeight}">
									<c:if test="${empty shipmentVO.shipmentWeightUOM}">
		                  			-
								</c:if>
								</c:if>
								<c:if test="${not empty shipmentVO.shipmentWeight}">
									<c:if test="${not empty shipmentVO.shipmentWeightUOM}">
										<span>${shipmentVO.shipmentWeight}
											${shipmentVO.shipmentWeightUOM}</span>
									</c:if>
								</c:if>
							</p>

							<p>
								<label><spring:message code="shipment.label.invoice" />:</label>
								<c:if
									test="${(empty shipmentVO.invoiceReference) || (shipmentVO.invoiceReference == '')}">
	                  				-
								</c:if>
								<c:if test="${not empty shipmentVO.invoiceId}">
									<c:if
										test="${(not empty shipmentVO.invoiceReference) && (shipmentVO.invoiceReference != '')}">
										<span><a
											href="getinvoice?invoiceId=${shipmentVO.invoiceId}">${shipmentVO.invoiceReference}</a></span>
									</c:if>
								</c:if>
							</p>
						</div>

					</div>
				</div>

				<div class="mtop10">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings table-border">
						<table class="table table-striped table-hover">
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
					<a href="vieworder?childCartId=${shipmentVO.childCartId}"
						class="green-button prev"><spring:message
							code="shipment.button.back" /></a>
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
            	<td class="text-center"><a  href="javascript:void(0);"	onClick="getFullItemDetails('${'${'}partId}', '${'${'}partDescription}', '${'${'}organizationId}')">${'${'}partNumber}</a></td>
							<td class="text-center">${'${'}partDescription}</td>
							<td class="text-center">${'${'}quantity}</td>
							<td class="text-center">${'${'}quantityShipped}</td>
							<td class="text-center">${'${'}formatAmountWithDecimal(${locale}, currencyCode, price)}</td>
							<td class="text-center">${'${'}formatAmountWithDecimal(${locale}, currencyCode, extendedPrice)}</td>
						</tr>
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
		src="../js/gensuite-ui.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script
		src="../js/custom.scripts.js?version=${properties['application.version']}"
		type="text/javascript"></script>
	<script type="text/javascript">
     	$(document).ready(function(e){
     		var json = ${shipmentCartItemVOList};
    		console.log("json"+json);
           	//To set the data for cartItemList and cart-items-hldr
    	    $("#cart-items-hldr").html('');
    	    $("#shipmentCartItemTemplate").tmpl(json).appendTo("#cart-items-hldr");
    	    
      	 }); //END OF SCRIPT */
      	</script>

	<script type="text/javascript">
      	function getFullItemDetails(partId,catagoryItem,orgId) {
      		window.location.href = "getfullitemdetails?itemId="+partId+"&itemCategory="+escape(catagoryItem)+"&organizationId="+orgId;
      	}
		
      	</script>
</body>
</html>
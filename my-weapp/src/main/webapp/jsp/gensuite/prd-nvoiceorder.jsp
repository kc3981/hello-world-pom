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
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
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
<!-- <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/apple-touch-icon-57-precomposed.png"> -->

<!-- Javascript Library-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}"></script>
</head>
<body>
	<jsp:include page="../googleAnalyticsbody.jsp" />
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper">
		<header>
			<!-- header includes -->
			<%@ include file="../../jsp/header.jsp"%>
		</header>

		<!-- content wrapper for the current page contents -->
		<div class="container-fluid content-wrapper">
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list responsive-padding">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="invoice.label.home" /></a></li>
					<li><a href="getorders"><spring:message
								code="invoice.label.myorders" /></a></li>
					<li><a href="vieworder?childCartId=${invoiceVO.childCartId}"><spring:message
								code="invoice.label.order" /> # ${invoiceVO.orderNumber}</a></li>
					<li class="active"><spring:message
							code="invoice.label.invoice" /> # ${invoiceVO.invoiceReference}</li>
				</ul>
			</div>

			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings responsive-padding">
				<h3>
					<spring:message code="invoice.label.invoice" />
					# ${invoiceVO.invoiceReference}
				</h3>
				<section class="section">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<p>
							<label><spring:message code="invoice.label.bill.to" /> :</label>
							<c:if
								test="${not empty invoiceVO.billToAddressVO.addressReference}">
								<c:if test="${not empty invoiceVO.billToAddressVO.addressName}">
									<span class="inline">${invoiceVO.billToAddressVO.addressReference}
										- ${invoiceVO.billToAddressVO.addressName}</span>
								</c:if>
							</c:if>
						</p>
						<p>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressName}">
	                  				${invoiceVO.billToAddressVO.addressName}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressLine1}">
	                  				${invoiceVO.billToAddressVO.addressLine1}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressLine2}">
	                  				${invoiceVO.billToAddressVO.addressLine2}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressLine3}">
	                  				${invoiceVO.billToAddressVO.addressLine3}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressLine4}">
	                  				${invoiceVO.billToAddressVO.addressLine4}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressCity}">
	                  				${invoiceVO.billToAddressVO.addressCity}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.billToAddressVO.addressState}">
	                  				${invoiceVO.billToAddressVO.addressState}&nbsp; 
							</c:if>
							<c:if
								test="${not empty invoiceVO.billToAddressVO.addressZipCode}">
	                  				${invoiceVO.billToAddressVO.addressZipCode}
							</c:if>
							<c:if
								test="${not empty invoiceVO.billToAddressVO.addressCountry}">
	                  				,&nbsp;${invoiceVO.billToAddressVO.addressCountry}<br />
							</c:if>
						</p>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<p>
							<label><spring:message code="invoice.label.ship.to" /> :</label>
							<c:if
								test="${not empty invoiceVO.shipToAddressVO.addressReference}">
								<c:if test="${not empty invoiceVO.shipToAddressVO.addressName}">
									<span class="inline">${invoiceVO.shipToAddressVO.addressReference}
										- ${invoiceVO.shipToAddressVO.addressName}</span>
								</c:if>
							</c:if>
						</p>
						<p>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressName}">
	                  				${invoiceVO.shipToAddressVO.addressName}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressLine1}">
	                  				${invoiceVO.shipToAddressVO.addressLine1}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressLine2}">
	                  				${invoiceVO.shipToAddressVO.addressLine2}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressLine3}">
	                  				${invoiceVO.shipToAddressVO.addressLine3}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressLine4}">
	                  				${invoiceVO.shipToAddressVO.addressLine4}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressCity}">
	                  				${invoiceVO.shipToAddressVO.addressCity}<br />
							</c:if>
							<c:if test="${not empty invoiceVO.shipToAddressVO.addressState}">
	                  				${invoiceVO.shipToAddressVO.addressState}&nbsp; 
							</c:if>
							<c:if
								test="${not empty invoiceVO.shipToAddressVO.addressZipCode}">
	                  				${invoiceVO.shipToAddressVO.addressZipCode}
							</c:if>
							<c:if
								test="${not empty invoiceVO.shipToAddressVO.addressCountry}">
	                  				,&nbsp;${invoiceVO.shipToAddressVO.addressCountry}<br />
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
									<p class="inline nopadding">${invoiceVO.invoiceReference}</p>
									<%--  <a href="../#"><spring:message code="invoice.label.shipment"/></a> --%>
								</div>
							</div>
							<div class="clearfix"></div>

							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<label class="nopadding"><spring:message
										code="invoice.label.invoice.date" /> : </label>
							</div>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<c:if test="${not empty invoiceVO.invoiceDate}">
									<p class="nopadding">
										<fmt:formatDate pattern="${dateformat}"
											value="${invoiceVO.invoiceDate}" />
									</p>
								</c:if>
								<c:if test="${empty invoiceVO.invoiceDate}">
				                  			-
									</c:if>
							</div>
							<div class="clearfix"></div>

							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<label class="nopadding"><label class="nopadding"><spring:message
											code="invoice.label.due.date" /> : </label>
							</div>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
								<c:if test="${not empty invoiceVO.dueDate}">
									<p class="nopadding">
										<fmt:formatDate pattern="${dateformat}"
											value="${invoiceVO.dueDate}" />
									</p>
								</c:if>
								<c:if test="${empty invoiceVO.dueDate}">
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
									<c:if test="${not empty invoiceVO.paymentTerms}">
				                  				${invoiceVO.paymentTerms}
										</c:if>
									<c:if test="${empty invoiceVO.paymentTerms}">
				                  				-
										</c:if>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column-paddings">
						<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<label class="nopadding"><spring:message
									code="invoice.label.order" /> # : </label>
						</div>
						<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<p class="nopadding">
								<a href="vieworder?childCartId=${invoiceVO.childCartId}">${invoiceVO.orderNumber}</a>
							</p>
						</div>
						<div class="clearfix"></div>

						<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<label class="nopadding"><spring:message
									code="invoice.label.invoice.total" /> : </label>
						</div>
						<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<p class="nopadding" id="invoice_total"></p>
						</div>
						<div class="clearfix"></div>

						<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<label class="nopadding"><spring:message
									code="invoice.label.po" /> # : </label>
						</div>
						<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<p class="nopadding">
								<c:if test="${not empty invoiceVO.purchaseOrderNumber}">
				                  				${invoiceVO.purchaseOrderNumber}
										</c:if>
								<c:if test="${empty invoiceVO.purchaseOrderNumber}">
				                  				-
										</c:if>
							</p>
						</div>
						<div class="clearfix"></div>

						<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<label class="nopadding"><spring:message
									code="invoice.label.shipment" /> # : </label>
						</div>
						<div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 column-paddings">
							<p class="nopadding">
								<a href="getshipment?shipmentId=${invoiceVO.shipmentId}">${invoiceVO.shipmentReference}</a>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</section>

				<section>
					<%-- <div class="table-border" style="margin-top:20px">
                            <table id="invoice_1" class="table display table-striped" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th><spring:message code="invoice.label.amount"/></th>
                                    </tr>
                                </thead>
                            </table>
                        </div> --%>

					<div class="table-border" style="margin-top: 20px">
						<table id="invoice_2"
							class="table display table-striped table-hover" cellspacing="0"
							width="100%">
							<thead>
								<tr>
									<th width="20%"><spring:message code="invoice.label.item" />
										#</th>
									<th width="20%"><spring:message
											code="invoice.label.description" /></th>
									<th width="20%"><spring:message
											code="invoice.label.qty.uom" /></th>
									<th width="20%"><spring:message code="invoice.label.price" /></th>
									<th width="20%" class="nowrap"><spring:message
											code="invoice.label.extended.price" /></th>
								</tr>
							</thead>
							<tbody id="cart-items-hldr">
								<!--  invoiceCartItemTemplate body goes here -->
							</tbody>
						</table>
					</div>

					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column-paddings">
						<a href="exportInvoiceAsPDF?invoiceId=${invoiceVO.invoiceId}"
							class="grey-button next faded"><spring:message
								code="invoice.button..download" /></a>
					</div>

				</section>
			</div>
		</div>
		<!-- footer container -->
		<footer>
			<!-- Header includes -->
			<%@ include file="../../jsp/footer.jsp"%>
		</footer>
	</div>
	<script id="invoiceCartItemTemplate" type="text/x-jquery-tmpl">
						<tr>
            		  		<td><a  href="javascript:void(0);"	onClick="getFullItemDetails('${'${'}itemId}', '${'${'}itemDescription}', '${'${'}organizationId}')">${'${'}itemNumber}</a></td>

							<td>${'${'}itemDescription}</td>
							<td align="center">${'${'}quantityShipped} ${'${'}uom}</td>  
							<td align="left">${'${'}formatAmountWithDecimal(${locale}, currencyCode, price)}</td>
							<td align="left">${'${'}formatAmountWithDecimal(${locale}, currencyCode, extendedPrice)}</td>
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
    		console.log(json);
           	//To set the data for cartItemList and cart-items-hldr
    	    $("#cart-items-hldr").html('');
    	    $("#invoiceCartItemTemplate").tmpl(json).appendTo("#cart-items-hldr");
      	 }); 

        $(function () {
        	var locale = ${locale};
        	var currencyCode = '${invoiceVO.currencyCode}';
			var totalAmount = ${invoiceVO.totalAmount};
        	var invoice_amount = formatAmountWithDecimal(locale, currencyCode, totalAmount);
        	//alert(invoice_amount);
        	$('#invoice_total').html(invoice_amount);
        });
        
      	function getFullItemDetails(itemId,itemDescription,organizationId) {
      		window.location.href = "getfullitemdetails?itemId="+itemId+"&itemCategory="+escape(itemDescription)+"&organizationId="+organizationId;
      	}

        //END OF SCRIPT */
        
    </script>
</html>
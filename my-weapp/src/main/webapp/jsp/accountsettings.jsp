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

<link rel="stylesheet" href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css?version=${properties['application.version']}">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/intlTelInput.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/theme.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css" href="../css/searchComponent.css?version=${properties['application.version']}">

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

<script src="../js/jquery.min.js?version=${properties['application.version']}"></script>
<script src="../js/less.min.js?version=${properties['application.version']}"></script>
<!-- Javascript Plugins -->
<script src="../js/jquery-ui.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/intlTelInput.min.js?version=${properties['application.version']}"></script>
<script src="../js/bootstrap.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/gensuite-ui.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/addCard.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/angular.min.js?version=${properties['application.version']}" type="text/javascript"></script>
<script src="../js/dealer.sctipts.js"type="text/javascript"></script>

<style>
.intl-tel-input {
	display: inline-block;
	/* width: 570px; */
	width: 100%;
}
/* .intl-tel-input .flag-dropdown{
		position: relative;
		left: 5px;
		top:15px;
	} */
.intl-tel-input .flag-dropdown {
	padding: 1px 10px;
}

.intl-tel-input .country-list {
	top: 34px !important;
	left: 11px;
	max-width: 400px;
}

input#user-phone {
	padding: 5px 10px 5px 44px;
}

.modal {
	text-align: center;
	padding: 0 !important;
}

.intl-tel-input .country-list {
	top: 34px !important;
	left: 11px;
	max-width: 400px;
	font-size:14px;
}

input#user-phone {
	padding: 5px 10px 5px 44px;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
.userProfileInput {
	min-width: 30px !important;
}
.ui-input-wt-help {
	width: 91%;
	float: left;
}

.ui-no-border {
	border: none;
}
</style>


</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>  
	<!-- Main Wrapper having header,footer and content -->
	<!-- INC-1282, SUPPORT GLOBAL SEARCH ,ADDED BY MEERAVALI -->
	<div class="main-wrapper myacc" >
		<form method="post" id="myaccount-form" name="formCtrl" ng-app="formValidation" ng-controller="formController">
			<!-- header container having logo and navigation -->
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!--- This is for Breadcrumbs -->
			<div class="breadcrumbs-list fixed ">
				<ul class="breadcrumb">
					<li><a href="homepage"><spring:message
								code="label.footer.home" /></a></li>
					<li class="active"><spring:message code="label.header.account" /></li>
				</ul>
			</div>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper quoteview ">
				<h3 class="page-subhead">
					<spring:message code="label.header.account" />
				</h3>

				<!-- 3rd section box starts here -->
				<div class="row myaccount">


					<div class="col-xs-12 col-sm-12 col-md-12 padd-none spaceTop20">
						<ul class="tabs-menu profile-tabs nav nav-pills nav-justified">
							<li class=""><a data-toggle="tab"
								href="#account-settings-container" id="general-setting-id">
									<i class="fa fa-unlock-alt"></i> <spring:message
										code="label.myaccount.accountsettings" />
							</a></li>
							<li class=""><a data-toggle="tab"
								href="#profile-settigs-container" id="profile-setting-id"> <i
									class="fa fa-user"></i> <spring:message
										code="label.myaccount.profilesettings" /></a></li>
							<li class=""><a data-toggle="tab"
								href="#change-password-container" id="general-setting-id"> <i
									class="fa fa-key"></i> <spring:message
										code="label.myaccount.changepassword" />
							</a></li>
							
							<sec:authorize access="hasRole('ROLE_ADD_CARD')">
								<li class=""><a data-toggle="tab" href="#add-credit-card"
									id="add-card-id"> <i class="fa fa-credit-card"></i> <spring:message
											code="label.myaccount.manageCard" />
								</a></li>
							</sec:authorize>
						</ul>
						<div id="tabs-container"
							class="col-lg-12 col-md-12 col-sm-12 nopadding">
							<div class="tab">
								<c:choose>
									<c:when test="${isRetailUser}">
										<%@ include file="retailShopperCustomerDetails.jsp"%>
									</c:when>
									<c:otherwise>
										<div id="profile-settigs-container"
											class="tab-content profile-data">
											<div id="tabs"
												class="profile-custom-tabs nav nav-pills nav-justified profileSubMenu column-paddings">
												<div
													class="col-sm-6 col-md-6 col-lg-6 account-details-padding" id="divisionOrgDropDown">
													<label><spring:message
															code="label.myaccount.selectdivision" /> </label> <select
														class="form-control orgSection" id="organization-dropdown">
														<c:forEach
															items="${profileDetailsVO.organizationDetailList}"
															var="organization" varStatus="status">
															<option value="${organization.organizationId}"
																id="${organization.organizationId}">${organization.organizationName}
															</option>

														</c:forEach>
													</select>
												</div>
												<div
													class="col-sm-6 col-md-6 col-lg-6 profileBox account-details-padding" id="customerDealerField">
													<label id="preferredCustomer"><spring:message
															code="label.myaccount.preferredcustomer"/></label> <input
														id="tags" type="text"
														class="customerNoInput col-sm-11 col-md-11 col-lg-10 customer-dropdown"
														style="margin-bottom: 5px;">
													<div class="col-lg-1 rev-profile-icon">

														<input type="hidden" id="customerPreferredValue"
															class="form-control" /> <a class="help-button" id="questionMark"
															data-placement="bottom" data-toggle="tooltip"
															href="javascript:;"
															data-original-title="<spring:message code="label.order.customer.message" />">?</a>
													</div>
												</div>
												<div class="clearfix spaceTop20 "></div>
												<div id="tabs-<c:out value="${status.count}"/>"
													class="billShipDetails">
													<div
														class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pull-left bill-ship">
														<div
															class="col-xs-12 col-sm-6 col-md-6 col-lg-6 btn-group billto" id="billToAddressDealerCustomer">
															<label class="alignLeft "><spring:message
																	code="label.myaccount.defaultbillingaddress" /> </label> <select
																name="billingAddress" id="billingAddress"
																class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-control billToList">
															</select>
															<p class=" addressBox spaceTop20 BillToDetails"></p>
															<input type="hidden"
																value="${organization.organizationId}"
																class="organizationId" /> <input type="hidden"
																class="customerVal" id="customerVal" /> <input
																type="hidden" class="shiptoVal" />
														</div>
														<div
															class="col-xs-12 col-sm-6 col-md-6 col-lg-6 btn-group shipto">
															<label class="alignLeft"><spring:message
																	code="label.myaccount.defaultshippingaddress" /> </label> <select
																name="shippingAddress" id="shippingAddress"
																class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-control shipToList">
															</select>
															<p class="addressBox2 spaceTop20 ShipToDetails"></p>
														</div>
													</div>
													<div
														class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pull-left column-paddings">
														<div
															class="col-xs-12 col-sm-6 col-md-6 col-lg-6 btn-group">
															<label class="alignLeft"><spring:message
																	code="label.myaccount.defaultlanguage" /> </label> <select
																name="language" id="languageList"
																class="form-control selectBtn language">
																<c:forEach var="item"
																	items="${sessionScope['scopedTarget.genericUserProperties'].allLanguages}">
																	<option value="${item.key}"
																		${item.key == sessionScope['scopedTarget.genericUserProperties'].languageId ? 'selected' : ''}>${item.value}</option>
																</c:forEach>
															</select>
														</div>
														<!-- SUPPORT-MIL-223-170216 -->

														<div
															class="col-xs-12 col-sm-6 col-md-6 col-lg-6 btn-group"
															id="salesAreaDiv">

															<label class="alignLeft"><spring:message
																	code="label.sales.area.default" /> </label>

															<div class="col-xs-12 nopadding">
																<input class="form-control" type="text"
																	style="width: 90%;" readOnly name="salesArea"
																	id="salesArea"> <input class="form-control"
																	type="hidden" id="salesAreaId">

																<sec:authorize
																	access="hasRole('ROLE_CHANGE_SALES_AREA')">
																	<button type="button" id="open" class="btn btn-success"
																		data-toggle="modal" data-target="#demo-1">
																		<span class="glyphicon glyphicon-pencil"
																			aria-hidden="true"></span>
																	</button>

																</sec:authorize>
															</div>
														</div>

													</div>
													<div class="col-sm-6 col-md-6 col-lg-6"></div>
													<sec:authorize access="!hasRole('ROLE_DEALER_USER')">
													<div
														class="save-info col-lg-12 col-md-12 col-sm-12 col-xs-12 save-profile" id=saveButtonForDealerUser>
														<p style="color: #006400;" class="profile-update">
															${saveResult}</p>
														<p class="validation-message" style="visibility: hidden"></p>
														<a class="save-button profile-save not-active"
															id="profile-save" href="javascript:void(0);"><span
															class="glyphicon glyphicon-floppy-save"></span>
														<spring:message code="label.mymachines.save" /></a>
													</div>
													</sec:authorize>
													<sec:authorize access="hasRole('ROLE_DEALER_USER')">
													<div
														class="save_info_dealer_user col-lg-12 col-md-12 col-sm-12 col-xs-12 save-profile" id=saveButtonForDealerUser>
														<p style="color: #006400;" class="profile-update">
															${saveResult}</p>
														<p class="validation-message" style="visibility: hidden"></p>
														<a class="save-button profile-save not-active "
															id="profile-save" href="javascript:void(0);"><span
															class="glyphicon glyphicon-floppy-save"></span>
														<spring:message code="label.mymachines.save" /></a>
													</div>
													</sec:authorize>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
								<div id="change-password-container" class="tab-content">
									<div class="form-group">
										<label for="old-password"><spring:message
												code="label.myaccount.oldpassword" /></label> <input
											id="old-password" name="oldPassword" class="form-control"
											type="password" required="" value="" data-valid="invalid"
											name="password">
									</div>
									<div class="form-group">
										<label for="new-password"><spring:message
												code="label.myaccount.newpassword" /></label> <input
											id="new-password" class="user-password form-control"
											type="password" required="" value="" data-valid="invalid"
											name="newPassword"> <small><spring:message
												code="label.myaccount.passwordMessage" /></small>
									</div>
									<div class="form-group">
										<label for="confirm_password"><spring:message
												code="label.myaccount.confirmpassword" /></label> <input
											id="confirm_password" type="password" class="form-control"
											required="" value="" data-valid="invalid"
											name="confirmPassword">
									</div>
									<div class="save-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div>
											<p class="update-success">${passwordChangeResult}</p>
										</div>
										<div>
											<p class="validation-message" style="visibility: hidden"></p>
										</div>
										<a class="save-button not-active" href="javascript:void(0);"
											id="user-profile-details1"><span
											class="glyphicon glyphicon-floppy-save"></span>
										<spring:message code="label.mymachines.save" /></a>
									</div>
								</div>
								<!-- 								 Added For Adding the card -->
								<div id="add-credit-card" class="tab-content">
									<div class="col-sm-6 col-md-6 col-lg-6 account-details-padding">
										<label><spring:message
												code="label.myaccount.selectdivision" /> </label> <select
											class="form-control orgSection1" id="cardDivision">
											<!--  Added for Manage Card : Hari Shankar -->
											<c:forEach items="${profileDetailsVO.organizationDetailList}" var="organization" varStatus="status">
												<option value="${organization.organizationId}" id="${organization.organizationId}">
													${organization.organizationName}
												</option>
											</c:forEach>
											<!--  Added for Manage Card : Hari Shankar -->
										</select>
									</div>

									<div
										class="col-sm-6 col-md-6 col-lg-6 profileBox account-details-padding">
										<label><spring:message
												code="label.myaccount.preferredcustomer" /></label> <input
											id="tags1" type="text"
											class="customerNoInput1 col-sm-11 col-md-11 col-lg-11"
											style="margin-bottom: 5px; border: 1px solid #999; padding: 4px 10px; min-width: 300px !important;">
										<input type="hidden" class="customerVal1" />
										<div class="col-lg-1">
											<a class="help-button" data-placement="bottom"
												data-toggle="tooltip" href="javascript:;"
												data-original-title="<spring:message code="label.order.customer.message" />">?</a>
										</div>
									</div>
									<div class="col-lg-12">

										<div class="col-lg-12 padrt">
											<button type="button" id="Checkout_btn"
												class="btn btn-buynow cart-small pull-right">
												<spring:message code="label.myaccount.addCard" />
											</button>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

											<div class="cardHold">
												<table id="cardTable" class="table table-hover">
													<thead>
														<th><spring:message code="label.myaccount.cardNumber" />
														</th>
														<th><spring:message code="label.myaccount.currency" />
														</th>
														<th><spring:message
																code="label.myaccount.cardReference" /></th>
												</thead>

											</table>
										</div>
									</div>
								</div>
							</div>
							<div style="">
								<div id="account-settings-container"
									class="tab-pane tab-content active">
									<form name="account-settings-form" id="account-settings-form"
										action="#">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<label class="acct-label" for="first-name" name="first-name"><spring:message
													code="label.myaccount.FirstName" /></label> <br>
											<div class="row">
												<input id="first-name" type="text" required=""
													value="<c:out value='${userProfileDetails.firstName}'/>"
													name="firstName" disabled
													class="disable col-xs-10 col-sm-8 form-control">
											</div>
											<br> <label class="acct-label" for="last-name"
												name="last-name"><spring:message
													code="label.myaccount.LastName" /></label> <br>
											<div class="row">
												<input id="last-name" type="text" required=""
													value="<c:out value='${userProfileDetails.lastName}'/>"
													name="lastName" disabled
													class="disable col-xs-10 col-sm-8 form-control">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<label class="acct-label" for="user-email" name="email"><spring:message
													code="label.myaccount.emailAddress" /></label> <br>
											<div class="row">
												<input id="user-email" type="email" required=""
													value="<c:out value='${userProfileDetails.email_register}'/>"
													name="email_register" disabled
													class="disable col-xs-10 col-sm-8 form-control">
											</div>
											<br> <label class="acct-label" for="user-phone"><spring:message
													code="label.myaccount.myphone" /></label> <br>
											<div class="row">
												<input id="user-phone" name="phone" type="text"
													data-number="" required=""
													class="col-xs-10 col-sm-8 form-control"
													value="<c:out value='${userProfileDetails.phone_register}'/>"
													name="phone_register" required>&nbsp;
												<!-- <a class="help-button" href="javascript:;"
												data-toggle="tooltip" data-placement="left"
												title="Phone number should be of 10 numericals.">?</a> -->
											</div>

											<input type="hidden" id="countryCode" name="countryFlag" />
										</div>
										<!-- INC-2391 starts(Developed by : Swetha) -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<label class="acct-label" for="user-name" name="user-name"><spring:message
													code="label.myaccount.userName" /></label> <br>
											<div class="row">
												<input id="user_name" type="text" required=""
													value="<c:out value='${userProfileDetails.user_name}'/>"
													name="userName" disabled
													class="disable col-xs-10 col-sm-8 form-control">
											</div>
											<br> 
										</div>
										<!-- INC-2391 ends -->

											<div class="row rev-custom-row">
												<c:if test="${properties['enable.optin.feature']}">

													<div class="col-xs-1" >
														<c:if test="${userProfileDetails.optIn}">
											<input id="opt-in" name="optin" type="checkbox"
												class="userProfileInput" checked required=""
												value="<c:out value='${userProfileDetails.optIn}'/>">
										</c:if>
										<c:if test="${!userProfileDetails.optIn}">
											<input id="opt-in" name="optin" type="checkbox"
												class="userProfileInput" required=""
												value="<c:out value='${userProfileDetails.optIn}'/>">
										</c:if>


													</div>
													<div class="col-xs-10" >
														<span style="float: left;"><spring:message
																code="label.optin.message"></spring:message></span>
													</div>
												</c:if>
											</div>

								<div class="save-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div>
										<p class="update-success">${updateResult}</p>
									</div>
									<div>
										<p class="validation-message" style="visibility: hidden"></p>
									</div>

											<a id="user-profile-details" class="save-button not-active"
												href="javascript:void(0);"><span
												class="glyphicon glyphicon-floppy-save"></span>
											<spring:message code="label.mymachines.save" /></a>
										</div>
									</form>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!------    Search Component           ----->
			<!-- SUPPORT-MIL-223-170216 -->
			<div class="modal modal-quotes fade" id="demo-1" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title caps" id="myModalLabel">
						<strong><spring:message code="label.sales.area" /></strong>
					</h4>
				</div>
				<div class="modal-body confirm-modal-body">
					<div class="row">
						<div class="col-sm-5">
							<label
								class="control-label col-lg-3 col-md-3 col-sm-4 col-xs-12 required"><spring:message
									code="label.sales.area.by" /></label>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
								<select name="carrier" id="searchType" class="form-control">
									<!-- Removed Hard code values for sales area POP UP: By Hari-->
									<option value="0" selected disabled><spring:message
											code="label.sales.area.search.column.select" /></option>
									<option value="1"><spring:message
											code="label.sales.area.search.column.orgref" /></option>
									<option value="2"><spring:message
											code="label.sales.area.search.column.distribution" /></option>
									<option value="3"><spring:message
											code="label.sales.area.search.column.desciption" /></option>
								</select>
							</div>
						</div>
						<div class="col-sm-5">
							<label
								class="control-label col-lg-3 col-md-3 col-sm-4 col-xs-12 required"><spring:message
									code="label.sales.area.value" /></label>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="searchText" class="form-control">
							</div>
						</div>
						<div class="col-sm-2">
							<button class="btn btn-default" id="searchAddress">
								<spring:message code="label.sales.area.search" />
							</button>
						</div>
						<div class="col-sm-12 text-center emptyText">
							<p></p>
						</div>

					</div>
					<div class="row">
						<div class="preload-icon" style="display: none;"></div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="quotes-table"
								class="table table-striped table-bordered"
								style="display: none;">
								<tr>
									<th><spring:message code="label.sales.area" /></th>
									<th><spring:message
											code="label.sales.area.search.column.orgref" /></th>
									<th><spring:message
											code="label.sales.area.search.column.orgname" /></th>
									<th><spring:message
											code="label.sales.area.search.column.distribution" /></th>
									<th><spring:message
											code="label.sales.area.search.column.desciption" /></th>
								</tr>

									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- Showing currency popup -->
			<div class="modal bs-example-modal-md" id="currencyModal" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content custom-modal-content">
						<div class="modal-header custom-modal-header">
							<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
							<h4 class="modal-title custom-modal-title">
								<spring:message code="label.bulkpartupload.information" />
							</h4>
						</div>
						<div class="modal-body custom-modal-body">
							<!-- Content for the dialog / modal goes here. -->
						</div>

					</div>
				</div>
			</div>

			<!-- footer container -->
			<footer>
				<!-- Header includes -->
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
		</form>
	</div>
	<script> <!-- Added from Mil -->
		var fromAccountSetting = true;
	</script>
	<script src="../js/hideOrShowFields.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script src="../js/searchComponent.js?version=${properties['application.version']}" type="text/javascript"></script>
	<form id='frmCheckOut' name='frmCheckOut' action="#" method='post'>
		<input type='hidden' id="merchant-id" name='AID' value="" /> <input
			type='hidden' id="merchant-pass" name='PWD' value="" /> <input
			type='hidden' id="merchant-name" name='Name' value="" /> <input
			type='hidden' id="merchant-add" name='Address' value="" /> <input
			type='hidden' id="merchant-email" name='Email' value="" /> <input
			type='hidden' id="merchant-amount" name='Amount' value="0.00" /> <input
			type='hidden' id="merchant-curr" name='Currency' value="" /> <input
			type='hidden' name='TestMode' value="N" /> <input type='hidden'
			name='TransactionType' value='16'> <input type='hidden'
			name='Tokenize' value='true'> <input type='hidden'
			id="isguestuser" name='IsGuestUser' value="" /> <input type='hidden'
			id="AppKey" name='AppKey' value="" />

		<!--<input type='hidden' name='Callback' value="http://shoppingcart.com/transactstatus.aspx" /><br/>-->
		<input type='hidden' name='Callback'
			value='${properties["focus.createCard.callback"]}' />
		<input type='hidden' id="branding" name='Branding' value="" />
	</form>

	<form action="addcard" method="POST" id="addcardform" hidden=true>
		<input type="hidden" name="customerId" id="addcard-customerId" /> <input
			type="hidden" name="customerReference" id="addcard-customerReference" />
		<input type="hidden" name="organizationId" id="addcard-organizationId" />
		<input type="hidden" name="message" id="addcard-message" />
	</form>
	<script>
	// RRG-retailshopper form validation
	
	var formValidation = angular.module('formValidation', []);
	formValidation.controller('formController', ['$scope', function($scope){
		 $scope.customerName =""; // * Please fill Customer Name
		$scope.billToAddressName="1"; //* Please fill BillToAddressName
		$scope.billToAddressLine1="2";//* Please fill billToAddressLine1
		$scope.billToAddressLine2="3"; 
		$scope.billToAddressLine3="4";
		$scope.billToAddressCity="5"; //* Please fill billToAddressCity
		$scope.state="6"; //* Please fill state
		$scope.billToAddressZipCode="7"; //* Please fill billToAddressZipCode
		$scope.billToAddressCountry="8"; 
		$scope.billToStateSelect="3";
		
		$scope.shipToAddressName="1"; //* Please fill shipToAddressName
		$scope.shipToAddressLine1="2"; //* Please fill shipToAddressName
		$scope.shipToAddressLine2="3";
		$scope.shipToAddressLine3="4"; 
		$scope.shipToAddressCity="5"; //* Please fill shipToAddressCity
		$scope.stateShipTo="3"; //* Please fill stateShipTo 
		$scope.shipToAddressZipCode="6"; //* Please fill shipToAddressZipCode
		$scope.shipToAddressCountry="7"; 
		$scope.shipToStateSelect="3";
	}]);
	
		var globalJson = ""; //To Control the Duplicate Calls
		var globalProfileBoolean = true;
		$(document)
				.ready(
						function() {
							//International phone init
							$("#user-phone").intlTelInput({
								defaultCountry : "us",
								utilsScript : "../js/utils.js" // just for formatting/placeholders etc
							});
							
							var orgId='${profileDetailsVO.organizationId}';
							var cusId='${profileDetailsVO.customer.customerId}';
							loadDataForCustomer(orgId, cusId);
							$(".orgSection1").val(
									$(".orgSection1 option:first").val());

							$('.country-list > li').each(
									function() {
										var countryName = $(this).find(
												'span.country-name');
										countryName.text(countryName.text()
												.split(' (')[0]);
									});

							$('#user-phone')
									.on(
											'blur',
											function() {
												if ($.trim($(this).val())) {
													if ($(this).intlTelInput(
															"isValidNumber")) {
														$(this).tooltip('hide');
														$(this)
																.data(
																		'number',
																		$(this)
																				.intlTelInput(
																						"getNumber"));
														if ($(
																'#user-profile-details')
																.prev()
																.find(
																		'p.validation-message')
																.css(
																		'visibility') === 'hidden') {
															$(
																	'#user-profile-details')
																	.prop(
																			'disabled',
																			false)
																	.removeClass(
																			'not-active');
														}
													} else {
														$(this)
																.tooltip(
																		{
																			'trigger' : 'manual',
																			'title' : '<spring:message code="label.myaccount.valid.phonenumber" javaScriptEscape="true"/>',
																			'placement' : 'bottom'
																		})
																.tooltip('show');
														$(
																'#user-profile-details')
																.prop(
																		'disabled',
																		true)
																.addClass(
																		'not-active');
													}
												}
											});

							$("#user-phone").on(
									'keypress',
									function(e) {
										if ($(this).next('div.tooltip').is(
												':visible')) {
											$(this).tooltip('hide');
										}
									});

							$(".tabs-menu a").click(
									function(event) {
										event.preventDefault();
										$(this).parent().addClass("current");
										$(this).parent().siblings()
												.removeClass("current");
										var tab = $(this).attr("href");
										$(".tab-content").not(tab).fadeOut()
												.promise().done(function() {
													$(tab).fadeIn();
												});
									});

							function toggle_visibility(id) {
								var e = document.getElementById(id);
								if (e.style.display == 'block')
									e.style.display = 'none';
								else
									e.style.display = 'block';
							}

							var selectedOrganization = '${selectedOrganization}';
							$(
									'.orgSection option[value="'
											+ selectedOrganization + '"]')
									.attr("selected", "selected");

							var changedFlag = '${userProfileDetails.countryFlag}';
							if (changedFlag != "") {
								$('#user-phone').intlTelInput("selectCountry",
										changedFlag);
							}

						});

		$(function() {
			$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
				var target = $(e.target).attr("href") // activated tab

			});

		});

		$(function() {

			//disable copy paste for confirm pasword
			$('#user-confirm_password').bind('cut copy paste', function(e) {
				e.preventDefault();
			});
			//submit form action for Application setting  
			$('.application-profile')
					.click(
							function() {
								$('div.pageLoader').show();
								document.location.href = "saveuserapplicationdetails?selectedLanguage="
										+ $('#languageList option:selected')
												.val();
							});

			$(".user-password")
					.on(
							'change',
							function(e) {
								var value = e.currentTarget.value;
								var messageStyle = {
									'text-align' : 'center',
									'visibility' : 'visible'
								};
								$('p.update-success').hide();
								if (value === "") {
									$('#user-profile-details1')
											.prev()
											.find('p.validation-message')
											.css(messageStyle)
											.text(
													'<spring:message code="label.message.changepassword.cantbeempty" javaScriptEscape="true"/>');
									$(this).data('valid', 'false');
									$('#user-profile-details1').prop(
											'disabled', true).addClass(
											'not-active');
								} else if (!ValidatePassword(value)) {
									$('#user-profile-details1')
											.prev()
											.find('p.validation-message')
											.css(messageStyle)
											.text(
													'<spring:message code="label.message.changepassword.invalid" javaScriptEscape="true"/>');
									$(this).data('valid', 'false');
									$('#user-profile-details1').prop(
											'disabled', true).addClass(
											'not-active');
								} else {
									$('#user-profile-details1').prev().find(
											'p.validation-message').css({
										'visibility' : 'hidden'
									});
									$(this).data('valid', 'true');
									$('#confirm_password').blur();
								}

							});

			$('#confirm_password')
					.on(
							'blur',
							function(e) {
								var value = e.currentTarget.value;
								var prevValue = $("#new-password").val();
								var validPassword = $("#new-password").data(
										'valid');
								var messageStyle = {
									'text-align' : 'center',
									'visibility' : 'visible'
								};
								$('p.update-success').hide();
								if (validPassword === "false") {
									if ($('#new-password').val() === "") {
										$('#user-profile-details1')
												.prev()
												.find('p.validation-message')
												.css(messageStyle)
												.text(
														'<spring:message code="label.message.changepassword.cantbeempty" javaScriptEscape="true"/>');
										$('#user-profile-details1').prop(
												'disabled', true).addClass(
												'not-active');
									} else {
										$('#user-profile-details1')
												.prev()
												.find('p.validation-message')
												.css(messageStyle)
												.text(
														'<spring:message code="label.message.changepassword.invalid" javaScriptEscape="true"/>');
										$('#user-profile-details1').prop(
												'disabled', true).addClass(
												'not-active');

									}

								} else if (prevValue === "") {
									$('#user-profile-details1')
											.prev()
											.find('p.validation-message')
											.css(messageStyle)
											.text(
													'<spring:message code="msg.myaccount.enterpassword" javaScriptEscape="true"/>');
									$('#user-profile-details1').prop(
											'disabled', true).addClass(
											'not-active');
								} else if (value === "") {
									$('#user-profile-details1')
											.prev()
											.find('p.validation-message')
											.css(messageStyle)
											.text(
													'<spring:message code="msg.myaccount.reenterpassword" javaScriptEscape="true"/>');
									$('#user-profile-details1').prop(
											'disabled', true).addClass(
											'not-active');
								} else if (prevValue !== value) {
									$('#user-profile-details1')
											.prev()
											.find('p.validation-message')
											.css(messageStyle)
											.text(
													'<spring:message code="msg.myaccount.nomatchingpassword" javaScriptEscape="true"/>');
									$('#user-profile-details1').prop(
											'disabled', true).addClass(
											'not-active');
								} else {
									$('#user-profile-details1').prev().find(
											'p.validation-message').css({
										'visibility' : 'hidden'
									});
									$('#user-profile-details1').prop(
											'disabled', false).removeClass(
											'not-active');
								}

							});
			//submit form action for Application setting  
			$('#user-profile-details')
					.click(
							function(e) {
								$('p.update-success').hide();
								if ($(this).hasClass('not-active')) {
									e.preventDefault();
								} else {

									var messageStyle = {
										'text-align' : 'center',
										'visibility' : 'visible'
									};
									var selectedFlag = $(
											'div.selected-flag .iti-flag')
											.attr('class').split(' ')[1];
									$('#countryCode').val(selectedFlag);
									$.ajax({
												type : "POST",
												url : "updateuserprofile",
												data : $("#myaccount-form")
														.serialize(), // serializes the form's elements.
												success : function(data) {
													$(".update-success").show();
													$(".profile-update").hide();
													if (data
															.match(/<(\w+)((?:\s+\w+(?:\s*=\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/)) {
														data = "<spring:message code='configurator.error'/>";
														$(".update-success")
																.css("color",
																		"red");
													} else {
														$(".update-success")
																.css("color",
																		"green");
													}
													$(
															"#account-settings-container  .update-success")
															.text(data);
												}
											});
								}
							});

			$('#user-profile-details1')
					.click(
							function(e) {
								$('p.update-success').hide();
								if ($(this).hasClass('not-active')) {
									e.preventDefault();
								} else {
									var messageStyle = {
										'text-align' : 'center',
										'visibility' : 'visible'
									};
									if ($("#old-password").val() == "") {

										$('#user-profile-details1')
												.prev()
												.find('p.validation-message')
												.css(messageStyle)
												.text(
														"<spring:message code='msg.enter.old.password' javaScriptEscape='true'/>");

									} else if ($("#new-password").val() == "") {
										$('#user-profile-details1')
												.prev()
												.find('p.validation-message')
												.css(messageStyle)
												.text(
														"<spring:message code='msg.enter.new.password' javaScriptEscape='true'/>");
									} else if ($("#confirm_password").val() == "") {
										$('#user-profile-details1')
												.prev()
												.find('p.validation-message')
												.css(messageStyle)
												.text(
														'<spring:message code='msg.enter.confirm.password' javaScriptEscape='true'/>');
									}

									else {
										var existingPswrd = '${userProfileDetails.password_register}';
										var changePswrd = $("#user-password")
												.val();
										var pswrdFlag = false;
										if (existingPswrd != changePswrd) {
											pswrdFlag = true;
										}
										$(".pageLoader").show();
										$.ajax({
													type : "POST",
													url : "updatenewpassword",
													data : $("#myaccount-form")
															.serialize(), // serializes the form's elements.
													success : function(data) {
														$(".pageLoader").hide();
														var updateResult = JSON
																.parse(data);
														$(".profile-update")
																.hide(); //Hide Profile Update
														if (updateResult[0] == "true") {
															$(".update-success")
																	.show();
															$(
																	"#change-password-container  .update-success")
																	.text(
																			updateResult[1]);
															$(".update-success")
																	.css(
																			"color",
																			"green");
														} else {
															$(".update-success")
																	.show();
															$(
																	"#change-password-container  .update-success")
																	.text(
																			updateResult[1]);
															$(".update-success")
																	.css(
																			"color",
																			"red");
														}
														$("#old-password").val(
																"");
														$("#new-password").val(
																"");
														$("#confirm_password")
																.val("");

													},
													error : function(jqxhr,
															textStatus, error) {
														// 15-01-2015-EH Handling
														var err = jqxhr.status;
														var msg = jqxhr.responseText;
														$(".pageLoader").hide();
														myErrObj
																.raise(err,
																		msg,
																		textStatus);
													}
												});
									}
								}

							});

			//submit form action for Profile setting
			$('#profile-save')
					.click(
							function() {
								if ($(this).hasClass('not-active')) {
									e.preventDefault();
									return false;
								}
								$('div.pageLoader').show();
								var selectedBillTo = $(this).parent(
										'.save-profile').siblings('.bill-ship')
										.find('.billto').find(
												'.billToList option:selected')
										.val();
								var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";
								if(undefined == selectedBillTo && isDealerUser=='true' ){
									selectedBillTo  = $(this).parent('.save-profile').siblings('.bill-ship').find('.billto').find('.billToList option').val()
								}
								var selectedShipTo = $(this).parent().siblings(
										'.bill-ship').find('.shipto').find(
										'.shipToList option:selected').val();
								var selectedOrganization = $(".orgSection")
										.find("option:selected").val();
								var selectedCustomer = $(this).parent()
										.siblings('.bill-ship').find('.billto')
										.find('.customerVal').val().trim();
								var selectedLanguage = $(
										'#languageList option:selected').val();
								var salesAreaId = $("#salesAreaId").val();
								$.ajax({
											type : "GET",
											url : "saveuserprofiledetails",
											data : {
												selectedBillTo : selectedBillTo,
												selectedShipTo : selectedShipTo,
												selectedOrganization : selectedOrganization,
												selectedCustomer : selectedCustomer,
												selectedLanguage : selectedLanguage,
												organizationTab : $(this)
														.parents(
																'.profileSubMenu')
														.find('.ui-tabs-active')
														.index(),
												defaultTab : "profileSetting",
												salesAreaId : salesAreaId
											},
											success : function(data) {
												$('div.pageLoader').hide();
												$(".profile-update").show();
												$(".update-success").hide();
												if (data
														.match(/<(\w+)((?:\s+\w+(?:\s*=\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/)) {
													data = "<spring:message code='configurator.error'/>";
													$(".profile-update").css(
															"color", "red");
												} else {
													$(".profile-update").css(
															"color", "green");
												}
												$(".profile-update").text(data);
											},
											error : function(jqxhr, textStatus,
													error) {
												$('div.pageLoader').hide();
												// 15-01-2015-EH Handling
												var err = jqxhr.status;
												var msg = jqxhr.responseText;
												$(".pageLoader").hide();
												myErrObj.raise(err, msg,
														textStatus);
											}
										});
							});

			$('.organizationId').val('${selectedOrganization}');
			
			/* Default Tab Setting*/
			var defaultTab = '${DefaultTab}';

			if (defaultTab == "profileSetting") {
				$('ul.profile-tabs > li').eq(1).addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li').eq(1).find('a').attr('href');
				$(id).css("display", "block");

				$('ul.profile-tabs > li').eq(0).removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li').eq(0).find('a').attr('href');
				$(id).css("display", "none");

				var organizationTab = '${organizationTab}';
				defaultTab = null;
			} else if (defaultTab == "applicationSetting") {
				$('ul.profile-tabs > li').eq(2).addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li').eq(2).find('a').attr('href');
				$(id).css("display", "block");

				$('ul.profile-tabs > li').eq(0).removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li').eq(0).find('a').attr('href');
				$(id).css("display", "none");

				defaultTab = null;
			} else if (defaultTab == "changePassword") {
				$('ul.profile-tabs > li').eq(2).addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li').eq(2).find('a').attr('href');
				$(id).css("display", "block");

				$('ul.profile-tabs > li').eq(0).removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li').eq(0).find('a').attr('href');
				$(id).css("display", "none");

				defaultTab = null;
			} else if (defaultTab == "addCard") {
				$('ul.profile-tabs > li:first').removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li:first').find('a').attr('href');
				$(id).css("display", "none");
				$('ul.profile-tabs > li:last').addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li:last').find('a').attr('href');
				$(id).css("display", "block");
				defaultTab = null;
				
			} else {
				$('ul.profile-tabs > li').eq(0).addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li').eq(0).find('a').attr('href');
				$(id).css("display", "block");

				$('ul.profile-tabs > li').eq(1).removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li').eq(1).find('a').attr('href');
				$(id).css("display", "none");
			}

			if (window.location.href.indexOf("addCard&organizationTab") > -1) {
				$('ul.profile-tabs > li:first').removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li:first').find('a').attr('href');
				$(id).css("display", "none");
				$('ul.profile-tabs > li:last').addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li:last').find('a').attr('href');
				$(id).css("display", "block");
				defaultTab = null;
				/* Customer details to be set on loading the page - Kameshwari */
				var organizationID = $(".orgSection1").find(
				"option:selected").val();
				getProfileDetails(organizationID);
			}

			var profileVoObj;

			$("#tags")
					.on(
							'change',
							function(e) {
								// Added for INC-657: anubhav.varma
								var custNum = $('.customerNoInput').val();
								if (custNum == null
										|| typeof custNum == 'undefined') {
									console.log("custNum=inside iff=="
											+ custNum)
									$("#currencyModal .modal-body")
											.html(
													"<spring:message code='label.myaccount.chooseCustomer'/>");
									$("#currencyModal")
											.find('.modal-header h4')
											.html(
													"<spring:message code='label.myaccount.preferredcustomer'/>");
									$("#currencyModal").show();
									$('#profile-save').addClass('not-active');
									return;
								}
							});

			$("#tags1")
					.autocomplete(
							{
								minLength: 2,
								source : function (request, response) {
										var results = $.ui.autocomplete.filter(customerString, request.term);
										response(results.slice(0, 1000));
									},
								select : function(e, ui) {
									var organizationId = $('.orgSection1')
											.val();
									e.preventDefault() // <--- Prevent the value from being inserted.
									//////////
									$.ajax({
												url : "getCustomerCardDetails?selectedCustomerForCard="
														+ ui.item.value
														+ "&organizationId="
														+ organizationId,
												success : function(data) {
													response = JSON.parse(data);
													var customerCardMap = response["customerCardMap"];
													$('.customerVal1').val(
															ui.item.value);
													$("#tags1").val(
															ui.item.label);
													populateCustomerCardDetails(customerCardMap);
												},
												error : function(e) {
												}
											});
									///////////
								},
								open : function(event) {
									$('.ui-autocomplete').css({
										'height' : 'auto'
									});
									var $input = $(event.target), inputTop = $input
											.offset().top, inputHeight = $input
											.height(), autocompleteHeight = $(
											'.ui-autocomplete').height(), windowHeight = $(
											window).height();
									windowWidth = $(window).width();
									if (windowWidth >= 768 && windowWidth < 992) {
										$('.ui-autocomplete').css("width",
												340 + 'px');
									}

									if ((inputHeight + inputTop + autocompleteHeight) > 430) {
										$('.ui-autocomplete').css({
											"height" : 430 + 'px',
											"position" : "fixed"
										});
									}
								},
								focus : function(event, ui) {
									event.preventDefault();
									$("#tags1").val(ui.item.label);
								}
							});
			$('.orgSection1').on('change', function() {				
				$(".pageLoader").show();
				var organizationID = $(".orgSection1").find(
				"option:selected").val(); 
				getProfileDetailsManagecard(organizationID);
				var selectedOrganization = $(this).val();
				setTimeout(function(){
					 var selectedCust = $('.customerVal1').val();				
					loadDataForCustomer(selectedOrganization, selectedCust);
				},2000);				
				
			});
			//Added from mil
			$(document).delegate('.language', 'change', function() {
				$('#profile-save').removeClass('not-active');
			});
		});

		$("#currencyModal")
				.on(
						"click",
						"#Checkout_currency_btn",
						function(e) {
							var currencyCode = $(
									'#currencyModal input[name="currencyCode"]:checked')
									.val();
							var organizationCode = $('.orgSection1').val();
							$.ajax({
										type : "get",
										data : {
											currencyCode : currencyCode,
											organizationId : organizationCode,
											customerId : $('.customerVal1')
													.val()
										},
										url : "setCurrency",
										success : function(data) {
											var response = jQuery
													.parseJSON(data);
											console.log(response);
											if (response != "Merchant Details Not Found") {
												$("#frmCheckOut")
														.attr(
																"action",
																response.paymentGatewayUrl);
												$("#merchant-id").val(
														response.merchantId);
												$("#branding").val(response.brand);
												$("#merchant-pass")
														.val(
																response.merchantPassword);
												$("#merchant-name").val(
														response.merchantName);
												$("#merchant-curr").val(
														response.currencyCode);
												$("#AppKey").val(
														response.appKey);
												console.log(response);
												$("#frmCheckOut").submit();
											} else {
												$("#currencyModal .modal-body")
														.html(response);
												$("#currencyModal")
														.find(
																'.modal-header h4')
														.html(
																"<spring:message code="label.bulkpartupload.information" />");
												$("#currencyModal").show();
											}

										},
										error : function(jqxhr, textStatus,
												error) {
 										}
									});
						});

		$(".custom-close").click(function() {
			$("#currencyModal").hide();
		});

		//Add Card Button Functionality Validation
		$("#Checkout_btn")
				.on(
						"click",
						function(e) {
							var organizationId = $('.orgSection1').val();
							var customerId = $('.customerVal1').val();
							var customerValue = $("#tags1").val();
							var customerReference = $("#tags1").val()
									.split("-")[0].trim();
							var message = "${message}";
							var foundValidCust = false;
							for (var i = 0; i < customerString.length; i++) {
								if (customerString[i].label == customerValue) {
									foundValidCust = true;
									break;
								}
							} 
							if (!foundValidCust) {
								$("#currencyModal .modal-body")
										.html(
												"<spring:message code='label.myaccount.customer.addCard'/>");
								$("#currencyModal")
										.find('.modal-header h4')
										.html(
												"<spring:message code='label.myaccount.preferredcustomer'/>");
								$("#currencyModal").show();
								return false;
							}  

							$("#addcard-customerId").val(customerId);
							$("#addcard-customerReference").val(
									customerReference);
							$("#addcard-organizationId").val(organizationId);
							if (message != "undefined" && message != "") {
								$("#addcard-message").val(message);
							}
							$("form#addcardform").submit();
						});

		var string;

		function setAddress(obj) {
			string = "";
			string += ((obj.addressName === null
					|| typeof obj.addressName === "undefined" || obj.addressName
					.trim() === "") ? "" : obj.addressName + "<br/>");
			string += ((obj.addressLine1 === null
					|| typeof obj.addressLine1 === "undefined" || obj.addressLine1
					.trim() === "") ? "" : obj.addressLine1 + "<br/>");
			string += ((obj.addressLine2 === null
					|| typeof obj.addressLine2 === "undefined" || obj.addressLine2
					.trim() === "") ? "" : obj.addressLine2 + "<br/>");
			string += ((obj.addressLine3 === null
					|| typeof obj.addressLine3 === "undefined" || obj.addressLine3
					.trim() === "") ? "" : obj.addressLine3 + "<br/>");
			string += ((obj.addressLine4 === null
					|| typeof obj.addressLine4 === "undefined" || obj.addressLine4
					.trim() === "") ? "" : obj.addressLine4 + "<br/>");
			string += ((obj.addressCity === null
					|| typeof obj.addressCity === "undefined" || obj.addressCity
					.trim() === "") ? "" : obj.addressCity + "<br/>");
			string += ((obj.addressState === null
					|| typeof obj.addressState === "undefined" || obj.addressState
					.trim() === "") ? "" : obj.addressState + "&nbsp;");
			string += ((obj.addressZipCode === null
					|| typeof obj.addressZipCode === "undefined" || obj.addressZipCode
					.trim() === "") ? "" : obj.addressZipCode + ",&nbsp;");
			string += ((obj.addressCountry === null
					|| typeof obj.addressCountry === "undefined" || obj.addressCountry
					.trim() === "") ? "" : obj.addressCountry);
			return string;
		}

		$('.orgSection').on('change', function() {
			$(".pageLoader").show();
			var selectedOrganization = $(this).val();
			getProfileDetails(selectedOrganization);

		});

	    function ValidatePassword(password) {
			var validPassword = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,100}$/;
			if (!validPassword.test(password)) {
				return false;
			} else {
				return true;
			}
		}

		function ValidatePhone(phone) {
			var validNumber = /^\d{10}$/;
			if (!validNumber.test(phone)) {
				return false;
			} else {
				return true;
			}
		}
		//New Implementation for Profile Settings
		$('.orgSection').on('change', function() {
			$(".pageLoader").show();
			var selectedOrganization = $(this).val();
			getProfileDetails(selectedOrganization);

		});
		$(function() {
			$("#profile-setting-id").click(
					function(e) {
						$('div.pageLoader').show();
						var isRetailShopper = ${isRetailUser};
						var organizationID = $(".orgSection").find(
								"option:selected").val();
						if (organizationID == null) {
							organizationID = "null";
						}
						if (globalProfileBoolean) {
							if (isRetailShopper) {
								getRetailShoperCustomerDetails(organizationID);
							} else {
								getProfileDetails(organizationID);
							}
						} else {
							$('div.pageLoader').hide();
						}

					});
			//Manage Card On Click event for Organization and Customers
			$("#add-card-id").click(function(e){
				if (addCardPermission == "true" /* && loadManageCardFlag */) {
					$(".pageLoader").show();
					 var organizationID = $(".orgSection").find(
					"option:selected").val(); 
					getProfileDetails(organizationID);
					var selectedOrganization = $(this).val();
					var selectedCust = $('.customerVal1').val();
					loadDataForCustomer(organizationID, selectedCust); 
					
				} 
			});
			
			
			$("#general-setting-id").click(function(e) {
				$("#change-password-container  .update-success").text("");
				$("#account-settings-container  .update-success").text("");
			});
			var addCardPermission = '${addCardPermission}';	
			var customerString = []; //Customer Array

			//Onchange of Ship To Drop Down values
			$(document).delegate('.shipToList', 'change', function() {
				$('#profile-save').removeClass('not-active');
				/*setting Ship Details*/
				var selectedShipTo = $("option:selected", this).val();
				$.each(shipToList, function(index, item) {
					if (item.addressId == selectedShipTo) {
						$('.ShipToDetails').html(setAddress(item));
					}
				});
			});
			//Onchange of Bill To Drop Down values
			$(document).delegate('.billToList', 'change', function() {
				$('#profile-save').removeClass('not-active');
				/*setting Ship Details*/
				var selectedShipTo = $("option:selected", this).val();
				$.each(billToList, function(index, item) {
					if (item.addressId == selectedShipTo) {
						$('.BillToDetails').html(setAddress(item));
					}
				});
			});

		});

		function getProfileDetails(organizationID) {
			$.ajax({
						type : "GET",
						url : "profileSetting",
						data : {
							selectedOrganization : organizationID
						},
						success : function(data) {
							console.log("Success :" + data);
							var profileVoObj;
							var val = data;
							var json = JSON.parse(val);
							globalJson = json;//Global JSON value
							globalProfileBoolean = false;
							console.log("json: " + json);
							var orgList = json.organizationDetailList;
							var defaultCustomer = json.customer;
							var defaultCustomerId = json.customerId;
							var defaultBillToAddress = json.billToAddress;
							var defaultBillToAddressId = json.billToAddressId;
							var defaultShipToAddress = json.shipToAddress;
							var defaultShipToAddressId = json.shipToAddressId;
							var defaultOrgId = json.organizationId;
							var isDealerUser="${sessionScope['scopedTarget.genericUserProperties'].isDealerUser}";

							//Set Customer Reference Values : Added by Hari to check for empty customer reference
							//Modified for Manage Card settings
							if (typeof (defaultCustomer.customerReference) != "undefined") {
								$("#tags, #tags1").val(
										defaultCustomer.customerReference + " - "
												+ defaultCustomer.customerName);
							} else {
								$("#tags, #tags1").val(defaultCustomer.customerName);
							}
							//Set Bill To Drop For Default 
							$("#billingAddress").find("option").remove();
							var defaultOptionBillTo = '<option value='+defaultBillToAddressId+'>'
									+ defaultBillToAddress.addressReference
									+ '-'
									+ defaultBillToAddress.addressName
									+ '</option>';
							$("#billingAddress").append(defaultOptionBillTo);
							//Set Ship To Drop For Default 
							$("#shippingAddress").find("option").remove();
							var defaultOptionShipTo = '<option value='+defaultShipToAddressId+'>'
									+ defaultShipToAddress.addressReference
									+ '-'
									+ defaultShipToAddress.addressName
									+ '</option>';
							$("#shippingAddress").append(defaultOptionShipTo);

							//Set Customer Id : Manage Card Inclusive
							/* Fix for customer value not being selected - Kameshwari */
							$("#customerVal,.customerVal1").val(defaultCustomerId);
							$("#orgSection1").val(defaultOrgId);
							
							$('.orgSection1 option[value="'
											+ defaultOrgId + '"]')
									.attr("selected", "selected");
							
							//Check Sales Area Settings 
							//SUPPORT-MIL-223-170216
							var salesAreaPermission = json.salesAreaPermission;
							console.log("salesAreaPermission::::::::"
									+ salesAreaPermission);
							if (salesAreaPermission != "undefined"
									&& (salesAreaPermission == "true" || salesAreaPermission == "TRUE")) {
								$("#salesAreaDiv").show();
							} else {
								$("#salesAreaDiv").hide();
								$("#salesAreaId").val("");
							}

							hideOrShowFields(json.hideOrShowFieldsJSON);

							//Set Default language
							$("#languageList").val(json.selectedLanguage);

							//Set Address Line for Bill To Address
							setAddress(defaultBillToAddress);
							$(".BillToDetails").text("");
							$(".BillToDetails").append(string);
							//Set Address Line for Ship To Address
							setAddress(defaultShipToAddress);
							$(".ShipToDetails").text("");
							$(".ShipToDetails").append(string);
							$('div.pageLoader').hide();

							getBillToShipToForCustomer(organizationID,
									defaultCustomerId);
							getCustomerDropdown(organizationID);//Get all Customer's Assigned to User 
							//Added from Mil
							//OM-1440
							//Disabling save button if current customer is not active
							if (!globalJson.customer.active) {
								$('#profile-save').addClass('not-active');
								$('#billingAddress').addClass('not-active');
								$('#shippingAddress').addClass('not-active');
								$('#languageList').addClass('not-active');

								$(".profile-update").show();
								$(".profile-update").css("color", "red");
								$(".profile-update")
										.text(
												'<spring:message code="msg.inactive.customer" javaScriptEscape="true"/>');
							} else {
								$('#profile-save').removeClass('not-active');
								$('#billingAddress').removeClass('not-active');
								$('#shippingAddress').removeClass('not-active');
								$('#languageList').removeClass('not-active');
								$(".profile-update").hide();
							}
							//END // of Added from Mil
							if(isDealerUser=='true'){
								$('#divisionOrgDropDown').hide();
								$('#preferredCustomer').text('<spring:message code="view.label.dealer" javaScriptEscape="true"/>');
								$('#preferredCustomer').addClass('alignLeft');
								$('#questionMark').hide();
								$('#billToAddressDealerCustomer').hide();
								$('#tags').css("background-color", "#eee");/* GPD-5019 */								
								$('#tags').prop('readonly',true);
							}
						},
						error : function(jqxhr, textStatus, error) {
							$('div.pageLoader').hide();
							// 15-01-2015-EH Handling
							var err = jqxhr.status;
							var msg = jqxhr.responseText;
							$(".pageLoader").hide();
							myErrObj.raise(err, msg, textStatus);
						}
					});
		}
		
		function getProfileDetailsManagecard(organizationID) {
			$.ajax({
						type : "GET",
						url : "profileSetting",
						data : {
							selectedOrganization : organizationID
						},
						success : function(data) {
							console.log("Success :" + data);
							var profileVoObj;
							var val = data;
							var json = JSON.parse(val);
							globalJson = json;//Global JSON value
							globalProfileBoolean = false;
							console.log("json: " + json);
							var orgList = json.organizationDetailList;
							var defaultCustomer = json.customer;
							var defaultCustomerId = json.customerId;
							
							var defaultOrgId = json.organizationId;

							//Set Customer Reference Values : Added by Hari to check for empty customer reference
							//Modified for Manage Card settings
							if (typeof (defaultCustomer.customerReference) != "undefined") {
								$("#tags1").val(
										defaultCustomer.customerReference + " - "
												+ defaultCustomer.customerName);
							} else {
								$("#tags1").val(defaultCustomer.customerName);
							}
							
							//Set Customer Id : Manage Card Inclusive
							/* Fix for customer value not being selected - Kameshwari */
							$(".customerVal1").val(defaultCustomerId);
							$("#orgSection1").val(defaultOrgId);
							
							$('.orgSection1 option[value="'
											+ defaultOrgId + '"]')
									.attr("selected", "selected");
							
					
							
							getCustomerDropdown(organizationID);//Get all Customer's Assigned to User 
							
						},
						error : function(jqxhr, textStatus, error) {
							// 15-01-2015-EH Handling
							var err = jqxhr.status;
							var msg = jqxhr.responseText;
							myErrObj.raise(err, msg, textStatus);
						}
					});
		}
		
		var billToList;
		var shipToList;
		function getBillToShipToForCustomer(orgId, customerId) {
			var customerId = customerId;
			var organizationID = orgId;
			$.ajax({
						type : "GET",
						url : "getbilltoshiptoforCustomer",
						data : {
							selectedOrganization : organizationID,
							customerId : customerId,
							defaultTab : "profileSetting",
							isAccountSettingFlow:true
						},
						success : function(data) {
							console.log("Address For Customer :" + data);
							$('div.pageLoader').hide();
							var json = JSON.parse(data);
							billToList = json.billToList;
							$("#billingAddress").find("option").remove();
							var duplicateBillToId = "";

							//Select the Default Bill, Ship
							var defaultBillToId = json.billToAddressId;
							var defaultShipToId = json.shipToAddressId;

							var defaultBillFlag = false;
							var defaultShipFlag = false;

							$
									.each(
											billToList,
											function(index, item) {
												duplicateBillToId = item.addressId;
												if (index == 0) {
													var BillTo = '<option value='+item.addressId+'>'
															+ item.addressReference
															+ '-'
															+ item.addressName
															+ '</option>';
													$("#billingAddress").append(BillTo);
												}
												if (duplicateBillToId != item.addressId) {
													var BillTo = '<option value='+item.addressId+'>'
															+ item.addressReference
															+ '-'
															+ item.addressName
															+ '</option>';
													$("#billingAddress")
															.append(BillTo);
												}

												if (defaultBillToId == item.addressId) {
													defaultBillFlag = true;
												}
											});
							$("#shippingAddress").find("option").remove();
							shipToList = json.shipToList;
							$
									.each(
											shipToList,
											function(index, item) {
												var defaultOptionShipTo = '<option value='+item.addressId+'>'
														+ item.addressReference
														+ '-'
														+ item.addressName
														+ '</option>';
												$("#shippingAddress").append(
														defaultOptionShipTo);
												if (defaultShipToId == item.addressId) {
													defaultShipFlag = true;
												}
											});
							if (defaultBillFlag) {
								$("#billingAddress").val(defaultBillToId);
							}
							if (defaultShipFlag) {
								$("#shippingAddress").val(defaultShipToId);
							}
							var billId = $("#billingAddress").val();
							var shipId = $("#shippingAddress").val();

							$("#billingAddress").trigger("change");
							$("#shippingAddress").trigger("change");

							//SUPPORT-MIL-223-170216 -- Revisited by Hari Shankar
							/*    Customer sales area, Changed by ganeshan 16th Feb 2016  */
							var customerSalesAreaCurrencyVo = json.customerSalesAreaCurrencyVo;
							if (typeof customerSalesAreaCurrencyVo != "undefined") {
								$("#salesArea")
										.val(
												customerSalesAreaCurrencyVo.description);
								$("#salesAreaId")
										.val(
												customerSalesAreaCurrencyVo.salesAreaId);
							} else {
								$("#salesArea").val("NA");
							}

						},
						error : function(jqxhr, textStatus, error) {
							// 15-01-2015-EH Handling
							var err = jqxhr.status;
							var msg = jqxhr.responseText;
							$(".pageLoader").hide();
							myErrObj.raise(err, msg, textStatus);
						}
					});
		}

		function getCustomerDropdown(orgId) {
			//var orgId = $(".orgSection").find("option:selected").val();
			$.ajax({
						type : "GET",
						url : "customerforOrganization",
						data : {
							selectedOrganization : orgId
						},
						success : function(data) {
							profileVoObj = JSON.parse(data);
							console.log("Customer Lite :" + profileVoObj);
							customerString = [];
							$.each(profileVoObj.CustomerLiteForUserOrg,
									function(index, item) {
										var items = {};
										items["label"] = item.customerReference
												+ ' - ' + item.customerName;
										items["value"] = item.customerId;
										customerString.push(items);

									});
							$("#tags,#tags1")
									.autocomplete(
											{
												minLength: 2,
												source : function (request, response) {
														var results = $.ui.autocomplete.filter(customerString, request.term);
														response(results.slice(0, 1000));
													},
												select : function(e, ui) {

													e.preventDefault() // <--- Prevent the value from being inserted.
													var selectedOrganization = $(
															".orgSection")
															.find(
																	"option:selected")
															.val();
													console
															.log(selectedOrganization
																	+ "---"
																	+ ui.item.value);
													$('div.pageLoader').show();
													getBillToShipToForCustomer(
															selectedOrganization,
															ui.item.value);
													/* Fix for customer value not being selected - Kameshwari */
													$("#customerVal,.customerVal1").val(
															ui.item.value);
												},
												open : function(event) {
													$('.ui-autocomplete').css({
														'height' : 'auto'
													});
													var $input = $(event.target), inputTop = $input
															.offset().top, inputHeight = $input
															.height(), autocompleteHeight = $(
															'.ui-autocomplete')
															.height(), windowHeight = $(
															window).height();
													windowWidth = $(window)
															.width();
													if (windowWidth >= 768
															&& windowWidth < 992) {
														$('.ui-autocomplete')
																.css(
																		"width",
																		340 + 'px');
													}

													if ((inputHeight + inputTop + autocompleteHeight) > 430) {
														$('.ui-autocomplete')
																.css(
																		{
																			"height" : 430 + 'px',
																			"position" : "fixed"
																		});
													}
												},
												focus : function(event, ui) {
													event.preventDefault();
													/* Fix for customer value not being selected - Kameshwari */
													$("#tags,#tags1").val(
															ui.item.label);
												}
											});

						},
						error : function(jqxhr, textStatus, error) {
							// 15-01-2015-EH Handling
							var err = jqxhr.status;
							var msg = jqxhr.responseText;
							$(".pageLoader").hide();
							myErrObj.raise(err, msg, textStatus);
						}
					});
		}
	</script>
</body>
</html>
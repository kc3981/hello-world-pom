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
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css?version=${properties['application.version']}">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="../css/dataTables.bootstrap.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/gensuite-ui.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-styles.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/page-responsive.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/intlTelInput.css?version=${properties['application.version']}">
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

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?version=${properties['application.version']}"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.min.js?version=${properties['application.version']}" defer></script>
<!-- Javascript Plugins -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/5.8.7/js/intlTelInput.min.js?version=${properties['application.version']}" defer></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>
<script
	src="../js/gensuite-ui.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/addCard.js?version=${properties['application.version']}" defer
	type="text/javascript"></script>

<style>
.intl-tel-input {
	display: inline-block;
	/*width: 570px;*/
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
</style>

</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />

	<form id='frmCheckOut' name='frmCheckOut' action="#" method='post'>
		<input type='hidden' id="merchant-id" name='AID' value="" /> <input
			type='hidden' id="merchant-pass" name='PWD' value="" /> <input
			type='hidden' id="merchant-name" name='Name' value="" /> <input
			type='hidden' id="merchant-add" name='Address' value="" /> <input
			type='hidden' id="merchant-email" name='Email' value="" /> <input
			type='hidden' id="merchant-amount" name='Amount' value="0.00" /> <input
			type='hidden' id="merchant-curr" name='Currency' value="" /> <input
			type='hidden' name='TestMode' value="N" /> <input type='hidden'
			name='TransactionType' value='4'> <input type='hidden'
			name='Tokenize' value='true'> <input type='hidden'
			id="isguestuser" name='IsGuestUser' value="" />
		<!--<input type='hidden' name='Callback' value="http://shoppingcart.com/transactstatus.aspx" /><br/>-->
		<input type='hidden' name='Callback'
			value='${properties["focus.createCard.callback"]}' />
		<input type='hidden' id="branding" name='Branding' value="" />
	</form>
	<!-- Main Wrapper having header,footer and content -->
	<div class="main-wrapper myacc">
		<form method="post" id="myaccount-form">
			<!-- header container having logo and navigation -->
			<!-- header container having logo and navigation -->
			<header>
				<%@ include file="header.jsp"%>
			</header>
			<!-- content wrapper for the current page contents -->
			<div class="container-fluid content-wrapper quoteview ">
				<!--- This is for Breadcrumbs -->
				<div class="breadcrumbs-list hidden-xs">
					<ul class="breadcrumb">
						<li><a href="homepage"><spring:message
									code="label.footer.home" /></a></li>
						<li class="active"><spring:message
								code="label.header.account" /></li>
					</ul>
				</div>
				<h3 class="page-subhead">
					<spring:message code="label.header.account" />
				</h3>

				<!-- 3rd section box starts here -->
				<div class="row myaccount">
					<div class="col-xs-12 col-sm-12 col-md-12 padd-none spaceTop20">
						<ul class="tabs-menu profile-tabs nav nav-pills nav-justified">
							<li class=""><a data-toggle="tab"
								href="#account-settings-container"> <i
									class="fa fa-unlock-alt"></i> <spring:message
										code="label.myaccount.accountsettings" /></a></li>
							<li class=""><a data-toggle="tab"
								href="#profile-settigs-container"> <i class="fa fa-user"></i>
									<spring:message code="label.myaccount.profilesettings" /></a></li>
							<li class=""><a data-toggle="tab"
								href="#change-password-container"> <i class="fa fa-key"></i>
									<spring:message code="label.myaccount.changepassword" />
							</a></li>
							<sec:authorize access="hasRole('ROLE_ADD_CARD')">
								<li class=""><a data-toggle="tab" href="#add-credit-card">
										<i class="fa fa-credit-card"></i> <spring:message
											code="label.myaccount.manageCard" />
								</a></li>
							</sec:authorize>
						</ul>
						<div id="tabs-container"
							class="col-lg-12 col-md-12 col-sm-12 nopadding">
							<div class="tab">
								<div id="profile-settigs-container"
									class="tab-content profile-data">
									<div id="tabs"
										class="profile-custom-tabs nav nav-pills nav-justified profileSubMenu column-paddings">
										<div
											class="col-sm-6 col-md-6 col-lg-6 account-details-padding">
											<label><spring:message
													code="label.myaccount.selectdivision" /> </label> <select
												class="form-control orgSection">
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
											class="col-sm-6 col-md-6 col-lg-6 profileBox account-details-padding">
											<label><spring:message
													code="label.myaccount.preferredcustomer" /></label> <input
												id="tags" type="text"
												class="customerNoInput col-sm-11 col-md-11 col-lg-11"
												style="margin-bottom: 5px;">
											<div class="col-lg-1">

												<input type="hidden" id="customerPreferredValue"
													class="form-control" /> <a class="help-button"
													data-placement="bottom" data-toggle="tooltip"
													href="javascript:;"
													data-original-title="<spring:message code="label.order.customer.message" />">?</a>
											</div>
										</div>
										<div class="clearfix spaceTop20 "></div>
										<%-- <c:forEach items="${profileDetailsVO.organizationDetailList}"
											var="organization" varStatus="status"> --%>

										<div id="tabs-<c:out value="${status.count}"/>"
											class="billShipDetails">
											<div
												class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pull-left bill-ship">
												<div
													class="col-xs-12 col-sm-6 col-md-6 col-lg-6 btn-group billto">
													<label class="alignLeft "><spring:message
															code="label.myaccount.defaultbillingaddress" /> </label> <select
														name="billingAddress" id="billingAddress"
														class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-control billToList">
													</select>
													<p class=" addressBox spaceTop20 BillToDetails"></p>
													<input type="hidden" value="${organization.organizationId}"
														class="organizationId" /> <input type="hidden"
														class="customerVal" /> <input type="hidden"
														class="shiptoVal" />
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
											<div class="col-sm-6 col-md-6 col-lg-6">
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
											<div class="col-sm-6 col-md-6 col-lg-6"></div>
											<div
												class="save-info col-lg-12 col-md-12 col-sm-12 col-xs-12 save-profile">
												<p style="color: #006400;">${saveResult}</p>
												<p class="validation-message" style="visibility: hidden"></p>
												<a class="save-button profile-save not-active"
													id="profile-save" href="javascript:void(0);"><span
													class="glyphicon glyphicon-floppy-save"></span> <spring:message
														code="label.mymachines.save" /></a>
											</div>
										</div>
										<%-- </c:forEach> --%>
									</div>
								</div>
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
										<!-- &nbsp;<a class="help-button" href="javascript:;"
												data-toggle="tooltip" data-placement="bottom"
												title="Password is case sensitive and requires a minimum of 8 characters including at least one number and one special character.">?</a> -->
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
											<c:choose>
												<c:when test="${successPassword}">
													<p class="update-success">${passwordChangeResult}</p>
												</c:when>
												<c:otherwise>
													<p class="update-success" style="color: red;">
														${passwordChangeResult}</p>
												</c:otherwise>
											</c:choose>

										</div>
										<div>
											<p class="validation-message" style="visibility: hidden"></p>
										</div>
										<a class="save-button not-active" href="javascript:void(0);"
											id="user-profile-details1"><span
											class="glyphicon glyphicon-floppy-save"></span> <spring:message
												code="label.mymachines.save" /></a>
									</div>
								</div>
								<!-- 								 Added For Adding the card -->
								<div id="add-credit-card" class="tab-content">
									<div class="col-sm-6 col-md-6 col-lg-6 account-details-padding">
										<label><spring:message
												code="label.myaccount.selectdivision" /> </label> <select
											class="form-control orgSection1" id="cardDivision">
										</select>
									</div>

									<div
										class="col-sm-6 col-md-6 col-lg-6 profileBox account-details-padding">
										<label><spring:message
												code="label.myaccount.preferredcustomer" /></label> <input
											id="tags1" type="text"
											class="customerNoInput1 col-sm-11 col-md-11 col-lg-11"
											style="margin-bottom: 5px;"> <input type="hidden"
											class="customerVal1" />
										<div class="col-lg-1">
											<a class="help-button" data-placement="bottom"
												data-toggle="tooltip" href="javascript:;"
												data-original-title="<spring:message code="label.order.customer.message" />">?</a>
										</div>
									</div>
									<div class="col-lg-12 padrt">
										<button type="button" id="Checkout_btn"
											class="btn btn-buynow cart-small pull-right">
											<spring:message code="label.myaccount.addCard" />
										</button>
									</div>
									<div class="col-lg-12">
										<div class="cardHold">
											<table id="cardTable" class="table table-hover">
												<thead>
													<th><spring:message code="label.myaccount.cardNumber" />
													</th>
													<th><spring:message code="label.myaccount.currency" />
													</th>
													<th><spring:message
															code="label.myaccount.cardReference" /></th>
													<th><spring:message code="lable.action" /></th>
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
											<%-- <label for="user-password1" >Password</label> <br>
											<div class="row">
											<input id="user-password1" name="password" type="password" class="col-xs-10 col-sm-8"
												data-valid="invalid" name="password_register"
												value="<c:out value='${userProfileDetails.password_register}'/>"
												required> &nbsp;<a class="help-button" href="javascript:;"
												data-toggle="tooltip" data-placement="bottom"
												title="Password is case sensitive and requires a minimum of 8 characters including at least one number and one special character.">?</a></div> --%>

											<input type="hidden" id="countryCode" name="countryFlag" />
										</div>
										<%-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nopadding">
											<label for="user-phone" >My Phone</label> <br>
											<div class="row">
											<input id="user-phone" name="phone" type="text" data-number=""required="" class="col-xs-10 col-sm-8"
												value="<c:out value='${userProfileDetails.phone_register}'/>"
												name="phone_register" required>&nbsp;<a class="help-button" href="javascript:;"
												data-toggle="tooltip" data-placement="left"
												title="Phone number should be of 10 numericals.">?</a></div> <br> <label
												for="user-confirm_password1" name="mobile">Confirm
												Password</label> <br> <div class="row"><input id="user-confirm_password"
												type="password" required="" name="confirmPassword" class="col-xs-10 col-sm-8"
												value="<c:out value='${userProfileDetails.password_register}'/>"
												required></div>
												<input type="hidden" name="pswrdFlag" id="pswrdFlag"/>

										</div> --%>
										<div class="save-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div>
												<p class="update-success">${updateResult}</p>
											</div>
											<div>
												<p class="validation-message" style="visibility: hidden"></p>
											</div>

											<a id="user-profile-details" class="save-button not-active"
												href="javascript:void(0);"><span
												class="glyphicon glyphicon-floppy-save"></span> <spring:message
													code="label.mymachines.save" /></a>
										</div>
									</form>
									<div class="clearfix"></div>
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
	<script>
		$(document).ready(
				function() {
					//International phone init
            		$("#user-phone").intlTelInput({
                                  defaultCountry: "us",
                                  /*geoIpLookup: function(callback) {
                                    $.get('http://ipinfo.io', function() {}, "jsonp").always(function(resp) {
                                      var countryCode = (resp && resp.country) ? resp.country : "";
                                      callback(countryCode);
                                    });
                                  },*/
                                  utilsScript: "../js/utils.js" // just for formatting/placeholders etc
                                });
            		$('.country-list > li').each(function(){
		                var countryName=$(this).find('span.country-name');
		                countryName.text(countryName.text().split(' (')[0]);
		            });
					/*$("#user-phone").keypress(function (e) {
					     var key = e.charCode || e.keyCode || 0;
						    $phone = $(this);
						    //var onlyNumber = $(this).data('number');
						    // Auto-format- do not expose the mask as the user begins to type
						    if (key !== 8 && key !== 9) {
						        if ($phone.val().length === 4) {
						            $phone.val($phone.val() + ')');
						        }
						        if ($phone.val().length === 5) {
						            $phone.val($phone.val() + ' ');
						        }           
						        if ($phone.val().length === 9) {
						            $phone.val($phone.val() + '-');
						        }
						    }

						    // Allow numeric (and tab, backspace, delete) keys only
						    return (key == 8 || 
						            key == 9 ||
						            key == 46 ||
						            (key >= 48 && key <= 57) ||
						            (key >= 96 && key <= 105)); 
						    }).bind('focus click', function () {
						        $phone = $(this);
						        
						        if ($phone.val().length === 0) {
						            $phone.val('(');
						        }
						        else {
						            var val = $phone.val();
						            $phone.val('').val(val); // Ensure cursor remains at the end
						        }
						    })
						    .blur(function () {
						        $phone = $(this);
						        $(this).data('number',$(this).val().replace('(','').replace(')','').replace('-','').replace(' ',''));
						        //alert($(this).data('number'));
						        if ($phone.val() === '(') {
						            $phone.val('');
						        }   
						});*/

					$('#user-phone').on('blur',function(){
						if($.trim($(this).val())){
							if($(this).intlTelInput("isValidNumber")){
								$(this).tooltip('hide');
								$(this).data('number',$(this).intlTelInput("getNumber"));
								if($('#user-profile-details').prev().find('p.validation-message').css('visibility')==='hidden'){
									$('#user-profile-details').prop('disabled',false).removeClass('not-active');
								}
							}else{
								$(this).tooltip({'trigger':'manual', 'title': '<spring:message code="label.myaccount.valid.phonenumber" javaScriptEscape="true"/>','placement':'bottom'}).tooltip('show');
								$('#user-profile-details').prop('disabled',true).addClass('not-active');
							}
						}
					});

					$("#user-phone").on('keypress',function(e){
						if($(this).next('div.tooltip').is(':visible')){
							$(this).tooltip('hide');
						}
            		});

					$(".tabs-menu a").click(
							function(event) {
								/*$('.carttitle > h3').text($(this).text());*/
								event.preventDefault();
								$(this).parent().addClass("current");
								$(this).parent().siblings().removeClass(
										"current");
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
					$('.orgSection option[value="'+selectedOrganization+'"]').attr("selected", "selected");
					
					var changedFlag = '${userProfileDetails.countryFlag}';
					if(changedFlag!=""){
						/*var existingCountryFlag = $('div.selected-flag .iti-flag').attr('class').split(' ')[1];
						$('div.selected-flag .iti-flag').removeClass(existingCountryFlag).addClass(changedFlag)*/
						//$('#user-phone').intlTelInput("selectCountry", changedFlag);
					}
					
					
					
				});
						            
						            

		$(function() {
			$("#tabs").tabs();
		});

		$(function() {

			//disable copy paste for confirm pasword
			$('#user-confirm_password').bind('cut copy paste',function(e){
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

			$(".user-password").on(
					'change',
					function(e) {
						var value = e.currentTarget.value;
						var messageStyle = {
							'text-align' : 'center',
							'visibility' : 'visible'
						};
						$('p.update-success').hide();
						if (value === "") {
							$('#user-profile-details1').prev().find(
									'p.validation-message').css(messageStyle)
									.text('<spring:message code="label.message.changepassword.cantbeempty" javaScriptEscape="true"/>');
							$(this).data('valid', 'false');
							$('#user-profile-details1').prop('disabled',true).addClass('not-active');
						} else if (!ValidatePassword(value)) {
							$('#user-profile-details1').prev().find(
									'p.validation-message').css(messageStyle)
									.text('<spring:message code="label.message.changepassword.invalid" javaScriptEscape="true"/>');
							$(this).data('valid', 'false');
							$('#user-profile-details1').prop('disabled',true).addClass('not-active');
						} else {
							$('#user-profile-details1').prev().find(
									'p.validation-message').css({
								'visibility' : 'hidden'
							});
							$(this).data('valid', 'true');
							$('#confirm_password').blur();
							//$('#user-profile-details').prop('disabled',false).removeClass('not-active');
						}

					});

			$('#confirm_password').on(
					'blur',
					function(e) {
						var value = e.currentTarget.value;
						var prevValue = $("#new-password").val();
						var validPassword = $("#new-password").data('valid');
						var messageStyle = {
							'text-align' : 'center',
							'visibility' : 'visible'
						};
						$('p.update-success').hide();
							if(validPassword === "false"){
								if($('#new-password').val()===""){
									$('#user-profile-details1').prev().find(
										'p.validation-message').css(
										messageStyle).text('<spring:message code="label.message.changepassword.cantbeempty" javaScriptEscape="true"/>');
										$('#user-profile-details1').prop('disabled',true).addClass('not-active');
								}else{
									$('#user-profile-details1').prev().find(
										'p.validation-message').css(
										messageStyle).text(
										'<spring:message code="label.message.changepassword.invalid" javaScriptEscape="true"/>');
										$('#user-profile-details1').prop('disabled',true).addClass('not-active');

								}
								
							}else if (prevValue === "") {
								$('#user-profile-details1').prev().find(
										'p.validation-message').css(
										messageStyle).text(
										'<spring:message code="msg.myaccount.enterpassword" javaScriptEscape="true"/>');
								$('#user-profile-details1').prop('disabled',true).addClass('not-active');
							} else if (value === "") {
								$('#user-profile-details1').prev().find(
										'p.validation-message').css(
										messageStyle).text(
										'<spring:message code="msg.myaccount.reenterpassword" javaScriptEscape="true"/>');
								$('#user-profile-details1').prop('disabled',true).addClass('not-active');
							} else if (prevValue !== value) {
								$('#user-profile-details1').prev().find(
										'p.validation-message').css(
										messageStyle).text(
										'<spring:message code="msg.myaccount.nomatchingpassword" javaScriptEscape="true"/>');
								$('#user-profile-details1').prop('disabled',true).addClass('not-active');
							} else {
								$('#user-profile-details1').prev().find(
									'p.validation-message').css({
									'visibility' : 'hidden'
								});
									$('#user-profile-details1').prop('disabled',false).removeClass('not-active');
							}

					});
			//submit form action for Application setting  
			$('#user-profile-details')
					.click(
							function(e) {
									$('p.update-success').hide();
									if($(this).hasClass('not-active')){
										e.preventDefault();
									}else{
										//$('div.pageLoader').show();
										var messageStyle = {
											'text-align' : 'center',
											'visibility' : 'visible'
										};
										
											/* var existingPswrd = '${userProfileDetails.password_register}';
											var changePswrd = $("#user-password").val();
											var pswrdFlag = false;
											if (existingPswrd != changePswrd) {
												pswrdFlag = true;
											}*/
												
											var selectedFlag = $('div.selected-flag .iti-flag').attr('class').split(' ')[1];
											$('#countryCode').val(selectedFlag);
											
											$("#myaccount-form").attr("action", "updateuserprofile");
											$("#myaccount-form").submit(); 
										}
							});
			
			$('#user-profile-details1')
			.click(
					function(e) {
							$('p.update-success').hide();
							if($(this).hasClass('not-active')){
								e.preventDefault();
							}else{
								//$('div.pageLoader').show();
								var messageStyle = {
									'text-align' : 'center',
									'visibility' : 'visible'
								};
								if ($("#old-password").val() == "") {

									$('#user-profile-details1').prev().find(
											'p.validation-message').css(
											messageStyle).text(
											"<spring:message code='msg.enter.old.password' javaScriptEscape='true'/>");

								}
								else if($("#new-password").val() == ""){
									$('#user-profile-details1').prev().find(
									'p.validation-message').css(
										messageStyle).text(
												"<spring:message code='msg.enter.new.password' javaScriptEscape='true'/>");
								}
								else if($("#confirm_password").val() == ""){
									$('#user-profile-details1').prev().find(
									'p.validation-message').css(
										messageStyle).text(
										'<spring:message code='msg.enter.confirm.password' javaScriptEscape='true'/>');
								}
									
									
								 else {
									var existingPswrd = '${userProfileDetails.password_register}';
									var changePswrd = $("#user-password").val();
									var pswrdFlag = false;
									if (existingPswrd != changePswrd) {
										pswrdFlag = true;
									}
									/* document.location.href = "updateuserprofile?phone="
											+ $('#user-phone').data('number')
											+ "&password="
											+ $('#user-password').val()
											+ "&mobile="
											+ $('#user-phone').data('number')
											+ "&pswrdFlag=" + pswrdFlag; */
											
									$("#myaccount-form").attr("action", "updatenewpassword");
									$("#myaccount-form").submit(); 
								}
							}

					});
			
			 

			//submit form action for Profile setting
			$('#profile-save')
					.click(
							function() {
								if($(this).hasClass('not-active')){
									e.preventDefault();
									return false;
								}
								$('div.pageLoader').show();
								var selectedBillTo = $(this).parent(
										'.save-profile').siblings('.bill-ship')
										.find('.billto').find(
												'.billToList option:selected')
										.val();
								var selectedShipTo = $(this).parent().siblings(
										'.bill-ship').find('.shipto').find(
										'.shipToList option:selected').val();
								var selectedOrganization = $(this).parent()
										.siblings('.bill-ship').find('.billto')
										.find('.organizationId').val();
								var selectedCustomer = $(this).parent()
										.siblings('.bill-ship').find('.billto')
										.find('.customerVal').val()
										.trim();
								var selectedLanguage= $('#languageList option:selected').val();
																								
								document.location.href = "saveuserprofiledetails?selectedBillTo="
										+ selectedBillTo
										+ "&selectedShipTo="
										+ selectedShipTo
										+ "&selectedOrganization="
										+ selectedOrganization
										+ "&selectedCustomer="
										+ selectedCustomer
										+ "&selectedLanguage="
										+ selectedLanguage
										+ "&organizationTab="
										+ $(this).parents('.profileSubMenu')
												.find('.ui-tabs-active')
												.index()
										+ "&defaultTab=profileSetting"
								//e.preventDefault();
								
										
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

				/* $('ul.orgList > li').eq(0).removeClass('ui-tabs-active')
						.removeClass('ui-state-active');
				$('ul.orgList > li').eq(organizationTab).addClass(
						'ui-tabs-active').addClass('ui-state-active'); */

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
			} 
			else if (defaultTab == "changePassword") {
				$('ul.profile-tabs > li').eq(2).addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li').eq(2).find('a').attr('href');
				$(id).css("display", "block");

				$('ul.profile-tabs > li').eq(0).removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li').eq(0).find('a').attr('href');
				$(id).css("display", "none");

				defaultTab = null;
			}else if(defaultTab == "addCard"){
				$('ul.profile-tabs > li:first').removeClass('active').removeClass(
				'current');
				id = $('ul.profile-tabs > li:first').find('a').attr('href');
				$(id).css("display", "none");
				$('ul.profile-tabs > li:last').addClass('active').addClass(
				'current');
				var id = $('ul.profile-tabs > li:last').find('a').attr('href');
				$(id).css("display", "block");
				
			}else {
				$('ul.profile-tabs > li').eq(0).addClass('active').addClass(
						'current');
				var id = $('ul.profile-tabs > li').eq(0).find('a').attr('href');
				$(id).css("display", "block");

				$('ul.profile-tabs > li').eq(1).removeClass('active')
						.removeClass('current');
				id = $('ul.profile-tabs > li').eq(1).find('a').attr('href');
				$(id).css("display", "none");
			}
			var profileVoObj;
			var val = '${profileDetailsVOJson}';
			var json = JSON.parse(val);
			profileVoObj = json;
			var val2 = '${profileDetailsVOJson}';
			var json2 = JSON.parse(val2);
			var val3 = '${profileDetailsVOJson}';
			var json3 = JSON.parse(val3);
			console.log("json: " + json);
			/* Set All Details on Screen*/
			setScreen(json, json2, json3);
			/*--Customer List Auto Complete*/
			var defaultCustomer = "";
			var string = [];
			var customerList = json["CustomerLiteForUserOrg"];
			console.log("customerList :"+customerList);
			var item = {};			
			for (var i = 0; i < customerList.length; i++) {
				var obj = customerList[i];
				if (json["customer"].customerId == obj.customerId) {
					defaultCustomer = json["customer"].customerReference
							+ ' - ' + json["customer"].customerName;
					$('.customerVal').val(json["customer"].customerId);
				}
				item = {};
				item["label"] = obj.customerReference + ' - '
						+ obj.customerName;
				item["value"] = obj.customerId;
				string.push(item);
			}
			var addCardPermission = '${addCardPermission}';
 			if(addCardPermission == "true"){
 			loadDataForCustomer($('.orgSection').val(),$('.customerVal').val());
			}
			if (defaultCustomer.trim() != "") {
				// Set Default Customer  
				$('.customerNoInput').val(
						json["customer"].customerReference + ' - '
								+ json["customer"].customerName);
			}
			
			

			$("#tags").on('change',function(e){
			   // Added for INC-657: anubhav.varma
				var custNum = $("#customerPreferredValue").data('label');
	     	   if(custNum==null || typeof custNum=='undefined')
	     			$("#currencyModal .modal-body").html("<spring:message code='label.myaccount.chooseCustomer'/>");
				    $("#currencyModal").find('.modal-header h4').html("<spring:message code='label.myaccount.preferredcustomer'/>");
	 			    $("#currencyModal").show();
	     		  return;
				
			});
			
			
			$("#tags1").autocomplete({
				source : customerString,
				select : function(e, ui) {
					
					e.preventDefault() // <--- Prevent the value from being inserted.
					//////////
					$.ajax({
								url : "getCustomerCardDetails?selectedCustomerForCard="
										+ ui.item.value,
								success : function(data) {
									response = JSON.parse(data);
 									var customerCardMap = response["customerCardMap"];
 									$('.customerVal1').val(ui.item.value);
									$("#tags1").val(ui.item.label);
									populateCustomerCardDetails(customerCardMap);
 								},
								error : function(e) {
								}
							});
					///////////
				},
				open:function(event) {
 			        $('.ui-autocomplete').css({'height':'auto'});
				        var $input = $(event.target),
				            inputTop = $input.offset().top,
				            inputHeight = $input.height(),
				            autocompleteHeight = $('.ui-autocomplete').height(),
				            windowHeight = $(window).height();
			              windowWidth = $(window).width();
			          if(windowWidth >= 768 && windowWidth <992){
			            $('.ui-autocomplete').css("width", 340+'px');
			          }
				        
				        if ((inputHeight + inputTop+ autocompleteHeight) > 430) {
				            $('.ui-autocomplete').css({"height": 430+'px', "position": "fixed"});
				        }
				    },
				focus : function(event, ui) {
					event.preventDefault();
					$("#tags1").val(ui.item.label);
				}
});
			$('.orgSection1').on('change', function(){
					var selectedOrganization = $(this).val();
 				loadDataForCustomer(selectedOrganization);
			});
			$("#tags").autocomplete(
					{
						source : string,
						select : function(e, ui) {
							
							e.preventDefault() // <--- Prevent the value from being inserted.
							var selectedOrganization = $(this).parents(
									'.profileSubMenu').find('.organizationId')
									.val();
							$.ajax({
								url : "getaddressforcustomer?customerId="
										+ ui.item.value
										+ "&selectedOrganization="
										+ selectedOrganization
										+ "&defaultTab=profileSetting",
								success : function(response) {
 									profileVoObj = JSON.parse(response);
									json1 = JSON.parse(response);
									json2 = JSON.parse(response);
									json3 = JSON.parse(response);
									setScreenAutoComplete(json1, json2, json3);
									$('.customerVal').val(ui.item.value);
									$("#tags").val(ui.item.label);
									$('#profile-save').removeClass('not-active');
								},
								error : function(e) {
								}
							});
						},
						open:function(event) {
					        $('.ui-autocomplete').css({'height':'auto'});
						        var $input = $(event.target),
						            inputTop = $input.offset().top,
						            inputHeight = $input.height(),
						            autocompleteHeight = $('.ui-autocomplete').height(),
						            windowHeight = $(window).height();
					              windowWidth = $(window).width();
					          if(windowWidth >= 768 && windowWidth <992){
					            $('.ui-autocomplete').css("width", 340+'px');
					          }
						        
						        if ((inputHeight + inputTop+ autocompleteHeight) > 430) {
						            $('.ui-autocomplete').css({"height": 430+'px', "position": "fixed"});
						        }
						    },
						focus : function(event, ui) {
							event.preventDefault();
							$("#tags").val(ui.item.label);
						}
					});
			
			$(document)
			.delegate(
					'.language',
					'change',
					function() {
						$('#profile-save').removeClass('not-active');
					});
			
			
			$(document)
			.delegate(
					'.shipToList',
					'change',
					function() {
						$('#profile-save').removeClass('not-active');
						/*setting Ship Details*/
						var selectedShipTo = $("option:selected", this)
								.val();
						var selectedOrganization = $(this).parents(
								'.shipto').siblings('.billto').find(
								'.organizationId').val();
						var selectedBillTo = $(this).parents('.shipto')
								.siblings('.billto').find(
										'.billToList option:selected')
								.val();
						
						var val = '${profileDetailsVOJson}';
						var json = JSON.parse(val);
						var billToShipToMap = profileVoObj["billToShipToMap"];
						
						for (var i = 0; i < billToShipToMap[selectedBillTo].length; i++) { //loop through the array
							var obj = billToShipToMap[selectedBillTo][i];
							if (obj.addressId == selectedShipTo) {
								//Set Shipto Address  
								$('.ShipToDetails').html(setAddress(obj));
							}
						}
					});
			
		});
		
       	$("#currencyModal").on("click","#Checkout_currency_btn", function(e){
       	 var  currencyCode = $('#currencyModal input[name="currencyCode"]:checked').val(); 
       		var organizationCode = $('.orgSection1').val();
    			$.ajax({
				type : "get",
				data : {
					currencyCode : currencyCode,
					organizationId : organizationCode,
					customerId : $('.customerVal1').val()
				},
				url : "setCurrency",
				success : function(data) {
					var response = jQuery.parseJSON(data);
	            	console.log(response);
	            	if(response!="Merchant Details Not Found"){
 	            	$("#frmCheckOut").attr("action",response.paymentGatewayUrl);
 	            	$("#merchant-id").val(response.merchantId);
 	            	$("#merchant-pass").val(response.merchantPassword);
 	            	$("#merchant-name").val(response.merchantName);
         			$("#merchant-curr").val(response.currencyCode); 
         			$("#branding").val(response.brand);
 					console.log(response);
  					$("#frmCheckOut").submit();	
	            	}else{
	            		$("#currencyModal .modal-body").html(response);
			 			$("#currencyModal").show();
	            	}
	            	
				},
				error : function(jqxhr, textStatus, error) {
					//alert("Error");
				}
			});
     	});

		$(".custom-close").click(function(){
		   $("#currencyModal").hide();
		});


       	$("#Checkout_btn").on("click", function(e){
       		var organizationId = $('.orgSection1').val();
       		var customerId = $('.customerVal1').val();
       		var customerValue = $("#tags1").val();
       		var foundValidCust = false;
        	for(var i=0;i<customerString.length;i++){
       			if(customerString[i].label == customerValue){
       				foundValidCust = true;
       				break;
       			}
        	}
        	
        	if(!foundValidCust){
        		$("#currencyModal .modal-body").html("<spring:message code='label.myaccount.customer.addCard'/>");
  			    $("#currencyModal").show();
        		return false;
        	}
        	
       			$.ajax({
				type : "get",
				data : {
					organizationId : organizationId,
					customerId : customerId
 				},
				url : "setCustomerDetails",
				success : function(data) {
					console.log(data);
		 		  	var jsonMap =  JSON.parse(data);
		 		  	console.log("Json Map11=="+jsonMap);
		 		  	var isValid  = true;

		 		  	if(jsonMap == "No Currency found for this division"){
		 		  		isValid = false;
		 		  	}else if(jsonMap == "Merchant Details Not Found"){
		 		  		isValid = false;
		 		  	}
		 		  	
		 		  	
 					if(isValid){
 	   		 		    if(jsonMap.currencyList.length > 1){
				 			 var container = '<div class="currencyListing"><ul>';
 				 			 for(var i=0;i<jsonMap.currencyList.length;i++){
				 				 container+=   '<li><input type="radio" name="currencyCode" value="'+jsonMap.currencyList[i]+'" >'+jsonMap.currencyList[i]+'</li>';
				 			 }
				 			 container+= '</ul>';
				 			 container+='<button type="button" id="Checkout_currency_btn" class="btn btn-buynow cart-small pull-left">Continue</button>'
				 			 container+= '</div>';	
				 			$("#currencyModal .modal-body").html(container);
							$("#currencyModal").find('.modal-header h4').html("<spring:message code='label.myaccount.chooseCurrency'/>");
				 			$("#currencyModal").show();
				 			$("#currencyModal ul li input:radio:first").attr('checked', true);
				 		  }else{
 				 			 $("#frmCheckOut").attr("action",jsonMap.merchantDeatils.paymentGatewayUrl);
		 	            	$("#merchant-id").val(jsonMap.merchantDeatils.merchantId);
		 	            	$("#merchant-pass").val(jsonMap.merchantDeatils.merchantPassword);
		 	            	$("#merchant-name").val(jsonMap.merchantDeatils.merchantName);
		         			$("#merchant-curr").val(jsonMap.merchantDeatils.currencyCode); 
		 					$("#frmCheckOut").submit();
				 		  }
					}else{
						$("#currencyModal .modal-body").html(jsonMap);
			 			$("#currencyModal").show();
			 			
					}
				},
				error : function(jqxhr, textStatus, error) {
				}
			});
         	
    	});


		function setAddress(obj) {
			var string = "";
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

		function setScreenAutoComplete(json, json1, json2) {
			// set selectedLanguage
			$("#languageList option").filter(function() {
				return $(this).attr('value') == json["selectedLanguage"];
			}).attr('selected', true);

			// Set BillToList with Default--
			var checkDefaultBillTO = false;
			var primaryShipToAddress = null;
			var billToList = json["billToAddresses"];
			var preferableBillTo = billToList[0];
			//var primaryBillToAddress = json["billToAddress"];
			/** INC-657: Start: anubhav.varma **/
			/***********************/
			var primaryBillToAddress = null;
			var billToAddresses = json2.billToAddresses;
			for(var i=0; i<billToAddresses.length;i++){
	            if(billToAddresses[i].is_default==true){
	               primaryBillToAddress = billToAddresses[i];
	               checkDefaultBillTO = true;
	         	   break;
	            }
	 	     }
			/** INC-657: End: anubhav.varma **/
			for (var i = 0; i < billToList.length; i++) { //loop through the array
				var obj = billToList[i];
				if (primaryBillToAddress!= null){
					if(typeof primaryBillToAddress!="undefined" && obj.addressId == primaryBillToAddress.addressId) 
					{
						checkDefaultBillTO = true;
						billToList.splice(i, 1);
					}
				}
			}
			var select = $('.billToList');
			select.find('option').remove();
			if (checkDefaultBillTO == true) {
				$('<option>').val(primaryBillToAddress.addressId).text(
						primaryBillToAddress.shortAddress).appendTo(
						select);
				preferableBillTo = primaryBillToAddress;
			}
			$.each(billToList, function(index, value) {
				$('<option>').val(value.addressId).text(
						value.shortAddress)
						.appendTo(select);
			});

			// Set ShipToList with Default--
			var checkDefaultShipTO = false;
			var billToShipToMap = json["billToShipToMap"];
			
			/** INC-657: Start: anubhav.varma **/
			var billToAddresses_1 = json2.billToAddresses;
			var shipToAddresses = billToShipToMap[billToAddresses_1[0].addressId];
			
			for(var i=0; i<shipToAddresses.length;i++){
	            if(shipToAddresses[i].is_default==true){
	            	//defaultShipToId = shipToAddresses[i];
	            	primaryShipToAddress = shipToAddresses[i];
	            	checkDefaultShipTO = true;
	            	break;
	            }
	 	     }			
			/** INC-657: End: anubhav.varma **/

			//var primaryShipToAddres = null;
			if (checkDefaultBillTO == true && primaryBillToAddress!=null && billToShipToMap!=null && primaryShipToAddress!=null) {
				//primaryShipToAddress = json["shipToAddress"];
				for (var i = 0; i < billToShipToMap[primaryBillToAddress.addressId].length; i++) { //loop through the array
					var obj = billToShipToMap[primaryBillToAddress.addressId][i];
					if (obj.addressId == primaryShipToAddress.addressId) {
						checkDefaultShipTO = true;

						billToShipToMap[primaryBillToAddress.addressId].splice(
								i, 1);
					}
				}
			}

			billToList = json1["billToAddresses"];
			billToShipToMap = json1["billToShipToMap"];

			for (var i = 0; i < billToShipToMap[preferableBillTo.addressId].length; i++) { //loop through the array
				var obj = billToShipToMap[preferableBillTo.addressId][i];

				if (primaryShipToAddress!=null)
				{
					if(obj.addressId == primaryShipToAddress.addressId)
					{
						checkDefaultShipTO = true;
						billToShipToMap[preferableBillTo.addressId].splice(i, 1);
					}
				}
			}

			var shipSelect = $('.shipToList');
			shipSelect.find('option').remove();
			if (checkDefaultShipTO == true) {
				$('<option>').val(primaryShipToAddress.addressId).text(
						primaryShipToAddress.shortAddress).appendTo(
						shipSelect);
				
				
				
			
				
			}
			$.each(billToShipToMap[preferableBillTo.addressId], function(index,
					value) {
				$('<option>').val(value.addressId).text(
						value.shortAddress)
						.appendTo(shipSelect);
			});

			billToList = json2["billToAddresses"];
			billToShipToMap = json2["billToShipToMap"];

			$('.BillToDetails').html(setAddress(billToList[0]));
			/*Set Shipto Address*/
			if (checkDefaultShipTO == true) {
				for (var i = 0; i < billToShipToMap[preferableBillTo.addressId].length; i++) { //loop through the array
					var obj = billToShipToMap[preferableBillTo.addressId][i];
					if (primaryShipToAddress!=null && obj.addressId == primaryShipToAddress.addressId) {

						$('.ShipToDetails')
								.html(
										setAddress(billToShipToMap[preferableBillTo.addressId][i]));
					}
				}

			} else {
				obj = json["shipToAddress"];
				$('.ShipToDetails')
						.html(
								setAddress(billToShipToMap[preferableBillTo.addressId][0]));
			}
		}

		/* $(document)
				.delegate(
						'.orgSection',
						'change',
						function() {
							alert($('.orgSection').index(this));
							var selectedOrganization = $(this).attr("id");
							document.location.href = "userprofile?selectedOrganization="
									+ selectedOrganization
									+ "&defaultTab=profileSetting&organizationTab="
									+ $('.orgSection').index(this);
						}); */
						
						$('.orgSection').on('change', function(){
							var selectedOrganization = $(this).val();
							document.location.href = "userprofile?selectedOrganization="
									+ selectedOrganization
									+ "&defaultTab=profileSetting&organizationTab="
									+ $('.orgSection').index(this);
						})
						
/* 		$(document)
				.delegate(
						'.shipToList',
						'change',
						function() {
							//setting Ship Details
							var selectedShipTo = $("option:selected", this)
									.val();
							var selectedOrganization = $(this).parents(
									'.shipto').siblings('.billto').find(
									'.organizationId').val();
							var selectedBillTo = $(this).parents('.shipto')
									.siblings('.billto').find(
											'.billToList option:selected')
									.val();
							alert(selectedShipTo + "..." + selectedOrganization
									+ "..." + selectedBillTo);
							alert("abc.." + abc);
							var val = '${profileDetailsVOJson}';
							var json = JSON.parse(val);
							var billToShipToMap = json["billToShipToMap"];
							alert(billToShipToMap);
							for (var i = 0; i < billToShipToMap[selectedBillTo].length; i++) { //loop through the array
								var obj = billToShipToMap[selectedBillTo][i];
								if (obj.addressId == selectedShipTo) {
									//Set Shipto Address  
									$('.ShipToDetails').html(setAddress(obj));
								}
							}
						}); */
					
						function setScreen(json, json1, json2) {
							// set selectedLanguage
							$("#languageList option").filter(function() {
								return $(this).attr('value') == json["selectedLanguage"];
							}).attr('selected', true);

							// Set BillToList with Default--
							var checkDefaultBillTO = false;
							var billToList = json["billToAddresses"];
							var preferableBillTo = billToList[0];
							var primaryBillToAddress = json["billToAddress"];
							for (var i = 0; i < billToList.length; i++) { //loop through the array
								var obj = billToList[i];
								if (typeof primaryBillToAddress!="undefined" && obj.addressId == primaryBillToAddress.addressId) {
									checkDefaultBillTO = true;
									billToList.splice(i, 1);
								}

							}
							var select = $('.billToList');
							select.find('option').remove();
							if (checkDefaultBillTO == true) {
								$('<option>').val(primaryBillToAddress.addressId).text(
										primaryBillToAddress.shortAddress).appendTo(
										select);
								preferableBillTo = primaryBillToAddress;
							}
							$.each(billToList, function(index, value) {
								$('<option>').val(value.addressId).text(
										value.shortAddress)
										.appendTo(select);
							});

							// Set ShipToList with Default--
							var checkDefaultShipTO = false;
							var billToShipToMap = json["billToShipToMap"];

							var primaryShipToAddres = null;
							if (checkDefaultBillTO == true) {
								primaryShipToAddress = json["shipToAddress"];
								for (var i = 0; i < billToShipToMap[primaryBillToAddress.addressId].length; i++) { //loop through the array
									var obj = billToShipToMap[primaryBillToAddress.addressId][i];
									if (obj.addressId == primaryShipToAddress.addressId) {
										checkDefaultShipTO = true;

										billToShipToMap[primaryBillToAddress.addressId].splice(
												i, 1);
									}
								}
							}

							billToList = json1["billToAddresses"];
							billToShipToMap = json1["billToShipToMap"];

							for (var i = 0; i < billToShipToMap[preferableBillTo.addressId].length; i++) { //loop through the array
								var obj = billToShipToMap[preferableBillTo.addressId][i];

								if (obj.addressId == primaryShipToAddress.addressId) {
									checkDefaultShipTO = true;
									billToShipToMap[preferableBillTo.addressId].splice(i, 1);
								}
							}

							var shipSelect = $('.shipToList');
							shipSelect.find('option').remove();
							if (checkDefaultShipTO == true) {
								$('<option>').val(primaryShipToAddress.addressId).text(
										primaryShipToAddress.shortAddress).appendTo(
										shipSelect);
							}
							$.each(billToShipToMap[preferableBillTo.addressId], function(index,
									value) {
								$('<option>').val(value.addressId).text(
										value.shortAddress)
										.appendTo(shipSelect);
							});

							billToList = json2["billToAddresses"];
							billToShipToMap = json2["billToShipToMap"];

							/*Set Billto Address*/
							$('.BillToDetails').html(setAddress(billToList[0]));

							/*Set Shipto Address*/
							if (checkDefaultBillTO == true) {
								for (var i = 0; i < billToShipToMap[preferableBillTo.addressId].length; i++) { //loop through the array
									var obj = billToShipToMap[preferableBillTo.addressId][i];
									if (obj.addressId == primaryShipToAddress.addressId) {

										$('.ShipToDetails')
												.html(
														setAddress(billToShipToMap[preferableBillTo.addressId][i]));
									}
								}

							} else {
								obj = json["shipToAddress"];
								$('.ShipToDetails')
										.html(
												setAddress(billToShipToMap[preferableBillTo.addressId][0]));
							}
						}			
						
						
						
						
	        function ValidatePassword(password) {

			var validPassword = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;

			if (!validPassword.test(password)) {
				return false;
			} else {
				return true;
			}
		}

		  function ValidatePhone(phone){

		    var validNumber=/^\d{10}$/;

		    if(!validNumber.test(phone)){
		      return false;
		    }else{
		      return true;
		    }
		  }
	</script>
</body>
</html>
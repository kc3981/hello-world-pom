<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dealer</title>
<jsp:include page="googleAnalytics.jsp" />

<link rel="stylesheet"
	href="../css/owl.carousel.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/bootstrap.min.css?version=${properties['application.version']}">
<link rel="stylesheet" type="text/css"
	href="../css/dealer.css?version=${properties['application.version']}" />
<link rel="stylesheet"
	href="../css/layouts.css?version=${properties['application.version']}" />
<link rel="stylesheet"
	href="../css/styles.css?version=${properties['application.version']}" />
<link rel="stylesheet"
	href="../css/layouts.responsive.css?version=${properties['application.version']}" />
<script type="text/javascript"
	src="../js/jquery.min.js?version=${properties['application.version']}"></script>
<script type="text/javascript"
	src="../js/bootstrap.min.js?version=${properties['application.version']}"></script>
<script type="text/javascript"
	src="../js/jquery.nicescroll.js?version=${properties['application.version']}"></script>

<link rel="stylesheet"
	href="../css/autocomplete.css?version=${properties['application.version']}">
<link rel="stylesheet"
	href="../css/jquery-ui.min.css?version=${properties['application.version']}">
<script
	src="../js/jquery-ui.min.js?version=${properties['application.version']}"></script>

<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
<script id="dealerSearchResult" type="text/x-jquery-tmpl">

		 	<div class="dealer-locate-content">
	     	<a  class="expand-dealer" id="add" onclick="addDealer(${'${'}intermediaryId},${'${'}organizationId})">
						expand
						</a>
						<div class="dealer-info">
							<h3>${'${'}intermediaryName}</h3>
							<p><spring:message code="label.dealer.code" /> : ${'${'}intermediaryCode}</p>
							<p><spring:message code="label.dealer.contact.no" />: ${'${'}phoneNumber}</p>
							<p><spring:message code="label.dealer.zip.code" /> : ${'${'}zipCode}</p>
							<p><spring:message code="label.bulkpartupload.organization" /> : ${'${'}organizationName}</p>
						</div>
					</div>
	</script>

<script type="text/javascript">
		$(document).ready(function() {
			$("html").niceScroll();
			$('div.dealer-left-content').niceScroll({
				cursorcolor : "#9da6bc",
				cursorborder : "1px solid #c9ceda"
			});
		});
		
	</script>

<script type="text/javascript">
	
	$(document).ready(function() {
		$("#dealerkeyword").autocomplete({
	
			source : function(request, response) {
				$.ajax({
					type : "post",
					url : "dealerAutocomplete?dealerkeyword="+request.term.toLowerCase(),
					dataType : "json",
					contentType : 'application/json;charset=ISO-8859-1',
					success : function(data) {
						response($.map(data, function(item)  {
							return {
								value : item.lable,
								data : item.value
							};
						}));
					},
				});
			},
			autoFocus : true,
			select : function(event, ui) {
				$('#dealerkeyword').val(ui.item.label);
				$('#dealerfuzzy').val(ui.item.data);
				return false;
			},
			minLength : 2 
		});
	});
 
	function performSearchMenu(){
		document.forms[0].action="dealerSearchrequest";
		document.forms[0].submit();
	} 
 
	
</script>
<!-- <script type="text/javascript">
$(function(){
	var obj = jQuery.parseJSON(result);
	var d, i;
})
</script> -->
<script>
   var test;
$(function(){
			$('#dealerSearch').click(function(){
				
				var dealerkeyword=$('#dealerkeyword').val();
				$.ajax({
						type: "POST",
						url: "dealerSearchrequest",
						data: {dealerkeyword: dealerkeyword},
						success: function(data){
							test=data;
						 var d  = JSON.parse(data);
						 for(i=0;i<d.length;i++){ 
							 if(i==0){
							 }else{
								 if(dealerkeyword==d[i].source.intermediaryName || dealerkeyword==d[i].source.city || dealerkeyword==d[i].source.state || dealerkeyword==d[i].source.zipCode || dealerkeyword==d[i].source.intermediaryCode ){
									 
								  						 
								 $("#dealerSearchResult").tmpl(d[i].source).appendTo(".dealer-right-content");	
								 }								 
							}
						  
						 }
				 
						},
						
				
						});	 
				});
			});
</script>

<script>
 function addDealer(intermediaryId,organizationId){
	
	var test1=JSON.parse(test);
	for(i=0;i<test1.length;i++){ 
			 $("a").attr('href', 
					 'adddealer?intermediaryId='+intermediaryId+'&organizationId='+organizationId); 
		 }
	 }

 function deleteDealer(intermediaryId,userOrganizationId){
		alert('Value :'+intermediaryId+'--'+userOrganizationId)
		window.location = 'deletedealer?intermediaryId='+intermediaryId+'&userOrganizationId='+userOrganizationId
	//	  $("a").attr('href','deletedealer?intermediaryId='+intermediaryId+'&userOrganizationId='+userOrganizationId);	 
	 }	 
	 
</script>


</head>
<body>
<%@ include file="googleAnalyticsbody.jsp" %>
	<div id="header-wrapper">
		<!-- header includes -->
		<script type="text/javascript"
			src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
		<!--  <script type="text/javascript"> $("#header").load("../menu.jsp");</script> -->
		<%@ include file="menu.jsp"%>
	</div>


	<section id="dealer-section">
		<div class="dealer-container">
			<div class="current-location">
				<ul class="breadcrumb">
					<li><a href="#"><spring:message code="label.footer.home" /></a>
					</li>
					<li class="active"><spring:message code="label.dealer.dealers" /></li>
				</ul>
			</div>
			<h2>
				<spring:message code="label.dealer.my.dealers" />
			</h2>
			<div class="dealer-left col-lg-4">
				<div class="dealer-left-header">
					<h3>
						<spring:message code="label.dealer.my.dealers" />
						<%--  ( <span><c:out value="${sessionScope.count}"/> </span> ) --%>
					</h3>
				</div>
				<div class="dealer-left-content">
					<div class="dealer-info-container">
						<c:forEach items="${listOfIntermediary}" var="myDealer"
							varStatus="index">
							<div class="dealer-left-content">
								<div class="dealer-info-container">

									<a class="mail-dealer"
										onClick="javascript:window.open('mailto:${myDealer.email}', 'mail');event.preventDefault()"
										href="mailto:${myDealer.email}"></a>

									<%-- 	<a class="mail-dealer" href="mailto:${myDealer.email}" target="_blank"></a> --%>

									<div class="dealer-info">

										<h3>${myDealer.intermediaryName}</h3>
										<p>
											<spring:message code="label.dealer.contact.no" />
											: ${'${'}phoneNumber}
										</p>
										<p>
											<spring:message code="label.dealer.code" />
											: ${'${'}intermediaryCode}
										</p>
										<p>
											<spring:message code="label.dealer.state" />
											: ${myDealer.state}
										</p>
										<div>
											<p>
												<spring:message code="view.label.email" />
												: ${myDealer.email}
											</p>
											<!-- <p>sales@meonparts.com</p>
									<p>www.meonports.com</p> -->
										</div>
									</div>
									<a class="delete-dealer"
										onclick=deleteDealer(${myDealer.intermediaryId},${myDealer.userOrgId})></a>
								</div>
							</div>
							<c:set var="count" scope="session" value="${index.count}" />
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="dealer-right col-lg-8">
				<div class="dealer-right-header col-lg-12">
					<h4>
						<spring:message code="label.dealer.locate.dealers" />
					</h4>
					<!-- <form action="dealerSearchrequest" method="POST"> -->
					<input class="locate-dealer" type="text" name="dealerkeyword"
						id="dealerkeyword"
						placeholder='<spring:message code="label.dealer.dealer.keyword"/>' />
					<span class="locate-dealer-result"></span> <input type="submit"
						id="dealerSearch" value="search">
					<!--	</form> -->
				</div>

				<div class="search">
					<!-- kanishka -->


				</div>

				<div class="dealer-right-content col-lg-12"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</section>
	<div class="clearfix"></div>
	<footer>
		<img src="../images/footer-chain.png" alt="">
		<div class="footer-container">
			<div class="social-media">
				<ul>
					<li><a id="facebook" href="">f</a></li>
					<li><a id="google-plus" href="">g+</a></li>
					<li><a id="twitter" href="">t</a></li>
					<li><a id="email" href="">@</a></li>
					<li><a id="youtube" href="">y</a></li>
				</ul>
			</div>
			<div class="links">
				<a href=""><spring:message code="label.footer.home" /></a> <a
					href=""><spring:message code="label.footer.product" /></a> <a
					href=""><spring:message code="label.footer.service" /></a> <a
					href=""><spring:message code="label.footer.aboutus" /></a> <a
					href=""><spring:message code="label.footer.contactus" /></a>
			</div>
			<div class="quick-links">
				<a href="">Quick Link</a> <a href="">Quick Link2</a> <a href="">Quick
					Link3</a> <a href="">Quick Link4</a> <a href="">Quick Link5</a>
			</div>
			<div class="copyrights">
				<spring:message code="label.footer.copy.rights" />
			</div>
		</div>
	</footer>

</body>
</html>
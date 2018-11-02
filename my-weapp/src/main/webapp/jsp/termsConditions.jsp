<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<!-- Favicon -->
<link rel="shortcut icon" href="../images/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<script src="../js/jquery.min.js?version=${properties['application.version']}" type="text/javascript"></script>

<style type="text/css">
.terms-condition .nav-tabs, .terms-condition .nav-tabs>li.active>a,
	.terms-condition .nav-tabs>li.active>a:hover, .terms-condition .nav-tabs>li.active>a:active,
	.terms-condition .nav-tabs>li.active>a:focus {
	border: 1px solid #fff;
}

.terms-condition ul li a:hover {
	background: none;
	border: 1px solid #fff;
	text-decoration: underline;
}

.terms-condition ul li a {
	font-size: 18px;
	text-transform: uppercase
}

.terms-condition {
	font-size: 17px;
}

.contentpane {
	padding: 10px 15px;
}

.topPad {
	padding-top: 20px;
}
</style>
</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<form method="post">
		<section class="container">
			<br />
			<div class="page-title breadCrumbsContainer topPad">
				<span class="" style="font-size: 20px;"><spring:message
						code="label.termsandconditions" /></span>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<br />
				<c:if test="${fn:length(organizationConfigMap) gt 1}">
					<div class="pull-right">
					<a id="expandAll" href="javascript:void(0);" class="btn"
						role="button"><spring:message
							code="label.termsandconditions.expand" /></a> <a id="collapseAll"
						href="javascript:void(0);" class="btn " role="button"><spring:message
							code="label.termsandconditions.collapse" /></a>
				</div>
				</c:if>	
			</div>
			<div class="clearfix hidden-xs"></div>
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<c:forEach items="${organizationConfigMap}" var="organizationConfig">
					<c:set var="replaceString" value="${organizationConfig.key}" />
					<c:set var="OrganizationId"
						value="${fn:replace(replaceString,' ','_')}" />
					<c:set var="organizationTerms" value="${organizationConfig.value}" />
					<div class="panel panel-default panelBody">
						<div class="panel-heading" role="tab" id="headingOne">
							<h3 class="panel-title">
								<a data-toggle="collapse" class="clickme"
									data-parent="#accordion"
									href='#<c:out value="${OrganizationId}" />'
									aria-expanded="false" aria-controls="collapseOne">${organizationMapDesc[organizationConfig.key]}
									<span class="pull-right"><spring:message
											code="label.termsandconditions.text.expand" /></span> <!--   INC - 2602: Terms and Conditions error :: changed by Kiran Aradhya :: Reviewed by JK -->
								</a>
							</h3>
						</div>
						<div id="${OrganizationId}" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body iframeHeight" id="termsDiv"
								style="height: auto; font-size: 20px;">
								<p class="terms-condition" id="${organizationTerms}">

									<script type="text/javascript"> 
							$.get('${properties['docserver.url']}?media=${organizationTerms}&publicDocuments=true',function(response){
								$('p#'+${organizationTerms}).html(response);
							});
				 		</script>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</form>
	<script src="../js/bootstrap.min.js?version=${properties['application.version']}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('.collapse').on('shown.bs.collapse', function(){
				$(this).parent().find('span').text('Collapse');
				}).on('hidden.bs.collapse', function(){
				$(this).parent().find('span').text('Expand');
				});
			
			$('#collapseAll').click(function(){
				  $('.panel-collapse.in')
				    .collapse('hide');
				});
			
			$('#expandAll').click(function(){
				  $('.panel-collapse:not(".in")')
				    .collapse('show');
				});
			
			/* $('a[data-toggle="collapse"]').click(function(){
			if($(this).attr('aria-expanded')==="false"){
				$(this).find('span').text('Collapse');
			}else{
				$(this).find('span').text('Expand');
			}
		}); */
		/* $('#expandAll').on('click',function(){
		    $('a[data-toggle="collapse"]').each(function(){
		        var objectID=$(this).attr('href');
		        if($(objectID).hasClass('in')===false)
		        {
		             $(objectID).collapse('show');
					 $(this).find('span').text('Collapse');
		        }
		    });
		});
		$('#collapseAll').on('click',function(){
		    $('a[data-toggle="collapse"]').each(function(){
		        var objectID=$(this).attr('href');
				if($(objectID).hasClass('in')===true)
		        {
		             $(objectID).collapse('hide');
					 $(this).find('span').text('Expand');
		        }
		    });
		}); */
		
		/* $('#pills-first a').hover(function (e) {
			e.preventDefault()
			$(this).tab('show');

			$(".clickme").click(function(){
				$(this).parents(".panel-heading").siblings(".panel-collapse").children().toggle(100);
			});
		}); */

		
		});
	</script>
</body>
</html>
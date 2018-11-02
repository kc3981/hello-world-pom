<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>


<jsp:include page="googleAnalytics.jsp" />

<link href="../css/bootstrap.css" rel="stylesheet" />

</head>
<body>
	<jsp:include page="googleAnalyticsbody.jsp" />
	<form method="post">
		<div class="container">
			<div class="row">
				<c:forEach items="${listOfPromotionPart}" var="promotions">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img u="image" src="../images/01.jpg" />
							<div class="caption">
								<h3>
									<spring:message code="search.part" />
									${promotions.promotionpartPK.partId}
								</h3>
								<!--Promotion   ID : ${promotions.promotionpartPK.promotionId}<br>-->
								<spring:message code="label.export.engineeringdescription" />
								: ${promotions.part.partDescription.engineeringDescription}<br>
								<spring:message
									code="label.promotionparts.commercial.description" />
								:${promotions.part.partDescription.engineeringDescription}<br>
								<spring:message
									code="label.promotionparts.promotion.description" />
								: ${promotions.promotionPart.promotionDesc.promotionDesc}<br>
								<!--Promotion Type : 	${promotions.promotionPart.promotionTypeId} <br>
					Discount Type 	:${promotions.promotionPart.discountTypeId} <br>
					Discount Value 	:${promotions.promotionPart.discountValue} 	    <br>        -->
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</form>
</body>
</html>
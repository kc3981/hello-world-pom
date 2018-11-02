<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="store-styles.jsp"%>
</head>
<body>
  <div id="content">
    <div class="row no-gutters mt-4">
      <div class="col-4 d-none d-sm-block">
        <jsp:include page="themed-side.jsp" />
      </div>
      <div class="col-12 col-sm-8">
        <div class="row no-gutters">
          <div class="col-5">
            <div class="branding-logo">
              <a class="logo-img-link" href="${properties['default.landing.page']}"></a>
            </div>
          </div>
        </div>
        <div class="row no-gutters mt-5">
          <div class="col-12 ">
            <h1 class="titles">
              Contact US - This will be developed as part of contact us story
            </h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../googleAnalyticsbody.jsp" />
  <%@ include file="store-scripts.jsp"%>
</body>
</html>
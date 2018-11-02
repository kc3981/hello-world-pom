<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${properties['global.page.title']}</title>
<%@ include file="store-styles.jsp" %>
<!-- Can add any specific styles to this page only here. -->
</head>
<body>
<%@ include file="sidebar.jsp" %>	
<!-- header container -->
<%@ include file="store-header.jsp"%>
<!-- Begin page content -->

	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb font-size-sm">
	    <li class="ml-5 breadcrumb-item"><a href="storeComingSoon"><spring:message code="label.home" /></a></li>
	    <li class="breadcrumb-item active" aria-current="page"><spring:message code="lable.quickorder.title" /></li>
	  </ol>
	</nav>
	
	<h1 class="m-3"><spring:message	code="lable.quickorder.title" /></h1>

    <%@ include file="orderupload-template.jsp"%>

	<div class="m-3 mb-5">
	<div class="">
        <div id="table" class="table-editable">
            <table class="table table-bordered table-responsive-md table-striped text-center">
                <tr>
                    <th class="text-center">Persons Name</th>
                    <th class="text-center">Age</th>
                    <th class="text-center">Company Name</th>
                    <th class="text-center">Country</th>
                    <th class="text-center">City</th>
                    <th class="text-center">Sort</th>
                    <th class="text-center">Remove</th>
                </tr>
                <tr>
                    <td class="pt-3-half" contenteditable="true">Aurelia Vega</td>
                    <td class="pt-3-half" contenteditable="true">30</td>
                    <td class="pt-3-half" contenteditable="true">Deepends</td>
                    <td class="pt-3-half" contenteditable="true">Spain</td>
                    <td class="pt-3-half" contenteditable="true">Madrid</td>
                    <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-down" aria-hidden="true"></i></a></span>
                    </td>
                    <td>
                        <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                    </td>
                </tr>
      <tr>
                    <td class="pt-3-half" contenteditable="true">Aurelia Vega</td>
                    <td class="pt-3-half" contenteditable="true">30</td>
                    <td class="pt-3-half" contenteditable="true">Deepends</td>
                    <td class="pt-3-half" contenteditable="true">Spain</td>
                    <td class="pt-3-half" contenteditable="true">Madrid</td>
                    <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-down" aria-hidden="true"></i></a></span>
                    </td>
                    <td>
                        <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                    </td>
                </tr>
                      <tr>
                    <td class="pt-3-half" contenteditable="true">Aurelia Vega</td>
                    <td class="pt-3-half" contenteditable="true">30</td>
                    <td class="pt-3-half" contenteditable="true">Deepends</td>
                    <td class="pt-3-half" contenteditable="true">Spain</td>
                    <td class="pt-3-half" contenteditable="true">Madrid</td>
                    <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-down" aria-hidden="true"></i></a></span>
                    </td>
                    <td>
                        <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                    </td>
                </tr>
                      <tr>
                    <td class="pt-3-half" contenteditable="true">Aurelia Vega</td>
                    <td class="pt-3-half" contenteditable="true">30</td>
                    <td class="pt-3-half" contenteditable="true">Deepends</td>
                    <td class="pt-3-half" contenteditable="true">Spain</td>
                    <td class="pt-3-half" contenteditable="true">Madrid</td>
                    <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-down" aria-hidden="true"></i></a></span>
                    </td>
                    <td>
                        <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                    </td>
                </tr>                
                <!-- This is our clonable table line -->
                <tr>
                    <td class="pt-3-half" contenteditable="true">Guerra Cortez</td>
                    <td class="pt-3-half" contenteditable="true">45</td>
                    <td class="pt-3-half" contenteditable="true">Insectus</td>
                    <td class="pt-3-half" contenteditable="true">USA</td>
                    <td class="pt-3-half" contenteditable="true">San Francisco</td>
                    <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fa fa-long-arrow-down" aria-hidden="true"></i></a></span>
                    </td>
                    <td>
                        <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                    </td>
                </tr>
                          </table>
        </div>
        </div>
        
</div>
<div class="m-2"> </div>
<!-- Editable table -->

<!-- footer container -->
<%@ include file="store-footer.jsp"%>
<!-- Can add any script references for this specific page here.	 Never replicate a reference here that is already in store-footer.jsp-->
<script src="../js/ps/orderoptions.js?version=${properties['application.version']}" type="text/javascript" ></script>
</body>
</html>
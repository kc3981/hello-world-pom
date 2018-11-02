<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header>

	<!-- Logo container -->
	<div class="fixed-top d-none d-md-block">
		<div
			class="header-container p-3 d-flex align-items-center justify-content-between">
			<div class="branding-logo">
				<a class="logo-img-link"
					href="${properties['default.landing.page']}"></a>
			</div>
			<div class="d-flex justify-content-end align-items-center w-100 pl-4">
				<div class="search-bar">
					<div class="input-group">
						<input id="keyword" name="keyword" type="text"
							class="form-control border-right-0 keyword ui-autocomplete-input"
							aria-label="Search" placeholder="Search for items.."
							autocomplete="off"> <span class="input-group-append">
							<span class="input-group-text btn-action px-3"> <i
								class="fa fa-search"></i>
						</span>
						</span>
					</div>
				</div>
				<%@ include file="store-user.jsp"%>
			</div>
		</div>
	</div>

	<!-- Fixed navbar -->
	<nav class="navbar-first navbar navbar-dark fixed-top p-0">
		<div class="nav-container d-md-flex">
			<div class="d-flex justify-content-between align-items-center">
			<div class="px-3">
				<a href="#" data-activates="slide-out" class="button-collapse"><i
					class="fa fa-bars hamburger-menu"></i></a>
			</div>

			<div class="branding-logo-sm mt-2 mb-2 d-md-none">
				<a class="logo-img-link d-content"
					href="${properties['default.landing.page']}"></a>
			</div>

			<div
				class="d-content d-md-none user-icons justify-content-center px-3">
				<!-- <a id="user-icon" href="#"><i class="fa fa-user"></i> <i class="fa fa-sort-desc"></i></a> -->
				<sec:authorize access="hasRole('ROLE_CART')">
					<a href="getshoppingdetails" class="ml-1"> <span
						class="ml-1 badge badge-light text-success cartItemCount">0</span>
						<i class="fa fa-lg fa-shopping-cart"></i>
					</a>
				</sec:authorize>
			</div>
			</div>
			<div class="d-content d-md-none input-group mt-1 px-3">
				<input id="keyword" name="keyword" type="text"
					class="form-control border-right-0 keyword ui-autocomplete-input"
					aria-label="Search" placeholder="Search for items.."
					autocomplete="off"> <span class="input-group-append">
					<span class="input-group-text "><i class="fa fa-search"></i></span>
				</span>
			</div>
			<div
				class="main-menu d-inline-flex w-100 align-self-center">
				<a class="nav-item nav-link d-none d-md-inline font-weight-normal"
					href="storeComingSoon"> <span class="d-none d-md-inline">
						<spring:message code="label.header.home" />
				</span>
				</a>
				<sec:authorize access="hasRole('ROLE_ORDER')">
					<a class="nav-item nav-link font-weight-normal" href="orderoptions">
						<span> <spring:message code="label.footer.quickorder" />
					</span>
					</a>
				</sec:authorize>
				<c:choose>
					<c:when test="${properties['facetSearch.required']}">
						<sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
							<a class="nav-item nav-link font-weight-normal" href="shopCentre">
								<span><spring:message code="label.header.shopforparts" /></span>
							</a>
						</sec:authorize>
					</c:when>
					<c:otherwise>
						<sec:authorize access="hasRole('ROLE_PRODUCT_CATALOG')">
							<a class="nav-item nav-link font-weight-normal"
								href="shopforparts"><span><spring:message
										code="label.header.shopforparts" /></span></a>
						</sec:authorize>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${properties['facetSearch.required']}">
						<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
							<a class="nav-item nav-link font-weight-normal"
								href="machinecentre"> <span><spring:message
										code="label.header.myvehicle" /></span>
							</a>
						</sec:authorize>
					</c:when>
					<c:otherwise>
						<sec:authorize access="hasRole('ROLE_MACHINE_CATALOG')">
							<a class="nav-item nav-link font-weight-normal"
								href="mymachine?sortSelect=catalogName"
								onclick="maskingForPage()"> <span> <spring:message
										code="label.header.myvehicle"></spring:message>
							</span></a>
						</sec:authorize>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="nav-item nav-link d-none d-md-inline-block">
				<sec:authorize access="hasRole('ROLE_CART')">
					<a href="getshoppingdetails" class="ml-1 d-flex flex-nowrap align-items-center"> <span
						class="ml-1 badge badge-light cartItemCount">0</span>
						<i class="fa fa-lg fa-shopping-cart"></i>
					</a>
				</sec:authorize>
			</div>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<a class="py-1 nav-item nav-link" href="#">Foo</a> <a
					class="py-1 nav-item nav-link" href="#">Fi</a> <a
					class="py-1 nav-item nav-link" href="#">Me</a>
			</div>
		</div>
	</nav>
</header>
<!-- These tags end in Store Header -->
<main role="main" class="viewport">
<div class="container-fluid viewport-container pl-0 pr-0">
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../js/chat.js?version=${properties['application.version']}" defer type="text/javascript"> </script>
<img class="footerlink hidden" src="../images/footer-chain.png">

<!-- GPD-10 Modal to be shown while checkout.Added by Pujith. Reviewed by Krupa. Starts. -->
<input type="hidden" id="continueAsGuest"
		value="${sessionScope['scopedTarget.genericUserProperties'].continueAsGuest}" />
<input type="hidden" id="isAGuestUser"
		value="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}" />
<!-- GPD-10 ENDS -->

<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<ul class="footer-menu-list">
				<!-- <li><a href="homepage"><spring:message code="label.footer.home"/></a></li> -->
				<%--             <li><a target="_blank" href="../htmls/under-construction-page.html"><spring:message code="label.footer.product"/></a></li>
	            <li><a target="_blank" href="../htmls/under-construction-page.html"><spring:message code="label.footer.service"/></a></li>
	            <li><a target="_blank" href="../htmls/under-construction-page.html"><spring:message code="label.footer.aboutus"/></a></li> --%>

				<!-- <li><a href="contact"><spring:message code="label.footer.contactus"/></a></li> -->
			</ul>
			
			<ul id="idlink" class="quick-links-list">
				<sec:authorize access="hasRole('ROLE_CREATE_DIRECT_QUOTE')">
						<li><a href="directquotebrand;" id="directquotebrand" onclick="return displayPrompt(this.id)"><span><spring:message
									code="label.footer.request.for.quote" /></span></a></li> <!-- Edited by Pujith for GPD-10. Reviewed by Krupa -->
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ORDER')">
				<!--GPD:2522 ROLE_PRICE authorization added by Pujith, reviewed by Venkatasiva Reddy-->
					<sec:authorize access="hasRole('ROLE_PRICE')">
							<li><a href="directorderbrand" id="directorderbrand"
								onclick="return displayPrompt(this.id)"><span><spring:message
											code="label.footer.place.order" /></span></a></li><!-- Edited by Pujith for GPD-10. Reviewed by Krupa -->
					</sec:authorize>
					<!--                 GS-3198-Stabilization Fix -->
					<li><a href="quickorder?type=speedorder"><span><spring:message
									code="label.speed.order" /></span></a></li>

					<li><a href="quickorder"><span><spring:message
									code="label.footer.quickorder" /></span></a></li>
				</sec:authorize>

				<c:choose>
					<c:when
						test="${sessionScope['scopedTarget.genericUserProperties'].isGuestUser}">
					</c:when>
					<c:otherwise>
						<sec:authorize access="hasRole('ROLE_BULKUPLOAD')">
							<li id="bulkuploadlink"><a href="cartbulkpartupload"><span><spring:message
											code="label.footer.bulk.upload" /></span></a></li>
						</sec:authorize>
					</c:otherwise>
				</c:choose>

				<sec:authorize
					access="hasRole('ROLE_ANALYTICS') or hasRole('ROLE_ANALYTICS_ADMIN')">
					<li><a href="${properties['kibana.analitics.link']}"
						target="_blank"><spring:message code="label.footer.analytics" /></a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="${properties['admin.link']}" target="_blank"><spring:message
								code="label.footer.admin" /></a></li>
				</sec:authorize>
				<!-- Terms & Service for all Users -->
				<c:if test="${properties['user.application']=='MILACRON'}">
					<li><a
						href="termsandconditions?selectedorganizations=1,2,3,4,5"
						target="_blank"><span> <spring:message
									code="message.register.terms" />
						</span></a></li>
					<li><a href="termsofuse" target="_blank"><span> <spring:message
									code="label.terms.use" />
						</span></a></li>
				</c:if>
			</ul>
		</div>
		<div class="copyright col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<p>
				<!-- <span><i class="fa fa-copyright" aria-hidden="true"></i>&nbsp;</span> Commenting this line for GSP-992-->
				<spring:message code="label.footer.copy.rights" />
				<span style="font-size: 10px; display: inline-block;"
					class="hidden-xs">${properties['application.version']}</span>
			</p>

			<!-- Build Version : 5.1.3.11 -->
		</div>
		<!--div class="social-media col-lg-4 col-md-4 col-sm-5 col-xs-12">
	        <ul class="nopadding">
	            <li><a href="javascript:void(0);" target="_blank"><img src="../images/social-fb.png" title="facebook"></a></li>
	            <li><a href="javascript:void(0);" target="_blank"><img src="../images/social-twitter.png" title="twitter"></a></li>
	            <li><a href="javascript:void(0);" target="_blank"><img src="../images/social-gplus.png" title="google-plus"></a></li>
	            <li><a href="javascript:void(0);" target="_blank"><img src="../images/social-mail.png" title="mail"></a></li>
	            <li><a href="javascript:void(0);" target="_blank"><img src="../images/social-youtube.png" title="youtube"></a></li>
	        </ul>
	    </div-->

	</div>
</div>
<!-- GPD-10 Modal to be shown while checkout.Added by Pujith. Reviewed by Krupa. Starts. -->
<div class="modal bs-example-modal-md" id="promptLoginModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content custom-modal-content" >
				<div class="modal-header custom-modal-header">
					<button type="button" class="close custom-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
					<h4 class="modal-title custom-modal-title">
						<spring:message code="label.prompt.login.title" />
					</h4>
				</div>
				<div class="modal-body custom-modal-body">
					<spring:message code="label.prompt.login" />
				</div>
				<div class="modal-footer custom-modal-footer">
						<a class="col btn"  href="javascript:void(0)"  id="checkoutContinueGuestButton" ><spring:message code="message.button.guest.continue" /></a>
						<a class="col btn"  href="javascript:void(0)"  id="checkoutLoginButton" ><spring:message code="message.login" /></a>
				</div>
			</div>
		</div>
</div>
<!-- GPD-10 ends -->
<!-- Added by Pujith to open directurls in new tab or new window. For GPD-10: Reviewed by Rajesh --starts-- -->
<script type="text/javascript">
    var  continueAsGuest = $('#continueAsGuest').val();
    var isGuestUser = $('#isAGuestUser').val();
    if(isGuestUser=='true' && continueAsGuest != 'true')
    	{
    		var redirectionurl=window.location.href.split("/").pop().split("?")[0];
    		var urls ='${properties['allowed.direct.urls']}';
    		var directurls=urls.split(",");
    		if (directurls.indexOf(redirectionurl)!=-1)
    			{
    				displayPrompt(window.location.href.split("/").pop());
    			}
    		
    		
    	}
    //--ends--
	
</script>
<script>
    //INC - 1846 modified by Vinay, Reviewed by Hari
    $(function(){
    	if ($(window).width() < 768) {
    		var bulkLink = $('ul#idlink').find('#bulkuploadlink');
    		$(bulkLink).find('a span').html()=="Bulk Upload Parts"? ($(bulkLink).css('display','none')):($(bulkLink).css('display','inline-block'));
    		} 
    });
    </script>
<div class="clearfix"></div>
<script type="text/javascript">
    /*SUPPORT MIL-215 210116*/ 
    /*INC-1083 Hide usersnap in Production*/
	   var flag='${properties['value.show.usersnap']}';
  		if(flag=="true"){
  		 (function() {
 	    	var s = document.createElement("script");
 	        s.type = "text/javascript";
 	        s. async  = true;
 	        s.src = '//api.usersnap.com/load/'+'${properties['usersnap.api.key']}';
 	        var x = document.getElementsByTagName('script')[0];
 	        x.parentNode.insertBefore(s, x);
 	        })(); 		
	  		}
	
	</script>
</div>
<!-- Chat Icon-->
<c:if test="${properties['user.application']=='MILACRON'}">
	<div title="ClickChat"
		style="position: fixed; bottom: 0px; left: 0px; z-index: 99999;">
		<a href="javaScript:popupChatWindow('../web/chat');"> <img
			src="../images/chat/ChatIcon.png" alt="ChatCall"
			style="width: 76px; height: 89px;">
		</a>
	</div>
</c:if>

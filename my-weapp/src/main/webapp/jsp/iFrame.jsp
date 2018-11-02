<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../css/IFrameStyleSheet.css?version=${properties['application.version']}">
<link rel="stylesheet" href="../css/bootstrap.min.css?version=${properties['application.version']}">
<!-- Added for BU theme -->
<c:if test="${not empty sessionScope.themeFile1}">
	<link rel="stylesheet" type="text/css"
		href="${sessionScope.themeFile1}">
</c:if>
<!-- link used for BU theme ended -->

<jsp:include page="googleAnalytics.jsp" />

<script
	src="../js/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/less.min.js?version=${properties['application.version']}"></script>


<script src="${dIeCommUrl}/Scripts/XIFrame/XIFrame-1.1.0.js?v=3.7.0.12"
	type="text/javascript" language="javascript"></script>
<script text="text/javascript">
         function IFrame_OnLoad() {
            var iframe = document.getElementsByName('dieCommFrame');
            if (iframe) {
            	console.log("iFrame=="+iframe);
                 $XIFrame.onload({
                        iFrameId: 'dieCommFrame',
                        targetUrl: iframe[0].getAttribute("src"),
                         autosizeheight: true,
                        autosizewidth: true,
                        onCardTypeChange: function(e) { },
                        onSuccess: function (msg) {
                            console.log('A form for the merchant guid and access token combination is loading in the iFrame successfully.');
                        },
                        onError: function (msg) {
                            console.log('A form for the merchant guid and access token combination has FAILED to load.');
                        }
                    });
            }
        }
         
        function submitform() {
            var iframe = document.getElementsByName('dieCommFrame');
   		  var randomId = 	$('#randomId').val();
             if (iframe) {
                $XIFrame.submit({
                    iFrameId: 'dieCommFrame',
                    targetUrl: iframe[0].getAttribute("src"),
                    onSuccess: function (msg) {
                    	console.log(msg)
                         var message = JSON.parse(msg);
                         if (message && message.data.HasPassed) {
                             var rememberMe =  "false";
                              if(document.getElementById('RememberMeCheckbox') != null && document.getElementById('RememberMeCheckbox').checked) {
                            	rememberMe = "true";
                            }
                 			$('#param1').val(rememberMe);
                         } else {
                   			$('#status').val('cancel');
                          }
                     	$('div.pageLoader').show();
               			$('#message').val(msg);
                        $('#iFrameHandler').attr("action","iFrameHandler");
     					$('#iFrameHandler').submit();
                    },
                    onError: function (msg) {
               			$('#status').val('cancel');
               			$('#message').val(msg);
                        $('#iFrameHandler').attr("action","iFrameHandler");
     					$('#iFrameHandler').submit();
                      }
                });
            }
        }
        
        function cancel(){
        	$('div.pageLoader').show();
        	$('#status').val('cancel');
   			$('#message').val('cancel');
            $('#iFrameHandler').attr("action","iFrameHandler");
			$('#iFrameHandler').submit();
         }
    </script>
<style>
html, body, .sampleBody {
	height: 100%
}

header {
	color: #000000;
	background: #FFFFFF;
	/* border-bottom: 5px solid #910a0a; */
}

.logo-wrap {
	padding: 5px;
	color: #fff;
}

header h3 {
	line-height: 14px;
	text-align: center;
}

.iframe-packetxml {
	white-space: pre-wrap;
	width: 775px;
	height: 550px;
	overflow-x: auto;
}

.sampleBody {
	background: #e8ecef !important
}

#IFrame {
	border: 1px solid transparent;
	min-height: 400px !Important;
	width: 100% !Important;
	height: 100% !important;
}

.controlsbtn {
	margin-top: 10px;
	vertical-align: middle;
	width: 350px;
}

.btn-pay {
	/* background-color: #910a0a;
	border-color: #910a0a; */
	color: #fff
}

.btn-pay:hover, .btn-pay:focus {
	/* background-color: #7d0000;
	border-color: #7d0000; */
}

.btn-cancel {
	background-color: #313131;
	border-color: #313131;
	color: #fff
}

.btn-cancel:hover, .btn-cancel:focus {
	background-color: #1b1b1b;
	border-color: #1b1b1b;
}

.controlsbtn {
	vertical-align: middle;
	width: 400px;
	margin: 0 auto;
}

.line-sep {
	border-color: #ccc;
	width: 500px;
}

.btnStyle {
	padding-bottom: 15px;
}
</style>
</head>
<body>

	<jsp:include page="googleAnalyticsbody.jsp" />

	<div class="sampleBody">
		<header>
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-2 col-xs-4 brand">
					<a class="hidden-xs hidden-sm"
						href="${properties['default.landing.page']}"> <img
						id="headerlogo" src="${sessionScope.logo}" alt=""> <!--   <img id="headerlogo" src="https://store.milacron.com/gensuite-logo/milacron-logo.png" alt=""> -->
					</a> <a class="visible-xs visible-sm"
						href="${properties['default.landing.page']}"> <img
						id="headerlogo" src="${sessionScope.iPadLogo}" alt="">
					</a>
				</div>
				<div class="col-lg-8">
					<h3>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="lblHeader">Payment Checkout</span>
					</h3>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</header>
		<div class="payment-content">
			<div class="billing-content">
				<div class="billing-header">Welcome ${name} , Please complete
					this form to process your payment</div>
				<hr class="line-sep">
				<div class="billing-info">
					<div id="iframewrapper">
						<iframe id="IFrame" src="${iFrameUrl}" name="dieCommFrame"
							onload="IFrame_OnLoad();return false;" width="100%" height="100%"></iframe>
						<div id="rememberMeDiv"
							style="text-align: center; margin-left: 10px;">
							${IsGuestUser}</div>
						<hr class="line-sep" style="margin-top: 5px">
						<div class="btnStyle">
							<button onclick="submitform();return false;"
								class="IFrameButton btn-pay">Pay</button>
							<button onclick="cancel();return false;"
								class="IFrameButton btn-cancel">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form name="iFrameHandler" id="iFrameHandler" method="post">
			<input type="hidden" id="AccessToken" name="id"
				value="${accessToken}" /> <input type="hidden" id="SignedToken"
				name="s" value="${signature}" /> <input type="hidden"
				id="iframeUrl" value="${iFrameUrl}" /> <input type="hidden"
				id="randomId" name="randomId" value="${randomId}" /> <input
				type="hidden" id="status" name="status" value="" /> <input
				type="hidden" id="message" name="message" value="" /> <input
				type="hidden" id="param1" name="param1" value="" />
	</div>

	<div class="pageLoader" style="display: none">
		<div class="loader-content">
			<h4>
				<spring:message code="label.footer.loading" />
				...
			</h4>
			<div class="loader"></div>
		</div>
	</div>
</body>
</html>
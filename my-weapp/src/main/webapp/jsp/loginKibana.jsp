<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Login to Kibana</title>


<jsp:include page="googleAnalytics.jsp" />

<link rel="shortcut icon" href="static/images/favicon.ico"
	type="image/x-icon" />
<!-- Bootstrap Core CSS -->
<link
	href="../css/bootstrap-dialog.min.css?version=${properties['application.version']}"
	rel="stylesheet">
<!--   <link rel="stylesheet" href="static/css/jquery-ui.min.css"> -->
<!-- Custom CSS -->
<link
	href="../css/bootstrap.min.css?version=${properties['application.version']}"
	rel="stylesheet" type="text/css" />
<!-- Custom Fonts -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="../js/jquery.min.js?version=${properties['application.version']}"
	type="text/javascript"></script>
<script
	src="../js/bootstrap.min.js?version=${properties['application.version']}"></script>
<script
	src="../js/bootstrap-dialog.min.js?version=${properties['application.version']}"></script>

</head>
<script type="text/javascript">
$(document).ready(function() {
	$('#login-btn').click(function(e){
		var user = $('#userId').val();
		var password = $('#password').val();
		if(user == ""){
			BootstrapDialog.alert("Please Enter Email Id");			
		}else if(password == ""){
			BootstrapDialog.alert("Please Enter Password");
		}else{
		  $.ajax({
			type: "post",
			url: "authenticate_kibana",
			data:{
				'userName':user,
				'password':password
			},
            success: function(data) {
            	if(data == 'VALID_USER'){
            		 window.location.href = "${properties['kibana.link']}";
            	}else if(data == 'INVALID_USER_CREDENTIALS'){
            		BootstrapDialog.alert("Invalid User Credentials");
            	}else if(data == 'USER_DOES_NOT_HAVE_PREVILAGES'){
            		BootstrapDialog.alert("User Does not have previlages to view");
            	}else if(data == 'INVALID_USER_NAME'){
            		BootstrapDialog.alert("Invalid Email id.");
            	}
				},failure:function(){
					alert("Authentication failed");
				}
        }); 
	}
});
});
</script>
<body>

	<jsp:include page="googleAnalyticsbody.jsp" />
	
	<div class="container-fluid" id="page-wrapper">
		<img id="headerlogo" src="${sessionScope.logo}" alt="">
		<hr />
		<div class="container">
			<div class="col-md-6">
				<form id="loginform">
					<fieldset>
						<legend>Login to Kibana:</legend>
						<div class="form-group">
							<label>Email Id</label> <label style="color: red;">*</label> <input
								type='text' id="userId" class="form-control" name='userId'
								size="40" tabindex="1" />
						</div>
						<div class="form-group">
							<label>Password</label> <label style="color: red;">*</label> <input
								type='password' id="password" class="form-control"
								name='password' size="40" tabindex="2" />
						</div>
						<input class="btn btn-primary" id="login-btn" type="button"
							value="Login" class="login_class" tabindex="3"> <input
							class="btn btn-danger" type="reset" value="Reset"
							class="login_class" tabindex="4">
					</fieldset>
				</form>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
</body>
</html>
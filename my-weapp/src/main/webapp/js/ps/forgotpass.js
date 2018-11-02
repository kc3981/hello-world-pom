//This JS file is specifically for forgot password related functionality.
$(function(){
	hideLoader();	
});


function validate(){
	var emailvalue = $('#forgot-password-form input[name="email"]').val();
	if(!validateEmail(emailvalue)){
		$("#email_forgot").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
		$("#email_forgot").focus();
		return false;
	}else{
		return true;
	}
};

$("#email_forgot").focusout(function(){
	$("#email_forgot").css("box-shadow","none");
});

$(".dropdown-menu>li>a").on('click',function(){
	  var languageId = $(this).attr('id');
	  var languageCode=$("#lang_"+languageId).val(); 
	  $("#select-option >button").html(languageCode);
});


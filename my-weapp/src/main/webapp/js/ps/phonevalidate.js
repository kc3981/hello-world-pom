function validatePhone(phone){
  var validNumber=/^\d{10}$/;
  if(!validNumber.test(phone)){
    return false;
  }else{
    return true;
  }
}

function validatePassword(keyup){
  var passwordRequirementMet = false;
  if(keyup){
    $("#password_register").siblings('#error-info-password').show();
  }
  var pass=$("#password_register").val();
  var error = $("#password_register").siblings("#error-info-password");
  if(pass != "" && pass != "undefined" ){ 
    if(pass.length >= 8){
      error.children('#min-8-char').css("color","#009933");
      $('#min-8-char').children('i').removeClass("text-secondary");
    }else if(pass.length < 8){
      error.children('#min-8-char').css("color","#ced4da");
      $('#min-8-char').children('i').addClass("text-secondary");
    }else{
      error.children('#min-8-char').css("color","#ced4da");
    }
    
    if(pass.match(/[0-9]/)){
      error.children('#one-number').css("color","#009933");
      $('#one-number').children('i').removeClass("text-secondary");
    }else{
      error.children('#one-number').css("color","#ced4da");
      $('#one-number').children('i').addClass("text-secondary");
    }
    var passwordSplCharMatch = false
    if(pass.match(/[!@#$%^&*]/)){
      error.children('#one-special').css("color","#009933");
      $('#one-special').children('i').removeClass("text-secondary");
      passwordSplCharMatch = true;
    }else{
      error.children('#one-special').css("color","#ced4da");
      $('#one-special').children('i').addClass("text-secondary");
    }
    if(pass.length >= 8 && pass.match(/[0-9]/) &&passwordSplCharMatch){
       $(this).css("border","1px solid #ced4da");
       $('#error-info-password').delay(1000).fadeOut();
       passwordRequirementMet = true;
    }else{
      $(this).css("border","2px solid #FF1744");
    }
  }else{
    if(keyup){
      $("#error-info-password").children("li").css("color","#ced4da");
    }
  }
  return passwordRequirementMet;
}

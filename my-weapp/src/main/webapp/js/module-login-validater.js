/*************************************************
/*! Gensuite - v1.0.0
/*  Copyright (c) 2016 Genalpha; Licensed 
/*		Login Modules
/*		Description: Input Validator - Helper Classes.
/*		Developer: Dibu John
/**************************************************/
var System = System || {};
if(!System.Classes){
	System.Classes ={};
}
System.Classes.Validater = function(){
};

System.Classes.Validater.prototype.ValidateEmail = function(email){

    var validEmail=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if(!validEmail.test(email)){
      return false;
    }else{
      return true;
    }
};

System.Classes.Validater.prototype.ValidatePassword = function(password){

	var validPassword =/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;

	if(!validPassword.test(password)){
	  return false;
	}else{
	  return true;
	}
};

System.Classes.Validater.prototype.ValidatePhone = function(phone){

	var validNumber=/^\d{10}$/;

	if(!validNumber.test(phone)){
	  return false;
	}else{
	  return true;
	}
};

System.Classes.Validater.prototype.getUrlParameter = function (sParam){
	var spageurl=window.location.search.substring(1);
	var sUrlvar=spageurl.split('&');
	for(var i=0;i<sUrlvar.length;i++)
	{
		var sparameter=sUrlvar[i].split('=');
		if(sparameter[0]==sParam)
		{
			return sparameter[1];
		}
	}
};

System.Classes.Validater.prototype.loadBundles = function() {
  var lang = document.getElementById('language_id_').value;
	jQuery.i18n.properties({
		name:'messages', 
		path:'../localization/', 
		mode:'both',
		language:lang 
		/*callback: function() { 
			$("#msg_welcome").text($.i18n.prop('msg_welcome')); $("#msg_selLang").text($.i18n.prop('msg_selLang', lang)); 
		}*/
	});
};

System.Classes.Validater.prototype.validateUserCredentials = function(userName,password){
	
	if(userName==null || password==null){
		return false;
	}
	else if(userName=="" || password==""){
		return false;
	}
	else if(!ValidateEmail(userName) && !ValidatePassword(password)){
		return false;
	}
	else{
		return true;
	}
};

System.Classes.Validater.prototype.validateForm= function(id){
	var validInputs = $(id + ' span.check-pass').length - $(id + ' span.check-pass.check-fail').length;
	var termsAgreed = $('#agree-terms').is(':checked');
	if(validInputs === 9 && termsAgreed){
		return true;
	}else{
		var pendingInputs = $(id + ' span.check-pending');
		//var emptyText='Please fill out this field';
		pendingInputs.each(function(){
			$(this).removeClass('check-pending').addClass('check-fail');
			var invalidInput = $(this).prev('input');
			if(invalidInput){
				invalidInput.removeClass('input-valid').addClass('input-invalid');
				/*if(invalidInput.attr('type')!=='password'){
					invalidInput.val(emptyText);
				}*/
			}else{
				$(this).prev('dl.multiselect-list').removeClass('input-valid').addClass('input-invalid');
			}
			
		});

		if(!termsAgreed){
			$('.terms p').show();
		}
		return false;
	}
};
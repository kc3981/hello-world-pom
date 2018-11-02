/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(document).ready(function(){
	var  myErrObj = new errnsp.errHandling.init();
	loadBundles();
	var selector = '.overlay-footer li';

	$(selector).on('click', function(){
	    $(selector).removeClass('nav_first');
	    $(this).addClass('nav_first');
	});
	var activeLanguage = $("#activeLanguage").val();
  if(activeLanguage == "English"){
      $(".overlay-footer li:nth-child(1)").addClass("nav_first");  
  }
  if(activeLanguage == "Español"){
        $(".overlay-footer li:nth-child(4)").addClass("nav_first");
  }
   if(activeLanguage == "Deutsch"){
        $(".overlay-footer li:nth-child(2)").addClass("nav_first");
  }
  if(activeLanguage == "Français"){
        $(".overlay-footer li:nth-child(3)").addClass("nav_first");
  }
	/* document on click function */
  $(document).on('click',function(e){
  	var $clicked = $(e.target);
      if (!$clicked.parents().hasClass("multiselect-list")){
      	if($(".multiselect-list dd ul").is(':visible')){
      	var brandSelected=false;
      	$('.mutliSelect input[type="checkbox"]').each(function(){
      		if($(this).is(':checked'))brandSelected=true;
      	});
      	if(brandSelected){
      		$('.multiselect-list').next('span').removeClass('check-fail check-pending').addClass('check-pass');
            $('.multiselect-list').removeClass('input-invalid').addClass('input-valid');
      	}else{
      		$('.multiselect-list').next('span').removeClass('check-fail check-pending').addClass('check-fail');
      		$('.multiselect-list').removeClass('input-valid').addClass('input-invalid');
      	}
      }
      $(".multiselect-list dd ul").hide();
      } 
  });
	/* Multi select List Box */
  $(".multiselect-list dt a").on('click', function () {

      if($(".multiselect-list dd ul").is(':visible')){
      	var brandSelected=false;
      	$('.mutliSelect input[type="checkbox"]').each(function(){
      		if($(this).is(':checked'))brandSelected=true;
      	});
      	if(brandSelected){
      		$('.multiselect-list').next('span').removeClass('check-fail check-pending').addClass('check-pass');
            $('.multiselect-list').removeClass('input-invalid').addClass('input-valid');
      	}else{
      		$('.multiselect-list').next('span').removeClass('check-fail check-pending').addClass('check-fail');
      		$('.multiselect-list').removeClass('input-valid').addClass('input-invalid');
      	}
      }
      $(".multiselect-list dd ul").slideToggle('fast');
    });
	
  /* Multi select check Box clicked */
  
	 $('.mutliSelect ').delegate('input[type="checkbox"]','change', function () {
      
        var title = $(this).closest('.mutliSelect').find('li').text(),
            title = $(this).parent().text();
						value = $(this).val();
            
      
        if ($(this).is(':checked')) {
        		if( $('.selected-items').children().length > 0){
        			title = "," + title;
        		}
            var html = '<span data-title="' + value + '">' + title + '</span>';
            $('.selected-items').append(html);
            $(".multiselect-title").hide();
        } 
        else {
        	var currentItem = $('.selected-items span[data-title="'+value+'"]');
        	if(currentItem.is(':first-child')){
        		var nextItem = currentItem.next();
        		if(nextItem){
        			nextItem.text(nextItem.text().slice(1,nextItem.text().length));
        		}
        	}
            $('span[data-title="' + value + '"]').remove();
            var ret = $(".multiselect-title");
           
            $('.multiselect-list dt a').append(ret);
            if($('.selected-items').text()===""){
              $(".multiselect-title").show();
            }
        }
    });
	
//Input Validation for Register and Login screens
  $('#agree-terms').on('change',function(){
	  $("#error").text("").css("display","none");
  	if($(this).is(':checked')){
  		$('.terms p').hide();
  	}else{
  		if(!$('.multiselect-list ').next('span').hasClass('check-fail'))
  			$('.terms p').show();
  	}
  });

  $('#register-form input').on('blur',function(e){

  var type=e.currentTarget.type;
  var value=e.currentTarget.value;
  value= value.trim();
  var name = e.currentTarget.name;
  var emptyText='Please';
  var invalidEmailText= $.i18n.prop('label.forgotpassword.email.invalid');
  var invalidPasswordText=$.i18n.prop('label.forgotpassword.invalid.password');
  var invalidNumberText=$.i18n.prop('label.forgotpassword.invalid.phone.number');

  loadBundles();
  
    switch(type){
      case 'text' :  if(value === ''){
		                $(this).removeClass('input-valid').addClass('input-invalid');
		                $(this).next('span').removeClass('check-fail check-pending').addClass('check-fail');
		              }else if(name === 'phone'){
		              	if(value){
		              		if($(this).intlTelInput("isValidNumber")){
		                    $(this).data('number',$(this).intlTelInput("getNumber"));
		                    $(this).parent().next('span').removeClass('check-fail check-pending').addClass('check-pass');
		                    $(this).removeClass('input-invalid').addClass('input-valid');
		                        
		                  }else{
		                      $(this).removeClass('input-valid').addClass('input-invalid');
		                      this.value=invalidNumberText;
		                      $(this).parent().next('span').removeClass('check-pass check-pending').addClass('check-fail');
	                     }
		                      
		              	}
	                  }else{
	                    $(this).next('span').removeClass('check-fail check-pending').addClass('check-pass');
	                  }
              break;
      case 'email': if(value === ''){
                $(this).removeClass('input-valid').addClass('input-invalid');
                //this.value=emptyText;
                $(this).next('span').removeClass('check-fail check-pending').addClass('check-fail');
              }else if(!ValidateEmail(value)){
                $(this).removeClass('input-valid').addClass('input-invalid');
                this.value=invalidEmailText;
                $(this).next('span').removeClass('check-pass check-pending').addClass('check-fail');
                      
              }else{
                $(this).removeClass('input-invalid').addClass('input-valid');
                $(this).next('span').removeClass('check-fail check-pending').addClass('check-pass');
              }
              break;
      case 'password' :   if($(this).prevAll('input[type="password"]').length !== 0 ){
                  var password=$(this).prevAll('input[type="password"]');
                  if(password[0].value==="" || password.next().hasClass('check-fail') || this.value !== password[0].value){
                    $(this).removeClass('input-valid').addClass('input-invalid');
                    $(this).next('span').addClass('check-fail');
                  }else{
                    $(this).next('span').removeClass('check-fail check-pending').addClass('check-pass');
                  }
                }
                else{
                  if(!ValidatePassword(value)){
                  $(this).removeClass('input-valid').addClass('input-invalid');
                  $(this).next('span').removeClass('check-pass check-pending').addClass('check-fail');

                }else{
                	 var prevValue = $("#password_register").val();
					 var confirmPassword = $("#confirm_password_register").val();
					if (confirmPassword != null && confirmPassword != '' && prevValue !== confirmPassword) {
	                      $(this).next('span').removeClass('check-pass check-pending').addClass('check-fail');
					}else{
						$(this).next('span').removeClass('check-fail check-pending').addClass('check-pass');
					}
                }
              }
               break;

      default : console.log('unknown');
                  break;
    }
  });
  
  $('#forgot-password-form input').on('blur',function(e){
  	 var type=e.currentTarget.type;
  	 var value=e.currentTarget.value;
  	 var invalidEmailText=$.i18n.prop('label.forgotpassword.email.invalid');
  	 var invalidNumberText=$.i18n.prop('label.forgotpassword.invalid.phone.number');
  	 loadBundles();
  	 switch(type){
  	 	case 'email':   if(ValidateEmail(value)){
  	 						$('input[name = "phone"]').removeClass('input-invalid').prop('disabled',true).val("");
  	 					}else{
  	 						//$(this).val(invalidEmailText)
  	 						  $(this).removeClass('input-valid').addClass('input-invalid');
  	 						//$('input[name = "phone"]').prop('disabled',false);
  	 					}
  	 					break;

  	 	case 'text' :   if($.trim(value)){
	  	 						if($(this).intlTelInput("isValidNumber")){
	  	 						$(this).data('number',$(this).intlTelInput("getNumber"));
	  	 						$('input[type = "email"]').removeClass('input-invalid').prop('disabled',true).val("");
	  	 					}else{
	  	 						$(this).val(invalidNumberText);
	  	 						$(this).removeClass('input-valid').addClass('input-invalid');
	  	 						$('input[type = "email"]').prop('disabled',false);
	  	 					}
  	 					}
  	 					break;
  	 	default:break;
  	 }
  });
 
  $('#register-form input , #forgot-password-form input').on('focus',function(e){
            
      if($(this).hasClass('input-invalid')){
        $(this).removeClass('input-invalid').addClass('input-valid');
        this.value="";
        if($(this).parent().attr('id')==="register-form")
          $(this).next('span').removeClass('check-fail').addClass('check-pending');
      }

    }); 

 /*
 * Register Page
 */

	var languageId;
	var langSelection = false;
	$("#languageList a").on("click", function(){
		languageId = this.id;
		langSelection = true;
		$("div.dropdown").next("span").removeClass("check-pending check-fail").addClass("check-pass");
	})
	$('#register-submit').on('click',function(e){
		if(langSelection === true){
			$("div.dropdown").next("span").removeClass("check-pending").addClass("check-pass");
		}else{
			$("div.dropdown").next("span").removeClass("check-pending").addClass("check-fail");
		}
		 if(validateForm('#register-form')){
			var brandValues="";
			$('p.selected-items span').each(function(){
				brandValues+=$(this).data('title')+",";
			}); 
			var firstName = $("#firstName").val();
			var lastName = $("#lastName").val();
			var phone = $("#phone_register").data('number');
			var email = $("#email_register").val();
			var password = $("#password_register").val();
			var terms = $("#agree-terms").val();
			var company = $("#companyName").val();
			
			var customerAccount= $("#customerAccount").val();
			var address= $("#address").val();
			var notes= $("#notes").val();
			/*var languageId=$('#languageList option:selected').val();*/
			$.ajax({
				type : "POST",
				//INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE
				dataType:"json",
				data :{firstName:firstName,lastName:lastName,organization:brandValues,phone_register:phone,email_register:email,password_register:password,termsandcondition:terms,companyName:company,languageId:languageId},
				url : "register",
				success : function(response) {	
					//INC-1801 : CHANGED BY ANIKET : SPECIAL CHARACTER ISSUE
					console.log(response);
					var result = response;
					   if(!result.userRegistered){
							   $("#error").text(result.message).css("display","block");
					   }
					    
					   else{
						     $("#success").text(result.message);
						     $("#registered-modal").modal('show');
					     }
				},
				error:function(e){
					}
			});	
				
		 }else{
				
		 }
		 e.preventDefault();
	  });
 
	//LOAD ORGANIZATION FOR DROP-DOWN
	 
	  $.ajax({
		type: "GET",
		async:false,
		url: "getorganization",
		success: function(data){
			var d = JSON.parse(data);
		//	alert('Data '+data);
			var multiSelect = $('div.mutliSelect');
			var unorderedList = $('<ul></ul>');
				for (i =0; i< d.length; i++) {
					var listItems = $('<li><input type="checkbox" value='+d[i].organizationId+'>&nbsp; '+d[i].organizationName+'</li>');
					listItems.appendTo(unorderedList);
				}
				unorderedList.appendTo(multiSelect);
		},
		error: function(e){
		}
	});	

	//USER - LOGIN ACTION CALL
	
	$("#signin-form").submit(function(event){
		var userName= $('#Username').val();
		var password= $('#Password').val();
		var rememberMe = $('#remember-me').is(":checked");
		var status=validateUserCredentials(userName,password); ////07-01-2015  5.5.1.0_EH_UserName Password Validatoin At Clint Side _Kanishka
		if(status){
			//if(ValidateEmail(userName) && ValidatePassword(password)){
				event.preventDefault();	
				$('div.pageLoader').show();
				$.ajax({
				type: "POST",
				url: "userlogin",
				data: {userName: userName,password: password, rememberMe: rememberMe},	
				success: function(data){
					//20-01-2016-EH-Removed all Conditional Check
			         var outputData = JSON.parse(data);
 			         if(outputData.flag == true){
							window.location.href=outputData.message;
							
			         }else{
						$(".error-login").text(outputData.message);
						
						$('div.pageLoader').hide();
					}
 			        $('p.error-login').show();

				},																					
				error: function(e){
					console.log( e);																				
				}
			});
		}
		else{
			event.preventDefault();
			
			 if($('#tnc-checkbox').is(":checked")) {
				 $('p.tcmsg').hide();
				 $('p.error-login').show();
			     $(".error-login").text($.i18n.prop('message.badCredentials'));
			    } else{
			    	 
			    	  $('p.tcmsg').show();
			    	  $('p.error-login').show();
			    	} 
			
			
			
		}
		
	});	
	
	


	function termsOfService(event) {
		if ($('#tnc-checkbox').is(":checked")) {
			$("#signin-form").trigger('submit');
			$('p.tcmsg').hide();
			

		} else {
			event.preventDefault();
			$('p.tcmsg').show();
			$('p.error-login').hide();
			
		}				
	}

	$('#loginUser').click(function(event) {

		termsOfService(event);
		
	});				
	
	
	
	//cheking user name ,password null or empty
	function validateUserCredentials(userName,password){
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
	}
	
	//FORGOT PASSWORD ACTION
	$('#forgot-password-submit').click(function(e){
		e.preventDefault();
	 	var inputs=$('#forgot-password-form :input');
		var values = {};
		inputs.each(function() {
			values[this.name] = $(this).val();
			});
		values['phone'] = $('#phone-forgotpassword').data('number');
		if($('#forgot-password-form :input').hasClass('input-invalid')){	
			// Empty Validation
			$('#forgot-password-form').find('p.validation-message').text($.i18n.prop('label.forgotpasswords.warning.message'));
			return true;
		}else{
		$(this).find('p.validation-message').text(""); 
				$('div.pageLoader').show();
			     $.ajax({
			      type: "POST",
			      dataType:"json",
			      url: "forgotPassword",
			      //contentType: 'application/json',
			                 // mimeType: 'application/json',
			      data: {"email" :(values['email'])?(values['email']):"", "phoneNumber" :""},
			      success: function(data){
 			            var d = data;
			            if(d.resultMessage=='success'){
			            		$('#emailforgot').text(d.resultValue);
			            		$('.login-content').children('.signin-section').hide(); 
			            		$('.login-content').children('#password-sent-modal').show();
			            	}else {
			            		$('#forgot-password-form').find('p.validation-message').text(d.resultMessage);
			              		$('input').prop('disabled',false);
			            		}  
									$('div.pageLoader').hide();
			      		},
			       error: function(error){
 			       }
			       
			    });  
 			}
     
		});
		 //Terms and Condition 
		 
		$('#termsAndCond').on('click',function(e){
	    	var orgArray="";
			$('p.selected-items span').each(function(){
				orgArray+=$(this).attr('title')+",";
			}); 
        if(orgArray == null || orgArray == ""){
           $('.terms p.select-brand').show();
      	return false;
        }else{
        	$('.terms p.select-brand').hide();
          window.open("termsandconditions?selectedorganizations="+orgArray); 
        }
      });
	//Extracted from JSP
	
	var error_product_permission = getUrlParameter('error');
    if(error_product_permission=='true')  {        	
    	  var msg = productCatalogfeature_msg;
          myErrObj.raise("500",msg,"500");
      }
       
    $('#Username').focus();
    
  //14.1.2016  5.5.1.0_EH_Checking_product_catalog_check_for_guest_user_added_start
    function getUrlParameter(sParam)
    {
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
    }
	//Extracted from forgot JSP
    
    $('#forgot-password-form input').val('').removeClass('input-invalid');
    if($("#forgot-password-form")[0]){
    	$('input[type="email"]').focus();
    }
	$("#phone-forgotpassword").intlTelInput({
		defaultCountry : "us",
		/*geoIpLookup: function(callback) {
		  $.get('http://ipinfo.io', function() {}, "jsonp").always(function(resp) {
		    var countryCode = (resp && resp.country) ? resp.country : "";
		    callback(countryCode);
		  });
		},*/
		utilsScript : "../js/utils.js" // just for formatting/placeholders etc
	});
	/* var flagPosition = $("#phone-forgotpassword").css('margin-left');
	 $('.intl-tel-input .flag-dropdown').css({'left':flagPosition});*/
	$('.country-list > li').each(function() {
		var countryName = $(this).find('span.country-name');
		countryName.text(countryName.text().split(' (')[0]);
	});
	
	$(".back-link").click(function() {
		document.location.href = "login";
		//International phone init
	});

	$('.languageClick').click(function() {
		var languageId = $(this).attr('id');
		$.ajax({
			type : "get",
			cache : false,
			url : "setlocale",
			data : "languageId=" + languageId,
			dataType : "json",
			contentType : 'application/json;charset=ISO-8859-1',
			success : function(data) {
				location.reload();
			}
		});
	});
    
    document.ondblclick = function(evt) {
        if (window.getSelection)
            window.getSelection().removeAllRanges();
        else if (document.selection)
            document.selection.empty();
    }
    
});
$('.languageClick').click(function(){
	var languageId = $(this).attr('id');
	$.ajax({
	  type : "get",
	  cache: false,
	  url : "setlocale",
	  data : "languageId=" + languageId,
	  dataType : "json",
	  contentType : 'application/json;charset=ISO-8859-1', 
	  success : function(data) {
		  window.location.reload();
	  }
	 });
});

$('#guestLogin').click(function(){
	window.location.href = 'guestlogin';
})

//14.1.2016  5.5.1.0_EH_Checking_product_catalog_check_for_guest_user_using_feature_access_map_added
	$(".custom-close").click(function(){
		$("#myModal").hide();
});

  function ValidateEmail(email){

    var validEmail=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if(!validEmail.test(email)){
      return false;
    }else{
      return true;
    }
  }

  function ValidatePassword(password){

    var validPassword =/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;

    if(!validPassword.test(password)){
      return false;
    }else{
      return true;
    }
  }

  function ValidatePhone(phone){

    var validNumber=/^\d{10}$/;

    if(!validNumber.test(phone)){
      return false;
    }else{
      return true;
    }
  }
  function validateForm(id){

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
  }
  
  function loadBundles() {
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
	}
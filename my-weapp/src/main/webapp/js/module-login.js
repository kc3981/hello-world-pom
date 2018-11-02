/*************************************************
/*! Gensuite - v1.0.0
/*  Copyright (c) 2016, 2017 Genalpha; Licensed
/*		Login Modules
/*		Description: Functional scripts and validation scripts for Login, Forgot-password, Register page.
/*		Developer: Dibu John
/**************************************************/

var Systems = Systems || {};
if(!Systems.Classes){
	Systems.Classes ={};
}
Systems.Classes.Validater = function(){
};
Systems.Classes.globalHelper = function(){
	var setLanguage = function(evt){
		var languageId = $(evt.target).attr('id');
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
	};

    var manageSelection = function(evt) {
        if (window.getSelection)
            window.getSelection().removeAllRanges();
        else if (document.selection)
            document.selection.empty();
    };
    var clickBack = function(){
		document.location.href = "login";
    };

    this.bindEvents = function(){

		$('.languageClick').click(function(evt){
			setLanguage(evt);
		});

		document.ondblclick = function(evt) {
			manageSelection(evt);
		};
		$(".back-link").click(function(evt){
			clickBack();
		});
	};
};

Systems.Classes.Validater.prototype.ValidateEmail = function(email){

    var validEmail=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if(!validEmail.test(email)){
      return false;
    }else{
      return true;
    }
};

//INC-2391 starts(Developed by : Swetha)
Systems.Classes.Validater.prototype.ValidateUserName = function(userName){
   
    var validUserName = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if(!validUserName.test(userName)){
      return false;
    }else{
      return true;
    }
};
//INC-2391 ends

Systems.Classes.Validater.prototype.ValidatePassword = function(password){

	var validPassword =/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,100}$/;

	if(!validPassword.test(password)){
	  return false;
	}else{
	  return true;
	}
};

Systems.Classes.Validater.prototype.ValidatePhone = function(phone){

	var validNumber=/^\d{10}$/;

	if(!validNumber.test(phone)){
	  return false;
	}else{
	  return true;
	}
};

Systems.Classes.Validater.prototype.getUrlParameter = function (sParam){
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

Systems.Classes.Validater.prototype.loadBundles = function() {
	 var lang = document.getElementById('language_id_').value;
	  $.ajax({
			type: "GET",
			async:false,
			url: "getLanguage",
			success: function(response){
			    var scriptContent = $($.parseHTML(response, document, true)).filter('script').text();
			    $.globalEval(scriptContent);
			},
			error: function(e){
			}
		});	
};

Systems.Classes.Validater.prototype.validateUserCredentials = function(userName,password){

	if(userName==null || password==null){
		return false;
	}
	else if(userName=="" || password==""){
		return false;
	}
	else if(!this.ValidateEmail(userName) && !this.ValidatePassword(password)){
		return false;
	}
	else{
		return true;
	}
};

Systems.Classes.Validater.prototype.validateForm= function(id){
	var toValidateInputs = 8;
	if( $('#dealerVal').val()!=undefined){
		toValidateInputs = parseInt(toValidateInputs)+1;
		
	}
	if( $('#addressRequired').val()!=undefined && $('#addressRequired').val()== 'true'){
		toValidateInputs = parseInt(toValidateInputs)+1;
	}
	if( $('#phoneNumberRequired').val()!=undefined && $('#phoneNumberRequired').val()== 'true'){
		toValidateInputs = parseInt(toValidateInputs)+1;
	}
	if( $('#companyNameRequired').val()!=undefined && $('#companyNameRequired').val()== 'true'){
		toValidateInputs = parseInt(toValidateInputs)+1;
	}
	
	var validInputs = $(id + ' span.check-pass').length - $(id + ' span.check-pass.check-fail').length;
	var termsAgreed = $('#agree-terms').is(':checked');
	//INC-2391 starts(Developed by : Swetha)
	if(validInputs === toValidateInputs && termsAgreed){
	//INC-2391 ends
		return true;
	}else{
		var pendingInputs = $(id + ' span.check-pending');
		//var emptyText='Please fill out this field';
		pendingInputs.each(function(){
			$(this).removeClass('check-pending').addClass('check-fail');
			var invalidInput = $(this).prev('input');
			var invalidTextArea = $(this).prev('textarea');
			if(invalidInput || invalidTextArea){
				invalidInput.removeClass('input-valid').addClass('input-invalid');
				invalidTextArea.removeClass('input-valid').addClass('input-invalid');
				/*if(invalidInput.attr('type')!=='password'){
					invalidInput.val(emptyText);
				}*/
			}else{
				$(this).prev('dl.multiselect-list').removeClass('input-valid').addClass('input-invalid');
				$(this).prev('#address').removeClass('input-valid').addClass('input-invalid');
				//$(this).siblings('.dropdown').find('#dropdownMenu').addClass('input-invalid');
			}

		});

		if(!termsAgreed){
			$('.terms p').show();
		}
		return false;
	}
};

Systems.Classes.globalHelper.prototype = Object.create(Systems.Classes.Validater.prototype);

Systems.Classes.globalHelper.prototype.pageloadSettings = function(){
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

    var errHandler = new Systems.errHandling().init();
    var error_product_permission = Systems.Classes.Validater.prototype.getUrlParameter('error');
    if(error_product_permission=='true')  {
		var msg = productCatalogfeature_msg;
		errHandler.raise("500",msg,"500");
  	}
}();
// Systems.Classes.globalHelper.prototype.bindEvents = function(){
// 	this.pageloadSettings();
// };

Systems.Classes.userLogin = function(){
	var helperObj;
	this.bindEvents = function(){
		helperObj = new Systems.Classes.globalHelper();
		helperObj.loadBundles();
		helperObj.bindEvents();
		$('#guestLogin').click(function(){
			//START Bring From MILACRON_CODE_BASE ,in Product we have window.location.href=guestlogin;
			//INC-2597 : ADDED BY POOJA : POP-UP MESSAGE ON CLICK OF CONTINUE AS GUEST : Reviewed by Rajesh Chinnam

			//Guest login link updated by Aniket for INC-2882
			//Guest login link updated with parameter promptContinueGuest. Added by Pooja.H.S. Reviewed by Rajesh
 			/*var customMessage=strings['message.guest.log'].concat(" <div class='loginbtn_wrapper'><span class='loginbutton'>").concat(strings['message.button.guest.continue'].link("guestlogin?promptContinueGuest=true&forceGuest=true")).concat("</span> <span class='guestbutton'>").concat(strings['message.login'].link("login")).concat("</span></div>") Edited by Pujith for GPD-10. Reviewed by Krupa 
 			$('.modal-body').html(customMessage);*/ 			
 			var customMessage = strings['message.guest.log'];
			var customMessageFooter = strings['message.button.guest.continue'].link("guestlogin?promptContinueGuest=true&forceGuest=true").concat(" ").concat(strings['message.login'].link("login?forceLogin=true"));/* Edited by Pujith for GPD-10. Reviewed by Krupa */
			$('.modal-body').html(customMessage);
 			$('.modal-footer').html(customMessageFooter);
 			$('.modal-footer a').addClass('col btn'); 			
			$("#myModal").show();
			$('.modal-footer a:first-child').focus();
			//window.location.href=guestlogin;
			//END Bring From MILACRON_CODE_BASE ,in Product we have window.location.href=guestlogin;
		});
		
		$(".custom-close").click(function(){
			closeModal();
		});
		/*$("#signin-form").submit(function(event){
			submitLoginForm(event);
		});*/
		$('#loginUser').click(function(event) {
			//START Bring From MILACRON_CODE_BASE termsOfService(event); is Product code
			//Commented by Rajesh for INC-1263
			//termsOfService(event);
			submitLoginForm(event);
		});
		$('#Username').focus();
	};
	 $(document).keyup(function(e) {	 
		  if (e.keyCode === 27) $('.close').click();   // esc
	  }); 
	var termsOfService = function(event) {

 		if ($('#tnc-checkbox').is(":checked") || document.getElementById("terms").value == "false") {
			/*$("#signin-form").trigger('submit');*/
			submitLoginForm(event);
			$('p.tcmsg').hide();
		} else {
			event.preventDefault();
			$('p.tcmsg').show();
			$('p.error-login').hide();
		}
	};

	var submitLoginForm = function(event){
		var userName= $('#Username').val();
		var password= $('#Password').val();
		var rememberMe = $('#remember-me').is(":checked");
		var status=helperObj.validateUserCredentials(userName,password);
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
			         }else if(outputData.flag == false && outputData.agreedterms == false){
			        	 $('.termDetail ul').empty();
			        	 var orgMsg= outputData.message.split(',');

			        	 $.each(orgMsg,function(i){

			        		 $("#TermsModal").find('.termDetail ul').append('<li>'+ orgMsg[i]+ '</li>')

			        	 });

			        	 $("#TermsModal").modal('show');
						 //alert(outputData.message);
			        	 $('div.pageLoader').hide();

					}else{
						$(".error-login").text(outputData.message).show();
						$('div.pageLoader').hide();
					}
				},
				error: function(e){
					console.log( e);
				}
			});
		}
		else{
			event.preventDefault();
			$(".error-login").text(strings['message.badCredentials']);
		}
	};

	var closeModal = function(){
    	$("#myModal").hide();
    };
};

Systems.Classes.userRegister = function(){
	var languageId;
	var langSelection = false;
	var helperObj;

	this.bindEvents = function(){
		helperObj = new Systems.Classes.globalHelper();
		helperObj.bindEvents();
		$(document).on('click',function(evt){
		  	hideMultiselectDrpDwn(evt);
	  	});
		/* Multi select List Box */
	  	$(".multiselect-list dt a").on('click', function (evt) {
	      	toggleMultiselectDrpDwn(evt);
	    });
	  	/* Multi select check Box clicked */
	 	$('.mutliSelect').on('change','input[type="checkbox"]', function (evt) {
	        multiSelectDelegate(evt);
	    });
	    $('#termsAndCond').on('click',function(evt){
			termsAndCondOnClick(evt);
		});
		$("#languageList a").on("click", function(evt){
			onlangSelection(evt);
		});
		$('#register-submit').on('click',function(evt){
		$("#error").text("").css("display","none");
			if($('#agree-terms').is(":checked")) {
			submitRegister(evt);
			$('p.tcmsg').hide();

			}else{
				event.preventDefault();
				$('p.tcmsg').show();
			}
		});
		$('#agree-terms').on('change',function(evt){
			onAgreeTermsChange(evt);
		});
		$('#register-form input, #register-form textarea#address ').on('blur',function(evt){
			onRegFormInput_lostFocus(evt);
		});
		$('#password_register').change(function(evt){
	    	onpasswordReg_change(evt);
	    });
		
		
		getOrganization();
	    otherInitSettings();
	};

	var otherInitSettings = function(){
	 	$('span.multiselect-title').on('mouseenter',function(evt){
            var $this = $(evt.target);
            if(this.offsetWidth < this.scrollWidth && !$this.parent('a').attr('title')){
                $this.parent('a').attr('title',$this.text());
            }
        });
        $('span.multiselect-title').parent('a').on('swipeleft',function(evt){
            var $this = $(evt.target);
            if($this.attr('title')){
                $this.children('span.multiselect-title').css({'text-indent':'-50px'});
            }
        }).on('swiperight',function(evt){
            var $this = $(evt.target);
            if($this.attr('title')){
                $this.children('span.multiselect-title').css({'text-indent':'0px'});
            }
        });

    	$("ul.dropdown-menu>li").on("click", function(evt){
    		var listV =  $(evt.target).text();
    		/* $(this).parents(".dropdown.open").find("button").text(listV); */
    		document.getElementsByTagName("button")[0].childNodes[0].nodeValue = listV;
    	});
    	$('input[type=text]').each(function() {
		   	$(this).val('');
	 	});

    	if($('#password_register').val() != ""){
    		$('#password_register').val("");
    	}

        $('#firstName').focus();
        windowHeight = $(window).height();
        registerResponsive();
        increaseDocumentHeight();

        //International phone init
        $("#phone_register").intlTelInput({
      		defaultCountry: "us",
     	 	utilsScript: "../js/utils.js" // just for formatting/placeholders etc
        });
        $(window).resize(increaseDocumentHeight);
        $('.country-list > li').each(function(){
            var countryName=$(this).find('span.country-name');
            countryName.text(countryName.text().split(' (')[0]);
        });

	    $(document).on('keypress',function(e){
			if(e.which === 13){
			$('#register-submit').click();
			}
	 	});

	    $(document).on('keypress',function(e){
			if(e.which === 13){
				$('#register-submit').click();
			}
		});
            //on window resize apply responsive changes
        $( window ).resize(function(){
            registerResponsive();
        });
	};

	var hideMultiselectDrpDwn = function(evt){
		var $clicked = $(evt.target);
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
	};

	var toggleMultiselectDrpDwn = function(evt){
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
	};

	var multiSelectDelegate = function(evt){
		var title = $(evt.target).closest('.mutliSelect').find('li').text(),
            title = $(evt.target).parent().text();
						value = $(evt.target).val();

        if ($(evt.target).is(':checked')) {
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
	};

	var termsAndCondOnClick = function(){

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
	};
	var getOrganization = function(){
		$.ajax({
			type: "GET",
			async:false,
			url: "getorganization",
			success: function(data){
				var d = JSON.parse(data);
			//	alert('Data '+data);
				var multiSelect = $('div.mutliSelect');
				var unorderedList = $('<ul></ul>');
				var listItems ;
					for (i =0; i< d.length; i++) {
						listItems = $('<li><input type="checkbox" id="brandSelect" value='+d[i].organizationId+'>&nbsp; '+d[i].organizationName+'</li>');
						listItems.appendTo(unorderedList);
					}
					unorderedList.appendTo(multiSelect);
					//if only one organization, select that organization by default. Added by Pooja :Reviewd By Hari Shankar
					if(d.length == 1){
						$("#brandSelect").eq(0).attr('checked', true);
						var html = '<span data-title="'+d[0].organizationId+'">' + listItems.eq(0).text() + '</span>';
			            $('.selected-items').append(html);
			            $(".multiselect-title").hide();
			            $(".multiselect-list").next("span").removeClass("check-pending check-fail").addClass("check-pass");
					}
			},
			error: function(e){
				alert('Error: ' + e);
			}
		});
	};

	var onlangSelection = function(evt){
		languageId = evt.target.id;
		langSelection = true;
		$("div.dropdown").next("span").removeClass("check-pending check-fail").addClass("check-pass");
	};

	var submitRegister = function(e){
		if($('#tnc-checkbox').is(":checked") || document.getElementById("terms").value == "false") {
			$('p.tcmsg').hide();
	 		//$('p.error-login').hide();
			//START Bring From MILACRON_CODE_BASE IF else is commeted in Milacron
			if(langSelection === true){
				$("div.dropdown").next("span").removeClass("check-pending").addClass("check-pass");
			}else{
				$("div.dropdown").next("span").removeClass("check-pending").addClass("check-fail");
			}
		 	if(helperObj.validateForm('#register-form')){
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
				//INC-2391 starts(Developed by : Swetha)
				var user_name = "";
				if( $("#user_name").val()!=undefined){
					user_name = $("#user_name").val();
				}
				//INC-2391 ends
				var phoneCountry = undefined;
				if( $('#phoneNumberRequired').val()!=undefined && $('#phoneNumberRequired').val()== 'true'){
					var arr=$('.selected-flag').find('div.iti-flag').attr('class').split(" ");
					phoneCountry = arr[1];
				}
				console.log(phoneCountry);
				var customerAccount= $("#customerAccount").val();
				var address= $("#address").val();
				var notes= $("#notes").val();
				var salesPerson = $("#salesPerson").val();
				var optIn=$("#opt-in").is(":checked");
				var dealerId = null;
				if( $("#dealerVal").val()!=undefined){
					dealerId = $("#dealerVal").val();
				}
				
				$.ajax({
					type : "POST",
				//INC-1801 : ADDED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
				dataType:"json",
				data :{firstName:firstName,lastName:lastName,organization:brandValues,phone_register:phone,email_register:email,user_name:user_name,password_register:password,termsandcondition:terms,companyName:company,languageId:languageId
					,customerAccount:customerAccount,address:address,notes:notes,salesPerson:salesPerson,phoneCountry:phoneCountry,optIn:optIn,dealerId:dealerId},

					url : "register",
					success : function(response) {
						//INC-1801 : CHANGED BY ANIKET : SPECIAL CHARACTER ISSUE : Reviewed by Hari
						var result = response;
					   	if(!result.userRegistered){
					   		$("#error").html(result.message).css("display","block");
					   	}
					   	else{
				     		$("#success").text(result.message);
				     		$("#registered-modal").modal('show');
				     		//Remove the backdrop that appears on top of registered modal.
				     		$("#registered-modal").find('.modal-backdrop').removeClass('in');
				     	}
					},
					error:function(e){
						console.log('error:'+e)
					}
				});

		 	}else{
		 		
		 	}
		 	e.preventDefault();
		}
		else
		{
	 		$('p.tcmsg').show();
	 		$('p.error-login').hide();
			$("#error").text(result.message).css("display","block");
		}
	};

	var onAgreeTermsChange = function(){
	  	if($(this).is(':checked')){
	  		$('.terms p').hide();
	  	}else{
	  		if(!$('.multiselect-list ').next('span').hasClass('check-fail'))
	  			$('.terms p').show();
	  	}
	};

	var onRegFormInput_lostFocus = function(e){
		var type=e.currentTarget.type;
		var value=e.currentTarget.value;
		value= value.trim();
		var name = e.currentTarget.name;
		var emptyText='Please';
		var invalidEmailText= strings['label.forgotpassword.email.invalid'];
		var invalidPasswordText=strings['label.forgotpassword.invalid.password'];
		var invalidNumberText=strings['label.forgotpassword.invalid.phone.number'];
		var invalidUserName=strings['label.forgotpassword.userName.invalid'];
		var targetObj = e.currentTarget;
	    switch(type){
	      case 'text' :  if(value === ''){
			                $(targetObj).removeClass('input-valid').addClass('input-invalid');
			                $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-fail');
			              }else if(name == 'user_name'){
			            	  if(!helperObj.ValidateUserName(value)){
			  	                $(targetObj).removeClass('input-valid').addClass('input-invalid');
			  	                $(targetObj).val(invalidUserName);
			  	                $(targetObj).next('span').removeClass('check-pass check-pending').addClass('check-fail');
			  	              }else{
			  	            	$(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
			  	              }			            	  
			              }	      
	      				else if(name === 'phone'){
			              	if(value){
			              		if($(targetObj).intlTelInput("isValidNumber")){
			                    $(targetObj).data('number',$(targetObj).intlTelInput("getNumber"));
			                    $(targetObj).parent().next('span').removeClass('check-fail check-pending').addClass('check-pass');
			                    $(targetObj).removeClass('input-invalid').addClass('input-valid');

			                  }else{
			                      $(targetObj).removeClass('input-valid').addClass('input-invalid');
			                      $(targetObj).val(invalidNumberText);
			                      $(targetObj).parent().next('span').removeClass('check-pass check-pending').addClass('check-fail');
		                     }

			              	}
		                  }else if(name === 'dealerId'){
		                	  if(value === ''){
					    		  $(targetObj).removeClass('input-valid').addClass('input-invalid');
					    		 // $(targetObj).val('Please Fill in your Address');
					    		  //targetObj.value=emptyText;
					    		  $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-fail');
					    	  }else{
					    		  $(targetObj).removeClass('input-invalid').addClass('input-valid');
					    		  $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
					    	  }
			              }else{
		                    $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
		                  }
	              break;
	      case 'email': if(value === ''){
	                $(targetObj).removeClass('input-valid').addClass('input-invalid');
	                //targetObj.value=emptyText;
	                $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-fail');
	              }else if(!helperObj.ValidateEmail(value)){
	                $(targetObj).removeClass('input-valid').addClass('input-invalid');
	                $(targetObj).val(invalidEmailText);
	                $(targetObj).next('span').removeClass('check-pass check-pending').addClass('check-fail');

	              }else{	            	  
	            	  var email = $("#user_name").val();
						 var confirmEmail = $("#email_register").val();
						if (confirmEmail != null && confirmEmail != '' && email !== confirmEmail) {
		                      $(targetObj).next('span').removeClass('check-pass check-pending').addClass('check-fail');
						}else{
							$(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
							$(targetObj).removeClass('input-invalid').addClass('input-valid');
						}					
	              }
	              break;
	      case 'password' :   if($(targetObj).prevAll('input[type="password"]').length !== 0 ){
	                  var password=$(targetObj).prevAll('input[type="password"]');
	                  if(password[0].value==="" || password.next().hasClass('check-fail') || $(targetObj).val() !== password[0].value){
	                    $(targetObj).removeClass('input-valid').addClass('input-invalid');
	                    $(targetObj).next('span').addClass('check-fail');
	                  }else{
	                    $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
	                  }
	                }
	                else{
	                  if(!helperObj.ValidatePassword(value)){
	                  $(targetObj).removeClass('input-valid').addClass('input-invalid');
	                  $(targetObj).next('span').removeClass('check-pass check-pending').addClass('check-fail');

	                }else{
	                	 var prevValue = $("#password_register").val();
						 var confirmPassword = $("#confirm_password_register").val();
						if (confirmPassword != null && confirmPassword != '' && prevValue !== confirmPassword) {
		                      $(targetObj).next('span').removeClass('check-pass check-pending').addClass('check-fail');
						}else{
							$(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
						}
	                }
	              }
	               break;
	      				case 'textarea':
					    	  if(value === ''){
					    		  $(targetObj).removeClass('input-valid').addClass('input-invalid');
					    		 // $(targetObj).val('Please Fill in your Address');
					    		  //targetObj.value=emptyText;
					    		  $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-fail');
					    	  }else{
					    		  $(targetObj).removeClass('input-invalid').addClass('input-valid');
					    		  $(targetObj).next('span').removeClass('check-fail check-pending').addClass('check-pass');
					    	  }
					    	  
					    	  break;

	      default : console.log('unknown');
	                  break;
	    }
	};

    var onpasswordReg_change = function(){
    	if($('#confirm_password_register').val()==''){
    	}else{
    		$('#confirm_password_register').val('');
        	$('#confirm_password_register').next('span').removeClass('check-pending').addClass('check-fail');
    	}
    };

	var increaseDocumentHeight = function(){
        currentHeight = window.innerHeight ||
             document.documentElement.clientHeight ||
             document.body.clientHeight;

        if(currentHeight < windowHeight || windowHeight < 400){
            $('.overlay-content').css({'height':'150%'});
        }else{
            $('.overlay-content').css({'height':'70%'});
        }

    };

    var registerResponsive = function(){
        //This is to align all the icons in register page - responsive!
        var errorIcon = $('span.check-pending');
        var failIcon = $('span.check-fail');
        var passIcon = $('span.check-pass');
        var phoneIcon = $('span.aria-code');
        var helpIcon = $('a.help-button');
        
        if(errorIcon.length >0){
        	var parentWidth = errorIcon.parent().outerWidth();
            var siblingWidth = errorIcon.prev().outerWidth();
            var offset = (parentWidth - siblingWidth) / 2;
            var errorIconPosition = offset - errorIcon.width();
        }else{
        	var parentWidth = failIcon.parent().outerWidth();
            var siblingWidth = failIcon.prev().outerWidth();
            var offset = (parentWidth - siblingWidth) / 2;
            var errorIconPosition = offset - failIcon.width();
        }
        var helpIconPosition = offset - helpIcon.width() - 5 ;

        errorIcon.css({'left': errorIconPosition + 'px'});
        failIcon.css({'left': errorIconPosition + 'px'});
        passIcon.css({'left': errorIconPosition + 'px'});
        phoneIcon.css({'left': offset + 'px'});
        helpIcon.css({'right': helpIconPosition + 'px'});
    };
};

Systems.Classes.forgotPassword = function(){
	var helperObj;
	this.bindEvents = function(){
		helperObj = new Systems.Classes.globalHelper();
		helperObj.bindEvents();
		$('#forgot-password-form input').val('').removeClass('input-invalid');
		$('input[type="email"]').focus();

		$("#phone-forgotpassword").intlTelInput({
			defaultCountry : "us",
			utilsScript : "../js/utils.js" // just for formatting/placeholders etc
		});
		$('#forgot-password-submit').click(function(evt){
			submitForgetPassword(evt);
		});
		$('#forgot-password-form input').on('blur',function(evt){
			onInputLostFocus(evt);
		});

	};

	var submitForgetPassword = function(e){
		e.preventDefault();
	 	var inputs=$('#forgot-password-form :input');
		var values = {};
		inputs.each(function() {
			values[this.name] = $(this).val();
		});
		values['phone'] = $('#phone-forgotpassword').data('number');
		if($('#forgot-password-form :input').hasClass('input-invalid')){
			// Empty Validation
			$('#forgot-password-form').find('p.validation-message').text(strings['label.forgotpasswords.warning.message']);
			return true;
		}else{
			$(this).find('p.validation-message').text("");
			$('div.pageLoader').show();
	     	$.ajax({
	      		type: "POST",
		      	url: "forgotPassword",
	      		//contentType: 'application/json',
             	// mimeType: 'application/json',
			//START Bring From MILACRON_CODE_BASE in Miaclron we have email instead of userName
		      	data: {"userName" :(values['email'])?(values['email']):"", "phoneNumber" :""},
		      	success: function(data){
	            	var d = JSON.parse(data);
		        	if(d.resultMessage=='success'){
	            		$('#emailforgot').text(d.resultValue);
	            		$('.login-content').children('.signin-section').hide();
	            		$('#password-sent-modal').show();
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
	};

	var onInputLostFocus = function(evt){
		var type=evt.currentTarget.type;
		var value=evt.currentTarget.value;
		var invalidEmailText=strings['label.forgotpassword.email.invalid'];
		var invalidNumberText=strings['label.forgotpassword.invalid.phone.number'];
		//helperObj.loadBundles();
	 	switch(type){
		 	case 'email':
		 		if(Systems.Classes.Validater.prototype.ValidateEmail(value)){
					$('input[name = "phone"]').removeClass('input-invalid').prop('disabled',true).val("");
				}else{
					//$(this).val(invalidEmailText)
					  $(evt.target).removeClass('input-valid').addClass('input-invalid');
					//$('input[name = "phone"]').prop('disabled',false);
				}
				break;
		 	case 'text' :
		 		if($.trim(value)){
					if($(evt.target).intlTelInput("isValidNumber")){
						$(evt.target).data('number',$(this).intlTelInput("getNumber"));
						$('input[type = "email"]').removeClass('input-invalid').prop('disabled',true).val("");
					}else{
						$(evt.target).val(invalidNumberText);
						$(evt.target).removeClass('input-valid').addClass('input-invalid');
						$('input[type = "email"]').prop('disabled',false);
					}
				}
				break;
		 	default:break;
	 	}
	};
};

var onInputfocus = function(evt){
	if($(evt.target).hasClass('input-invalid')){
	$(evt.target).removeClass('input-invalid').addClass('input-valid');
	$(evt.target).val('');//this.value="";
	if($(evt.target).parent().attr('id')==="register-form")
		$(evt.target).next('span').removeClass('check-fail').addClass('check-pending');
	}
};

Systems.Classes.forgotPassword.prototype.initInputFocus = function(){
	$('#forgot-password-form input').on('focus',function(evt){
		onInputfocus(evt);
	});
}(window.jQuery);

Systems.Classes.userRegister.prototype.initInputFocus = function(){
	$('#register-form input, #register-form textarea#address ').on('focus',function(evt){
		onInputfocus(evt);
	});
}(window.jQuery);


$(document).on('click','#termsConditionAgree',function (e){
	var userName= $('#Username').val();
	$.ajax({
		type : "POST",
		url: "agreeTermsConditionsDemand",
      	data: {userName : userName},
		success : function(response) {
		   if(response == "success"){
			  $("#TermsModal").modal('hide');
			//  $('#signin-form').submit();
			  var userName= $('#Username').val();
				var password= $('#Password').val();
				var rememberMe = $('#remember-me').is(":checked");
				var status=true;//helperObj.validateUserCredentials(userName,password);
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
					         }else if(outputData.flag == false && outputData.agreedterms == false){
					        	 $('.termDetail ul').empty();
					        	 var orgMsg= outputData.message.split(',');

					        	 $.each(orgMsg,function(i){

					        		 $("#TermsModal").find('.termDetail ul').append('<li>'+ orgMsg[i]+ '</li>')

					        	 });

					        	 $("#TermsModal").modal('show');
								 //alert(outputData.message);
					        	 $('div.pageLoader').hide();

							}else{
								$(".error-login").text(outputData.message).show();
								$('div.pageLoader').hide();
							}
						},
						error: function(e){
							console.log( e);
						}
					});
				}
				else{
					event.preventDefault();
					$(".error-login").text(strings['message.badCredentials']);
				}
		   } else{
			   $("#error").text("Failed to update Terms & Condition").css("display","block");
		   }
		},
		error:function(e){ 
			}
	});
});



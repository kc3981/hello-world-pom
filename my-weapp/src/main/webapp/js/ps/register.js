/**
 * Handles Register submit event
 * @param evt
 * @returns
 */
$('#register-submit').on('click',function(evt){
  showLoader();
  $("#error").text("").css("display","none");
  $('p.tcmsg').css("display","none");
  var firstName = $("#firstName").val();
  if(!validateMandatoryField( $("#firstName"))){
    $("#firstName").focus();
    hideLoader();
    return false;
  }
  var lastName = $("#lastName").val();
  if(!validateMandatoryField( $("#lastName"))){
    $("#lastName").focus();
    hideLoader();
    return false;
  }
  var email = $("#email_register").val();
  if(!validateEmail(email)){
    $("#email_register").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
    $("#email_register").focus();
    hideLoader();
    return false;
  }else{
    $("#email_register").css("box-shadow","none");
  }
  var password = $("#password_register").val();
  if(!validatePassword(false)){
    $("#password_register").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
    $("#password_register").focus();
    hideLoader();
    return false;
  }else{
    $("#password_register").css("box-shadow","none");
  }
  
  var phone = $("#phone_register").val();
  //To Validate the Phone number against selected country  
  if($('#phoneNumberRequired').val()!=undefined && $('#phoneNumberRequired').val()== 'true' && (!validateMandatoryField( $("#phone_register")) || !$('#phone_register').intlTelInput("isValidNumber"))){
    $("#phone_register").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
    $("#phone_register").focus();
    hideLoader();
    return false;
  }else{
    $("#phone_register").css("box-shadow","none");
  }
  var company = $("#companyName").val();
  if($('#companyNameRequired').val()!=undefined && $('#companyNameRequired').val()== 'true' && !validateMandatoryField( $("#companyName"))){
    $("#companyName").focus();
    hideLoader();
    return false;
  }
  //This Language we are using to persist and user preferred language
  var languageId = $("#selectedLanguage").val();
  
  var brandValues="";
  var selOrganizationId = $('#organization').val();
  if($('#organization').val().length < 1){
    $("#organizationIdDiv>.ms-parent>.ms-choice").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
    hideLoader();
    return false;
  }else{
    $("#organizationIdDiv>.ms-parent>.ms-choice").css("box-shadow","none");
  }
  for(var org=0 ;org<selOrganizationId.length;org++){
    brandValues+=selOrganizationId[org]+",";
  }
  
  var user_name = email;
  //INC-2391 ends
  var phoneCountry = undefined;
  if( $('#phoneNumberRequired').val()!=undefined && $('#phoneNumberRequired').val()== 'true'){
    var arr=$('.selected-flag').find('div.iti-flag').attr('class').split(" ");
    phoneCountry = arr[1];
  }
  var customerAccount= $("#customerAccount").val();
  var address= $("#address").val();
  
  if($('#addressRequired').val()!=undefined && $('#addressRequired').val()== 'true' && !validateMandatoryField($("#address"))){
    $("#address").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
    $("#address").focus();
    hideLoader();
    return false;
  }
  var notes= $("#notes").val();
  var salesPerson = $("#salesPerson").val();
  var optIn=$("#tradeshow").is(":checked");
  var dealerId = null;
  if( $("#dealerVal").val()!=undefined){
    dealerId = $("#dealerVal").val();
  }
  
  var terms = false;
  if($("#tnc-checkbox").is(':checked')){
    terms = true;
    $('p.tcmsg').css("display","none");
  }else{
    $('p.tcmsg').css('display','block');
    hideLoader();
    return false;
  }
  
  if(($('#tnc-checkbox').is(":checked") || document.getElementById("terms").value == "false")) {
    $.ajax({
      type : "POST",
      dataType:"json",
      data :{firstName:firstName,lastName:lastName,organization:brandValues,phone_register:phone,email_register:email,user_name:user_name,password_register:password,termsandcondition:terms,companyName:company,languageId:languageId
        ,customerAccount:customerAccount,address:address,notes:notes,salesPerson:salesPerson,phoneCountry:phoneCountry,optIn:optIn,dealerId:dealerId},

      url : "register",
      success : function(response) {
        var result = response;
          if(!result.userRegistered){
            $("#error").html(result.message).css("display","block");
          }
          else{
            window.location.href="getRegistrationConfirmation";
          }
          hideLoader();
      },
      error:function(e){
        console.log('error:'+e)
        hideLoader();
      }
    });
   
    evt.preventDefault();
  }else{
    evt.preventDefault();
    $('p.tcmsg').css('display','block');
    hideLoader();
  }
  hideLoader();
});


/**
 * Below functions to remove red box-shadow if it has
 * @returns
 */
$("#firstName").focusout(function(){
  $("#firstName").css("box-shadow","none");
});
$("#lastName").focusout(function(){
  $("#lastName").css("box-shadow","none");
});
$("#password_register").focusout(function(){
  $("#password_register").css("box-shadow","none");
});
$("#phone_register").focusout(function(){
  $("#phone_register").css("box-shadow","none");
});
$("#email_register").focusout(function(){
  $("#email_register").css("box-shadow","none");
});
$("#companyName").focusout(function(){
  $("#companyName").css("box-shadow","none");
});
$("#organizationIdDiv").focusout(function(){
  $("#organizationIdDiv>.ms-parent>.ms-choice").css("box-shadow","none");
});

  
$("#termsandconditions").click(function() {
  if($('#organization').val().length < 1){
    $("#error").html(strings['label.message.one.brand']).css("display","block");
    return false;
  }else{
    var brandValues="";
    var selOrganizationId = $('#organization').val();
    for(var org=0; org<selOrganizationId.length; org++){
      brandValues+=selOrganizationId[org]+",";
    }
  }
  window.open("termsandconditions?selectedorganizations="+brandValues);
});

$(".dropdown-menu>li>a").on('click',function(){
  var languageId = $(this).attr('id');
    var languageCode=$("#lang_"+languageId).val(); 
    $("#select-option >button").html(languageCode);
});

$(document).ready(function(e){
   $.ajax({
      type: "GET",
      async:false,
      url: "getorganization",
      success: function(data){
      var d = JSON.parse(data);
      var multiSelect = $("#organization");
        for (i =0; i< d.length; i++) {
          if(d.length === 1){
            multiSelect.append('<option title="option-'+d[i].organizationId+'" selected="selected"  value='+d[i].organizationId+'>&nbsp; '+d[i].organizationName+'</option>?');
          }else{
            multiSelect.append('<option title="option-'+d[i].organizationId+'"  value='+d[i].organizationId+'>&nbsp; '+d[i].organizationName+'</option>?');
          }
        }
        hideLoader();
      },
      error: function(e){
      }
    });
   if($('#organization option').length == 1){
      $('#organization').change(function() {
        }).multipleSelect({
            width: '100%',
            filter: true ,
            selectAll: false
      });
   }
   
   if($('#organization option').length > 1){
     $('#organization').change(function() {
       }).multipleSelect({
           width: '100%',
           filter: true ,
     });
  }
    
  $("#password_register").keyup(function(data){
    validatePassword(true);
  });
  $("#phone_register").intlTelInput({
     defaultCountry: "us",
     utilsScript: "../js/ps/utils.js"
  });
  $('#password_register').bind('focusin focusout', function() {console.log("focus");
      $('#error-info-password').toggleClass('show');
  });
  
  });
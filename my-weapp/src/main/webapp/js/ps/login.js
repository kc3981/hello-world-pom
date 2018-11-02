$(document).ready(function(e) {
  hideLoader();
});
$('#loginUser').on(
    'click',
    function(evt) {
      evt.preventDefault();
      showLoader();
      $("#error-login").text("").css("display", "none");
      var userName = $('#Username').val();
      var password = $('#Password').val();
      var languageId = $("#selectedLanguage").val();
      var status = validateUserCredentials(userName, password);
      if (status) {
        $.ajax({
          type : "POST",
          async:false,
          url : "userlogin",
          data : {
            userName : userName,
            password : password,
            languageId : languageId
          },
          success : function(data) {
            // 20-01-2016-EH-Removed all Conditional Check
            var outputData = JSON.parse(data);
            if (outputData.flag == true) {
              window.location.href = outputData.message;
            } else if (outputData.flag == false
                && outputData.agreedterms == false) {
              $('.termDetail ul').empty();
              var orgMsg = outputData.message.split(',');

              $.each(orgMsg, function(i) {
                $("#TermsModal").find('.termDetail ul').append(
                    '<li>' + orgMsg[i] + '</li>')
              });

              $("#TermsModal").modal('show');
              hideLoader();
            } else {
              $(".error-login").html(outputData.message)
                  .css("display", "block");
              hideLoader();
              evt.preventDefault();
            }
          },
          error : function(e) {
            console.log(e);
          }
        });
      } else {
    	  evt.preventDefault();
      }
    });

$(".dropdown-menu>li>a").on('click', function() {
  var languageId = $(this).attr('id');
  var languageCode = $("#lang_" + languageId).val();
  $("#select-option >button").html(languageCode);
});
function validateUserCredentials(userName, password) {
  if (!validateMandatoryField($("#Username"))) {
    $("#Username").focus();
    hideLoader();
    return false;
	}else if (!validateEmail(userName)){
		$("#Username").css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
	    $("#Username").focus();
	    hideLoader();
	    return false;
	}
	if (!validateMandatoryField($("#Password"))
      && !this.ValidatePassword(password)) {
    $("#Password").focus();
    hideLoader();
    return false;
	} 
    return true;
}

function ValidatePassword(password) {

  var validPassword = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,100}$/;

  if (!validPassword.test(password)) {
    return false;
  } else {
    return true;
  }
}

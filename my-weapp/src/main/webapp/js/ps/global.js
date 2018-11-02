
var Systems = Systems || {};
if(!Systems.Classes){
  Systems.Classes ={};
}

function loadBundles() {
    $.ajax({
        type: "GET",
        async: false,
        url: "getLanguage",
        success: function(response) {
            var scriptContent = $($.parseHTML(response, document, true)).filter("script").text();
            $.globalEval(scriptContent)
        },
        error: function(e) {}
    })
}

$(document).ready(function(e){
  loadBundles();
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
        location.reload();
      }
  });
  loadBundles();
  });

});

/**
 * To check passed obj carries empty value
 * @param obj
 * @returns
 */

function validateMandatoryField(obj){
  if(jQuery.trim(obj.val())<=0){
    obj.css("box-shadow","0 0 0 2pt rgb(252, 12, 0)");
    return false;
  }else{
    obj.css("box-shadow","none");
    return true;
  }
}


function showLoader(){
  $("#loader").removeClass("d-none");
}

function hideLoader(){
  $('#loader').removeClass( "d-block" );
  $('#loader').addClass( "d-none" );
  $('#content').removeClass( "d-none" );
}

$("#show_hide_password a").on('click', function(event) {
  event.preventDefault();
  var hideshow=$('#show_hide_password').children('a').find('i');
  if($('#show_hide_password input').attr("type") == "password"){
      $('#show_hide_password input').attr('type', 'text');
      $('#passwordShowHide').text(strings['label.hide']);
      hideshow.addClass( "fa-eye" );
      hideshow.removeClass( "fa-eye-slash");
  }else if($('#show_hide_password input').attr("type") == "text"){
      $('#show_hide_password input').attr('type', 'password');
      hideshow.removeClass( "fa-eye" );
      $('#passwordShowHide').text(strings['label.show']);
      hideshow.addClass( "fa-eye-slash" );
  }
});


  
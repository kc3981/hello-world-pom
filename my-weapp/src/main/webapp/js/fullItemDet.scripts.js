/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(function () {

	var enableHotSpot = false;	
  $('#pills-first a').hover(function (e) {
      e.preventDefault()
      $(this).tab('show')
  });
 	$("html").niceScroll({cursorcolor:"#00F"});
	$(".zoomOption button").click(function() {
	 
		$(this).parents('.zoomOption').children().filter('.active4').removeClass('active4');
		$(this).addClass('active4');
  });
  $("a[data-toggle='pill'] > img.viewsImage").click(function(){
      $('a[data-toggle="pill"] > img.viewsImage').filter('.active').removeClass('active');
      $(this).addClass('active');
  });
  //for now defaultly make audio,vedio and pdf to disable
	$('.click').prop("disabled", true);			  	
		$(".tab_4").children(".viewsImage").hover(function() {
    $(".tab_4>.viewsImage").css('background-color','transparent');
	});
	
});
/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
$(document).ready(function(){
		
	var original_width = 0;
	var original_height = 0;


	$(".magnifyy").mousemove(function(e){
		if(!original_width && !original_height)
		{
			var image_obj = new Image();
			image_obj.src = $(".smalll").attr("src");
			original_width = image_obj.width;
			original_height = image_obj.height;
			$("#col1").html("orig width=" + original_width + "<br>" + "orig height=" + original_height );
		}
		else
		{
			var magnify_offset = $(this).offset();
			var mx = e.pageX - magnify_offset.left;
			var my = e.pageY - magnify_offset.top;
			$("#col2").html("pagex="+e.pageX +"<br>"+ "pageY="+ e.pageY);
			$("#col3").html("offset_L=" + magnify_offset.left +"<br>"+"offset_T=" + magnify_offset.top);
			$("#col4").html("mx="+ mx+"<br>"+"my=" +my);
			if(mx < $(this).width() && my < $(this).height() && mx > 0 && my > 0)
			{
				$(".largee").fadeIn(100);
			}
			else
			{
				$(".largee").fadeOut(100);
			}
			if($(".largee").is(":visible"))
			{				
				//The background position of .large will be changed according to the position
				//of the mouse over the .small image. So we will get the ratio of the pixel
				//under the mouse pointer with respect to the image and use that to position the 
				//large image inside the magnifying glass
				var rx = Math.round(mx/$(".smalll").width()*original_width - $(".largee").width()/2)*-1;
				var ry = Math.round(my/$(".smalll").height()*original_height - $(".largee").height()/2)*-1;
				var bgp = rx + "px " + ry + "px";
				
				//Time to move the magnifying glass with the mouse
				var px = mx - $(".largee").width()/2;
				var py = my - $(".largee").height()/2;
				//Now the glass moves with the mouse
				//The logic is to deduct half of the glass's width and height from the 
				//mouse coordinates to place it with its center at the mouse coordinates
				
				//If you hover on the image now, you should see the magnifying glass in action
				$(".largee").css({left: px, top: py,margin: 0,border:0, backgroundPosition: bgp});
				//$(".large").css({left: px, top: py, Position: bgp});
				//$(".large").css({width: 150px,height:150px,position:absolute,border-radius:100%});				
			}
		}
	})


})

/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/

        var windowHeight;
        $(".back-link").click(function(){
            document.location.href= $("#baseUrlRegister").val();;

        });

        $(document).ready(function(){
            //Set multiselect title attribute to title text
            //$('span.multiselect-title').parent('a').attr('title',$('span.multiselect-title').text());
            $('span.multiselect-title').on('mouseenter',function(){
                var $this = $(this);
                if(this.offsetWidth < this.scrollWidth && !$this.parent('a').attr('title')){
                    $this.parent('a').attr('title',$this.text());
                }
            });
            $('span.multiselect-title').parent('a').on('swipeleft',function(){
                var $this = $(this);
                if($this.attr('title')){
                    $this.children('span.multiselect-title').css({'text-indent':'-50px'});
                } 
            }).on('swiperight',function(){
                var $this = $(this);
                if($this.attr('title')){
                    $this.children('span.multiselect-title').css({'text-indent':'0px'});
                } 
            });

        	$("ul.dropdown-menu>li").on("click", function(){
        		var listV =  $(this).text();
        		/* $(this).parents(".dropdown.open").find("button").text(listV); */
        		document.getElementsByTagName("button")[0].childNodes[0].nodeValue = listV;
        	});
        	$('input[type=text]').each(function() {
        		   $(this).val('');
        	 });
            
        	if($('#password_register').val() != ""){
        		$('#password_register').val("");
        	}
        	
            
            windowHeight = $(window).height();

            console.log($('span.check-pending').parent().outerWidth());
            console.log($('span.check-pending').prev().outerWidth());

            registerResponsive();

            increaseDocumentHeight();

            //International phone init
            $("#phone_register").intlTelInput({
                                  defaultCountry: "us",
                                  /*geoIpLookup: function(callback) {
                                    $.get('http://ipinfo.io', function() {}, "jsonp").always(function(resp) {
                                      var countryCode = (resp && resp.country) ? resp.country : "";
                                      callback(countryCode);
                                    });
                                  },*/
                                  utilsScript: "../js/utils.js" // just for formatting/placeholders etc
                                });
            /*var flagPosition = $("#phone_register").css('margin-left');
            $('.intl-tel-input .flag-dropdown').css({'left':flagPosition});*/
            $(window).resize(increaseDocumentHeight);

            $('.country-list > li').each(function(){
                var countryName=$(this).find('span.country-name');
                countryName.text(countryName.text().split(' (')[0]);
            });
                
           /* $(document).on('keypress',function(e){
	              if(e.which === 13){
	               $('#register-submit').click();
	              }
             });

            $(document).on('keypress',function(e){
				 if(e.which === 13){
				 	$('#register-submit').click();
				 }
				});*/

            //on window resize apply responsive changes
            $( window ).resize(function(){
                registerResponsive();
            });
            $('#firstName').focus();
        });
        
        $('#password_register').change(function(){
        	if($('#confirm_password_register').val()==''){
        	}else{
        		$('#confirm_password_register').val('');
            	$('#confirm_password_register').next('span').removeClass('check-pending').addClass('check-fail');
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
        		  location.reload();
        	  }
        	 });
        	
        	
        });

        document.ondblclick = function(evt) {
            if (window.getSelection)
                window.getSelection().removeAllRanges();
            else if (document.selection)
                document.selection.empty();

            /*if($(evt.target).find('input[type="checkbox"]').length === 1 || evt.target.type==="checkbox"){
                evt.preventDefault();
            }*/
        }

        function increaseDocumentHeight(){
            currentHeight = window.innerHeight ||
                 document.documentElement.clientHeight ||
                 document.body.clientHeight;

            if(currentHeight < windowHeight || windowHeight < 400){
                $('.overlay-content').css({'height':'150%'});
            }else{
                $('.overlay-content').css({'height':'70%'});
            }
            
        }
        function registerResponsive(){
            //This is to align all the icons in register page - responsive!
            var errorIcon = $('span.check-pending');
            var failIcon = $('span.check-fail');
            var passIcon = $('span.check-pass');
            var phoneIcon = $('span.aria-code');
            var helpIcon = $('a.help-button');

            var parentWidth = errorIcon.parent().outerWidth();
            var siblingWidth = errorIcon.prev().outerWidth();
            var offset = (parentWidth - siblingWidth) / 2;
            var errorIconPosition = offset - errorIcon.width();
            var helpIconPosition = offset - helpIcon.width() - 5 ;

            errorIcon.css({'left': errorIconPosition + 'px'});
            failIcon.css({'left': errorIconPosition + 'px'});
            passIcon.css({'left': errorIconPosition + 'px'});
            phoneIcon.css({'left': offset + 'px'});
            helpIcon.css({'right': helpIconPosition + 'px'});
            alert(errorIconPosition);
        }
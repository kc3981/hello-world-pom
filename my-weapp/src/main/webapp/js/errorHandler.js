/*******************************************************************************
 * Confidential and Proprietary
 *  Copyright © 2016  Genalpha.  All Rights Reserved.
 *******************************************************************************/
var errnsp ={};
errnsp.errHandling = {};
var myErrorFlag;
errnsp.errHandling.init = function(){
	myErrorFlag = false;
	return errnsp.errHandling;
};
errnsp.errHandling.raise = function(err, msg,textStatus){
 	
	var msgtext;
	if(textStatus == 'parsererror'){
	}
	else if(textStatus== 'timeout'){
		msgtext = 'Timeout';
  	}
	else if(textStatus== 'abort'){
		msgtext = 'ajax call aborted';
	}
	else{
		msgtext = msg;
	}
	/*if(msg != ""){
	var newObj= new this.errorWindow;
	newObj.showbox(msgtext);
	}*/
	return true;
};

errnsp.errHandling.errorWindow = function(){
	var $overlay,$alert,$button,$close,$p;
  
	$overlay 	= $('<div class="overlay text-center"></div>');
	$alert 		= $('<div class="alert alert-warning" role="alert">');
	$button  	= $('<button type="button" class="close"  aria-label="Close"></button>');
	$close 		= $('<i class="fa fa-times-circle"></i>');
	$p 			= $('<p></p>');
	
	$alert.append($button);
	$alert.append($p);
	$button.append($close);
	$overlay.append($alert);
	
	$button.on("click", function(e){
    $overlay.fadeOut(500).remove(); 
		e.preventDefault();
		myErrorFlag = false;
	});
	function _showErrorBox (errmsg){
		if(!myErrorFlag){
			$overlay.find($p).text(errmsg);
			$("body").append($overlay);
			$overlay.show().fadeOut(3000, function(){
				myErrorFlag = false;
				$(this).remove();
			});
			myErrorFlag = true;
		}
	};
	return{
	    showbox:function(errmsg){
	    	_showErrorBox(errmsg);
	    	return true;
	    }
	};
};
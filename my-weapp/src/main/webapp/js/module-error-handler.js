/*************************************************
/*! Gensuite - v1.0.0
/*  Copyright (c) 2016 Genalpha; Licensed 
/*		Login Modules
/*		Description: Common Error Handler package.
/*		Developer: Dibu John
/**************************************************/
var Systems = Systems || {};
var myErrorFlag;
Systems.errHandling = function(){

	this.init = function(){
		myErrorFlag = false;
		return this;
	};

	this.raise = function(err, msg,textStatus){
	 	
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
		if(msg != ""){
		var newObj = new errorWindow;
		newObj.showbox(msgtext);
		}
		return true;
	};

	var errorWindow = function(){
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
};
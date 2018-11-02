/*******************************************************************************
 * Confidential and Proprietary
 * Copyright © 2016  ThoughtFocus.  All Rights Reserved.
 *******************************************************************************/
function callChat(userName, userEmailID) {
	
	var ICLoader = new RescueInstantChatLoader();
	ICLoader.ICContainer = "ICContainer";
    ICLoader.HostedCSS = "https://secure.logmeinrescue.com/InstantChat/Standard/InstantChat.css";
    ICLoader.HostedLanguagesForChatOnlyMode = "https://secure.logmeinrescue.com/InstantChat/LanguagesForChatOnlyMode.js";
    ICLoader.HostedLanguagesForAppletMode = "https://secure.logmeinrescue.com/InstantChat/LanguagesForAppletMode.js";
	ICLoader.PrivateCode = null;
	ICLoader.PageTitle = "Milacron - Chat";
	ICLoader.EntryID = '741785803';
	ICLoader.Name = userName;
	ICLoader.Comment1 = userEmailID;
	ICLoader.Comment2 = null;
	ICLoader.Comment3 = null;
	ICLoader.Comment4 = null;
	ICLoader.Comment5 = null;
	ICLoader.Tracking0 = null;
	ICLoader.Language = null;
	ICLoader.HostedErrorHandler = function(ErrorName) {
	};	
	ICLoader.Start();

}


function popupChatWindow(url) 
{		
	var width=370;
	var height=495;
	var left=screen.width-width-120;
	var top=screen.height-height-70;
	var pWin=open( url, 'win', 'width='+width+',height='+height+',left='+left+',top='+top+ ','+'channelmode=no,directories=no,fullscreen=no,location=no,menubar=no,resizable=no,scrollbars=no,status=no,titlebar=no,toolbar=no');
	pWin.blur();
	if( pWin.screenX != null ) 
		{
			pWin.screenX=left;
			pWin.screenY=top;
		}
}



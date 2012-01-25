   
   var TSF_currentVideo;

   var TSF_VideoPlatform = "Flash";  // "Silverlight" || "Flash"
    
   function TSF_DoInit() {
	   var oImgs= window.document.getElementsByTagName('img');
	   var oNewDiv;
	   var oPlaceHolder;
	   var oLinkContainer;
	   var oVideoContainer;
	   var sVideoAlign;
	   var sLongDesc;
	   var sHTML;
	   var oObj;
	   var sWidth;
	   var sHeight;
	   var nTop;
	   var nLeft;
	   var oNewNode;
	   var sClasses;

		TSF_SetupUI();
	   
	   for ( var i= 0; i < oImgs.length ; i++) 
   		{
	      	oObj = oImgs[i];
	      	if (oObj.className.indexOf("TSF_videoThumbnail") > -1 ) {
	      		sClasses = oObj.className.substr(19);
		      	if (oObj.src.indexOf("_small") > -1 ) TSF_dynamicVideoPlayer(oObj,sClasses);
		      	else TSF_staticVideoPlayer(oObj,sClasses);
			}
	   	}
   	}
    
    
   function TSF_dynamicVideoPlayer(oObj,sClasses) {
	   var oNewDiv;
	   var oPlaceHolder;
	   var oLinkContainer;
	   var oVideoContainer;
	   var sVideoAlign;
	   var sLongDesc;
	   var sHTML;
	   var sWidth;
	   var sHeight;
	   var nTop;
	   var nLeft;
	   var oNewNode;
			      	oVideoContainer = oObj.parentNode;
			      	sLongDesc = oObj.attributes.getNamedItem('longdesc').value;
			      	sVideoTitle = oObj.attributes.getNamedItem('alt').value;
			      	nTop = (oObj.height - 60)/2;
			      	nLeft =  (oObj.width - 80)/2;     	
		// oPlaceHolder è il tag div esterno collocato nel DOM a sostituire il thumbnail
			     	oPlaceHolder = document.createElement('div');
			     	oPlaceHolder.className = sClasses;
			      	if (oObj.align){
				      	sVideoAlign = oObj.align;
				      	if (sVideoAlign == 'left' ) oPlaceHolder.className = 'TSF_videoLeft';
					    if (sVideoAlign == 'right') oPlaceHolder.className = 'TSF_videoRight';
				     }
		// Preparazione del contenuto di  oPlaceHolder
		// -  oLinkContainer contiene i link per la visualizzazione del video, ha le dimensioni del thumbnail
		//    NB deve contenere un ulteriore tag di tipo div (oVideoLink, classe "TSF_videoLink") per il posizionamento assoluto
		//       delle immagini, oVideoLink contiene i link veri e propri.
			      	oLinkContainer= document.createElement('div');
			      	oLinkContainer.className = 'TSF_videoLinkOuter';
		//	      	oLinkContainer.style.height = oObj.height;
		//	      	oLinkContainer.style.width = oObj.width;
			      	oPlaceHolder.appendChild(oLinkContainer);
		//oNewNode è il tag div posizionato in maniera assoluta all'interno di  oLinkContainerche contiene tutte le immagini     	
			      	oVideoLink = document.createElement('div');
			      	oVideoLink.className = 'TSF_videoLink';
		//l'innerHTML di oNewNode contiene il pulsante di avvio del video
			      	oNewDiv = "<img alt='" + sVideoTitle + "' class='TSF_videoButton' src='/Style%20Library/images/play.png' longdesc='" + sLongDesc +
			      	          " ' style='left:" + nLeft +"px; top:"+ nTop+ "px; ' onclick='playVideo(this);' >" ;
			      	oVideoLink.innerHTML = oNewDiv;
		//e una copia del thumbnail a cui è cambiata la classe
			      	oObj.className = 'TSF_embeddedVideo';
			      	oVideoLink.appendChild(oObj.cloneNode(false));
			      	oLinkContainer.appendChild(oVideoLink);
					document.body.appendChild(oPlaceHolder);
					oVideoContainer.insertBefore( oPlaceHolder, oObj);
				    oObj.style.display = 'none';
   	}
    
    
    function TSF_staticVideoPlayer(oObj,sClasses) {
	   var oNewDiv;
	   var oPlaceHolder;
	   var oLinkContainer;
	   var oVideoContainer;
	   var sVideoAlign;
	   var sLongDesc;
	   var sHTML;
	   var sWidth;
	   var sHeight;
	   var nTop;
	   var nLeft;
	   var oNewNode;
      	oVideoContainer = oObj.parentNode;
      	sLongDesc = oObj.attributes.getNamedItem('longdesc').value;
			//TSF_videoThumbnail è il tag "div" che fa da "placeholder" e contiene <div class="TSF_videoLink">
			thumbnail = oObj ;
			TSF_videoThumbnail = oObj ; 
		   	var TSF_player = {URL: "", Preview: "",  width: oObj.width,  height: oObj.height} ;
		   	//thumbnail è l'oggetto (immagine) cliccato, contiene nell'attributo "longdesc" l'url del video, vengono rimossi eventuali blank
			var urlText = sLongDesc ;
			urlText = urlText.replace("intsf.tsf.local:1080", "tsfwapgal02wpro.tsf.local:1080");
			while(urlText.charAt(urlText.length-1) == ' ') urlText = urlText.substr(0,urlText.length-1);
			TSF_currentVideo = urlText ;
			var snapshotUrl = urlText.replace("mms://", "http://");
			snapshotUrl = snapshotUrl.replace(".wmv", ".png");
			
			var ExplorerOBJ = "<object style='backgorund-color:#ffffff;' width='" + oObj.width + "' height='" + oObj.height + "' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'  "+ 
				"codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0' id='TSF_Flash_Player'>"+
		        "<param name='movie' value='/_layouts/TSF.WSS.Video/Ipervideo_v2.swf' />"+
		        "<param name='quality' value='high' />"+
		        "<param name='bgcolor' value='#fffff' />"+
		        "<param name='allowfullscreen' value='true' />"+
		        "<param name='allowScriptAccess' value='sameDomain' />"+
		        "<param name='allowNetworking' value='all' />"+
		        "<param name='flashvars' value=\"file="+ urlText + "&autoStart=yes\" /></object>" ;
			
			if (navigator.appName.indexOf('Netscape') > -1) {
				playerObject = FirefoxOBJ ;
			}
			else playerObject = ExplorerOBJ ;
			
			var sStartHtml = "<div>";
			var sEndHtml   = "</div>";
			
			//oPlaceHolder è il nodo che contiene tuttle immagini con i link al video  
			var oLinkContainer = thumbnail.parentNode.parentNode;
			var newElement = document.createElement ("span");
			newElement.innerHTML = playerObject;
			newElement.width = oObj.width;
			newElement.height = oObj.height ;
			newElement.className = oObj.className ;
			oVideoContainer.replaceChild(newElement,oObj);	
			//inserimento del nodo "playerNode" nel DOM prima del nodo che contiene i links
			//oLinkContainer.parentNode.insertBefore( playerNode , oLinkContainer);
			
			//il contenitore dei links viene reso invisibile
			//oLinkContainer.style.display = "none";
   	}

    
   function closePlayer()
   {
    // restore original values
	if (TSF_videoThumbnail!= undefined) {
		TSF_videoThumbnail.style.display="block";
		TSF_videoThumbnail.parentNode.removeChild(TSF_videoThumbnail.previousSibling);
	}
	TSF_videoThumbnail = undefined;
   }

   
   function playVideo(thumbnail) {
  	closePlayer();
	//TSF_videoThumbnail è il tag "div" che fa da "placeholder" e contiene <div class="TSF_videoLink">
	TSF_videoThumbnail = thumbnail.parentNode.parentNode; 
   	var TSF_player = {URL: "", Preview: "",  width: "325",  height: "183"} ;
   	//thumbnail è l'oggetto (immagine) cliccato, contiene nell'attributo "longdesc" l'url del video, vengono rimossi eventuali blank
	var urlText = thumbnail.attributes.getNamedItem('longdesc').value;
	var videoTitle = thumbnail.attributes.getNamedItem('alt').value;
	urlText = urlText.replace("intsf.tsf.local:1080", "tsfwapgal02wpro.tsf.local:1080");
	while(urlText.charAt(urlText.length-1) == ' ') urlText = urlText.substr(0,urlText.length-1);
	TSF_currentVideo = urlText ;
	var snapshotUrl = urlText.replace("mms://", "http://");
	snapshotUrl = snapshotUrl.replace(".wmv", ".png");
	
	if (TSF_VideoPlatform == "Flash"){
   		var ExplorerOBJ = "<object style='backgorund-color:#ffffff;' width='" + TSF_player.width + "' height='" + TSF_player.height + "' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'  "+ 
		"codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0' id='TSF_Flash_Player'>"+
        "<param name='movie' value='/_layouts/TSF.WSS.Video/IperVideo_V2.swf' />"+
        "<param name='quality' value='high' />"+
        "<param name='bgcolor' value='#fffff' />"+
        "<param name='allowfullscreen' value='true' />"+
        "<param name='allowScriptAccess' value='sameDomain' />"+
        "<param name='allowNetworking' value='all' />"+
        "<param name='flashvars' value=\"file="+ urlText + "&autoStart=yes\" />"+
        "<embed src='/_layouts/TSF.WSS.Video/Ipervideo_v2.swf' type='application/x-shockwave-flash' width='" + TSF_player.width + "' height='" + TSF_player.height + "' name='TSF_Video_Player'" +
        " pluginspage='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0' quality='high' bgcolor='#000000' allowScriptAccess='always' allowFullScreen='true' flashVars='file=" + urlText + "&autoStart=yes'></embed>" +
        "</object>";
    }
    else {  //SilverLight
    	var ExplorerOBJ = "<div class=''><object data='data:application/x-silverlight-2,' id='TSF_Video_Player' type='application/x-silverlight-2' width='" + TSF_player.width + "'  height='" + TSF_player.height + "'>"+
        "<param name='source' value='/_layouts/TSF.WSS.Video/VideoPlayer.xap'/><param name='background' value='black' />"+
        "<param name='minruntimeversion' value='3.0.0.0' />"+
        "<param name='initParams' value='m="+ urlText + ",autoStart=yes' /> "+
        "<a href='_http://go.microsoft.com/fwlink/?LinkId=124807' style='text-decoration: none;'><img src='_http://go.microsoft.com/fwlink/?LinkId=108181' alt='Get Microsoft Silverlight' style='border-style: none'/></a> </object></div>" ;
		}

	/*if (navigator.appName.indexOf('Netscape') > -1) {
		playerObject = FirefoxOBJ ;
	}
	else*/ playerObject = ExplorerOBJ ;
	
	var sAltraFinestra = "<img class='TSF_videoPlayerControl' onclick='openInNewWindow();'  src='/Style%20Library/images/altraFinestra.png' alt='apri in una nuova finestra' onmouseover='this.attributes.getNamedItem(\"src\").value=\"/Style Library/images/altraFinestra_hover.png\";' onmouseout='this.attributes.getNamedItem(\"src\").value=\"/Style Library/images/altraFinestra.png\";'>";
	var sChiudi = "<img class='TSF_videoPlayerControl' onclick='closePlayer();' src='/Style%20Library/images/chiudi.png' alt='chiudi il video' onmouseover='this.attributes.getNamedItem(\"src\").value=\"/Style Library/images/chiudi_hover.png\";' onmouseout='this.attributes.getNamedItem(\"src\").value=\"/Style Library/images/chiudi.png\";'>";
	var sControlsTable = "<table cellspacing=0 cellpadding=0 border='0' class='TSF_videoPlayerControlBox'><tr><td >"+ sAltraFinestra + "</td> <td>" + sChiudi +"</td></tr></table>";

	var sStartHtml = '<table class="s4-wpTopTable" border="0" cellspacing="0" cellpadding="0" width="100%"><tbody><tr><td><table border="0" cellspacing="0" cellpadding="0" width="100%"><tbody><tr class="ms-WPHeader">' +
	'<td class="ms-wpTdSpace" align="left">&nbsp;</td><td class="ms-WPHeaderTd"><h3 style="text-align: justify" class="ms-standardheader ms-WPTitle"><nobr><SPAN>' + videoTitle +
	'</SPAN></nobr></h3></td><td class="ms-WPHeaderTdSelection"><span class="ms-WPHeaderTdSelSpan">' + sControlsTable +'</span></td><td class="ms-wpTdSpace" align="left">&nbsp;</td></tr></tbody></table></td></tr><tr><td valign="top">';

	//var sStartHtml =  sControlsTable  + "<div class='TSF_PlayerObj ms-WPBorder '>";
	//var sEndHtml   = "</div>";
	sStartHtml =  sStartHtml + '<div class="ms-WPBody ms-wpContentDivSpace ms-WPBorder">';
	var sEndHtml   = "</div></td></tr></tbody></table>";
	
	//oPlaceHolder è il nodo che contiene tuttle immagini con i link al video  
	var oLinkContainer = thumbnail.parentNode.parentNode;
	
	//costruzione del nodo "playerNode" (classe "TSF_videoPlayerBox") che contiene il player video 
	var playerNode = document.createElement('div');
		playerNode.style.height = 'auto';
		playerNode.className = 'TSF_videoPlayerBox';
		playerNode.innerHTML = sStartHtml + playerObject + sEndHtml;
		document.body.appendChild(playerNode);
		
	//inserimento del nodo "playerNode" nel DOM prima del nodo che contiene i links
	oLinkContainer.parentNode.insertBefore( playerNode , oLinkContainer);
	
	//il contenitore dei links viene reso invisibile
	oLinkContainer.style.display = "none";
   }   
   
   function openInNewWindow() {
    var TSF_player = {URL: "", Preview: "",  width: "800",  height: "450"} ;
   	var oWindow = window.open("","_blank","toolbar=yes, location=yes, directories=no, status=no, toolbar=no, menubar=no, scrollbars=no, resizable=yes, copyhistory=no, width=800, height=450");
	var urlText = TSF_currentVideo;
	var snapshotUrl = urlText.replace("mms://", "http://");
	snapshotUrl = snapshotUrl.replace(".wmv", ".png");
	var playerObject;
	var ScriptLink = "";   
	if (TSF_VideoPlatform == "Flash"){
       var ExplorerOBJ = "<object style='backgorund-color:#ffffff;' width='" + TSF_player.width + "' height='" + TSF_player.height + "' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'  "+ 
		"codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0' id='TSF_Flash_Player'>"+
        "<param name='movie' value='/_layouts/TSF.WSS.Video/FlashVideoPlayer.swf' />"+
        "<param name='quality' value='high' />"+
        "<param name='bgcolor' value='#fffff' />"+
        "<param name='allowfullscreen' value='true' />"+
        "<param name='allowScriptAccess' value='sameDomain' />"+
        "<param name='allowNetworking' value='all' />"+
        "<param name='flashvars' value=\"file="+ urlText + "&autoStart=yes\" />"+
        "<embed src='/_layouts/TSF.WSS.Video/Ipervideo_v2.swf' type='application/x-shockwave-flash' width='" + TSF_player.width + "' height='" + TSF_player.height + "' name='TSF_Video_Player'"+
        " pluginspage='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0' quality='high' bgcolor='#000000' allowScriptAccess='always' allowFullScreen='true' flashVars='file="+urlText+ "&autoStart=yes'></embed>"+
        "</object>" ;
   		}
    else { //SilverLight
    	var ExplorerOBJ = "<object data='data:application/x-silverlight-2,' id='TSF_Video_Player' type='application/x-silverlight-2' width='800' height='450'>"+
        "<param name='source' value='/_layouts/TSF.WSS.Video/VideoPlayer.xap'/><param name='background' value='black' />"+
        "<param name='minruntimeversion' value='3.0.0.0' />"+
        "<param name='initParams' value='m="+ urlText + ",autoStart=yes' /> "+
        "<a href='_http://go.microsoft.com/fwlink/?LinkId=124807' style='text-decoration: none;'><img src='_http://go.microsoft.com/fwlink/?LinkId=108181' alt='Get Microsoft Silverlight' style='border-style: none'/></a> </object>" ;
    	}
    /*if (navigator.appName.indexOf('Netscape') > -1) playerObject = FirefoxOBJ ;
	else*/ playerObject = ExplorerOBJ ;
	playerObject = "<html><head>"+ ScriptLink + "</head><body style='margin:0px'>" + playerObject + "</body></html>";
	oWindow.document.write(playerObject);
   	closePlayer();
   }

//--------------------------------------------------------------
// Utilities TSF
//----------------------------------------------------------

//--------------------------- L'utente è admin ? -------------------

	var oCtx;
	var oWeb;
	var oList;
	var bRes;

	function TSF_SetupUI() {
		oCtx = new SP.ClientContext.get_current();
		oWeb = oCtx.get_web();
		oList = oCtx.get_web().get_lists().getByTitle('Categorie'); 
		//oCtx.load(oList);
		//oCtx.executeQueryAsync(Function.createDelegate(this, initialiseListSuccess),Function.createDelegate(this, initialiseCtxFailed));

		
		oCtx.load(oWeb);
		oCtx.executeQueryAsync(Function.createDelegate(this, initialiseCtxSuccess),Function.createDelegate(this, initialiseCtxFailed));
	}
	
	function initialiseCtxFailed(sender, args) { 
	//alert('get context failed'); 
	}
	
	function initialiseCtxSuccess(sender, args) { isUserAdmin(); }

	function isUserAdmin() {
		var oPerm = new SP.BasePermissions();
		oPerm.set(SP.PermissionKind.addListItems);
		bRes = oWeb.doesUserHavePermissions(oPerm);
		//Call the query execution again to ensure the above method call is completed
		oCtx.executeQueryAsync(Function.createDelegate(this, canUserAddListItems),Function.createDelegate(this, isUserAdminFailed));
	}
	
	function canUserAddListItems() {
		if (bRes.get_value()){
			var head = document.getElementsByTagName('head')[0],
		    style = document.createElement('style'),
		    rules = document.createTextNode('.TSF_Authors { display:block; }'); 
			style.type = 'text/css'; 
			if(style.styleSheet) 
			    style.styleSheet.cssText = rules.nodeValue; 
			else style.appendChild(rules); 
			head.appendChild(style); 
		}
	}
	
	function isUserAdminFailed(sender, args) { 
	
	alert('is admin failed ' + bRes.get_value() ); 
	}	
		
//--------------------------- Create Tag Dialogs -------------------	
	var targetWeb;
	   
    function openCreateTagDialog(Dummy)
	{
	    // Specify a client context using the server-relative URL of the sub web, load the sub web, and call the ExecuteQueryAsync method.
        var clientContext = new SP.ClientContext.get_current();   
        targetWeb = clientContext.get_web();
        clientContext.load(targetWeb);
        clientContext.executeQueryAsync(Function.createDelegate(this, this.onQuerySucceeded), Function.createDelegate(this, this.onQueryFailed));
	}

    function onQuerySucceeded() {
        // On success, use get_ property assessor methods to return the value of the Title, ID, Language, uiVersion, Description, and Created properties of the SP.Web object.
	 	
		var ele = document.getElementById('TSF_NewCategory');
		var TagsListURL = "/Lists/Categorie/NewCategory.aspx";
		var options = {
	      url: "",
	      title: 'Aggiungi il nuovo Tag (Categoria)'
	   	};			
	   
	   	if (targetWeb.get_serverRelativeUrl() != '/') TagsListURL = targetWeb.get_serverRelativeUrl() + TagsListURL ;

		ele.href = TagsListURL ;
    
	   	options.url = TagsListURL;
		SP.UI.ModalDialog.showModalDialog(options);
     	/* 	
		message += "\n Title: " + targetWeb.get_title();
        message += "\n RelativeURL: " + targetWeb.get_serverRelativeUrl(); 
        message += "\n Language: " + targetWeb.get_language();
        message += "\n UI Version: " + targetWeb.get_uiVersion();
        message += "\n Description: " + targetWeb.get_description();
        message += "\n Created: " + targetWeb.get_created();
        alert(message); 
        */    
    }

    function onQueryFailed(sender, args) {
        alert("Errore, contattare l'amministratore del sito: \nError: " + args.get_message() + '\nStackTrace: ' + args.get_stackTrace());
    }
    

    
    
//--------------------------------------------------

   	function evalAction(){
   		var actionName = window.event.srcElement.attributes.getNamedItem('action').value;
   		eval(actionName +'()');
   	}
    
	function GoToURL(href) {
		alert("href = " + href);
	 	window.location.href = href;
	}
	
	function HighLight(elementID)
	{
		
		alert ("HighLight !!!");
		elem = document.getElementById(elementID);
		if (elem) elem.style.backgroundColor= "yellow";
			else alert ("L'elemento '" + elementID + "' non è presente nella pagina.");
	}

	function hasClass(ele,cls) {
		return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
	}
	
	function do_evidenzia(elementID) {
		do_addClass(elementID, "TSF_HighLight")
	}

	function undo_evidenzia(elementID) {
		undo_addClass(elementID, "TSF_HighLight")
	}

	
	function do_addClass(elementID,cls) {
		var ele = document.getElementById(elementID);
		if (!this.hasClass(ele,cls)) ele.className += " "+cls;
	}
	
	function undo_addClass(elementID,cls) {
		var ele = document.getElementById(elementID);
		if (hasClass(ele,cls)) {
			var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
			ele.className=ele.className.replace(reg,' ');
		}
	}

	function TSF_Navigate(url) {
		window.navigate("http://" + url);
	}


//----------------------------------------------------------
// Gestione video embedded

var TSF_videoThumbnail;

//----------------------------------------------------------
var bTSF_PopUpIsVisible = false;

function TSF_PopUp(oTag){
    var oNode;
    if (!bTSF_PopUpIsVisible){
            for (var i =0 ;i < oTag.childNodes.length; i++){
                oNode = oTag.childNodes[i];
                if (oNode.className == "TSF_PopUp"){
                    oNode.style.zIndex = 100;
                    oNode.style.display = "block";
                }
            }
        bTSF_PopUpIsVisible=true;
        return true;
    }
    else {
    }
}

function TSF_PopDown(oTag){
    var oNode;
    if (bTSF_PopUpIsVisible){
        oTag.style.display = "none";
        oTag.style.zIndex = 0;
        bTSF_PopUpIsVisible=false;
    return true;
    }
    else {
    }
}
   

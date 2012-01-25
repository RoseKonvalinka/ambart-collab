	var TSF_curweb;
	var TSF_curruser ;
	var TSF_membergroup ;
	var TSF_memberusers;
	var TSF_clientContext ;
	var TSF_isAdmin;
function	TSF_joinleaveSetup(){
	TSF_clientContext = new SP.ClientContext.get_current();
	TSF_curweb = TSF_clientContext.get_web();
	TSF_clientContext.load(TSF_curweb);
	TSF_curruser = TSF_curweb.get_currentUser();
	TSF_clientContext.load(TSF_curruser);
	TSF_membergroup = TSF_curweb.get_associatedMemberGroup();
	TSF_clientContext.load(TSF_membergroup);
	TSF_memberusers = TSF_membergroup.get_users() ;
	TSF_clientContext.load(TSF_memberusers);
    var permissionMask = new SP.BasePermissions();
    permissionMask.set(SP.PermissionKind.manageWeb);
    TSF_isAdmin = TSF_curweb.doesUserHavePermissions(permissionMask);
	TSF_clientContext.executeQueryAsync(Function.createDelegate(this, this.TSF_update_memberusers), Function.createDelegate(this, this.TSFFailed));
}
function TSF_update_memberusers() {
	if (TSF_membergroup.get_autoAcceptRequestToJoinLeave()) {
		document.getElementById("TSF_CommunityParticipation").innerHTML = '<strong>La partecipazione a questa community è libera, per iscriverti usa il link qui sotto.</strong>';
		var isMember = false;
		var i = 0
		var member = TSF_memberusers.itemAt(i);
		while (member != undefined) {
			if (member.get_loginName() == TSF_curruser.get_loginName()) {
				isMember = true;
				break;
			}
			i++;
			member = TSF_memberusers.itemAt(i);
		}
		if (!isMember) {	
			document.getElementById("TSF_CommunityParticipation").innerHTML = "<strong>La partecipazione a questa community e' libera, per iscriverti usa il link qui sotto.</strong>";
			document.getElementById("TSF_joinleaveLink").innerHTML = '<a href="javascript:;" onclick="TSF_joinleave(false)"> <SPAN style="POSITION: relative; WIDTH: 16px; DISPLAY: inline-block; HEIGHT: 16px; OVERFLOW: hidden"><IMG style="POSITION: absolute; TOP: -196px !important; LEFT: 0px !important" alt="" src="/_layouts/images/mossfgimg.png"></SPAN><SPAN style="PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; VERTICAL-ALIGN: top; PADDING-TOP: 0px"> Iscrivimi alla community</SPAN> </a>';
		} else {
			document.getElementById("TSF_CommunityParticipation").innerHTML = "<strong>La partecipazione a questa community e' libera, se vuoi cancellarti usa il link qui sotto.</strong>";
			document.getElementById("TSF_joinleaveLink").innerHTML = '<a href="javascript:;" onclick="TSF_joinleave(true)"> <SPAN style="POSITION: relative; WIDTH: 16px; DISPLAY: inline-block; HEIGHT: 16px; OVERFLOW: hidden"><IMG style="POSITION: absolute; TOP: -196px !important; LEFT: 0px !important" alt="" src="/_layouts/images/mossfgimg.png"></SPAN> <SPAN style="PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; VERTICAL-ALIGN: top; PADDING-TOP: 0px"> Cancellami dalla community</SPAN></a>';
		}
	}
	else
		if (TSF_membergroup.get_allowRequestToJoinLeave()) {
		document.getElementById("TSF_CommunityParticipation").innerHTML = "La partecipazione a questa community avviene su approvazione dei moderatori, puoi richiederla usando il link qui sotto.";
		var isMember = false;
		var i = 0
		var member = TSF_memberusers.itemAt(i);
		while (member != undefined) {
			if (member.get_loginName() == TSF_curruser.get_loginName()) {
				isMember = true;
				break;
			}
			i++;
			member = TSF_memberusers.itemAt(i);
		}
		if (!isMember) {
			document.getElementById("TSF_CommunityParticipation").innerHTML = '<strong>La partecipazione a questa community avviene su approvazione dei moderatori, per chiederla usa il link qui sotto.</strong>';
			document.getElementById("TSF_joinleaveLink").innerHTML = '<a href="javascript:;" onclick="TSF_joinleave(false)"> <SPAN style="POSITION: relative; WIDTH: 16px; DISPLAY: inline-block; HEIGHT: 16px; OVERFLOW: hidden"><IMG style="POSITION: absolute; TOP: -196px !important; LEFT: 0px !important" alt="" src="/_layouts/images/mossfgimg.png"></SPAN><SPAN style="PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; VERTICAL-ALIGN: top; PADDING-TOP: 0px"> Iscrivimi alla community</SPAN> </a>';
		} else {
			document.getElementById("TSF_CommunityParticipation").innerHTML = '<strong>La cancellazione a questa community avviene su approvazione dei moderatori, per chiederla usa il link qui sotto.</strong>';
			document.getElementById("TSF_joinleaveLink").innerHTML = '<a href="javascript:;" onclick="TSF_joinleave(true)"> <SPAN style="POSITION: relative; WIDTH: 16px; DISPLAY: inline-block; HEIGHT: 16px; OVERFLOW: hidden"><IMG style="POSITION: absolute; TOP: -196px !important; LEFT: 0px !important" alt="" src="/_layouts/images/mossfgimg.png"></SPAN> <SPAN style="PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; VERTICAL-ALIGN: top; PADDING-TOP: 0px"> Cancellami dalla community</SPAN></a>';
		}
	}
	isUserWebAdmin();
}

function TSF_joinleave(leave) {
	if (leave) TSF_memberusers.remove(TSF_curruser);
	else	TSF_memberusers.addUser(TSF_curruser);
	TSF_membergroup.update();
	TSF_curweb.update();
	TSF_clientContext.load(TSF_membergroup);
	TSF_clientContext.load(TSF_curweb);
	TSF_clientContext.executeQueryAsync(Function.createDelegate(this, this.TSF_reload_memberusers), Function.createDelegate(this, this.TSF_reload_memberusers));
}
function TSF_reload_memberusers() {
	location.reload();
}
function TSFFailed() {
}

function isUserWebAdmin() {
var Obj = document.getElementById('LastBreadCrumb');
 if (TSF_isAdmin.get_value()){ 
 	document.getElementById('s4-leftpanel-content').firstChild.style.display = 'block'; 
 	} 	
 	else{
	 	if (Obj.outerHTML.indexOf("settings.aspx")!= -1){
	 	document.getElementById('ID_pagedescription').firstChild.firstChild.style.backgroundColor = 'yellow'; 	 	
	 	Obj.firstChild.style.display = 'none'; 
	 	document.getElementById('LastSeparator').style.display = 'none';
	 	}
 	}
 Obj.style.display = 'inline'; 
}


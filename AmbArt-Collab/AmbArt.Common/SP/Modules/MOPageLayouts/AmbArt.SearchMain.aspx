<%@ Register TagPrefix="WpNs0" Namespace="Microsoft.SharePoint.Portal.WebControls" Assembly="Microsoft.Office.Server.Search, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="OSRVWC" Namespace="Microsoft.Office.Server.WebControls" Assembly="Microsoft.Office.Server, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="OSRVUPWC" Namespace="Microsoft.Office.Server.WebControls" Assembly="Microsoft.Office.Server.UserProfiles, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SPSWC" Namespace="Microsoft.SharePoint.Portal.WebControls" Assembly="Microsoft.SharePoint.Portal, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SEARCHWC" Namespace="Microsoft.Office.Server.Search.WebControls" Assembly="Microsoft.Office.Server.Search, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<asp:literal runat="server" Text="<%$Resources:Microsoft.Office.Server.Search, Search_MainPage_Title%>"/>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<style type="text/css">
body{
background-color:transparent;
}

TD.ms-titleareaframe, Div.ms-titleareaframe, .ms-pagetitleareaframe {
    height: 100px;
    text-align:center; 
}
.ms-pagetitleareaframe table {
    background-position:400px 67px;
    height: 0px;
}
.ms-bodyareaframe {
	border-color: transparent;
}
</style>
</ContentTemplate>
</SharePoint:UIVersionedContent>
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
<style type="text/css">
TD.ms-titleareaframe, Div.ms-titleareaframe, .ms-pagetitleareaframe {
    height: 100px;
    text-align:center; 
}
.ms-pagetitleareaframe table {
    background-position:400px 77px;
    height: 0px;
}
.ms-bodyareaframe {
	PADDING-RIGHT: 0px; PADDING-LEFT: 18px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px
}
.ms-PartSpacingVertical
{
    margin-top:1px;
}
</style> 
</ContentTemplate>
</SharePoint:UIVersionedContent>  
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderLeftNavBar" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderNavSpacer" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderBodyLeftBorder" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
<div height=100% class="ms-pagemargin"><img src="/_layouts/images/blank.gif" width=6 height=1 alt=""></div>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageImage"  runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderTitleLeftBorder"  runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderTitleBreadcrumb"  runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
<div style="height:100%; width:100%;padding-left: 18px; padding-top: 50px; padding-bottom: 10px;">
<center>
<div style="width: 510px">
<SPSWC:ListBoundTabStrip ID="Tab" runat="server" PersistQueryString="true" CSSClassNamePrefix="ms-sctab" ListName="<%$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchCenterListName%>" ResourceIdforListName="$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchCenterListName" UnselectedTabTrimLength="-1"></SPSWC:ListBoundTabStrip>
<div style="padding-top: 0px">
</ContentTemplate>
</SharePoint:UIVersionedContent>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<div class="srch-sb-main">
<div class="srch-sb-results4">
<div>
<SPSWC:ListBoundTabStrip ID="Tab1" runat="server" CSSFileName="Themable/search.css" PersistQueryString="true" CSSClassNamePrefix="ms-sctab" ListName="<%$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchCenterListName%>" ResourceIdforListName="$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchCenterListName" UnselectedTabTrimLength="-1"></SPSWC:ListBoundTabStrip>
</div>
<div class="srch-sb-results6">
</ContentTemplate>
</SharePoint:UIVersionedContent>
<WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" Title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_TopZone%>" ID="TopZone" Orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
</div>
</div>
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</center>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</div>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea"  runat="server">
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<label><asp:literal runat="server" Text="<%$Resources:Microsoft.Office.Server.Search, Search_MainPage_Title%>" /></label>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderTitleAreaSeparator"  runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderSearchArea"  runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
<table width="100%">

		 <td><img src="/_layouts/images/blank.gif" width="5" height="1" alt="" /></td> <td class="ms-bodyareaframe" valign="top" width="100%">
		<table border="0" cellpadding="0" cellspacing="0" id="ZoneTable" width="100%" class="ms-tztable"> <tr id="MiddleRow"> <td valign="top" id="MiddleLeftCell" width="100%" class="ms-tzmidleft"> 
			<WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" AllowPersonalization="false" Title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_BottomZone%>" ID="MiddleLeftZone" Orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone> <!-- _locID@Title="L_MiddleLeftZone_Title" --> </td> </tr> </table>
		</td> 
</table>
</asp:Content>

<asp:Content ContentPlaceHolderID="SPNavigation" runat="server">
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<div style="position:absolute; width:100%;  top:0px; font-size:8pt">
<div style="background-color:transparent;  position:absolute; width:100%; " >
	<div class="ms-cui-TabRowRight s4-trc-container s4-notdlg" id="RibbonContainer-TabRowRight" style="display: block; margin-right:18px" unselectable="on">		
			<div class="s4-trc-container-menu">
					 <div>
					</div>
				<div style="margin-right:18px">
				    <ul class="ms-cui-tts">
				        <li class="ms-cui-tt " role="tab">
				            <a class="ms-cui-tt-a " title="Siti Internet" href="http://spfoundation/Intranet">
				                <span class="ms-cui-tt-span">Siti Intranet</span> 
				            </a>
				        </li>
				        <li class="ms-cui-tt" > 
				            <a  class="ms-cui-tt-a" title="Workspaces" href="http://spfoundation/workspaces">
				                <span class="ms-cui-tt-span" >Workspaces</span>
				            </a>
				        </li>
				        <li class="ms-cui-tt" role="tab" > 
				            <a  class="ms-cui-tt-a" title="Communities" href="http://spfoundation/Communities">
				                <span class="ms-cui-tt-span" >Communities</span>
				            </a>
				        </li>
				        <li class="ms-cui-tt" role="tab" > 
				            <a  class="ms-cui-tt-a" title="Assets" href="http://spfoundation/assets">
				                <span class="ms-cui-tt-span" >Assets</span>
				            </a>
				        </li>
				        <li class="ms-cui-tt ms-browseTab ms-cui-tt-s s4-WebAppTabs" role="tab" > 
				            <a  class="ms-cui-tt-a" title="Ricerca" href="http://spfoundation/Ricerca">
				                <span class="ms-cui-tt-span" >Ricerca</span>
				            </a>
				        </li>
				    </ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="s4-ribbonrow" class="s4-pr s4-ribbonrowhidetitle">
<div id="s4-ribboncont">  
                        <SharePoint:SPRibbon 
                            runat="server" 
                            CssFile = "corev4.css"
                            PlaceholderElementId="RibbonContainer"
                            FixedPositioningEnabled="true"
                            PermissionsString="EditListItems, AddAndCustomizePages"
                            PermissionMode="Any"
                            ApplyPermissionsToRibbonOnly="false">
                            <SharePoint:SPRibbonPeripheralContent
                                runat="server"
                                Location="TabRowLeft"
                                CssClass="ms-siteactionscontainer s4-notdlg">  
                            </SharePoint:SPRibbonPeripheralContent>
			<SharePoint:SPRibbonPeripheralContent
				runat="server"
				Location="TabRowRight"
				ID="RibbonTabRowRight"
				CssClass="s4-trc-container s4-notdlg">
			<SharePoint:DelegateControl runat="server" ID="GlobalDelegate0" ControlId="GlobalSiteLink0" />
			 <a href="#" tabindex="-1" style="display:none"></a><a href="#" tabindex="-1" style="display:none"></a>
				<span>
		<span class="s4-devdashboard">
		</span>
	</span>

			</SharePoint:SPRibbonPeripheralContent>

                        </SharePoint:SPRibbon>
</div>
</div>
<div id="notificationArea" class="s4-noti">
</div>
<SharePoint:DelegateControl runat="server" ControlId="PublishingConsole">
           </SharePoint:DelegateControl>
<div>
                        <WebPartPages:WebPartAdder ID="WebPartAdder" runat="server" />
</div>

</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="OSRVWC" Namespace="Microsoft.Office.Server.WebControls" Assembly="Microsoft.Office.Server, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="OSRVUPWC" Namespace="Microsoft.Office.Server.WebControls" Assembly="Microsoft.Office.Server.UserProfiles, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SPSWC" Namespace="Microsoft.SharePoint.Portal.WebControls" Assembly="Microsoft.SharePoint.Portal, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SEARCHWC" Namespace="Microsoft.Office.Server.Search.WebControls" Assembly="Microsoft.Office.Server.Search, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
		<asp:literal runat="server" Text="<%$Resources:Microsoft.Office.Server.Search, Search_Results_Page_Title1%>"/> 
		: <SEARCHWC:SearchTermFromUrl runat="server"/>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<style type="text/css">
body{
background-color:transparent;
}

TD.ms-titleareaframe, Div.ms-titleareaframe, .ms-pagetitleareaframe {
    height: 85px;
    text-align:center; 
}
.ms-pagetitleareaframe table {
    background-position:400px 36px;
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
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
<style type="text/css">
TD.ms-titleareaframe, Div.ms-titleareaframe, .ms-pagetitleareaframe {
    height: 85px;
    text-align:center; 
}
.ms-pagetitleareaframe table {
    background-position:400px 36px;
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
<div height=100% class="ms-pagemargin"><img src="/_layouts/images/blank.gif" width="8" height="1" alt=""></div>
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
<div height=100% class="ms-pagemargin"><IMG SRC="/_layouts/images/blank.gif" width=6 height=1 alt=""></div>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderTitleLeftBorder" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderSearchArea" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderTitleBreadcrumb"  runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
<a name="mainContent"></a>
<div style="height:100%; width:100%;padding-left: 2px; padding-top: 16px; padding-bottom: 14px;">
<div style="WIDTH: 390px" >
<SPSWC:ListBoundTabStrip runat="server" id="Tab" persistQueryString="true" cssClassNamePrefix="ms-sctab" ListName="<%$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchResultsListName%>" ResourceIdforListName="$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchResultsListName"  UnselectedTabTrimLength="-1" IgnoredQueryStringParameters="s,s1,s2,s3,s4,s5,start,start1,start2,start3,start4,start5,v,v1,v2,v3,v4,v5,hs,hs1,hs2,hs3,hs4,hs5,rm,rm1,rm2,rm3,rm4,rm5,r"></SPSWC:ListBoundTabStrip>
</div>
</ContentTemplate>
</SharePoint:UIVersionedContent>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<div class="srch-sb-results">
<div class="srch-sb-results1">
<SPSWC:ListBoundTabStrip runat="server" id="Tab1" CSSFileName="Themable/search.css" persistQueryString="true" cssClassNamePrefix="ms-sctab" ListName="<%$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchResultsListName%>" ResourceIdforListName="$Resources:Microsoft.Office.Server.Search,SearchCenterOnet_SearchResultsListName"  UnselectedTabTrimLength="-1" IgnoredQueryStringParameters="s,s1,s2,s3,s4,s5,start,start1,start2,start3,start4,start5,v,v1,v2,v3,v4,v5,hs,hs1,hs2,hs3,hs4,hs5,rm,rm1,rm2,rm3,rm4,rm5,r"></SPSWC:ListBoundTabStrip>
</div>
<div class="srch-sb-results2">
</ContentTemplate>
</SharePoint:UIVersionedContent>
<WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_TopZone%>" id="TopZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone> 
</div>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
</div>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea"  runat="server">
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
<label><asp:literal runat="server" Text="<%$Resources:Microsoft.Office.Server.Search, Search_Results_Page_Title1%>" /></label>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderTitleAreaSeparator" runat="server">
<SharePoint:UIVersionedContent UIVersion="3" runat="server">
<ContentTemplate>
</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

<SharePoint:VersionedPlaceHolder UIVersion="4" runat="server">	
<table width="100%" cellpadding="0" cellspacing="0">
    <tr>	
        <td colspan="3">
            <div class="srch-maincontent-seperator" />
        </td>
    </tr> 
    <tr>
        <td class="srchctr_leftcell" id="LeftCell">
            <div class="srch-refinearea">
            <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_LeftZone%>" id="LeftZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
            </div>
        </td>
        <td class="srchctr_mainleftcell" id="MainLeftCell">

</SharePoint:VersionedPlaceHolder>

				 <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				 <ContentTemplate>
                                 <table width="100%">
	                             <tbody>
	                             <tr>	
		                        <!-- MAINRIGHTBODYAREA_BEG: cell that encompases the main right body area -->  <td valign="top" width="100%">
		                        <table border="0" cellpadding="0" cellspacing="0" id="ZoneTable" width="100%" class="ms-tztable">

				          <tbody>

				          <tr>
				 	   <td id="MainLeftCell" width="75%" valign="top">
			                        <table border="0" cellpadding="0" cellspacing="0" id="LeftZoneTable" width="100%" class="ms-tztable">
                                                    <tbody>
                                                    <tr width="100%">				 
				                        <td width="100%">
        	                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                               <tbody>
                                                               <tr width="100%">
	                                                         <td id="MidUpperLeftCell" align="left"> 
                                 </ContentTemplate>
				 </SharePoint:UIVersionedContent>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
		 <div>
                     <span class="srch-maintopleft">   
</ContentTemplate>
</SharePoint:UIVersionedContent> 
                                                                     <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_MiddleUpperLeftZone%>" id="MidUpperLeftZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                                 <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				 <ContentTemplate>
                                                                 </td>
                                                                 <td id="MidUpperRightCell" align="right">
                                 </ContentTemplate>
				 </SharePoint:UIVersionedContent>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
                      </span>
                      <span class="srch-maintopright">
                        <div>
</ContentTemplate>
</SharePoint:UIVersionedContent> 
	                                                              <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly"  title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_MiddleUpperRightZone%>" id="MidUpperRightZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                                 <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				 <ContentTemplate>
        	                                                 </td>
                                                               </tr>
                                                               <tr width="100%">
	                                                          <td id="MidUpperLeftCell" align="left">  

                                 </ContentTemplate>
				 </SharePoint:UIVersionedContent>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
                         </div>
                       </span>
                   </div>
                   <div class="srch-maintop">
                     <span class="srch-maintopleft">   
</ContentTemplate>
</SharePoint:UIVersionedContent>            
            <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_MiddleLowerLeftZone%>" id="MidLowerLeftZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
                      </span>
                      <span class="srch-maintopright">
</ContentTemplate>
</SharePoint:UIVersionedContent> 

                                 <SharePoint:UIVersionedContent UIVersion="3" runat="server">
                                 <ContentTemplate>
                                                                   </td>
                                                                   <td id="MidUpperRightCell" align="right">
                                 </ContentTemplate>
                                 </SharePoint:UIVersionedContent> 
                         <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_MiddleLowerRightZone%>" id="MidLowerRightZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
                       </span>
                   </div>
</ContentTemplate>
</SharePoint:UIVersionedContent>         	      
		                 <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				 <ContentTemplate>
                                                                </td>
                                                              </tr>
		                        	        </table>
	                                             </td>			      
			                          </tr>
	                                          <tr>
		                                      <td valign="top" id="BottomCell" width="100%" style="padding-top: 10px"> 
                                 </ContentTemplate>
                                 </SharePoint:UIVersionedContent>         	      
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
                   <div class="srch-maintop2">
</ContentTemplate>
</SharePoint:UIVersionedContent>         	      
                  	             <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_BottomZone%>" id="BottomZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>

                                 <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				 <ContentTemplate>
                                                       </td> 
                                                   </tr>
		                                 </table>
                                            </td> 
                                 </ContentTemplate>
                                 </SharePoint:UIVersionedContent>         	      
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
                    </div>
            </td>			 
            <td class="srchctr_rightcell" id="RightCell" rowspan="1"> 
            <div class="srch-federationarea"> 
</ContentTemplate>
</SharePoint:UIVersionedContent>

			           <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				   <ContentTemplate>
				       <td><IMG SRC="/_layouts/images/blank.gif" width="10" height="1" alt=""></td> 			   
			               <td id="RightCell" valign="top">
                                   </ContentTemplate>
				   </SharePoint:UIVersionedContent>
	        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_RightZone%>" id="RightZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
<ContentTemplate>
             </div> 
</ContentTemplate>
</SharePoint:UIVersionedContent>
             </td>
	  </tr>
  </table>

			           <SharePoint:UIVersionedContent UIVersion="3" runat="server">
				   <ContentTemplate>
		                            </td> 
		                            <!-- MAINRIGHTBODYAREA_END: cell that encompases the main right body area -->
	                                </tr>
                                   </table>
                                   </ContentTemplate>
				   </SharePoint:UIVersionedContent>

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
			 <div class="s4-trc-container-menu">
				 <div>
				</div>
			</div>
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


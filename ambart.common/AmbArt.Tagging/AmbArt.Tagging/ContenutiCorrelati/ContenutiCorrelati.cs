using System;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.Office.Server.Search.Administration;
using Microsoft.Office.Server.Search.Query;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Data;
using Microsoft.SharePoint.Taxonomy;
using System.IO;

namespace AmbArt.Tagging
{
    [ToolboxItemAttribute(false)]
    public class ContenutiCorrelati : WebPart
    {
        private string[] tags;
        private string tagColumnName = "Argomenti";
        [Category("Tagging Setting"),
        Personalizable(PersonalizationScope.Shared),
        WebBrowsable(true),
        WebDisplayName("Nome della colonna Tags"),
        WebDescription("la colonna della lista corrente da considerare")]
        public string TagColumnName
        {
            get {return ((this.tagColumnName == null) ? String.Empty : this.tagColumnName);}
            set {this.tagColumnName = value;}
        }
        private string propertyName = "Tags";
        [Category("Tagging Setting"),
        Personalizable(PersonalizationScope.Shared),
        WebBrowsable(true),
        WebDisplayName("Nome della Managed Property"),
        WebDescription("la Managed Search Property da interrogare")]
        public string PropertyName
        {
            get { return ((this.propertyName == null) ? String.Empty : this.propertyName); }
            set { this.propertyName = value; }
        }
        bool xsltFlag = true;
        [Category("Tagging Setting"),
        Personalizable(PersonalizationScope.Shared),
        WebBrowsable(true),
        WebDisplayName("Usa XSLT"),
        WebDescription("Usa XSLT Transform")]
        public bool XSLTFlag
        {
            get
            {
                return this.xsltFlag;
            }
            set
            {
                this.xsltFlag = value;
            }
        }
        
        private string xslt = "<xsl:stylesheet xmlns:x=\"http://www.w3.org/2001/XMLSchema\"" +
            " version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"><xsl:output method=\"html\" indent=\"no\"/>" +
            "<xsl:decimal-format NaN=\"\"/>	<xsl:template match=\"/\" ><if test=\"count(rows) &gt; 0\">" +
            "<h3 style=\"text-align:justify;\" class=\"ms-standardheader ms-WPTitle\"><nobr><span>Contenuti correlati" +
            "</span></nobr></h3><table cellspacing=\"0\" cellpadding=\"0\"><xsl:for-each select=\"rows/row\">" +
            "<tr class=\"TSF_QueryItemShort\"><td class=\"TSF_ItemIcon\">" +
            "<img src=\"/_layouts/images/rect.gif\"/></td><td class=\"TSF_ItemDescription\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">" +
            "<tr class=\"TSF_ItemHeader\"><td class=\"TSF_ItemLink\"><a><xsl:attribute name=\"href\"><xsl:value-of select=\"@url\"/>" +
            "</xsl:attribute><xsl:value-of select=\"@title\"/></a></td></tr><tr><td class=\"TSF_TagList\">tags: <xsl:call-template name=\"formatTags\">" +
            "<xsl:with-param name=\"stringtags\" select=\"@tags\"/></xsl:call-template></td></tr>" +
            "<tr><td class=\"TSF_TagList\">Sito: <a href=\"{@siteurl}\"><xsl:value-of select=\"@site\"/></a></td></tr>" +
            "</table></td></tr><tr><td colspan=\"2\" class=\"TSF_ItemSeparator\">" +
            "<img src=\"/_layouts/images/BLANK.GIF\"/></td></tr></xsl:for-each>	</table></if></xsl:template><xsl:template name=\"selectIcon\"><xsl:choose>" +
            "<xsl:when test=\"@contenttype = '850'\"><img alt=\"pagina html\" src=\"/_layouts/images/LTSMRTPG.GIF\"/></xsl:when>	<xsl:when test=\"@contenttype = 'WebPageLibrary'\">" +
            "<img alt=\"pagina wiki\" src=\"/_layouts/images/LTWORKSP.GIF\"/></xsl:when>	<xsl:when test=\"@contenttype = 'Video'\"><img alt=\"Video\" src=\"/_layouts/images/LTTHGBRG.GIF\"/>" +
            "</xsl:when>	<xsl:when test=\"@contenttype = 'Documento'\"><img alt=\"Documento\" src=\"/_layouts/images/LTTXTBOX.GIF\"/></xsl:when>	<xsl:when test=\"@contenttype = 'Immagine'\">" +
            "<img style=\"width:50px\" alt=\"Immagine\" src=\"/_layouts/images/PREVIEW.JPG\"/></xsl:when>	<xsl:when test=\"@contenttype = 'PictureLibrary'\"><img alt=\"Immagine\" src=\"/_layouts/images/LTIL.GIF\"/>" +
            "</xsl:when><xsl:when test=\"@contenttype = 'GenericList'\"><img alt=\"GenericList\" src=\"/_layouts/images/LTGEN.GIF\"/></xsl:when><xsl:when test=\"@contenttype = 'Categories'\">" +
            "<img alt=\"Categories\" src=\"/_layouts/images/LTCAT.GIF\"/></xsl:when><xsl:when test=\"@contenttype = 'Posts'\"><img alt=\"Posts\" src=\"/_layouts/images/LTANN.GIF\"/></xsl:when>" +
            "<xsl:when test=\"@contenttype = 'Collegamento'\"><img alt=\"Collegamento\" src=\"/_layouts/images/LTLINK.GIF\"/></xsl:when><xsl:when test=\"@contenttype = 'DiscussionBoard'\">" +
            "<img alt=\"Discussione\" src=\"/_layouts/images/LTDISC.GIF\"/></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose></xsl:template><xsl:template name=\"formatTags\"><xsl:param name=\"stringtags\"/>" +
            "<xsl:choose><xsl:when test=\"contains($stringtags,';#')\">	<xsl:value-of select=\"substring-before($stringtags,';#')\"/><xsl:text disable-output-escaping=\"yes\">, </xsl:text>" +
            "<xsl:call-template name=\"formatTags\"><xsl:with-param name=\"stringtags\" select=\"substring-after(substring-after($stringtags,';#'),';#')\"/></xsl:call-template></xsl:when><xsl:otherwise>" +
            "<xsl:value-of select=\"$stringtags\"/></xsl:otherwise></xsl:choose></xsl:template></xsl:stylesheet>";

        [Category("Tagging Setting"),
        Personalizable(PersonalizationScope.Shared),
        WebBrowsable(true),
        WebDisplayName("XSLT"),
        WebDescription("XSLT")]
        public string XSLT
        {
            get { return ((this.xslt == null) ? String.Empty : this.xslt); }
            set { this.xslt = value; }
        }


        protected override void RenderContents(HtmlTextWriter writer)
        {
            SPWeb mySite = SPContext.Current.Web;
            SPList lst = findList(mySite);
            if (lst != null)
            {
                try
                {
                    string titleItem = "";
                    SPListItem li = null;
                    if (!String.IsNullOrEmpty(Page.Request.QueryString["RootFolder"]))
                    {
                        li = this.findDiscussion(lst, Page.Request.QueryString["RootFolder"]);
                    }
                    else
                    {
                        if (lst.BaseTemplate == SPListTemplateType.WebPageLibrary) 
                        {
                            li = this.findWikiPage(lst);
                            if (li.Fields.ContainsField("Title0")) titleItem = li.Fields[li.Fields.GetFieldByInternalName("Title0").ToString()].ToString();
                            else titleItem = nameWikiPage(li);
                        }
                        else
                        {
                            li = lst.GetItemById(Convert.ToInt32(Page.Request.QueryString["ID"]));
                            if (li.Fields.ContainsField("Title") && li["Title"] != null) titleItem = li["Title"].ToString();
                            else titleItem = "";
                        }
                    }
                    if (li != null && li.Fields.ContainsField(tagColumnName))
                    {
                        tags = getTags(li);
                        XmlDocument xdoc = new XmlDocument();
                        XmlDocument xsld = new XmlDocument();
                        xdoc.LoadXml("<rows></rows>");
                        if (tags.Length > 0)
                        {
                            DataTable hsItems = this.GetItems();
                            XmlNode xn;
                            XmlAttribute xa;
                            string weburl;
                            string ct;
                            foreach (DataRow row in hsItems.Rows)
                            {
                                if ((row["TipoContenuto"].ToString().Contains("Pagina") && !row["Path"].ToString().Contains(li.Url)) || (!row["TipoContenuto"].ToString().Contains("Pagina") && HttpUtility.HtmlDecode(row["Title"].ToString()) != HttpUtility.HtmlDecode(titleItem)))
                                {
                                    xn = xdoc.CreateElement("row");
                                    xdoc.DocumentElement.AppendChild(xn);
                                    xa = xdoc.CreateAttribute("title");
                                    xn.Attributes.Append(xa);
                                    if (row["TipoContenuto"].ToString().Contains("Pagina"))
                                    {
                                        if (row["Path"].ToString().Contains(".aspx"))
                                        {
                                            xa.Value = row["Path"].ToString().Substring(row["Path"].ToString().LastIndexOf('/') + 1);
                                            xa.Value = xa.Value.Substring(0, xa.Value.Length - 5);
                                        }
                                        else xa.Value = "Sito";
                                    }
                                    else xa.Value = row["Title"].ToString();
                                    xa = xdoc.CreateAttribute("created");
                                    xn.Attributes.Append(xa);
                                    xa.Value = row["Created"].ToString();
                                    xa = xdoc.CreateAttribute("site");
                                    xn.Attributes.Append(xa);
                                    xa.Value = row["SiteTitle"].ToString();
                                    xa = xdoc.CreateAttribute("siteurl");
                                    xn.Attributes.Append(xa);
                                    xa.Value = row["SiteName"].ToString();
                                    xa = xdoc.CreateAttribute("url");
                                    xn.Attributes.Append(xa);
                                    xa.Value = row["Path"].ToString();
                                    xa = xdoc.CreateAttribute("contenttype");
                                    xn.Attributes.Append(xa);
                                    xa.Value = row["TipoContenuto"].ToString();
                                    xa = xdoc.CreateAttribute("tags");
                                    xn.Attributes.Append(xa);
                                    string resultTags = "";
                                    if (row["Tags"].GetType() == typeof(System.String[]))
                                        for (int i = 0; i < ((string[])row["Tags"]).Length; i++) resultTags += ((string[])row["Tags"])[i] + "; ";
                                    else resultTags = row["Tags"].ToString();
                                    xa.Value = resultTags;
                                }
                            }
                        }
                        if (xsltFlag)
                        {
                            xsld.LoadXml(XSLT);
                            writer.Write(Transform(xdoc, xsld));
                        }
                        else writer.Write("<pre>" + xdoc.OuterXml + "</pre>");
                    }
                    else
                    {
                        writer.Write("<span style=\"display:none\"> elemento senza correlazioni  <span>");
                    }
                }
                catch (Exception ex)
                {
                    writer.Write("<pre>");
                    writer.Write(ex.ToString());
                    writer.Write("</pre>");
                }
            }
        }
        private SPList findList(SPWeb ww)
        {
            return ww.GetList(Page.Request.Url.GetLeftPart(UriPartial.Path));
        }
        private SPListItem findDiscussion(SPList lst, string discussion)
        {
            SPListItem retIt = null;
            foreach (SPListItem it in lst.Folders)
            {
                if (discussion.Contains(it.Url))
                {
                    retIt = it;
                    break;
                }
            }
            return retIt;
        }
        private string nameWikiPage(SPListItem it)
        {
            string name = it.Url.Substring(it.Url.LastIndexOf("/") + 1);
            if (name.Contains(".aspx"))
                name = name.Substring(0, name.Length - 5);
            else name = "Sito";
            return name.Replace("%20", " ");
        }
        private SPListItem findWikiPage(SPList lst)
        {
            return lst.RootFolder.Files[Page.Request.Url.GetLeftPart(UriPartial.Path)].Item;
        }
        private string[] getTags(SPListItem it)
        {
            TaxonomyFieldValueCollection itemTags = ((TaxonomyFieldValueCollection)it[tagColumnName]);
            string[] ret = new string[itemTags.Count];
            int i = 0;
            foreach (TaxonomyFieldValue tag in itemTags)
            {
                ret[i] = tag.Label;
                i++;
            }
            return ret;
        }
        private int numCorrelazioni(string[] itTags)
        {
            int corr = 0;
            for (int i = 0; i < tags.Length; i++)
            {
                for (int j = 0; j < itTags.Length; j++)
                {
                    if (tags[i] == itTags[j])
                    {
                        corr++;
                        break;
                    }
                }
            }
            return corr;
        }
        private string Transform(IXPathNavigable input, IXPathNavigable xslt)
        {

            XslCompiledTransform xsltProcessor = new XslCompiledTransform();

            xsltProcessor.Load(xslt);

            Stream results = new MemoryStream();

            if (input is XmlDocument)
            {

                xsltProcessor.Transform(input, null, results);

            }

            results.Position = 0;

            StreamReader rdr = new StreamReader(results);

            return rdr.ReadToEnd();

        }



        private DataTable GetItems()
        {
            DataTable resultsDataTable = new DataTable();
            if (tags.Length > 0)
            {
                SPSite site = new SPSite(SPContext.Current.Site.Url);
                /*
                FullTextSqlQuery query = new FullTextSqlQuery(site);
                query.Hint = QueryHint.OptimizeWithPropertyStore;
                // inserito per prendere tutto. BUG della search
                query.TrimDuplicates = false;
                query.QueryText = "SELECT Path, title, Created, Tags, TipoContenuto, SiteTitle, SiteName FROM scope() WHERE \"scope\"='All Sites' AND (CONTAINS(Tags,'\"" + tags[0] + "\"')";
                if (tags.Length > 1)
                {
                    for (int i = 1; i < tags.Length; i++)
                    {
                        query.QueryText += " OR CONTAINS(Tags,'\"" + tags[i] + "\"')";
                    }
                }
                query.QueryText += ") ORDER BY LastModifiedTime Desc";
                query.SiteContext = new Uri(site.Url);
                query.ResultTypes = ResultType.RelevantResults;
                 * */
                SearchServiceApplicationProxy proxy =
            (SearchServiceApplicationProxy)SearchServiceApplicationProxy.GetProxy(SPServiceContext.GetContext(SPContext.Current.Site));
                KeywordQuery query = new KeywordQuery(proxy);
                //query.EnableFQL = true;
                query.QueryText = propertyName + ":\"" + tags[0] + "\"";
                if (tags.Length > 1)
                {
                    for (int i = 1; i < tags.Length; i++)
                    {
                        query.QueryText += " OR " + propertyName + ":\"" + tags[i] + "\"";
                    }
                }
                query.ResultsProvider = SearchProvider.Default;
                query.ResultTypes = ResultType.RelevantResults;
                query.StartRow = 0;
                query.RowLimit = 5000;
                query.TrimDuplicates = false;
                query.SelectProperties.Add("Path");
                query.SelectProperties.Add("title");
                query.SelectProperties.Add("Descrizione");
                query.SelectProperties.Add(propertyName);
                query.SelectProperties.Add("TipoContenuto");
                query.SelectProperties.Add("Created");
                query.SelectProperties.Add("SiteTitle");
                query.SelectProperties.Add("SiteName");
                query.SortList.Add("Rank", Microsoft.Office.Server.Search.Query.SortDirection.Descending);
                //
                ResultTableCollection resultTables = query.Execute();
                ResultTable relevantResults = resultTables[ResultType.RelevantResults];
                resultsDataTable.Load(relevantResults, LoadOption.OverwriteChanges);
            }
            return resultsDataTable;
        }
    }
}

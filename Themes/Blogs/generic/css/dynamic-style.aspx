<%@ Page Language="C#" AutoEventWireup="true" Inherits="System.Web.UI.Page, System.Web" %>
<%@ Import Namespace="Telligent.Evolution.Components" %>
<%@ Import Namespace="Telligent.Evolution.Blogs.Components" %>

<script language="C#" runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        var blog = CSContext.Current.GetCurrent<Telligent.Evolution.Blogs.Components.Weblog>();
        if (blog == null)
            return;

        string theme = ((Telligent.Evolution.Blogs.Components.BlogsContext)CSContext.Current.ApplicationContexts[ApplicationType.Weblog]).WeblogTheme;
        if (!string.IsNullOrEmpty(CSContext.Current.QueryString["Theme"]))
            theme = CSContext.Current.QueryString["Theme"];

        ThemeConfigurationData themeData = CSContext.Current.ThemePreviewCookie.IsPreviewing(blog) ? ThemeConfigurationDatas.GetThemeConfigurationData(blog, theme, CSContext.Current.ThemePreviewCookie.PreviewID, true) : ThemeConfigurationDatas.GetThemeConfigurationData(blog, theme, true);  

        DateTime lastModified = DateTime.UtcNow;
        if(!themeData.IsPreview && Globals.CachedVersionIsValid(Context, lastModified))
        {
            Response.StatusCode = 304;
            Response.Status = "304 Not Modified";
            Response.End();
            return;
        }
        
        CssClassNameExpansionResponseFilter.Apply(this.Context);
        Page.Response.ContentType = "text/css";
        if (!themeData.IsPreview)
            Globals.SetCacheHeaders(new HttpContextWrapper(Context), lastModified, new TimeSpan(0, 30, 0), HttpCacheability.Public);

        Response.Write(Telligent.Common.Services.Get<IContentFragmentTokenService>().ProcessTokens(themeData.DecodeStringValue(themeData.GetStringValue("cssOverrides", string.Empty)), Page, themeData));
    }

</script>
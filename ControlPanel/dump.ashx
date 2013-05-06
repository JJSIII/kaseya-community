<%@ WebHandler Language="C#" Class="Evolution_controlpanel_diagnostics_Dump" %>

/**************************************************************************************
 *
 * If asked to provide the output from this file for support purposes, please view this
 * file through your web browser – e.g. http://yourwebsite.com/controlpanel/dump.ashx
 *
 *************************************************************************************/

using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Net.Mail;
using System.Reflection;
using System.Security;
using System.Security.Principal;
using System.Security.Permissions;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.SessionState;
using System.Xml;
using Telligent.Evolution.Components;

public class Evolution_controlpanel_diagnostics_Dump : IHttpHandler
{
    private readonly ISecurityService securityService = Telligent.Common.Services.Get<ISecurityService>();

    public void ProcessRequest(HttpContext context)
    {
        string output = "<html><body>You must be a System Administrator to access this page.</body></html>";
        bool hasPermission = false;

        try
        {
            User currentUser = Telligent.Evolution.Users.GetUser();

            if (currentUser != null)
                hasPermission = securityService.For(Node.Root).Does(currentUser).Have(SitePermission.ManageSettings);
        }
        catch { }

        if (hasPermission)
        {
            WebInfo wi = new WebInfo(context, CSContext.Current.SiteSettings.SiteName);

            wi.Handle();

            output = wi.Output;
        }

        context.Response.ContentType = "text/html";
        context.Response.Write(output);
    }

    public bool IsReusable
    {
        get { return false; }
    }

    #region private class WebInfo
    /// <summary>
    /// Adopted from Phil Winstanley's (phil@winstanley.name) WebException class.
    /// Modified:
    ///     refactored Get* methods
    ///     Added \t and \n to appropriate places for shorter physical email formatting
    /// </summary>
    private class WebInfo
    {
        #region Private Members

        /// <summary>
        /// Site this code is executing on
        /// </summary>
        private string _Site = String.Empty;

        /// <summary>
        ///
        /// </summary>
        private bool _ReturnCache = false;

        /// <summary>
        ///
        /// </summary>
        private string FullTrace = String.Empty;

        /// <summary>
        /// The email message that will be sent
        /// </summary>
        private StringBuilder Sb = new StringBuilder();

        #endregion

        #region public string Output

        public string Output
        {
            get { return Sb.ToString(); }
        }

        #endregion

        #region private HttpContext CurrentContext

        /// <summary>
        /// The current context accessed one time
        /// </summary>
        private HttpContext _CurrentContext;

        /// <summary>
        /// Privately accessible current context
        /// </summary>
        private HttpContext CurrentContext
        {
            get { return _CurrentContext; }
        }

        #endregion

        #region Public Members

        /// <summary>
        ///
        /// </summary>
        public string Site
        {
            set { _Site = value; }
        }

        #endregion

        #region public void Handle
        /// <summary>
        /// This method constructs the e-mail and then sends the message.
        /// </summary>
        public void Handle()
        {
            //The first thing we need to do is check that we can access the Current Web Context
            if (CurrentContext != null)
            {
                #region Contstruct the information
                try
                {
                    // Set up the
                    GetHeader();

                    //Set up the Version Numbers
                    GetVersionNumbers();

                    //Get the Session
                    GetSession();

                    //Get the Application
                    GetApplication();

                    //Get the Request Cookies
                    GetRequestCookies();

                    //Get the Response Cookies
                    GetResponseCookies();

                    //Get the Request Headers
                    GetRequestHeaders();

                    //Get the Response Headers
                    GetResponseHeaders();

                    //Get the Cache
                    GetCache();

                    //Get the ServerVariables
                    GetServerVariables();

                    //Get the Trace
                    GetTrace();

                    //Get the Mail Footer
                    GetFooter();

                    //Get Loaded CS Modules
                    GetCSModules();

                    //Get the 20 most recent events
                    GetRecentEvents();

                }
                catch (Exception ex)
                {
                    //Handle any exceptions by sending them in the e-mail.
                    Sb.Append("<h1 style='color:red;'>There was a problem building this message</h1>");
                    Sb.Append("<p>" + ex.Message.ToString() + "</p>");
                    Sb.Append("<p>" + ex.StackTrace.ToString() + "</p>");
                }
                #endregion
            }
        }
        #endregion

        #region private void AppendTableRow(string CellName, string CellValue, bool Header)
        /// <summary>
        ///
        /// </summary>
        /// <param name="CellName"></param>
        /// <param name="CellValue"></param>
        /// <param name="Header"></param>
        private void AppendTableRow(string CellName, string CellValue, bool Header)
        {
            if (Header) CellName = "<b>" + CellName + "</b>";

            Sb.AppendFormat("<tr>\n\t<td valign='top'>{0}</td>\n\t<td> {1}\n\t</td>\n</tr>\n", CellName, CellValue);
        }
        #endregion

        #region private void AppendTableRow(string CellName, string CellValue, bool Header, string ValueStyle)
        /// <summary>
        ///
        /// </summary>
        /// <param name="CellName"></param>
        /// <param name="CellValue"></param>
        /// <param name="Header"></param>
        /// <param name="ValueStyle"></param>
        private void AppendTableRow(string CellName, string CellValue, bool Header, string ValueStyle)
        {
            if (Header) CellName = "<b>" + CellName + "</b>";

            Sb.Append("<tr>\n");
            Sb.AppendFormat("\t<td valign='top'><b>{0}</b></td>\n", CellName);
            Sb.AppendFormat("\t<td> <span style='{0}'>{1}</span>\n\t</td>\n", ValueStyle, CellValue);
            Sb.Append("</tr>\n");
        }
        #endregion

        #region private void AppendTableRow(string CellValue)
        /// <summary>
        ///
        /// </summary>
        /// <param name="CellValue"></param>
        private void AppendTableRow(string CellValue)
        {
            Sb.AppendFormat("<tr>\n\t<td colspan=\"2\"> {0}\n\t</td>\n</tr>\n", CellValue);
        }
        #endregion

        #region private string CreateAnchor(string Text)
        /// <summary>
        ///
        /// </summary>
        /// <param name="Text"></param>
        /// <returns></returns>
        private string CreateAnchor(string Text)
        {
            return ("<a href=\"" + Text + "\">" + Text + "</a>");
        }
        #endregion

        #region private void AppendTableHeader()
        /// <summary>
        ///
        /// </summary>
        private void AppendTableHeader()
        {
            Sb.Append("<table cellpadding=\"2\" cellspacing=\"1\">\n");
        }
        #endregion

        #region private void AppendTableFooter()
        /// <summary>
        ///
        /// </summary>
        private void AppendTableFooter()
        {
            Sb.Append("</table>\n");
        }
        #endregion

        #region private void AppendHr()
        /// <summary>
        ///
        /// </summary>
        private void AppendHr()
        {
            Sb.Append("<hr />\n");
        }
        #endregion

        #region private void AppendHashTable(System.Collections.Hashtable ht)
        /// <summary>
        ///
        /// </summary>
        /// <param name="ht"></param>
        private void AppendHashTable(System.Collections.Hashtable ht)
        {
            Sb.Append("<tr>\n");
            Sb.Append("\t<td valign='top'></td>\n\t<td valign='top'>\n");
            AppendTableHeader();

            foreach (string hkey in ht.Keys)
            {
                AppendTableRow(hkey.ToString(), ht[hkey].ToString(), false);
            }

            AppendTableFooter();
            Sb.Append("\t</td>\n");
            Sb.Append("</tr>\n");
        }
        #endregion

        #region private void AppendArrayList(System.Collections.ArrayList al)
        /// <summary>
        ///
        /// </summary>
        /// <param name="al"></param>
        private void AppendArrayList(System.Collections.ArrayList al)
        {
            foreach (object item in al)
            {
                Sb.Append("<tr>\n");
                Sb.AppendFormat("\t<td valign='top'>&#160;</td>\n\t<td><i>{0}</i></td>\n", item);
                Sb.Append("</tr>\n");
            }
        }
        #endregion

        #region private void AppendStateBagEntry(string Name, object Value, Type ObjectType)
        /// <summary>
        ///
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="Value"></param>
        /// <param name="ObjectType"></param>
        private void AppendStateBagEntry(string Name, object Value, Type ObjectType)
        {
            if (Value == null)
                AppendTableRow(Name, string.Empty, false);
            else if (ObjectType == typeof(System.String))
                AppendTableRow(Name, HttpUtility.HtmlEncode((string)Value), false);
            else if (ObjectType == typeof(System.Data.DataSet))
                AppendDataSet(Name, (System.Data.DataSet)Value);
            else if (ObjectType == typeof(System.Data.DataTable))
                AppendDataTable(Name, (System.Data.DataTable)Value);
            else if (ObjectType == typeof(System.Data.DataRow))
                AppendDataRow(Name, (System.Data.DataRow)Value);
            else if (ObjectType == typeof(Hashtable))
            {
                Hashtable ht = Value as Hashtable;
                AppendTableRow(Name, ht.ToString() + ", Count: " + ht.Count.ToString(), false);
            }
            else if (ObjectType == typeof(System.Collections.ArrayList))
            {
                ArrayList al = Value as ArrayList;
                AppendTableRow(Name, al.ToString() + ", Count: " + al.Count.ToString(), false);
            }
            else if (ObjectType == typeof(System.String[]))
            {
                String[] sa = Value as String[];
                AppendTableRow(Name, sa.ToString() + ", Count: " + sa.Length.ToString(), false);
            }
            else
                AppendTableRow("'" + Name + "'", HttpUtility.HtmlEncode(Convert.ToString(Value)), false);
        }
        #endregion

        #region private void AppendDataRow(System.String Name, System.Data.DataRow Value)
        /// <summary>
        ///
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="Value"></param>
        private void AppendDataRow(System.String Name, System.Data.DataRow Value)
        {
            System.Data.DataRow Dr = (System.Data.DataRow)Value;

            Sb.Append("<tr>\n");
            Sb.Append("\t<td valign=\"top\">" + Name + "</td><td>System.Data.DataRow</td>\n");

            Sb.Append("</tr>\n<tr>\n");
            Sb.Append("\t<td colspan=\"2\">\n");

            if (Dr.Table.Columns.Count > 0)
            {
                Sb.Append("<table cellpadding=\"1\" cellspacing=\"1\" border=\"1\">\n");

                Sb.Append("<tr>\n");
                Sb.Append("\t<td>Name</td>\n\t<td>Data Type</td>\n\t<td>Value</td>\n");
                Sb.Append("</tr>\n");

                foreach (System.Data.DataColumn Dc in Dr.Table.Columns)
                {
                    Sb.Append("<tr>\n");
                    Sb.Append("\t<td>" + Dc.ColumnName + "</td>\n");
                    Sb.Append("\t<td>" + Dc.DataType.Name + "</td>\n");
                    Sb.Append("\t<td> " + Convert.ToString(Dr[Dc.ColumnName]) + "\n\t</td>\n");
                    Sb.Append("</tr>\n");
                }

                AppendTableFooter();
            }

            Sb.Append("\t</td>\n");
            Sb.Append("</tr>\n");
        }
        #endregion

        #region private void AppendDataTable(System.String Name, System.Data.DataTable Value)
        /// <summary>
        ///
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="Value"></param>
        private void AppendDataTable(System.String Name, System.Data.DataTable Value)
        {
            System.Data.DataTable Dt = (System.Data.DataTable)Value;
            System.String dataTableName = Dt.TableName;

            // appending brackets (with space) in case name is not blank or null
            if (null != dataTableName && dataTableName.Trim().Length != 0) dataTableName = " [" + dataTableName + "]";

            System.String tableInfo = System.String.Format("Row Count for Table{0}: {1}", dataTableName, Dt.Rows.Count);

            // making it apparent that this is a child data table
            if (Name == null) Name = "&#160;&#160;--";

            AppendTableRow(Name, tableInfo, false);

            if (Dt.Columns.Count > 0)
            {

                Sb.Append("<tr>\n");
                Sb.Append("\t<td colspan='2'>\n");

                Sb.Append("<table cellpadding=\"1\" cellspacing=\"1\" border=\"1\">\n");

                foreach (System.Data.DataColumn Dc in Dt.Columns)
                {
                    AppendTableRow(Dc.ColumnName, Dc.DataType.Name, false);
                }

                AppendTableFooter();
                Sb.Append("\t</td>\n");
                Sb.Append("</tr>\n");

            }
        }
        #endregion

        #region private void AppendDataSet(System.String Name, System.Data.DataSet Value)
        /// <summary>
        ///
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="Value"></param>
        private void AppendDataSet(System.String Name, System.Data.DataSet Value)
        {
            System.Data.DataSet Ds = (System.Data.DataSet)Value;
            System.String dataSetName = Ds.DataSetName;

            // appending brackets (with space) in case name is not blank or null
            if (null != dataSetName && dataSetName.Trim().Length != 0) dataSetName = " [" + dataSetName + "]";

            System.String setInfo = System.String.Format("Table Count for Set{0}: {1}", dataSetName, Ds.Tables.Count);

            AppendTableRow(Name, setInfo, false);

            if (Ds.Tables.Count > 0)
            {
                foreach (System.Data.DataTable Dt in Ds.Tables)
                {
                    AppendDataTable(null, Dt);
                }
            }
        }
        #endregion

        #region private void GetHeader()
        /// <summary>
        ///
        /// </summary>
        private void GetHeader()
        {

            Sb.Append("<html>");
            Sb.Append("<head>\n");
            Sb.Append("\t<title>" + this._Site + " - Dump.ashx</title>\n");
            Sb.Append("</head>\n");

            Sb.Append("<style>");
            Sb.Append("body{font-family:Verdana;font-size:8pt;background:#FFFF99;}p{font-family:Verdana;font-size:8pt;}td{font-family:Verdana;font-size:8pt;}span{font-family:Verdana;font-size:8pt;}");
            Sb.Append("</style>\n");

            Sb.Append("<body>\n");
            Sb.Append("<h1>" + this._Site + " - Dump.ashx</h1>\n");
            Sb.Append("<h2>" + DateTime.Now.ToString("r") + "</h2>\n");

            AppendHr();

            if (CurrentContext != null)
            {
                System.Web.HttpRequest request = CurrentContext.Request;

                AppendTableHeader();
                AppendTableRow("Url", CreateAnchor(request.Url.AbsoluteUri.ToString()), true);
                AppendTableFooter();

                AppendHr();

                AppendTableHeader();
                AppendTableRow("User IP Address", request.UserHostAddress.ToString(), true);

                //If the HostName is returned and isn't the same as the IP Address then We append the row.
                if (request.UserHostAddress.ToString() != request.UserHostName.ToString())
                {
                    AppendTableRow("User Host", request.UserHostName.ToString(), true);
                }

                AppendTableFooter();

                AppendHr();

                if (request.UrlReferrer != null)
                {

                    AppendTableHeader();
                    AppendTableRow("Url Referrer", CreateAnchor(request.UrlReferrer.AbsoluteUri.ToString()), true);
                    AppendTableFooter();

                    AppendHr();
                }

                AppendTableHeader();
                AppendTableRow("Environment User Name", Environment.UserName, true);
                AppendTableFooter();

                AppendHr();

                AppendTableHeader();
                AppendTableRow("Machine Name", CurrentContext.Server.MachineName.ToString(), true);
                AppendTableFooter();

                AppendHr();

                AppendTableHeader();
                AppendTableRow("Operating System", Environment.OSVersion.VersionString.ToString(), true);
                AppendTableFooter();

                AppendHr();

                AppendTableHeader();
                try
                {
                    Dictionary<string, string> dict = new Dictionary<string, string>();
                    AppendTableRow("Licensing Information", string.Empty, true);

                    object ocs = GetObjectFromReflectedMethod("Telligent.Registration.dll", "Telligent.Registration.Licensing", "get_Telligent.Evolution");
                    PropertyInfo[] props = ocs.GetType().GetProperties();
                    foreach (PropertyInfo prop in props)
                    {
                        try
                        {
                            string name = prop.Name;
                            if (prop.PropertyType != null && (prop.PropertyType.IsValueType || prop.PropertyType == typeof(string)))
                            {
                                try
                                {
                                    dict.Add(name, Convert.ToString(prop.GetValue(ocs, null)) ?? string.Empty);
                                }
                                catch
                                {
                                    dict.Add(name, "Error");
                                }
                            }
                        }
                        catch { }
                    }

                    object oVersionInfo = SiteStatistics.TelligentEvolutionVersionVersionInfo;

                    bool IsCommercial, HasExpiration = false;
                    int NumberOfBlogs, NumberOfForums, NumberOfGalleries, NumberOfGroups, NumberOfContentMirrors, NumberOfDomains = -1;
                    DateTime Expires = DateTime.MinValue;
                    string Edition = dict["Edition"] ?? string.Empty;
                    string VersionString = dict["VersionString"] ?? string.Empty;

                    bool.TryParse(dict["IsCommercial"], out IsCommercial);
                    bool.TryParse(dict["HasExpiration"], out HasExpiration);
                    int.TryParse(dict["NumberOfBlogs"], out NumberOfBlogs);
                    int.TryParse(dict["NumberOfForums"], out NumberOfForums);
                    int.TryParse(dict["NumberOfGalleries"], out NumberOfGalleries);
                    int.TryParse(dict["NumberOfGroups"], out NumberOfGroups);
                    int.TryParse(dict["NumberOfContentMirrors"], out NumberOfContentMirrors);
                    int.TryParse(dict["NumberOfDomains"], out NumberOfDomains);
                    DateTime.TryParse(dict["Expires"], out Expires);

                    AppendTableRow(
                        "Edition"
                        , Edition
                            + ((IsCommercial) ? " (Commercial)" : string.Empty)
                            + ((HasExpiration) ? ", Expires on " + Expires.ToString("yyyy-MM-dd hh:mm:ss") : string.Empty)
                        , false);
                    if (oVersionInfo != null)
                        AppendTableRow("Full Version", Convert.ToString(oVersionInfo), false);
                    if (!string.IsNullOrEmpty(VersionString))
                        AppendTableRow("Registration Version String", VersionString, false);
                    AppendTableRow("Number of allowed blogs", AllowableItems(NumberOfBlogs, 10000), false);
                    AppendTableRow("Number of allowed forums", AllowableItems(NumberOfForums, 10000), false);
                    AppendTableRow("Number of allowed galleries", AllowableItems(NumberOfGalleries, 10000), false);
                    AppendTableRow("Number of allowed groups", AllowableItems(NumberOfGroups, 10000), false);
                    AppendTableRow("Number of allowed content mirrors", AllowableItems(NumberOfContentMirrors, 10000), false);
                    AppendTableRow("Number of domains", NumberOfDomains.ToString(), false);
                }
                catch { }
                AppendTableFooter();

                AppendHr();
            }
            else
            {
                AppendTableHeader();
                AppendTableRow("No HttpContext!!!", System.String.Empty, true);
                AppendTableFooter();

                AppendHr();
            }
        }
        #endregion

        private object GetObjectFromReflectedMethod(string assemblyName, string classFullName, string methodName)
        {
            BindingFlags bf = BindingFlags.Public | BindingFlags.GetProperty | BindingFlags.Static | BindingFlags.FlattenHierarchy;
            Assembly a = Assembly.LoadFrom(Path.Combine(Path.Combine(HttpRuntime.AppDomainAppPath, "bin"), assemblyName));
            Type t = a.GetType(classFullName);
            MethodInfo mi = t.GetMethod(methodName, bf);

            return mi.Invoke(null, null);
        }

        private string AllowableItems(int num, int max)
        {
            if (num >= max) return "Unlimited";

            return num.ToString();
        }

        #region private void GetVersionNumbers()
        /// <summary>
        ///
        /// </summary>
        private void GetVersionNumbers()
        {

            AppendTableHeader();
            AppendTableRow("<h3>Versions</h3>");
            AppendTableFooter();

            AppendTableHeader();
            AppendTableRow(".NET Framework Version", System.Environment.Version.ToString(), true);
            AppendTableRow("Telligent Evolution Platform Schema Version", SiteStatistics.TelligentEvolutionSchemaVersionInfo, true);
            AppendTableRow("&#160;", "&#160;", false);

            Assembly[] assemblies = AppDomain.CurrentDomain.GetAssemblies();

            foreach (Assembly a in assemblies)
            {
                DateTime lastFileWriteTime = DateTime.MinValue;

                string assemblyLongName = a.ToString();

                if (!a.GlobalAssemblyCache && assemblyLongName.IndexOf("0.0.0.0") == -1)
                {
                    string shortName = null;
                    try
                    {
                        shortName = a.GetName().Name.ToString();
                    }
                    catch { continue; }

                    AppendTableRow(shortName, assemblyLongName, false);

                    FileInfo F = null;

                    try
                    {
                        F = new FileInfo(a.Location);
                        lastFileWriteTime = File.GetLastWriteTime(F.FullName);
                    }
                    catch { }

                    if (lastFileWriteTime != DateTime.MinValue)
                        AppendTableRow("Last Write Time", lastFileWriteTime.ToLongDateString() + " " + lastFileWriteTime.ToLongTimeString(), false);
                    AppendTableRow("&#160;", "&#160;", false);
                }
            }

            AppendTableFooter();
            AppendHr();

        }
        #endregion

        #region private void GetCSModules()

        private void GetCSModules()
        {
            AppendTableHeader();
            AppendTableRow("<h3>Loaded CS Modules</h3>");
            AppendTableFooter();

            Type type = typeof(CSApplication);
            object o = type.InvokeMember("Instance", BindingFlags.InvokeMethod | BindingFlags.Static | BindingFlags.Public, null, type, new object[0]);
            FieldInfo fi = type.GetField("_modules", BindingFlags.NonPublic | BindingFlags.Instance);
            if (fi != null)
            {
                AppendTableHeader();

                Hashtable hashTable = fi.GetValue(o) as Hashtable;
                List<string> list = new List<string>();

                foreach (DictionaryEntry de in hashTable)
                    list.Add(de.Value.GetType().FullName + ":" + de.Key.ToString());

                list.Sort();

                foreach (String moduleString in list)
                {
                    string module = moduleString.Substring(moduleString.IndexOf(":") + 1);
                    string typeName = moduleString.Substring(0, moduleString.IndexOf(":"));

                    AppendTableRow(module, typeName, false);
                }

                AppendTableFooter();
            }

            AppendHr();
        }

        #endregion

        #region private void GetRecentEvents()

        private void GetRecentEvents()
        {

            AppendTableHeader();
            AppendTableRow("<h3>Last 20 Events</h3>");
            AppendTableFooter();

            var logs = CommonDataProvider.Instance().GetEventLogEntries(new EventLogQuery() { PageSize = 20, PageIndex = 0 });

            if (logs != null)
            {
                int eventCounter = 0;

                AppendTableHeader();

                foreach (Telligent.Evolution.Components.EventLogEntry eventEntry in logs)
                {
                    AppendTableRow("Event #" + (++eventCounter), string.Empty, true);
                    AppendTableRow("Message", eventEntry.Message, false);
                    AppendTableRow("Category", eventEntry.Category, false);
                    AppendTableRow("Event Date", eventEntry.EventDate.ToLongDateString() + " " + eventEntry.EventDate.ToLongTimeString(), false);
                    AppendTableRow("Machine Name", eventEntry.MachineName, false);
                    AppendTableRow("Event Id", eventEntry.EventID.ToString(), false);
                    AppendTableRow("Event Type", eventEntry.EventType.ToString(), false);
                    AppendTableRow("Settings Id", eventEntry.SettingsID.ToString(), false);
                    AppendTableRow("-----------------", string.Empty, false);
                }

                AppendTableFooter();
            }

            AppendHr();

        }

        #endregion

        #region private void GetNameValueCollection(string type, System.Collections.Specialized.NameValueCollection nvc)
        /// <summary>
        ///
        /// </summary>
        /// <param name="type"></param>
        /// <param name="nvc"></param>
        private void GetNameValueCollection(string type, System.Collections.Specialized.NameValueCollection nvc)
        {
            if (CurrentContext == null) return; // ensure we have context

            if (nvc != null && nvc.Count > 0)
            {
                AppendTableHeader();
                AppendTableRow("<b>" + type + "</b>");

                foreach (string key in nvc)
                {
                    AppendTableRow(key, CurrentContext.Server.HtmlEncode(nvc[key]), false);
                }

                AppendTableFooter();
                AppendHr();
            }

        }
        #endregion

        #region private void GetSession()
        /// <summary>
        ///
        /// </summary>
        private void GetSession()
        {
            if (CurrentContext == null) return; //jump out if the context is null

            System.Web.SessionState.HttpSessionState hss = CurrentContext.Session;

            if (hss != null && hss.Count > 0)
            {
                AppendTableHeader();
                AppendTableRow("<b>Session</b>");

                foreach (string key in hss.Keys)
                {
                    AppendStateBagEntry(key, hss[key], hss[key].GetType());
                }

                AppendTableFooter();
                AppendHr();
            }
        }
        #endregion

        #region private void GetApplication()
        /// <summary>
        ///
        /// </summary>
        private void GetApplication()
        {
            if (CurrentContext == null) return; //jump out if the context is null

            System.Web.HttpApplicationState has = CurrentContext.Application;

            if (has != null && has.Count > 0)
            {
                AppendTableHeader();
                AppendTableRow("<b>Application</b>");

                foreach (string key in has.Keys)
                {
                    AppendStateBagEntry(key, has[key], has[key].GetType());
                }

                AppendTableFooter();
                AppendHr();
            }
        }
        #endregion

        #region private void GetHttpCookieCollection(string type, HttpCookieCollection hcc)
        /// <summary>
        ///
        /// </summary>
        /// <param name="type"></param>
        /// <param name="hcc"></param>
        private void GetHttpCookieCollection(string type, HttpCookieCollection hcc)
        {
            if (CurrentContext == null) return; // jump out if context is null

            if (hcc != null && hcc.Count > 0)
            {
                AppendTableHeader();
                AppendTableRow("<b>" + type + "</b>");

                foreach (string key in hcc)
                {
                    HttpCookie cookie = hcc[key];

                    // if the cookie is not null, get the value(s)
                    if (cookie != null)
                    {
                        string val = null;

                        val = (CurrentContext != null) ? CurrentContext.Server.HtmlEncode(cookie.Value) : cookie.Value;

                        AppendTableRow(key, val, true);
                        AppendTableRow("-- Expires", System.String.Format("{0:s}", cookie.Expires), false);
                        AppendTableRow("-- Domain", cookie.Domain, false);
                        AppendTableRow("-- Path", cookie.Path, false);
                        AppendTableRow("-- Secure", Convert.ToString(cookie.Secure), false);

                        if (cookie.HasKeys)
                        {
                            foreach (string subkey in cookie.Values)
                            {
                                val = (CurrentContext != null) ? CurrentContext.Server.HtmlEncode(cookie[subkey]) : cookie[subkey];

                                AppendTableRow(subkey, val, false);
                            }
                        }
                    }
                }

                AppendTableFooter();
                AppendHr();
            }

        }
        #endregion

        #region private void GetRequestCookies()
        /// <summary>
        ///
        /// </summary>
        private void GetRequestCookies()
        {
            // extract if the request is good
            if (CurrentContext != null) GetHttpCookieCollection("Request Cookies", CurrentContext.Request.Cookies);
        }
        #endregion

        #region private void GetResponseCookies()
        /// <summary>
        ///
        /// </summary>
        private void GetResponseCookies()
        {
            // extract if the response is good
            if (CurrentContext != null) GetHttpCookieCollection("Response Cookies", CurrentContext.Response.Cookies);
        }
        #endregion

        #region private void GetRequestHeaders()
        /// <summary>
        ///
        /// </summary>
        private void GetRequestHeaders()
        {
            // extract if the request is good
            if (CurrentContext != null) GetNameValueCollection("Request Headers", CurrentContext.Request.Headers);
        }
        #endregion

        #region private void GetResponseHeaders()
        /// <summary>
        ///
        /// </summary>
        private void GetResponseHeaders()
        {
            //To Be Implimented.
        }
        #endregion

        #region private void GetServerVariables()
        /// <summary>
        ///
        /// </summary>
        private void GetServerVariables()
        {
            // extract if the request is good
            if (CurrentContext != null) GetNameValueCollection("Server Variables", CurrentContext.Request.ServerVariables);
        }
        #endregion

        #region private void GetTrace()
        /// <summary>
        ///
        /// </summary>
        private void GetTrace()
        {
            try
            {
                System.Type trace = CurrentContext.Trace.GetType();
                MethodInfo mi = trace.GetMethod("Render", BindingFlags.Instance | BindingFlags.NonPublic);
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter htmlWriter = new HtmlTextWriter(sWriter);
                object[] o = new Object[1];
                o[0] = htmlWriter;
                mi.Invoke(CurrentContext.Trace, o);
                string s = sWriter.ToString();

                if (s.Length > 0)
                {
                    AppendTableHeader();
                    AppendTableRow("<b>Trace</b>");

                    AppendTableRow("<i>" + s + "</i>");
                    AppendTableFooter();
                }
            }
            catch { }
        }
        #endregion

        #region private void GetCache()

        /// <summary>
        ///
        /// </summary>
        private void GetCache()
        {
            if (CurrentContext == null) return; // jump out if no context

            IDictionaryEnumerator cacheEnum = CurrentContext.Cache.GetEnumerator();
            bool cacheHeaderAppended = false;

            while (cacheEnum.MoveNext())
            {
                if (cacheHeaderAppended == false)
                {
                    AppendTableHeader();
                    AppendTableRow("<b>Cache</b>");
                    cacheHeaderAppended = true;
                }

                AppendStateBagEntry(cacheEnum.Key.ToString(), cacheEnum.Value, cacheEnum.Value.GetType());

            }

            if (cacheHeaderAppended == true)
            {
                AppendTableFooter();
                AppendHr();
            }
        }

        #endregion

        #region private void GetFooter()

        /// <summary>
        ///
        /// </summary>
        private void GetFooter()
        {
            Sb.Append("</body>\n");
            Sb.Append("</html>");
        }

        #endregion

        #region Constructors

        /// <summary>
        ///
        /// </summary>
        public WebInfo(HttpContext context, string site)
        {
            _CurrentContext = context;
            _Site = site;
        }

        #endregion
    }
    #endregion

}
<%@ WebHandler Language="C#" Class="Telligent.Evolution.Blogs.Components.ThreadViewReport" %>


using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Xml;
using Telligent.Evolution.Components;
using Telligent.Evolution.Discussions.Components;

namespace Telligent.Evolution.Blogs.Components
{
	public class ThreadViewReport : IHttpHandler 
	{
	    HttpContext context;
    
		public void ProcessRequest (HttpContext context) 
		{

            int sectionId;
            int postId = 0;
            string appTypeValue;
            string report;
            
            int.TryParse(context.Request.QueryString["sid"], out sectionId);
            int.TryParse(context.Request.QueryString["pid"], out postId);
            appTypeValue = context.Request.QueryString["appType"];
			ApplicationType appType;
			if (!Enum.TryParse(appTypeValue, true, out appType))
				appType = ApplicationType.Weblog;
            report = context.Request.QueryString["report"];
            
            this.context = context;
            
            switch (report) {
                case "ViewsBySection":
					ViewsByDayReport(sectionId, -1, appType);
                    break;
                case "ViewsByDay":
					ViewsByDayReport(sectionId, postId, appType);
                    break;
                case "ViewsByDayForApp":
					ViewsByDayReport(-1, -1, appType);
                    break;
            }
            
        }

        private void ViewsByDayReport (int sectionId, int postId, ApplicationType appType) 
        {
			var threads = GetViewsPerDay(sectionId, postId, appType);

			context.Response.ContentType = "text/xml";
			XmlTextWriter xml = new XmlTextWriter(context.Response.OutputStream, Encoding.UTF8);

			xml.WriteStartElement("chart");
	        
			// Series labels
			xml.WriteStartElement("xaxis");
			
			foreach (Post p in threads) {
			    xml.WriteStartElement("value");
			    xml.WriteAttributeString("xid", p.PostDate.ToString("d"));
			    xml.WriteValue(p.PostDate.ToString("d MMM"));
			    xml.WriteEndElement();
			}
	        
			xml.WriteEndElement();
	        
	        
			xml.WriteStartElement("graphs");
		    xml.WriteStartElement("graph");
		    xml.WriteAttributeString("gid", "1");
			
			foreach (Post p in threads) {
			    xml.WriteStartElement("value");
			    xml.WriteAttributeString("xid", p.PostDate.ToString("d"));
			    xml.WriteValue(p.Views);
			    xml.WriteEndElement();
			}
	        
			xml.WriteEndElement();

			xml.Close();
        }
		
		private List<Post> GetViewsPerDay(int sectionId, int postId, ApplicationType appType)
		{
			switch (appType)
			{
				case ApplicationType.Weblog:
					var blogDataProvider = WeblogDataProvider.Instance();
					if (postId > 0)
						return blogDataProvider.PostViewsPerDay(postId);
					if (sectionId > 0)
						return blogDataProvider.BlogViewsPerDay(sectionId);
					return blogDataProvider.TotalViewsPerDay();
				case ApplicationType.Forum:
					var forumDataProvider = ForumDataProvider.Instance();
					if (postId > 0)
						return forumDataProvider.ThreadViewsPerDay(postId);
					if (sectionId > 0)
						return forumDataProvider.ForumViewsPerDay(sectionId);
					return forumDataProvider.TotalViewsPerDay();
			}
			return new List<Post>();
		}

		public bool IsReusable {
			get {
				return false;
			}
		}
	}
}
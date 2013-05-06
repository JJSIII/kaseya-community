<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">
   void Page_Load() {
		Context.Response.StatusCode = 500;

      byte[] delay = new byte[1];
      RandomNumberGenerator prng = new RNGCryptoServiceProvider();

      prng.GetBytes(delay);
      Thread.Sleep((int)delay[0]);
        
      IDisposable disposable = prng as IDisposable;
      if (disposable != null) { disposable.Dispose(); }
    }
</script>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8" />
    <title>Error</title>
    <meta name="robots" content="noindex" />
    <style type = "text/css">
	    body {
	        font-family: verdana, arial, helvetica, sans-serif;
	        background-color: #FFF;
	    }
	
        #content {
            width: 80%; 
            text-align:left;
            margin-top:60px;
            margin-right: auto;
            margin-left: auto;
        }

        #content h2 
        {
	        color: #3366ff;
        }
    </style>
</head>
<body>
    <div id="content">
        <h2>Sorry, there was a problem with your last request!</h2>
        <p>Either the site is offline or an unhandled error occurred. We apologize and have logged the error. Please try your request again or if you know who your site administrator is let them know too.</p>
    </div>
</body>
</html>
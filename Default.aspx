<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ResumeRV05292012.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Robert Vignato .NET Web Application Developer</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="Scripts/script.js" type="text/javascript"></script>  
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Xml ID="Xml1" runat="server" 
            DocumentSource="~/Resume/XML/Resume.xml" 
            TransformSource="~/Resume/XML/Resume.xslt">
        </asp:Xml>    
    </div>
    </form>
</body>
</html>

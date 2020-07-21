<$/////////////////////////////////////////////////////////////////////////////////////////////////////////
// The content of this template is intended to modified by developers to customize code generated by
// Orchestration Designer. Most of the code in this file is in standard JSP syntax except for a few spots 
// which would be pointed out by in-line comments.
// This template works for only the AppRoot node.
// NOTE: if this file name has "Sample" in it, it is a parent template file for OD to use to generate working
//		templates. Don't touch it unless you want to change it for all the subsequently generated templates.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

// The $ tags used thoughout the JSP page is reserved for enclosing logic that the OD code generator processes. 
// Logic inside the tags works with the project properties configured at design time and apply them to the generated JSP page.
// Don't touch it unless you want to change the default behavior of how project properties apply to the JSP pages.
$>
<$ IForm form = (IForm)argument; 
	String theme = (String)form.getProperty("theme");
	String themeSwatch = (String)form.getProperty("swatch");
	if (themeSwatch == null){
		themeSwatch = "";
	}
	String[] cssFiles = (String[])form.getProperty("cssfiles");
	String[] jsFiles = (String[])form.getProperty("jsfiles");
	boolean useJquery = (boolean)form.getProperty("usejquery");
$>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.avaya.sce.runtime.*, com.avaya.sce.runtimecommon.*, java.util.Collection" %>
<% response.addHeader("X-Frame-Options", "SAMEORIGIN"); 
SCESession mySession = (SCESession)request.getAttribute("session");
%>
<!DOCTYPE html> 
<html> 
<head> 
	<title>Start</title> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<$ for (String file : cssFiles){ $>
	<link rel="stylesheet" href="<$=file$>"/>
	<$}$>
	<link rel="stylesheet" href="css/avaya.css"/>
	<$ if (useJquery){ $>
	<script src="js/jquery.js"></script>
	<$ } $>
	<$ for (String file : jsFiles){ $>
	<script src="<$=file$>"></script>
	<$}$>
	<script src="js/avaya.js"></script>
	<$ if (useJquery){ $>
	<script src="js/jquery.mobile.avayamsg.js"></script>
	<script src="js/jquery.validate.js"></script>
	<$ } $>
</head> 
<body>
<div data-role="page" data-theme="<$=themeSwatch$>">
	<div data-role="content" data-theme="<$=themeSwatch$>">
	<$ 
		// The logic below works with the flow node properties:
		// Graphic, Graphic Style, Title Message, Message Style 
		String graphic = (String)form.getProperty(WebForm.PROP_GRAPHIC);
		String graphicURIVar = (String)form.getProperty(WebForm.PROP_GRAPHIC_URIVAR);
		String graphicURIVarField = (String)form.getProperty(WebForm.PROP_GRAPHIC_URIVARFIELD);
		String titleMsg = (String)form.getProperty(WebForm.PROP_TITLE_MSG);
		String graphicStyle =  (String)form.getProperty(WebForm.PROP_GRAPHIC_STYLE);
		if (graphicStyle.length() > 0){
			graphicStyle = "style=\"" + graphicStyle + "\"";
		}
		String titleMsgStyle = (String)form.getProperty(WebForm.PROP_TITLE_MSG_STYLE);
		if (titleMsgStyle.length() > 0){
			titleMsgStyle = "style=\"" + titleMsgStyle + "\"";
		}
		if (graphic != null && !graphic.equals("")){
	$>
		<div style=" text-align:center;margin-left:0 auto;margin-right:0 auto;">
			<img src="<$=graphic$>"/>
		</div>
		<br>
	<$}$>
	<$
		if (graphicURIVar != null && !graphicURIVar.equals("")){
			String varField = graphicURIVar;
			if (graphicURIVarField != null && !graphicURIVarField.equals("")){
				varField += ":" + graphicURIVarField;
			}			
	$>
	<div style=" text-align:center;margin-left:0 auto;margin-right:0 auto;">
			<img src="<%=mySession.getVariableFieldValue("<$=varField$>")%>"/>
		</div>
		<br>
	<$}$>
	<$ if (titleMsg != null && !titleMsg.equals("")){ $>
		<p><$=titleMsg$></p>
		<br>
	<$}$>
		<% Submit submit = (Submit)request.getAttribute("submit"); %>
		<form action="<%=(submit.getNext())%>" method="get">
			<$ if (themeSwatch == "") themeSwatch="a"; $>
			<button type="submit" data-theme="<$=themeSwatch$>" data-icon="arrow-r" data-iconpos="right" data-inline="true">Next</button>
		</form>
	
	</div>
</div>
</body>
</html>
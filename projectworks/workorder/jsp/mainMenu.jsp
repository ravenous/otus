
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.avaya.sce.runtime.*, com.avaya.sce.runtime.html.genmodel.*, com.avaya.sce.runtimecommon.*, java.util.*" %>
<% response.addHeader("X-Frame-Options", "SAMEORIGIN"); %>
<!DOCTYPE html> 
<html> 
<head> 
	<title>Menu</title> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	 
	<link rel="stylesheet" href="css/jquery.mobile-1.4.5.css"/>
	
	<link rel="stylesheet" href="css/avaya.css"/>
	
	<script src="js/jquery.js"></script>
	
	
	<script src="js/jquery.mobile-1.4.5.js"></script>
	
	<script src="js/avaya.js"></script>
	
	<script src="js/jquery.mobile.avayamsg.js"></script>
	<script src="js/jquery.validate.js"></script>
	
</head> 
<body>
<div data-role="page" >
	<div data-role="content" >
	<%
		SCESession mySession = (SCESession)request.getAttribute("session");
	%>
	
	
	
	
	
<%//writePrompt
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//		Jsp method to display prompt element dynamically. The way a prompt is displayed on the web
// 		page is all dictated by this method.
////////////////////////////////////////////////////////////////////////////////////////////////////////
%>
<%!
	private void writeElement(SCESession mySession, PromptElement element, JspWriter out) throws Exception{
		if (element.getType() == PromptElement.WEB_LOOP_VAR_COLL){
			PromptLoopElement loopElement = (PromptLoopElement)element;
			IVariable variable = mySession.getVariable(loopElement.getValue());
			ICollection collection = variable.getCollection();
			while(collection.hasMore()){
				for (PromptElement promptElem : loopElement.getChildren()){
					writeElement(mySession, promptElem, out);
				}
				collection.next();
			}
			for (PromptElement promptElem : loopElement.getChildren()){
				writeElement(mySession, promptElem, out);
			}
			collection.reset();
			collection.next();
		}
		if (element.getType() == PromptElement.HTMLTEXTELEMENT){
			out.println(element.getValue());
		}
		if (element.getType() == PromptElement.WEBELEMENT){
			String value = mySession.getVariableFieldValue(element.getValue());		
    		out.println("<label>" + element.getLabel() + "</label>");
   			if (element.getWebElemType().equals("Picture")){
   				value = element.getFileURLValue();
   				int width = element.getWidth();		   				
   				int height = element.getHeight();
   				if (width == 0 || height == 0){
   	    			out.println("<div><img src=\"" + value + "\"/></div>");
   	    		}else{
   	    			out.println("<div><img src=\"" + value + "\" width=\"" + width + "\" height=\"" + height + "\"/></div>");
   				}
   	    	} else if (element.getWebElemType().equals("Video")){
   	    		value = element.getFileURLValue();
   	    		int width = element.getWidth();		   				
   				int height = element.getHeight();
   				String controls = element.getAVControls();
   				if (width == 0 || height == 0){
   					out.println("<div><video " + controls + " src=\"" + value + "\"/></div>");
   				}else{
   					out.println("<div><video " + controls + " src=\"" + value + "\" width=\"" + width + "\" height=\"" + height + "\"/></div>");
   				}
   	    	} else if (element.getWebElemType().equals("Voice")){
   	    		value = element.getFileURLValue();
   	    		String controls = element.getAVControls();
   	    		out.println("<div><audio " + controls + " src=\"" + value + "\"/></div>");
   	    	} else if (element.getWebElemType().equals("Map") || element.getWebElemType().indexOf("Map") == 0){
   	    		String protocol = "http";
   	    		if (mySession.getRequest().isSecure()){
   	    			protocol = "https";
   	    		}
   	    		int width = element.getWidth();		   				
   				int height = element.getHeight();
   				if (width == 0) width = 400;
   				if (height == 0) height = 300;
   				String mapAPIKey = mySession.getParameter("mapAPIKey");
   				if (element.getWebElemType().contains("BAIDU")){   					
   					if (mapAPIKey != null && mapAPIKey.length() > 0){
   						mapAPIKey = "&ak=" + mapAPIKey;
   					}else{
   						mapAPIKey = "";
   					}
   					out.println("<div><img src=\"" + protocol + "://api.map.baidu.com/staticimage/v2?center=" + value + mapAPIKey + "&width=" + width + "&height=" + height + "&zoom=16&markers=" + value + "&markerStyles=-1," + protocol + "://api.map.baidu.com/images/marker_red.png\"/></div>");
   				}else if(element.getWebElemType().contains("OTHER")){
   					//For other map type, customers would have to customize the following code to make sure the static map url is generated according to 3rd party API docs.
   					if (mapAPIKey != null && mapAPIKey.length() > 0){
   						mapAPIKey = "&key=" + mapAPIKey;
   					}else{
   						mapAPIKey = "";
   					}
   					out.println("<div><img src=\"" + protocol + "://<domain>/<map url>?center=" + value + mapAPIKey + "&zoom=14&size=" + width + "x" + height + "&markers=color:red%7C" + value + "\"/></div>");   					
   				}else{
   					if (mapAPIKey != null && mapAPIKey.length() > 0){
   						mapAPIKey = "&key=" + mapAPIKey;
   					}else{
   						mapAPIKey = "";
   					}
   					out.println("<div><img src=\"" + protocol + "://maps.googleapis.com/maps/api/staticmap?center=" + value + mapAPIKey + "&zoom=14&size=" + width + "x" + height + "&markers=color:red%7C" + value + "\"/></div>");
   				}
   			} else if (element.getWebElemType().equals("Text")){
   	   			out.println("<input type=\"text\" value=\"" + value + "\" readonly/>");
   			} else if (element.getWebElemType().equals("TextArea")){
   				int width = element.getWidth();		   				
   				int height = element.getHeight();
   				out.println("<textarea rows=\"" + height + "\" cols=\"" + width + "\" readonly/>");
   				out.println(value);
   				out.println("</textarea>");
   			} 
		}
		if (element.getType() == PromptElement.VARIABLE_TEXT){
			String value = mySession.getVariableFieldValue(element.getValue());
			out.println(value);
		}
	}

	public void writePrompt(SCESession mySession, String promptName, TextDisplay.NameType type, JspWriter out) throws Exception{
		//Display prompt elements to show the input value dynamically
		List<PromptElement> elems = TextDisplay.getPromptElements(mySession, promptName, type);			
		for (PromptElement element : elems){
			writeElement(mySession, element, out);
   		}
	}
%>

	<%
		String[] prompts = (String[])request.getAttribute("prompts");
		for (String prompt : prompts){
			writePrompt(mySession, prompt, TextDisplay.NameType.CONST, out);
		}
		String choice;
		String desc;
	%>
		<div data-role="fieldcontain">
		
		    
		<ul data-role="listview"  >
		<% String menuVarName = mySession.getServlet().getServletName(); %>
		
		
			<%
			choice = (MenuChoiceInput.getChoice("mainMenu:listClaim",ChoiceInput.ChoiceType.TEXTSET, mySession));
			desc = (MenuChoiceInput.getDescriptionTextset("", mySession));
			if (choice.length() > 0 || "".length() > 0 || desc.length() > 0){
	        %>
								
			<li>
				<a href="onListClaim?<%=SCERT.DDSESSIONID%>=<%=mySession.getEncodedSessionId()%>&<%=menuVarName%>___value=listClaim">
					
					
						<%=choice%>
					
				</a>
			</li>
		   <% } %>	
		
		
			<%
			choice = (MenuChoiceInput.getChoice("mainMenu:listMyClaim",ChoiceInput.ChoiceType.TEXTSET, mySession));
			desc = (MenuChoiceInput.getDescriptionTextset("", mySession));
			if (choice.length() > 0 || "".length() > 0 || desc.length() > 0){
	        %>
								
			<li>
				<a href="onListMyClaim?<%=SCERT.DDSESSIONID%>=<%=mySession.getEncodedSessionId()%>&<%=menuVarName%>___value=listMyClaim">
					
					
						<%=choice%>
					
				</a>
			</li>
		   <% } %>	
		
		
			<%
			choice = (MenuChoiceInput.getChoice("mainMenu:getClaim",ChoiceInput.ChoiceType.TEXTSET, mySession));
			desc = (MenuChoiceInput.getDescriptionTextset("", mySession));
			if (choice.length() > 0 || "".length() > 0 || desc.length() > 0){
	        %>
								
			<li>
				<a href="onTakeClaim?<%=SCERT.DDSESSIONID%>=<%=mySession.getEncodedSessionId()%>&<%=menuVarName%>___value=getClaim">
					
					
						<%=choice%>
					
				</a>
			</li>
		   <% } %>	
		
		
			<%
			choice = (MenuChoiceInput.getChoice("mainMenu:closeClaim",ChoiceInput.ChoiceType.TEXTSET, mySession));
			desc = (MenuChoiceInput.getDescriptionTextset("", mySession));
			if (choice.length() > 0 || "".length() > 0 || desc.length() > 0){
	        %>
								
			<li>
				<a href="onGetMyInWorkClaim?<%=SCERT.DDSESSIONID%>=<%=mySession.getEncodedSessionId()%>&<%=menuVarName%>___value=closeClaim">
					
					
						<%=choice%>
					
				</a>
			</li>
		   <% } %>	
		
		
			<%
			choice = (MenuChoiceInput.getChoice("mainMenu:farewell",ChoiceInput.ChoiceType.TEXTSET, mySession));
			desc = (MenuChoiceInput.getDescriptionTextset("", mySession));
			if (choice.length() > 0 || "".length() > 0 || desc.length() > 0){
	        %>
								
			<li>
				<a href="exit?<%=SCERT.DDSESSIONID%>=<%=mySession.getEncodedSessionId()%>&<%=menuVarName%>___value=exitApp">
					
					
						<%=choice%>
					
				</a>
			</li>
		   <% } %>	
		
			</ul>
		</div>
	</div>
</div>
</body>
</html>
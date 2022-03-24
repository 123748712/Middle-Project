<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String fileName = (String) request.getAttribute("fileName");
    String key =(String) request.getAttribute("key");
    
    %>
    
    { "fileName" : "<%=fileName%>",
      "key" : "<%=key %>"}
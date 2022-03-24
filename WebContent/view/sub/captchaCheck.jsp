<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    boolean captchaCheck = (boolean) request.getAttribute("captchaCheck");
    %>
    
    <%if(captchaCheck) { %>
    
    { "captchaCheck" : "<%=captchaCheck%>",
      "msg" : "인증이 완료되었습니다."}
    
    <%} else {%>
    { "captchaCheck" : "<%=captchaCheck%>",
      "msg" : "인증에 실패하였습니다."}
    <%}%>
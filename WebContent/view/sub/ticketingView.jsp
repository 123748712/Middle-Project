<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String type = request.getParameter("type");
%>
    
<%-- 회원 예매 조회 --%>
<% if (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("admin")) { %>
	<jsp:include page="./ticketingViewMember.jsp"/>
<% } %>

<%-- 비회원 예매 조회 --%>
<% if (session.getAttribute("loginId") == null) { %>
	<jsp:include page="./ticketingViewNonMember.jsp"/>
<% } %>

<%-- 관리자 회원 예매 조회 --%>
<% if (session.getAttribute("loginId") != null && session.getAttribute("loginId").equals("admin") && type == null) { %>
	<jsp:include page="./ticketingViewMemberAdmin.jsp"/>
<% } %>

<%-- 관리자 비회원 예매 조회 --%>
<% if (session.getAttribute("loginId") != null && session.getAttribute("loginId").equals("admin") && type != null && type.equals("nonMember")) { %>
	<jsp:include page="./ticketingViewNonMemberAdmin.jsp"/>
<% } %>
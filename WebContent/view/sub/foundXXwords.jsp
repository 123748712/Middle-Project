<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int foundXXwords = (Integer)request.getAttribute("foundXXwords");

if(foundXXwords > 0){
%>
	{
		"foundXXwords" : 1,
		"msg"          : "욕설을 등록할 수 없습니다."
	}
<%
}
%>
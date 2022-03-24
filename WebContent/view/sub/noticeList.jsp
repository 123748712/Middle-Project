<%@page import="kr.or.ddit.lottecgvbox.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
int sPage = (Integer)request.getAttribute("sPage");
int ePage = (Integer)request.getAttribute("ePage");
int ttPage = (Integer)request.getAttribute("ttPage");
%>
		{
			"sp"		: "<%=sPage%>",
			"ep"		: "<%=ePage%>",
			"tp"		: "<%=ttPage%>",
			"datas"	: [
<%
			int i = 0;
			for(NoticeVO vo : list){
				if(i>0) out.print(",");
%>		
				{
					"noti_num"		: "<%=vo.getNoti_num() %>",
					"noti_wri"		: "<%=vo.getNoti_wri() %>",
<%					if(vo.getNoti_tit() != null){ %>
					"noti_tit"		: "<%=vo.getNoti_tit().replaceAll("\r\n", "<br>") %>",
<%					}else{ %>
					"noti_tit"		: "",
<%					} %>
					"noti_con"		: "<%=vo.getNoti_con().replaceAll("\r\n", "<br>").trim() %>"
				}
<%	
				i++;
			}
%>
			]
		}
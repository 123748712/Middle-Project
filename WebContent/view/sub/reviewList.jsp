<%@page import="kr.or.ddit.lottecgvbox.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReviewVO> list = (List<ReviewVO>)request.getAttribute("list");
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
			for(ReviewVO vo : list){
				if(i>0) out.print(",");
%>		
				{
					"mov_rev_num"		: "<%=vo.getMov_rev_num() %>",
					"mem_cd"		: "<%=vo.getMem_cd() %>",
					"nmem_cd"		: "<%=vo.getNmem_cd() %>",
					"mov_rev_wri"		: "<%=vo.getMov_rev_wri() %>",
<%					if(vo.getMov_rev_tit() != null){ %>
					"mov_rev_tit"		: "<%=vo.getMov_rev_tit().replaceAll("\r\n", "<br>") %>",
<%					}else{ %>
					"mov_rev_tit"		: "",
<%					} %>
					"mov_rev_con"		: "<%=vo.getMov_rev_con().replaceAll("\r\n", "<br>").trim() %>"
				}
<%	
				i++;
			}
%>
			]
		}
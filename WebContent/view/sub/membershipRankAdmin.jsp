<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.MemberBuyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	List<MemberBuyVO> memberBuyList = (List<MemberBuyVO>) request.getAttribute("memberBuyList");
%>

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">구매금액 비례 연간 구매등급 제공</h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->
<div class="membershipAdmin">
	<table class="table table-striped text-center" id="msaTbl">
		<caption class="sr-only">구매등급 비례 연간포인트 지급 - ID, 회원명, 구매금액, 구매등급 정보 제공</caption>
		<colgroup>
			<col style="width: 25%;">
			<col style="width: 25%;">
			<col style="width: 25%;">
			<col style="width: 25%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" class="text-center">ID</th>
				<th scope="col" class="text-center">회원명</th>
				<th scope="col" class="text-center">구매금액</th>
				<th scope="col" class="text-center">구매등급</th>
			</tr>
		</thead>
		<tbody>
			<% if (memberBuyList != null && memberBuyList.size() > 0) { %>
				<% DecimalFormat df = new DecimalFormat("###,###"); %>
				
				<% for (int i = 0; i < memberBuyList.size(); i++) { %>
					<% MemberBuyVO vo = memberBuyList.get(i); %>
					
					<tr>
						<td><%=vo.getMemberVO().getMemId() %></td>
						<td><%=vo.getMemberVO().getMemNm() %></td>
						<td><%=df.format(vo.getBuyPri()) %></td>
						<td><%=vo.getMembershipVO().getMsRk() %>
							<button type="button" class="btn btn-xs btn_point" onclick="alert('서비스 준비 중입니다.\n빠른 시일 내에 찾아뵙겠습니다.');">
								<i class="xi-refresh" aria-hidde="true"></i>
								<span class="sr-only">구매등급 갱신</span>
							</button>
						</td>
					</tr>
				<% } %>
			<% } %>
		</tbody>
	</table>
</div>
<!-- //여기까지 페이지 내용 -->
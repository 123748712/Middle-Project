<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">멤버쉽</h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->
<div class="membership">
	<div class="top_infor">
		<div class="page_box">
			
			<% if (session.getAttribute("loginId") == null) { %>
			<p class="txt"><strong>회원가입 하시고</strong> 멤버쉽의 풍성한 혜택을 만나보세요.</p>
			<p class="text-center">
				<a href="<%=request.getContextPath() %>/join.do" class="join">회원가입</a>
			</p>
			
			<p class="text-center">
				<small>이미 LOTTE CGV BOX의 회원이신가요? <a href="<%=request.getContextPath() %>/login.do" class="login">로그인</a></small>
			</p>		
			
			<% } %>
			
			
			<% if (session.getAttribute("loginId") != null) { %>

			
				<jsp:include page="./membershipPoint.jsp"/>
			<% } %>
		</div>
	</div>
</div>
<!-- //여기까지 페이지 내용 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="menu">
	<div class="blind"></div>

	<nav>
		<ul class="depth1">
			<li><a href="<%=request.getContextPath() %>/searchMovie.do">영화</a>
				<ul class="depth2">
					<li><a href="<%=request.getContextPath() %>/searchMovie.do">영화검색</a></li>
					<li><a href="<%=request.getContextPath() %>/location.do">극장 위치 찾기</a></li>
					<% if (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("admin")) { %>
					<li class="child"><a href="javascript:void(0);">회원 예매</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath() %>/ticketing.do">예매하기</a></li>
							<li><a href="<%=request.getContextPath()%>/ticketingView.do">예매조회</a></li>
						</ul>
					</li>
					<% } %>
					<% if (session.getAttribute("loginId") == null) { %>
					<li class="child"><a href="javascript:void(0);">비회원 예매</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath()%>/nonMember.do">예매하기</a></li>
							<li><a href="<%=request.getContextPath()%>/ticketingView.do">예매조회</a></li>
						</ul>
					</li>
					<% } %>
					<% if (session.getAttribute("loginId") != null) { %>
					<li><a href="<%=request.getContextPath() %>/card.do">카드사 조회</a></li>
					<% } %>
					<li><a href="<%=request.getContextPath() %>/review.do">영화후기</a></li>
				</ul>
			</li>
			<% if (session.getAttribute("loginId") == null || (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("admin"))) { %>
			<li><a href="<%=request.getContextPath() %>/membership.do">혜택</a>
				<ul class="depth2">
					<li><a href="<%=request.getContextPath() %>/membership.do">멤버쉽</a></li>
				</ul>
			</li>
			<% } %>
			<li><a href="<%=request.getContextPath() %>/notice.do">고객센터</a>
				<ul class="depth2">
					<!-- 하위 3차메뉴가 있을 경우 child 클래스 및 a태그 href에 javascript:void(0); 추가 -->
					<li><a href="<%=request.getContextPath() %>/notice.do">공지사항</a></li>
					<li class="child"><a href="javascript:void(0);">고객센터 Q&amp;A</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath() %>/qna.do">자주 묻는 질문</a></li>
						</ul>
					</li>
					<li class="child"><a href="javascript:void(0);">환불 응대</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath() %>/payment.do">결제 문의 조회</a></li>
							<li><a href="<%=request.getContextPath() %>/refund.do">환불 문의 조회</a></li>
						</ul>
					</li>
					<li class="child"><a href="javascript:void(0);">분실물 관리</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath() %>/lost.do">분실물 문의 조회</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<%if(session.getAttribute("loginId") != null && session.getAttribute("loginId").equals("admin")) {%>
			<li><a href="">관리자</a>
				<ul class="depth2">
					<li class="child"><a href="javascript:void(0);">회원 예매</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath()%>/ticketingView.do">회원 예매 조회</a></li>
						</ul>
					</li>
					<li class="child"><a href="javascript:void(0);">비회원 예매</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath()%>/ticketingView.do?type=nonMember">비회원 예매 조회</a></li>
						</ul>
					</li>
					<li class="child"><a href="javascript:void(0);">멤버쉽 포인트</a>
						<ul class="depth3">
							<li><a href="<%=request.getContextPath()%>/membershipPointAdmin.do">구매등급 비례 연간포인트 지급</a></li>
							<li><a href="<%=request.getContextPath()%>/membershipRankAdmin.do">구매금액 비례 연간 구매등급 제공</a></li>
						</ul>
					</li>
					<li><a href="javascript:void(0);" onclick="alert('서비스 준비 중입니다.\n빠른 시일 내에 찾아뵙겠습니다.');">영화후기 관리</a></li>
				</ul>
			</li>
			<%}%>
		</ul>
	</nav>
</div>
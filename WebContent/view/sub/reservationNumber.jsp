<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    
<!-- 페이지 타이틀 -->
<h2 class="pageTitle">예매티켓출력</h2>
<!-- //페이지 타이틀 -->

<%
	String watNum = (String)session.getAttribute("watNum");
	List<String> watSeat =(List<String>) session.getAttribute("watSeat");
	
%>


    
<!-- 여기부터 페이지 내용 -->
<div class="step step4" style="display: block;">
<!-- complement of payment 섹션 -->
<div class="section seciton-complement">
<!-- <div class="section"> -->
	<div class="col-head">
	</div>
	
	<div class="col-body">
		<div class="article result">
			<div class="text_complement">
				<h2>예매가 완료 되었습니다.</h2>
			</div>
			<div class="ticket_summary_wrap">
				<div class="ticket_summary">
					<div class="poster">
						<img src="<%=request.getContextPath()%>/images/common/movie0<%=session.getAttribute("movCd") %>.jpg">
					<table>
						<thead></thead>
						<tbody>
							<tr class="ticket_no">
								<th scope="row">예매번호&nbsp;</th>
								<td>
									<span class="red"><%=session.getAttribute("watCd") %></span>
								</td>
							</tr>
							<tr class="movie_name">
								<th scope="row">영화</th>
								<td>
									<em><%=session.getAttribute("movNm") %></em>
								</td>
							</tr>
							<tr class="theater">
								<th scope="row">극장</th>
								<td>
									<em>
										<span class="theater_loc"><%=session.getAttribute("movPa") %></span>
									</em>
								</td>
							</tr>
							<tr class="movie_date">
								<th scope="row">일시</th>
								<td>
								   <em><%=session.getAttribute("movPd") %> <%=session.getAttribute("watPd") %></em>
								</td>
							</tr>
							<tr class="people">
								<th scope="row">인원</th>
								<td>
									<em><%=session.getAttribute("watNum") %></em>
								</td>
							</tr>
							<tr class="seat">
								<th scope="row">좌석</th>
								<td>
								
									<em>
									<%=session.getAttribute("watSeat") %>
									</em>
									
				
										
								</td>
							</tr>
							<tr class="payment_price">
								<th scope="row">결제금액&nbsp;&nbsp;</th>
								<td>
									<span class="price"><%=session.getAttribute("totalCost") %></span>
									원
								</td>	
							</tr>
						</tbody>
					</table>
					</div>
				</div>
			<div class="ticket_exception" style="display: none;">
				<em>Lotte Cgv Box는 대중교통이용을 권장합니다.</em>
				<br>
				<span class="desc">발레파킹을 이용하실 수 있으나, 가능 차량수가 한정적이며 주변 교통상황에 따라 지연 될 수 있습니다.</span>
			</div>
			</div>
		<div class="ticket_instructions">
			<dl>
				<dt>
					<h3>예매 유의 사항&nbsp;&nbsp;</h3><br>	
				</dt>
				
				<dd>
					<ul>
						<li>
							"Cgv Box 포인트는 상영일 익일 적립됩니다."
							<em>(영화관람권, 비회원 예매 제외)</em>
						</li>
						<li>영화 상영 스케쥴은 영화관사정에 의해 변경될 수 있습니다.</li>
						<li>비회원 예매하신 경우는 예매내역이 이메일로 발송되지 않습니다.</li>
					</ul>
				</dd>
			</dl>
		</div>
		
		<div class="btns">
			<a href="<%= request.getContextPath()%>/main.do" class="btn btn-danger">홈페이지 바로가기</a>
			<a href="<%= request.getContextPath()%>/ticketingView.do" class="btn btn-danger">예매내역 확인/취소</a>
		</div>
	
	</div>
</div>
</div>
</div>


<!-- //여기까지 페이지 내용 -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.WatchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = (String) session.getAttribute("name");
%>

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">예매 조회</h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->
<form action="ticketingView.do" method="post" id="ticketingViewForm">
	<table class="table table-striped" id="ticketingViewTbl">
		<caption class="sr-only">회원 예매조회 - ID, 이름, 영화명, 예매일시 정보 제공</caption>
		<colgroup>
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 40%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">이름</th>
				<th scope="col">영화명</th>
				<th scope="col">예매일시</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<% 
				List<WatchVO> memberTicketings = (List<WatchVO>) request.getAttribute("memberTicketings");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			%>
			
			<% if (memberTicketings != null && memberTicketings.size() > 0) { %>
				<% for (int i = 0; i < memberTicketings.size(); i++) { %>
					<% WatchVO vo = memberTicketings.get(i); %>
					
					<tr id="<%=vo.getWatCd() %>">
						<td><%=vo.getMemberVO().getMemId() %></td>
						<td><%=vo.getMemberVO().getMemNm() %></td>
						<td><%=vo.getMovieVO().getMovNm() %></td>
						<td><%=vo.getWatDt() %></td>
						<td>
							<button type="button" class="btn btn-danger btn-xs btn_cancle">예매취소</button>
						</td>
					</tr>
				<% } %>
			<% } else { %>
				<tr>
					<td colspan="5" class="text-center"><%=name %>님의 예매내역이 없습니다.</td>
				</tr>
			<% } %>
		</tbody>
	</table>
</form>

<script>
	
	/* 예매 취소 */
	$('.btn_cancle').on('click', function(){
		let self = $(this);
		
		if (!confirm('해당 예매를 취소하시겠습니까?')) {
			return;
		}
		
		$.ajax({
			type: 'post',
			url: '<%=request.getContextPath() %>/memberTicketingCancle.do',
			data: { "watCd" : self.parents('tr').attr('id') },
			success: function(data){
				if (data.isCancled == 'Y') {
					alert(data.msg);
					$('#' + data.watCd).remove();
					
					if ($('#ticketingViewTbl tbody').find('tr').length == 0) {
						let html = '';
						
						html += '<tr>';
						html += '	<td colspan="5" class="text-center"><%=name %>님의 예매내역이 없습니다.</td>';
						html += '</tr>';
						
						$('#ticketingViewTbl tbody').html(html);
					}
				} else {
					alert(data.msg);
				}
			},
			error: function(xhr){
				alert(xhr.status);
			},
			dataType: 'json'
		});
	});
</script>
<!-- //여기까지 페이지 내용 -->
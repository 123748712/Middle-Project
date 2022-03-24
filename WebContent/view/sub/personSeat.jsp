<%@page import="java.util.Arrays"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.WatchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<WatchVO> seatList = (List<WatchVO>) request.getAttribute("seatList");
	String[][] seatArr = null;
	
	if (seatList != null && seatList.size() > 0) {
		seatArr = new String[9][9];
		
		for (int i = 0; i < seatArr.length; i++) {
			Arrays.fill(seatArr[i], "-1");
			
			for (int j = 0; j < seatList.size(); j++) {
				String alphabet = seatList.get(j).getWatSeat().substring(0, 1);
				int num = Integer.parseInt(seatList.get(j).getWatSeat().substring(1));
				int idx = 0;
				
				/* A~I 알파벳 순으로 인덱스 구하기 */
				switch (alphabet) {
				case "A":
					idx = 0;
					break;
				case "B":
					idx = 1;
					break;
				case "C":
					idx = 2;
					break;
				case "D":
					idx = 3;
					break;
				case "E":
					idx = 4;
					break;
				case "F":
					idx = 5;
					break;
				case "G":
					idx = 6;
					break;
				case "H":
					idx = 7;
					break;
				case "I":
					idx = 8;
					break;
				}
				seatArr[idx][num-1] = seatList.get(j).getWatSeat();
			}
		}
	}
%>

 <!-- 페이지 타이틀 -->
<h2 class="pageTitle">인원/좌석 선택 </h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->

<!-- 
	watSeat       : 좌석 (input type="hidden" name="watSeat")
	currentPerson : 선택된 인원 총합계를 저장할 변수
	seatArr       : 좌석들의 value를 담을 배열 변수
	totalCost     : 가격 총 합계 - $('.totalCost').text()
 -->
 
 <div id="reserveStep02" class="section_step_con step02 active">
    <form action="personSeat.do" method="post">
    	<div class="article article_seat">
	        <div class="inner">
	            <div id="PersonSeatCount">
	                <div class="select_num_people_wrap">
	                   
						<!--영화 포스터 및 정보표시 -->
	                    <div class="movie_infor">
	                        <span class="thm">
	                            <img src="<%=request.getContextPath()%>/images/common/movie0<%=session.getAttribute("movCd") %>.jpg">
	                        </span>
	                        <div class="group_infor">
	                            <div class="bx_tit">
	                                <span class="ic_grade gr_15"></span>
	                                <strong><%=session.getAttribute("movNm") %></strong>
	                            </div>
	                            <dl>
	                                <dt>일시</dt>
	                                <dd class="sub_info1">
	                                    <%=session.getAttribute("movPd") %>
	                                    <span class="time"><%=session.getAttribute("watPd") %></span><em id="today"></em>
	                                </dd>
	                                <dt>영화관</dt>
	                                <dd class="sub_info1"><%=session.getAttribute("movPa") %>관</dd>
	                            </dl>
	                        </div>
	                        
	                    </div>
	                     
						<!--관객 구분 -->
	                    <div class="count_people">
	                        <ul>
	                            <li id="person_10" data-code="10" data-peple="청소년" data-count="0">
	                                <strong class="tit">청소년</strong>
	                                 <span class="bx_num">
	                                     <button type="button" class="btn_mins" id="Minus|10">감소</button>
	                                     <div class="txt_num">0</div>
	                                     <button type="button" class="btn_plus" id="Plus|10">증가</button>
	                                 </span>
	                            </li>
	                            <li id="person_20" data-code="20" data-peple="성인" data-count="0">
	                                <strong class="tit">성인</strong>
	                                 <span class="bx_num">
	                                     <button type="button" class="btn_mins" id="Minus|20">감소</button>
	                                     <div class="txt_num">0</div>
	                                     <button type="button" class="btn_plus" id="Plus|20">증가</button>
	                                 </span>
	                            </li>
	                            <li id="person_12" data-code="12" data-peple="노약자" data-count="0">
	                                <strong class="tit">노약자</strong>
	                                 <span class="bx_num">
	                                     <button type="button" class="btn_mins" id="Minus|12">감소</button>
	                                     <div class="txt_num">0</div>
	                                     <button type="button" class="btn_plus" id="Plus|12">증가</button>
	                                 </span>
	                            </li>
	                        </ul>
	                    </div>
	                    
					<!--시트-->
	                </div>                    
	            </div>
	            <div class="select_seat_wrap">
	                <div id="container" class="seat_wrap">
	                    <div class="screen">
	                        <span class="title_screen1">SCREEN</span>
	                    </div>
	                    
	                    <div class="showMap">
	                        <div class="table_container">
	                            <table id="showMapTable">
	                                <tbody id="showMapTableBody">
	                                	<% char ch = 'A'; %>
	                                	
	                                	<% for (int i = 0; i < 9; i++, ch++) { %>
	                                		<tr>
	                                			<td><%=ch %></td>
	                                			
	                                			<% for (int j = 0; j < 9; j++) { %>
	                                				<% String noSeatClass = ""; %>
	                                				
	                                				<% if (seatArr != null && seatArr.length > 0) { %>
	                                					<% if (seatArr[i][j].equals(ch+""+(j+1))) { %>
	                                						<% noSeatClass = " no_seat"; %>
	                                					<% } %>
	                                				<% } %>
	                                			
	                                				<td class="seat<%=noSeatClass %>">
	                                					<input type="hidden" name="watSeat">
	                                					<a href="#seat/<%=ch %><%=j+1 %>" data-seat="<%=ch %><%=j+1 %>"><%=j+1 %></a>
	                                				</td>
	                                			<% } %>
	                                		</tr>
	                                	<% } %>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="seat_btm_box">
	                <div class="seat_type_box">
	                    <div class="top_info">
	                        <span class="seat_type1">선택 좌석</span>
	                        <span class="seat_type2">선택 가능</span>
	                        <span class="seat_type3">예매 완료</span>
	                        <span class="seat_type4">선택 불가</span>
	                    </div>
	                </div>
	            </div>
	            
	            <div id="PersonSeatSummery">
	                <div class="select_seat_result">
	                    <div class="group_left">
	                        <dl class="total_price">
	                            <dt>총 합계</dt>
	                            <dd>
	                                <strong class="totalCost">0</strong> 원
	                            </dd>
	                        </dl>
	                    </div>
	                    
	                    <div class="group_right">
	                        <a href="<%=request.getContextPath() %>/ticketing.do" class="back">뒤로가기</a>
	                        <a href="<%=request.getContextPath() %>/store.do" class="pay">결제하기</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
</div>

<script src="<%=request.getContextPath() %>/js/personSeat.js"></script>

<script>
	$(function day() {
		let week = new Array('일', '월', '화', '수', '목', '금', '토');
		let today = new Date('<%=session.getAttribute("movPd")%>').getDay();
		let tod = week[today];
		$("#today").text("("+tod+")");
	});
	
	/* 가격 총 합계 가져오기 */
	let movCost = "";
	$('.select_seat_wrap .showMap td a').on('click', function(){
		setTimeout(function(){
			movCost = $('.totalCost').text();
			console.log($('.totalCost').text());
		}, 0);
	});
	
	/* 인원선택 버튼 클릭 시, 선택된 인원 총합계 구하기 */
	let currentPerson = 0; // 선택된 인원 총합계를 저장할 변수
	
	$('.btn_mins, .btn_plus').on('click', function(){
		let num = Number($(this).siblings('.txt_num'));
		
		if ($(this).is('.btn_mins')) {
			currentPerson -= num;
		}
		if ($(this).is('.btn_plus')) {
			currentPerson += num;
		}
	});
	
	/* 좌석 value값 갱신 */
	let seatArr = []; // 좌석들의 value를 담을 배열 변수
	
	$('.select_seat_wrap .showMap td a').on('click', function(){
		if (currentPerson == 0 || $(this).parent().hasClass('no_select') || $(this).parent().hasClass('no_seat')) {
			return;
		}
		
		let seat = $(this).attr('data-seat');
		
		if ($(this).parent().hasClass('active')) {
			$(this).siblings().val('');
			
			// 좌석 배열에서 해당 좌석 value 삭제
			for (let i = 0; i < seatArr.length; i++) {
				if (seatArr[i] == seat) {
					seatArr.splice(i, 1);
					i--;
				}
			}
		} else {
			$(this).siblings().val(seat);
			seatArr.push(seat);
		}
	});
	
	$(".pay").on("click", function(){

		$.ajax({
			
			type : "post",
			url : "<%=request.getContextPath()%>/watch.do",
			traditional : true,
			data : {
				totalCost : movCost,
				watNum : seatArr.length,
				watSeat : seatArr
			},
			dataType : "json"
		});

	});
</script>
<!-- //여기까지 페이지 내용 -->
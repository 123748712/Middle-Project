<%@page import="kr.or.ddit.lottecgvbox.vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<MovieVO> movieList = (List<MovieVO>) request.getAttribute("movieList");
%>

 <!-- 페이지 타이틀 -->
<h2 class="pageTitle"> 예매 </h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->

<div id="loading">
   	<img src="<%=request.getContextPath()%>/images/sub/loading_img.gif" alt="로딩 중">
</div>
   
<div class="ticket_wrap">
	<form action="personSeat.do" method="get" id="ticketingForm">
		<!-- 
			movCd : 영화코드
			movNm : 영화명
			movPd : 상영날짜 (달력)
			movPa : 상영관
			watPd : 상영시간
		 -->
		<input type="hidden" name="movCd">
		<input type="hidden" name="movNm">
		<input type="hidden" name="movPa">
		<input type="hidden" name="watPd">
	
	    <div id="reserveStep01" class="section_step_con step01 active">
	        <div class="article article_cinema">
	            <div class="group_top">
	                <h4 class="tit">영화관</h4>
	            </div>
	            <div class="cinema_select_wrap">
	                <ul>
	                    <li class="depth1 active">
	                        <a href="#none">서울<span>(23)</span></a> 
	                        <div class="depth2 active">
	                            <ul>
	                                <li>
	                                    <a href="#none">가산디저털</a>
	                                </li>
	                                <li>
	                                    <a href="#none">가양</a>
	                                </li>
	                                <li>
	                                    <a href="#none">강동</a>
	                                </li>
	                                <li>
	                                    <a href="#none">건대입구</a>
	                                </li>
	                                <li>
	                                    <a href="#none">김포공항</a>
	                                </li>
	                                <li>
	                                    <a href="#none">노원</a>
	                                </li>
	                                <li>
	                                    <a href="#none">도곡</a>
	                                </li>
	                                <li>
	                                    <a href="#none">독산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">브로드웨이(신사)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">서울대입구</a>
	                                </li>
	                                <li>
	                                    <a href="#none">수락산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">수유</a>
	                                </li>
	                                <li>
	                                    <a href="#none">신도림</a>
	                                </li>
	                                <li>
	                                    <a href="#none">신림</a>
	                                </li>
	                                <li>
	                                    <a href="#none">에비뉴엘(명동)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">영등포</a>
	                                </li>
	                                <li>
	                                    <a href="#none">용산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">월드타워</a>
	                                </li>
	                                <li>
	                                    <a href="#none">은평(롯데몰)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">중랑</a>
	                                </li>
	                                <li>
	                                    <a href="#none">청량리</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>
						
						<li class="depth1">
	                        <a href="#none">경기/인천<span>(46)</span></a>
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">광교아울렛</a>
	                                </li>
	                                <li>
	                                    <a href="#none">광명(광명사거리)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">광명아울렛</a>
	                                </li>
	                                <li>
	                                    <a href="#none">광주터미널</a>
	                                </li>
	                                <li>
	                                    <a href="#none">구리아울렛</a>
	                                </li>
	                                <li>
	                                    <a href="#none">동탄</a>
	                                </li>
	                                <li>
	                                    <a href="#none">라페스타</a>
	                                </li>
	                                <li>
	                                    <a href="#none">마석</a>
	                                </li>
	                                <li>
	                                    <a href="#none">별내</a>
	                                </li>
	                                <li>
	                                    <a href="#none">병점</a>
	                                </li>
	                                <li>
	                                    <a href="#none">부천(신중동역)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">부천역</a>
	                                </li>
	                                <li>
	                                    <a href="#none">부평</a>
	                                </li>
	                                <li>
	                                    <a href="#none">부평역사</a>
	                                </li>
	                                <li>
	                                    <a href="#none">북수원(천천동)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">산본피트인</a>
	                                </li>
	                                <li>
	                                    <a href="#none">서수원</a>
	                                </li>
	                                <li>
	                                    <a href="#none">성남중앙(신흥역)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">센트럴락</a>
	                                </li>
	                                <li>
	                                    <a href="#none">송탄</a>
	                                </li>
	                                <li>
	                                    <a href="#none">수원(수원역)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">수지</a>
	                                </li>
	                                <li>
	                                    <a href="#none">시화</a>
	                                </li>
	                                <li>
	                                    <a href="#none">시흥장현</a>
	                                </li>
	                                <li>
	                                    <a href="#none">안산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">안산고잔</a>
	                                </li>
	                                <li>
	                                    <a href="#none">안성</a>
	                                </li>
	                                <li>
	                                    <a href="#none">안양(안양역)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">안양일번가</a>
	                                </li>
	                                <li>
	                                    <a href="#none">영종하늘도시</a>
	                                </li>
	                                <li>
	                                    <a href="#none">오산(원동)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">용인기흥</a>
	                                </li>
	                                <li>
	                                    <a href="#none">용인역북</a>
	                                </li>
	                                <li>
	                                    <a href="#none">위례</a>
	                                </li>
	                                <li>
	                                    <a href="#none">의정부민락</a>
	                                </li>
	                                <li>
	                                    <a href="#none">인덕원</a>
	                                </li>
	                                <li>
	                                    <a href="#none">인천아시아드</a>
	                                </li>
	                                <li>
	                                    <a href="#none">인천터미널</a>
	                                </li>
	                                <li>
	                                    <a href="#none">주엽</a>
	                                </li>
	                                <li>
	                                    <a href="#none">진접</a>
	                                </li>
	                                <li>
	                                    <a href="#none">파주운정</a>
	                                </li>
	                                <li>
	                                 <a href="#none">판교(창조경제밸리)</a>
	                                </li>
	                                <li>
	                                 <a href="#none">평촌(범계역)</a>
	                                </li>
	                                <li>
	                                 <a href="#none">평택비전(뉴코아)</a>
	                                </li>
	                                <li>
	                                  <a href="#none">하남미사</a>
	                                </li>
	                                <li>
	                                    <a href="#none">향남</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>
	                    
	                    <li class="depth1">
	                        <a href="#none">충청/대전<span>(11)</span></a>
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">당진</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대전(백화점)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대전관저</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대전둔산(월평동)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대전센트럴</a>
	                                </li>
	                                <li>
	                                    <a href="#none">서산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">서봉주(아울렛)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">아산터미널</a>
	                                </li>
	                                <li>
	                                    <a href="#none">천안불당</a>
	                                </li>
	                                <li>
	                                    <a href="#none">청주용암</a>
	                                </li>
	                                <li>
	                                    <a href="#none">충주(모다아울렛)</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>
				
	                     <li class="depth1">
	                        <a href="#none">전라/광주<span>(9)</span></a>
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">광주(백화점)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">광주광산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">군산나운</a>
	                                </li>
	                                <li>
	                                    <a href="#none">군산몰</a>
	                                </li>
	                                <li>
	                                    <a href="#none">수완(아울렛)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">익산모현</a>
	                                </li>
	                                <li>
	                                    <a href="#none">전주(백화점)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">전주송천</a>
	                                </li>
	                                <li>
	                                    <a href="#none">전주평화</a>
	                                </li>
	                                <li>
	                                    <a href="#none">충장로</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>
	                    
	                    <li class="depth1">
	                        <a href="#none">경북/대구<span>(18)</span></a> 
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">경산</a>
	                                </li>
	                                <li>
	                                    <a href="#none">경주</a>
	                                </li>
	                                <li>
	                                    <a href="#none">경주횡성</a>
	                                </li>
	                                <li>
	                                    <a href="#none">구미공단</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대구광장</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대구율하</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대구현풍</a>
	                                </li>
	                                <li>
	                                    <a href="#none">동성로</a>
	                                </li>
	                                <li>
	                                    <a href="#none">상인</a>
	                                </li>
	                                <li>
	                                    <a href="#none">상주</a>
	                                </li>
	                                <li>
	                                    <a href="#none">성서</a>
	                                </li>
	                                <li>
	                                    <a href="#none">영주</a>
	                                </li>
	                                <li>
	                                    <a href="#none">영천</a>
	                                </li>
	                                <li>
	                                    <a href="#none">포항</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄구미센트럴</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄만경</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄안동</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄칠곡</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>
	                    
	                    <li class="depth1">
	                        <a href="#none">경남/부산/울산<span>(26)</span></a> 
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">거창</a>
	                                </li>
	                                <li>
	                                    <a href="#none">광복</a>
	                                </li>
	                                <li>
	                                    <a href="#none">김해부원</a>
	                                </li>
	                                <li>
	                                    <a href="#none">김해아울렛(장유)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">대영</a>
	                                </li>
	                                <li>
	                                    <a href="#none">동래</a>
	                                </li>
	                                <li>
	                                    <a href="#none">동부산아울렛</a>
	                                </li>
	                                <li>
	                                    <a href="#none">드라이브 오시리아</a>
	                                </li>
	                                <li>
	                                    <a href="#none">마산(합성동)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">부산명지</a>
	                                </li>
	                                <li>
	                                    <a href="#none">부산본점</a>
	                                </li>
	                                <li>
	                                    <a href="#none">사천</a>
	                                </li>
	                                <li>
	                                    <a href="#none">서면(전포동)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">센텀시티</a>
	                                </li>
	                                <li>
	                                    <a href="#none">양산물금</a>
	                                </li>
	                                <li>
	                                    <a href="#none">엠비씨네(전주)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">오투(부산대)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">울산(백화점)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">울산성남</a>
	                                </li>
	                                <li>
	                                    <a href="#none">진주혁신(롯데몰)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">진해</a>
	                                </li>
	                                <li>
	                                    <a href="#none">창원</a>
	                                </li>
	                                <li>
	                                    <a href="#none">통영</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄경남대</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄진주(중안)</a>
	                                </li>
	                                <li>
	                                    <a href="#none">프리미엄해운대(장산역)</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>                                            
	                    
	                   <li class="depth1">
	                        <a href="#none">강원<span>(5)</span></a> 
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">남원주</a>
	                                </li>
	                                <li>
	                                    <a href="#none">동해</a>
	                                </li>
	                                <li>
	                                    <a href="#none">속초</a>
	                                </li>
	                                <li>
	                                    <a href="#none">원주무실</a>
	                                </li>
	                                <li>
	                                    <a href="#none">춘천</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li> 
	                     
	                    <li class="depth1">
	                        <a href="#none">제주<span>(3)</span></a> 
	                        <div class="depth2">
	                            <ul>
	                                <li>
	                                    <a href="#none">서귀포</a>
	                                </li>
	                                <li>
	                                    <a href="#none">제주삼화지구</a>
	                                </li>
	                                <li>
	                                    <a href="#none">제주아라</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>                          
	                 </ul>
	            </div>
	        </div>  
	
	        <div class="article article_movie">
	            <div class="group_top">
	                <h4 class="tit">영화 선택</h4>
	            </div>
	            
				<!--영화선택 -->
	            <div class="inner">
	                <div class="movie_select_wrap list">
	                    <div class="mCSB_container">
	                        <ul>
								<%
								for (int i = 0; i < movieList.size(); i++) { %>
									<% MovieVO vo = movieList.get(i); %>
									
									<li data-cd="<%=vo.getMovCd() %>">    
		                                <a href="javascript:void(0);">
		                                    <div class="group_infor">
		                                        <div class="bx_tit">
		                                            <span class="ic_grade gr_15"></span>
		                                            <strong class="tit"><%=vo.getMovNm() %></strong>
		                                        </div>
		                                    </div>
		                                </a>
		                            </li>
								<% } %>
	                        </ul>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
			
			<!--상영 날짜 선택 -->
	        <div class="article article_time">
	            <div class="group_top">
	                <h4 class="tit">상영 날짜 선택</h4>
	            </div>
	            <div class="inner">
	                <div class="date_select_wrap">
	                	<div id="dateChoiceWrap">
	                		<input type="text" name="movPd" id="movPd" class="form-control" placeholder="상영 날짜 선택" readonly>
	                	</div>
	                
	                    <div class="owl-stage-outer">
	                        <div class="owl-stage">
	                        </div>
	                    </div>
	                    <div class="owl-nav">
	                        <button type="button" class="owl-prev disabled" >
	                            <span aria-label="Previous"> ‹ </span>
	                        </button>
	                        <button type="button" class="owl-next">
	                            <span aria-label="Next">›</span>
	                        </button>
	                    </div>
	                </div>
	                <ul class="tab_wrap outer">
	                	<%
	                		for (int i = 0; i < movieList.size(); i++) { %>
	                			<% MovieVO vo = movieList.get(i); %>
	                			
	                			<li>
			                        <div data-cd="<%=vo.getMovCd() %>" class="tab_con ty5 active">
			                            <div class="group_time_select">
			                                <div class="time_select_tit">
			                                    <span class="ic_grade gr_15"></span>
			                                    <strong><%=vo.getMovNm() %></strong>
			                                </div>
			                                <div class="time_select_wrap timeSelect">
			                                    <ul class="list_hall">
			                                        <li>2D</li>
			                                    </ul>
			                                    
			                                    <ul class="list_time">
			                                    	<li>
			                                            <a href="javascript:void(0);">
			                                                <dl>
			                                                    <dt>상영시간</dt>
			                                                    <dd class="time">
			                                                        <strong>11:50</strong>
			                                                    </dd>
			                                                    <dt>잔여석</dt>
			                                                    <dd class="seat">
			                                                        <strong>0</strong> /
			                                                        <span>0</span>
			                                                    </dd>
			                                                    <dt>상영관</dt>
			                                                    <dd class="hall">1관</dd>
			                                                </dl>
			                                            </a>
			                                        </li>
			                                        <li>
			                                            <a href="javascript:void(0);">
			                                                <dl>
			                                                    <dt>상영시간</dt>
			                                                    <dd class="time">
			                                                        <strong>12:55</strong>
			                                                    </dd>
			                                                    <dt>잔여석</dt>
			                                                    <dd class="seat">
			                                                        <strong>0</strong> /
			                                                        <span>81</span>
			                                                    </dd>
			                                                    <dt>상영관</dt>
			                                                    <dd class="hall">1관</dd>
			                                                </dl>
			                                            </a>
			                                        </li>
			                                        <li>
			                                            <a href="javascript:void(0);">
			                                                <dl>
			                                                    <dt>상영시간</dt>
			                                                    <dd class="time">
			                                                        <strong>14:05</strong>
			                                                    </dd>
			                                                    <dt>잔여석</dt>
			                                                    <dd class="seat">
			                                                        <strong>0</strong> /
			                                                        <span>81</span>
			                                                    </dd>
			                                                    <dt>상영관</dt>
			                                                    <dd class="hall">2관</dd>
			                                                </dl>
			                                            </a>
			                                        </li>
			                                    </ul>
			                                </div>
			                            </div>
			                        </div>
			                    </li>
	                		<% } %>
	                </ul>
	                
	                <div class="text-right">
	                	<a href="javascript:void(0);" id="goPersonSeat" class="btn btn-danger">인원/좌석 선택</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</form>
</div>

<script type="module" src="<%=request.getContextPath() %>/js/ticketing.js"></script>

<script>

	/* 영화명 value값 갱신 */
	$('.ticket_wrap .movie_select_wrap.list ul > li > a').on('click', function(){
		$('[name="movCd"]').val($(this).parent().attr('data-cd'));
		$('[name="movNm"]').val($(this).text().trim());
		
		if ($('.ticket_wrap .time_select_wrap ul.list_time li').length > 0) {
			$('.ticket_wrap .time_select_wrap ul.list_time li').removeClass('on');
			$('[name="movPa"]').val('');
			$('[name="watPd"]').val('');
		}
	});
	

	/* 상영날짜 value값 갱신 */
	$('#movPd').on('focusin', function(){
		if ($('[name="movNm"]').val().trim() == '') {
			alert('영화를 선택하세요.');
			$(this).blur();
		} else {
			$(this).datepicker({
				dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
			}).on('change', function(){
				let watPdEl = $('.ticket_wrap .time_select_wrap ul.list_time li');
				
				watPdEl.removeClass('on disabled');
				watPdEl.find('dd.seat').stop().slideUp(150);
			});
		}
	});
	
	/* 상영시간 value값 갱신 */
	$('.ticket_wrap .time_select_wrap ul.list_time li > a').on('click', function(){
		if ($('[name="movNm"]').val().trim() == '') {
			alert('영화를 선택하세요.');
			return false;
		}
		if ($('[name="movPd"]').val().trim() == '') {
			alert('상영날짜를 선택하세요.');
			return false;
		}
		
		let movPa = $(this).find('dd.hall').text().replace('관', '').trim();
		let watPd = $(this).find('dd.time strong').text();
		
		$('[name="movPa"]').val(movPa);
		$('[name="watPd"]').val(watPd);
		
		/* 상영관별 남은 좌석수 가져오기 */
		let self = $(this);
		
		$.ajax({
			type: 'get',
			url: '<%=request.getContextPath()%>/getCurrentSeat.do',
			data: $('#ticketingForm').serialize(),
			success: function(data){
				let cnt = data.currentSeatCount;
				let seatEl = self.find('dd.seat');
				
				if (cnt == seatEl.find('span').text()) {
					self.parent().addClass('disabled');
					
					$('[name="movPa"]').val('');
					$('[name="watPd"]').val('');
				} else {
					self.parent().siblings().removeClass('on');
					self.parent().addClass('on');
				}
				
				seatEl.stop().slideDown(150);
				seatEl.find('strong').text(cnt);
			},
			error: function(xhr){
				alert(xhr.status);
			},
			dataType: 'json'
		});
	});
	
	
	/* 인원/좌석 선택 페이지로 넘어가기 */
	$('#goPersonSeat').on('click', function(){
		event.preventDefault();
		
		if ($('[name="movNm"]').val().trim() == '') {
			alert('영화를 선택하세요.');
			return false;
		}
		if ($('[name="movPd"]').val().trim() == '') {
			alert('상영날짜를 선택하세요.');
			return false;
		}
		if ($('[name="movPa"]').val().trim() == '') {
			alert('상영관을 선택하세요.');
			return false;
		}
		if ($('[name="watPd"]').val().trim() == '') {
			alert('상영시간을 선택하세요.');
			return false;
		}
		$('#ticketingForm').submit();
	});
	
	
	$('#goPersonSeat').on('click', function() {

		$.ajax({
			type : 'post',
			url : '<%=request.getContextPath()%>/ticketing.do',
			data : $('#ticketingForm').serialize(),
			success : function() {
				
			},
			dataType : 'json'
		});
	});
	
</script>
<!-- //여기까지 페이지 내용 -->
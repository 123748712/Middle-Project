<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <!-- 페이지 타이틀 -->
<h2 class="pageTitle"> 회원결제 </h2>
<!-- //페이지 타이틀 -->
<!-- iamport library -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%
	String row = (String)session.getAttribute("rows");
	int rows = Integer.parseInt(row);
%>

<!-- 여기부터 페이지 내용 -->
<div class="ticket_wrap">
        <div class="article article_sum_infor">
            <div class="group_top">
                <h4 class="tit">상품정보</h4>
            </div>
            <div class="sum_infor_wrap">
                <div class="product_infor">
                    <span class="thm"><img src="<%=request.getContextPath()%>/images/common/movie0<%=session.getAttribute("movCd") %>.jpg" alt=""></span>
                    <strong class="tit"><%=session.getAttribute("movNm") %></strong>
                    <dl class="dlist_infor">
                        <dt class="hidden">내용</dt>
                        <dd><%=session.getAttribute("movNm") %></dd>
                        <dt>수량</dt>
                        <dd><%=session.getAttribute("watNum") %></dd>
                    </dl>
                    <%
                    	if(rows == 2) {
                    %>
                    	<div></div>
                    <%
                    	} else {
                    		for(int i=0; i<rows-2; i++){
                    %>
                    <span class="thm"><img src="<%=request.getContextPath()%>/images/sub/<%= session.getAttribute("prodCd")%>.jpg" alt=""></span>
                    <strong class="tit"><%=session.getAttribute("prodNm")%></strong>
                    <dl class="dlist_infor">
                        <dt class="hidden">내용</dt>
                        <dd><%=session.getAttribute("prodNm")%></dd>
                        <dt>수량</dt>
                        <dd><%=session.getAttribute("qty")%></dd>
                    </dl>
                    <%
                    		}
                    	}
                    %>
                </div>        
            </div>
        </div>
        <div class="article article_pay_method">
            <div class="group_top">
                <h4 class="tit">결제수단</h4>
            </div>
            <div class="pay_method_wrap">
                <div id="buy" class="group_payment">
                    <h5 class="tit_payment">최종 결제수단</h5>
                    <div class="box_cate">
                        <ul class="pay_list">
                            <li class="pay_item">
                                <button type="button" class="cate1" data-tab="tab1">신용카드</button>
                            </li>
                            <li class="pay_item">
                                <button type="button" class="cate2" data-tab="tab2">핸드폰</button>
                            </li>
                            <li class="pay_item">
                                <button type="button" class="cate3" data-tab="tab3">무통장입금</button>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- 탭 콘텐츠 1 -->
					<div class="article_pay_card" id="tab1">
		 				 <ul class="card_list">
							 <li class="card_item">
							 	<button class="pay_card1">
							 		<span class="tit"></span>
							 		<span class="thm">롯데카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card2">
							 		<span class="tit"></span>
							 		<span class="thm">국민카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card3">
							 		<span class="tit"></span>
							 		<span class="thm">카카오뱅크</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card4">
							 		<span class="tit"></span>
							 		<span class="thm">신한카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card5">
							 		<span class="tit"></span>
							 		<span class="thm">삼성카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card6">
							 		<span class="tit"></span>
							 		<span class="thm">현대카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card7">
							 		<span class="tit"></span>
							 		<span class="thm">하나카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card8">
							 		<span class="tit"></span>
							 		<span class="thm">외환카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card9">
							 		<span class="tit"></span>
							 		<span class="thm">우리카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card10">
							 		<span class="tit"></span>
							 		<span class="thm">비씨카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card11">
							 		<span class="tit"></span>
							 		<span class="thm">씨티카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card12">
							 		<span class="tit"></span>
							 		<span class="thm">NH카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card13">
							 		<span class="tit"></span>
							 		<span class="thm">전북카드</span>
							 	</button>
							 </li>
							 
							 <li class="card_item">
							 	<button class="pay_card14">
							 		<span class="tit"></span>
							 		<span class="thm">광주카드</span>
							 	</button>
							 </li>
					 	</ul>
				 	</div>
				 	<!-- //탭 콘텐츠 1 -->
				 	
				 	<!-- 탭 콘텐츠 2 -->
				 	<div class="article_pay_card" id="tab2">
				 	</div>
				 	<!-- //탭 콘텐츠 2 -->
				 	
				 	<!-- 탭 콘텐츠 3 -->
				 	<div class="article_pay_card" id="tab3">
				 	</div>
				 	<!-- //탭 콘텐츠 3 -->
                </div>
            </div>
        </div>
        
        <div class="article article_payment">
            <div class="group_top">
                <h4 class="tit">결제하기</h4>
            </div>
            <div class="payment_wrap">
                <div class="payment_sum_wrap">
                    <dl>
                        <dt>상품금액</dt>
                        <dd><%=session.getAttribute("ttCost")%></dd>
                    </dl>
                    <dl>
                        <dt>할인금액</dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt>결제금액</dt>
                        <dd><%=session.getAttribute("ttCost")%></dd>
                    </dl>
                    <input type="button" value="결제하기" disabled="disabled" id="buy" class="buy btn_confirm" onclick="location.href='<%=request.getContextPath()%>/reservationNumber.do'">
                </div>
            </div>
        </div>
        
    </div>
   
<!-- //여기까지 페이지 내용 -->
    <script type="module" src="<%=request.getContextPath() %>/js/memberBuy.js"></script>
    
<script>
let today = new Date();
let year = today.getFullYear();
let month = ('0' + (today.getMonth() + 1)).slice(-2);
let day = ('0' + today.getDate()).slice(-2);
let dateStr = year +'-' + month + '-' + day;


let btn = document.querySelector('.buy');
btn.disabled = true;
	<%-- 카드 결제  --%>
$(".cate1").click(function () {
	//var IMP = window.IMP; // 생략가능
	IMP.init('imp11601270');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
	pg: 'danal', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
// 	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),

	name: '<%=session.getAttribute("movNm") %>',
	amount: '<%=session.getAttribute("ttCost")%>',
	buyer_email: '<%=session.getAttribute("email") == null? "" : session.getAttribute("email") %>',
	buyer_name: '<%=session.getAttribute("name")%>',
	buyer_tel: '<%=session.getAttribute("tel")%>',
	buyer_addr: '<%=session.getAttribute("add")%>',
	buyer_postcode: '<%=session.getAttribute("zip") %>'
	}, 
	function (rsp) {
	
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
		
		$.ajax({
			type : 'get',
			url : '<%= request.getContextPath()%>/memberCardBuy.do',
			data : {
				'buyPays' : rsp.pay_method,
				'buyDt' : dateStr,
				'cardNm' : rsp.card_name,
				'applyNum' : rsp.apply_num
			},
			success : function() {},
			error : function() {},
			dataType : 'json'
		});
		btn.disabled = false;
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += rsp.error_msg;
	
	}
	alert(msg);
	});
	});
	
	
<%-- 휴대폰 결제  --%>
$(".cate2").click(function () {
	IMP.init('imp11601270');
	IMP.request_pay({
	pg: 'danal', // version 1.1.0부터 지원.
	pay_method: 'phone',
	merchant_uid: 'merchant_' + new Date().getTime(),
	name: '<%=session.getAttribute("movNm") %>',
	amount: '<%=session.getAttribute("ttCost")%>',
	buyer_email: '<%=session.getAttribute("email") == null? "" : session.getAttribute("email") %>',
	buyer_name: '<%=session.getAttribute("name")%>',
	buyer_tel: '<%=session.getAttribute("tel")%>',
	buyer_addr: '<%=session.getAttribute("add")%>',
	buyer_postcode: '<%=session.getAttribute("zip")%>',
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
		$.ajax({
			type : 'get',
			url : '<%= request.getContextPath()%>/memberPhoneBuy.do',
			data : {
				'buyPays' : rsp.pay_method,
				'buyDt' : dateStr,
				'applyNum' : rsp.paid_at,
				'cardCd' : 99
			},
			success : function() {},
			error : function() {},
			dataType : 'json'
		});	
		btn.disabled = false;
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += rsp.error_msg;
	}
	alert(msg);
	});
	});
	
	
<%-- 무통장 입금 결제  --%>
$(".cate3").click(function () {
	IMP.init('imp11601270');
	IMP.request_pay({
	pg: 'danal', // version 1.1.0부터 지원.
	pay_method: 'vbank',
	merchant_uid: 'merchant_' + new Date().getTime(),
	name: '<%=session.getAttribute("movNm") %>',
	amount: '<%=session.getAttribute("ttCost")%>',
	buyer_email: '<%=session.getAttribute("email") == null? "" : session.getAttribute("email") %>',
	buyer_name: '<%=session.getAttribute("name") == null? "" : session.getAttribute("name") %>',
	buyer_tel: '<%=session.getAttribute("tel") %>',
	buyer_addr: '<%=session.getAttribute("add")%>',
	buyer_postcode: '<%=session.getAttribute("zip")%>',
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';

	$.ajax({
		type : 'get',
		url : '<%= request.getContextPath()%>/memberAccountBuy.do',
		data : {
			'buyPays' : rsp.pay_method,
			'buyDt' : dateStr,
			'applyNum' : rsp.vbank_num,
			'cardNm' : 111
		},
		success : function() {},
		error : function() {},
		dataType : 'json'
	});	
	btn.disabled = false;	
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += rsp.error_msg;
	}
	alert(msg);
	});
	});

</script>
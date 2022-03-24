<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = (String) session.getAttribute("name");
// 	int point = (int) session.getAttribute("point");
	int membershipPoint = (Integer) request.getAttribute("membershipPoint");
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	String rank = "브론즈";
	String rankClass = "txt_rank_bronze";
	
	if (membershipPoint >= 40000) {
		rank = "골드";
		rankClass = "txt_rank_gold";
	}
	if (membershipPoint >= 60000) {
		rank = "다이아";
		rankClass = "txt_rank_diamonde";
	}
%>

<!-- 여기부터 페이지 내용 -->
   <!-- 멤버쉽 -->
    <div class="ship_content">
        <div class="tab_wrap">
            <ul class="tab_list">
                <!-- 회원 포인트 및 구매등급 확인 탭 -->
                <li class="tab_item active">
                    <!-- 회원 포인트 및 구매등급 확인 탭 버튼 -->
                    <button class="tab_btn tab_point">
                        <span>회원 포인트 및 구매등급 확인</span>
                    </button>

                    <!-- 회원 포인트 및 구매등급 확인 탭 내용 -->
                    <div class="tab_con">
                        <div class="contents_point">
                            <h2 class="point_title">멤버쉽 포인트</h2>

                            <!-- 내 point 적립정보 -->
                            <div class="point_infor">
                                <div class="mypage_box">
                                    <!-- 내 회원 포인트 및 구매등급 확인 정보 -->
                                    <div class="my_info">
                                        <p class="name">
                                            <strong><%=name %>님은</strong>
                                            <span class="<%=rankClass %>"><%=rank %></span>
                                            <span>등급입니다.</span>
                                        </p>
                                        <div class="cur_point">
											<%-- 현재 잔여 포인트 : <em><%=point %></em> --%>
                                            	현재 잔여 포인트 : <em><%=df.format(membershipPoint) %></em>
                                        </div>
                                    </div>
                                    <!-- 등급별 필요 금액 -->
                                    <div class="bx_grade">
                                        <div class="area_gauge">
                                            <div class="gauge"></div>
                                            <ul class="infograde">
                                                <li>
                                                    <strong>멤버쉽 등급</strong>
                                                    <em>0</em>
                                                </li>
                                                <li>
                                                    <strong>브론즈</strong>
                                                    <em>2만원</em>
                                                </li>
                                                <li>
                                                    <strong>골드</strong>
                                                    <em>4만원</em>
                                                </li>
                                                <li>
                                                    <strong>다이아</strong>
                                                    <em>6만원</em>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="mypage_btn">
                                    <a href="<%=request.getContextPath() %>/ticketingView.do">예매 내역 조회하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- 제휴사 상품할인 탭 -->
                <li class="tab_item">
                    <!-- 제휴사 상품할인 탭 버튼 -->
                    <button class="tab_btn tab_vip">
                        <span>제휴사 상품할인 목록</span>
                    </button>
                    <!-- 제휴사 상품할인 탭 내용 -->
                    <div class="tab_con">
                        <div class="contents_affi">                           
                            <div class="affi_infor">
                                <div class="affi_infor_box">
                                    <div class="my_info">
<!--                                         <p class="name"> -->
<!--                                             <strong>김정진님은</strong> -->
<!--                                             <span class="txt_rank_bronze">브론즈</span> -->
<!--                                             <span>등급입니다.</span> -->
<!--                                         </p> -->
<!--                                         <div class="target_price"> -->
<!--                                             VIP까지 남은 금액 <em>100,000원</em> -->
<!--                                         </div> -->
                                    </div>
                                    <div class="affi_infor_product">
                                        <div class="product_wrap">
                                            <div class="product">
                                                <div class="product_img">
                                                    <img src="./images/sub/C000001.jpg" alt="">
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_title">
                                                        <h4>즉석구이 콤보</h4>
                                                        <p>카라멜팝콘M|즉석구이(몸통or다리)|탄산음료M2</p>
                                                    </div>
                                                    <div class="product_content_price">
                                                        <p>10% <span class="before_price">13,500원</span><span class="after_price">12,150원</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="product">
                                                <div class="product_img">
                                                    <img src="./images/sub/C000002.jpg" alt="">
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_title">
                                                        <h4>더블 콤보</h4>
                                                        <p>카라멜팝콘M|오리지널팝콘M|탄산음료M2</p>
                                                    </div>
                                                    <div class="product_content_price">
                                                        <p>10% <span class="before_price">13,000원</span><span class="after_price">11,700원</span></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="product">
                                                <div class="product_img">
                                                    <img src="./images/sub/C000003.jpg" alt="">
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_title">
                                                        <h4>스위트콤보</h4>
                                                        <p>오리지날팝콘L|탄산음료M2</p>
                                                    </div>
                                                    <div class="product_content_price">
                                                        <p>10% <span class="before_price">9,000원</span><span class="after_price">8,100원</span></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="product">
                                                <div class="product_img">
                                                    <img src="./images/sub/P000001.jpg" alt="">
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_title">
                                                        <h4>카라멜팝콘L</h4>
                                                        <p>카라멜팝콘L</p>
                                                    </div>
                                                    <div class="product_content_price">
                                                        <p>10% <span class="before_price">6,000원</span><span class="after_price">5,400원</span></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="product">
                                                <div class="product_img">
                                                    <img src="./images/sub/D000001.jpg" alt="">
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_title">
                                                        <h4>사이다 M</h4>
                                                        <p>사이다M</p>
                                                    </div>
                                                    <div class="product_content_price">
                                                        <p>10% <span class="before_price">2,500원</span><span class="after_price">2,250원</span></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="product">
                                                <div class="product_img">
                                                    <img src="./images/sub/D000002.jpg" alt="">
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_title">
                                                        <h4>콜라 M</h4>
                                                        <p>콜라 M</p>
                                                    </div>
                                                    <div class="product_content_price">
                                                        <p>10% <span class="before_price">2,500원</span><span class="after_price">2,250원</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
<!-- //여기까지 페이지 내용 -->
 <script type="module" src="<%=request.getContextPath() %>/js/membership.js"></script>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">스낵음료</h2>
<!-- //페이지 타이틀 -->

<div class="store"> 
	<div class="storeList">
	
	<div id="combo1" class="prodBox">
	  <div>
	    <img alt="" src="<%=request.getContextPath()%>/images/sub/C000001.jpg">
	  </div>
	  <div id="combo1Info">
	    <div>
	      <h6 class="prodCd" id="prodCd" hidden="">C000001</h6>
	      <h4 class="prodNm" id="prodNm">즉석구이콤보</h4>
	      <p style="color: gray; font-size: small;">카라멜팝콘M+즉석구이(몸통or다리)+탄산음료M2</p>
	    </div>
	    <div>
	      <span name="prodPri" class="prodPri" style="font-size:large">13500원</span>
	    </div>
	    <input type="button" class="btn btn-primary buyChk" value="구매하기">
	  </div>
	</div>
	
	
	<div id="combo2" class="prodBox">
	  <div>
	    <img alt="" src="<%=request.getContextPath()%>/images/sub/C000002.jpg">
	  </div>
	  <div id="combo2Info">
	    <div>
	      <h6 class="prodCd" hidden="">C000002</h6>
	      <h4 class="prodNm">더블콤보</h4>
	      <p style="color: gray; font-size: small;">카라멜팝콘M+오리지널팝콘M+탄산음료M2</p>
	    </div>
	    <div>
	      <span name="prodPri" class="prodPri" style="font-size:large">13000원</span>
	    </div>
	    <input type="button" class="btn btn-primary buyChk" value="구매하기">
	  </div>
	  
	</div>

	<div id="combo3" class="prodBox">
	  <div>
	    <img alt="" src="<%=request.getContextPath()%>/images/sub/C000003.jpg">
	  </div>
	  <div id="combo3Info">
	    <div>
	      <h6 class="prodCd" hidden="">C000003</h6>
	      <h4 class="prodNm">스위트콤보</h4>
	      <p style="color: gray; font-size: small;">오리지널팝콘L+탄산음료M2</p>
	    </div>
	    <div>
	      <span name="prodPri" class="prodPri" style="font-size:large">9000원</span>
	    </div>
	    <input type="button" class="btn btn-primary buyChk" value="구매하기">
	  </div>
	</div>

	<div id="caramelpop" class="prodBox">
	  <div>
	    <img alt="" src="<%=request.getContextPath()%>/images/sub/P000001.jpg">
	  </div>
	  <div id="popInfo">
	    <div>
	      <h6 class="prodCd" hidden="">P000001</h6>
	      <h4 class="prodNm">카라멜팝콘 L</h4>
	      <p style="color: gray; font-size: small;">카라멜팝콘L</p>
	    </div>
	    <div>
	      <span name="prodPri" class="prodPri" style="font-size:large">6000원</span>
	    </div>
	    <input type="button" class="btn btn-primary buyChk" value="구매하기">
	  </div>
	</div>

	<div id="cider" class="prodBox">
	  <div>
	    <img alt="" src="<%=request.getContextPath()%>/images/sub/D000001.jpg">
	  </div>
	  <div id="ciderInfo">
	    <div>
	      <h6 class="prodCd" hidden="">D000001</h6>
	      <h4 class="prodNm">사이다 M</h4>
	      <p style="color: gray; font-size: small;">사이다M</p>
	    </div>
	    <div>
	      <span name="prodPri" class="prodPri" style="font-size:large">2500원</span>
	    </div>
	    <input type="button" class="btn btn-primary buyChk" value="구매하기">
	  </div>
	</div>

	<div id="coke" class="prodBox">
	  <div>
	    <img alt="" src="<%=request.getContextPath()%>/images/sub/D000002.jpg">
	  </div>
	  <div id="cokeInfo">
	    <div>
	      <h6 class="prodCd" hidden="">D000002</h6>
	      <h4 class="prodNm">콜라 M</h4>
	      <p style="color: gray; font-size: small;">콜라 M</p>
	    </div>
	    <div>
	      <span name="prodPri" class="prodPri" style="font-size:large">2500원</span>
	    </div>
	    <input type="button" class="btn btn-primary buyChk" value="구매하기">
	  </div>
	</div>
	<form action="store.do" method="post">
	  <input type="submit" value="결제하기" class="btn btn-danger" id="buySnack">
	</form>
  </div>
</div>

<script>

let prodCd = "";
let prodNm = "";
let prodPri = "";

let arr = [];
let arrSlice = "";
let obj = {};

let cnt = 0;
$(".btn.btn-primary").on("click", function () {
	cnt ++;
	prodCd = $(this).parents('.prodBox').find(".prodCd").text();
	prodNm = $(this).parents('.prodBox').find(".prodNm").text();
	prodPri = $(this).parents('.prodBox').find(".prodPri").text();
	let pri = parseInt(prodPri.replace("원","").trim());
	
	arr.push(prodNm);
	arr.push(pri);


	
	if (confirm("장바구니에 담으시겠습니까?")) {
		
		if (cnt >= 2) {
			let arr2 = arr.splice(0,2);
		}
		console.log(arr);
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/prodStore.do",
			traditional: true,
			data : {
				prodList : arr,
				prodCd : prodCd,
				prodNm : prodNm,
				prodPri : pri
			} ,
			success : function(data) {
				if (data.cnt > 0) {
					alert("장바구니 담았습니다.");
				}
			} ,
		 	error : function(xhr) {
				alert(xhr.status);
			}, 
			dataType : "json"
		});
	} else {
		document.addForm.reset();
	}
 });

</script>
<%@page import="kr.or.ddit.lottecgvbox.service.ICartService"%>
<%@page import="kr.or.ddit.lottecgvbox.service.CartServiceImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.lottecgvbox.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- 페이지 타이틀 -->
<h2 class="pageTitle"> 장바구니 </h2>
<!-- //페이지 타이틀 -->

<%
	String cartCd = (String)session.getAttribute("cartCd");
	String movCost = (String)session.getAttribute("totalCost");
	List<CartVO> selist = (List<CartVO>)session.getAttribute("cartList"); // 리스트 전체 출력
	
//	String[] listArr = request.getParameterValues("prodList");	

%>	
	

<div class="cartList">
  <div id="cartStep">
	<ul id="cartStepList">
		<li class="step1">
			<img alt="장바구니" src="<%=request.getContextPath() %>/images/sub/iconmonstr-shopping-cart-2-240.png" id="cart"/>
			<div>
				<em>STEP 01</em>
				<strong>장바구니</strong>
			</div>
		</li>
		<li>
			<img alt="결제하기" src="<%=request.getContextPath() %>/images/sub/iconmonstr-credit-card-6-240.png" id="card"/>
			<div>
				<em>STEP 02</em>
				<strong>결제하기</strong>
			</div>
		</li>
		
		<li>
			<img alt="결제완료" src="<%=request.getContextPath() %>/images/sub/iconmonstr-user-6-240.png" id="user"/>
			<div>
				<em>STEP 03</em>
				<strong>결제완료</strong>
			</div>
		</li>
	</ul>
  </div>
	
<form action="memberBuy.do" method="post">
<div>

  <table class="table table-striped cartTable" id="cartTable">
  <thead> 
      <tr id="cartStep0">
 	 	<th><input type="checkbox" id="chkBoxAll"></th>
        <th>상품명</th>
        <th>판매금액</th>
        <th>수량</th>
      </tr>
    </thead>  
    <tbody> <!-- 장바구니 수량에 따라 행 증가 -->
    
    <!-- 영화 예매 정보 -->
    <tr>
        <td>
        <input type="checkbox" name="chkBox" class="chkBox btn btn-primary btn-block" value="<%=cartCd%>">
        </td>
	<%	
    	for(int i=0; i < 3; i++) {
    %>		
        <td style="text-align: center;"><%=selist.get(i) %></td>
    <%
    	} 
    %>
    </tr>
    
    
    <%
    	for(int i = 3; i < selist.size()-1; i++) {
    		if(i % 2 == 1) {
    %>
      <tr class="printRst">
    	<td>
        	<input type="checkbox" name="chkBox" class="chkBox btn btn-primary btn-block" value="<%=cartCd%>">
        </td>
   		<!-- 매점 상품 정보 -->
        <td class="nameRst text-center"><%=selist.get(i)%></td>
        <td class="priRst text-center"><%=selist.get(i+1)%></td>
        <td class="text-center">
        	<input type="number" class="cntQty" name="cntQty" value="1" min="1" max="10">
        </td>
      </tr>  
    <%
    		}
    	}
    %>  
       	
    </tbody>
  </table>

</div>

<!-- 금액 출력 테이블 -->
<div class="creditBox">
  <table class="table table-striped creditBoxTable">
  <thead> 
      <tr id="cartStep0">
        <th>총 결제 예정 금액</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="tt text-center" id="tt"></td>
      </tr>
    </tbody>
  </table>
</div>
</form>

  <input type="button" value="선택 상품 삭제" class="btn btn-danger" id="remove" style="display:inline-block; float:left; width:50%; height: 50px;">
  <form action="memberBuy.do">
	<input type="button"  value="구매하기" class="btn btn-primary" id="buyRst" style="display:inline-block; width:50%; height: 50px;">
  </form>
</div> <!-- 전체 div -->
<script>

$('#buyRst').on("click", function() {

	if (table.rows.length == 1) {
		alert("결제할 상품이 없습니다.\n영화선택 페이지로 이동합니다.")
		location.href = '<%=request.getContextPath()%>/ticketing.do';
	} else {
		
		$.ajax({
			type : 'post',
			url : '<%=request.getContextPath()%>/memberBuy.do',
			data : {
				'ttCost' : $('.tt').text(),
				'qty' : $('.cntQty').val(),
				'nameRst' : $('.nameRst').text(),
				'rows' : table.rows.length
				},
			success : function() {
				
			},
			error : function() {
			}
		});

		location.href = '<%=request.getContextPath()%>/memberBuy.do';
	}
});


let rst = 0;
let table = document.getElementById("cartTable");
let cnt = $(".cntQty").val();

	$(function() {
	// 매점 구매 하지 않았을 때 영화가격만 출력
	$(".tt").text(parseInt(<%=movCost%>));
	if (cnt == 1) {
    	for (let i = 1; i < table.rows.length; i++) {
			rst += parseInt(table.rows[i].cells[2].innerHTML);
		}
		document.getElementById("tt").innerText = rst;
	}
	
	});
	
let currVal = $("input[name=cntQty]").val();
let sum = 0;
let cntAll = 0;
let item = 0;
let itemTotal = 0;
	// 수량 변경 시 전체 금액 변경
	$("input[name=cntQty]").change(function() {
		if ($(this).val() > currVal) {
			
		   	item = parseInt($(this).parents('tr').find('td').eq(2).text()) * (cntAll-(cntAll-1));
		
		   	itemTotal = parseInt($(this).parents('tr').find('td').eq(2).text()) * cntAll - (item * (cntAll-1));

		   	sum = itemTotal + parseInt($(".tt").text());
		   	
			$('#tt').text(sum);		
		}  else {
			
		   	item = parseInt($(this).parents('tr').find('td').eq(2).text()) * (cntAll-(cntAll-1));
		
		   	itemTotal = parseInt($(this).parents('tr').find('td').eq(2).text()) * cntAll - (item * (cntAll-1));
			
		   	let min = parseInt($(".tt").text()) - itemTotal;

		   	$('#tt').text(min);		
		} 
		cntAll = $(this).val();
		currVal = $(this).val();
	});



$("#remove").on("click", function() {

	if ($("input:checkbox[name='chkBox']:checked").length == 0) {
		alert("삭제할 항목이 없습니다.");
		return;		
		
	} else if (table.rows.length == 2) {
		document.getElementById("tt").innerHTML = <%=movCost%>;
		
	} else {
		
		let delArr = [];
		let obj = {};
		
		$("input:checkbox[name='chkBox']:checked").each(function(k, kVal) {
			let chkItem = kVal.parentElement.parentElement; // 행
			let del = $("input:checkbox[name='chkBox']:checked").val();
			
			//delArr.push($(this).val());
			
			if ($(chkItem).remove()) {
				$('#tt').text(rst - (parseInt($(this).parents('tr').find('td').eq(2).text())));
				
				if (table.rows.length == 1) {
					$("#tt").text(0);
				} 
				
			 	 $.ajax({
					type : "post",
					url : "<%=request.getContextPath() %>/deleteCart.do",
					data : {
						"cartCd" : del
					},
					success : function(data) {
						if (data.cnt > 0) {
							alert("선택 항목이 삭제 되었습니다.");
						}
					},
					dataType : "json"
				});
			}
		});
	} // else end
});


/*체크박스 전체 선택 및 해제*/
$(function(){
	$("#chkBoxAll").click(function(){
		if($("#chkBoxAll").prop("checked")){
			$("input[name=chkBox]").prop("checked", true);
		} else {
			$("input[name=chkBox]").prop("checked", false);
		}
	})
});

</script>
<%@page import="kr.or.ddit.lottecgvbox.vo.CardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">카드사 조회</h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->
<div class="card_wrap">
	<form action="" method="post" id="cardFrm">
		<% if (session.getAttribute("loginId") != null) { %>
			<input type="hidden" name="memCd" value="<%=session.getAttribute("memCd") %>">
		<% } %>
	
		<div id="cardTblWrap">
			<table class="table table-striped" id="cardTbl">
				<caption class="sr-only">카드사 조회 - 카드 선택, 카드사, 카드번호, 자주 쓰는 카드 정보 제공</caption>
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 40%;">
					<col style="width: 40%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="text-center">
							<input type="checkbox" id="checkCardAll" title="카드 전체 선택">
						</th>
						<th scope="col" class="text-center">카드사</th>
						<th scope="col" class="text-center">카드번호</th>
						<th scope="col" class="text-center">자주 쓰는 카드</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<% List<CardVO> cardList = (List<CardVO>) request.getAttribute("cardList"); %>
					
					<% if (cardList != null && cardList.size() > 0) { %>
						<% for (int i = 0; i < cardList.size(); i++) { %>
							<% CardVO vo = cardList.get(i); %>
						
							<tr>
								<td class="cardCheckbox">
									<input type="checkbox" name="card" title="카드 선택" value="<%=vo.getCardCd() %>">
								</td>
								<td class="cardCom"><%=vo.getCardCom() %></td>
								<td class="cardNum">
									<input type="hidden" name="cardNumHidden" value="<%=vo.getCardNum() %>">
									<%
										String cardNum1 = vo.getCardNum().substring(0, vo.getCardNum().length()-7);
										String cardNum2 = vo.getCardNum().substring(vo.getCardNum().length()-7, vo.getCardNum().length()).replaceAll("[$0-9]", "*");
									%>
									<%=cardNum1 + cardNum2 %>
								</td>
								<td class="favrCardAt">
									<input type="hidden" name="favrCardAt" value="<%=vo.getFavrCardAt() %>">
									
									<% if (vo.getFavrCardAt().equals("Y")) { %>
										<i class="xi-check color_red" aria-hidden="true"></i>
										<span class="sr-only">자주 쓰는 카드</span>
									<% } else { %>
										<i class="xi-check color_grey" aria-hidden="true"></i>
									<% } %>
								</td>
							</tr>
						<% } %>
					<% } else { %>
						<tr>
							<td colspan="4">데이터가 없습니다.</td>
						</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</form>
	
	<div class="btns">
		<button type="button" class="btn btn-danger" id="addCard">추가</button>
		<button type="button" class="btn" id="updateCard">수정</button>
		<button type="button" class="btn btn-default" id="deleteCard">삭제</button>
	</div>
</div>

<script>
	/* 카드 체크박스 전체 선택 */
	$('#checkCardAll').on('change', function(){
		let chk = $(this).prop('checked');
		$('[name="card"]').prop('checked', chk);
	});
	
	/* 전체 선택된 상태에서 하나라도 체크 해제 시 전체 선택 해제되게 */
	$(document).on('change', '[name="card"]', function(){
		if (!$(this).prop('checked')) {
			$('#checkCardAll').prop('checked', false);
		}
	});
	
	/* 카드사 등록 */
	$('#addCard').on('click', function(){
		let html = '';
		html += '<tr class="added" style="background-color: #fff1f1;">';
		html += '	<td>';
		html += '		<button type="button" class="btn btn_remove">';
		html += '			<i class="xi-close" aria-hidden="true"></i>';
		html += '			<span class="sr-only">카드 추가 취소</span>';
		html += '		</button>';
		html += '	</td>';
		html += '	<td>'
		html += '		<div class="col-xs-4 col-xs-offset-4">';
		html += '			<input type="text" name="cardCom" title="카드사" placeholder="카드사" value="" class="form-control input-sm">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td>'
		html += '		<div class="col-xs-4 col-xs-offset-4">';
		html += '			<input type="text" name="cardNum" title="카드번호" placeholder="카드번호" value="" class="form-control input-sm">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td>'
		html += '		<input type="hidden" name="favrCardAt" value="N">';
		html += '		<input type="checkbox" name="favrCardAtChk" title="자주 쓰는 카드">';
		html += '	</td>';
		html += '</tr>';
		
		$('#cardFrm tbody').append(html);
		$('[name="cardCom"]')[$('[name="cardCom"]').length - 1].focus();
		
		if ($('#insertCard').length == 0) {
			let btnHtml = '';
			btnHtml += '<button type="button" class="btn btn-success" id="insertCard">';
			btnHtml += 	'<i class="xi-check" aria-hidden="true"></i>';
			btnHtml += 	'<span class="sr-only">카드 등록</span>';
			btnHtml += '</button>';
			$(this).after(btnHtml);
		}
	});
	
	/* 카드 추가 취소 */
	$(document).on('click', '.btn_remove', function(){
		// 수정
		if ($(this).parents('tr').hasClass('update')) {
			if (!confirm('카드 수정을 취소하시겠습니까?')) {
				return;
			}
			
			let tr = $(this).parents('tr');
			
			tr.find('.cardCheckbox').html('<input type="checkbox" name="card" title="카드 선택" value='+$(this).prev().val()+'>');
			tr.find('.cardCom').html(tr.find('[name="cardComOriginUpdate"]').val());
			
			let cardNumHtml = '';
			cardNumHtml += '<input type="hidden" name="cardNumHidden" value='+$(tr).find('[name="cardNumOriginUpdate"]').val()+'>';
			cardNumHtml += tr.find('[name="cardNumOriginUpdate"]').val();
			
			tr.find('.cardNum').html(cardNumHtml);
			
			let favrCardAtChkState = tr.find('[name="favrCardAtOriginUpdate"]').val() == 'Y' ? ' color_red' : ' color_grey';
			let favrCardAtHtml = '';
			favrCardAtHtml += '<input type="hidden" name="favrCardAt" value='+tr.find('[name="favrCardAtOriginUpdate"]').val()+'>';
			favrCardAtHtml += '<i class="xi-check'+favrCardAtChkState+'" aria-hidden="true"></i>';
			
			tr.find('.favrCardAt').html(favrCardAtHtml);
			tr.removeClass('update');
			$('#updateCardSubmit').remove();
		} else {
			// 추가
			if (!confirm('카드 추가를 취소하시겠습니까?')) {
				return;
			}
			
			$(this).parents('tr').remove();
			
			if ($('#cardTbl').find('tr.added').length == 0) {
				$('#insertCard').remove();
			}
		}
	});
	
	/* 자주 쓰는 체크박스 value 갱신 */
	$(document).on('change', '[name^="favrCardAtChk"]', function(){
		if ($(this).is(':checked')) {
			$(this).prev('[name^="favrCardAt"]').attr('value', 'Y');
		} else {
			$(this).prev('[name^="favrCardAt"]').attr('value', 'N');
		}
	});
	
	/* 입력 필드 value 갱신 */
	$(document).on('change', 'input:text', function(){
		$(this).attr('value', $(this).val());
	});
	
	/* 카드 등록 */
	$(document).on('click', '#insertCard', function(){
		if ($('[name="cardCom"][value=""]').length > 0) {
			$('[name="cardCom"][value=""]')[0].focus();
			alert('카드사명을 입력하세요.');
			return false;
		}
		if ($('[name="cardNum"][value=""]').length > 0) {
			$('[name="cardNum"][value=""]')[0].focus();
			alert('카드번호를 입력하세요.');
			return false;
		}
		
		if (!confirm('등록하시겠습니까?')) {
			return;
		}
		
		$.ajax({
			url: '<%=request.getContextPath() %>/insertCard.do',
			type: 'post',
			data: $('#cardFrm').serialize(),
			success: function(response){
				alert(response.msg);
				$('#insertCard').remove();
				$('#cardTblWrap').load('<%=request.getContextPath() %>/card.do #cardTbl');
			},
			error: function(xhr){
				alert(xhr.status);
			}
		});
	});
	
	/* 카드 수정 */
	$('#updateCard').on('click', function(){
		if ($('[name="card"]:checked').length == 0) {
			alert('수정할 카드를 선택하세요.');
			return false;
		}
		
		let tr = $('[name="card"]:checked').parents("tr");
		tr.addClass('update');
		
		tr.find('td.cardCheckbox').each(function(){
			let html = "";
			html += '<input type="hidden" name="cardCdUpdate" value='+$(this).find('[name="card"]').val()+'>';
			html += '<button type="button" class="btn btn_remove">';
			html += '	<i class="xi-close" aria-hidden="true"></i>';
			html += '	<span class="sr-only">카드 수정 취소</span>';
			html += '</button>';
			$(this).html(html);
		});
		
		tr.find('td.cardCom').each(function(){
			let html = "";
			html += '<div class="col-xs-4 col-xs-offset-4">';
			html += '	<input type="hidden" name="cardComOriginUpdate" value='+$(this).text()+'>';
			html += '	<input type="text" name="cardComUpdate" title="카드사" placeholder="카드사" value='+$(this).text()+' class="form-control input-sm">';
			html += '</div>';
			$(this).html(html);
		});
		
		tr.find('td.cardNum').each(function(){
			let html = "";
			html += '<div class="col-xs-4 col-xs-offset-4">';
			html += '	<input type="hidden" name="cardNumOriginUpdate" value='+$(this).text()+'>';
			html += '	<input type="text" name="cardNumUpdate" title="카드번호" placeholder="카드번호" value='+$(this).find('[name="cardNumHidden"]').val()+' class="form-control input-sm">';
			html += '</div>';
			$(this).html(html);
		});
		
		tr.find('td.favrCardAt').each(function(){
			let chkState = $(this).find('[name="favrCardAt"]').val() == 'Y' ? " checked" : "";
			let html = "";
			html += '<input type="hidden" name="favrCardAtOriginUpdate" value='+$(this).find('[name="favrCardAt"]').val()+'>';
			html += '<input type="hidden" name="favrCardAtHiddenUpdate" value='+$(this).find('[name="favrCardAt"]').val()+'>';
			html += '<input type="checkbox" name="favrCardAtChkUpdate" title="자주 쓰는 카드"'+chkState+'>';
			$(this).html(html);
		});
		
		if ($('#updateCardSubmit').length == 0) {
			let btnHtml = "";
			btnHtml += '<button type="button" class="btn btn-primary" id="updateCardSubmit">';
			btnHtml += '	<i class="xi-check" aria-hidden="true"></i>';
			btnHtml += '	<span class="sr-only">수정완료</span>';
			btnHtml += '</button>';
			$(this).after(btnHtml);
		}
	});
	
	/* 카드 수정 시 마지막에 추가된 input에 focus */
	$('#cardTbl tbody').on('DOMNodeInserted', function(){
		if ($(event.target).parent().is('.cardCom')) {
			$(event.target).find('[name="cardComUpdate"]').focus();
		}
	});
	
	/* 카드 수정 전송 */
	$(document).on('click', '#updateCardSubmit', function(){
		if (!confirm('선택한 카드를 수정하시겠습니까?')) {
			return;
		}
		
		let cardCdArr = [];
		let cardComArr = [];
		let cardNumArr = [];
		let favrCardAtArr = [];
		
		$('[name="cardCdUpdate"]').each(function(){
			cardCdArr.push($(this).attr('value'));
		});
		$('[name="cardComUpdate"]').each(function(){
			cardComArr.push($(this).attr('value'));
		});
		$('[name="cardNumUpdate"]').each(function(){
			cardNumArr.push($(this).attr('value'));
		});
		$('[name="favrCardAtHiddenUpdate"]').each(function(){
			favrCardAtArr.push($(this).attr('value'));
		});
		
		$.ajax({
			url: '<%=request.getContextPath() %>/updateCard.do',
			type: 'post',
			traditional: true,
			data: {
				"memCd"        : $('[name="memCd"]').val(),
				"cardCd"       : cardCdArr,
				"cardCom"      : cardComArr,
				"cardNum"      : cardNumArr,
				"favrCardAt"   : favrCardAtArr,
			},
			success: function(response){
				alert(response.msg);
				$('#cardTblWrap').load('<%=request.getContextPath() %>/card.do #cardTbl');
			},
			error: function(xhr){
				alert(xhr.status);
			}
		});
	});
	
	/* 카드 삭제 */
	$('#deleteCard').on('click', function(){
		if ($('[name="card"]:checked').length == 0) {
			alert('삭제할 카드를 선택하세요.');
			return false;
		}
		
		if (!confirm('선택한 카드를 삭제하시겠습니까?')) {
			return;
		}
		
		let cardCdArr = [];
		
		$('[name="card"]:checked').each(function(){
			cardCdArr.push($(this).attr('value'));
		});
		
		$.ajax({
			url: '<%=request.getContextPath() %>/deleteCard.do',
			type: 'post',
			traditional: true,
			data: {
				"memCd"  : $('[name="memCd"]').val(),
				"cardCd" : cardCdArr
			},
			success: function(response){
				alert(response.msg);
				$('#cardTblWrap').load('<%=request.getContextPath() %>/card.do #cardTbl');
			},
			error: function(xhr){
				alert(xhr.status);
			}
		});
	});
</script>
<!-- //여기까지 페이지 내용 -->
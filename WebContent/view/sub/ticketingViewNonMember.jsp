<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">예매 조회</h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->
<div class="ticketingView">
	<div class="topbox_st1">
		<i class="xi-desktop" aria-hidden="true"></i>
	
		<div class="inner">
			<h3>비회원 예매 조회</h3>
			<p>예매 시 사용했던 휴대폰번호(숫자만)을 입력하세요.</p>
			
			<div class="inp_wrap">
				<div class="col-sm-3">
                	<input type="text" class="form-control" id="phoneNumber" title="예매 시 사용했던 휴대폰번호">
                </div>
                <div class="col-sm-1">
                	<button type="button" class="btn btn-danger btn_search">인증요청</button>
                </div>
			</div>
		</div>
	</div>

	<form action="ticketingView.do" method="post" id="ticketingViewForm">
		<table class="table table-striped" id="ticketingViewTbl">
			<caption class="sr-only">비회원 예매조회 - ID, 휴대폰번호, 영화명, 예매일시 정보 제공</caption>
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 30%;">
				<col style="width: 30%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">휴대폰번호</th>
					<th scope="col">영화명</th>
					<th scope="col">예매일시</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</form>
</div>

<script>

	let code = "";
	let phoneNumber = "";
	let regexNum = /^[0-9]+$/;

	/* 휴대폰번호 인증 */
	$('.btn_search').on('click', function(){
		let self = $(this);
		phoneNumber = $('#phoneNumber').val().trim();
		
		if (phoneNumber == '') {
			alert('휴대폰번호를 입력하세요.');
			$('#phoneNumber').focus();
			return false;
		}
		if (!regexNum.test(phoneNumber)) {
			alert('숫자만 입력하세요.');
			$('#phoneNumber').focus();
			return false;
		}
		if (!confirm('인증요청을 하시겠습니까?')) {
			return;
		}
		
		$.ajax({
			type: 'get',
			url: '<%=request.getContextPath()%>/ticketingViewCertification.do',
			data: { "phoneNumber" : phoneNumber },
			success: function(data){
				if (data == null) {
					alert("휴대폰 번호가 올바르지 않습니다.\n올바른 번호를 입력해주세요.");
					return false;
				}
				
				alert('인증번호가 발송되었습니다.\n확인 후 인증번호를 입력해주세요.');
				code = data.num;
				
				if ($('#cerField').length == 0) {
					let html = '';
					html += '<div class="inp_wrap">';
					html += 	'<div class="col-sm-3">';
					html += 		'<input type="text" class="form-control cerField" id="cerField" placeholder="인증번호" title="인증번호">';
					html += 	'</div>';
					html +=		'<div class="col-sm-1">';
					html +=			'<button type="button" class="btn btn-default btn_cer" id="cerBtn">인증확인</button>';
					html += 	'</div>';
					html += '</div>';
					
					self.parents('.inp_wrap').after(html);
				}
				
				$('#cerField').focus();
			},
			error: function(xhr){
				alert(xhr.status);
			},
			dataType: 'json'
		});
	});
	
	/* 예매정보 데이터 출력 */
	$(document).on('click', '#cerBtn', function(){
		if ($('#cerField').val().trim() == '') {
			alert('인증번호를 입력하세요.');
			$('#cerField').focus();
			return false;
		}
		if (!regexNum.test($('#cerField').val().trim())) {
			alert('숫자만 입력하세요.');
			$('#cerField').focus();
			return false;
		}
		
		if ($('#cerField').val().trim() == code) {
			alert('인증되었습니다.');
			
			$.ajax({
				type: 'post',
				url: '<%=request.getContextPath()%>/ticketingView.do',
				data: { "nMemNum" : phoneNumber },
				success: function(data){
					let ticketings = data.nonMemberTicketings;
					let html = '';
					
					if (ticketings.length == 0) {
						html += '<tr>';
						html += '	<td colspan="5" class="text-center">예매내역이 없습니다.</td>';
						html += '</tr>';
					} else {
						for (let i = 0; i < ticketings.length; i++) {
							html += '<tr id='+ticketings[i].watCd+'>';
							html += 	'<td>';
							html +=		'	<input type="hidden" name="watCd" value='+ticketings[i].watCd+'>';
							html +=		'	<input type="hidden" name="nMemCd" value='+ticketings[i].nMemCd+'>';
							html +=			ticketings[i].nMemCd;
							html +=		'</td>';
							html += 	'<td>'+phoneNumber+'</td>';
							html += 	'<td>'+ticketings[i].movieVO.movNm+'</td>';
							html += 	'<td>'+ticketings[i].watDt+'</td>';
							html += 	'<td>';
							html += 		'<button type="button" class="btn btn-danger btn-xs btn_cancle">예매취소</button>';
							html += 	'</td>';
							html +=	'</tr>';
						}
					}
					
					$('#ticketingViewTbl tbody').html(html);
				},
				error: function(xhr){
					alert(xhr.status);
				},
				dataType: 'json'
			});
		} else {
			alert('인증번호를 확인하세요.');
			$('#cerField').focus();
		}
	});
	
	/* 예매 취소 */
	$(document).on('click', '.btn_cancle', function(){
		let self = $(this);
		
		if (!confirm('해당 예매를 취소하시겠습니까?')) {
			return;
		}
		
		$.ajax({
			type: 'post',
			url: '<%=request.getContextPath() %>/nonMemberTicketingCancle.do',
			data: {
				"watCd" : self.parents('tr').find('[name="watCd"]').val()
			},
			success: function(data){
				if (data.isCancled == 'Y') {
					alert(data.msg);
					$('#' + data.watCd).remove();
					
					if ($('#ticketingViewTbl tbody').find('tr').length == 0) {
						let html = '';
						
						html += '<tr>';
						html += '	<td colspan="5" class="text-center">예매내역이 없습니다.</td>';
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
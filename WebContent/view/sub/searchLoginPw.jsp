<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2 class="pageTitle">비밀번호 찾기</h2>

<div class="searchLoginId-form form-horizontal">
	<form action="searchLoginPw.do" method="post" id="searchLoginPwfrm">
		<div class="form-group">
			<label class="col-sm-3 control-label" for="searchId">아이디</label>
			<div class="col-sm-9">
				<input type="text" id="searchId" placeholder="아이디" class="form-control" name="searchId">
			</div>
		</div>
		
		<div class="form-group tel-group">
			<label class="col-sm-3 control-label" for="firstPh">전화번호</label>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-xs-3">
						<input class="form-control" type="text" placeholder="010" id="firstTel" required pattern="(010)" maxlength="3" name="firstTel">
					</div>

					<span class="ph-span"> - </span>

					<div class="col-xs-3">
						<input class="form-control" type="text" placeholder="0000" id="middleTel" required pattern="[0-9]{4}" maxlength="4" name="middleTel" title="전화번호 두 번째 자리">
					</div>

					<span class="ph-span"> - </span>

					<div class="col-xs-3">
						<input class="form-control" type="text" placeholder="0000" id="lastTel" required pattern="[0-9]{4}" maxlength="4" name="lastTel" title="전화번호 마지막 자리">
					</div>
				</div>
			</div>
		</div>
		
		<div class="text-right">
			<input type="button" value="비밀번호찾기" class="btn btn-danger btn-block btn-submit" id="btn">
		</div>
	</form>
</div>

<script>
	$('#btn').on('click', function() {
		$.ajax({
			url : '<%=request.getContextPath()%>/searchLoginPw.do',
			type : 'post',
			data : $('#searchLoginPwfrm').serialize(),
			success : function(data) {
				if(data.code == 'success') {
					alert(data.msg);
					location.href = '<%=request.getContextPath() %>/login.do';
				} else {
					alert(data.msg);
					location.href = '<%=request.getContextPath() %>/searchLoginPw.do';
				}
			},
			error : function(xhr) {
				alert(xhr.status);
			},
			dataType : 'json'
		});
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String loginId = (String) session.getAttribute("loginId");
%>

<script src="<%=request.getContextPath() %>/js/plugins/ckeditor_basic/ckeditor.js"></script>
<script src="<%=request.getContextPath() %>/js/notice.js"></script>

<input type="hidden" name="loginId" value="<%=loginId %>">

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">공지사항</h2>
<!-- //페이지 타이틀 -->

<!-- 여기부터 페이지 내용 -->
<div class="boardWrap">
	<div id="brdModiForm">
		<textarea class="form-control" rows="5" cols="103"></textarea>
		<div class="bttn">
			<input type="button" id="ok_b" value="확인" class="btn btn-default btn-xs">
			<input type="button" id="cancel_b" value="취소" class="btn btn-default btn-xs">
		</div>
	</div>

	<div id="repModiForm">
		<textarea class="form-control" rows="3" cols="103"></textarea>
		<div class="bttn">
			<input type="button" id="ok_r" value="확인"> 
			<input type="button" id="cancel_r" value="취소">
		</div>
	</div>

	<div class="box" id="box1">
		

		<div class="text-right">
			<input type="button" value="글쓰기" id="wrt" class="btn btn-basic">
		</div>
		
		<div id="noticeList"></div>
		<br>

		<div id="pagelist"></div>
	</div>
	<div id="wModal" class="modal fade" role="dialog">
		<div class="modal-dialog" role="document">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label class="control-label col-sm-2">작성자(관리자)</label>
							<div class="col-sm-10">
								<input type="text" class="txt form-control" name="noti_wri"	id="memWrt"><br>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">글제목</label>
							<div class="col-sm-10">
								<input type="text" class="txt form-control" name="noti_tit"	id="textNm"><br>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">글내용</label>
							<div class="col-sm-10">
								<textarea class="txt form-control" rows="5" cols="50" name="noti_con" id="tta"></textarea>
								<br>
							</div>
						</div>

						<input type="button" class="btn btn-success" value="전송" id="send">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	let currentPage = 1;

	let boardNum = "";
	let vidx = "";

	let brdModiCont = "";
	let repModiCont = "";

	listServer(1, function(){
		
		//메인에서 게시글 링크 타고 접속했을 시, 해당 게시글 펼쳐지게 처리, 2022.03.22. OSH 추가
		if (location.search && location.search.indexOf('notiNum') > -1) {
			let params = location.search.split('=');
			let notiNum = params[1];
			
			$(window).scrollTop($('#noti' + notiNum).offset().top);
			$('#noti' + notiNum).find('.list').trigger('click');
		}
	});
</script>
<!-- //여기까지 페이지 내용 -->
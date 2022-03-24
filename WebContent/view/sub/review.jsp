<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String loginId = (String) session.getAttribute("loginId");
%>

<script src="<%=request.getContextPath() %>/js/plugins/ckeditor_basic/ckeditor.js"></script>
<script src="<%=request.getContextPath() %>/js/review.js"></script>

<input type="hidden" name="loginId" value="<%=loginId != null ? loginId : "" %>">

<!-- 페이지 타이틀 -->
<h2 class="pageTitle">영화 리뷰</h2>
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
			<% if (session.getAttribute("loginId") != null) { %>
			<input type="button" value="글쓰기" id="wrt" class="btn btn-basic">
			<%} %>
	    	<% if (session.getAttribute("loginId") == null) { %>
	    	<input type="button" value="글쓰기" id="wrt2" class="btn btn-basic" onclick="alert('로그인이 필요한 서비스입니다.')">
	    	<%} %>

		</div>

		<div id="reviewList"></div>
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
							<label class="control-label col-sm-2">작성자</label>
							<div class="col-sm-10">
								<input type="text" class="txt form-control" name="mov_rev_wri"	id="memWrt"><br>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">영화 제목</label>
							<div class="col-sm-10">
								<input type="text" class="txt form-control" name="mov_rev_tit"	id="textNm"><br>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">리뷰 내용</label>
							<div class="col-sm-10">
								<textarea class="txt form-control" rows="5" cols="50" name="mov_rev_con" id="tta"></textarea>
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

	listServer(1);
</script>
<!-- //여기까지 페이지 내용 -->
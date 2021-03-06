<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.success-div {
  margin-left: auto;
  margin-right: auto;
  padding: 20px;
  text-align: center;
  border: none;
}
.success-div h2 {
  font-size: 40px;
}
.btns {
  margin-top: 30px;
}
</style>

<div class="success-div">
	<h2>회원가입이 완료되었습니다 !</h2>
	<div class="btns">
		<a href="<%= request.getContextPath()%>/main.do" class="btn btn-danger">홈페이지 바로가기</a>
		<a href="<%= request.getContextPath()%>/login.do" class="btn">로그인 바로가기</a>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
ul li {
  list-style-type: none;
}
.menu a {
  cursor:pointer;
}
.menu .hide {
  display:none;
}
</style>
<div>
<div>
  <h2>무통장입금 은행 선택</h2>
</div>
<nav>
    <ul>
      <li><a href="" class="bank">농협은행</a>
        <ul class="subClass">
          <li><p>계좌명 : 농협은행</p></li>
          <li><p>계좌번호 : 001-0001-0001-01</p></li>
        </ul>
      </li>
      <li><a href="" class="bank">국민은행</a>
        <ul class="subClass">
          <li><p>계좌명 : 국민은행</p></li>
          <li><p>계좌번호 : 002-0002-0002-02</p></li>
        </ul>
      </li>
      <li><a href="" class="bank">신한은행</a>
        <ul class="subClass">
          <li><p>계좌명 : 신한은행</p></li>
          <li><p>계좌번호 : 003-0003-0003-03</p></li>
        </ul>
      </li>
      <li><a href="" class="bank">국민은행</a>
        <ul class="subClass">
          <li><p>계좌명 : 국민은행</p></li>
          <li><p>계좌번호 : 002-0002-0002-02</p></li>
        </ul>
      </li>
      <li><a href="" class="bank">국민은행</a>
        <ul class="subClass">
          <li><p>계좌명 : 국민은행</p></li>
          <li><p>계좌번호 : 002-0002-0002-02</p></li>
        </ul>
      </li>
    </ul>
</nav>
</div>

<script>
$(document).ready(function(){
    $('.bank>a').click(function(){
        var submenu = $(this).next("ul");
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});
</script>

/**
 * 
 */
let tpNum = "";

listServer = function(page, callback){
	$.ajax({
		url : '/LotteCgvBox/NoticeList',
		type : 'post',
		data : {'page' : page},
		success : function(res){
			
			tpNum = res.tp;
			
			code = '<div class="panel-group" id="accordion">';
			
			$.each(res.datas, function(i,v){
				
				code += '<div class="panel panel-default" id="noti' + v.noti_num + '">';
				code += '  <div class="panel-heading">';
				code += '    <h4 class="panel-title">';    
				code += '      <a idx="' + v.noti_num + '" class="list" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.noti_num + '">';
				code += 		v.noti_tit + '</a>';      
				code += '    </h4>';
				code += '  </div>';
				code += '  <div id="collapse' + v.noti_num + '" class="panel-collapse collapse">';
				code += '    <div class="panel-body pbody">';
				code += '		<div class="p1">작성자 : ' + v.noti_wri + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '		</div>';
				code += '		<div class="p2">';
				code += '  			<input idx="' + v.noti_num + '" type="button" name="modify" value="수정" class="action btn btn-warning btn-sm">';
				code += '			<input idx="' + v.noti_num + '" type="button" name="delete" value="삭제" class="action btn btn-danger btn-sm">';
				code += '		</div>';
				code += '		<div class="p3">' + v.noti_con + '</div>';
				code += '    </div>';
				code += '  </div>';
				code += '</div>';
			});
		    code += '</div>';
		    $('#noticeList').html(code);

			//페이지 리스트
		    pager = '<div class="container">';
			//이전버튼
		    if(res.sp >= 1){
		    	pager += '<ul class="pager">';
		    	pager += '<li><a class="prev" href="#">Prev</a></li></ul>';
		    }
			//페이지 번호 출력
		    pager += '<ul class="pagination pager">';
		    for(i=res.sp; i<=res.ep; i++){
		    	if(currentPage == i){
		    		pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
		    	}else{
		    		pager += '<li><a class="paging" href="#">' + i + '</a></li>';
		    	}
		    }
		    pager += '</ul>';
			//다음버튼
		    if(res.ep <= res.tp){
		    	pager += '<ul class="pager">';
		    	pager += '<li><a class="next" href="#">Next</a></li></ul>';
		    }
		    pager += '</div>';
		    $('#pagelist').html(pager).promise().done(function(){
			
				//페이지 렌더링 후 콜백 처리를 위해 추가, 2022.03.22. OSH
				if (callback != undefined && callback != null) {
					callback();
				}
			});
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	});
};

$(function(){
	/*페이지 번호 클릭 이벤트*/
	$('#pagelist').on('click', '.paging', function(){
		currentPage = $(this).text();
		listServer(currentPage);
	});
	/*이전 버튼 클릭 이벤트*/
	$('#pagelist').on('click','.prev', function(){
		let vprev = $('.paging').first().text();
		
		if(vprev == 1){
		  currentPage = vprev;
		}else{
		  currentPage = vprev - 1;
		}
		listServer(currentPage);
	});
	/*다음 버튼 클릭 이벤트*/
	$('#pagelist').on('click','.next', function(){
		let vnext = $('.paging').last().text();

		if(vnext == tpNum){
		  currentPage = vnext;	
		}else{
		  currentPage = parseInt(vnext) + 1;
		}
		listServer(currentPage);
	});
	/*글쓰기 버튼 - modal 열기*/
	$('#wrt').on('click', function(){
		// 관리자만 작성 가능하게 처리. 2022.03.21. OSH 추가
		if ($('[name="loginId"]').val() != 'admin') {
			alert('작성 권한이 없습니다.');
			return false;
		}
		$('#wModal').modal({backdrop : 'static'});
	});
	/*글 입력 후 전송*/
	$('#send').on('click', function(){
		if($('#memWrt').val() == ""){
			alert("작성자 명을 입력하세요");
		}else if($('#textNm').val() == "")
			alert("글제목을 입력하세요");
		else{
			writeServer();
		}
	});
	/*버튼 이벤트 - 수정, 삭제, 댓글 등록, 댓글수정, 댓글삭제 -delegate*/
	$('#noticeList').on('click','.action', function(){
		
		let vname = $(this).attr('name');
		vidx = $(this).attr('idx');
		//게시글 삭제
		if(vname == 'delete'){
			// 관리자만 삭제 가능하게 처리. 2022.03.21. OSH 추가
			if ($('[name="loginId"]').val() != 'admin') {
				alert('삭제 권한이 없습니다.');
				return false;
			}
			
			let conf = confirm("정말 삭제합니까?");
			if(!conf){
				return false;
			}else{
			  deleteServer();
			}
		//게시글 수정
		}else if(vname == 'modify'){
			// 관리자만 수정 가능하게 처리. 2022.03.21. OSH 추가
			if ($('[name="loginId"]').val() != 'admin') {
				alert('수정 권한이 없습니다.');
				return false;
			}
			
			if($('#brdModiForm').css('display') != 'none') modiReset();
			//본문 내용 변수에 담기
			brdModiCont = $(this).parents('.pbody').find('.p3').html();
			brdModiCont = brdModiCont.replace(/<br>/g, "\n");
			//수정폼 영역에 내용 붙임
			$('#brdModiForm textarea').val(brdModiCont);
			//작성(출력)영역에 자식요소만 삭제하고 수정폼 붙임
			$(this).parents('.pbody').find('.p3').empty().append($('#brdModiForm'));
			$('#brdModiForm').show();	
		}
	});
	
	modiReset = function(){
		let pbodyp3 = $('#brdModiForm').parent(); //.pbody .p3
		//본문수정폼을 body에 붙이고 숨김
		$('#brdModiForm').appendTo('body');
 		$('#brdModiForm').hide();
		//본문내용을 작성영역에 출력
		brdModiCont = brdModiCont.replace(/\n/g, "<br>");
		$(pbodyp3).html(brdModiCont);
	}
	
	/*본문수정영역 확인 버튼*/
	$('#ok_b').on('click',function(){
		brdModiCont = $('#brdModiForm textarea').val();
		let pbodyp3 = $('#brdModiForm').parent();
		$('body').append($('#brdModiForm'));
		$('#brdModiForm').hide();
		let modi = brdModiCont.replace(/\r/g, "").replace(/\n/g, "<br>");
		$(pbodyp3).html(modi);
		modf = {};
		modf.bonum = vidx;
		modf.cont = brdModiCont;
		updateServer();
	});
	
	/*본문수정영역 취소 버튼*/
	$('#cancel_b').on('click',function(){
		modiReset();
	});
});

/* ----------------------------------------------------------- */

/*게시글 저장*/
writeServer = function(){
	$.ajax({
		url : '/LotteCgvBox/NoticeWrite',
		method : 'post',
		data : $('form').serialize(),
		success : function(res){
			if(res.sw == 'ok'){
				alert("게시글이 등록되었습니다");
				$('#wModal').modal('hide');
				$('.txt').val("");
			}else{
				alert("게시글 등록에 실패하였습니다");
				$('#wModal').modal('hide');
			}
			//리스트 출력
			listServer(1);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	});
};

/* ----------------------------------------------------------- */

/*게시글 삭제*/
deleteServer = function(){
	$.ajax({
		url : '/LotteCgvBox/NoticeDelete',
		type : 'post',
		data : {"vidx" : vidx},
		success : function(a){
			if(a.data == 1){
				alert("삭제되었습니다");
				listServer($('.active .paging').text());	
			}
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	});
}

/* ----------------------------------------------------------- */

/*게시글 수정*/
updateServer = function(){
	$.ajax({
		url : '/LotteCgvBox/NoticeUpdate',
		type : 'post',
		data : modf,
		success : function(){},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	});
}

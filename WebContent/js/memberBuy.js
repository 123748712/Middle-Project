$(document).ready(function(){
	
	/* 탭 */
	let btn = $('.pay_list button');
	let box = $('.article_pay_card');
	
	btn.on('click', function(){
		let thisBox = $('#' + $(this).attr('data-tab'));
		
		btn.parent().removeClass('on');
		$(this).parent().addClass('on');
		
		box.removeClass('on');
		thisBox.addClass('on');
	});
});

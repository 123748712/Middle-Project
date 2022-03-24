import init_calendar from "./calendar.js"

$(function(){
	// 로딩화면 감추기
	// 2022.03.19. OSH, sessionStorage에 저장하여 세션이 유지되는동안 한번만 표출되도록 수정
	if (!sessionStorage.getItem('loadingComplete')) {
		$('#loading').show().fadeOut(1300,function(){
	      $(this).remove();
	
	      if ($('#loading').length == 0) {
	      	alert("■ 안전한 영화관 이용 안내 ■ \n \n 백신 접종, 미접종자 모두 이용 가능 \n 상영관 내 물, 무알콜 음료만 취식 가능 \n \n ※ 안전한 영화관람을 위해 관람 중 상시 마스크 착용을 부탁드립니다.");      
		  	sessionStorage.setItem('loadingComplete', 'Y');
		  }
	   });
	}
});

// 지역 선택
const activeLocation = function(e){
	e.preventDefault();

    const step1 = ()=>{
      return new Promise((resolve, reject)=>{
        const depth2 = document.querySelectorAll(".ticket_wrap .depth2");

        // 모든 구 선택 해제
        depth2.forEach((d)=>{d.classList.remove("active")});
        resolve();
      });
    }

    const step2 = ()=>{
      return new Promise((resolve, reject)=>{
        const depth1 = document.querySelectorAll(".ticket_wrap .depth1");

        // 모든 지역 선택 해제
        depth1.forEach((d)=>{d.classList.remove("active")});
        resolve();
      });
      
    }

    const step3 = ()=>{
      return new Promise((resolve, reject)=>{
        const selectedLocation = e.currentTarget;

        // 선택된 지역 선택 활성화
        selectedLocation.classList.add("active");
        resolve();
      });
    }

    const step4 = ()=>{
      return new Promise((resolve, reject)=>{
        const activatedDepth2 = document.querySelector(".ticket_wrap .depth1.active > .depth2");

        // 선택된 지역에 존재하는 영화관 활성화
        activatedDepth2.classList.add("active");
        resolve();
      });
    }

    step1().then(step2)
           .then(step3)
           .then(step4);
}
// 영화관 선택
const activeCinema = function(e){
  const step1 = ()=>{
    return new Promise((resolve, reject)=>{
      const cinemas = document.querySelectorAll(".ticket_wrap .depth2 > ul > li");
      
      // 모든 영화관 선택 해제
      cinemas.forEach((cinema)=>{cinema.classList.remove("active")});
      resolve();
    });
  }

  const step2 = ()=>{
    return new Promise((resolve, reject)=>{
      const selectedMovie = e.currentTarget;

      // 선택된 영화관 선택 활성화
      selectedMovie.classList.add("active");
      resolve();
    });
  }

  const step3 = ()=>{
    return new Promise((resolve, reject)=>{
      const title = document.querySelector(".ticket_wrap .article.article_cinema .group_top .tit");

      // 영화관 제목에 선택된 영화제목 출력
      title.textContent = e.currentTarget.innerText;
      resolve();
    });
  }
  
  step1().then(step2)
         .then(step3);
}

// 영화선택
const activeMovie = function(e, cd){
  e.preventDefault();
	
  const title = document.querySelector(".ticket_wrap .article.article_movie .group_top .tit");
  const selectedMovie = e.currentTarget;
  const movies = document.querySelectorAll(".ticket_wrap .movie_select_wrap.list ul li");
  const times = document.querySelectorAll(".ticket_wrap .tab_wrap.outer li .tab_con");

  // 모든 영화 선택 해제
  const step1 = ()=>{
    return new Promise((resolve, reject)=>{
      movies.forEach((movie)=>{movie.classList.remove("active")});
      resolve();
    });
  };

  // 클릭한 영화 선택 활성화
  const step2 = ()=>{
    return new Promise((resolve, reject)=>{
      selectedMovie.classList.add("active");    
      resolve();
    });
  };

  // 선택한 영화를 제목에 출력
  const step3 = ()=>{
    return new Promise((resolve, reject)=>{
      title.textContent = selectedMovie.innerText;    
      resolve();
    });
  };

  // 영화에 맞는 상영날짜 활성화
  const step4 = ()=>{
    return new Promise((resolve, reject)=>{
      times.forEach((time)=>{
        if(time.getAttribute("data-cd") === cd)
        {
          time.classList.add("active");
        }
        else
        {
          time.classList.remove("active");
        }
      });    
      resolve();
    });
  };

  step1().then(step2)
         .then(step3)
         .then(step4);
}

// 초기화
const init = ()=>{
  // 지역 버튼 클릭시 해당 지역의 영화관 리스트 활성화 이벤트 등록
  const depth1 = document.querySelectorAll(".ticket_wrap .depth1");
  depth1.forEach((d)=>{d.addEventListener("click",activeLocation);});

  // 영화관 클릭 이벤트 등록
  const cinemas = document.querySelectorAll(".ticket_wrap .depth2 > ul > li");
  cinemas.forEach((cinema)=>{cinema.addEventListener("click",activeCinema);});

  // 영화 선택 이벤트 등록
  const movies = document.querySelectorAll(".ticket_wrap .movie_select_wrap.list ul li");
  movies.forEach((movie)=>{movie.addEventListener("click",(e)=>{activeMovie(e,e.currentTarget.getAttribute("data-cd"));});});

  /* 예매하기 버튼으로 넘어왔을 시, 해당 영화에 활성화 표시. 2022.03.20, OSH 추가 */
  if (location.search && location.search.indexOf('movCd') > -1) {
	const params = location.search.split("=");
    const movEl = $('.movie_select_wrap.list li[data-cd='+params[1]+']');
	
    movEl.trigger('click');
	movEl.find('a').trigger('click');
  }
};
init();
init_calendar();
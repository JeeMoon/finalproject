<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
    <section class="hero py-5 py-lg-7">
      <div class="container position-relative">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-center">
          <li class="breadcrumb-item"><a href="<c:url value='../index'/>">Home</a></li>
          <li class="breadcrumb-item active">메인</li>
        </ol>
        <h1 class="hero-heading">디자인 / 개발</h1>
        <div class="row">
          <div class="col-xl-8 mx-auto">
          	<form><p class="text-muted mb-4">지금 파밍과 함께 시작해보세요.</p>
          <div class="input-group">
          	<input class="form-control" type="text" placeholder="어떤 분야의 전문가를 찾으시나요? "><button class="btn btn-primary" type="submit">
          	<i class="fa fa-search"></i></button>
          	</div>
          	</form>
          	</div>
        </div>
      </div>
    </section>
    <section>
      <div class="container">
        <div class="row py-5 pt-lg-0 mt-lg-n5">
        
          <div class="col-lg-4 mb-3 mb-lg-0 text-center" style="margin-left:17%">
            <div class="card border-0 shadow-sm hover-animate h-100">
              <div class="card-body p-4">
                <div class="icon-rounded bg-primary-light mb-3">
                  <svg class="svg-icon text-primary w-2rem h-2rem">
                    <use xlink:href="#destination-map-1"> </use>
                  </svg>
                </div>
                <h3 class="h5">디자인</h3>
                <!-- <p class="text-muted text-sm mb-0">파밍을 처음 이용하시는 고객들을 위한 안내 가이드맵!</p> -->
                <a class="stretched-link" href="<c:url value='/search/design'/>"> 
                <span class="sr-only">See Topic</span>
                </a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="card border-0 shadow-sm hover-animate h-100">
              <div class="card-body p-4">
                <div class="icon-rounded bg-primary-light mb-3">
                  <svg class="svg-icon text-primary w-2rem h-2rem">
                    <use xlink:href="#laptop-screen-1"> </use>
                  </svg>
                </div>
                <h3 class="h5">개발</h3>
                <!-- <p class="text-muted text-sm mb-0">IT 전문가분들의 파밍사이트 이용관련 안내 가이드! </p> -->
                <a class="stretched-link" href="<c:url value='/search/dev'/>"> 
                <span class="sr-only">See Topic</span>
                </a>
              </div>
            </div>
          </div>
          
          <h4 class="text-muted mb-4" style="margin-left:45%; margin-top:100px;"> 모든 서비스</h4>
          <br><br>
          
          
        </div>
      </div>
    </section>
    <div style="margin-left:30%; float:left;">
          	<p class="text-muted mb-4" style="font-size:large;">인쇄물 디자인</p>
	      	<p class="text-muted mb-4" style="font-size:large;">명함 디자인</p>
	      	<p class="text-muted mb-4" style="font-size:large;">로고 디자인</p>
	      	<p class="text-muted mb-4" style="font-size:large;">간판 디자인</p>
	     	<p class="text-muted mb-4" style="font-size:large;">프레젠테이션 디자인</p>
	     	<p class="text-muted mb-4" style="font-size:large;">일러스트 디자인</p>
	     	<p class="text-muted mb-4" style="font-size:large;">제품 디자인</p>
	     	<p class="text-muted mb-4" style="font-size:large;">라벨 디자인</p>
	    	<p class="text-muted mb-4" style="font-size:large;">웹 디자인</p>
	    	<p class="text-muted mb-4" style="font-size:large;">앱 디자인</p>
          </div>
          <div style="margin-left:60%;">
          	<p class="text-muted mb-4" style="font-size:large;">개임 개발</p>
	      	<p class="text-muted mb-4" style="font-size:large;">ios 개발</p>
	      	<p class="text-muted mb-4" style="font-size:large;">안드로이드 개발</p>
	      	<p class="text-muted mb-4" style="font-size:large;">웹 개발</p>
	     	<p class="text-muted mb-4" style="font-size:large;">퍼블리싱</p>
	     	<p class="text-muted mb-4" style="font-size:large;">소프트웨어 개발</p>
	     	<p class="text-muted mb-4" style="font-size:large;">워드프레스 개발</p>
	     	<p class="text-muted mb-4" style="font-size:large;">커머스/쇼핑몰 개발</p>
	     	<p class="text-muted mb-4" style="font-size:large;">매크로/VBA 개발</p>
	     	<p class="text-muted mb-4" style="font-size:large;">인공지능(AI) 개발</p>
	    	<p class="text-muted mb-4" style="font-size:large;">챗봇 개발</p>
	    	<p class="text-muted mb-4" style="font-size:large;">ERP 개발</p>
	    	<p class="text-muted mb-4" style="font-size:large;">QA/테스트</p>
	    	<p class="text-muted mb-4" style="font-size:large;">웹/앱 유지보수</p>
          </div>
    <br><br><br><br>
    
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${pageContext.request.contextPath }/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="${pageContext.request.contextPath }/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${pageContext.request.contextPath }/resources/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="${pageContext.request.contextPath }/resources/js/theme.js"></script>
<%@ include file="../inc/bottom.jsp" %>
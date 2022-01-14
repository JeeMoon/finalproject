<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
    <section class="hero py-5 py-lg-7">
      <div class="container position-relative">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-center">
          <li class="breadcrumb-item"><a href="<c:url value='../index'/>">Home</a></li>
          <li class="breadcrumb-item active">디자인/개발</li>
        </ol>
        <h1 class="hero-heading">개발 </h1>
         <!-- <div class="row">
          <div class="col-xl-8 mx-auto">
          	<form><p class="text-muted mb-4" style="font-size:large;">모든 서비스</p>
          
          	</form>
          	</div>
        </div> -->
      </div>
    </section>
    <section>
    <br><br><br>
    <div style="margin-left:30%; float:left;">
    	<p class="text-muted mb-4" style="font-size:large;">개임 개발</p>
      	<p class="text-muted mb-4" style="font-size:large;">ios 개발</p>
      	<p class="text-muted mb-4" style="font-size:large;">안드로이드 개발</p>
      	<p class="text-muted mb-4" style="font-size:large;">웹 개발</p>
     	<p class="text-muted mb-4" style="font-size:large;">퍼블리싱</p>
     	<p class="text-muted mb-4" style="font-size:large;">소프트웨어 개발</p>
     	<p class="text-muted mb-4" style="font-size:large;">워드프레스 개발</p>
    </div>
    <div style="margin-left:60%;">
    	<p class="text-muted mb-4" style="font-size:large;">커머스/쇼핑몰 개발</p>
     	<p class="text-muted mb-4" style="font-size:large;">매크로/VBA 개발</p>
     	<p class="text-muted mb-4" style="font-size:large;">인공지능(AI) 개발</p>
    	<p class="text-muted mb-4" style="font-size:large;">챗봇 개발</p>
    	<p class="text-muted mb-4" style="font-size:large;">ERP 개발</p>
    	<p class="text-muted mb-4" style="font-size:large;">QA/테스트</p>
    	<p class="text-muted mb-4" style="font-size:large;">웹/앱 유지보수</p>
    </div>
    <br><br><br>  
      
    </section>
    
    
    
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
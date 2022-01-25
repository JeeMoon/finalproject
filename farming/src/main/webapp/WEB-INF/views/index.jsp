<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>		
    <section class="hero-home">
      <div class="swiper-container hero-slider">
        <div class="swiper-wrapper dark-overlay">
          <div class="swiper-slide" style="background-image:url(${pageContext.request.contextPath }/resources/img/photo/person.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(${pageContext.request.contextPath }/resources/img/photo/introduce.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(${pageContext.request.contextPath }/resources/img/photo/person2.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(${pageContext.request.contextPath }/resources/img/photo/photo-1519974719765-e6559eac2575.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(${pageContext.request.contextPath }/resources/img/photo/introduce3.jpg)"></div>
        </div>
      </div>
      <div class="container py-6 py-md-7 text-white z-index-20">
        <div class="row">
          <div class="col-xl-10">
            <div class="text-center text-lg-start">
              <p class="subtitle letter-spacing-4 mb-2 text-primary text-shadow">New Matching Service </p>
              <h1 class="display-3 fw-bold text-shadow">Let's farming!</h1><br>
                     <a class="btn btn-primary" href="<c:url value='/introduce/company'/>">파밍이란 무엇인가?</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="text-center pb-lg-4">
          <p class="subtitle letter-spacing-4 mb-2 text-primary text-shadow"><br><br><br><br>YOU WANT TO FIND EXPERT, BUT HARD TO SEARCH?</p>
          <h2 class="mb-5 text-shadow">전문가를 찾아 이야기해보세요!</h2><br>
        </div>
        <div class="row">
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="px-0 px-lg-3">
              <div class="icon-rounded bg-primary-light mb-3">
                <svg class="svg-icon text-primary w-2rem h-2rem">
                  <use xlink:href="#identity-1"></use>
                </svg>
              </div>
              <h3 class="h5">회원가입을 하세요</h3>
              <p class="text-muted">전문가를 찾고 싶으면 일반회원, 고객을 찾고 싶으면 전문가회원 가입을 하세요</p>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="px-0 px-lg-3">
              <div class="icon-rounded bg-primary-light mb-3">
                <svg class="svg-icon text-primary w-2rem h-2rem">
                  <use xlink:href="#map-location-1"> </use>
                </svg>
              </div>
              <h3 class="h5">전문가를 찾아보세요</h3>
              <p class="text-muted">지도나 카테고리 검색을 통해 조건에 알맞은 전문가들을 찾으세요</p>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="px-0 px-lg-3">
              <div class="icon-rounded bg-primary-light mb-3">
                <svg class="svg-icon text-primary w-2rem h-2rem">
                  <use xlink:href="#destination-map-1"> </use>
                </svg>
              </div>
              <h3 class="h5">견적요청서를 보내세요</h3>
              <p class="text-muted">자신이 원하는 전문가들을 찾았으면 그분들에게 견적요청서를 보내세요</p><br>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="px-0 px-lg-3">
              <div class="icon-rounded bg-primary-light mb-3">
                <svg class="svg-icon text-primary w-2rem h-2rem">
                  <use xlink:href="#pay-1"> </use>
                </svg>
              </div>
              <h3 class="h5">요청서를 확인하고 견적서를 보내세요</h3>
              <p class="text-muted">전문가들은 견적요청서의 내용을 바탕으로 견적을 작성해 고객에게 보내세요</p><br>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="px-0 px-lg-3">
              <div class="icon-rounded bg-primary-light mb-3">
                <svg class="svg-icon text-primary w-2rem h-2rem">
                  <use xlink:href="#mail-1"> </use>
                </svg>
              </div>
              <h3 class="h5">견적서를 확인하세요</h3>
              <p class="text-muted">견적서들을 받았으면 조건에 알맞는 견적을 찾아 나에게 맞는 전문가를 찾으세요</p><br>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="px-0 px-lg-3">
              <div class="icon-rounded bg-primary-light mb-3">
                <svg class="svg-icon text-primary w-2rem h-2rem">
                  <use xlink:href="#chat-app-1"> </use>
                </svg>
              </div>
              <h3 class="h5">채팅을 하세요</h3>
              <p class="text-muted">전문가를 찾았으면 채팅을 시도해 서로 이야기하면서 거래를 진행하세요</p><br>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-6">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary text-shadow">What do you want?</p>
            <h2>Category</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="<c:url value='/knowhow/list'/>">
               See all<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="swiper-container guides-slider mx-n2 pt-3">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              	href="<c:url value='/request/request?categoryNo=4'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/webdev1.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">웹 개발</h6>
                  <p class="card-text text-sm">Web Development</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              	href="<c:url value='/request/request?categoryNo=1'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/game3.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">게임 개발</h6>
                  <p class="card-text text-sm">Game Development</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              	href="<c:url value='/request/request?categoryNo=2'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/app1.png" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">IOS 개발</h6>
                  <p class="card-text text-sm">IOS Development</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              	href="<c:url value='/request/request?categoryNo=11'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/web1.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">웹 디자인</h6>
                  <p class="card-text text-sm">Web Design</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              href="<c:url value='/request/request?categoryNo=24'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/app3.png" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">앱 디자인</h6>
                  <p class="card-text text-sm">App Design</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              href="<c:url value='/request/request?categoryNo=22'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/label3.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">라벨 디자인</h6>
                  <p class="card-text text-sm">Label Design</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              href="<c:url value='/request/request?categoryNo=21'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/product1.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">제품 디자인</h6>
                  <p class="card-text text-sm">Product Design</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              href="<c:url value='/request/request?categoryNo=20'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/ill2.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">일러스트 디자인</h6>
                  <p class="card-text text-sm">Illustration Design</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" 
              href="<c:url value='/request/request?categoryNo=19'/>"></a><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/product2.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">프레젠테이션 디자인</h6>
                  <p class="card-text text-sm">Presentation Design</p>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-pagination d-md-none"> </div>
        </div>
      </div>
    </section>
    <section class="py-6 bg-gray-100"> 
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary text-shadow">Would you like to get a good professional recommendation?</p>
            <h2>떠오르는 전문가</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="category.html">
               See all experts<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>

        <!-- Slider main container-->
        <div class="swiper-container swiper-container-mx-negative swiper-init pt-3" data-swiper="{&quot;slidesPerView&quot;:4,&quot;spaceBetween&quot;:20,&quot;loop&quot;:true,&quot;roundLengths&quot;:true,&quot;breakpoints&quot;:{&quot;1200&quot;:{&quot;slidesPerView&quot;:3},&quot;991&quot;:{&quot;slidesPerView&quot;:2},&quot;565&quot;:{&quot;slidesPerView&quot;:1}},&quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;,&quot;clickable&quot;:true,&quot;dynamicBullets&quot;:true}}">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/webapp.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=28'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-0.jpg" alt="Pamela"/>
                        <!-- <div>오유미</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">오유미</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">웹 개발, 웹/앱 유지보수</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                        </p><br>
                      </div>
                      <p class="card-text text-muted"><span class="h6">서울 서초구</span>&nbsp;&nbsp;경력 4년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/game1.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=53'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-7.jpg" alt="John"/>
                        <!-- <div>유재문</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">유재문</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">게임 개발</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h6">서울 서초구</span>&nbsp;&nbsp;경력 3년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/intweb8.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=55'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-8.jpg" alt="Julie"/>
                        <!-- <div>최지희</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">최지희</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">게임 개발, ios개발</p>
                       <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h6">서울 서초구</span>&nbsp;&nbsp;경력 4년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/website.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=39'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-9.jpg" alt="Barbora"/>
                        <!-- <div>오현택</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">오현택</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">웹 개발</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h6">서울 서초구</span>&nbsp;&nbsp;경력 3년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/prod1.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=39'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-10.jpg" alt="Barbora"/>
                        <!-- <div>오현택</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">최윤철</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">제품 디자인</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h6">수원 권선구</span>&nbsp;&nbsp;경력 5년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/labeltea.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=39'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-11.jpg" alt="Barbora"/>
                        <!-- <div>오현택</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">함태영</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">라벨 디자인</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h6">서울 강남구</span>&nbsp;&nbsp;경력 3년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${pageContext.request.contextPath }/resources/img/photo/illust1.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=39'/>"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-8.jpg" alt="Barbora"/>
                        <!-- <div>오현택</div> -->
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h5 class="card-title"><a class="text-decoration-none text-dark text-shadow" href="detail-rooms.html">이다혜</a></h5>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">일러스트 디자인</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h6">수원 영통구</span>&nbsp;&nbsp;경력 10년</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>            
          </div>
          <!-- If we need pagination-->
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>
    <!-- Divider Section-->
    <section class="py-7 position-relative dark-overlay"><img class="bg-image" src="${pageContext.request.contextPath }/resources/img/photo/photo-1497436072909-60f360e1d4b1.jpg" alt="">
      <div class="container">
        <div class="overlay-content text-white py-lg-5">
          <p class="subtitle text-primary">Finding a hidden expert on a map</p>
          <h5 class="display-5 fw-bold text-shadow mb-5">내가 있는 지역에 숨은 전문가 찾기!</h5>
          <a class="btn btn-primary" href="<c:url value='/hiddenExp/findByMap'/>">Get started</a>
        </div>
      </div>
    </section>
    <section class="py-7">
      <div class="container">
        <div class="text-center">
          <p class="subtitle text-primary text-shadow">Would you want to share the review?</p>
          <h2 class="mb-5">Review Board</h2>
        </div>
        <!-- Slider main container-->
        <div class="swiper-container testimonials-slider testimonials">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pt-2 pb-5">
            <!-- Slides-->
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-4.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">"디자인 감각이 없어서 스트레스 받던중 색감과 컨셉만 가지고 정말 이쁘게 잘 만들어주셨어요. 상담도 친절하게 잘해주시고 결과물도 만족스럽게 나와서 좋았습니다. 완전 추천해요!"</p><strong>이**</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">"전문가님, 생각보다 더신경써서 준비해주시고 덕분에 결과물이 좋았습니다. 다음에 다른 주제로 재의뢰할께요 ! 주변분들에게 추천할께요 고맙습니다!"</p><strong>주**</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-2.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">"원하는 컨셉 효과를 얘기하니 센스있게 아주 만족스러운 결과를 만들어주셔서 너무 감사합니다 다음에도 작업할거 있으면 꼭 전문가님께 부탁드릴게요!!!"</p><strong>유**</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-5.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">"처음으로 하는 작업이어서 긴장을 많이 했는데, 아주 친절하시고 매번 질문해도 정확하게 알려주시니 다음에 만들때도 또 의뢰할 예정입니다.갑사합니다!"</p><strong>박**</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-8.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">게더타운 행사에 필요한 이미지를 빠르고 좋은 퀄리티로 작업 해주셨습니다. 덕분에 무사히 행사를 마칠 수 있었고, 기회가 되면 다음에도 의뢰할 예정입니다"</p><strong>오**</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${pageContext.request.contextPath }/resources/img/avatar/avatar-9.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">"최고였습니다. 늦은시간까지 이어지는 작업이였음에도 불구하고 끝까지 친절하게 일에 임해주셨으며, 소비자의 니즈를 빠르시간안에 캐치해 원하는 결과를 만들어주셨습니다 감사합니다!"</p><strong>한**</strong>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-pagination">     </div>
        </div>
      </div>
    </section>
        <!-- Divider Section-->
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0 text-center text-lg-left">
            <p class="subtitle text-primary text-shadow">Find & Discover great local business partner</p><br>
            <p class="text-lg text-shadow"><strong>당신의 능력을 알아주는 고객과 믿을 수 있는 전문가를<br>파밍 단 한곳에서 찾으세요</strong></p>
            <p class="text-muted mb-0 text-shadow">지금 파밍에 가입해보세요!</p>
          </div>
          <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="text-center">
              <p class="mb-2"><a class="btn btn-lg btn-primary text-shadow" href="${pageContext.request.contextPath }/member/agreement">Create Your Account</a></p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
<%--     <section class="py-6 bg-gray-100"> 
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-secondary">Stories from around the globe</p>
            <h2>From our travel blog</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="blog.html">
               See all articles<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="row">
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="post.html"><img class="img-fluid card-img-top" src="${pageContext.request.contextPath }/resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Travel </a>
                <h5 class="my-2"><a class="text-dark" href="post.html">Autumn fashion tips and tricks          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">Pellentesque habitant morbi tristique senectus. Vestibulum tortor quam, feugiat vitae, ultricies ege...</p><a class="btn btn-link ps-0" href="post.html">Read more<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="post.html"><img class="img-fluid card-img-top" src="${pageContext.request.contextPath }/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Living </a>
                <h5 class="my-2"><a class="text-dark" href="post.html">Newest photo apps          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibu...</p><a class="btn btn-link ps-0" href="post.html">Read more<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="post.html"><img class="img-fluid card-img-top" src="${pageContext.request.contextPath }/resources/img/photo/photo-1482463084673-98272196658a.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Travel </a>
                <h5 class="my-2"><a class="text-dark" href="post.html">Best books about Photography          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleif...</p><a class="btn btn-link ps-0" href="post.html">Read more<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> --%>
    <!-- Instagram-->
    <section>
      <div class="container-fluid px-0">
        <div class="swiper-container instagram-slider">
          <div class="swiper-wrapper">
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-1.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-2.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-3.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-4.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-5.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-6.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-7.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-8.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-9.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-10.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-11.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-12.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-13.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-14.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-10.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-11.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-12.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-13.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="${pageContext.request.contextPath }/resources/img/instagram/instagram-14.jpg" alt=" "></a></div>
          </div>
        </div>
      </div>
    </section>
<%@ include file="inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>자주하는 질문 QNA</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  </head>
  <body style="padding-top: 72px;">
    <header class="header">
      <!-- Navbar-->
      <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
        <div class="container-fluid">
          <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="index.html"><img src="${pageContext.request.contextPath }/resources/img/logo.svg" alt="Directory logo"></a>
            <form class="form-inline d-none d-sm-flex" action="#" id="search">
              <div class="input-label-absolute input-label-absolute-left input-expand ms-lg-2 ms-xl-3"> 
                <label class="label-absolute" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="search_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
          </div>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
          <!-- Navbar Collapse -->
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
              <div class="input-label-absolute input-label-absolute-left w-100">
                <label class="label-absolute" for="searchcollapsed_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="searchcollapsed_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
            <ul class="navbar-nav ms-auto">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="homeDropdownMenuLink" href="index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Home</a>
                <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="index.html">Rooms</a><a class="dropdown-item" href="index-2.html">Restaurants</a><a class="dropdown-item" href="index-3.html">Travel</a><a class="dropdown-item" href="index-4.html">Real Estate <span class="badge badge-info-light ms-1 mt-n1">New</span></a></div>
              </li>
              <!-- Megamenu-->
              <li class="nav-item dropdown position-static"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Template</a>
                <div class="dropdown-menu megamenu py-lg-0">
                  <div class="row">
                    <div class="col-lg-9">
                      <div class="row p-3 pe-lg-0 ps-lg-5 pt-lg-5">
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Homepage</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="index.html">Rooms   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="index-2.html">Restaurants   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="index-3.html">Travel   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="index-4.html">Real estate <span class="badge badge-info-light ms-1">New</span>   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Restaurants</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="category.html">Category - Map on the top   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-2.html">Category - Map on the right   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-3.html">Category - no map   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="detail.html">Restaurant detail   </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Rooms</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-rooms.html">Category - Map on the top   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-2-rooms.html">Category - Map on the right   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-3-rooms.html">Category - no map   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="detail-rooms.html">Room detail   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Blog</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="blog.html">Blog   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="post.html">Post   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Pages</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="compare.html">Comparison   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="team.html">Team   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="contact.html">Contact   </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Pages</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="pricing.html">Pricing   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="text.html">Text page   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="faq.html">F.A.Q.s   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="coming-soon.html">Coming soon   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="404.html">404 page   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="knowledge-base.html">Knowledge Base  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="knowledge-base-topic.html">Knowledge Base  &mdash; Topic<span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="terms.html">Terms & Conditions  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Host</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-add-0.html">Add new listing - 6 pages   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-list.html">Bookings &mdash; list view   </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">User</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-profile.html">Profile   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-account.html">Account   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-personal.html">Personal info - forms   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-security.html">Password & security - forms   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="login.html">Sign in   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="signup.html">Sign up   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-booking-1.html">Booking process - 4 pages   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-grid.html">Bookings &mdash; grid view   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-booking-detail.html">Booking detail   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-invoice.html">Invoice  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-messages.html">Messages <span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-messages-detail.html">Message Detail  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                          </ul>
                        </div>
                      </div>
                      <div class="row megamenu-services d-none d-lg-flex ps-lg-5">
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#destination-map-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">Best rentals</h6>
                              <p class="mb-0 text-muted text-sm">Find the perfect place</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#money-box-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">Earn points</h6>
                              <p class="mb-0 text-muted text-sm">And get great rewards</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#customer-support-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">020-800-456-747</h6>
                              <p class="mb-0 text-muted text-sm">24/7 Available Support</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#secure-payment-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">Secure Payment</h6>
                              <p class="mb-0 text-muted text-sm">Secure Payment</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 d-none d-lg-block position-relative"><img class="bg-image" src="img/photo/photo-1521170665346-3f21e2291d8b.jpg" alt=""></div>
                  </div>
                </div>
              </li>
              <!-- /Megamenu end-->
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Docs</a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
                  <h6 class="dropdown-header fw-normal">Documentation</h6><a class="dropdown-item" href="docs/docs-introduction.html">Introduction </a><a class="dropdown-item" href="docs/docs-directory-structure.html">Directory structure </a><a class="dropdown-item" href="docs/docs-gulp.html">Gulp </a><a class="dropdown-item" href="docs/docs-customizing-css.html">Customizing CSS </a><a class="dropdown-item" href="docs/docs-credits.html">Credits </a><a class="dropdown-item" href="docs/docs-changelog.html">Changelog </a>
                  <div class="dropdown-divider"></div>
                  <h6 class="dropdown-header fw-normal">Components</h6><a class="dropdown-item" href="docs/components-bootstrap.html">Bootstrap </a><a class="dropdown-item" href="docs/components-directory.html">Theme </a>
                </div>
              </li>
              <li class="nav-item"><a class="nav-link" href="login.html">Sign in</a></li>
              <li class="nav-item"><a class="nav-link" href="signup.html">Sign up</a></li>
              <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="user-add-0.html">Add a listing</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- /Navbar -->
    </header>
    <!-- Hero Section-->
    <section class="hero py-5 py-lg-7">
      <div class="container position-relative">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-center">
          <li class="breadcrumb-item"><a href="index.html">QnA</a></li>
          <li class="breadcrumb-item active">자주하는 질문                        </li>
        </ol>
        <h1 class="hero-heading">파밍을 이용하면서 궁금한점이 있으신가요?</h1>
        <div class="row">
          <div class="col-xl-8 mx-auto"><form><p class="text-muted mb-4">파밍을 이용하시면서 궁금하신점들을 언제든지 검색해보세요.</p><div class="input-group"><input class="form-control" type="text" placeholder="이곳에 입력하기 ... "><button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button></div></form></div>
        </div>
      </div>
    </section>
    <section>
      <div class="container">
        <div class="row py-5 pt-lg-0 mt-lg-n5">
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="card border-0 shadow-sm hover-animate h-100">
              <div class="card-body p-4">
                <div class="icon-rounded bg-primary-light mb-3">
                  <svg class="svg-icon text-primary w-2rem h-2rem">
                    <use xlink:href="#destination-map-1"> </use>
                  </svg>
                </div>
                <h3 class="h5">파밍의 첫걸음</h3>
                <p class="text-muted text-sm mb-0">파밍을 처음 이용하시는 분들을 위한 안내 가이드맵!</p><a class="stretched-link" href="knowledge-base-topic.html"> <span class="sr-only">See Topic</span></a>
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
                <h3 class="h5">IT전문가 가이드</h3>
                <p class="text-muted text-sm mb-0">IT전문가분들의 파밍사이트 이용관련 안내 가이드! </p><a class="stretched-link" href="knowledge-base-topic.html"> <span class="sr-only">See Topic</span></a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 mb-3 mb-lg-0 text-center">
            <div class="card border-0 shadow-sm hover-animate h-100">
              <div class="card-body p-4">
                <div class="icon-rounded bg-primary-light mb-3">
                  <svg class="svg-icon text-primary w-2rem h-2rem">
                    <use xlink:href="#chat-app-1"> </use>
                  </svg>
                </div>
                <h3 class="h5">고객 가이드</h3>
                <p class="text-muted text-sm mb-0"> 전문가찾기 서비스를 처음이용하시는 고객분들을 위한 가이드! </p><a class="stretched-link" href="knowledge-base-topic.html"> <span class="sr-only">See Topic</span></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="py-5">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-secondary">What do you need to know?  </p>
            <h2>Choose Your Topic</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="#">
               See all topics<i class="fas fa-angle-double-right ms-2">   </i></a></div>
        </div>
        <div class="row">
          <div class="col-lg-4 mb-4">
            <h3 class="h5 text-dark d-flex align-items-center mb-4"><a class="text-reset" href="knowledge-base-topic.html"><span class="badge badge-secondary-light badge-pill py-1 me-1">12</span>Introduction</a></h3>
            <ul class="list-unstyled ms-3 text-sm">
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Sint consequat aliquip?</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Adipisicing voluptate magna quis sunt dolor velit.</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Ad pariatur anim magna?</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>officia aliqua fugiat ex?</a></li>
            </ul>
          </div>
          <div class="col-lg-4 mb-4">
            <h3 class="h5 text-dark d-flex align-items-center mb-4"><a class="text-reset" href="knowledge-base-topic.html"><span class="badge badge-secondary-light badge-pill py-1 me-1">5</span>Usage</a></h3>
            <ul class="list-unstyled ms-3 text-sm">
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Sint consequat aliquip?</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Adipisicing voluptate magna quis sunt dolor velit.</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Ad pariatur anim magna?</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>officia aliqua fugiat ex?</a></li>
            </ul>
          </div>
          <div class="col-lg-4 mb-4">
            <h3 class="h5 text-dark d-flex align-items-center mb-4"><a class="text-reset" href="knowledge-base-topic.html"><span class="badge badge-secondary-light badge-pill py-1 me-1">7</span>Renting</a></h3>
            <ul class="list-unstyled ms-3 text-sm">
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Sint consequat aliquip?</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Adipisicing voluptate magna quis sunt dolor velit.</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>Ad pariatur anim magna?</a></li>
              <li class="mb-2"><a class="text-muted" href="knowledge-base-topic.html"> <i class="far fa-file me-2"></i>officia aliqua fugiat ex?</a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 mb-4">
            <h3 class="h5 text-dark d-flex align-items-center mb-4"><a class="text-reset" href="#"><span class="badge badge-secondary-light badge-pill py-1 me-1">4</span>Fees</a></h3>
            <ul class="list-unstyled ms-3 text-sm">
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>Sint consequat aliquip?</a></li>
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>Adipisicing voluptate magna quis sunt dolor velit.</a></li>
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>Ad pariatur anim magna?</a></li>
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>officia aliqua fugiat ex?</a></li>
            </ul>
          </div>
          <div class="col-lg-4 mb-4">
            <h3 class="h5 text-dark d-flex align-items-center mb-4"><a class="text-reset" href="#"><span class="badge badge-secondary-light badge-pill py-1 me-1">5</span>Other</a></h3>
            <ul class="list-unstyled ms-3 text-sm">
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>Sint consequat aliquip?</a></li>
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>Adipisicing voluptate magna quis sunt dolor velit.</a></li>
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>Ad pariatur anim magna?</a></li>
              <li class="mb-2"><a class="text-muted" href="#"> <i class="far fa-file me-2"></i>officia aliqua fugiat ex?</a></li>
            </ul>
          </div>
          <div class="col-lg-4 mb-4"></div>
        </div>
      </div>
    </section>
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 col-xl-8 mx-auto text-center">
            <h4 class="subtitle text-primary mb-4">Get Support From Real People</h4>
            <p class="text-muted mb-5">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>
            <ul class="list-unstyled d-flex flex-wrap justify-content-center">
              <li><a href="#"><img class="avatar avatar-lg avatar-border-white hover-animate mx-2" src="img/avatar/avatar-1.jpg" alt=""></a></li>
              <li><a href="#"><img class="avatar avatar-lg avatar-border-white hover-animate mx-2" src="img/avatar/avatar-2.jpg" alt=""></a></li>
              <li><a href="#"><img class="avatar avatar-lg avatar-border-white hover-animate mx-2" src="img/avatar/avatar-3.jpg" alt=""></a></li>
              <li><a href="#"><img class="avatar avatar-lg avatar-border-white hover-animate mx-2" src="img/avatar/avatar-4.jpg" alt=""></a></li>
              <li><a href="#"><img class="avatar avatar-lg avatar-border-white hover-animate mx-2" src="img/avatar/avatar-5.jpg" alt=""></a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section class="pb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-lg-6 mx-auto">
            <div class="card border-0 shadow mt-n5 mb-5">
              <div class="card-header bg-primary-100 py-4 border-0">
                <div class="d-flex align-items-center justify-content-between">
                  <div>
                    <p class="subtitle text-sm text-primary">Drop Us a Line</p>
                    <h4 class="mb-0">Contact</h4>
                  </div>
                  <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-primary flex-shrink-0">
                    <use xlink:href="#fountain-pen-1"> </use>
                  </svg>
                </div>
              </div>
              <div class="card-body">
                <p class="text-muted">He must have tried it a hundred times, shut his eyes so that he wouldn't have to look at the floundering legs, and only stopped when he began to feel a mild, dull pain there that he had never felt before.</p><a class="btn btn-primary" href="#">Let us know</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
      <!-- Main block - menus, subscribe form-->
      <div class="py-6 bg-gray-200 text-muted"> 
        <div class="container">
          <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0">
              <div class="fw-bold text-uppercase text-dark mb-3">Directory</div>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
              <ul class="list-inline">
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="twitter"><i class="fab fa-twitter"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="pinterest"><i class="fab fa-pinterest"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="vimeo"><i class="fab fa-vimeo"></i></a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Rentals</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="index.html">Rooms</a></li>
                <li><a class="text-muted" href="category-rooms.html">Map on top</a></li>
                <li><a class="text-muted" href="category-2-rooms.html">Side map</a></li>
                <li><a class="text-muted" href="category-3-rooms.html">No map</a></li>
                <li><a class="text-muted" href="detail-rooms.html">Room detail</a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Pages</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="compare.html">Comparison                                   </a></li>
                <li><a class="text-muted" href="team.html">Team                                   </a></li>
                <li><a class="text-muted" href="contact.html">Contact                                   </a></li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>
              <p class="mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
              <form action="#" id="newsletter-form">
                <div class="input-group mb-3">
                  <input class="form-control bg-transparent border-dark border-end-0" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
                  <button class="btn btn-outline-dark border-start-0" type="submit"> <i class="fa fa-paper-plane text-lg"></i></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="text-sm mb-md-0">&copy; 2021, Your company.  All rights reserved.</p>
            </div>
            <div class="col-md-6">
              <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                <li class="list-inline-item"><img class="w-2rem" src="img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/western-union.svg" alt="..."></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="js/theme.js"></script>
  </body>
</html>
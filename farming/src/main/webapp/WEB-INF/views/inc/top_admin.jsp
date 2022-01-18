<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Monsterlite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Monster admin lite design, Monster admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Monster Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Farming Admin</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/monster-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/img/farming-favicon.png">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/admin_plugins/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS jqplot -->
    <link href="${pageContext.request.contextPath }/resources/admin_plugins/charts/dist/jquery.jqplot.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/admin_css/style.min.css" rel="stylesheet">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.default.css"
	id="theme-stylesheet">
	
	
	<!-- google charts -->
	    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['month', '일반회원', '전문가'],
          ['2021. 10',  0,      0],
          ['2021. 11',  0,      0],
          ['2021. 12',  2,      1],
          ['2022. 01',  5,      8]
        ]);

        var options = {
          title: ' ',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
	
</head>
<!-- ============================================================== -->
    <script src="<c:url value='/resources/admin_plugins/jquery/dist/jquery.min.js'/>"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<c:url value='/resources/admin_plugins/bootstrap/dist/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/resources/admin_js/app-style-switcher.js'/>"></script>
    <!--Wave Effects -->
    <script src="<c:url value='/resources/admin_js/waves.js'/>"></script>
    <!--Menu sidebar -->
    <script src="<c:url value='/resources/admin_js/sidebarmenu.js'/>"></script>
    <!--Custom JavaScript -->
    <script src="<c:url value='/resources/admin_js/custom.js'/>"></script>
    <!--This page JavaScript -->
    <!--flot chart-->
    <script src="<c:url value='/resources/admin_plugins/flot/jquery.flot.js'/>"></script>
    <script src="<c:url value='/resources/admin_plugins/flot.tooltip/js/jquery.flot.tooltip.min.js'/>"></script>
    <script src="<c:url value='/resources/admin_js/pages/dashboards/dashboard1.js'/>"></script>
	<!-- google maps api -->
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="${pageContext.request.contextPath }/resources/admin_plugins/gmaps/gmaps.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/admin_plugins/gmaps/jquery.gmaps.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin_js/custom.js"></script>
  
  	<!-- JQ-PLOT -->
  	
  	  <!-- JQ-PLOT의 기본 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/jquery.jqplot.min.js" />' type="text/javascript"></script>
  <!-- Highlighter(마우스 접근시 데이터정보 표시) 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.highlighter.js"/>' type="text/javascript"></script>
  <!-- 좌표에 관한 정보나 Zoom 기능 사용시 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.cursor.js"/>' type="text/javascript"></script>
  <!-- 축의 데이터를 날짜형태로 입력하기 위해서 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.dateAxisRenderer.js"/>' type="text/javascript"></script>
  <!-- 축의 데이터의 Label Option을 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.canvasAxisLabelRenderer.js"/>' type="text/javascript"></script>
  <!-- Legend(Line에대한 간단한 범례)의 Option을 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.enhanceLegendRenderer.js"/>' type="text/javascript"></script>
  <!-- 축의 데이터를 순서에 상관없이 자동정렬을 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.categoryAxisRenderer.js"/>' type="text/javascript"></script>
  <!-- 축의 데이터 표현설정과 그래프위의 점의 Option을 설정 -->
  <script src='<c:url value="/resources/admin_plugins/charts/dist/plugins/jqplot.canvasAxisTickRenderer.js"/>' type="text/javascript"></script> 


<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <a class="navbar-brand" href="<c:url value='/admin/main'/>" style="background:#2CCE8D">
                        <%-- <!-- Logo icon --> --%>
                        <img src="${pageContext.request.contextPath }/resources/img/farming-logo-w.png"
			               alt="Directory logo" style="width: 120px; padding: 2px; display:inline-block;">
			               <span style="font-size:16px;font-weight:400;padding-left:4px;color: white; font-weight: bold;">관리자모드</span>
                    </a>
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                        href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5" style="background:#FCFCFC">
                    
                    <ul class="navbar-nav me-auto mt-md-0 ">

                        <li class="nav-item hidden-sm-down">
                            <form class="app-search ps-3">
                                <input type="text" class="form-control" placeholder="Search for..."> <a
                                    class="srh-btn"><i class="ti-search"></i></a>
                            </form>
                        </li>
                    </ul>

                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active fas fa-user" href="#" id="docsDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#2CCE8D">
								<div class="dropdown-menu" aria-labelledby="docsDropdownMenuLink"></div>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/main'/>" aria-expanded="false"><i class="me-3 far fa-clock fa-fw"
                                    aria-hidden="true"></i><span class="hide-menu">메인</span></a></li>
                        
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/manage/mem_list'/>" aria-expanded="false">
                                <i class="me-3 fa fa-user" aria-hidden="true"></i><span
                                    class="hide-menu">회원조회</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/manage/dev_list'/>" aria-expanded="false">
                                <i class="me-3 fa fa-user-md" aria-hidden="true"></i><span
                                    class="hide-menu">전문가조회</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/category/list'/>" aria-expanded="false"><i class="me-3 fa fa-table"
                                    aria-hidden="true"></i><span class="hide-menu">카테고리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/notice/noticeList'/>" aria-expanded="false"><i class="me-3 fa fa-info-circle"
                                    aria-hidden="true"></i><span class="hide-menu">공지사항</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/pagesBlank'/>" aria-expanded="false"><i class="me-3 fa fa-columns"
                                    aria-hidden="true"></i><span class="hide-menu">견적서 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/iconFontawesome'/>" aria-expanded="false"><i class="me-3 fa fa-font"
                                    aria-hidden="true"></i><span class="hide-menu">Icon</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<c:url value='/admin/mapGoogle'/>" aria-expanded="false"><i class="me-3 fa fa-globe"
                                    aria-hidden="true"></i><span class="hide-menu">Google Map</span></a></li>
                        
                        
                       
                    </ul>

                </nav>
            </div>
        </aside>

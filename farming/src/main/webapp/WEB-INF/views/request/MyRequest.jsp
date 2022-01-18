<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<section class="py-6">
<div class="container">
  <div class="row px-xl-5">
  <div class="col-lg-0 position-relative">
	<div class="docs-item" id="imageoverlay">
	   <ol class="breadcrumb ps-0  justify-content-start">
	      <li class="breadcrumb-item"><a href="<c:url value='/index'/>">Home</a></li>
	      <li class="breadcrumb-item"><a href="<c:url value='/request/myRequest'/>">받은견적 목록</a></li>
	      <li class="breadcrumb-item active">받은 견적  </li>
	    </ol>
	   <h1 class="hero-heading mb-4">받은 견적</h1>
	   <div class="docs-desc"><p class="lead"></p></div>
	   <div class="mt-5">        
	     <div class="row">
	     <c:if test="${empty list }">
	     	<div class="list-group-item  p-4">
				<p class="m-auto col-lg-3 text-center mb-4 mb-lg-0">해당 분야에 받은 요청이 없습니다.</p>
			</div>
	     </c:if>
	     <c:if test="${!empty list }">
		   <c:forEach var="map" items="${list }">
		       <div class="col-lg-4">
		         <div class="card mb-5 border-0 text-white dark-overlay shadow-lg"><img class="card-img" src="${pageContext.request.contextPath }/resources/img/photo/introduce2.jpg" alt="">
		         	<a class="tile-link" href="<c:url value='/request/requestByExpert?requestNo=${map[\'REQUEST_NO\'] }'/>"> </a>
		           <div class="card-img-overlay d-flex align-items-center">
		             <div class="w-100 overlay-content">
		               <span class="position-absolute badge py-2 px-3 bg-primary" style="top:-70px;left:8px">${map['MAIN'] }</span>
		               <h6 class="position-absolute fw-normal" style="top:-65px;right:10px"><fmt:formatDate value="${map['SEND_TIME'] }" pattern="yyyy-MM-dd hh:mm:ss"/></h6>
		               <h2 class="text-center mb-0">${map['DETAIL'] }</h2>
		             </div>
		           </div>
		         </div>
		       </div>
	       </c:forEach>
	      </c:if>
	     </div>
	   </div>
	 </div>
   </div>
  </div>
 </div>
 </section>
<%@ include file="../inc/bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/expDetail.css">
<script type="text/javascript">
	$(function(){
		var avg=$('#rate').val();
		$('#starimg').css('width',avg*20+'%');
	})
</script>
<section class="py-5">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
          <div class="me-3">
            <p class="mb-3 mb-md-0">${keyword } 지역에는 <strong>${fn:length(expList) }</strong> 명의 전문가가 활동 중 입니다.</p>
          </div>
          <!-- <div>
            <label class="form-label me-2" for="form_sort">도시선택</label>
            <select class="selectpicker" name="sort" id="city" data-style="btn-selectpicker" title="">
              <option value="sortBy_0">서울   </option>
              <option value="sortBy_1">세종   </option>
              <option value="sortBy_2">강원   </option>
            </select>
          </div> -->
        </div>
	<div class="row">
	<c:if test="${empty expList }">
		<div class="col-sm-12 col-lg-12 mb-5">
			<p class="text-center">검색하신 지역에는 활동 중인 전문가가 없습니다.</p>
		</div>
	</c:if>   
          <!-- venue item-->
          <c:if test="${!empty expList }">				
			<c:forEach var="map" items="${expList }">
	          <div class="col-sm-6 col-lg-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
	            <div class="card h-100 border-0 shadow">
	              <div class="card-img-top overflow-hidden dark-overlay bg-cover" 
	              style="background-image: url(${pageContext.request.contextPath }/resources/img/photo/restaurant-1430931071372-38127bd472b8.jpg); min-height: 200px;">
	              <a class="tile-link" href="<c:url value='/findexp/expDetail?expertNo=${map[\'EXPERT_NO\']}'/>"></a>
	                <div class="card-img-overlay-bottom z-index-20">
	                  <h4 class="text-white text-shadow">${map['NAME'] }</h4>
	                  <p class="mb-2 text-xs">
	                  	<div id="starwrap">
	                  		<input id="rate" type="hidden" value="${map['RATE'] }">
							<div id="star"></div>
							<div id="starimg"></div>
						</div>
	                  </p>
	                </div>
	                <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
	                    <svg class="svg-icon text-white">
	                      <use xlink:href="#heart-1"> </use>
	                    </svg>
	                </div>
	              </div>
	              <div class="card-body">
	                <p class="text-sm text-muted mb-3">${map['INTRO'] }</p>
	                <p class="text-sm text-muted text-uppercase mb-1">위치 <a href="#" class="text-dark">${fn:substring(map['ADDRESS1'],0,6)}</a></p>
	                <p class="text-sm mb-0">${map['EMP_COUNT'] }회 고용</a>
	                </p>
	              </div>
	            </div>
	          </div>
            </c:forEach>
		  </c:if>

        <nav aria-label="Page navigation example">
          <ul class="pagination pagination-template d-flex justify-content-center">
          	<c:if test="${pagingInfo.firstPage>1 }">
	            <li class="page-item">
	            	<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
	            		<i class="fa fa-angle-left"></i>
	            	</a></li>
          	</c:if>
          	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
		            <li class="page-item active">
		            	<a class="page-link" href="#" onclick="pageFunc(${i})">i</a>
		            </li>
		    	</c:if>
			</c:forEach>        
            <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
            	<li class="page-item">
            		<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> 
            			<i class="fa fa-angle-right"></i>
            		</a>
            	</li>
            </c:if>
          </ul>
        </nav>
   </div>
    </section> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>

<section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="<c:url value='/index'/>">Home</a></li>
          <li class="breadcrumb-item active">받은 견적  </li>
        </ol>
        <h1 class="hero-heading mb-0">받은 견적</h1>
        <div class="row mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 ">
          <c:if test="${empty list }">
	          <div class="text-block">
	          	<p class="text-sm text-muted">받은 견적이 없습니다.</p>
	          </div>
          </c:if>
          <c:if test="${!empty list }">
          <div class="d-flex mt-5 mb-3">
	          <div class="me-3">
	            <p class="text-gray-700">회원님은 <strong>${fn:length(list) } 명의 전문가님께</strong> 견적요청을 받았습니다</p>
	          </div>
	        </div>
           <c:forEach var="map" items="${list }">
            <div class="text-block"> 
	         <a class="list-group-item list-group-item-action p-4" href="<c:url value='/request/finalRequest?requestNo=${map[\'REQUEST_NO\'] }'/>">
              <div class="row mb-3">
                <div class="col-sm-9">
                  <h5>${map['NAME'] }</h5>
                </div>
              </div>
              <p class="text-sm text-muted">
	              <i class="fa fa-id-card fa-fw me-2"></i>${map['EMP_COUNT'] }회 고용<br>
	              <i class=" fa fa-star fa-fw me-2"></i>${map['RATE'] }<br>
	              <i class="fas fa-won-sign fa-fw me-2"></i>${map['TYPE']}  <span class="mx-2"> | </span> 
	              <c:if test="${map['TYPE'] == '총 비용'}">
	               	총 <fmt:formatNumber value="${map['COST'] }" pattern="#,###"/> 원
	               	</c:if>
	              <c:if test="${map['TYPE'] == '시간 당'}">
	                시간당 <fmt:formatNumber value="${map['COST'] }" pattern="#,###"/> 원
	              </c:if>
              </p>
              </a>
             </div>
            </c:forEach>
            </c:if>
           </div>
           <div class="col-md-8 col-lg-4 ms-lg-auto">
            <div class="card border-0 shadow">
              <div class="card-header bg-success-light py-4 border-0">
                <div class="d-flex align-items-center">
                  <div>
                    <h4 class="h6 subtitle text-sm text-primary">채팅하기로 견적을 보낸 전문가와 채팅을 시작해보세요!</h4>
                  </div>
                  <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-primary flex-shrink-0">
                  	<use xlink:href="#identity-1"> </use>
                  </svg>
                </div>
              </div>
              <div class="card-body p-4">
                <p class="text-muted text-sm card-text">채팅하기에서 상세한 <strong>견적내용</strong>과 <strong>전문가의 정보</strong>를 확인하실 수 있습니다.</p>
                <p class="text-muted text-sm card-text">파밍은 서비스가 필요한 고객과 서비스를 제공하는 전문가를 쉽고 빠르게 연결해드리는 전문가 매칭 서비스입니다. 맘에 쏙 드는 전문가의 견적을 받았다면 채팅을 통해 서비스를 이용하실 수 있습니다.</p>
              </div>
              <div class="col-sm-0 text-center pt-3 pb-4">
                <button class="btn btn-outline-primary px-5" type="button" >내 요청서 보기</button>
              </div>
            </div>
          </div> 
          </div>
        <!-- Pagination -->
        <nav aria-label="Page navigation example">
          <ul class="divPage pagination pagination-template d-flex justify-content-center">
          <c:if test="${pagingInfo.firstPage>1 }">
            <li class="page-item">
            	<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
            	 	<i class="fa fa-angle-left"></i>
            	</a>
            </li>
           </c:if>
           <!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">
		  <c:if test="${i==pagingInfo.currentPage }">
            <li class="page-item active"><a class="page-link" href="#">${i }</a></li>
          </c:if>
          <c:if test="${i!=pagingInfo.currentPage }">	
            <li class="page-item">
            	<a class="page-link" href="#" onclick="pageFunc(${i})">${i }</a></li>
          </c:if>
        </c:forEach>
        <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
            <li class="page-item">
            	<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> 
            <i class="fa fa-angle-right"></i></a></li>
        </c:if>
          </ul>
        </nav>
      </div>
    </section>
<script>
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	$(function(){
		
		console.log('a값='+$('li.active a').text());
	});
	$(function(){	
		$('#detail').change(function(){
			$.ajax({
				url: "<c:url value='/request/requestByExpert'/>",
				type: "POST",
				data: {
					"detail" : $(this).val(),
				},
				success:function(data){
					document.write(data);
				}
			})
		});
	});
</script>
<%@ include file="../inc/bottom.jsp"%>
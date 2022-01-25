<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>

<section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <!-- 페이징 처리를 위한 form -->
		<form id="frmPage" method="post" action="<c:url value='/request/requestByExpert'/>">
			<input type="hidden" name="currentPage" >
		</form>
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="<c:url value='/index'/>">Home</a></li>
          <li class="breadcrumb-item"><a href="<c:url value='/request/myRequest'/>">받은견적 목록</a></li>
          <li class="breadcrumb-item active">받은 견적  </li>
        </ol>
        <h1 class="hero-heading mb-0">받은 견적</h1>
        <div class="row mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 ">
          <c:if test="${empty list }">
	          <div class="list-group mt-5">
	          	<div class="list-group-item p-4 py-5">
		            <p class="text-center text-gray-700 mb-0">받은 견적이 없습니다.</p>
	            </div>
	          </div>
          </c:if>
          <c:if test="${!empty list }">
          	<div class="d-flex mt-5 mb-3">
	          <div class="me-3">
	            <p class="text-gray-700"><strong>${fn:length(list) } 명의 전문가님께</strong> 견적요청을 받았습니다</p>
	          </div>
	        </div>
           <c:forEach var="map" items="${list }">
            <div class="list-group mb-4"> 
	         <a class="list-group-item list-group-item-action p-4" href="<c:url value='/chat/create?expertEmail=${map[\'EMAIL\'] }&finalRequestNo=${map[\'FINAL_REQUEST_NO\'] }'/>">
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
                <button class="btn btn-outline-primary px-5" type="button" data-bs-toggle="modal" 
                	data-bs-target="#myRequestModal">내 요청서 보기</button>
                <!-- Modal-->
                <div class="modal fade" id="myRequestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title text-uppercase" id="exampleModalLabel">내 요청서   </h5>
                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                      	<div class="text-block">
				          <c:if test="${developNo!=0 }">
				            <div class="row pb-2">
				              <div class="col">
				                <h6>어떤 플랫폼을 원하시나요?</h6>
				                <p class="text-muted">${map['PLATFORM'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>어떤 종류의 개발을 원하시나요?</h6>
				                <p class="text-muted">${map['TYPE'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>원하는 숙련도의 개발자가 있으신가요?</h6>
				                <p class="text-muted">${map['CAREER'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>기획은 어느정도 되어있나요?</h6>
				                <p class="text-muted">${map['STEP'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col ">
				                <h6>참고사항</h6>
				                <p class="text-muted">${map['REFERENCE'] }</p>
				                <c:if test="${map['REFERENCE']==null }">
					                <p class="text-muted">없음</p>
				                </c:if>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>언제까지 작업이 완료되어야 하나요?</h6>
				                <p class="text-muted">${map['DEADLINE'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>어떻게 진행하기 원하시나요?</h6>
				                <p class="text-muted">${map['WORKTYPE'] }</p>
				              </div>
				            </div>
				          </c:if>
				          <c:if test="${designNo!=0 }">
				            <div class="row pb-2">
				              <div class="col">
				                <h6>어떤 페이지 디자인이 필요하신가요?</h6>
				                <p class="text-muted">${map['TYPE'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>디자인 범위는 어떻게 되나요?</h6>
				                <p class="text-muted">${map['RANGE'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>원하는 숙련도의 개발자가 있으신가요?</h6>
				                <p class="text-muted">${map['CAREER'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>디자인이 필요한 페이지 수를 알려주세요.</h6>
				                <p class="text-muted">${map['SCALE'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col">
				                <h6>언제까지 작업이 완료되어야 하나요?</h6>
				                <p class="text-muted">${map['DEADLINE'] }</p>
				              </div>
				            </div>
				            <div class="row pb-2">
				              <div class="col ">
				                <h6>디자인 관련 희망사항을 알려주세요!</h6>
				                <p class="text-muted">${map['REFERENCE'] }</p>
				                <c:if test="${map['REFERENCE']==null }">
					                <p class="text-muted">없음</p>
				                </c:if>
				              </div>
				            </div>
			            </c:if>
			          </div>
                      </div>
                      <div class="modal-footer justify-content-end bg-gray-100">
                        <!-- <button class="btn btn-primary" type="button">Save changes</button> -->
                        <button class="btn btn-outline-muted" type="button" data-bs-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div> 
          </div>
      </div>
    </section>
<script>
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>
<%@ include file="../inc/bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/request.css">
<div class="container-fluid">               
      <div class="row">
        <div class="col-lg-4 col-xl-3 px-4 py-5 ps-xl-5 pe-xl-5">
          <div class="text-block">
	          <div class="d-flex align-items-center justify-content-between mb-3">
	          <div>
	            <h3>${map['NAME'] }</h3>
	            <p class="text-muted mb-0">${map['SEND_TIME'] }</p>
	           </div>
	            <img class="avatar avatar-lg p-1 flex-shrink-0 ms-4" src="${pageContext.request.contextPath }/resources/userImg/${map['FILENAME'] }" alt="profile">
            </div>
          </div>
          <div class="text-block">
            <div class="row">
              <div class="col-sm">
                <h6>지역</h6>
                <p class="text-muted">${map['LOCATION1'] } ${map['LOCATION2'] }</p>
              </div>
              <div class="col-sm">
                <h6>분야</h6>
                <p class="text-muted">${map['DETAIL'] }</p>
              </div>
            </div>
          </div>
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
          <div class="text-block d-print-none">
            <button class="btn btn-link ps-0" onclick="window.print()"><i class="fa fa-print me-2"></i>Print </button>
          </div>
        </div>
        <div class="col-lg-8 col-xl-9 py-5 map-side-lg">
          <div class="col-lg-8 col-xl-5 m-auto map-full shadow-left" id="detailSideMap">
          	<form name="frmFinal" method="post" enctype="multipart/form-data" 
          	action="<c:url value='/request/finalRequest'/>">
          		<input type="hidden" name="categoryNo" value="${map['CATEGORY_NO'] }">
		        <input type="hidden" name="memberNo" value="${map['MEMBER_NO'] }">
		        <input type="hidden" name="requestNo" value="${map['REQUEST_NO'] }">
          		<h1 class="h2 mb-4">견적보내기</h1>
          		<div class="col-xl-4 col-md-6 mb-4 ">
	          		<fieldset class="input-price-group">
		          		<div class="input-group" role="group">
	          				<input type="tel" name="cost" placeholder="0" autocomplete="off" 
	          				maxlength="11" class="input-price form-control">
			          		<hr class="input-validate-border">
		          			<div class="input-group-append">
		          				<div class="input-group-text">원</div>
		          			</div>
		          		</div>
	          		</fieldset>
	          		<div class="dropdown bootstrap-select show-tick form-control">
		          		<select name="type" class="selectpicker form-control" data-style="btn-selectpicker">
		          			<option value="총 비용">총 비용</option>
		          			<option value="시간 당">시간 당</option>
		          		</select>
	          		</div>
          		</div>
          		<div>
          			<h6 class="form-check-inline">견적 설명</h6><span class="form-check-inline text-muted small" style="float:right">0/1000자</span>
          			<textarea name="explain" class="form-control" rows="7"  placeholder="요청사항에 대한 답변, 서비스 진행방식, 고수님만의 강점이나 특징 등을 작성하세요."></textarea>
          		</div>
          		<div class="py-3 mb-3">
          			<h6>파일 첨부</h6>
          			<label class="file-uploader" style="width: 80px; height: 80px;">
	            		<input class="file-uploader-input" type="file" name="upfile" id="upfile" mutiple>
	           			<span class="slot-content"></span>
	           		</label>
          		</div>
          		<div class="d-grid mb-4">
          			<button class="btn btn-primary btn-lg">견적 보내기</button>
          		</div>
          	</form>
          </div>
        </div>
      </div>
    </div>
<%@ include file="../inc/bottom.jsp"%>
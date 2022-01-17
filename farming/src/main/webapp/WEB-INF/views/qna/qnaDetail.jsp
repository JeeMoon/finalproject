<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mystyle.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<style type="text/css">
	body{
		padding-top: 70px;
		padding-bottom: 30px;
	 }
	.divForm {
		width: 500px;
		}

</style>  

<script type="text/javascript">
	$(function(){
		$('form[name=write]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을(를) 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});
	});
</script>


<body style="padding-top: 72px;">
    
    <!-- Hero Section-->
    <section class="pt-7 pb-5 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('<c:url value='/resources/img/photo-1522143049013-2519756a52d4.jpg'/>');">
      <div class="container overlay-content">
      <ol class="breadcrumb ps-0  justify-content-center">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item"><a href="<c:url value='/qna/qnaMain'/>">메인</a></li>
          <li class="breadcrumb-item active">1 : 1 문의게시판</li>
        </ol>
        <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
          <div class="text-white mb-4 mb-lg-0">
            <div class="badge badge-pill badge-transparent px-3 py-2 mb-4">Q n A</div>
            <h1 class="text-shadow verified">질문 게시판</h1>
          </div>
        </div>
      </div>
    </section><br>
    <article>
		<div class="container" role="main" >
    		<h2 class="text-shadow verified" style="margin-left:40%;">나의 1 : 1 질문 내역</h2><br>
		
			<div class="bg-white rounded shadow-sm" style="width:1200px; margin-left:5%;">
				<label for="exampleFormControlInput1" class="form-label">[문의글 제목] : </label>
				<span> ${vo.title}</span> 
			
		<div>
			<label for="exampleFormControlInput1" class="form-label">[등록 날짜] : </label> 
			<span>${vo.regdate}</span>
		</div>
		
		<% pageContext.setAttribute("newLine", "\r\n"); %>
		
		<div class="lastDiv">	
			<label for="exampleFormControlInput1" class="form-label">[문의 내용]</label>		
			<p class="content" style="padding:1%">${fn:replace(vo.content, newLine, "<br>")}</p>
		</div><br>
		
		
	</div><br>
	<div class="center" style="margin-left:35%;">
			<a class="btn btn-primary" href='<c:url value="/qna/qnaEdit?qnaNo=${param.qnaNo }"/>'>게시글 수정</a>&nbsp;&nbsp;
        	<a class="btn btn-primary" href='<c:url value="/qna/qnaDelete?qnaNo=${param.qnaNo }"/>'>게시글 삭제</a>&nbsp;&nbsp;
        	<a class="btn btn-primary" href='<c:url value="/qna/qnaList"/>'>게시글 목록</a>			
		</div><br>
		<section>
		<div class="bg-white rounded shadow-sm" style="margin-left:5%; padding:1%; width:1200px;">
		<form name="write" method="post" enctype="multipart/form-data"
			action="<c:url value='/qna/qnaDetailQComment'/>" >
			<input type="hidden" name="memberNo" id="memberNo" value="${userNo }">
		 	<input type="hidden" name="qnaNo" value="${param.qnaNo }">
		 <fieldset>
		 	<label for="exampleFormControlInput1" class="form-label">[댓글 입력]</label>
		          <label for="name">작성자&nbsp;&nbsp;</label><input type="text" id="name" name="name" value="${name }" readonly="readonly" /><br>
		        <div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingInput" name="content" placeholder="내용입력" style="width:700px;">
				  <label for="content">댓글 입력</label><br>
				  <input type = "submit" class="btn btn-primary" value="등록하기"/>
				</div>
		</fieldset>
		</form>
		</div>
		</section><br>
		<c:if test="${!empty list }">
		<!-- 댓글 -->
		  		
		  <c:forEach var="map" items="${list }">
		  <div id="qcommentList" class="bg-white rounded shadow-sm" style="width:1200px; margin-left:5%;">
		  		<div class="input-group">
				  <span class="input-group-text">${map['NAME']}</span>
				  <span aria-label="First name" class="form-control" style="width:900px;">${map['CONTENT']}</span>
				  <span aria-label="Last name" class="form-control">
				  	<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
				  </span>
				</div>
		       
			</div><br>
		      </c:forEach>
		
		</c:if>
		
		
	</article>
    
<%@ include file="../inc/bottom.jsp" %>  
    
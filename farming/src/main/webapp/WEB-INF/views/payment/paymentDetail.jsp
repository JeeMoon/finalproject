<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
	input[type=checkbox]:checked + label { 
		background: #2CCE8D;
		color: white;
		border: 1px solid #dddddd;
		border-radius: 10px;
	}
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <section class="py-5 p-print-0">
      <div class="container">
        <div class="row mb-4 d-print-none">
          <div class="col-lg-6">
            <!-- Breadcrumbs -->
            <ol class="breadcrumb ps-0  justify-content-start">
              <li class="breadcrumb-item"><a href="index.html">${categoryVo.main }</a></li>
              <li class="breadcrumb-item"><a href="user-account.html">${categoryVo.detail }</a></li>
              <li class="breadcrumb-item active">결제하기</li>
            </ol>
          </div>
          <div class="col-lg-6 text-lg-end">
            <button class="btn btn-primary me-2"><i class="far fa-file-pdf me-2"></i> Download PDF</button>
            <button class="btn" onclick="window.print()"><i class="fas fa-print me-2"></i> Print</button>
          </div>
        </div>
        <div class="card border-0 shadow shadow-print-0">
          <div class="card-header bg-gray-100 p-5 border-0 px-print-0">
            <div class="row">
              <div class="col-6 d-flex align-items-center"><img src="${pageContext.request.contextPath }/resources/img/farming-favicon.png" alt="Directory"></div>
              <div class="col-6 text-end">
                <h3 class="mb-0">서비스 결제 ${rVo.finalRequestNo }</h3>
                <p class="mb-0">${today } </p>
              </div>
            </div>
          </div>
          <div class="card-body p-5 p-print-0">
            <div class="row mb-4">
              <div class="col-sm-6 pe-lg-3">
                <h2 class="h6 text-uppercase mb-4">Supplier</h2>
                <h6 class="mb-1">${expVo.name }</h6>
                <p class="text-muted">${expVo.email }<br>${expInfoVo.empCount }회 고용<br>평점 ${expInfoVo.rate }<br></p>
              </div>
              <div class="col-sm-6 ps-lg-4">
                <h2 class="h6 text-uppercase mb-4">Customer</h2>
                <h6 class="mb-1">${name }</h6>
                <p class="text-muted">${email }<br></p>
              </div>
            </div>
            <div class="row mb-5">
              <div class="col-md-6 pe-lg-3 text-sm">
                <div class="row">
                  <div class="col-6 text-uppercase text-muted">Bank account</div>
                  <div class="col-6 text-end">${expVo.email }</div>
                </div>
                <div class="row">
                  <div class="col-6 text-uppercase text-muted">Reference</div>
                  <div class="col-6 text-end"><fmt:formatDate value="${rVo.sendTime }" pattern="yyyy-MM-dd"/></div>
                </div>
                <div class="row">
                  <div class="col-6 text-uppercase text-muted">Payment method</div>
                  <div class="col-6 text-end">${expInfoVo.payMethod }</div>
                </div>
              </div>
              <div class="col-md-6 ps-lg-4 text-sm">
                <div class="row">
                  <div class="col-6 text-uppercase text-muted">Issued on</div>
                  <div class="col-6 text-end">${today }</div>
                </div>
                <div class="row">
                  <div class="col-6 text-uppercase text-muted">Due on</div>
                  <div class="col-6 text-end">${today}</div>
                </div>
              </div>
            </div>
            <div class="table-responsive text-sm mb-5">
              <table class="table table-striped">
                <thead class="bg-gray-200">
                  <tr class="border-0">
                    <th class="center"></th>
                    <th>서비스명</th>
                    <th class="text-end">견적발송일</th>
                    <th class="text-end">견적금액</th>
                    <th class="text-end">할인금액</th>
                    <th class="text-end">최종금액</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">1</td>
                    <td class="fw-bold">${categoryVo.main } ${categoryVo.detail }-${expVo.name }</td>
                    <td class="text-end"><fmt:formatDate value="${rVo.sendTime }" pattern="yyyy년 MM월 dd일"/></td>
                    <td class="text-end"><fmt:formatNumber value="${rVo.cost }" pattern="#,###"/> 원</td>
                    <td class="text-end">-</td>
                    <td class="text-end"><fmt:formatNumber value="${rVo.cost }" pattern="#,###"/> 원</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="row">
              <div class="col-sm-7 col-lg-5 col-xl-4 ms-auto">
                <table class="table">
                  <tbody>
                    <tr class="text-sm">
                      <td class="fw-bold">최종 금액</td>
                      <td class="text-end"><fmt:formatNumber value="${rVo.cost }" pattern="#,###"/> 원</td>
                    </tr>
                    <tr class="text-sm">
                      <td class="fw-bold">파밍페이</td>
                      <td class="text-end">
                      	<input style="text-align: right;" type="text" value="${cVo.balance }" id="pay">원
                      </td>
                    </tr>
                    <tr class="text-sm">
                    	<td>
                    		<div class="col-lg-4 d-grid" style="margin: 0 auto; width:60px; border: 1px solid #dddddd; border-radius: 10px; text-align: center;">
	                    		<input type="checkbox" value="Y" name="chk" id="chk" style=" display: none ">
	                    		<label for="chk" style="font-size: 12px;" class="form-control">적용</label>
                    		</div>
                    	</td>
                    	<td class="text-end"><span class="text-warning" id="str" style="font-size: 12px;">사용가능합니다.</span></td>
                    </tr>
                    <tr>
                      <td class="text-uppercase fw-bold">Total</td>
                      <td class="text-end fw-bold" id="price">
                      	<input type="hidden" value="100" name="total" id="total">
                      </td>
                     
                    </tr>
                  </tbody>
                </table>
                <div style="text-align: right;"><button class="btn btn-primary" onclick="iamport()" id="complete">결제하기</button></div>
              </div>
            </div>
          </div>
          <div class="card-footer bg-gray-100 p-5 px-print-0 border-0 text-end text-sm">
            <p class="mb-0">Thank you for you business.</p>
          </div>
        </div>
      </div>
    </section>

<script type="text/javascript">
function iamport(){
	let IMP = window.IMP;
	IMP.init('imp80823636');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : '상품이름' , //결제창에서 보여질 이름
	    amount : $('#price').text(), //실제 결제되는 가격
	    buyer_email : '${mVo.email}',
	    buyer_name : '${mVo.name}',
	    buyer_addr : '${mVo.address1}',
	    buyer_postcode : '${mVo.zipCode}'
	}, function(rsp){
		if(rsp.success){//결제 성공시
			$.ajax({
				url : "<c:url value='/payment/complete'/>",
		        type :'POST',
		        data : {"merchantUid" : rsp.merchant_uid,
		        		"memberNo" : '${mVo.memberNo}',
		        		"memberName" : '${mVo.name}',
		        		"price" : rsp.paid_amount,
		        		"state" : "결제완료",
		        		"chk" : $('#chk').val(),
		        		"pay" : $('#pay').val()},
		        success: function(res){
		        	if(res > 0){
						alert("추가성공");			           
		        	}else{
		            	alert("Insert Fail!!!");
		        	}
		        },
		        error : function( request, status, error) {
	       			console.log("code : "+request.status+"\n"+"message : "+request.responseText);
	       		}
			});
		}
		else{//결제 실패시
			var msg = '결제에 실패했습니다';
			msg += '에러 : ' + rsp.error_msg
		}
		console.log(msg);
		$(opener.document).find('#credit').text('결제완료');
		//self.close();
	});//pay
}
$(function(){
	$('#pay').keyup(function(){
		var pay = $('#pay').val();
		$.ajax({
			url:"<c:url value='/payment/checkPay'/>",
			type:"post",
			data:{"pay" : pay, "memNo" : ${mVo.memberNo}},
			success:function(data){
				var str = "";
				if(data){
					str="사용가능합니다.";
					$('#str').text(str);
				} else{
					str="잔여 파밍페이를 초과하였습니다.";
					$('#str').text(str);
				}
			}
		})
	});
	
	$('#chk').click(function(){
		var chk = $('#chk').val();
		var total = $('#total').val();
		var pay = $('#pay').val();
		$.ajax({
			url:"<c:url value='/payment/chk'/>",
			type:"post",
			data:{"chk" : chk, "total" : total, "pay" : pay},
			success:function(data){
				var str = 0;
				if(data){
					str=total-pay;
					$('#total').val(str);
					$('#price').text(str);
				} else{
					str=total;
					$('#total').val(str);
					$('#price').text(str);
				}
			}
		})
	})
});
</script>

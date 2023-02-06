<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function setPayMethod(){
		
		var method = $("[name='payMethod']").val();
		if (method == 'card') {
			$("#cardPayMonth,#cardCompanyNm").show();
			$("#payOrdererHp").hide();
		}
		else {
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").show();
			$("[name='payOrdererHp']").val("${orderer.hp }");
		}
		
	}
</script>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath }/">Home</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <form action="${contextPath }/order/orderGoods" method="post" class="checkout__form">
                <input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
                <input type="hidden" name="orderGoodsQty" value="${orderGoodsQty}">
                <input type="hidden" name="memberId" value="${orderer.memberId}">
                <input type="hidden" name="point" value="${goodsDto.point * orderGoodsQty}">
                <input type="hidden" name="sizeStock" value="${sizeStock}">
                <div class="row">
                   <div class="col-lg-8 col-md-6">
                       <h6 class="checkout__title">내 주문</h6>
                       <div class="row">
                           <div class="col-lg-6">
                               <div class="checkout__input">
                                   <p>주문자 성함<span>*</span></p>
                                   <input type="text" name="ordererNm" value="${orderer.memberNm }">
                               </div>
                           </div>
                       </div>
                       <div class="checkout__input">
                           <p>주문자 연락처<span>*</span></p>
                           <input type="text" name="ordererHp" value="${orderer.hp }">
                       </div>
                       <div class="checkout__input">
                           <p>선물 포장<span>*</span></p>
                           <input type="radio" id="giftWrapping" name="giftWrapping" value="yes"> 예&emsp;&emsp;
                           <input type="radio" id="giftWrapping" name="giftWrapping" checked value="no"> 아니요
                       </div>
                       <div class="checkout__input">
	                           <p>배송방법<span>*</span></p>
	                           <input type="radio" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
						   	   <input type="radio" name="deliveryMethod" value="편의점택배"> 편의점택배 &emsp;
							   <input type="radio" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
                       </div>
                       <div class="checkout__order__widget">
                           <p>결제 방법<span>*</span></p>
                           <select name="payMethod" onchange="setPayMethod()">
	                           	<option value="card">카드 결제</option>
	                           	<option value="phone">휴대폰 결제</option>
                           </select>
                       </div>
                       <div class="checkout__input">
                           <div id="cardCompanyNm">
                                <div class="checkout__input">
                                    <p>카드회사 <span>*</span></p>
	                                <select name="cardCompanyNm">
										<option value="삼성">삼성</option>
										<option value="하나SK">하나SK</option>
										<option value="현대">현대</option>
										<option value="우리">우리</option>
										<option value="신한">신한</option>
										<option value="KB">KB</option>
										<option value="롯데">롯데</option>
										<option value="BC">BC</option>
										<option value="시티">시티</option>
										<option value="NH농협">NH농협</option>
								   </select>
                                </div>
                            </div>
                       </div>
                       <div class="row">
                           <div id="cardPayMonth" class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>할부개월 <span>*</span></p>
                                    <select name="cardPayMonth">
										<option value="0">일시불</option>                                    
										<option value="1">1개월</option>                                    
										<option value="2">2개월</option>                                    
										<option value="3">3개월</option>                                    
										<option value="4">4개월</option>                                    
										<option value="5">5개월</option>                                    
										<option value="6">6개월</option>                                    
                                    </select>
                                </div>
                            </div>
                       </div>
                       <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
                           <div class="checkout__input">
                               <p>결제 휴대폰 번호 <span>*</span></p>
                               <input type="text" name="payOrdererHp">
                           </div>
                       </div>
                       <div class="checkout__input">
                           <p>배송 메세지<span>*</span></p>
                           <input type="text" name="deliveryMessage" placeholder="배송메세지를 입력하세요.">
                       </div>
                       <div class="col-lg-12">
                           <div class="checkout__input">
                               <p>우편번호 <span>*</span></p>
                               <input type="text" id="zipcode" name="zipcode" value="${orderer.zipcode }" style="width: 10%;">
                               <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 7%; padding-left: 0">
                           </div>
                           <div class="checkout__input">
                               <p>도로명 주소 <span>*</span></p>
                               <input type="text" id="roadAddress" name="roadAddress" value="${orderer.roadAddress }">
                           </div>
                           <div class="checkout__input">
                               <p>지번 주소 <span>*</span></p>
                               <input type="text" id="jibunAddress" name="jibunAddress" value="${orderer.jibunAddress }">
                           </div>
                           <div class="checkout__input">
                               <p>나머지 주소 <span>*</span></p>
                               <input type="text" id="namujiAddress" name="namujiAddress" value="${orderer.namujiAddress }">
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-4 col-md-6">
                       <div class="checkout__order">
                           <h4 class="order__title">내 주문목록</h4>
                           <div class="checkout__order__products">Product <span>Total</span></div>
                           <ul class="checkout__total__products">
                               <li>01. ${goodsDto.goodsNm } , ${sizeStock}<span>${orderGoodsQty }개</span></li>
                               <li>상품 금액 <span><fmt:formatNumber value="${(goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100)) * (orderGoodsQty)}"/>원</span></li>
                           </ul>
                           <ul class="checkout__total__all">
                               <li>배송비 <span><fmt:formatNumber value="${goodsDto.deliveryPrice}"/>원</span></li>
                               <li>포인트 <span><fmt:formatNumber value="${goodsDto.point * (orderGoodsQty)}"/>P 적립</span></li>
                           	   <c:set var="paymentAmt" value="${(goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100)) * (orderGoodsQty) + goodsDto.deliveryPrice}"/>
                           	   <li>합계 <span><fmt:formatNumber value="${paymentAmt }"/>원</span></li>
                           </ul>
                           <input type="hidden" name="paymentAmt" value='<fmt:parseNumber integerOnly="true" value="${paymentAmt }"/>'/>
                           <button type="submit" class="site-btn"> 주문하기</button>
                       </div>
                   </div>
               </div>
           </form>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>
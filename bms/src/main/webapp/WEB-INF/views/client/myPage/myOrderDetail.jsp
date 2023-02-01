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

	$().ready(function(){
		
		$("[name='cardCompanyNm']").val("${myOrder.cardCompanyNm}");
		$("[name='payMethod']").val("${myOrder.payMethod}");
		$("[name='cardPayMonth']").val("${myOrder.cardPayMonth}");
		$("[name='deliveryStatus']").val("${myOrder.deliveryStatus}");
		
		$("[name='giftWrapping']").each(function(){
			if ($(this).val() == "${myOrder.giftWrapping}"){
				$(this).prop("checked", true);
			}
		})
		$("[name='deliveryMethod']").each(function(){
			if ($(this).val() == "${myOrder.deliveryMethod}"){
				$(this).prop("checked", true);
			}
		})
		
		
	});

</script>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>My Order Detail</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath }/">Home</a>
                            <a href="${contextPath }/myPage/myOrderList?memberId=${sessionScope.memberId}">My OrderList</a>
                            <span>My Order Detail</span>
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
                           <input type="text" name="payMethod" value="${myOrder.payMethod }" disabled>
                       </div>
                       <div class="checkout__input">
                           <div id="cardCompanyNm">
                                <div class="checkout__input">
                                    <p>카드회사 <span>*</span></p>
	                                <input type="text" name="cardCompanyNm" value="${myOrder.cardCompanyNm }" disabled>
                                </div>
                            </div>
                       </div>
                       <div class="row">
                           <div id="cardPayMonth" class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
                                    <p>할부개월 <span>*</span></p>
                                    <c:choose>
                                    	<c:when test="${myOrder.cardPayMonth == 0}">
                                    		<input type="text" name="cardPayMonth" value="일시불" disabled>
                                    	</c:when>
                                    	<c:otherwise>
		                                    <input type="text" name="cardPayMonth" value="${myOrder.cardPayMonth }개월" disabled>
                                    	</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                       </div>
                       <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
                           <div class="checkout__input">
                               <p>결제 휴대폰 번호 <span>*</span></p>
                               <input type="text" name="payOrdererHp" value="${myOrder.ordererHp }" disabled>
                           </div>
                       </div>
                       <div class="checkout__input">
                           <p>배송 메세지<span>*</span></p>
                           <input type="text" name="deliveryMessage" value="${myOrder.deliveryMessage }" disabled>
                       </div>
                       <div class="col-lg-12">
                           <div class="checkout__input">
                               <p>우편번호 <span>*</span></p>
                               <input type="text" id="zipcode" name="zipcode" value="${orderer.zipcode }" style="width: 10%;" disabled>
                               <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 7%; padding-left: 0" disabled>
                           </div>
                           <div class="checkout__input">
                               <p>도로명 주소 <span>*</span></p>
                               <input type="text" id="roadAddress" name="roadAddress" value="${orderer.roadAddress }" disabled>
                           </div>
                           <div class="checkout__input">
                               <p>지번 주소 <span>*</span></p>
                               <input type="text" id="jibunAddress" name="jibunAddress" value="${orderer.jibunAddress }" disabled>
                           </div>
                           <div class="checkout__input">
                               <p>나머지 주소 <span>*</span></p>
                               <input type="text" id="namujiAddress" name="namujiAddress" value="${orderer.namujiAddress }" disabled>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-4 col-md-6">
                       <div class="checkout__order">
                           <h4 class="order__title">내 주문목록</h4>
                           <div class="checkout__order__products">Product <span>Total</span></div>
                           <ul class="checkout__total__products">
                               <li>01. ${myOrder.goodsNm } , ${(xsOrderGoodsQty+smOrderGoodsQty+mdOrderGoodsQty+lgOrderGoodsQty+xlOrderGoodsQty)} 개 <span><fmt:formatNumber value="${myOrder.price - myOrder.price * myOrder.discountRate / 100 + myOrder.deliveryPrice}"/> </span></span></li>
                               <li>상품 금액 <span><fmt:formatNumber value="${(myOrder.price - (myOrder.price * myOrder.discountRate / 100)) * (xsOrderGoodsQty+smOrderGoodsQty+mdOrderGoodsQty+lgOrderGoodsQty+xlOrderGoodsQty)}"/>원</span></li>
                           </ul>
                           <ul class="checkout__total__all">
                               <li>배송비 <span><fmt:formatNumber value="${myOrder.deliveryPrice}"/>원</span></li>
                               <li>포인트 <span><fmt:formatNumber value="${myOrder.point * (xsOrderGoodsQty+smOrderGoodsQty+mdOrderGoodsQty+lgOrderGoodsQty+xlOrderGoodsQty)}"/>P 적립</span></li>
                           	   <li>합계 <span><fmt:formatNumber value="${myOrder.price - myOrder.price * myOrder.discountRate / 100 + myOrder.deliveryPrice}"/>원</span></li>
                           </ul>
                       </div>
                   </div>
               </div>
           </form>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>
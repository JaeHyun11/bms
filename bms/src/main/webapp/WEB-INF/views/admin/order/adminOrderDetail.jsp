<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <form action="${contextPath }/order/orderGoods" method="post" class="checkout__form">
                <div class="row">
                   <div class="col-lg-8 col-md-6">
                       <h6 class="checkout__title">주문 상세</h6>
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
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__input">
                               <p>배송주소 <span>*</span></p>
                               <input type="text" name="deliveryAddres" value="${order.zipcode }" disabled>
                               <input type="text" name="deliveryAddres" value="${order.roadAddress }" disabled>
                               <input type="text" name="deliveryAddres" value="${order.jibunAddress }" disabled>
                               <input type="text" name="deliveryAddres" value="${order.namujiAddress }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__input">
                               <p>배송방법 <span>*</span></p>
                               <input type="text" name="deliveryMethod" value="${order.deliveryMethod }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__form__input">
                               <p>배송메세지 <span>*</span></p>
                               <input type="text" name="deliveryMessage" value="${order.deliveryMessage }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__form__input">
                               <p>포장여부 <span>*</span></p>
                               <input type="text" name="giftWrapping" value="${order.giftWrapping }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__form__input">
                               <p>지불방법 <span>*</span></p>
                               <input type="text" name="payMethod" value="${order.payMethod }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__form__input">
                               <p>구매자연락처 <span>*</span></p>
                               <input type="text" name="payOrdererHp" value="${order.payOrdererHp }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__form__input">
                               <p>카드회사 <span>*</span></p>
                               <input type="text" name="cardCompanyNm" value="${order.cardCompanyNm }" disabled>
                           </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6">
                           <div class="checkout__form__input">
                               <p>할부개월 <span>*</span></p>
                               <input type="text" name="cardPayMonth" value="${order.cardPayMonth }" disabled>
                           </div>
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
                   
               </div>
           </form>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>
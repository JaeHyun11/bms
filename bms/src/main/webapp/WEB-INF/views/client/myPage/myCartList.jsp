<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	$().ready(function(){
		
		getTotalPrice();
		
		$("[name='cartCd']").change(function(){
			getTotalPrice();
		});
		
	});
	
	
	function getTotalPrice () {
		var totalPrice = 0;
		$("[name='cartCd']:checked").each(function(){
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#cartGoodsQty" + tempCartCd).val());
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	}
	
	
	function removeCart() {
			
		var cartCdList = "";
		if (confirm("제품을 삭제하시겠습니까?")) {
			
			$("[name='cartCd']").each(function(){
				cartCdList = $(this).val();
			});
			location.href = "${contextPath}/myPage/removeCart?cartCdList=" + cartCdList;
		}
		
	}
	
	function removeAllCart() {
		
		var cartCdList = "";
		if (confirm("장바구니를 비우시겠습니까?")) {
			
			$("input[name='cartCd']:checked").each(function(){
				cartCdList += $(this).val() + ",";
			});
			location.href = "${contextPath}/myPage/removeCart?cartCdList=" + cartCdList;
		}
		
	}
	
	function modifyCartGoodsQty(cartCd){
		$.ajax({
			type : "get",
			url : "${contextPath}/myPage/modifyCartGoodsQty",
			data : {
				"cartCd"   : cartCd,
				"cartGoodsQty" : $("#cartGoodsQty" + cartCd).val()
			},
			success:function(){
				getTotalPrice();
			}
		});
		
	}
	
	
	function processOrderCart() {
	
		var goodsCdList = "";
		var cartGoodsQtyList = "";
		var cartCdList = ""
		
		$("[name='cartCd']:checked").each(function(){
			
			var cartCd = $(this).val();
			var goodsCd =  $("#goodsCd" + cartCd).val();
			var cartGoodsQty = $("#cartGoodsQty" + cartCd).val();
			
			goodsCdList += goodsCd + ",";
			cartGoodsQtyList += cartGoodsQty +",";
			cartCdList += cartCd + ",";
			
		});
		
		if (goodsCdList == "") {
			alert("주문 목록이 없습니다.");
			return false;
		}
		
		var url = "${contextPath}/order/orderCartGoods";
		    url += "?goodsCdList=" + goodsCdList;
		    url += "&cartGoodsQtyList=" + cartGoodsQtyList;
		    url += "&cartCdList=" + cartCdList;
		
		location.href = url;
		
		
	}
	
	
	function selectAllCart() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='cartCd']").prop("checked" , true);
		}
		else {
			$("[name='cartCd']").prop("checked" , false);
		}
		getTotalPrice();
	}	
	

</script>
</head>
<body>
	
	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>
	
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath }/">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>상품명</th>
                                    <th>주문수량</th>
                                    <th>상품가격</th>
                                    <th>삭제</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myCartList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
                            			<c:forEach var="myCart" items="${myCartList }">
			                                <td><input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked></td>
			                                <tr>
			                                    <td class="product__cart__item">
			                                        <div class="product__cart__item__pic">
			                                            <img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="50" height="50">
			                                        </div>
			                                        <div class="product__cart__item__text">
			                                            <a href="${contextPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}">${myCart.goodsNm }</a>
			                                            <input type="hidden" id="goodsCd${myCart.cartCd }" value="${myCart.goodsCd }"/>
			                                        	<p>${myCart.goodsGroup } / ${myCart.goodsCategory } / ${myCart.sizeStock } </p>
			                                        </div>
			                                    </td>
			                                    <td class="quantity__item">
			                                        <div class="quantity">
			                                            <div class="pro-qty-2" onmouseleave="modifyCartGoodsQty(${myCart.cartCd })">
			                                   				<input type="text" id="cartGoodsQty${myCart.cartCd }" value="${myCart.cartGoodsQty }" />
			                                            </div>
			                                        </div>
			                                    </td>
			                                    <td class="cart__price">
			                                    	<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/></span>
			                                    	<fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}"/>
			                                    	<input type="hidden" id="price${myCart.cartCd }" value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}">
			                                    </td>
			                                    <td class="cart__close">
				                                	<div>
				                                		<a href="javascript:removeCart();"><i class="fa fa-close"></i></a>
				                                    </div>
			                                    </td>
			                                </tr>
		                                </c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="javascript:removeAllCart();"> 장바구니 비우기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>장바구니 합계</h6>
                        <ul>
                            <li>Total <span id="totalPrice"></span></li>
                        </ul>
                        <a href="javascript:processOrderCart()" class="primary-btn"> 주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
	
</body>
</html>
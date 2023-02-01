<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                        <div class="breadcrumb__links">
                            <a href="${contextPath}/">Home</a>
							<span>My OrderList</span>
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
                <div class="col-lg-12">
                    <div class="shopping__cart__table" align="right">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>상품명</th>
                                    <th>상품가격</th>
                                    <th>주문날짜</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myOrderList }">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>조회된 상품이 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
                            			<c:forEach var="myOrder" items="${myOrderList }" varStatus="i">
			                                <tr>
			                                	<td class="product__cart__item" align="center">
			                                    	<h6>${myOrder.orderCd }</h6>
			                                    </td>
			                                    <td class="product__cart__item">
		                                            <img src="${contextPath }/thumbnails?goodsFileName=${myOrder.goodsFileName }" width="100" height="100">
			                                        <div class="product__cart__item__title">
			                                        	<h6><a href="${contextPath }/myPage/myOrderDetail?orderCd=${myOrder.orderCd}&memberId=${myOrder.memberId}">${myOrder.goodsNm } / ${myOrder.orderGoodsQty }개</a></h6>
			                                        </div>
												</td>
			                                    <td class="cart__price"><fmt:formatNumber value="${myOrder.price }"/>원</td>
			                                	<td class="cart__total"><fmt:formatDate value="${myOrder.payOrderTime }" pattern="yyyy-MM-dd"/> </td>
			                               		<td class="cart__close">
			                                	</td>
			                                </tr>
                                    	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
</body>
</html>
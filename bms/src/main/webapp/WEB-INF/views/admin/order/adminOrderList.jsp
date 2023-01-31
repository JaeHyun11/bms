<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function gerateOrderExcelExport() {
		location.href = "${contextPath}/admin/order/orderExcelExport";
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
                        <div class="breadcrumb__links">
                            <a href="${contextPath }/">Admin</a>
                            <span>Order List</span>
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
                	<div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateOrderExcelExport();"><span class="icon_folder_download"></span>Excel</a>
					</div>
                    <div class="shopping__cart__table" align="right">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문정보</th>
                                    <th>주문자</th>
                                    <th>주문일자</th>
                                    <th>배송상태</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty orderList}">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>주문내역이 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
                            			<c:forEach var="order" items="${orderList }" varStatus="i">
			                                <tr>
			                                    <td class="product__cart__item" align="center">
			                                    	<h6>${order.orderCd }</h6>
			                                    </td>
			                                    <td class="product__cart__item">
		                                            <img src="${contextPath }/thumbnails?goodsFileName=${order.goodsFileName }" width="100" height="100">
			                                        <div class="product__cart__item__title">
			                                        	<a href="${contextPath }/myPage/myOrderDetail?orderCd=${order.orderCd}&memberId=${order.memberId}">${goodsDto.goodsNm }>
			                                        	상품명 : ${order.goodsNm }<br>
			                                        	${order.goodsGroup } / ${order.goodsCategory }<br>
		                                            	상품가격 : <fmt:formatNumber value="${order.price }"/> 원 / 주문수량 : ${order.orderGoodsQty }개
			                                        	</a>
			                                        </div>
			                                    </td>
												<td><h6><strong>${order.memberId }</strong></h6></td>
			                                    <td><h6><fmt:formatDate value="${order.payOrderTime }" pattern="yyyy-MM-dd"/></h6> </td>
			                                    <td><h6>${order.deliveryStatus }</h6></td>
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
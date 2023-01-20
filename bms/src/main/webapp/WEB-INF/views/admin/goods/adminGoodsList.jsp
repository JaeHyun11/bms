<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	function adminGoodsRemove(goodsCd) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/admin/goods/adminGoodsRemove?goodsCd="+goodsCd;
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
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath}/">Admin</a>
							<span>Goods List</span>
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
                                    <th>코드</th>
                                    <th>상품정보</th>
                                    <th>등록일</th>
                                    <th>수정 / 삭제</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty goodsList}">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>조회된 상품이 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
                            			<c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
			                                <tr>
			                                    <td class="product__cart__item" align="center">
			                                    	<h6>${goodsDto.goodsCd }</h6>
			                                    </td>
			                                    <td class="product__cart__item">
		                                            <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" width="100" height="100">
			                                        <div class="product__cart__item__title">
			                                        	<h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }</a></h6>
			                                        	<p>${goodsDto.goodsGroup} | ${goodsDto.goodsCategory} | <fmt:formatNumber value="${goodsDto.price }"/>원</p>
			                                        </div>
			                                     </td>
			                                     <td class="cart__total"><fmt:formatDate value="${goodsDto.enrollDt }" pattern="yyyy-MM-dd"/> </td>
			                                	<td class="cart__close">
			                                		<a href="${contextPath }/admin/goods/adminGoodsModify?goodsCd=${goodsDto.goodsCd}"><span class="icon_pencil-edit"></span></a>
			                                		<a href="javascript:adminGoodsRemove(${goodsDto.goodsCd });"><span class="icon_trash_alt"></span></a>
			                                	</td>
			                                </tr>
                                    	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div align="right">
						<button type="button" onclick="javascript:location.href='${contextPath}/admin/goods/adminGoodsAdd'" class="site-btn"><span class="icon_plus"></span> 등록</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
</body>
</html>
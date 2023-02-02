<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 30-day return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12">
                        <div class="header__top__right">
                            <div class="header__top__links">
                            	<c:choose>
                                	<c:when test="${sessionScope.memberId ne null}">
                                		<p><a href="${contextPath }/member/logout">Logout</a></p>
                                	</c:when>
                                	<c:otherwise>
                                		<c:if test="${sessionScope.memberId eq null}">
                                	    	<p><a href="${contextPath }/member/login">Login</a></p>
                                		</c:if>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="header__top__hover">
                            	<c:choose>
	                        		<c:when test="${sessionScope.role eq 'admin'}">
					                    <li><a href="${contextPath }/admin/goods/adminGoodsList">Management</a>
			                                <ul class="dropdown">
				                                <li><a href="${contextPath }/admin/goods/adminGoodsList"> 상품 관리</a></li>
				                                <li><a href="${contextPath }/admin/member/adminMemberList"> 사용자 관리</a></li>
				                                <li><a href="${contextPath }/admin/order/adminOrderList"> 주문 관리</a></li>
				                                <li><a href="${contextPath }/admin/qa/qaList"> QA 관리</a></li>
			                           		</ul>
			                           	</li>
			                        </c:when>
			                        <c:otherwise>
			                        	<a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}">MY PAGE</a>
			                        	<i class="arrow_carrot-down"></i>
		                                	<ul>
				                             	<li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}"> 내 정보</a></li>
				                             	<li><a href="${contextPath }/myPage/myWishList?memberId=${sessionScope.memberId}"> 내 위시리스트</a></li>
				                             	<li><a href="${contextPath }/myPage/myOrderList?memberId=${sessionScope.memberId}"> 주문조회</a></li>
				                            	<li><a href="${contextPath }/myPage/QA?memberId=${sessionScope.memberId}"> 내 QA</a></li>
		                             		</ul>
			                        </c:otherwise>
		                        </c:choose>
                           	</div>
                            <div class="header__top__hover">
                                <span>USD <i class="arrow_carrot-down"></i></span>
                                <ul>
                                    <li>USD</li>
                                    <li>EUR</li>
                                    <li>KRW</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                	<nav class="header__menu mobile-menu">
                    	<ul>
                        	<li class="active"><a href="${contextPath }/">Home</a></li>
                            <li><a href="${contextPath }/goods/mensGoodsList?sort=all&goodsGroup=mens&goodsCategory=all">Mens</a>
                            	<ul class="dropdown">
                                    <li><a href="${contextPath }/goods/mensGoodsList?sort=sale&goodsGroup=mens&goodsCategory=all">SALE</a></li>
                                    <li><a href="${contextPath }/goods/mensGoodsList?sort=all&goodsGroup=mens&goodsCategory=all">SHOP ALL</a></li>
                                    <li><a href="${contextPath }/goods/goodsDetail?sort=all&goodsGroup=mens&goodsCategory=coats&jackets}">Coats&Jackets</a></li>
                                    <li><a href="${contextPath }/goods/goodsDetail?sort=all&goodsGroup=mens&goodsCategory=sweaters}">Sweaters</a></li>
                                    <li><a href="${contextPath }/goods/goodsDetail?sort=all&goodsGroup=mens&goodsCategory=shirts}">Shirts</a></li>
                                    <li><a href="${contextPath }/goods/goodsDetail?sort=all&goodsGroup=mens&goodsCategory=tshirts}">T-Shirts</a></li>
                                    <li><a href="${contextPath }/goods/goodsDetail?sort=all&goodsGroup=mens&goodsCategory=pants}">Pants</a></li>
                                    <li><a href="${contextPath }/goods/goodsDetail?sort=all&goodsGroup=mens&goodsCategory=shoes}">Shoes</a></li>
                                </ul>
                            </li>
                            <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=all">Womens</a>
                                <ul class="dropdown">
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=sale&goodsGroup=womens&goodsCategory=all">SALE</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=all">SHOP ALL</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=coats&jackets">Coats&Jackets</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=sweaters">Sweaters</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=dresses">Dresses</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=shirts">Shirts</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=tshirts">T-Shirts</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=pants">Pants</a></li>
                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=shoes">Shoes</a></li>
                                </ul>
                            </li>
                        	<li><a href="${contextPath }/QA">QA 게시판</a></li>
                        	<li><a href="${contextPath }/contact">Contacts</a></li>
                    	</ul>
                	</nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a>
                        <a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a>
                        <a href="${contextPath }/myPage/myCartList"><img src="${contextPath }/resources/bootstrap/img/icon/cart.png" alt=""> <span>
                        	<c:choose>
                             	<c:when test="${sessionScope.role == 'client'}">
                                	<div class="tip">${sessionScope.myCartCnt }</div>
                             	</c:when>
                             	<c:otherwise>
                             		<div class="tip">0</div>
                             	</c:otherwise>
                             </c:choose>
                        </span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
</body>
</html>
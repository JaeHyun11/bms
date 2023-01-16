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
                    <div class="col-lg-6 col-md-5">
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
                            <div class="header__top__links">
                            	<c:choose>
	                        		<c:when test="${sessionScope.role eq 'admin'}">
					                    <li><a href="#">Management</a>
			                                <ul class="dropdown">
			                                 <li><a href="./goods.html"> 상품 관리</a></li>
			                                 <li><a href="./member.html"> 사용자 관리</a></li>
			                                 <li><a href="./order.html"> 주문 관리</a></li>
			                                 <li><a href="./qa.html"> QA 관리</a></li>
			                           		</ul>
			                           	</li>
			                        </c:when>
			                        <c:otherwise>
			                        	<li><a href="#">MY PAGE</a>
		                                	<ul class="dropdown">
			                             	 <li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}"> 내 정보</a></li>
			                             	 <li><a href="${contextPath }/myPage/myWishList?memberId=${sessionScope.memberId}"> 내 위시리스트</a></li>
			                             	 <li><a href="${contextPath }/myPage/myOrderList"> 주문조회</a></li>
			                            	 <li><a href="${contextPath }/myPage/QA"> 내 QA</a></li>
		                             		</ul>
		                            	</li>
			                        </c:otherwise>
		                        </c:choose>
                           	</div>
                           	<div>
                                <a href="#">FAQs</a>
                            </div>
                            <div class="header__top__hover">
                                <span>Usd <i class="arrow_carrot-down"></i></span>
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
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="./shopmens.html">Mens</a>
                            	<ul class="dropdown">
                                    <li><a href="./about.html">SALE</a></li>
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shopping-cart.html">Shopping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Womens</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html">SALE</a></li>
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shopping-cart.html">Shopping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">QA 게시판</a></li>
                            <li><a href="./contact.html">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <a href="#"><img src="img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
</body>
</html>
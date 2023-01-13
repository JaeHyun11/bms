<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Login</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Login</span>
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
            <div class="checkout__form">
                <form action="${contextPath}/member/login" method="post">
                    <div class="row">
                        <div class="col-lg-10 col-md-8">
                            <h6 id="login">로그인</h6>
							<br><br><br><br>
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" id="username">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="text" id="password">
                            </div>
                            <div>
                                <input name="rememberMe" id="rememberMe" type="checkbox" data-testid="checkboxInput">
                                	<label class="PbX1 Dd8P" for="rememberMe">로그인 상태 유지</label>&nbsp;&nbsp;
	                            <a class="aOrM TzhG goq6 NxHR" href="#">비밀번호를 잊으셨나요?&nbsp;</a>
                            </div>
                            <div>
                                <button type="submit" class="site-btn">로그인</button>&nbsp; 
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div>
            	<button onclick="location.href='${contextPath}/member/register'" class="site-btn">회원가입하기</button>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
                        <h4>AdminLogin</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Admin</a>
                            <span>멤버 리스트</span>
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
                    <div class="row">
                        <div class="col-lg-10 col-md-8">
                            <h6>멤버 리스트</h6>
                            <br><br><br><br>
							<div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th width="10%">번호</th>
                                    <th width="30%">회원아이디</th>
                                    <th width="25%">회원이름</th>
                                    <th width="15%">포인트</th>
                                    <th width="5%">성별</th>
                                    <th width="15%">가입일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty memberList}">
                            			<tr>
                            				<td colspan="6"><h3>가입된 회원이 없습니다.</h3></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="memberDto" items="${memberList }" varStatus="i">
		                            		 <tr>
		                            		 	<td>
		                            		 		<h6>${i.count }</h6>
			                                    </td>
                                    			<td class="cart__product__item">
			                                        <h6><a href="${contextPath }/myPage/myInfo?memberId=${memberDto.memberId}">${memberDto.memberId} </a></h6>
			                                    </td>
			                                	<td class="cart__product__item__title"><strong>${memberDto.memberNm }</strong></td>
			                                	<td class="cart__total"><fmt:formatNumber value="${memberDto.point }"/> P</td>
			                                    <td>${memberDto.sex }</td>
			                                    <td><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"/> </td>
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
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">
<script>

	function removeContact() {
		
		
		var contactCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='contactCd']:checked").each(function(){
				contactCdList += $(this).val() + ",";
			});
			
			if (contactCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/removeContact?contactCdList="+contactCdList;
		}
		
	}
	
	function selectAllContact() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='contactCd']").prop("checked" , true);
		}
		else {
			$("[name='contactCd']").prop("checked" , false);
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
                            <a href="${contextPath }/">Admin</a>
                            <span>Contact List</span>
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
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>메일</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                            		<c:when test="${empty contactList}">
                            			<tr>
                            				<td colspan="5" align="center"><h6>컨텍트 신청이 없습니다.</h6></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="contactDto" items="${contactList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="contactCd" value="${contactDto.contactCd }"></td>
                                    			<td class="cart__product__item">
		                                            <h6><a href="${contextPath }/contactDetail?contactCd=${contactDto.contactCd}">${contactDto.content }</a></h6>
			                                    </td>
			                                    <td>${contactDto.name }</td>
			                                    <td>${contactDto.email }</td>
			                                    <td class="cart__total"><fmt:formatDate value="${contactDto.regDt }" pattern="yyyy-MM-dd"/> </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="cart__total" align="right">
						<a href="javascript:removeContact();">컨텍트 삭제</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
</body>
</html>
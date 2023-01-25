<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	$(document).ready(function(){
	
		$("[name='goodsGroup']").change(function(){
			var searchType = $("[name='goodsGroup']").val();
		    
			var setView = "";
			
		 	if (searchType == "mens"){
		 		setView = '<select name="goodsCategory">';
	            setView += '<option value="coats&jackets">코트&자켓</option>';
	            setView += '<option value="sweaters">스웨터</option>';
	            setView += '<option value="shirts">셔츠</option>';
	            setView += '<option value="tshirts">티셔츠</option>';
	            setView += '<option value="pants">팬츠</option>';
	            setView += '<option value="shoes">슈즈</option>';
	            setView += '</select>';
		 	}
			else if (searchType == "womens") {
				setView = '<select name="goodsCategory">';
	            setView += '<option value="coats&jackets">코트&자켓</option>';
	            setView += '<option value="sweaters">스웨터</option>';
	            setView += '<option value="shirts">셔츠</option>';
	            setView += '<option value="tshirts">티셔츠</option>';
	            setView += '<option value="skirts">스커트</option>';
	            setView += '<option value="dresses">드레스</option>';
	            setView += '<option value="pants">팬츠</option>';
	            setView += '<option value="shoes">슈즈</option>';
	            setView += '</select>';
			}
			$("#setCategory").html(setView);
			
		});
		
	});

</script>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Add Goods</h4>
                        <div class="breadcrumb__links">
                            <a href="${contextPath }/">Admin</a>
                            <span>Add Goods</span>
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
                <form action="${contextPath }/admin/goods/adminGoodsAdd" method="post" enctype="multipart/form-data" class="checkout__form">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h5>상품 등록</h5>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="checkout__input">
                                        <p>상품 이미지<span>*</span> <span class="icon_upload"></span></p>
                                        <input type="file" name="goodsFileName">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                <div class="checkout__input">
                                    <p>상품명 <span>*</span></p>
                                    <input type="text" name="goodsNm" placeholder="상품명을 입력하세요.">
                                    </div>
                                </div>
                                 <div class="col-sm-6">
	                                <div class="checkout__input">
	                                    <p>그룹<span>*</span></p>
	                                    <select name="goodsGroup">
	                                    	<option value="mens">남성</option>
	                                    	<option value="womens">여성</option>
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="col-sm-6">
	                                <div class="checkout__input">
	                                    <p>카테고리<span>*</span></p> 
	                                    <span id="setCategory">
				                            <select name="goodsCategory">
									            <option value="coats&jackets">코트&자켓</option>
									            <option value="sweaters">스웨터</option>
									            <option value="shirts">셔츠</option>
									            <option value="tshirts">티셔츠</option>
									            <option value="pants">팬츠</option>
									            <option value="shoes">슈즈</option>
									        </select>
	                                    </span>                                   
	                                </div>
	                            </div>
	                            <div class="col-sm-6">
                                	<div class="checkout__input">
	                                    <p>분류 <span>*</span></p>
	                                    <select name="sort">
	                                    	<option value="general">일반</option>
	                                    	<option value="new">신상</option>
	                                    	<option value="sale">세일</option>
	                                    </select>
	                                </div>
	                            </div>
                               	<div id="collapseFive" class="collapse show" data-parent="#accordionExample">
	                                 <div class="card-body">
	                                 	<p>색상 <span>*</span></p>
	                                     <div class="shop__sidebar__color">
	                                         <label class="c-1" for="sp-1">
	                                             <input type="radio" id="sp-1" name="goodsColor" value="black">
	                                         </label>
	                                         <label class="c-2" for="sp-2">
	                                             <input type="radio" id="sp-2" name="goodsColor" value="navy">
	                                         </label>
	                                         <label class="c-3" for="sp-3">
	                                             <input type="radio" id="sp-3" name="goodsColor" value="yellow">
	                                         </label>
	                                         <label class="c-4" for="sp-4">
	                                             <input type="radio" id="sp-4" name="goodsColor" value="grey">
	                                         </label>
	                                         <label class="c-5" for="sp-5">
	                                             <input type="radio" id="sp-5" name="goodsColor" value="khaki">
	                                         </label>
	                                         <label class="c-6" for="sp-6">
	                                             <input type="radio" id="sp-6" name="goodsColor" value="pink">
	                                         </label>
	                                         <label class="c-7" for="sp-7">
	                                             <input type="radio" id="sp-7" name="goodsColor" value="purple">
	                                         </label>
	                                         <label class="c-8" for="sp-8">
	                                             <input type="radio" id="sp-8" name="goodsColor" value="red">
	                                         </label>
	                                         <label class="c-9" for="sp-9">
	                                             <input type="radio" id="sp-9" name="color" value="white">
	                                         </label>
	                                     </div>
                                     </div>
	                            </div>
	                            <div class="col-sm-6">
	                            	<div class="checkout__input">
	                                	<p>가격 <span>*</span></p>
	                                    <input type="text" name="price" placeholder="가격을 입력하세요.">
	                                </div>
	                            </div>	
	                            <div class="col-sm-6">
	                            	<div class="checkout__input">
		                                <p>할인률 <span>*</span></p>
		                                <input type="text" name="discountRate" placeholder="할인률을 입력하세요.">
		                           	</div>
	                            </div>
	                            <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">사이즈별 재고</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                            
                                                    <input type="text" name="stock" id="xs" value="xs">
                            
                                             
                                                    <input type="text" name="stock" id="sm" value="sm">
                                                
                                               
                                                    <input type="text" name="stock" id="md" value="md">
                                                
                                                    <input type="text" name="stock" id="xl" value="xl">
                                            
                                                
                                                    <input type="text" name="stock" id="xxl" value="xxl">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
	                            <div class="col-sm-6">
	                                <div class="checkout__input">
	                                    <p>배송비 <span>*</span></p>
	                                    <input type="text" name="deliveryPrice" placeholder="배송비를 입력하세요.">
	                                </div>
	                            </div>
	                            <div class="col-sm-6">
	                                <div class="checkout__input">
	                                    <p>적립 포인트 <span>*</span></p>
	                                    <input type="text" name="point" placeholder="적립 포인트를 입력하세요.">
	                                </div>
	                            </div>
	                            <div class="col-sm-12">
	                                <div class="checkout__input">
	                                    <p>상품 설명<span>*</span></p>
	                                    <textarea rows="5" cols="100" name="goodsInfo" placeholder="상품 설명을 입력하세요."></textarea> 
	                                	<script>CKEDITOR.replace("goodsInfo");</script>
	                                </div>
	                            </div>
	                            <div class="col-sm-12" align="right">
	                                <button type="submit" class="site-btn">추가하기</button>
	                            </div>
                            </div>
                        </div>
                	</div>
                </form>
            </div>
		</div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>
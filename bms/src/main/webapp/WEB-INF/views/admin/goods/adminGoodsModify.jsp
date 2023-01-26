<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
	$(document).ready(function(){
		
		$("[name='goodsGroup']").change(function(){
			var searchType = $("[name='goodsGroup']").val();
		    
			var setView = "";
			
		 	if (searchType == "mens"){
		 		setView = '<select name="goodsCategory">';
	            setView += '<option value="Jackets&Coats">자켓&코트</option>';
	            setView += '<option value="Sweaters">스웨터</option>';
	            setView += '<option value="Shirts">셔츠</option>';
	            setView += '<option value="TShirts">티셔츠</option>';
	            setView += '<option value="Pants">팬츠</option>';
	            setView += '<option value="Shoes">슈즈</option>';
	            setView += '</select>';
		 	}
			else if (searchType == "womens") {
				setView = '<select name="goodsCategory">';
	            setView += '<option value="Jackets&Coats">자켓&코트</option>';
	            setView += '<option value="Sweaters">스웨터</option>';
	            setView += '<option value="Shirts">셔츠</option>';
	            setView += '<option value="TShirts">티셔츠</option>';
	            setView += '<option value="Skirts">스커트</option>';
	            setView += '<option value="Dresses">드레스</option>';
	            setView += '<option value="Pants">팬츠</option>';
	            setView += '<option value="Shoes">슈즈</option>';
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
	                    <h4>Modify Goods</h4>
	                    <div class="breadcrumb__links">
	                        <a href="${contextPath }/">Admin</a>
	                        <span>Modify Goods</span>
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
	            <form action="${contextPath }/admin/goods/adminGoodsModify" method="post" enctype="multipart/form-data" class="checkout__form">
	            	<input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
		                <div class="row">
		                    <div class="col-lg-8 col-md-6">
		                        <h5>상품 수정</h5>
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
	                                             <input type="radio" id="sp-9" name="goodsColor" value="white">
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
	                            <div class="col-sm-6">
	                            	<div class="checkout__input">
	                            		<p>XS사이즈 재고 <span>*</span></p>
                                            <input type="text" name="xsStock" placeholder="xs">
                                    </div>
                                </div>
                                <div class="col-sm-6">
	                            	<div class="checkout__input">
	                            		<p>SM사이즈 재고 <span>*</span></p>
                                            <input type="text" name="smStock" placeholder="sm">
                                        </div>
                                </div>    
                               <div class="col-sm-6">
	                            	<div class="checkout__input">
	                            		<p>MD사이즈 재고 <span>*</span></p>
                                            <input type="text" name="mdStock" placeholder="md">
                                       	</div>
                                </div>
                                <div class="col-sm-6">
	                            	<div class="checkout__input">
	                            		<p>L사이즈 재고 <span>*</span></p>
                                            <input type="text" name="lgStock" placeholder="lg">
                                        </div>
                                </div>
                                <div class="col-sm-6">
	                            	<div class="checkout__input">
	                            		<p>XL사이즈 재고 <span>*</span></p>    
                                            <input type="text" name="xlStock" placeholder="xl">
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
	                            <div class="col-sm-12">
	                                <div class="checkout__input">
	                                    <p>상품 구성 및 추가 정보<span>*</span></p>
	                                    <textarea rows="5" cols="100" name="goodsDetail" placeholder="상품 구성 및 추가 정보를 입력하세요."></textarea> 
	                                	<script>CKEDITOR.replace("goodsDetail");</script>
	                                </div>
	                            </div>
	                            <div class="col-sm-12" align="right">
	                                <button type="submit" class="site-btn">수정하기</button>
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
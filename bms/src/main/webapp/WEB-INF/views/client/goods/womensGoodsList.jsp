<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function processToCart(goodsCd) {
	
		$.ajax({
			url : "${contextPath }/myPage/addCart",
			method : "get",
			data : {"goodsCd" : goodsCd , "cartGoodsQty" : + 1},
			success : function(result) {
				alert("장바구니에 추가되었습니다.");
				
			}
		})
		
	}
	
	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			location.href = "${contextPath }/order/orderGoods?goodsCd="+goodsCd+"&orderGoodsQty=1";	
		}
		
	}
	
	function getGoodsListByPrice(){
		location.href =  "${contextPath }/goods/searchGoods?method=price&min="+$("#minamount").val() + "&max=" + $("#maxamount").val();
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
                        <h4>Shop Womens</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Shop Womens</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <li><a href="${contextPath }/goods/mensGoodsList?sort=all&goodsGroup=mens&goodsCategory=all">Mens </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=all">Womens </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=coats&jackets">Coats&Jackets</a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=sweaters">Sweaters </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=dresses">Dresses </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=shirts">Shirts </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=tshirts">T-Shirts </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=pants">Pants </a></li>
                                                    <li><a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=shoes">Shoes </a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Filter</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=lowPrice">낮은 가격순</a></li>
                                                    <li><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=highPrice">높은 가격순</a></li>
                                                    <li><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=discountRate">할인률 높은순</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="xs">xs
                                                    <input type="radio" id="xs">
                                                </label>
                                                <label for="sm">s
                                                    <input type="radio" id="sm">
                                                </label>
                                                <label for="md">m
                                                    <input type="radio" id="md">
                                                </label>
                                                <label for="lg">l
                                                    <input type="radio" id="lg">
                                                </label>
                                                <label for="xl">xl
                                                    <input type="radio" id="xl">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                    </div>
                                    <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
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
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseSix">Search</a>
                                    </div>
                                    <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <form action="${contextPath }/goods/searchGoods"method="get">
				                            	<input type="text" name="word">
				                            	<input type="hidden" name="method" value="search">
				                            	<input type="submit" value="검색">
			                            	</form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>Showing 1–12 of 126 results</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by</p>
                                    <select name="sort">
                                        <option value="new">New</option>
                                        <option value="">Popular</option>
                                        <option value="">Price Low To High</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="col-lg-9">
                	<div class="row">
                    	<c:choose>
                    		<c:when test="${goodsGroup != 'womens'}">
	                            <div class="product__item">
	                    			<h3>등록된 상품이 없습니다.</h3>
	                            </div>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach var="goodsDto" items="${womensGoodsList }">
			                        <div class="col-lg-4 col-md-6">
			                            <div class="product__item">
			                                <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}">
			                                    <c:choose>
			                                    	<c:when test="${goodsDto.sort eq 'new' }"> <div class="label new">New</div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'sale' }">  <div class="label sale">Sale</div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'general' }"> <div class="label stockout stockblue">General</div></c:when>
			                                    </c:choose>
			                                </div>
			                                <div>
			                                    <ul class="product__item__text">
			                                        <li><a href="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}" class="image-popup"><span class="arrow_expand"></span></a></li>
			                                        <li><a href=""><span class="add-cart">+ Add To Cart</span></a></li>
			                                        <li><a href=""><span class="icon_bag_alt"></span></a></li>
			                                    </ul>
			                                	<c:choose>
			                                    	<c:when test="${goodsDto.goodsGroup=='womens'}">
					                                    <h6>
					                                    	<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd }">${goodsDto.goodsNm }<br>
						                                    ${goodsDto.goodsGroup } | ${goodsDto.goodsCategory }
					                                    	</a>
					                                    </h6>
					                                    <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${goodsDto.price }"/>원 (${goodsDto.discountRate}%)</div>
					                                    <div class="product__price"><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100 }"/>원</div>
				                            			<div class="product__color__select"><name="goodsColor" value="${goodsDto.goodsColor }"/>색</div>
				                            		</c:when>
				                            	</c:choose>   
				                        	</div>
			                            </div>
			                        </div>
		                    	</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                	</div>    
                    	<div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item sale">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                                    <span class="label">Sale</span>
                                    <ul class="product__hover">
                                        <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                        <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a>
                                        </li>
                                        <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>Multi-pocket Chest Bag</h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>$43.48</h5>
                                    <div class="product__color__select">
                                        <label for="pc-7">
                                            <input type="radio" id="pc-7">
                                        </label>
                                        <label class="active black" for="pc-8">
                                            <input type="radio" id="pc-8">
                                        </label>
                                        <label class="grey" for="pc-9">
                                            <input type="radio" id="pc-9">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                                <a class="active" href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
</body>
</html>
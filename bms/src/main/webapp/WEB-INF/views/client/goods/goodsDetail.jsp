<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	
	function processToCart(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addCart",
				method : "get",
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : $("#orderGoodsQty").val() , "sizeStock" : $("[name='sizeStock']:checked").val() },
				success : function() {
					alert("상품이 추가되었습니다.");
				}
			});
		}
	}
		
	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인 먼저 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {		
			
			location.href = "${contextPath }/order/orderGoods?goodsCd="+goodsCd+"&sizeStock="+$("[name='sizeStock']:checked").val()+"&orderGoodsQty="+$("#orderGoodsQty").val();	
		}
		
	}
	
	$().ready(function () {
		
		$("[name='sizeStock']").click(function() {
			
			var keyword = $("[name='sizeStock']:checked").val();
			keyword.prop("checked", true);
			
		});
		
	});
			
	
	
	
</script>
</head>
<body>
    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="${contextPath }/">Home</a>
                            <c:choose>
                            	<c:when test="${goodsGroup == 'mens' }">
                            		<a href="${contextPath }/goods/mensGoodsList?sort=all&goodsGroup=mens&goodsCategory=all">Shop Mens</a>
                            	</c:when>
                            	<c:otherwise>
                            		<a href="${contextPath }/goods/womensGoodsList?sort=all&goodsGroup=womens&goodsCategory=all">Shop Womens</a>
                            	</c:otherwise>
                            </c:choose>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
                                        <i class="fa fa-play"></i>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${goodsDto.goodsNm }</h4>
                            <h3>${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100 } 원<span>${goodsDto.price } 원</span></h3>
                            <p>${goodsDto.goodsInfo }</p>
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Size:</span>
                                    <label for="xs">xs
                                        <input type="radio" id="xs" name="sizeStock" value="xs">
                                    </label>
                                    <label for="sm">sm
                                        <input type="radio" id="sm" name="sizeStock" value="sm">
                                    </label>
                                    <label for="md">md
                                        <input type="radio" id="md" name="sizeStock" value="md">
                                    </label>
                                    <label class="active" for="l">l
                                        <input type="radio" id="l" name="sizeStock" value="lg" checked>
                                    </label>
                                    <label for="xl">xl
                                        <input type="radio" id="xl" name="sizeStock" value="xl">
                                    </label>
                                </div>
	                            <div class="product__details__cart__option">
	                                <div class="quantity">
	                                	<span>수량: </span>
	                                    <div class="pro-qty">
	                                    	<input type="text" value="1" id="orderGoodsQty" name="orderGoodsQty">
	                                    </div>
	                                </div>
	                                <a href="javascript:processToCart(${goodsDto.goodsCd });" class="primary-btn">장바구니에 담기</a>
	                                <a href="javascript:processToOrder(${goodsDto.goodsCd });" class="primary-btn">주문하기</a>
	                            </div>
	                            <div class="product__details__btns__option">
	                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
	                            </div>
	                            <div class="product__details__last__option">
	                                <h5><span>Guaranteed Safe Checkout</span></h5>
	                                <img src="${contextPath }/resources/bootstrap/img/shop-details/details-payment.png" alt="">
	                                <ul>
	                                    <li><span>SKU:</span> ${goodsDto.goodsCd }</li>
	                                    <li><span>Categories:</span> ${goodsDto.goodsCategory }</li>
	                                </ul>
	                            </div>
                        	</div>
                    	</div>
                	</div>
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="product__details__tab">
	                            <ul class="nav nav-tabs" role="tablist">
	                                <li class="nav-item">
	                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
	                                    role="tab">Description</a>
	                                </li>
	                                <li class="nav-item">
	                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Additional Details</a>
	                                </li>
	                                <li class="nav-item">
	                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab" href="#">Q&A</a>
	                                </li>
	                            </ul>
	                            <div class="tab-content">
	                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
	                                    <div class="product__details__tab__content">
	                                        <p class="note"></p>
	                                        <div class="product__details__tab__content__item">
	                                            <h5>Products Infomation</h5>
	                                            <p>색상		${goodsDto.goodsColor }</p>
	                                            <p>${goodsDto.goodsInfo }</p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="tab-pane" id="tabs-6" role="tabpanel">
	                                    <div class="product__details__tab__content">
	                                        <div class="product__details__tab__content__item">
	                                            <h5>Additional Details</h5>
	                                            <p>${goodsDto.goodsDetail }</p>
	                                        </div>
	                                        <div class="product__details__tab__content__item">
	                                            <h5></h5>
	                                            <p></p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="tab-pane" id="tabs-7" role="tabpanel">
	                                    <div class="product__details__tab__content">
	                                        <p class="note"></p>
	                                        <div class="product__details__tab__content__item">
	                                            <h5>Products Infomation</h5>
	                                            <p></p>
	                                        </div>
	                                        <div class="product__details__tab__content__item">
	                                            <h5>Material used</h5>
	                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
	                                                from synthetic materials, not natural like wool. Polyester suits become
	                                                creased easily and are</p>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	        	</div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-1">
                                    <input type="radio" id="pc-1">
                                </label>
                                <label class="active black" for="pc-2">
                                    <input type="radio" id="pc-2">
                                </label>
                                <label class="grey" for="pc-3">
                                    <input type="radio" id="pc-3">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-4">
                                    <input type="radio" id="pc-4">
                                </label>
                                <label class="active black" for="pc-5">
                                    <input type="radio" id="pc-5">
                                </label>
                                <label class="grey" for="pc-6">
                                    <input type="radio" id="pc-6">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
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
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-4.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Diagonal Textured Cap</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$60.9</h5>
                            <div class="product__color__select">
                                <label for="pc-10">
                                    <input type="radio" id="pc-10">
                                </label>
                                <label class="active black" for="pc-11">
                                    <input type="radio" id="pc-11">
                                </label>
                                <label class="grey" for="pc-12">
                                    <input type="radio" id="pc-12">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Section End -->
</body>
</html>
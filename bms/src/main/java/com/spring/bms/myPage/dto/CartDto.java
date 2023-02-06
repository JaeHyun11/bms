package com.spring.bms.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CartDto {

	private long cartCd;
	private int goodsCd;
	private String sizeStock;
	private int cartGoodsQty;
	private int deliveryPrice;
	private String memberId;
	private Date enrollDt;
	
	public long getCartCd() {
		return cartCd;
	}
	public void setCartCd(long cartCd) {
		this.cartCd = cartCd;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getSizeStock() {
		return sizeStock;
	}
	public void setSizeStock(String sizeStock) {
		this.sizeStock = sizeStock;
	}
	public int getCartGoodsQty() {
		return cartGoodsQty;
	}
	public void setCartGoodsQty(int cartGoodsQty) {
		this.cartGoodsQty = cartGoodsQty;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "CartDto [cartCd=" + cartCd + ", goodsCd=" + goodsCd + ", sizeStock=" + sizeStock + ", cartGoodsQty="
				+ cartGoodsQty + ", deliveryPrice=" + deliveryPrice + ", memberId=" + memberId + ", enrollDt="
				+ enrollDt + "]";
	}
	
	
	
}

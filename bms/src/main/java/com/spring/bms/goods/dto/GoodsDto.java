package com.spring.bms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsDto {
	
	private int goodsCd;
	private String goodsGroup;
	private String goodsCategory;
	private String color;
	private String sort;
	private String goodsInfo;
	private String goodsFileName;
	private int price;
	private int discountRate;
	private int stock;
	private int point;
	private int deliveryPrice;
	private Date enrollDt;
	
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsGroup() {
		return goodsGroup;
	}
	public void setGoodsGroup(String goodsGroup) {
		this.goodsGroup = goodsGroup;
	}
	public String getGoodsCategory() {
		return goodsCategory;
	}
	public void setGoodsCategory(String goodsCategory) {
		this.goodsCategory = goodsCategory;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getGoodsInfo() {
		return goodsInfo;
	}
	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "GoodsDto [goodsCd=" + goodsCd + ", goodsGroup=" + goodsGroup + ", goodsCategory=" + goodsCategory
				+ ", color=" + color + ", sort=" + sort + ", goodsInfo=" + goodsInfo + ", goodsFileName="
				+ goodsFileName + ", price=" + price + ", discountRate=" + discountRate + ", stock=" + stock
				+ ", point=" + point + ", deliveryPrice=" + deliveryPrice + ", enrollDt=" + enrollDt + "]";
	}
	
	
}

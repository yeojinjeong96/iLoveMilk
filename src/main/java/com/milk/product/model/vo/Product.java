package com.milk.product.model.vo;

public class Product {

	private int productNo;
	private String productName;
	private int price;
	private int capacity;
	private String brand;
	private String productInfo;
	private String enrollDate;
	private int stock;
	private String fCategory;
	private String sCategory;
	private String productImg;
	private String status;
	
	public Product() {}

	public Product(int productNo, String productName, int price, int capacity, String brand, String productInfo,
			String enrollDate, int stock, String fCategory, String sCategory, String productImg, String status) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.capacity = capacity;
		this.brand = brand;
		this.productInfo = productInfo;
		this.enrollDate = enrollDate;
		this.stock = stock;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
		this.productImg = productImg;
		this.status = status;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getfCategory() {
		return fCategory;
	}

	public void setfCategory(String fCategory) {
		this.fCategory = fCategory;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", price=" + price + ", capacity="
				+ capacity + ", brand=" + brand + ", productInfo=" + productInfo + ", enrollDate=" + enrollDate
				+ ", stock=" + stock + ", fCategory=" + fCategory + ", sCategory=" + sCategory + ", productImg="
				+ productImg + ", status=" + status + "]";
	}
	
}

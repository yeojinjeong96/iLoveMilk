package com.milk.product.model.vo;

public class Stock {
	private int stockNo;
	private int productNo;
	private int count;
	private String status;
	private String stockDate;
	private String productName;
	private String brand;
	
	public Stock() {}

	public Stock(int stockNo, int productNo, int count, String status, String stockDate, String productName,
			String brand) {
		super();
		this.stockNo = stockNo;
		this.productNo = productNo;
		this.count = count;
		this.status = status;
		this.stockDate = stockDate;
		this.productName = productName;
		this.brand = brand;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStockDate() {
		return stockDate;
	}

	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Override
	public String toString() {
		return "Stock [stockNo=" + stockNo + ", productNo=" + productNo + ", count=" + count + ", status=" + status
				+ ", stockDate=" + stockDate + ", productName=" + productName + ", brand=" + brand + "]";
	}
}

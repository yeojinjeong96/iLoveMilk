package com.milk.recipe.model.vo;

/**
 * @author jw
 *
 */
public class Recipe {

	private int recipeNo;
	private String recipeWriter;
	private String recipeTitle;
	private String recipeIntro;
	private int count;
	private String enrollDate;
	private String deleteStatus;
	private String reportStatus;
	private int recipeType;
	private String mainImg;
	

	
	
	public Recipe() {}

	
	
	
	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, String recipeIntro, int count,
			String enrollDate, String deleteStatus, String reportStatus, int recipeType, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.count = count;
		this.enrollDate = enrollDate;
		this.deleteStatus = deleteStatus;
		this.reportStatus = reportStatus;
		this.recipeType = recipeType;
		this.mainImg = mainImg;
	}


	
	
	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, String recipeIntro, int count,
			String enrollDate, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.count = count;
		this.enrollDate = enrollDate;
		this.mainImg = mainImg;
	}




	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}


	public String getRecipeWriter() {
		return recipeWriter;
	}


	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}


	public String getRecipeTitle() {
		return recipeTitle;
	}


	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}


	public String getRecipeIntro() {
		return recipeIntro;
	}


	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getDeleteStatus() {
		return deleteStatus;
	}


	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}


	public String getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}


	public int getRecipeType() {
		return recipeType;
	}


	public void setRecipeType(int recipeType) {
		this.recipeType = recipeType;
	}


	public String getMainImg() {
		return mainImg;
	}


	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}




	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", recipeWriter=" + recipeWriter + ", recipeTitle=" + recipeTitle
				+ ", recipeIntro=" + recipeIntro + ", count=" + count + ", enrollDate=" + enrollDate + ", deleteStatus="
				+ deleteStatus + ", reportStatus=" + reportStatus + ", recipeType=" + recipeType + ", mainImg="
				+ mainImg + "]";
	}
	
	
}

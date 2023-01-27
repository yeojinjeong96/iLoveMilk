package com.milk.recipe.model.vo;

public class RecipeOrder {

	private int recipeOrderNo;
	private int recipeNo;
	private int recipeOrder;
	private String recipeExplain;
	private String recipeImg;
	
	
	
	public RecipeOrder() {}


	
	public RecipeOrder(int recipeOrderNo, int recipeNo, int recipeOrder, String recipeExplain, String recipeImg) {
		super();
		this.recipeOrderNo = recipeOrderNo;
		this.recipeNo = recipeNo;
		this.recipeOrder = recipeOrder;
		this.recipeExplain = recipeExplain;
		this.recipeImg = recipeImg;
	}



	
	public int getRecipeOrderNo() {
		return recipeOrderNo;
	}



	public void setRecipeOrderNo(int recipeOrderNo) {
		this.recipeOrderNo = recipeOrderNo;
	}



	public int getRecipeNo() {
		return recipeNo;
	}



	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}



	public int getRecipeOrder() {
		return recipeOrder;
	}



	public void setRecipeOrder(int recipeOrder) {
		this.recipeOrder = recipeOrder;
	}



	public String getRecipeExplain() {
		return recipeExplain;
	}



	public void setRecipeExplain(String recipeExplain) {
		this.recipeExplain = recipeExplain;
	}



	public String getRecipeImg() {
		return recipeImg;
	}



	public void setRecipeImg(String recipeImg) {
		this.recipeImg = recipeImg;
	}



	
	@Override
	public String toString() {
		return "RecipeOrder [recipeOrderNo=" + recipeOrderNo + ", recipeNo=" + recipeNo + ", recipeOrder=" + recipeOrder
				+ ", recipeExplain=" + recipeExplain + ", recipeImg=" + recipeImg + "]";
	}
	
	
}

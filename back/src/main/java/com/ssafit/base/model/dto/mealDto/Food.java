package com.ssafit.base.model.dto.mealDto;

public class Food {
	private int food_id;
	private String food_name;
	private float carbo;
	private float protein;
	private float fat;
	
	public Food() {
		// TODO Auto-generated constructor stub
	}

	public int getFood_id() {
		return food_id;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public float getCarbo() {
		return carbo;
	}

	public void setCarbo(float carbo) {
		this.carbo = carbo;
	}

	public float getProtein() {
		return protein;
	}

	public void setProtein(float protein) {
		this.protein = protein;
	}

	public float getFat() {
		return fat;
	}

	public void setFat(float fat) {
		this.fat = fat;
	}

	@Override
	public String toString() {
		return "Food [food_id=" + food_id + ", food_name=" + food_name + ", carbo=" + carbo + ", protein=" + protein
				+ ", fat=" + fat + "]";
	}
	
}

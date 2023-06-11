package com.ssafit.base.model.dto.mealDto;

public class DietPost {
	private int diet_post;
	private String diet_post_content;
	private String diet_post_img;
	private int meal_id;
	
	public DietPost() {
		// TODO Auto-generated constructor stub
	}

	public int getDiet_post() {
		return diet_post;
	}

	public void setDiet_post(int diet_post) {
		this.diet_post = diet_post;
	}

	public String getDiet_post_content() {
		return diet_post_content;
	}

	public void setDiet_post_content(String diet_post_content) {
		this.diet_post_content = diet_post_content;
	}

	public String getDiet_post_img() {
		return diet_post_img;
	}

	public void setDiet_post_img(String diet_post_img) {
		this.diet_post_img = diet_post_img;
	}

	public int getMeal_id() {
		return meal_id;
	}

	public void setMeal_id(int meal_id) {
		this.meal_id = meal_id;
	}

	@Override
	public String toString() {
		return "DietPost [diet_post=" + diet_post + ", diet_post_content=" + diet_post_content + ", diet_post_img="
				+ diet_post_img + ", meal_id=" + meal_id + "]";
	}
	
}

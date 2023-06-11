package com.ssafit.base.model.dto.mealDto;

public class LikeDietPost {
	private String user_id;
	private int diet_post;
	
	public LikeDietPost() {
		// TODO Auto-generated constructor stub
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getDiet_post() {
		return diet_post;
	}

	public void setDiet_post(int diet_post) {
		this.diet_post = diet_post;
	}

	@Override
	public String toString() {
		return "LikeDietPost [user_id=" + user_id + ", diet_post=" + diet_post + "]";
	}
	
}

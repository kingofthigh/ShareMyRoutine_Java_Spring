package com.ssafit.base.model.dto.mealDto;

public class DietCommentLike {
	private int diet_comment_id;
	private String user_id;
	
	public DietCommentLike() {
		// TODO Auto-generated constructor stub
	}

	public int getDiet_comment() {
		return diet_comment_id;
	}

	public void setDiet_comment(int diet_comment_id) {
		this.diet_comment_id = diet_comment_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "DietCommentLike [diet_comment=" + diet_comment_id + ", user_id=" + user_id + "]";
	}
	
}

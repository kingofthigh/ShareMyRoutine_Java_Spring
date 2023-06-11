package com.ssafit.base.model.dto.mealDto;

import java.time.LocalDateTime;

public class DietComment {
	private int diet_comment;
	private String user_id;
	private int diet_post;
	private String diet_comment_id;
	private LocalDateTime created_date;
	
	public DietComment() {
		// TODO Auto-generated constructor stub
	}

	public int getDiet_comment() {
		return diet_comment;
	}

	public void setDiet_comment(int diet_comment) {
		this.diet_comment = diet_comment;
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

	public String getDiet_comment_id() {
		return diet_comment_id;
	}

	public void setDiet_comment_id(String diet_comment_id) {
		this.diet_comment_id = diet_comment_id;
	}

	public LocalDateTime getCreated_date() {
		return created_date;
	}

	public void setCreated_date(LocalDateTime created_date) {
		this.created_date = created_date;
	}

	@Override
	public String toString() {
		return "DietComment [diet_comment=" + diet_comment + ", user_id=" + user_id + ", diet_post=" + diet_post
				+ ", diet_comment_id=" + diet_comment_id + ", created_date=" + created_date + "]";
	}
	
}

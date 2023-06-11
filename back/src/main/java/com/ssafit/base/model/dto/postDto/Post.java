package com.ssafit.base.model.dto.postDto;

import java.time.LocalDate;

public class Post {
	private int post_id;
	private String user_id;
	private String post_content;
	private String post_img;
	private int workpage_id;
	private LocalDate created_date;
	
	public Post() {
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public String toString() {
		return "Post [post_id=" + post_id + ", user_id=" + user_id + ", post_content=" + post_content + ", post_img="
				+ post_img + ", workpage_id=" + workpage_id + "]";
	}


	public int getPost_id() {
		return post_id;
	}


	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getPost_content() {
		return post_content;
	}


	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}


	public String getPost_img() {
		return post_img;
	}


	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}


	public int getWorkpage_id() {
		return workpage_id;
	}


	public void setWorkpage_id(int workpage_id) {
		this.workpage_id = workpage_id;
	}


	public LocalDate getCreated_date() {
		return created_date;
	}


	public void setCreated_date(LocalDate created_date) {
		this.created_date = created_date;
	}


	public Post(int post_id, String user_id, String post_content, String post_img, int workpage_id,
			LocalDate created_date) {
		super();
		this.post_id = post_id;
		this.user_id = user_id;
		this.post_content = post_content;
		this.post_img = post_img;
		this.workpage_id = workpage_id;
		this.created_date = created_date;
	}
	
	
}

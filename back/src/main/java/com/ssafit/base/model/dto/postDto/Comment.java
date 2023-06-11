package com.ssafit.base.model.dto.postDto;

import java.time.LocalDateTime;

public class Comment {
	private int comment_id;
	private String user_id;
	private int post_id;
	private String comment_content;
	private LocalDateTime created_date;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int comment_id, String user_id, int post_id, String comment_content, LocalDateTime created_date) {
		super();
		this.comment_id = comment_id;
		this.user_id = user_id;
		this.post_id = post_id;
		this.comment_content = comment_content;
		this.created_date = created_date;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public LocalDateTime getCreated_date() {
		return created_date;
	}

	public void setCreated_date(LocalDateTime created_date) {
		this.created_date = created_date;
	}

	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", user_id=" + user_id + ", post_id=" + post_id
				+ ", comment_content=" + comment_content + ", created_date=" + created_date + "]";
	}
	
}	

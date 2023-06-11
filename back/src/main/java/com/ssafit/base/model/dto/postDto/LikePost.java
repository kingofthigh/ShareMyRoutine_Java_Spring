package com.ssafit.base.model.dto.postDto;

public class LikePost {
	private String user_id;
	private int post_id;
	
	public LikePost() {
		// TODO Auto-generated constructor stub
	}

	public LikePost(String user_id, int post_id) {
		super();
		this.user_id = user_id;
		this.post_id = post_id;
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

	@Override
	public String toString() {
		return "LikePost [user_id=" + user_id + ", post_id=" + post_id + "]";
	}
	
}

package com.ssafit.base.model.dto.postDto;

public class LikeComment {
	private String user_id;
	private int comment_id;
	
	public LikeComment() {
		// TODO Auto-generated constructor stub
	}
	public LikeComment(String user_id, int comment_id) {
		super();
		this.user_id = user_id;
		this.comment_id = comment_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCommen() {
		return comment_id;
	}

	public void setCommen(int comment_id) {
		this.comment_id = comment_id;
	}

	@Override
	public String toString() {
		return "LikeComment [user_id=" + user_id + ", commen=" + comment_id + "]";
	}
	
}

package com.ssafit.base.model.dto.videoDto;

import java.time.LocalDateTime;

public class Review {
	private int review_id;
	private String review_content;
	private String user_id;
	private String video_id;
	private LocalDateTime created_date;
	private LocalDateTime modified_date;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int review_id, String review_content, String user_id, String video_id, LocalDateTime created_date,
			LocalDateTime modified_date) {
		super();
		this.review_id = review_id;
		this.review_content = review_content;
		this.user_id = user_id;
		this.video_id = video_id;
		this.created_date = created_date;
		this.modified_date = modified_date;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getVideo_id() {
		return video_id;
	}

	public void setVideo_id(String video_id) {
		this.video_id = video_id;
	}

	public LocalDateTime getCreated_date() {
		return created_date;
	}

	public void setCreated_date(LocalDateTime created_date) {
		this.created_date = created_date;
	}

	public LocalDateTime getModified_date() {
		return modified_date;
	}

	public void setModified_date(LocalDateTime modified_date) {
		this.modified_date = modified_date;
	}

	@Override
	public String toString() {
		return "Review [review_id=" + review_id + ", review_content=" + review_content + ", user_id=" + user_id
				+ ", youtube_id=" + video_id + ", created_date=" + created_date + ", modified_date=" + modified_date
				+ "]";
	}
	
}

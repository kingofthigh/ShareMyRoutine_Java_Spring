package com.ssafit.base.model.service;

import java.util.List;

import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.videoDto.Review;

public interface ReviewService {
	public void registReview(Review review);
	
	public void updateReview(Review review);
	
	public void deleteReview(int review_id);
	
	public Review selectOne(int review_id);
	
//	public User selectUser(int user_id);
	
	public List<Review> searchByVideoId(String video_id);

//	public boolean isReviewOwner(int review_id, String userId);

//	public boolean isAuthor(int review_id, String user_id);
}

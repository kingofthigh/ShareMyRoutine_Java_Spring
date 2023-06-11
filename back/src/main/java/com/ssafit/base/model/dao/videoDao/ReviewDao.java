package com.ssafit.base.model.dao.videoDao;

import java.util.List;

import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.videoDto.Review;

public interface ReviewDao {
	public void registReview(Review review);
	
	public void updateReview(Review review);
	
	public void deleteReview(int review_id);
	
	public List<Review> searchByVideoId(String video_id);
	
	public Review selectOne(int review_id);
	
	public User selectUser(String user_id);
}

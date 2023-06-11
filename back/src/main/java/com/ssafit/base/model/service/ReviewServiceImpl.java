package com.ssafit.base.model.service;

import java.util.List;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.ssafit.base.model.dao.videoDao.ReviewDao;
import com.ssafit.base.model.dto.videoDto.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	private static final Logger logger = LoggerFactory.getLogger(VideoServiceImpl.class);
	
	@Autowired
	ResourceLoader resLoader;
	
	private ReviewDao reviewDao;
	
	@Autowired
	public void setRepo(ReviewDao reviewdao) {
		this.reviewDao = reviewdao;
	}

	@Override
	public void registReview(Review review) {
		reviewDao.registReview(review);
	}

	@Override
	public void updateReview(Review review) {
		reviewDao.updateReview(review);
	}

	@Override
	public void deleteReview(int review_id) {
		reviewDao.deleteReview(review_id);
	}

	@Override
	public Review selectOne(int review_id) {
		return reviewDao.selectOne(review_id);
	}

	@Override
	public List<Review> searchByVideoId(String video_id) {
		return reviewDao.searchByVideoId(video_id);
	}

//	@Override
//	public boolean isAuthor(int review_id, String user_id) {
//	    // Get the review from the database using the reviewId
//	    Review review = reviewDao.selectOne(review_id);
//	    
//	    // Check if the review exists
//	    if (review == null) {
//	        throw new Exception("Review not found");
//	    }
//
//	    // Return true if the userId matches the author of the review, false otherwise
//	    return reviewDao.selectUser(user_id).equals(user_id);
//	}


}

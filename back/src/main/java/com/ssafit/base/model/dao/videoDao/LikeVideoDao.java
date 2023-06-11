package com.ssafit.base.model.dao.videoDao;

import java.util.List;

import com.ssafit.base.model.dto.videoDto.LikeVideo;
import com.ssafit.base.model.dto.videoDto.Video;

public interface LikeVideoDao {
	
	//좋아요 개수
	List<LikeVideo> HowManyLike(String video_id);
	
	void addLikeVideo(LikeVideo likevideo);
	
	void deleteLikeVideo(String video_id, String user_id);
	
	List<Video> selectLikeVideo(String user_id);
	
}

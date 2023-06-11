package com.ssafit.base.model.service;

import java.util.List;

import com.ssafit.base.model.dto.videoDto.LikeVideo;
import com.ssafit.base.model.dto.videoDto.Video;

public interface LikeVideoService {
	List<LikeVideo> countVideoLike(String video_id);
	
	void addLikeVideo(LikeVideo likevideo);
	
	void deleteLikeVideo(String video_id, String user_id);
	
	List<Video> getLikeVideo(String user_id);
}

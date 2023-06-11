package com.ssafit.base.model.dao.videoDao;

import java.util.List;

import com.ssafit.base.model.dto.videoDto.Video;

public interface VideoDao {
	public List<Video> selectAll();
	
	public Video selectOneVideo(String video_id);
	
	public List<Video> selectByPart(String category);
	
	public void updateVideoViewCnt(String video_id);
}

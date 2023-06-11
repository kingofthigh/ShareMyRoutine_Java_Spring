package com.ssafit.base.model.service;

import java.util.List;

import com.ssafit.base.model.dto.videoDto.Video;

public interface VideoService {
	public Video selectOneVideo(String video_id);
	
	public List<Video> selectByCategory(String category);
	
	public List<Video> selectAll();
	
	public void addVideoViewCnt(String video_id);
}

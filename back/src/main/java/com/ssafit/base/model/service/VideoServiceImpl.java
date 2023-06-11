package com.ssafit.base.model.service;

import java.util.List;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.ssafit.base.model.dao.videoDao.VideoDao;
import com.ssafit.base.model.dto.videoDto.Video;
import com.ssafit.base.model.service.VideoServiceImpl;

@Service
public class VideoServiceImpl implements VideoService{
private static final Logger logger = LoggerFactory.getLogger(VideoServiceImpl.class);
	
	@Autowired
	ResourceLoader resLoader;
	
	private VideoDao videoDao;
	
	@Autowired
	public void setRepo(VideoDao dao) {
		this.videoDao = dao;
	}
	
	@Override
	public Video selectOneVideo(String video_id) {
		// TODO Auto-generated method stub
		videoDao.updateVideoViewCnt(video_id);
		return videoDao.selectOneVideo(video_id);
	}

	@Override
	public List<Video> selectByCategory(String category) {
		// TODO Auto-generated method stub
		return videoDao.selectByPart(category);
	}

	@Override
	public List<Video> selectAll() {
		// TODO Auto-generated method stub
		return videoDao.selectAll();
	}

	@Override
	public void addVideoViewCnt(String video_id) {
		videoDao.updateVideoViewCnt(video_id);
	}
}

package com.ssafit.base.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafit.base.model.dao.videoDao.LikeVideoDao;
import com.ssafit.base.model.dto.videoDto.LikeVideo;
import com.ssafit.base.model.dto.videoDto.Video;


@Service
public class LikeVideoServiceImpl implements LikeVideoService {
	
	@Autowired
	private LikeVideoDao lvDao;

	@Override
	public List<LikeVideo> countVideoLike(String video_id) {
        return lvDao.HowManyLike(video_id);
    }

	@Override
	public void addLikeVideo(LikeVideo likevideo) {
		lvDao.addLikeVideo(likevideo);
	}

	@Override
	public void deleteLikeVideo(String user_id, String video_id) {
		lvDao.deleteLikeVideo(user_id, video_id);
	}
	
	@Override
	public List<Video> getLikeVideo(String user_id) {
		// TODO Auto-generated method stub
		return lvDao.selectLikeVideo(user_id);
	}
	
}

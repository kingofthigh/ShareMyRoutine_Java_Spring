package com.ssafit.base.model.service;

import java.util.List;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.ssafit.base.model.dao.postDao.PostDao;
import com.ssafit.base.model.dto.postDto.Post;


@Service
public class PostServiceImpl implements PostService{
	private static final Logger logger = LoggerFactory.getLogger(VideoServiceImpl.class);

	@Autowired
	ResourceLoader resLoader;
	
	private PostDao postDao;
	
	@Autowired
	public void setRepo(PostDao postDao) {
		this.postDao = postDao;
	}
	
	@Override
	public void registPost(Post post) {
		postDao.registPost(post);
	}

	@Override
	public void updatePost(Post post) {
		postDao.updatePost(post);
	}

	@Override
	public void deletePost(int post_id) {
		postDao.deletePost(post_id);
	}

	@Override
	public List<Post> selectAllPost() {
		return postDao.selectAllPost();
	}


	@Override
	public List<Post> selectPostByUserId(String user_id) {
		// TODO Auto-generated method stub
		return postDao.selectPostByUserId(user_id);
	}

	@Override
	public List<Post> selectPostMyFollow(String user_id) {
		// TODO Auto-generated method stub
		return postDao.selectPostMyFollow(user_id);
	}

	@Override
	public Post selectPostByPostId(int post_id) {
		// TODO Auto-generated method stub
		return postDao.selectPostByPostId(post_id);
	}
	
}

package com.ssafit.base.model.service;

import java.util.List;

import com.ssafit.base.model.dto.postDto.Post;

public interface PostService {
	public void registPost(Post post);
	
	public void updatePost(Post post);
	
	public void deletePost(int post_id);
	
	public List<Post> selectAllPost();
	
	public List<Post> selectPostByUserId(String user_id);
	
	public Post selectPostByPostId(int post_id);
	
	public List<Post> selectPostMyFollow(String user_id);
}

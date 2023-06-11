package com.ssafit.base.controller.userController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafit.base.model.dto.postDto.Post;
import com.ssafit.base.model.service.PostService;

@RestController
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostService pService;
	
	@PutMapping("/update")
	public ResponseEntity<Void> postUpdate(@RequestBody Post post){
		pService.updatePost(post);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	@DeleteMapping("/{post_id}")
	public ResponseEntity<Void> postDelete(@PathVariable int post_id){
		pService.deletePost(post_id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	@GetMapping("/postlist")
	public ResponseEntity<List<Post>> getAllPost(){
		return new ResponseEntity<List<Post>>(pService.selectAllPost(), HttpStatus.OK);
	}
	@GetMapping("/posts/{user_id}")
	public ResponseEntity<List<Post>> getPostByUserId(@PathVariable String user_id){
		return new ResponseEntity<List<Post>>(pService.selectPostByUserId(user_id), HttpStatus.OK);
	}
	@GetMapping("/postlist/{post_id}")
	public ResponseEntity<Post> getPostByPostId(@PathVariable int post_id){
		Post post = pService.selectPostByPostId(post_id);
		
		return new ResponseEntity<Post>(post, HttpStatus.OK);
	}
	
	@GetMapping("/postList/follow/{user_id}")
	public ResponseEntity<List<Post>> getPostByFollow(@PathVariable String user_id){
		return new ResponseEntity<List<Post>>(pService.selectPostMyFollow(user_id), HttpStatus.OK);
	}
}

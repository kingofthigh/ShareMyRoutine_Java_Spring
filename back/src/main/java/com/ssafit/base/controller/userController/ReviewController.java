package com.ssafit.base.controller.userController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafit.base.model.dto.videoDto.Review;
import com.ssafit.base.model.service.ReviewService;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService rService;
	
	@PostMapping("/regist")
	public ResponseEntity<Void> reviewRegist(@RequestBody Review review) {
		rService.registReview(review);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@DeleteMapping("/{review_id}")
	public ResponseEntity<Void> reviewDelete(@PathVariable int review_id){
		rService.deleteReview(review_id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@ApiIgnore
	@PutMapping("/update")
	public ResponseEntity<Void> reviewUpdate(@RequestBody Review review){
		rService.updateReview(review);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}

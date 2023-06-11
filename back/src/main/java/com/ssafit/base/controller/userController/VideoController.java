package com.ssafit.base.controller.userController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.videoDto.LikeVideo;
import com.ssafit.base.model.dto.videoDto.Review;
import com.ssafit.base.model.dto.videoDto.Video;
import com.ssafit.base.model.service.LikeVideoService;
import com.ssafit.base.model.service.ReviewService;
import com.ssafit.base.model.service.UserService;
import com.ssafit.base.model.service.VideoService;


@RestController
@RequestMapping("/video")
public class VideoController {
	@Autowired
	private VideoService vService;
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
    private LikeVideoService lvService;
	
	@Autowired
    private UserService uService;
	
	@GetMapping("/")
	public ResponseEntity<?> showVideo(){
		List<Video> videos = vService.selectAll();
		return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);
	}
	
	@GetMapping("/video")
	public ResponseEntity<?> indexPage(@RequestParam String user_id){
		List<Video> videos = vService.selectAll();
		List<Video> Cvideos = new ArrayList<>();
		User user=uService.getId(user_id);
		for (int i = 0; i < videos.size(); i++) {
	        if (user.getGoal().equals(videos.get(i).getCategory())) {
	            Cvideos.add(videos.get(i));
	        }
	    }
		for (int i = 0; i < videos.size(); i++) {
			if (user.getGrowpart().equals(videos.get(i).getCategory())) {
				Cvideos.add(videos.get(i));
			}
		}
		return new ResponseEntity<List<Video>>(Cvideos, HttpStatus.OK);
	}
	
	@GetMapping("/detail/{video_id}")
	public ResponseEntity<?> videoDetail(@PathVariable String video_id){
		Video video = vService.selectOneVideo(video_id);
		return new ResponseEntity<Video>(video, HttpStatus.OK);
	}
	@GetMapping("/detail/review/{video_id}")
	public ResponseEntity<?> videoReview(@PathVariable String video_id){
		List<Review> reviews = new ArrayList<Review>();
        
        reviews = rService.searchByVideoId(video_id);
		return new ResponseEntity<List<Review>>(reviews, HttpStatus.OK);
	}
	@GetMapping("/{category}")
	public ResponseEntity<?> videoCategory(@PathVariable String category){
		List<Video> partVideos = vService.selectByCategory(category);
		return new ResponseEntity<List<Video>>(partVideos, HttpStatus.OK);
	}
	
	@GetMapping("/detail/like/{video_id}")
    public ResponseEntity<List<LikeVideo>> videoLike(@PathVariable String video_id){
        List<LikeVideo> LikeVideo = lvService.countVideoLike(video_id);
        return new ResponseEntity<List<LikeVideo>>(LikeVideo, HttpStatus.OK);
    }
	
	@PutMapping("/updateViewCnt/{video_id}")
	public ResponseEntity<?> increaseViewCount(@PathVariable String video_id){
	    vService.addVideoViewCnt(video_id);
	    return new ResponseEntity<>(HttpStatus.OK);
	}
}

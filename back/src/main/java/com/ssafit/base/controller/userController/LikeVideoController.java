package com.ssafit.base.controller.userController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafit.base.model.dto.videoDto.LikeVideo;
import com.ssafit.base.model.dto.videoDto.Video;
import com.ssafit.base.model.service.LikeVideoService;

@RestController
@RequestMapping("/video/like")
public class LikeVideoController {
	@Autowired
	private LikeVideoService lvService;
	
	@PostMapping("/addlike")
	public ResponseEntity<Void> addVideoLike(@RequestBody LikeVideo likevideo) {
		lvService.addLikeVideo(likevideo);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@DeleteMapping("/{video_id}")
	public ResponseEntity<Void> deleteVideoLike(@RequestBody LikeVideo likevideo) {
		lvService.deleteLikeVideo(likevideo.getVideo_id(), likevideo.getUser_id());
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@GetMapping("/{user_id}")
    public List<Video> getLikedVideos(@PathVariable String user_id) {
        return lvService.getLikeVideo(user_id);
    }
}

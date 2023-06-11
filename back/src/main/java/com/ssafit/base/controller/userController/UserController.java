package com.ssafit.base.controller.userController;

import com.ssafit.base.model.dto.userDto.Follow;
import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.userDto.WeightTracker;
import com.ssafit.base.model.service.UserService;
import com.ssafit.base.util.JwtUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private JwtUtil jwtUtil;
	
	private static final String SUCCESS="success";
	private static final String FAIL = "fail";

    private final UserService userService;

    @Autowired
    public UserController(@RequestBody UserService userService) {
        this.userService = userService;
    }
    
    @PostMapping("/regist")

    public ResponseEntity<Void> signup(@RequestBody User user) {
        User newUser = user;
        List<User> users = userService.getUserList();
        
        String pattern = "^[a-zA-Z0-9]*$";
        // newUser.getUser_id()가 null인지 확인
        if (newUser.getUser_id() == null || !newUser.getUser_id().matches(pattern)) {
            // 특수 기호가 포함된 경우 또는 newUser.getUser_id()가 null인 경우
            return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
        }
        
        for(User u : users) {
            if(u.getUser_id().equals(newUser.getUser_id())) {
                return new ResponseEntity<Void>(HttpStatus.CONFLICT);
            }
        }
        userService.registUser(user);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }


    @GetMapping("/list")
    public ResponseEntity<List<User>> getUserList() {
        return ResponseEntity.ok(userService.getUserList());
    }

    @GetMapping("/follower/{user_id}")
    public ResponseEntity<List<User>> getFollowerList(@PathVariable String user_id) {
        return ResponseEntity.ok(userService.findFollowerList(user_id));
    }

    @GetMapping("/following/{user_id}")
    public ResponseEntity<List<User>> getFollowingList(@PathVariable String user_id) {
        return ResponseEntity.ok(userService.findFollowingList(user_id));
    }

    @PostMapping("/follow")
    public ResponseEntity<Void> addFollow(@RequestBody Follow follow) {
        userService.addFollow(follow);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/removefollow")
    public ResponseEntity<Void> removeFollow(@RequestBody Follow follow) {
        userService.removeFollow(follow);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{user_id}")
    public ResponseEntity<User> getUser(@PathVariable String user_id) {
        return ResponseEntity.ok(userService.getId(user_id));
    }	

    @PutMapping("/update")
    public ResponseEntity<Boolean> updateUser(@RequestBody User user, HttpServletRequest request) {
    	User modifiedUser = user;
    	
    	String requestUrl = request.getRequestURL().toString();
    	
    	User before = userService.getId(modifiedUser.getUser_id());
    	if(modifiedUser.getWeight() != before.getWeight()) {
    		userService.registUserWeight(modifiedUser);
    		userService.modifyUser(modifiedUser);
    		if(requestUrl.contains("mypage"))
    			return new ResponseEntity<Boolean>(false, HttpStatus.OK);
    		else
    			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
    	}
        userService.modifyUser(modifiedUser);

        return new ResponseEntity<Boolean>(false, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{user_id}")
    public ResponseEntity<Void> deleteUser(@PathVariable String user_id) {
        userService.removeUser(user_id);
        return ResponseEntity.ok().build();
    }
    
    @PostMapping("/track")
    public ResponseEntity<Void> registUserWeight(User user) {
    	userService.registUserWeight(user);
    	return ResponseEntity.ok().build();
    }
    
    @GetMapping("/track/{user_id}")
    public ResponseEntity<List<WeightTracker>> searchWeight(@PathVariable String user_id) {
    	List<WeightTracker> weights = userService.searchUserWeight(user_id);
    	System.out.println("222");
    	return new ResponseEntity<List<WeightTracker>>(weights, HttpStatus.OK);
    }
    
    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		HttpStatus status=null;
		
//		System.out.println(user.toString());
//		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		//user를 이용해서 Service->Dao->MySQL DB를 통해 실제 유저인지 확인을 해야한다.
		try {
			User authenticatedUser = userService.login(user.getUser_id(), user.getUser_password());
			if (authenticatedUser != null) {
				result.put("access-token", jwtUtil.createToken("user_id", user.getUser_id()));
				result.put("message", SUCCESS);
				status=HttpStatus.ACCEPTED;
			}else {
				result.put("message", FAIL);
				status=HttpStatus.NO_CONTENT;
			}
		} catch (UnsupportedEncodingException e) {
			result.put("message", FAIL);
			status=HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String,Object>>(result,status);
	}
}

package com.ssafit.base.model.service;

import java.util.List;

import com.ssafit.base.model.dto.userDto.Follow;
import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.userDto.WeightTracker;

public interface UserService {
	
	void registUser(User user);
	
	//모든 회원 불러오기
	List<User> getUserList();
	
	//팔로워 찾기
	List<User> findFollowerList(String user_id);
	
	//팔로잉 찾기
	List<User> findFollowingList(String user_id);
	
	//팔로우
	void addFollow(Follow follow);
	
	//언팔로우
	void removeFollow(Follow follow);
	
	//아이디 찾기
	User getId(String user_id);
	
	//로그인
	User login(String user_id, String user_password);
	
	//회원 정보 수정
	void modifyUser(User user);
	
	//회원 탈퇴
	void removeUser(String user_id);
	
	void registUserWeight(User user);
	
	List<WeightTracker> searchUserWeight(String user_id);

}

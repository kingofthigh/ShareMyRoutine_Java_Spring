package com.ssafit.base.model.dao.userDao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.userDto.WeightTracker;
import com.ssafit.base.model.dto.userDto.Follow;

public interface UserDao {
	//모든 회원 불러오기
	List<User> selectList();
	
	//팔로워 찾기
	List<User> selectFollowerList(String user_id);
	
	//팔로잉 찾기
	List<User> selectFollowingList(String user_id);
	
	//팔로우
	void insertFollow(Follow follow);
	
	//언팔로우
	void deleteFollow(Follow follow);
	
	//회원 아이디 찾기
	User selectId(String user_id);
	
	//회원 정보 수정
	void updateUser(User user);
	
	//회원 탈퇴
	void deleteUser(String user_id);
	
	
	void registWeight(User user);
	
	//체중 변화
	List<WeightTracker> searchWeight(String user_id);
	
	//회원 가입
	void insertUser(User user);
}

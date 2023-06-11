package com.ssafit.base.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafit.base.model.dao.userDao.UserDao;
import com.ssafit.base.model.dto.userDto.Follow;
import com.ssafit.base.model.dto.userDto.User;
import com.ssafit.base.model.dto.userDto.WeightTracker;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	//모든 user 불러오기
	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return userDao.selectList();
	}

	//팔로워하는 사람 찾기
	@Override
	public List<User> findFollowerList(String user_id) {
		// TODO Auto-generated method stub
		return userDao.selectFollowerList(user_id);
	}

	//팔로잉하는 사람 찾기
	@Override
	public List<User> findFollowingList(String user_id) {
		// TODO Auto-generated method stub
		return userDao.selectFollowingList(user_id);
	}

	//팔로우하기
	@Override
	public void addFollow(Follow follow) {
		userDao.insertFollow(follow);
	}

	//언팔하기
	@Override
	public void removeFollow(Follow follow) {
		userDao.deleteFollow(follow);
	}

	//아이디 찾아오기
	@Override
	public User getId(String user_id) {
		// TODO Auto-generated method stub
		return userDao.selectId(user_id);
	}

	//로그인
	@Override
	public User login(String user_id, String user_password) {
		User user = userDao.selectId(user_id);
		if(user==null) System.out.println("adf");
		if(user != null && user.getUser_password().equals(user_password)) {
			return user;
		}
			return null;
	}	
	
	//회원 정보 수정
	@Override
	public void modifyUser(User user) {
		userDao.updateUser(user);
	}

	//회원 탈퇴
	@Override
	public void removeUser(String user_id) {
		userDao.deleteUser(user_id);
	}

	@Override
	public void registUserWeight(User user) {
		userDao.registWeight(user);
	}

	@Override
	public List<WeightTracker> searchUserWeight(String user_id) {
		List<WeightTracker> weightTrack = userDao.searchWeight(user_id);
		return weightTrack;
	}

	@Override
	public void registUser(User user) {
		userDao.insertUser(user);
	}

}

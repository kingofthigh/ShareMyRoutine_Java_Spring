package com.ssafit.base.model.dao.workoutDao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import com.ssafit.base.model.dto.postDto.Post;
import com.ssafit.base.model.dto.workoutDto.Exercise;
import com.ssafit.base.model.dto.workoutDto.Set;
import com.ssafit.base.model.dto.workoutDto.WorkPage;

public interface WorkOutDao {
	//운동 페이지 작성
	void makeWorkOutPage(WorkPage workpage);
	
	//운동 페이지 찾기
	WorkPage getWorkPage(int workpage_id);
	
	//운동 페이지 목록 불러오기
	
	List<WorkPage> selectWorkPage(String user_id);
	
	//운동 목록 불러오기
	List<Exercise> selectAllExercise();
	
	//이름으로 운동 불러오기
	List<Exercise> selectExerciseByPart(int part_id);
	
	//세트 수 만들기
	void makeSet(Set set);
	
	//세트 찾기
	List<Set> searchSet(int page_id);
	
	//글 쓰기
	void makePost(Post post);
	
	//날짜 찾기
	HashMap<String, Integer> searchPartWeek(LocalDateTime today);
}

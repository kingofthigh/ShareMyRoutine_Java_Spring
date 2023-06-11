package com.ssafit.base.model.service;

import java.util.List;

import com.ssafit.base.model.dto.postDto.Post;
import com.ssafit.base.model.dto.workoutDto.Exercise;
import com.ssafit.base.model.dto.workoutDto.Set;
import com.ssafit.base.model.dto.workoutDto.WorkPage;

public interface WorkOutService {
	//운동 페이지 작성
		void makeWorkOutPage(WorkPage workpage);
		
		WorkPage findWorkPage(int workpage_id);
		
		List<WorkPage> selectWorkPage(String user_id);
		
		//운동 목록 불러오기
		List<Exercise> selectAllExercise();
		
		//이름으로 운동 불러오기
		List<Exercise> getExerciseByPart(int part_id);
		
		//세트 수 만들기
		void makeSet(Set set);
		
		//세트 찾기
		List<Set> searchSet(int page_id);
		
		//글 쓰기
		void makePost(Post post);
}

package com.ssafit.base.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafit.base.model.dao.workoutDao.WorkOutDao;
import com.ssafit.base.model.dto.postDto.Post;
import com.ssafit.base.model.dto.workoutDto.Exercise;
import com.ssafit.base.model.dto.workoutDto.Set;
import com.ssafit.base.model.dto.workoutDto.WorkPage;

@Service
public class WorkOutServiceImpl implements WorkOutService {

	@Autowired
	private WorkOutDao WorkOutdao;
	
	@Override
	public void makeWorkOutPage(WorkPage workpage) {
		WorkOutdao.makeWorkOutPage(workpage);
	}

	@Override
	public List<Exercise> selectAllExercise() {
		// TODO Auto-generated method stub
		return WorkOutdao.selectAllExercise();
	}

	@Override
	public List<Exercise> getExerciseByPart(int part_id) {
		return WorkOutdao.selectExerciseByPart(part_id);
	}

	@Override
	public void makeSet(Set set) {
		WorkOutdao.makeSet(set);
	}

	@Override
	public List<Set> searchSet(int page_id) {
		// TODO Auto-generated method stub
		return WorkOutdao.searchSet(page_id);
	}

	@Override
	public void makePost(Post post) {
		WorkOutdao.makePost(post);
	}

	@Override
	public List<WorkPage> selectWorkPage(String user_id) {
		return WorkOutdao.selectWorkPage(user_id);
	}

	@Override
	public WorkPage findWorkPage(int workpage_id) {
		// TODO Auto-generated method stub
		return WorkOutdao.getWorkPage(workpage_id);
	}

}

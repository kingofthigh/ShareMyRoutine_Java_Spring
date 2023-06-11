package com.ssafit.base.model.dto.workoutDto;

public class Set {
	private int page_id;
	private int exercise_id;
	private int reps;
	private float weight;
	
	public Set() {
		// TODO Auto-generated constructor stub
	}
	
	public Set(int page_id, int exercise_id, int reps) {
		super();
		this.page_id = page_id;
		this.exercise_id = exercise_id;
		this.reps = reps;
	}

	public int getPage_id() {
		return page_id;
	}

	public void setPage_id(int page_id) {
		this.page_id = page_id;
	}

	public int getExercise_id() {
		return exercise_id;
	}

	public void setExercise_id(int exercise_id) {
		this.exercise_id = exercise_id;
	}

	public int getReps() {
		return reps;
	}

	public void setReps(int reps) {
		this.reps = reps;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	@Override
	public String toString() {
		return "Set [page_id=" + page_id + ", exercise_id=" + exercise_id + ", reps=" + reps + ", weight=" + weight
				+ "]";
	}
	
	
}

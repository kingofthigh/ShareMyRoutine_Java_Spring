package com.ssafit.base.model.dto.workoutDto;

public class Exercise {
	private int exercise_id;
	private String exercise_name;
	private int part_id;
	
	public Exercise() {
		// TODO Auto-generated constructor stub
	}

	public Exercise(int exercise_id, String exercise_name, int part_id) {
		super();
		this.exercise_id = exercise_id;
		this.exercise_name = exercise_name;
		this.part_id = part_id;
	}

	public int getExercise_id() {
		return exercise_id;
	}

	public void setExercise_id(int exercise_id) {
		this.exercise_id = exercise_id;
	}

	public String getExercise_name() {
		return exercise_name;
	}

	public void setExercise_name(String exercise_name) {
		this.exercise_name = exercise_name;
	}

	public int getPart_id() {
		return part_id;
	}

	public void setPart_id(int part_id) {
		this.part_id = part_id;
	}

	@Override
	public String toString() {
		return "Exercise [exercise_id=" + exercise_id + ", exercise_name=" + exercise_name + ", part_id=" + part_id
				+ "]";
	}
	
}

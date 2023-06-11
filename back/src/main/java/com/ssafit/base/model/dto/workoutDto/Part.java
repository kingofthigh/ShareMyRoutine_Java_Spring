package com.ssafit.base.model.dto.workoutDto;

public class Part {
	private int part_id;
	private String part_name;
	
	public Part() {
		// TODO Auto-generated constructor stub
	}

	public Part(int part_id, String part_name) {
		super();
		this.part_id = part_id;
		this.part_name = part_name;
	}

	public int getPart_id() {
		return part_id;
	}

	public void setPart_id(int part_id) {
		this.part_id = part_id;
	}

	public String getPart_name() {
		return part_name;
	}

	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}

	@Override
	public String toString() {
		return "Part [part_id=" + part_id + ", part_name=" + part_name + "]";
	}
	
}

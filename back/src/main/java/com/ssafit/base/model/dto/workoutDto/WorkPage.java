package com.ssafit.base.model.dto.workoutDto;

import java.time.LocalDateTime;

public class WorkPage {
	private int workpage_id;
	private String user_id;
	private LocalDateTime created_date;
	private String memo;
	private int part_id;
	
	public WorkPage() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPart_id() {
		return part_id;
	}

	public void setPart_id(int part_id) {
		this.part_id = part_id;
	}

	public int getWorkpage_id() {
		return workpage_id;
	}

	public void setWorkpage_id(int workpage_id) {
		this.workpage_id = workpage_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public LocalDateTime getCreated_date() {
		return created_date;
	}

	public void setCreated_date(LocalDateTime created_date) {
		this.created_date = created_date;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "WorkPage [workpage_id=" + workpage_id + ", user_id=" + user_id + ", created_date=" + created_date
				+ ", memo=" + memo + "]";
	}
	
}

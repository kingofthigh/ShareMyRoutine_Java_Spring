package com.ssafit.base.model.dto.userDto;

import java.time.LocalDateTime;

public class WeightTracker {
	private int weightTracker;
	private String user_id;
	private int weight;
	private LocalDateTime created_date;
	
	public WeightTracker() {
		// TODO Auto-generated constructor stub
	}

	public WeightTracker(int weightTracker, String user_id, int weight, LocalDateTime created_date) {
		super();
		this.weightTracker = weightTracker;
		this.user_id = user_id;
		this.weight = weight;
		this.created_date = created_date;
	}

	public int getWeightTracker() {
		return weightTracker;
	}

	public void setWeightTracker(int weightTracker) {
		this.weightTracker = weightTracker;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public LocalDateTime getCreated_date() {
		return created_date;
	}

	public void setCreated_date(LocalDateTime created_date) {
		this.created_date = created_date;
	}

	@Override
	public String toString() {
		return "WeightTracker [weightTracker=" + weightTracker + ", user_id=" + user_id + ", weight=" + weight
				+ ", created_date=" + created_date + "]";
	}
	
}

package com.ssafit.base.model.dto.mealDto;

import java.time.LocalDateTime;

public class Meal {
	private int meal_id;
	private String user_id;
	private LocalDateTime created_date;
	private float meal_carbo;
	private float meal_protein;
	private float meal_fat;
	
	public Meal() {
		// TODO Auto-generated constructor stub
	}

	public Meal(int meal_id, String user_id, LocalDateTime created_date, float meal_carbo, float meal_protein,
			float meal_fat) {
		super();
		this.meal_id = meal_id;
		this.user_id = user_id;
		this.created_date = created_date;
		this.meal_carbo = meal_carbo;
		this.meal_protein = meal_protein;
		this.meal_fat = meal_fat;
	}

	public int getMeal_id() {
		return meal_id;
	}

	public void setMeal_id(int meal_id) {
		this.meal_id = meal_id;
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

	public float getMeal_carbo() {
		return meal_carbo;
	}

	public void setMeal_carbo(float meal_carbo) {
		this.meal_carbo = meal_carbo;
	}

	public float getMeal_protein() {
		return meal_protein;
	}

	public void setMeal_protein(float meal_protein) {
		this.meal_protein = meal_protein;
	}

	public float getMeal_fat() {
		return meal_fat;
	}

	public void setMeal_fat(float meal_fat) {
		this.meal_fat = meal_fat;
	}

	@Override
	public String toString() {
		return "Meal [meal_id=" + meal_id + ", user_id=" + user_id + ", created_date=" + created_date + ", meal_carbo="
				+ meal_carbo + ", meal_protein=" + meal_protein + ", meal_fat=" + meal_fat + "]";
	}
	
}

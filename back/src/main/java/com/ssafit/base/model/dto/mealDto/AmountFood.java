package com.ssafit.base.model.dto.mealDto;

public class AmountFood {
	private int food_id;
	private int meal_id;
	private float amount;
	
	public AmountFood() {
		// TODO Auto-generated constructor stub
	}

	public AmountFood(int food_id, int meal_id, float amount) {
		super();
		this.food_id = food_id;
		this.meal_id = meal_id;
		this.amount = amount;
	}

	public int getFood_id() {
		return food_id;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}

	public int getMeal_id() {
		return meal_id;
	}

	public void setMeal_id(int meal_id) {
		this.meal_id = meal_id;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "AmountFood [food_id=" + food_id + ", meal_id=" + meal_id + ", amount=" + amount + "]";
	}
	
}

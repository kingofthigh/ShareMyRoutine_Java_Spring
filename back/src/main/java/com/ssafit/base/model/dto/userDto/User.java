package com.ssafit.base.model.dto.userDto;

public class User {
    private String user_id;
    private String user_password;
    private String gender;
    private int career;
    private float height;
    private float weight;
    private String email;
    private String goal;
    private String growpart;
    private float smm;
    
    public User() {
        // TODO Auto-generated constructor stub
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getCareer() {
        return career;
    }

    public void setCareer(int career) {
        this.career = career;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getEmail() {
        return email;
    }

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getGrowpart() {
		return growpart;
	}

	public void setGrowpart(String growpart) {
		this.growpart = growpart;
	}

	public float getSmm() {
		return smm;
	}

	public void setSmm(float smm) {
		this.smm = smm;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_password=" + user_password + ", gender=" + gender + ", career="
				+ career + ", height=" + height + ", weight=" + weight + ", email=" + email + ", goal=" + goal
				+ ", growpart=" + growpart + ", smm=" + smm + "]";
	}
}


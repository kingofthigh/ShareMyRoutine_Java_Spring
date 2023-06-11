package com.ssafit.base.model.dto.userDto;

public class Follow {
	private String following;
	private String follower;
	
	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(String following, String follower) {
		super();
		this.following = following;
		this.follower = follower;
	}
	

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	@Override
	public String toString() {
		return "Follow [following=" + following + ", follower=" + follower + "]";
	}
	
}

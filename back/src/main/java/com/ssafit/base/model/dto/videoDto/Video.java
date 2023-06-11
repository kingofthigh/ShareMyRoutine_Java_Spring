package com.ssafit.base.model.dto.videoDto;

public class Video {
	private String video_id;
	private String video_title;
	private String channel_name;
	private int view_cnt;
	private String category;
	
	public Video() {
		// TODO Auto-generated constructor stub
	}

	public Video(String video_id, String video_title, String channel_name, int view_cnt, String category) {
		super();
		this.video_id = video_id;
		this.video_title = video_title;
		this.channel_name = channel_name;
		this.view_cnt = view_cnt;
		this.category = category;
	}

	public String getVideo_id() {
		return video_id;
	}

	public void setVideo_id(String video_id) {
		this.video_id = video_id;
	}

	public String getVideo_title() {
		return video_title;
	}

	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}

	public String getChannel_name() {
		return channel_name;
	}

	public void setChannel_name(String channel_name) {
		this.channel_name = channel_name;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Video [video_id=" + video_id + ", video_title=" + video_title + ", channel_name=" + channel_name
				+ ", view_cnt=" + view_cnt + ", category=" + category + "]";
	}
	
}

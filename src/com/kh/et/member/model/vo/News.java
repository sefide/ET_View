package com.kh.et.member.model.vo;

public class News {
	private String name;
	private String title;
	private String type;//좋아요, 스크랩
	
	public News() {}

	public News(String name, String title, String type) {
		super();
		this.name = name;
		this.title = title;
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "News [name=" + name + ", title=" + title + ", type=" + type + "]";
	}
	
	
	

}

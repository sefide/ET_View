package com.kh.et.board.model.vo;

public class BoardInterest {
	
	private int biNo; //글 관심 번호
	private String writer; //글 작성자
	private int bno; // 글 번호
	private int user; //사용자
	private String biType; 
	private int bwriter ; 

	public BoardInterest() {}

	






	public int getBwriter() {
		return bwriter;
	}








	public void setBwriter(int bwriter) {
		this.bwriter = bwriter;
	}








	@Override
	public String toString() {
		return "BoardInterest [biNo=" + biNo + ", writer=" + writer + ", bno=" + bno + ", user=" + user + ", biType="
				+ biType + ", bwriter=" + bwriter + "]";
	}








	public BoardInterest(int biNo, String writer, int bno, int user, String biType, int bwriter) {
		super();
		this.biNo = biNo;
		this.writer = writer;
		this.bno = bno;
		this.user = user;
		this.biType = biType;
		this.bwriter = bwriter;
	}








	public int getBiNo() {
		return biNo;
	}

	public void setBiNo(int biNo) {
		this.biNo = biNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public String getBiType() {
		return biType;
	}

	public void setBiType(String biType) {
		this.biType = biType;
	}

	public void setWriter(int bwriter) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}




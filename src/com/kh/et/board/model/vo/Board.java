package com.kh.et.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable {
	private int bNo; // 글번호
	private String btitle; // 글제목
	private String bWriter; // 글작성자
	private String bContent; // 글 내용
	private Date bDate; // 글 작성일
	private String bCheckBest; // 베스트 댓글 여부
	private String bStatus; // 글 상태
	private String bType; // 글 종류(레벨-글 or 댓글)
	private String bRefNo; // 참조 글 번호(댓글일 경유)

	public Board() {
	}

	public Board(int bNo, String btitle, String bWriter, String bContent, Date bDate, String bCheckBest, String bStatus,
			String bType, String bRefNo) {
		super();
		this.bNo = bNo;
		this.btitle = btitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bCheckBest = bCheckBest;
		this.bStatus = bStatus;
		this.bType = bType;
		this.bRefNo = bRefNo;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", btitle=" + btitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bDate=" + bDate + ", bCheckBest=" + bCheckBest + ", bStatus=" + bStatus + ", bType=" + bType
				+ ", bRefNo=" + bRefNo + "]";
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbCheckBest() {
		return bCheckBest;
	}

	public void setbCheckBest(String bCheckBest) {
		this.bCheckBest = bCheckBest;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbRefNo() {
		return bRefNo;
	}

	public void setbRefNo(String bRefNo) {
		this.bRefNo = bRefNo;
	}

}

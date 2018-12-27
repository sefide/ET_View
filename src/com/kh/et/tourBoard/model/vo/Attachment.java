package com.kh.et.tourBoard.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable{
	private int ano;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String aType;
	private int atno;
	private int actno;
	private int anno;
	
	public Attachment() {}

	public Attachment(int ano, String originName, String changeName, String filePath, Date uploadDate, String aType,
			int atno, int actno, int anno) {
		super();
		this.ano = ano;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.aType = aType;
		this.atno = atno;
		this.actno = actno;
		this.anno = anno;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getaType() {
		return aType;
	}

	public void setaType(String aType) {
		this.aType = aType;
	}

	public int getAtno() {
		return atno;
	}

	public void setAtno(int atno) {
		this.atno = atno;
	}

	public int getActno() {
		return actno;
	}

	public void setActno(int actno) {
		this.actno = actno;
	}

	public int getAnno() {
		return anno;
	}

	public void setAnno(int anno) {
		this.anno = anno;
	}

	@Override
	public String toString() {
		return "Attachment [ano=" + ano + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", aType=" + aType + ", atno=" + atno + ", actno=" + actno
				+ ", anno=" + anno + "]";
	}
	
	
}

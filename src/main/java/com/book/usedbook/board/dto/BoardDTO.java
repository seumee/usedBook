package com.book.usedbook.board.dto;

import java.sql.Date;

public class BoardDTO {
	private String bookName;
	private int price;
	private int state;
	private Date regDate;
	private int quality;
	private int partitionNum;	
	private String phone;
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
	public int getPartitionNum() {
		return partitionNum;
	}
	public void setPartitionNum(int partitionNum) {
		this.partitionNum = partitionNum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}

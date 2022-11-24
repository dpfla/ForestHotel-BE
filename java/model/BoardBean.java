package model;

import java.sql.Date;

public class BoardBean {
	private int articleNo;
	private String title;
	private String content;
	private Date writeDate;
	
	public BoardBean() {
		// TODO Auto-generated constructor stub
	}

	public BoardBean(int articleNo, String title, String content) {
		this.title = title;
		this.content = content;
		this.articleNo = articleNo;
		
	}
	public BoardBean(int articleNo, String title, String content, Date writeDate) {
		this(articleNo, title, content);
		this.writeDate = writeDate;
	}
	
	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
}

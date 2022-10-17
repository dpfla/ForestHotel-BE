package model;

import java.sql.Date;

public class MemberBean {
	private int num;
	private String id;
	private String password;
	private String name;
	private Date birth;
	private int tel;
	private String email;
	private String receiveemail;
	private String receivesms;
	private Date joinDate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReceiveemail() {
		return receiveemail;
	}
	public void setReceiveemail(String receiveemail) {
		this.receiveemail = receiveemail;
	}
	public String getReceivesms() {
		return receivesms;
	}
	public void setReceivesms(String receivesms) {
		this.receivesms = receivesms;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
}

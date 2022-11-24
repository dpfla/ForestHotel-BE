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
	
	public MemberBean() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberBean(String id, String password, int tel, String email, String receiveemail, String receivesms) {
		this.id=id;
		this.password=password;
		this.tel=tel;
		this.email=email;
		this.receiveemail=receiveemail;
		this.receivesms=receivesms;
	}
	
	public MemberBean(String id, String password, String name, Date birth, int tel, String email, String receiveemail, String receivesms) {
		this(id, password, tel, email, receiveemail, receivesms);
		this.name=name;
		this.birth=birth;
		
	}
	
	public MemberBean(int num,String id, String password, String name, Date birth, int tel, String email, String receiveemail, String receivesms, Date joinDate) {
		this(id, password, name, birth, tel, email, receiveemail, receivesms);
		this.num=num;
		this.joinDate=joinDate;
	}
	
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

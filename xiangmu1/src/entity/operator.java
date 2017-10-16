package entity;

import java.io.Serializable;

import utils.Values;

public class operator implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int id;
	private String account;
	private String pass;
	private String name;
	private String tel;
	private String lastdate;
	private int powers;
	private int status;
	private String comments;
	
	private String powersname;
	private String statusname;
	
	public operator() {
		super();
	}
	
	
	public operator(String account, String pass, String name, String tel,
			String lastdate, int powers, int status, String comments) {
		super();
		this.account = account;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.lastdate = lastdate;
		this.powers = powers;
		this.status = status;
		this.comments = comments;
	}
	

	public operator(int id, String name, String tel, String lastdate,
			int powers,int status, String comments) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.lastdate = lastdate;
		this.powers=powers;
		this.status = status;
		this.comments = comments;
	}

	
	
	public operator(int id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}


	public String getPowersname() {
		return Values.powersname[powers];
	}


	public String getStatusname() {
		return Values.statusname[status];
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public int getPowers() {
		return powers;
	}
	public void setPowers(int powers) {
		this.powers = powers;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}

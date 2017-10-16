package entity;

import java.io.Serializable;

import utils.Values;

public class courier implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String tel;
	private String code;
	private String pass;
	private String name;
	private String idcard;
	private int status;
	private String statusname;
	
	
	public String getStatusname() {
		return Values.statusname[status];
	}
	
	
	public courier() {
		super();
	}
	public courier(String tel, String code, String pass, String name,
			String idcard, int status) {
		super();
		this.tel = tel;
		this.code = code;
		this.pass = pass;
		this.name = name;
		this.idcard = idcard;
		this.status = status;
	}
	
	public courier(int id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

}

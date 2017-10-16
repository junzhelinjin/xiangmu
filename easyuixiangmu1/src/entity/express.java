package entity;

import java.io.Serializable;

public class express implements Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String tel;
	
	
	
	public express() {
		super();
	}
	public express(String name, String tel) {
		super();
		this.name = name;
		this.tel = tel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	
}

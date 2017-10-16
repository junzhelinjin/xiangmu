package entity;

import java.io.Serializable;

public class producttype implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private int parentid;
	private String parentname;
	
	
	public String getParentname() {
		return parentname;
	}
	public void setParentname(String parentname) {
		this.parentname = parentname;
	}
	public producttype() {
		super();
	}
	public producttype(String name, int parentid) {
		super();
		this.name = name;
		this.parentid = parentid;
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
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	
	
}

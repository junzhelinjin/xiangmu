package entity;

import java.io.Serializable;

public class zone implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private int parentid;
	private int courier_id;
	private String parentname;
	private String cname;
	
	
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getParentname() {
		return parentname;
	}
	public void setParentname(String parentname) {
		this.parentname = parentname;
	}
	public zone() {
		super();
	}
	
	public zone(String name, int parentid, int courier_id) {
		super();
		this.name = name;
		this.parentid = parentid;
		this.courier_id = courier_id;
	}
	
	public zone(int id, String name, int parentid, int courier_id) {
		super();
		this.id = id;
		this.name = name;
		this.parentid = parentid;
		this.courier_id = courier_id;
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
	public int getCourier_id() {
		return courier_id;
	}
	public void setCourier_id(int courier_id) {
		this.courier_id = courier_id;
	}
	
}

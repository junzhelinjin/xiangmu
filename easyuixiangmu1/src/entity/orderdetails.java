package entity;

import java.io.Serializable;

import utils.AutoDate;

public class orderdetails implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int order_id;
	private int info_id;
	private String comments;
	private String oid;
	private int iid;
	
	
	
	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	public orderdetails() {
		super();
	}
	
	public orderdetails(int order_id, int info_id, String comments) {
		super();
		this.order_id = order_id;
		this.info_id = info_id;
		this.comments = comments;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getInfo_id() {
		return info_id;
	}
	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}

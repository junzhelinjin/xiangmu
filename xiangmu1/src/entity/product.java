package entity;

import java.io.Serializable;
import java.util.List;

import service.pics_service;

public class product implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private int producttype_id;
	private double price;
	private double disc;
	private String pics;
	private String info;
	private int salcount;
	private int operator_id;
	private String oname;
	private String pname1;
	private String pname;
	private int tid;
	private String url;
	List<pics> piclist;
	
	
	public List<pics> getPiclist() {
		return piclist;
	}


	public void setPiclist(List<pics> piclist) {
		this.piclist = piclist;
	}


	public product(String name, int producttype_id, double price, double disc,
			String pics, String info, int salcount, int operator_id) {
		super();
		this.name = name;
		this.producttype_id = producttype_id;
		this.price = price;
		this.disc = disc;
		this.pics = pics;
		this.info = info;
		this.salcount = salcount;
		this.operator_id = operator_id;
	}
	
	
	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public product(int id, int producttype_id, double price, double disc,
			String pics, String info) {
		super();
		this.id = id;
		this.producttype_id = producttype_id;
		this.price = price;
		this.disc = disc;
		this.pics = pics;
		this.info = info;
	}


	public int getProducttype_id() {
		return producttype_id;
	}
	public void setProducttype_id(int producttype_id) {
		this.producttype_id = producttype_id;
	}
	public String getPname1() {
		return pname1;
	}
	public void setPname1(String pname1) {
		this.pname1 = pname1;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	
	public int getLastid(){
		if(pics==null||pics.length()==0) return 0;
		if(pics.indexOf(",")==-1) return Integer.valueOf(pics);
		return Integer.valueOf(pics.substring(0,pics.indexOf(",")));
	}
	public product() {
		super();
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDisc() {
		return disc;
	}
	public void setDisc(double disc) {
		this.disc = disc;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getSalcount() {
		return salcount;
	}
	public void setSalcount(int salcount) {
		this.salcount = salcount;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}


	public void picurl(pics_service piservice) {
		pics info=piservice.getById(getLastid());
		if(info!=null) url=info.getUrl();
		
	}
	
	
}

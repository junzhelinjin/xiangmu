package entity;

import java.io.Serializable;
import java.util.List;

import service.pics_service;

public class shopcar implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int client_id; 
	private int product_id;
	private int count;
	private String cname;
	private String pname;
	private String name;
	private int producttype_id;
	private double price;
	private double disc;
	private String pics;
	private String info;
	private int salcount;
	private String url;
	List<pics> piclist;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProducttype_id() {
		return producttype_id;
	}
	public void setProducttype_id(int producttype_id) {
		this.producttype_id = producttype_id;
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
	public shopcar() {
		super();
	}
	public shopcar(int client_id, int product_id, int count) {
		super();
		this.client_id = client_id;
		this.product_id = product_id;
		this.count = count;
	}
	
	
	public shopcar(int product_id, int count) {
		super();
		this.product_id = product_id;
		this.count = count;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getClient_id() {
		return client_id;
	}
	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getLastid(){
		if(pics==null||pics.length()==0) return 0;
		if(pics.indexOf(",")==-1) return Integer.valueOf(pics);
		return Integer.valueOf(pics.substring(0,pics.indexOf(",")));
	}
	
	public void picurl(pics_service piservice) {
		// TODO Auto-generated method stub
		pics info=piservice.getById(getLastid());
		if(info!=null) url=info.getUrl();
	}
}

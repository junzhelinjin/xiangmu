package entity;

import java.io.Serializable;

import utils.Values;

public class ordering implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String date;
	private int client_id;
	private int product_id;
	private int count;
	private double amount;
	private double disc;
	private int status;
	private int lastoperator_id;
	private String cname;
	private String pname;
	private String oname;
	private String ostatusname;
	
	
	
	public ordering(String date, int client_id, int product_id, int count,
			double amount, double disc, int status, int lastoperator_id) {
		super();
		this.date = date;
		this.client_id = client_id;
		this.product_id = product_id;
		this.count = count;
		this.amount = amount;
		this.disc = disc;
		this.status = status;
		this.lastoperator_id = lastoperator_id;
	}
	
	public ordering() {
		super();
	}
	
	
	
	public String getOstatusname() {
		return Values.ostatusname[status];
	}

	public ordering(int id, int status) {
		super();
		this.id = id;
		this.status = status;
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

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getDisc() {
		return disc;
	}
	public void setDisc(double disc) {
		this.disc = disc;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getLastoperator_id() {
		return lastoperator_id;
	}
	public void setLastoperator_id(int lastoperator_id) {
		this.lastoperator_id = lastoperator_id;
	}
	
	
}

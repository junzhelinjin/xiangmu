package entity;

import java.io.Serializable;

import utils.Values;

public class order implements Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String date;
	private int express_id ;
	private String enterdate;
	private int operator_id;
	private int count;
	private int courier_id;
	private int status;
	
	private String ename;
	private String oname;
	private String cname;
	private String ostatusname;
	
	
	
	public order(int id, int status) {
		super();
		this.id = id;
		this.status = status;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getOstatusname() {
		return Values.ostatusname[status];
	}
	
	public order() {
		super();
	}
	public order(String date, int express_id, String enterdate,
			int operator_id, int count, int courier_id, int status) {
		super();
		this.date = date;
		this.express_id = express_id;
		this.enterdate = enterdate;
		this.operator_id = operator_id;
		this.count = count;
		this.courier_id = courier_id;
		this.status = status;
	}
	
	
	public order(int id, int express_id, String enterdate, int operator_id,
			int courier_id, int status) {
		super();
		this.id = id;
		this.express_id = express_id;
		this.enterdate = enterdate;
		this.operator_id = operator_id;
		this.courier_id = courier_id;
		this.status = status;
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
	public int getExpress_id() {
		return express_id;
	}
	public void setExpress_id(int express_id) {
		this.express_id = express_id;
	}
	public String getEnterdate() {
		return enterdate;
	}
	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCourier_id() {
		return courier_id;
	}
	public void setCourier_id(int courier_id) {
		this.courier_id = courier_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}

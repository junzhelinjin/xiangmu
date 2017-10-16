package entity;

import java.io.Serializable;

import utils.Values;

public class info implements Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String code;
	private int order_id;
	private int express_id;
	private int zone_id;
	private int size;
	private int status;
	private int type;
	private String donedate;
	private String createdate;
	private int courier_id;
	private String comments;
	
	private String oname;
	private String ename;
	private String zname;
	private String cname;
	private String istatusname;
	private String typename;
	private String sizename;
	
	public String getIstatusname() {
		return Values.istatusname[status];
	}
	
	public String getTypename() {
		return Values.typename[type];
	}


	public String getSizename() {
		return Values.sizename[size];
	}


	public String getOname() {
		return oname;
	}



	public void setOname(String oname) {
		this.oname = oname;
	}



	public String getEname() {
		return ename;
	}



	public void setEname(String ename) {
		this.ename = ename;
	}



	public String getZname() {
		return zname;
	}



	public void setZname(String zname) {
		this.zname = zname;
	}



	public String getCname() {
		return cname;
	}



	public void setCname(String cname) {
		this.cname = cname;
	}



	public info(String code, int order_id, int express_id, int zone_id,
			int size, int status, int type, String donedate, String createdate,
			int courier_id, String comments) {
		super();
		this.code = code;
		this.order_id = order_id;
		this.express_id = express_id;
		this.zone_id = zone_id;
		this.size = size;
		this.status = status;
		this.type = type;
		this.donedate = donedate;
		this.createdate = createdate;
		this.courier_id = courier_id;
		this.comments = comments;
	}
	
	
	
	public info(int id, int zone_id, int size, int status, int type,
			String donedate, int courier_id, String comments) {
		super();
		this.id = id;
		this.zone_id = zone_id;
		this.size = size;
		this.status = status;
		this.type = type;
		this.donedate = donedate;
		this.courier_id = courier_id;
		this.comments = comments;
	}



	public info() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getExpress_id() {
		return express_id;
	}
	public void setExpress_id(int express_id) {
		this.express_id = express_id;
	}
	public int getZone_id() {
		return zone_id;
	}
	public void setZone_id(int zone_id) {
		this.zone_id = zone_id;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDonedate() {
		return donedate;
	}
	public void setDonedate(String donedate) {
		this.donedate = donedate;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	public int getCourier_id() {
		return courier_id;
	}

	public void setCourier_id(int courier_id) {
		this.courier_id = courier_id;
	}

	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
}

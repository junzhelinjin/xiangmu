package utils;

import java.util.List;

public class JsonList {
	private List rows;
	private long total;

	public JsonList(List rows, int total) {
		super();
		this.rows = rows;
		this.total = total;
	}
	public JsonList() {
		super();
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
	
	
}

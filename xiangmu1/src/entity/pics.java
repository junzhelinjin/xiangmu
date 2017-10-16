package entity;

import java.io.Serializable;

public class pics implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String url;
	private String path;
	
	
	public pics(String url, String path) {
		super();
		this.url = url;
		this.path = path;
	}
	
	
	public pics() {
		super();
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}

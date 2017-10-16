package entity;

import java.io.Serializable;

public class power implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String url;
	private String icon;
	private int status;
	
	
	public power(String name, String url, String icon, int status) {
		super();
		this.name = name;
		this.url = url;
		this.icon = icon;
		this.status = status;
	}
	public power() {
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}

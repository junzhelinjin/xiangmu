package utils;

public class JsonData {
	private int status=0;
	private String url;
	private String path;
	

	public JsonData(int status) {
		super();
		this.status = status;
		
	}

	public JsonData(int status, String url) {
		super();
		this.status = status;
		this.url = url;
	}

	public JsonData() {
		super();
	}
	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AutoDate {
	private int id;
	
	public AutoDate() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public static String Now() {
		return new SimpleDateFormat("yyyyÄêMMÔÂddÈÕHH:mm").format(new Date());
	}
	
	public static String orid(int id){
		String pid=null;
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmm");
		pid =formatter.format(date) + id;
		return pid;
	}
}

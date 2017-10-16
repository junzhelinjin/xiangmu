package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AutoDate {
	public static String Now() {
		return new SimpleDateFormat("yyyy年MM月dd日 HH:mm").format(new Date());
	}
}

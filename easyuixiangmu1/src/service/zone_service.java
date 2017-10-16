package service;


import java.util.List;

import utils.Seach;
import entity.zone;

public interface zone_service extends Basic_service<zone>{
	public List<zone> getWhere(Seach info);
}

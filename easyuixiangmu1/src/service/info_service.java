package service;


import java.util.List;

import utils.SeachInfo;
import entity.info;

public interface info_service extends Basic_service<info>{
	public void update1(info t);
	public List<info> getall(SeachInfo info);
}

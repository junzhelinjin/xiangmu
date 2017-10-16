package service;

import java.util.List;

import utils.SeachInfo;
import entity.pics;


public interface pics_service extends BasicService<pics> {
	public int getMaxId();
	public List<pics> getallwhere(SeachInfo info);
}

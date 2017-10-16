package service;

import java.util.List;

import utils.SeachInfo;
import entity.shopcar;

public interface shopcar_service extends BasicService<shopcar> {
	public List<shopcar> getByWhereAll(SeachInfo info);
}

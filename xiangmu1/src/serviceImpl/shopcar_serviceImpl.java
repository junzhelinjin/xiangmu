package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import mapper.shopcar_mapper;

import org.springframework.stereotype.Service;

import entity.shopcar;
import service.shopcar_service;
import utils.SeachInfo;

@Service("shopcar_serviceImpl")
public class shopcar_serviceImpl extends Basic_serviceImpl<shopcar> implements shopcar_service {
	@Resource(name="shopcar_mapper")
	shopcar_mapper mapper;

	public List<shopcar> getByWhereAll(SeachInfo info) {
		// TODO Auto-generated method stub
		return mapper.getByWhereAll(info);
	}

}

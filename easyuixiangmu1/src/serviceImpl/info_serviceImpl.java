package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import mapper.info_mapper;

import org.springframework.stereotype.Service;

import entity.info;
import service.info_service;
import utils.SeachInfo;
@Service("info_serviceImpl")
public class info_serviceImpl extends Basic_serviceImpl<info> implements info_service{

	@Resource(name="info_mapper")
	info_mapper mapper;

	@Override
	public void update1(info t) {
		mapper.update1(t);
	}

	@Override
	public List<info> getall(SeachInfo info) {
		return mapper.getall(info);
	}
	
}

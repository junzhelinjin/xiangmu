package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import mapper.zone_mapper;

import org.springframework.stereotype.Service;

import entity.zone;
import service.zone_service;
import utils.Seach;
@Service("zone_serviceImpl")
public class zone_serviceImpl extends Basic_serviceImpl<zone> implements zone_service{

	@Resource(name="zone_mapper")
	zone_mapper mapper;

	@Override
	public List<zone> getWhere(Seach info) {
		return mapper.getWhere(info);
	}
}

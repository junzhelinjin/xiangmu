package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import mapper.pics_mapper;

import org.springframework.stereotype.Service;

import entity.pics;
import service.pics_service;
import utils.SeachInfo;

@Service("pics_serviceImpl")
public class pics_serviceImpl extends Basic_serviceImpl<pics> implements pics_service {
	@Resource(name="pics_mapper")
	pics_mapper mapper;

	@Override
	public int getMaxId() {
		// TODO Auto-generated method stub
		return mapper.getMaxId();
	}

	@Override
	public List<pics> getallwhere(SeachInfo info) {
		if(info.isCanpage()){
			info.setRowcount(mapper.getByWhereSize(info));
		}
		return mapper.getallwhere(info);
	}

}

package serviceImpl;

import javax.annotation.Resource;
import mapper.courier_mapper;
import org.springframework.stereotype.Service;
import entity.courier;
import service.courier_service;
@Service("courier_serviceImpl")
public class courier_serviceImpl extends Basic_serviceImpl<courier> implements courier_service{

	@Resource(name="courier_mapper")
	courier_mapper mapper;

	@Override
	public void updatepass(courier t) {
		mapper.updatepass(t);
	}

	@Override
	public courier login(courier t) {
		
		return mapper.login(t);
	}

}

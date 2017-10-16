package serviceImpl;

import javax.annotation.Resource;
import mapper.operator_mapper;
import org.springframework.stereotype.Service;
import entity.operator;
import service.operator_service;
@Service("operator_serviceImpl")
public class operator_serviceImpl extends Basic_serviceImpl<operator> implements operator_service{

	@Resource(name="operator_mapper")
	operator_mapper mapper;

	@Override
	public void updatepass(operator t) {
		mapper.updatepass(t);
	}

	@Override
	public operator login(operator t) {
		
		return mapper.login(t);
	}

}

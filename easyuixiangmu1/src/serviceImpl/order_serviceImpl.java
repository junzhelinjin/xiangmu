package serviceImpl;

import javax.annotation.Resource;
import mapper.order_mapper;
import org.springframework.stereotype.Service;
import entity.order;
import service.order_service;
@Service("order_serviceImpl")
public class order_serviceImpl extends Basic_serviceImpl<order> implements order_service{

	@Resource(name="order_mapper")
	order_mapper mapper;

	@Override
	public void update1(order t) {
		mapper.update1(t);
		
	}
}

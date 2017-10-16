package serviceImpl;

import javax.annotation.Resource;
import mapper.orderdetails_mapper;
import org.springframework.stereotype.Service;
import entity.orderdetails;
import service.orderdetails_service;
@Service("orderdetails_serviceImpl")
public class orderdetails_serviceImpl extends Basic_serviceImpl<orderdetails> implements orderdetails_service{
	@Resource(name="orderdetails_mapper")
	orderdetails_mapper mapper;
}

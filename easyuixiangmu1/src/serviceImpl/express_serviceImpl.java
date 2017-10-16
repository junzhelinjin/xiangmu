package serviceImpl;

import javax.annotation.Resource;
import mapper.express_mapper;
import org.springframework.stereotype.Service;
import entity.express;
import service.express_service;
@Service("express_serviceImpl")
public class express_serviceImpl extends Basic_serviceImpl<express> implements express_service{
	@Resource(name="express_mapper")
	express_mapper mapper;
}

package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import mapper.client_mapper;

import org.springframework.stereotype.Service;

import entity.client;
import service.client_service;

@Service("client_serviceImpl")
public class client_serviceImpl extends Basic_serviceImpl<client> implements client_service {
	@Resource(name="client_mapper")
	client_mapper mapper;

	@Override
	public void updatepass(client t) {
		mapper.updatepass(t);
		
	}

	@Override
	public client login(client t) {
		
		return mapper.login(t);
	}

}

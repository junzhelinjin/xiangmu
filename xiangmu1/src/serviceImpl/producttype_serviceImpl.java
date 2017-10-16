package serviceImpl;

import javax.annotation.Resource;

import mapper.producttype_mapper;

import org.springframework.stereotype.Service;

import entity.producttype;
import service.producttype_service;

@Service("producttype_serviceImpl")
public class producttype_serviceImpl extends Basic_serviceImpl<producttype> implements producttype_service {
	@Resource(name="producttype_mapper")
	producttype_mapper mapper;
	
}

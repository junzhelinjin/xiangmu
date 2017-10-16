package serviceImpl;

import javax.annotation.Resource;

import mapper.product_mapper;

import org.springframework.stereotype.Service;

import entity.product;
import service.product_service;

@Service("product_serviceImpl")
public class product_serviceImpl extends Basic_serviceImpl<product> implements product_service {
	@Resource(name="product_mapper")
	product_mapper mapper;
}

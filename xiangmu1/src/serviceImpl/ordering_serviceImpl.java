package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import mapper.ordering_mapper;

import org.springframework.stereotype.Service;

import entity.ordering;
import service.ordering_service;

@Service("ordering_serviceImpl")
public class ordering_serviceImpl extends Basic_serviceImpl<ordering> implements ordering_service {
	@Resource(name="ordering_mapper")
	ordering_mapper mapper;

}

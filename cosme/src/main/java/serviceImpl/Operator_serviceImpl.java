package serviceImpl;

import entity.Operator;
import mapper.Operator_mapper;
import org.springframework.stereotype.Service;
import service.Operator_service;

import javax.annotation.Resource;

@Service("Operator_serviceImpl")
public class Operator_serviceImpl extends Basic_serviceImpl<Operator> implements Operator_service{
    @Resource(name="Operator_mapper")
    Operator_mapper mapper;
}

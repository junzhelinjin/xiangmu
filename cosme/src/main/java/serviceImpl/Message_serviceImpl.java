package serviceImpl;

import entity.Message;
import mapper.Message_mapper;
import org.springframework.stereotype.Service;
import service.Message_service;

import javax.annotation.Resource;

@Service("Message_serviceImpl")
public class Message_serviceImpl extends Basic_serviceImpl<Message> implements Message_service{
    @Resource(name = "Message_mapper")
    Message_mapper mapper;
}

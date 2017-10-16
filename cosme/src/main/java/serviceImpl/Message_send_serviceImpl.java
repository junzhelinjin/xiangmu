package serviceImpl;

import entity.Message_send;
import mapper.Message_send_mapper;
import org.springframework.stereotype.Service;
import service.Message_send_service;

import javax.annotation.Resource;

@Service("Message_send_serviceImpl")
public class Message_send_serviceImpl extends Basic_serviceImpl<Message_send> implements Message_send_service{
    @Resource(name = "Message_send_mapper")
    Message_send_mapper mapper;

    public void update1(Message_send t) {
        mapper.update1(t);
    }
}

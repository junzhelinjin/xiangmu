package serviceImpl;

import entity.Notice;
import mapper.Notice_mapper;
import org.springframework.stereotype.Service;
import service.Notice_service;

import javax.annotation.Resource;

@Service("Notice_serviceImpl")
public class Notice_serviceImpl extends Basic_serviceImpl<Notice> implements Notice_service{
    @Resource(name="Notice_mapper")
    Notice_mapper mapper;
}

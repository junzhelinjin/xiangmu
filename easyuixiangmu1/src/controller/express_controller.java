package controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import entity.operator;
import service.express_service;
@Controller
@RequestMapping("express")
public class express_controller extends Basic_controller<operator>{
	@Resource(name="express_serviceImpl")
	express_service service;
	

}

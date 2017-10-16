package controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.operator;
import entity.zone;
import service.courier_service;
import service.zone_service;
import utils.JsonList;
import utils.Seach;
@Controller
@RequestMapping("zone")
public class zone_controller extends Basic_controller<zone>{
	@Resource(name="zone_serviceImpl")
	zone_service service;
	@Resource(name="courier_serviceImpl")
	courier_service cservice;
	@RequestMapping("index")
	public @ResponseBody JsonList index(String txt, Seach s) {
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where zone.name like '%"+txt+"%'");
		List<zone> list=service.getByWhere(s);
		int total=list.size();
		return new JsonList(list,s.getRows());
	}
	
	@RequestMapping("zonelist")
	public @ResponseBody List zonelist(){
		return service.getWhere(new Seach(" where zone.parentid=0 "));
	}
	@RequestMapping("courierlist")
	public @ResponseBody List courierlist(){
		return cservice.getall();
	}
	
}

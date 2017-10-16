package controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.courier;
import service.courier_service;
import utils.JsonData;
import utils.MD5Util;
@Controller
@RequestMapping("courier")
public class courier_controller extends Basic_controller<courier>{
	@Resource(name="courier_serviceImpl")
	courier_service service;
	
	@RequestMapping("insert")
	public @ResponseBody JsonData add(courier t){
		t.setPass(MD5Util.MD5(t.getPass()));
		service.insert(t);
		return new JsonData(1);
	}
	
	@RequestMapping("statuslist")
	public @ResponseBody String[][] statuslist(){
		return new String[][]{{"0","ø…”√"},{"1","Ω˚”√"}};
	}
	
}

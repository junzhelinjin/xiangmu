package controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.orderdetails;
import service.info_service;
import service.order_service;
import service.orderdetails_service;
import utils.AutoDate;
import utils.JsonData;
import utils.JsonList;
import utils.Seach;
@Controller
@RequestMapping("orderdetails")
public class orderdetails_controller{
	@Resource(name="orderdetails_serviceImpl")
	orderdetails_service service;
	@Resource(name="order_serviceImpl")
	order_service oservice;
	@Resource(name="info_serviceImpl")
	info_service iservice;
	
	@RequestMapping("orderlist")
	public @ResponseBody List orderlist(){
		return oservice.getall();
	}
	@RequestMapping("infolist")
	public @ResponseBody List infolist(){
		return iservice.getall();
	}
	@RequestMapping("index")
	public @ResponseBody JsonList index(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where name like '%"+txt+"%'");
		List<orderdetails> list=service.getByWhere(s);
		int total=list.size();
		return new JsonList(list,s.getRows());
	}
	
	@RequestMapping("insert")
	public @ResponseBody JsonData add(orderdetails t){
		service.insert(t);
		t.setOid(AutoDate.orid(t.getOrder_id()));
		System.out.println(t.getOid());
		return new JsonData(1);
	} 
	
	@RequestMapping("update")
	public @ResponseBody JsonData update(orderdetails t){
		service.update(t);
		return new JsonData(1);
	} 
	@RequestMapping("del")
	public @ResponseBody JsonData del(int id){
		service.delete(id);
		return new JsonData(1);
	}
}

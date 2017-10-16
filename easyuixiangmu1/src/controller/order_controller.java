package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.info;
import entity.operator;
import entity.order;
import service.courier_service;
import service.express_service;
import service.operator_service;
import service.order_service;
import utils.AutoDate;
import utils.JsonData;
import utils.JsonList;
import utils.Seach;
@Controller
@RequestMapping("order")
public class order_controller{
	@Resource(name="order_serviceImpl")
	order_service service;
	@Resource(name="operator_serviceImpl")
	operator_service oservice;
	@Resource(name="express_serviceImpl")
	express_service eservice;
	@Resource(name="courier_serviceImpl")
	courier_service cservice;
	
	@ExceptionHandler
	public void ss(Exception e){
		e.printStackTrace();
	}
	
	
	@RequestMapping("index")
	public @ResponseBody JsonList index(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where express.name like '%"+txt+"%'");
		List<order> list=service.getByWhere(s);
		int total=list.size();
		return new JsonList(list,s.getRows());
	}
	List<info> list;
	@RequestMapping("remove")
	public @ResponseBody JsonData remove(HttpServletRequest req){
		list=new ArrayList<info>();
		list.clear();
		if(req.getSession().getAttribute("olist")!=null){
			req.removeAttribute("olist");
		}
		return new JsonData(1);
	}
	@RequestMapping("enter")
	public @ResponseBody List enter(String value,HttpServletRequest req){
		if(value!=null&&value.length()>0){
		String val=value;
		info in=new info();
		in.setCode(val.substring(0, 4));
		in.setZone_id(Integer.valueOf(val.substring(4, 5)));
		in.setSize(Integer.valueOf(val.substring(5, 6)));
		in.setType(Integer.valueOf(val.substring(6, 7)));
		in.setComments(val.substring(7));
		list.add(in);
		req.getSession().setAttribute("olist", list);
		}
		return list;
	}
	
	
	@RequestMapping("expresslist")
	public @ResponseBody List expresslist(){
		return eservice.getall();
	}
	
	@RequestMapping("operatorlist")
	public @ResponseBody List operatorlist(){
		return oservice.getall();
	}
	
	@RequestMapping("courierlist")
	public @ResponseBody List courierlist(){
		return cservice.getall();
	}
	
	@RequestMapping("statuslist")
	public @ResponseBody String[][] statuslist(){
		return new String[][]{{"0","Œ¥Ω·À„"},{"1","“‘Ω·À„"}};
	}
	
	@RequestMapping("insert")
	public @ResponseBody JsonData add(order t,HttpServletRequest req){
		t.setDate(AutoDate.Now());
		t.setEnterdate(AutoDate.Now());
		operator user=(operator) req.getSession().getAttribute("user");
		t.setOperator_id(user.getId());
		service.insert(t);
		return new JsonData(1);
	} 
	@RequestMapping("update")
	public @ResponseBody JsonData update(order t){
		service.update(t);
		return new JsonData(1);
	} 
	@RequestMapping("del")
	public @ResponseBody JsonData del(int id){
		service.delete(id);
		return new JsonData(1);
	}
	

}

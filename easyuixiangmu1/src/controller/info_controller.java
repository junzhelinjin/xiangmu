package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.courier;
import entity.express;
import entity.info;
import service.courier_service;
import service.express_service;
import service.info_service;
import service.order_service;
import service.zone_service;
import utils.AutoDate;
import utils.JsonData;
import utils.JsonList;
import utils.Seach;
import utils.SeachInfo;

@Controller
@RequestMapping("info")
public class info_controller extends Basic_controller<info>{
	@Resource(name="info_serviceImpl")
	info_service service;
	@Resource(name="express_serviceImpl")
	express_service eservice;
	@Resource(name="courier_serviceImpl")
	courier_service cservice;
	@Resource(name="zone_serviceImpl")
	zone_service zservice;
	@Resource(name="order_serviceImpl")
	order_service oservice;
	
	@RequestMapping("index")
	public @ResponseBody JsonList index(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where info.code like '%"+txt+"%'");
		List<info> list=service.getByWhere(s);
		return new JsonList(list,s.getRows());
	}
	@RequestMapping("index1")
	public @ResponseBody JsonList index1(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where info.status=0 and info.code like '%"+txt+"%'");
		s.setWhere(" where info.status=0 ");
		List<info> list=service.getByWhere(s);
		return new JsonList(list,s.getRows());
	}
	
	@RequestMapping("index2")
	public @ResponseBody JsonList index2(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where info.status=1 and info.code like '%"+txt+"%'");
		s.setWhere(" where info.status=1 ");
		List<info> list=service.getByWhere(s);
		return new JsonList(list,s.getRows());
	}
	@RequestMapping("index3")
	public @ResponseBody JsonList index3(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where info.status>1 and info.code like '%"+txt+"%'");
		s.setWhere(" where info.status>1 ");
		List<info> list=service.getByWhere(s);
		return new JsonList(list,s.getRows());
	}
	@RequestMapping("expresslist")
	public @ResponseBody List expresslist(){
		return eservice.getall();
	}
	@RequestMapping("courierlist")
	public @ResponseBody List courierlist(){
		return cservice.getall();
	}
	@RequestMapping("zonelist")
	public @ResponseBody List zonelist(){
		return zservice.getall();
	}
	
	@RequestMapping("zonelist1")
	public @ResponseBody List zonelist1(){
		return zservice.getWhere(new Seach(" where zone.parentid>0 "));
	}
	
	@RequestMapping("orderlist")
	public @ResponseBody List orderlist(){
		return oservice.getall();
	}
	@RequestMapping("statuslist")
	public @ResponseBody String[][] statuslist(){
		return new String[][]{{"0","入库"},{"1","分拣完成"},{"2","等待"},{"3","出库"},{"4","中转"},{"5","到达"},{"6","退回"},{"7","暂放"},{"8","作废"}};
	}
	
	@RequestMapping("sizelist")
	public @ResponseBody String[][] sizelist(){
		return new String[][]{{"0","小件"},{"1","中件"},{"2","大件"},{"3","特殊件"}};
	}
	
	@RequestMapping("typelist")
	public @ResponseBody String[][] typelist(){
		return new String[][]{{"0","朋友代收"},{"1","速递易"},{"2","菜鸟驿站"}};
	}
	
	@Override
	public JsonData add(info t) {
		t.setCreatedate(AutoDate.Now());
		t.setDonedate(AutoDate.Now());
		return super.add(t);
	}
	
	@Override
	public JsonData update(info t) {
		t.setDonedate(AutoDate.Now());
		return super.update(t);
		
	}
	
	@RequestMapping("sortedit")
	public @ResponseBody JsonData sortedit(int id,info t) {
		t.setId(id);
		t.setDonedate(AutoDate.Now());
		t.setStatus(1);
		return super.update(t);
		
	}
	@RequestMapping("sortedit1")
	public @ResponseBody JsonData sortedit1(int id) {
		info li=service.getById(id);
		li.setStatus(2);
		li.setDonedate(AutoDate.Now());
		service.update1(li);
		return new JsonData(1);
		
	}
	@RequestMapping("sortedit2")
	public @ResponseBody JsonData sortedit2(int id) {
		info li=service.getById(id);
		li.setStatus(8);
		li.setDonedate(AutoDate.Now());
		service.update1(li);
		return new JsonData(1);
		
	}
	@RequestMapping("choose")
	public String choose(String text,ModelMap m){
		if(text!=null&&text.length()>0){
			m.put("infolist", service.getall(new SeachInfo(" where info.status=2 and (info.code like '%"+text+"%' or zone.name like '%"+text+"%')")));
		}else{
		m.put("infolist", service.getall(new SeachInfo(" where info.status=2 ")));
		}
		return "../info/choose";
	}
	
	@RequestMapping("order")
	public String order(int id,ModelMap m){
		m.put("oinfolist", service.getById(id));
		return "../info/order";
	}
	@RequestMapping("enter")
	public @ResponseBody JsonData enter(int id,HttpServletRequest req){
		entity.order or=oservice.getById(id);
		int eid=or.getExpress_id();
		List<info> iinfo=(List<info>) req.getSession().getAttribute("olist");
		
		for(int i=0;i<iinfo.size();i++){
			info in=new info();
			in.setCode(iinfo.get(i).getCode());
			in.setOrder_id(id);
			in.setExpress_id(eid);
			in.setZone_id(iinfo.get(i).getZone_id());
			in.setStatus(0);
			in.setType(iinfo.get(i).getType());
			in.setDonedate(AutoDate.Now());
			in.setCreatedate(AutoDate.Now());
			in.setCourier_id(0);
			in.setComments(iinfo.get(i).getComments());
			service.insert(in);
		}
		
		return new JsonData(1);
	}
	@RequestMapping("inorder")
	public String inorder(int id,ModelMap m,HttpServletRequest req){
		info li=service.getById(id);
		li.setStatus(3);
		courier cinfo=(courier) req.getSession().getAttribute("puser");
		li.setCourier_id(cinfo.getId());
		li.setDonedate(AutoDate.Now());
		service.update1(li);
		m.put("infolist", service.getall(new SeachInfo(" where info.status=2")));
		return "redirect:../info/choose";
	}

	@RequestMapping("xunjiawuliao")
	public String xunjiawuliao(String text,ModelMap m){
		if(text!=null&&text.length()>0){
			m.put("infolist1", service.getall(new SeachInfo(" where info.status=3 and info.code like '%"+text+"%'")));
		}else{
			m.put("infolist1", service.getall(new SeachInfo(" where info.status=3 ")));
		}
		return "../info/xunjiawuliao";	
	}
	
	@RequestMapping("sendorder")
	public @ResponseBody JsonData sendorder(int id){
		info in=service.getById(id);
		in.setStatus(4);
		oservice.update1(new entity.order(in.getOrder_id(), 1));
		service.update(in);
		return new JsonData(1);
	}
	
	@RequestMapping("xunjia")
	public String xunjia(String text,ModelMap m){
		
		if(text!=null&&text.length()>0){
			m.put("infolist2", service.getall(new SeachInfo(" where info.status=4 and info.code like '%"+text+"%'")));
		}else{
			m.put("infolist2", service.getall(new SeachInfo(" where info.status=4 ")));
		}
		return "../info/xunjia";
	}
	
	@RequestMapping("recode")
	public String recode(String text,ModelMap m){
		if(text!=null&&text.length()>0){
			m.put("infolist3", service.getall(new SeachInfo(" where info.status>3 and info.code like '%"+text+"%'")));
		}else{
			m.put("infolist3", service.getall(new SeachInfo(" where info.status>3 ")));
		}

		return "../info/recode";
	}
	
	@RequestMapping("tasks")
	public String tasks(int id,ModelMap m){
		m.put("tinfolist", service.getById(id));
		return "../info/tasks";
	}
	
	@RequestMapping("doneorder")
	public String doneorder(int id,int status){
		info in=service.getById(id);
		in.setStatus(status);
		service.update(in);
		return "redirect:../info/xunjia";
	}
}

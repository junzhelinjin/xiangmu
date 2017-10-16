package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.product;
import entity.producttype;
import service.operator_service;
import service.product_service;
import service.producttype_service;
import utils.AutoDate;
import utils.JsonData;
import utils.MD5Util;
import utils.SeachInfo;
import utils.Values;

@Controller
@RequestMapping("admin/product")
public class product_controller extends Basic_controller<product> {
	@Resource(name = "product_serviceImpl")
	product_service service;
	@Resource(name = "operator_serviceImpl")
	operator_service oservice;
	@Resource(name="producttype_serviceImpl")
	producttype_service pservice;
	
	@Override
	public String add(ModelMap m,HttpServletRequest req){
		m.put("operatorlist", oservice.getall());
		List<producttype> list=pservice.getByWhere(new SeachInfo(" where producttype.parentid=0 ", false));
		m.put("types", list);
		if(list.size()>0){
			m.put("types1",pservice.getByWhere(new SeachInfo(" where producttype.parentid="+list.get(0).getId(), false)));
		}
		return super.add(m, req);
	}
	
	@RequestMapping("gettypes")
	public @ResponseBody List<producttype> gettypes(int id){
		return pservice.getByWhere(new SeachInfo(" where producttype.parentid="+id, false));
	}
	
	
	@RequestMapping("edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		product info=service.getById(id);
		m.put("info", info);
		List<producttype> list=pservice.getByWhere(new SeachInfo(" where producttype.parentid=0 ", false));
		m.put("types", list);
		m.put("types1",pservice.getByWhere(new SeachInfo(" where producttype.parentid="+info.getTid(), false)));
		
		return "product/edit";
	}
	
	@RequestMapping("insert1")
	public @ResponseBody
	JsonData insert1(product t, ModelMap m, HttpServletRequest req) {
		System.out.println(t.getInfo());
		service.insert(t);
		return new JsonData(1);
	}

	@RequestMapping("index1")
	public String index(ModelMap m, HttpServletRequest req) {
		m.put("list", service.getall());
		return "product/index";
	}

	

	@RequestMapping("update1")
	public @ResponseBody
	JsonData update1(product t, ModelMap m, HttpServletRequest req) {
		service.update(t);
		return new JsonData(1);
	}
	

}

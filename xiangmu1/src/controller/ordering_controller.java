package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.ordering;
import service.client_service;
import service.operator_service;
import service.ordering_service;
import service.product_service;
import utils.AutoDate;
import utils.JsonData;
import utils.Values;

@Controller
@RequestMapping("admin/ordering")
public class ordering_controller extends Basic_controller<ordering> {
	@Resource(name = "ordering_serviceImpl")
	ordering_service service;
	@Resource(name="client_serviceImpl")
	client_service cservice;
	@Resource(name="product_serviceImpl")
	product_service pservice;
	@Resource(name="operator_serviceImpl")
	operator_service oservice;
	
	@RequestMapping("insert1")
	public @ResponseBody
	JsonData insert1(ordering t, ModelMap m, HttpServletRequest req) {
		t.setDate(AutoDate.Now());
		t.setLastoperator_id(1);
		service.insert(t);
		return new JsonData(1);
	}
	
	@RequestMapping("add")
	public String add(ModelMap m,HttpServletRequest req){
		m.put("clientlist", cservice.getall());
		m.put("productlist", pservice.getall());
		m.put("operatorlist", oservice.getall());
		return "ordering/edit";
	}

	@RequestMapping("edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", service.getById(id));
		m.put("statuslist", Values.ostatusname);
		return add(m, req);
	}

	@RequestMapping("update1")
	public @ResponseBody
	JsonData update1(ordering t, ModelMap m, HttpServletRequest req) {
		service.update(t);
		return new JsonData(1);
	}
	

}

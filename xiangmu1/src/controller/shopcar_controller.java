package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.shopcar;
import service.client_service;
import service.product_service;
import service.shopcar_service;
import utils.AutoDate;
import utils.JsonData;
import utils.MD5Util;
import utils.Values;

@Controller
@RequestMapping("admin/shopcar")
public class shopcar_controller extends Basic_controller<shopcar> {
	@Resource(name = "shopcar_serviceImpl")
	shopcar_service service;
	@Resource(name="client_serviceImpl")
	client_service cservice;
	@Resource(name="product_serviceImpl")
	product_service pservice;

	@RequestMapping("add")
	public String add(ModelMap m,HttpServletRequest req){
		m.put("clientlist", cservice.getall());
		m.put("productlist", pservice.getall());
		return "shopcar/edit";
	}
	
	@RequestMapping("insert1")
	public @ResponseBody
	JsonData insert1(shopcar t, ModelMap m, HttpServletRequest req) {
		service.insert(t);
		return new JsonData(1);
	}

	@RequestMapping("index1")
	public String index(ModelMap m, HttpServletRequest req) {
		m.put("list", service.getall());
		return "shopcar/index";
	}

	@RequestMapping("edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", service.getById(id));
		m.put("statuslist", Values.ostatusname);
		m.put("productlist",pservice.getById(id));
		return add(m, req);
	}

	@RequestMapping("update1")
	public @ResponseBody
	JsonData update1(shopcar t, ModelMap m, HttpServletRequest req) {
		service.update(t);
		return new JsonData(1);
	}
	

}

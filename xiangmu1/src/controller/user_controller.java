package controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.client_service;
import service.pics_service;
import service.product_service;
import service.producttype_service;
import service.shopcar_service;
import utils.AutoDate;
import utils.JsonData;
import utils.MD5Util;
import utils.SeachInfo;
import entity.client;
import entity.product;
import entity.shopcar;

@Controller
public class user_controller {
	@Resource(name = "client_serviceImpl")
	client_service service;
	@Resource(name = "shopcar_serviceImpl")
	shopcar_service sservice;
	@Resource(name="product_serviceImpl")
	product_service pservice;
	@Resource(name = "producttype_serviceImpl")
	producttype_service ptservice;
	@Resource(name = "pics_serviceImpl")
	pics_service piservice;
	
	@RequestMapping("index")
	public String index(Integer producttype_id,ModelMap m){
		m.put("ptlist", ptservice.getByWhere(new SeachInfo("",false)));
		String where="";
		if(producttype_id!=null) where=" where product.producttype_id="+producttype_id;
		List<product> list=pservice.getByWhere(new SeachInfo(where,false));
		for(product p:list)
			p.picurl(piservice);
		m.put("productlist", list);
		return "../index";
	}
	
	@RequestMapping("info")
	public String info(int id,ModelMap m){
		product info=pservice.getById(id);
		info.setPiclist(piservice.getByWhere(new SeachInfo(info.getPics(), false)));
		m.put("info", info);
		return "../detail";
	}
	
	@RequestMapping("login")
	public String login(client t, String code, ModelMap m,
			HttpServletRequest req) {
		Object user=req.getSession().getAttribute("ucser");
		if(user!=null){
			req.getSession().removeAttribute("cuser");
		}
		String r = req.getSession().getAttribute("randomCode").toString();
		if (!code.equalsIgnoreCase(r)){
			return "redirect:/login.jsp";}
		t.setPass(MD5Util.MD5(t.getPass()));
		client info = service.login(t);
		if (info == null){
			return "redirect:/login.jsp";}
		req.getSession().setMaxInactiveInterval(100*3600);
		req.getSession().setAttribute("cuser", info);
		
		return "redirect:/index.html";
	}
	
	@RequestMapping("login1")
	public @ResponseBody JsonData login1(client t, ModelMap m,
			HttpServletRequest req) {
		Object user=req.getSession().getAttribute("cuser");
		if(user!=null){
			req.getSession().removeAttribute("cuser");
		}
		t.setPass(MD5Util.MD5(t.getPass()));
		client info = service.login(t);
		if (info == null){
			return new JsonData(0);}
		req.getSession().setMaxInactiveInterval(100*3600);
		req.getSession().setAttribute("cuser", info);
		return new JsonData(1);
	}
	
	
	
	@RequestMapping("addshopcar")
	public @ResponseBody JsonData addshopcar(Integer id,Integer count,ModelMap m,HttpServletRequest req){
		client user= (client) req.getSession().getAttribute("cuser");
		if(user!=null){
			sservice.insert(new entity.shopcar(user.getId(),id,count));
			return new JsonData(1);
		}else{
			return new JsonData(0);
		}
	}
	
	@RequestMapping("shopcar")
	public String shopcar(ModelMap m,HttpServletRequest req){
		List<shopcar> list=sservice.getByWhereAll(new SeachInfo("",false));
		for(shopcar p:list)
			p.picurl(piservice);
		m.put("shopcar", list);
		
		return "../shopcar";
	}
	
	
	
	@RequestMapping("register")
	public @ResponseBody
	JsonData insert2(String tel, String pass1, String pass2, String email,
			ModelMap m, HttpServletRequest req) {
		// ºöÂÔ´óÐ¡Ð´
			if (tel.length()>0&&pass1.length() > 0&&pass1.equalsIgnoreCase(pass2)) {
				service.insert(new client(tel, MD5Util.MD5(pass1), tel, email, AutoDate.Now(), AutoDate.Now(), 1, "", 1, 0, AutoDate.Now(), ""));
				return new JsonData(1);
			}
		return new JsonData(0);
	}
	
	@RequestMapping("outlogin")
	public String outlogin(HttpServletRequest req){
		req.getSession().removeAttribute("cuser");
		return "../login";
	}
	
}

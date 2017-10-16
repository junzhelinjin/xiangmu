package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.client;
import service.client_service;
import utils.AutoDate;
import utils.JsonData;
import utils.MD5Util;
import utils.SeachInfo;
import utils.Values;

@Controller
@RequestMapping("admin/client")
public class client_controller extends Basic_controller<client> {
	@Resource(name = "client_serviceImpl")
	client_service service;

	@RequestMapping("insert1")
	public @ResponseBody
	JsonData insert1(client t, ModelMap m, HttpServletRequest req) {
		t.setPass(MD5Util.MD5(t.getPass()));
		t.setLastdate(AutoDate.Now());
		t.setCreatedate(AutoDate.Now());
		t.setLogincount(0);
		t.setLogindate(AutoDate.Now());
		service.insert(t);
		return new JsonData(1);
	}
	

	@RequestMapping("edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", service.getById(id));
		m.put("questionlist", Values.questionname);
		m.put("statuslist", Values.cstatusname);
		return add(m, req);
	}

	@RequestMapping("update1")
	public @ResponseBody
	JsonData update1(client t, ModelMap m, HttpServletRequest req) {
		t.setLastdate(AutoDate.Now());
		service.update(t);
		return new JsonData(1);
	}
	
	
	@RequestMapping("editpass")
	public String editpass(int id,ModelMap m,HttpServletRequest req){
		m.put("id", id);
		return "client/editpass";
	}
	
	@RequestMapping("updatepass")
	public @ResponseBody
	JsonData updatepass(int id, String old, String new1, String new2,
			ModelMap m, HttpServletRequest req) {
		client info = service.getById(id);
		if (info.getPass().equalsIgnoreCase(MD5Util.MD5(old))) {
			if (new1.length() > 0 && new1.equalsIgnoreCase(new2)) {
				service.updatepass(new client(id, MD5Util.MD5(new1)));
//				service.updatepass(new client(id, new1));
				return new JsonData(1);
			}
		}
		m.put("id", id);
		return new JsonData(0);
	}

	@RequestMapping("register")
	public @ResponseBody
	JsonData insert2(String tel, String pass1, String pass2, String email,
			ModelMap m, HttpServletRequest req) {
		// 忽略大小写
			if (tel.length()>0&&pass1.length() > 0&&pass1.equalsIgnoreCase(pass2)) {
				service.insert(new client(tel, MD5Util.MD5(pass1), "会员2", email, AutoDate.Now(), AutoDate.Now(), 1, "", 1, 0, "", ""));
				return new JsonData(1);
			}
		return new JsonData(0);
	}

	@RequestMapping("login")
	public String login(client t, String code, ModelMap m,
			HttpServletRequest req) {
		String r = req.getSession().getAttribute("randomCode").toString();
		if (!code.equalsIgnoreCase(r)){
			
			return "redirect:../clogin.jsp";}
		t.setPass(MD5Util.MD5(t.getPass()));
		client info = service.login(t);
		if (info == null){
			
			return "redirect:../clogin.jsp";}
//		req.getSession().setMaxInactiveInterval(100);
		req.getSession().setAttribute("user", info);
		
		return "redirect:../cindex.jsp";
	}
	
	@RequestMapping("clear")
	public String clear(int id, ModelMap m, HttpServletRequest req) {
		client c=service.getById(id);
		c.setPass(MD5Util.MD5("123"));
		service.updatepass(c);
		return index(new SeachInfo(), m, req);
	}
	
	@RequestMapping("outlogin")
	public String outlogin(HttpServletRequest req){
		req.getSession().removeAttribute("user");
		return "redirect:../clogin.jsp";
	}
}

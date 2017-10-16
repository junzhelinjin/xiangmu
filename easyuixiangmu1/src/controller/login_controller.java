package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.courier;
import entity.operator;
import service.courier_service;
import service.operator_service;
import utils.JsonData;

@Controller
@RequestMapping("login")
public class login_controller {
	@Resource(name="operator_serviceImpl")
	operator_service service;
	@Resource(name="courier_serviceImpl")
	courier_service cservice;
	@RequestMapping("loginweb")
	public @ResponseBody JsonData login(operator t,String code,HttpServletRequest req){
		String r=req.getSession().getAttribute("randomCode").toString();
		if(!code.equalsIgnoreCase(r)){
			return new JsonData(0);
		}else{
//			t.setPass(MD5Util.MD5(t.getPass()));
			operator info=service.login(t);
			if(info == null){
				return new JsonData(0);
			}
			
			req.getSession().setMaxInactiveInterval(10*3600);
			req.getSession().setAttribute("user", info);
			return new JsonData(1);
		}
	}
	
	@RequestMapping("loginphone")
	public @ResponseBody JsonData loginphone(courier t,String code,HttpServletRequest req){
		String r=req.getSession().getAttribute("randomCode").toString();
		if(!code.equalsIgnoreCase(r)){
			return new JsonData(0);
		}else{
//			t.setPass(MD5Util.MD5(t.getPass()));
			courier info=cservice.login(t);
			if(info == null){
				return new JsonData(0);
			}
			req.getSession().setMaxInactiveInterval(10*3600);
			req.getSession().setAttribute("puser", info);
			return new JsonData(1);
		}
	}
	
	
	@RequestMapping("updatepass")
	public @ResponseBody JsonData updatepass(int id,String old,String pass1,String pass2){
		System.out.println(id);
		operator info=service.getById(id);
		if(info.getPass().equalsIgnoreCase(old)){
			if(pass1.equalsIgnoreCase(pass2)){
				service.updatepass(new operator(id,pass1));
				return new JsonData(1);
			}
		}
		return new JsonData(0);
	}
	@RequestMapping("updatephone")
	public @ResponseBody JsonData updatephone(int id,String old,String pass1,String pass2,HttpServletRequest req){
		System.out.println(id);
		courier info=cservice.getById(id);
		if(info.getPass().equalsIgnoreCase(old)){
			if(pass1.equalsIgnoreCase(pass2)){
				cservice.updatepass(new courier(id,pass1));
				req.getSession().removeAttribute("puser");
				return new JsonData(1);
			}
		}
		return new JsonData(0);
	}
	
	@RequestMapping("outlogin")
	public String outlogin(HttpServletRequest req){
		req.getSession().removeAttribute("user");
		return "redirect:../login.html";
	}
	
	@RequestMapping("outloginphone")
	public String outloginphone(HttpServletRequest req){
		req.getSession().removeAttribute("puser");
		return "redirect:../h5/login.jsp";
	}
}

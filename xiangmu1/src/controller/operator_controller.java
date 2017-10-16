package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.operator;
import service.operator_service;
import utils.AutoDate;
import utils.JsonData;
import utils.MD5Util;
import utils.Values;

@Controller
@RequestMapping("admin/operator")	
public class operator_controller extends Basic_controller<operator> {
	@Resource(name = "operator_serviceImpl")
	operator_service service;

	@RequestMapping("insert1")
	public @ResponseBody
	JsonData insert1(operator t, ModelMap m, HttpServletRequest req) {
		t.setPass(MD5Util.MD5(t.getPass()));
		t.setLastdate(AutoDate.Now());
		service.insert(t);
		return new JsonData(1);
	}

	@RequestMapping("index1")
	public String index(ModelMap m, HttpServletRequest req) {
		m.put("list", service.getall());
		return "operator/index";
	}

	@RequestMapping("edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", service.getById(id));
		m.put("powerslist", Values.powersname);
		m.put("statuslist", Values.statusname);
		return add(m, req);
	}

	@RequestMapping("update1")
	public @ResponseBody
	JsonData update1(operator t, ModelMap m, HttpServletRequest req) {
		t.setLastdate(AutoDate.Now());
		service.update(t);
		return new JsonData(1);
	}
	@RequestMapping("editpass")
	public String editpass(int id,ModelMap m,HttpServletRequest req){
		m.put("id", id);
		return "operator/editpass";
	}
	@RequestMapping("updatepass")
	public @ResponseBody
	JsonData updatepass(int id, String old, String new1, String new2,
			ModelMap m, HttpServletRequest req) {
		operator info = service.getById(id);
		if (info.getPass().equalsIgnoreCase(MD5Util.MD5(old))) {
			if (new1.length() > 0 && new1.equalsIgnoreCase(new2)) {
				service.updatepass(new operator(id, MD5Util.MD5(new1)));
//				service.updatepass(new operator(id, new1));
//				return index(new SeachInfo(), m, req);
				return new JsonData(1);
			}
		}
		m.put("id", id);
		return new JsonData(0);
	}

	@RequestMapping("register")
	public @ResponseBody
	JsonData insert2(String account, String pass1, String pass2, String name,
			ModelMap m, HttpServletRequest req) {
		// ºöÂÔ´óÐ¡Ð´
			if (pass1.length() > 0&&pass1.equalsIgnoreCase(pass2)) {
				service.insert(new operator(account, MD5Util.MD5(pass1), name,
						"00000", AutoDate.Now(), 0, 1, " "));
				return new JsonData(1);
			}
		return new JsonData(0);
	}

	@RequestMapping("login")
	public String login(operator t, String code, ModelMap m,
			HttpServletRequest req) {
		String r = req.getSession().getAttribute("randomCode").toString();
		if (!code.equalsIgnoreCase(r))
			return "redirect:../login.jsp";
		t.setPass(MD5Util.MD5(t.getPass()));
		operator info = service.login(t);
		if (info == null)
			return "redirect:../login.jsp";
		req.getSession().setMaxInactiveInterval(10*100*3600);
		req.getSession().setAttribute("user", info);
		return "redirect:../index.jsp";
	}
	@RequestMapping("outlogin")
	public String outlogin(HttpServletRequest req){
		req.getSession().removeAttribute("user");
		return "redirect:../login.jsp";
	}
}

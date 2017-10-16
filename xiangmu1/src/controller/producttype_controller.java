package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.producttype;
import service.producttype_service;
import utils.JsonData;
import utils.SeachInfo;

@Controller
@RequestMapping("admin/producttype")
public class producttype_controller extends Basic_controller<producttype> {
	@Resource(name = "producttype_serviceImpl")
	producttype_service service;

	@RequestMapping("insert1")
	public @ResponseBody
	JsonData insert1(producttype t, ModelMap m, HttpServletRequest req) {
		service.insert(t);
		return new JsonData(1);
	}

	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", service.getById(id));
		m.put("types", service.getByWhere(new SeachInfo(" where producttype.parentid=0 ", false)));
		return add(m, req);
	}

	@RequestMapping("update1")
	public @ResponseBody
	JsonData update1(producttype t, ModelMap m, HttpServletRequest req) {
		service.update(t);
		return new JsonData(1);
	}
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) {
		m.put("types", service.getByWhere(new SeachInfo(" where producttype.parentid=0 ", false)));
		return super.add(m, req);
	}
	

}

package controller;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BasicService;
import utils.SeachInfo;

public class Basic_controller<T> {
	
	private String getTypeName(){
		ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
		Class cls=(Class) type.getActualTypeArguments()[0];
		return cls.getSimpleName();
	}
	
	private BasicService<T> getService(){
		try {
			Field f=getClass().getDeclaredField("service");
			f.setAccessible(true);
			return (BasicService<T>) f.get(this);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} 
	}
	
	@RequestMapping("add")
	public String add(ModelMap m,HttpServletRequest req){
		return getTypeName()+"/edit";
	}
	@RequestMapping("edit")
	public String edit(int id,ModelMap m,HttpServletRequest req){		
		m.put("info", getService().getById(id));
		return add(m, req);
	}
	
	@RequestMapping("del")
	public String del(int id,ModelMap m,HttpServletRequest req){
		getService().delete(id);
		return index(new SeachInfo(), m, req);
	}
	
	@RequestMapping("index")
	public String index(SeachInfo info,ModelMap m,HttpServletRequest req){
		m.put("value", req.getParameter("value"));
		m.put("list", getService().getByWhere(info));
		m.put("where", info);
		return getTypeName()+"/index";
	}
	
	@RequestMapping("insert")
	public String insert(T t,ModelMap m,HttpServletRequest req){
		getService().insert(t);
		return index(new SeachInfo(), m, req);
	}
	
	@RequestMapping("update")
	public String update(T t,ModelMap m,HttpServletRequest req){
		getService().update(t);
		return index(new SeachInfo(), m, req);
	}
}

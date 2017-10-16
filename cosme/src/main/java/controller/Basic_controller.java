package controller;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Basic_Service;
import utils.JsonData;
import utils.JsonList;
import utils.Search;

public class Basic_controller <T>{
	
	
	private String getTypeName(){
		 ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();  
	       Class cls= (Class) type.getActualTypeArguments()[0];  
	       return cls.getSimpleName();        	
	}
	
	
	private Basic_Service<T> getService(){
		try {
			Field f=getClass().getDeclaredField("service");
			f.setAccessible(true);
			return (Basic_Service<T>) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	@RequestMapping("del")
	public @ResponseBody JsonData del(int id,HttpServletRequest req){
			getService().delete(id);
			return new JsonData(1);
	}
	
	@RequestMapping("index")
	public @ResponseBody JsonList index(Search info,HttpServletRequest req){
		List<T> list=getService().getByWhere(info);
		return new JsonList(list,info.getRows());
	}
	
	@RequestMapping("insert")
	public @ResponseBody JsonData  insert(T t,HttpServletRequest req){
		getService().insert(t);
		return new JsonData(1);
	}
	
	@RequestMapping("update")
	public @ResponseBody JsonData update(T t,HttpServletRequest req){
		getService().update(t);
		return new JsonData(1);
	}

}

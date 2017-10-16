package controller;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.operator;
import service.Basic_service;
import utils.JsonData;
import utils.JsonList;
import utils.Seach;

public class Basic_controller<T> {
	private String getTypeName(){
		ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
		Class cls=(Class) type.getActualTypeArguments()[0];
		return cls.getSimpleName();
	}
	
	private Basic_service<T> getService(){
		try {
			Field f=getClass().getDeclaredField("service");
			f.setAccessible(true);
			return (Basic_service<T>) f.get(this);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} 
	}
	
	@RequestMapping("index")
	public @ResponseBody JsonList index(String txt,Seach s){
		if(txt!=null&&txt.length()>0)
			s.setWhere(" where name like '%"+txt+"%'");
		List<T> list=getService().getByWhere(s);
		int total=list.size();
		return new JsonList(list,s.getRows());
	}
	
	@RequestMapping("insert")
	public @ResponseBody JsonData add(T t){
		getService().insert(t);
		return new JsonData(1);
	} 
	@RequestMapping("update")
	public @ResponseBody JsonData update(T t){
		getService().update(t);
		return new JsonData(1);
	} 
	@RequestMapping("del")
	public @ResponseBody JsonData del(int id){
		getService().delete(id);
		return new JsonData(1);
	}
}

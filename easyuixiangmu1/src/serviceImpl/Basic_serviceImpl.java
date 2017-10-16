package serviceImpl;

import java.lang.reflect.Field;
import java.util.List;

import entity.courier;
import mapper.Basic_mapper;
import utils.Seach;
import utils.SeachInfo;

public class Basic_serviceImpl<T> {
	private Basic_mapper<T> getMapper(){
		try {
			Field f=getClass().getDeclaredField("mapper");
			f.setAccessible(true);
			return (Basic_mapper<T>) f.get(this);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} 
	}
	

	
	public List<T> getByWhere(Seach info) {
		long r=(getMapper().getByWhereSize(info));
		List<T> list=getMapper().getByWhere(info);
		info.setRows((int)r);
		return list;
	}

	public void insert(T t) {
		getMapper().insert(t);
	}

	public void update(T t) {
		getMapper().update(t);
	}

	public void delete(int id) {
		getMapper().delete(id);
	}

	public long getByWhereSize(Seach info) {		
		return getMapper().getByWhereSize(info);
	}

	public T getById(int id) {
		return getMapper().getById(id);
	}
	
	public List<T> getall(){
		return getMapper().getall();
	}
}

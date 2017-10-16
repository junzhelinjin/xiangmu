package serviceImpl;

import java.lang.reflect.Field;
import java.util.List;

import mapper.Basic_mapper;
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
	

	
	public List<T> getByWhere(SeachInfo info) {
		if(info.isCanpage()){
			info.setRowcount(getMapper().getByWhereSize(info));
		}
		return getMapper().getByWhere(info);
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
	
	public List<T> getall() {
		return getMapper().getall();
	}
	
	public long getByWhereSize(SeachInfo info) {		
		return getMapper().getByWhereSize(info);
	}

	public T getById(int id) {
		return getMapper().getById(id);
	}
}

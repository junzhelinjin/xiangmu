package service;

import java.util.List;

import utils.SeachInfo;

public interface BasicService<T> {//·ºÐÍ
	
	public List<T> getByWhere(SeachInfo info);
	
	public void insert(T t);
	
	public void update(T t);
	
	public void delete(int id);
	
	public List<T> getall();
	
	public T getById(int id);
}

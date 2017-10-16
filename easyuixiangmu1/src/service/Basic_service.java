package service;

import java.util.List;

import utils.Seach;

public interface Basic_service<T> {
	
	public List<T> getByWhere(Seach info);
	
	public void insert(T t);
	
	public void update(T t);
	
	public void delete(int id);

	public T getById(int id);
	
	public List<T> getall();
}

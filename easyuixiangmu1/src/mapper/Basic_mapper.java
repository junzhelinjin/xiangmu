package mapper;

import java.util.List;

import utils.Seach;

public interface Basic_mapper<T> {
	
	public List<T> getByWhere(Seach info);
	
	public long getByWhereSize(Seach info);
	
	public void insert(T t);
	
	public void update(T t);
	
	public void delete(int id);
	
	public T getById(int id);

	public List<T> getall();
}

package mapper;

import java.util.List;

import utils.Search;

public interface Basic_mapper <T>{
	public List<T> getByWhere(Search info);
	
	public long getByWhereSize(Search info);
	
	public void insert(T t);
	
	public void update(T t);
	
	public void delete(int id);
	
	public T getById(int id);
	
}

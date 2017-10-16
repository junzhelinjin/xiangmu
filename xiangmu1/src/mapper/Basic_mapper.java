package mapper;

import java.util.List;
import utils.SeachInfo;

public interface Basic_mapper<T> {
	
	public List<T> getByWhere(SeachInfo info);
	
	public long getByWhereSize(SeachInfo info);
	
	public void insert(T t);
	
	public void update(T t);
	
	public void delete(int id);
	
	public T getById(int id);
	
	public List<T> getall();
	
}

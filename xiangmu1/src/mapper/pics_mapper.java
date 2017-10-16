package mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import utils.SeachInfo;
import entity.pics;
@Repository("pics_mapper")
public interface pics_mapper extends Basic_mapper<pics> {
	@Select("select * from pics where id in (${where})")
	public List<pics> getByWhere(SeachInfo info);
	@Insert("insert into pics(url,path) values(#{url},#{path})")
	public void insert(pics t);
	@Delete("delete from pics where id=#{id}")
	public void delete(int id);
	@Select("select max(id) from pics")
	public int getMaxId();
	@Select("select * from pics ${where} ${sort} ${limit}")
	public List<pics> getallwhere(SeachInfo info);
	@Select("select count(1) from pics ${where}")
	public long getByWhereSize(SeachInfo info);
	@Select("select * from pics where id=#{id}")
	public pics getById(int id);
}

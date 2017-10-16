package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.SeachInfo;
import entity.producttype;
@Repository("producttype_mapper")
public interface producttype_mapper extends Basic_mapper<producttype> {
	@Select("select producttype.*,t.name parentname from producttype left join producttype t on producttype.parentid=t.id ${where} ${sort} ${limit}")
	public List<producttype> getByWhere(SeachInfo info);
	@Select("select count(1) from producttype left join producttype t on producttype.parentid=t.id ${where}")
	public long getByWhereSize(SeachInfo info);
	@Insert("insert into producttype(name,parentid) values(#{name},#{parentid})")
	public void insert(producttype t);
	@Update("update producttype set name=#{name},parentid=#{parentid} where id=#{id}")
	public void update(producttype t);
	@Delete("delete from producttype where id=#{id}")
	public void delete(int id);
	@Select("select producttype.*,t.name parentname from producttype left join producttype t on producttype.parentid=t.id where producttype.id=#{id}")
	public producttype getById(int id);
}

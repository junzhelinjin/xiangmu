package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import entity.operator;

@Repository("operator_mapper")
public interface operator_mapper extends Basic_mapper<operator>{
	@Select("select * from operator ${where} ${sort} ${limit}")
	public List<operator> getByWhere(Seach info);
	@Select("select count(1) from operator ${where}")
	public long getByWhereSize(Seach info);
	@Insert("insert into operator(tel,code,pass,name,idcard,status) values(#{tel},#{code},#{pass},#{name},#{idcard},#{status})")
	public void insert(operator t);
	@Update("update operator set code=#{code},name=#{name},idcard=#{idcard},status=#{status} where id=#{id}")
	public void update(operator t);
	@Delete("delete from operator where id=#{id}")
	public void delete(int id);
	@Select("select * from operator where id=#{id}")
	public operator getById(int id);
	@Update("update operator set pass=#{pass} where id=#{id}")
	public void updatepass(operator t);
	@Select("select * from operator where tel=#{tel} and pass=#{pass}")
	public operator login(operator t);
	@Select("select * from operator")
	public List<operator> getall();
}

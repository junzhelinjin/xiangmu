package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import entity.express;

@Repository("express_mapper")
public interface express_mapper extends Basic_mapper<express>{
	@Select("select * from express ${where} ${sort} ${limit}")
	public List<express> getByWhere(Seach info);
	@Select("select count(1) from express ${where}")
	public long getByWhereSize(Seach info);
	@Insert("insert into express(name,tel) values(#{name},#{tel})")
	public void insert(express t);
	@Update("update express set name=#{name},tel=#{tel} where id=#{id}")
	public void update(express t);
	@Delete("delete from express where id=#{id}")
	public void delete(int id);
	@Select("select * from express where id=#{id}")
	public express getById(int id);
	@Select("select * from express")
	public List<express> getall();
}

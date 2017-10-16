package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import entity.courier;

@Repository("courier_mapper")
public interface courier_mapper extends Basic_mapper<courier>{
	@Select("select * from courier ${where} ${sort} ${limit}")
	public List<courier> getByWhere(Seach info);
	@Select("select count(1) from courier ${where}")
	public long getByWhereSize(Seach info);
	@Insert("insert into courier(tel,code,pass,name,idcard,status) values(#{tel},#{code},#{pass},#{name},#{idcard},#{status})")
	public void insert(courier t);
	@Update("update courier set code=#{code},name=#{name},idcard=#{idcard},status=#{status} where id=#{id}")
	public void update(courier t);
	@Delete("delete from courier where id=#{id}")
	public void delete(int id);
	@Select("select * from courier where id=#{id}")
	public courier getById(int id);
	@Update("update courier set pass=#{pass} where id=#{id}")
	public void updatepass(courier t);
	@Select("select * from courier where tel=#{tel} and pass=#{pass}")
	public courier login(courier t);
	@Select("select * from courier")
	public List<courier> getall();
}

package mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.SeachInfo;
import entity.client;
@Repository("client_mapper")
public interface client_mapper extends Basic_mapper<client> {
	@Select("select * from client ${where} ${sort} ${limit}")
	public List<client> getByWhere(SeachInfo info);
	@Select("select count(1) from client ${where}")
	public long getByWhereSize(SeachInfo info);
	@Insert("insert into client(tel,pass,nickname,email,createdate,lastdate,question,questionresult,status,logincount,logindate,comments) values(#{tel},#{pass},#{nickname},#{email},#{createdate},#{lastdate},#{question},#{questionresult},#{status},#{logincount},#{logindate},#{comments})")
	public void insert(client t);
	@Update("update client set nickname=#{nickname},email=#{email},question=#{question},questionresult=#{questionresult},status=#{status},comments=#{comments} where id=#{id}")
	public void update(client t);
	@Delete("delete from client where id=#{id}")
	public void delete(int id);
	@Select("select * from client where id=#{id}")
	public client getById(int id);
	@Select("select * from client")
	public List<client> getall();
	@Update("update client set pass=#{pass} where id=#{id}")
	public void updatepass(client t);
	@Select("select * from client where tel=#{tel} and pass=#{pass}")
	public client login(client t);
}

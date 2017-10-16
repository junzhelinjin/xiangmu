package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import entity.zone;

@Repository("zone_mapper")
public interface zone_mapper extends Basic_mapper<zone>{
	@Select("select zone.*,courier.name cname,z.name parentname from zone inner join courier on zone.courier_id=courier.id left join zone z on zone.parentid=z.id ${where} ${sort} ${limit}")
	public List<zone> getByWhere(Seach info);
	@Select("select count(1) from zone inner join courier on zone.courier_id=courier.id left join zone z on zone.parentid=z.id ${where}")
	public long getByWhereSize(Seach info);
	@Insert("insert into zone(name,parentid,courier_id) values(#{name},#{parentid},#{courier_id})")
	public void insert(zone t);
	@Update("update zone set name=#{name},parentid=#{parentid},courier_id=#{courier_id} where id=#{id}")
	public void update(zone t);
	@Delete("delete from zone where id=#{id}")
	public void delete(int id);
	@Select("select * from zone where id=#{id}")
	public zone getById(int id);
	@Select("select zone.*,courier.name cname from zone inner join courier on zone.courier_id=courier.id ${where}")
	public List<zone> getWhere(Seach info);
	@Select("select * from zone")
	public List<zone> getall();
	
}

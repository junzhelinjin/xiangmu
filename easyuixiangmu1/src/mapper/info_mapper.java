package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import utils.SeachInfo;
import entity.info;

@Repository("info_mapper")
public interface info_mapper extends Basic_mapper<info>{
	@Select("select info.*,`order`.id oname,express.name ename,zone.name zname,courier.name cname from info inner join `order` inner join express inner join zone inner join courier on info.order_id=`order`.id and info.express_id=express.id and info.zone_id=zone.id and info.courier_id=courier.id ${where} ${sort} ${limit}")
	public List<info> getByWhere(Seach info);
	@Select("select count(1) from info inner join `order` inner join express inner join zone inner join courier on info.order_id=`order`.id and info.express_id=express.id and info.zone_id=zone.id and info.courier_id=courier.id ${where}")
	public long getByWhereSize(Seach info);
	@Insert("insert into info(code,order_id,express_id,zone_id,size,status,type,donedate,createdate,courier_id,comments) values(#{code},#{order_id},#{express_id},#{zone_id},#{size},#{status},#{type},#{donedate},#{createdate},#{courier_id},#{comments})")
	public void insert(info t);
	@Update("update info set zone_id=#{zone_id},size=#{size},status=#{status},type=#{type},donedate=#{donedate},courier_id=#{courier_id},comments=#{comments} where id=#{id}")
	public void update(info t);
	@Delete("delete from info where id=#{id}")
	public void delete(int id);
	@Select("select info.*,`order`.id oname,express.name ename,zone.name zname,courier.name cname from info inner join `order` inner join express inner join zone inner join courier on info.order_id=`order`.id and info.express_id=express.id and info.zone_id=zone.id and info.courier_id=courier.id where info.id=#{id}")
	public info getById(int id);
	@Select("select info.*,`order`.id oname,express.name ename,zone.name zname,courier.name cname from info inner join `order` inner join express inner join zone inner join courier on info.order_id=`order`.id and info.express_id=express.id and info.zone_id=zone.id and info.courier_id=courier.id ${where}")
	public List<info> getall(SeachInfo info);
	@Update("update info set status=#{status},donedate=#{donedate} where id=#{id}")
	public void update1(info t);
}

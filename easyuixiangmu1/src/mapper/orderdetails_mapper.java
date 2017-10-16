package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import entity.orderdetails;

@Repository("orderdetails_mapper")
public interface orderdetails_mapper extends Basic_mapper<orderdetails>{
	@Select("select orderdetails.*,`order`.id oid,info.id iid from orderdetails inner join `order` inner join info on orderdetails.order_id=`order`.id and orderdetails.info_id=info.id ${where} ${sort} ${limit}")
	public List<orderdetails> getByWhere(Seach orderdetails);
	@Select("select count(1) from orderdetails inner join `order` inner join info on orderdetails.order_id=`order`.id and orderdetails.info_id=info.id ${where}")
	public long getByWhereSize(Seach orderdetails);
	@Insert("insert into orderdetails(order_id,info_id,comments) values(#{order_id},#{info_id},#{comments})")
	public void insert(orderdetails t);
	@Update("update orderdetails set order_id=#{order_id},info_id=#{info_id},comments=#{comments} where id=#{id}")
	public void update(orderdetails t);
	@Delete("delete from orderdetails where id=#{id}")
	public void delete(int id);
	@Select("select * from orderdetails where id=#{id}")
	public orderdetails getById(int id);
	@Select("select * from orderdetails")
	public List<orderdetails> getall();
}

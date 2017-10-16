package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.Seach;
import entity.order;

@Repository("order_mapper")
public interface order_mapper extends Basic_mapper<order>{
	@Select("select `order`.*,express.name ename,operator.name oname,courier.name cname from `order` inner join express inner join operator inner join courier on `order`.express_id=express.id and `order`.operator_id=operator.id and `order`.courier_id=courier.id ${where} ${sort} ${limit}")
	public List<order> getByWhere(Seach order);
	@Select("select count(1) from `order` inner join express inner join operator inner join courier on `order`.express_id=express.id and `order`.operator_id=operator.id and `order`.courier_id=courier.id ${where}")
	public long getByWhereSize(Seach order);
	@Insert("insert into `order`(date,express_id,enterdate,operator_id,count,courier_id,status) values(#{date},#{express_id},#{enterdate},#{operator_id},#{count},#{courier_id},#{status})")
	public void insert(order t);
	@Update("update `order` set enterdate=#{enterdate},operator_id=#{operator_id},courier_id=#{courier_id},status=#{status} where id=#{id}")
	public void update(order t);
	@Update("update `order` set status=#{status} where id=#{id}")
	public void update1(order t);
	@Delete("delete from `order` where id=#{id}")
	public void delete(int id);
	@Select("select * from `order` where id=#{id}")
	public order getById(int id);
	@Select("select * from `order`")
	public List<order> getall();
}

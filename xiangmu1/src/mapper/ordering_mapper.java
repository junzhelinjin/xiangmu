package mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.SeachInfo;
import entity.ordering;
@Repository("ordering_mapper")
public interface ordering_mapper extends Basic_mapper<ordering> {
	@Select("select ordering.*,client.nickname cname,product.name pname,operator.name oname from ordering inner join client inner join product inner join operator on ordering.client_id=client.id and ordering.product_id=product.id and ordering.lastoperator_id=operator.id ${where} ${sort} ${limit}")
	public List<ordering> getByWhere(SeachInfo info);
	@Select("select count(1) from ordering inner join client inner join product inner join operator on ordering.client_id=client.id and ordering.product_id=product.id and ordering.lastoperator_id=operator.id ${where}")
	public long getByWhereSize(SeachInfo info);
	@Insert("insert into ordering(date,client_id,product_id,count,amount,disc,status,lastoperator_id) values(#{date},#{client_id},#{product_id},#{count},#{amount},#{disc},#{status},#{lastoperator_id})")
	public void insert(ordering t);
	@Update("update ordering set status=#{status} where id=#{id}")
	public void update(ordering t);
	@Delete("delete from ordering where id=#{id}")
	public void delete(int id);
	@Select("select * from ordering where id=#{id}")
	public ordering getById(int id);
}

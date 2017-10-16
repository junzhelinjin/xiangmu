package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.SeachInfo;
import entity.pics;
import entity.product;
import entity.operator;
@Repository("product_mapper")
public interface product_mapper extends Basic_mapper<product> {
	@Select("select product.*,operator.name oname,producttype.name pname1,t.name pname from product inner join operator inner join producttype on product.operator_id=operator.id and product.producttype_id=producttype.id left join producttype t on producttype.parentid=t.id ${where} ${sort} ${limit}")
	public List<product> getByWhere(SeachInfo info);
	@Select("select count(1) from product inner join operator inner join producttype on product.operator_id=operator.id and product.producttype_id=producttype.id left join producttype t on producttype.parentid=t.id  ${where}")
	public long getByWhereSize(SeachInfo info);
	@Insert("insert into product(name,producttype_id,price,disc,pics,info,salcount,operator_id) values(#{name},#{producttype_id},#{price},#{disc},#{pics},#{info},#{salcount},#{operator_id})")
	public void insert(product t);
	@Update("update product set producttype_id=#{producttype_id},price=#{price},disc=#{disc},pics=#{pics},info=#{info} where id=#{id}")
	public void update(product t);
	@Delete("delete from product where id=#{id}")
	public void delete(int id);
	@Select("select product.*,t.id tid from product inner join operator inner join producttype on product.operator_id=operator.id and product.producttype_id=producttype.id left join producttype t on producttype.parentid=t.id where product.id=#{id}")
	public product getById(int id);
	@Select("select * from product")
	public List<product> getall();
}

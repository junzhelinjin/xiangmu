package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import utils.SeachInfo;
import entity.shopcar;
@Repository("shopcar_mapper")
public interface shopcar_mapper extends Basic_mapper<shopcar> {
	@Select("select shopcar.*,client.nickname cname,product.name pname from shopcar inner join client inner join product on shopcar.client_id=client.id and shopcar.product_id=product.id ${where} ${sort} ${limit}")
	public List<shopcar> getByWhere(SeachInfo info);
	@Select("select count(1) from shopcar inner join client inner join product on shopcar.client_id=client.id and shopcar.product_id=product.id ${where}")
	public long getByWhereSize(SeachInfo info);
	@Insert("insert into shopcar(client_id,product_id,count) values(#{client_id},#{product_id},#{count})")
	public void insert(shopcar t);
	@Update("update shopcar set product_id=#{product_id},count=#{count} where id=#{id}")
	public void update(shopcar t);
	@Delete("delete from shopcar where id=#{id}")
	public void delete(int id);
	@Select("select * from shopcar where id=#{id}")
	public shopcar getById(int id);
	@Select("select shopcar.*,product.* from shopcar left join product on shopcar.product_id=product.id ${where} ${sort} ${limit}")
	public List<shopcar> getByWhereAll(SeachInfo info);
}

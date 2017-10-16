package mapper;

import entity.Message;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("Message_mapper")
public interface Message_mapper extends Basic_mapper<Message>{
    @Select("select message.*,operator.name oname from message inner join operator on message.operator_send_id=operator.id ${where} ${sort} ${limit}")
    public List<Message> getByWhere(Search info);
    @Select("select count(1) from message inner join operator on message.operator_send_id=operator.id ${where}")
    public long getByWhereSize(Search info);
    @Insert("insert into message(date,send_id,operator_send_id,operator_dest_id,infotype,info_id,info,status,url_s,url_p) values(#{date},#{send_id},#{operator_send_id},#{operator_dest_id},#{infotype},#{info_id},#{info},#{status},#{url_s},#{url_p})")
    public void insert(Message t);
    @Update("update message set date=#{date},send_id=#{send_id},operator_send_id=#{operator_send_id},operator_dest_id=#{operator_dest_id},infotype=#{infotype},info_id=#{info_id},info=#{info},status=#{status},readdate=#{readdate},url_s=#{url_s},url_p=#{url_p} where id=#{id}")
    public void update(Message t);
    @Delete("delete from message where id=#{id}")
    public void delete(int id);
    @Select("select * from message where id=#{id}")
    public Message getById(int id);

}

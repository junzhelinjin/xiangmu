package mapper;

import entity.Message_send;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("Message_send_mapper")
public interface Message_send_mapper extends Basic_mapper<Message_send>{
    @Select("select message_send.*,operator.name oname from message_send inner join operator on message_send.operator_send_id=operator.id ${where} ${sort} ${limit}")
    public List<Message_send> getByWhere(Search info);
    @Select("select count(1) from message_send inner join operator on message_send.operator_send_id=operator.id ${where}")
    public long getByWhereSize(Search info);
    @Insert("insert into message_send(date,operator_send_id,operator_dest_ids,operator_dest_names,infotype,infoid,info,status,url_s,url_p) values(#{date},#{operator_send_id},#{operator_dest_ids},#{operator_dest_names},#{infotype},#{infoid},#{info},#{status},#{url_s},#{url_p})")
    public void insert(Message_send t);
    @Update("update message_send set operator_dest_ids=#{operator_dest_ids},operator_dest_names=#{operator_dest_names},infotype=#{infotype},info=#{info},status=#{status},url_s=#{url_s} where id=#{id}")
    public void update(Message_send t);
    @Delete("delete from message_send where id=#{id}")
    public void delete(int id);
    @Select("select * from message_send where id=#{id}")
    public Message_send getById(int id);
    @Select("select * from message_send")
    public List<Message_send> getall();
    @Update("update message_send set status=#{status} where id=#{id}")
    public void update1(Message_send t);
}

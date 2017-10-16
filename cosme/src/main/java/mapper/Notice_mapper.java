package mapper;

import entity.Notice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("Notice_mapper")
public interface Notice_mapper extends Basic_mapper<Notice>{
    @Select("select notice.*,operator.name oname from notice inner join operator on notice.operator_id=operator.id ${where} ${sort} ${limit}")
    public List<Notice> getByWhere(Search info);
    @Select("select count(1) from notice inner join operator on notice.operator_id=operator.id ${where}")
    public long getByWhereSize(Search info);
    @Insert("insert into notice(createdate,startdate,message,operator_id,status,type,destids,noids,destdate) values(#{createdate},#{startdate},#{message},#{operator_id},#{status},#{type},#{destids},#{noids},#{destdate})")
    public void insert(Notice t);
    @Update("update notice set message=#{message},destids=#{destids},type=#{type} where id=#{id}")
    public void update(Notice t);
    @Delete("delete from notice where id=#{id}")
    public void delete(int id);
    @Select("select * from notice where id=#{id}")
    public Notice getById(int id);
    @Select("select * from notice")
    public List<Notice> getall();
}

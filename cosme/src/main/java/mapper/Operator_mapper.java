package mapper;

import entity.Operator;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;
@Repository("Operator_mapper")
public interface Operator_mapper extends Basic_mapper<Operator> {
    @Select("select * from operator ${where} ${sort} ${limit}")
    public List<Operator> getByWhere(Search info);
    @Select(" select count(1) from operator  ${where}")
    public long getByWhereSize(Search info);
    @Select("select * from operator where id=#{id}")
    public Operator getById(int id);
}

package mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import entity.operator;
@Repository("operator_mapper")
public interface operator_mapper extends Basic_mapper<operator> {
	public void updatepass(operator t);
	public operator login(operator t);
}

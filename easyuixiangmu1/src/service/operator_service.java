package service;


import entity.operator;

public interface operator_service extends Basic_service<operator>{
	public void updatepass(operator t);
	public operator login(operator t);
}

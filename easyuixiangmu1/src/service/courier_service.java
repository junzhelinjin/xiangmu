package service;


import entity.courier;

public interface courier_service extends Basic_service<courier>{
	public void updatepass(courier t);
	public courier login(courier t);
}

package service;

import entity.client;

public interface client_service extends BasicService<client> {
	public void updatepass(client t);
	public client login(client t);
}

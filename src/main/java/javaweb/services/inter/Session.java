package javaweb.services.inter;

import java.util.List;


public interface Session {
	public List<javaweb.Entity.Session> getAll();
	
	public boolean postNew(String id, boolean isSave);
	
	public boolean put(String id, boolean isValidate);
}

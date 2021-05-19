package javaweb.services.inter;

import java.util.List;


public interface Account {
	public List<javaweb.Entity.Account> getAll();
	public List<javaweb.Entity.Account> getAllFetch(String fetchField);
	
	public javaweb.Entity.Account getByUsernameAndPass(String username, String password,boolean isLazy);
	public javaweb.Entity.Account getByUsername(String username,boolean isLazy);
	public javaweb.Entity.Account getByUsernameFetch(String username, String fetchField);
	
	public boolean setAccountInfor(String username, String name, String email, String phone, int gender);
	public boolean setNewPass(String username, String newPass);
	public boolean setNewStatus(String username);
}

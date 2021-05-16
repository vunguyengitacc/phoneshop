package javaweb.services.inter;

import java.util.List;


public interface Account {
	public List<javaweb.Entity.Account> getAll();
	public javaweb.Entity.Account getByUsernameAndPass(String username, String password,boolean isLazy);
	public javaweb.Entity.Account getByUsername(String username,boolean isLazy);
	public boolean setAccountInfor(String username, String name, String email, String phone, int gender);
	public boolean setNewPass(String username, String newPass);
}

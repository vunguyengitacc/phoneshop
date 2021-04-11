package javaweb.services.inter;

import java.util.List;

public interface Account {
	public List<javaweb.Entity.Account> checkByUsername(String username);
}

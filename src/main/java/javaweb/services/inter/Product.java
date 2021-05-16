package javaweb.services.inter;

import java.util.List;

public interface Product {
	public List<javaweb.Entity.Product> getAll(); 
	public List<javaweb.Entity.Product> getByTradeMark(String tradeMark);
	public javaweb.Entity.Product getByID(int id, boolean isLazy);	
}

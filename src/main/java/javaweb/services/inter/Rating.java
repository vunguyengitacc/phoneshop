package javaweb.services.inter;

import java.util.List;

public interface Rating {
	public javaweb.Entity.Rating getByProductIDAndAccount(String username, int productId);
	public boolean putRating(String username, int productId, int value);
	public List<javaweb.Entity.Rating> getByProductID(int productId);
}

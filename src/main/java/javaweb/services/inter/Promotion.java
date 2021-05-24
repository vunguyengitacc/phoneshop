package javaweb.services.inter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface Promotion {
	public javaweb.Entity.Promotion getByID(String id);
	
	public javaweb.Entity.Promotion getByIDFetch(String id, List<String> lstField);
	
	public List<javaweb.Entity.Promotion> getAllFetch(List<String> lstField);
	
	public boolean postNew(String id, BigDecimal value, Date expiredDate, int type);
	
	public boolean put(String id, BigDecimal value, Date expiredDate, int type);
	
}

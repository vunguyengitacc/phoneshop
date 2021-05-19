package javaweb.services.inter;

import java.math.BigDecimal;
import java.util.List;

import javaweb.Entity.Account;

public interface Bill {
	public int postBill(Account acc, int comm, BigDecimal totalValue, int promo);

	public javaweb.Entity.Bill getByID(int billID);

	public List<javaweb.Entity.Bill> getAll();
	
	public List<javaweb.Entity.Bill> getAllFetch();
	
}

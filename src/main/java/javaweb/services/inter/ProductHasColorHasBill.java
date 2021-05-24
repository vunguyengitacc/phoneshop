package javaweb.services.inter;

public interface ProductHasColorHasBill {
	public boolean postNew(int colorId, int productId, int billId, int amount);
	
	public boolean deleteByBillId(int billId);
}

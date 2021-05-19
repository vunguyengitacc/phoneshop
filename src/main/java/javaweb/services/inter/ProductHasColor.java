package javaweb.services.inter;

public interface ProductHasColor {
	//get exist
	public int getAmount(int idProduct, int idColor);

	public javaweb.Entity.ProductHasColor getByIDColorAndProduct(int idProduct, int idColor);

	//create new
	public boolean postNew(int idProduct, int idColor, int amount);

	//update exist
	public boolean put(int idProduct, int idColor, int amount);

	//delete exist
	public boolean deleteOne(int idProduct, int idColor);
	
	public boolean deleteMany(int idProduct);

}

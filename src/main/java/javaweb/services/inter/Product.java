package javaweb.services.inter;

import java.math.BigDecimal;
import java.util.List;

public interface Product {
	public List<javaweb.Entity.Product> getAll();

	public List<javaweb.Entity.Product> getByTradeMark(String tradeMark);

	public javaweb.Entity.Product getByID(int id, boolean isLazy);

	public int postNew(String name, BigDecimal originalPrice, BigDecimal price, BigDecimal promotionPrice,
			String image, String description, int ram, int rom, BigDecimal screenSize, String frontCamera,
			String backCamera, int batteryCapacity, String os, String cpu, String gpu, String sim, int idTrade);

	public boolean putByID(int id, String name, BigDecimal originalPrice, BigDecimal price, BigDecimal promotionPrice,
			String image, String description, int ram, int rom, BigDecimal screenSize, String frontCamera,
			String backCamera, int batteryCapacity, String os, String cpu, String gpu, String sim, int idTrade);

	public boolean deleteByID(int id);
}

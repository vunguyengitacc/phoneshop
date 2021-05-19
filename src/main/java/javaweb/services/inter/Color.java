package javaweb.services.inter;

public interface Color {
	public javaweb.Entity.Color getByID(int id);
	public javaweb.Entity.Color postNew(String newColorName);
}

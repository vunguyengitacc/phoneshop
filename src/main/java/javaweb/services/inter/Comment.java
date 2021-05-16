package javaweb.services.inter;

import java.util.List;

public interface Comment {
	public boolean postComment(String username, int idProduct, String content);
	public List<javaweb.Entity.Comment> getByIDProduct(int id);
}

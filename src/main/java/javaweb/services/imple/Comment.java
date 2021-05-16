package javaweb.services.imple;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("Comment")
public class Comment implements javaweb.services.inter.Comment {
	DBContext factory = new DBContext();

	@Autowired
	javaweb.services.imple.Product pro;
	@Autowired
	javaweb.services.imple.Account acc;

	@Override
	public boolean postComment(String username, int idProduct, String content) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Comment newComment = new javaweb.Entity.Comment();
		javaweb.Entity.Account account = acc.getByUsername(username, false);
		javaweb.Entity.Product product = pro.getByID(idProduct, false);
		if (account == null || product == null)
			return false;
		newComment.setCreateDate(new Date());
		newComment.setProduct(product);
		newComment.setAccount(account);
		newComment.setContent(content);
		account.getComments().add(newComment);
		product.getComments().add(newComment);
		ss.save(newComment);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public List<javaweb.Entity.Comment> getByIDProduct(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Comment.class).add(Restrictions.eq("product.id", id)).list();
		ss.close();
		return rs;
	}

}

package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.RatingId;

@Service("Rating")
public class Rating implements javaweb.services.inter.Rating {
	DBContext factory = new DBContext();

	@Autowired
	javaweb.services.imple.Product pro;
	@Autowired
	javaweb.services.imple.Account acc;

	@Override
	public javaweb.Entity.Rating getByProductIDAndAccount(String username, int productId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Rating rs = (javaweb.Entity.Rating) ss.createCriteria(javaweb.Entity.Rating.class)
				.add(Restrictions.eq("product.id", productId)).add(Restrictions.eq("account.username", username))
				.uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public boolean setRating(String username, int productId, int value) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Rating rs = (javaweb.Entity.Rating) ss.createCriteria(javaweb.Entity.Rating.class)
				.add(Restrictions.eq("product.id", productId)).add(Restrictions.eq("account.username", username))
				.uniqueResult();
		if (rs == null) {
			rs = new javaweb.Entity.Rating();
			javaweb.Entity.Account account = acc.getByUsername(username, false);
			javaweb.Entity.Product product = pro.getByID(productId, false);
			if (account == null || product == null)
				return false;
			rs.setAccount(account);
			rs.setProduct(product);
			rs.setRate(value);
			rs.setId(new RatingId(rs.getProduct().getId(), rs.getAccount().getUsername()));
		} else {
			rs.setRate(value);
		}
		ss.save(rs);
		ss.getTransaction().commit();
		;
		ss.close();
		return true;
	}

	@Override
	public List<javaweb.Entity.Rating> getByProductID(int productId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Rating.class).add(Restrictions.eq("product.id", productId))
				.list();
		ss.close();
		return rs;

	}

}

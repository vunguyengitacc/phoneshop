package javaweb.services.imple;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("Promotion")
public class Promotion implements javaweb.services.inter.Promotion {

	DBContext factory = new DBContext();

	@Override
	public javaweb.Entity.Promotion getByID(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Promotion promo = (javaweb.Entity.Promotion) ss.createCriteria(javaweb.Entity.Promotion.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		ss.close();
		return promo;
	}

}

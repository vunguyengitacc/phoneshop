package javaweb.services.imple;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("Commune")
public class Commune implements javaweb.services.inter.Commune {

	DBContext factory = new DBContext();

	@Override
	public javaweb.Entity.Commune getById(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Commune rs = (javaweb.Entity.Commune) ss.createCriteria(javaweb.Entity.Commune.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		ss.close();
		return rs;
	}

}
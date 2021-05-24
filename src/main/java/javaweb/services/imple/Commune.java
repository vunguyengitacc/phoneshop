package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("Commune")
public class Commune implements javaweb.services.inter.Commune {

	@Autowired
	DBContext factory;

	@Override
	public javaweb.Entity.Commune getById(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Commune rs = (javaweb.Entity.Commune) ss.createCriteria(javaweb.Entity.Commune.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public List<javaweb.Entity.Commune> getByWardID(int wardId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Commune.class).add(Restrictions.eq("ward.id", wardId)).list();
		ss.close();
		return rs;
	}

}

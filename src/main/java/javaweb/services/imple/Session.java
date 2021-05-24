package javaweb.services.imple;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("Session")
public class Session implements javaweb.services.inter.Session {

	@Autowired
	DBContext factory;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<javaweb.Entity.Session> getAll() {
		org.hibernate.Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Session.class).list();
		ss.close();
		return rs;
	}

	@Override
	public boolean postNew(String id, boolean isSave) {
		org.hibernate.Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Session newItem = (javaweb.Entity.Session) ss.createCriteria(javaweb.Entity.Session.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		if (newItem != null)
			return false;
		if (isSave)
			newItem = new javaweb.Entity.Session(id, 1, 1);
		else
			newItem = new javaweb.Entity.Session(id, 0, 1);
		ss.save(newItem);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean put(String id, boolean isValidate) {
		org.hibernate.Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Session newItem = (javaweb.Entity.Session) ss.createCriteria(javaweb.Entity.Session.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		if (newItem == null)
			return false;
		if (isValidate)
			newItem.setIsValidate(1);
		else
			newItem.setIsValidate(0);
		ss.save(newItem);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

}

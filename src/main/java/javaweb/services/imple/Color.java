package javaweb.services.imple;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("Color")
public class Color implements javaweb.services.inter.Color {
	@Autowired
	DBContext factory;

	@Override
	public javaweb.Entity.Color getByID(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Color rs = (javaweb.Entity.Color) ss.createCriteria(javaweb.Entity.Color.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.Color postNew(String newColorName) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Color temp = (javaweb.Entity.Color) ss.createCriteria(javaweb.Entity.Color.class)
				.add(Restrictions.eq("name", newColorName)).uniqueResult();
		if (temp != null)
			return temp;
		temp = new javaweb.Entity.Color();
		temp.setName(newColorName);
		ss.save(temp);
		javaweb.Entity.Color tempRS = temp;
		ss.getTransaction().commit();
		ss.close();
		return tempRS;
	}

}

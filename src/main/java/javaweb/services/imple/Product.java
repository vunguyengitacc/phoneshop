package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Product implements javaweb.services.inter.Product{

	SessionFactory factory = new Configuration().configure().buildSessionFactory();
	@Override
	public List<javaweb.Entity.Product> getAll() {
		Session ss = factory.getCurrentSession();
		ss.beginTransaction();
		List rs = ss.createQuery("FROM Product").list();
		return rs;
	}

}

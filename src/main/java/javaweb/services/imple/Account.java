package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Account implements javaweb.services.inter.Account{

	SessionFactory factory = new Configuration().configure().buildSessionFactory();
	public List<javaweb.Entity.Account> checkByUsername(String username) {
		Session ss = factory.getCurrentSession();
		ss.beginTransaction();
		List rs =ss.createQuery("FROM Account WHERE username = :name").setParameter("name", username).list();
		return rs;
	}

	
	
}

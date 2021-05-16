package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

import javaweb.Entity.Trademark;

@Service("TradeMark")
public class TradeMark implements javaweb.services.inter.TradeMark{
	DBContext factory = new DBContext();

	@Override
	public List<Trademark> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createQuery("FROM Trademark").list();
		ss.close();
		return rs;
	}
	@Override
	public Trademark getByID(int ID) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Trademark rs = (Trademark) ss.createQuery("FROM Trademark WHERE id = :ID").setParameter("ID", ID);
		ss.close();
		return rs;
	}

}

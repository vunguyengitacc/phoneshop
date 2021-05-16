package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service("Product")
public class Product implements javaweb.services.inter.Product {

	DBContext factory = new DBContext();

	@Override
	public List<javaweb.Entity.Product> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createQuery("FROM Product u JOIN FETCH u.trademark").list();
		ss.close();
		return rs;
	}

	@Override
	public List<javaweb.Entity.Product> getByTradeMark(String tradeMark) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createQuery("FROM Product u JOIN FETCH u.trademark WHERE u.trademark.name =:ID")
				.setParameter("ID", tradeMark).list();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.Product getByID(int id, boolean isLazy) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs;
		if (isLazy == false)
			rs = ss.createQuery(
					"FROM Product u JOIN FETCH u.trademark LEFT JOIN FETCH u.productHasColors t LEFT JOIN FETCH t.color LEFT JOIN FETCH u.comments WHERE u.id = :id ")
					.setParameter("id", id).list();
		else
			rs = ss.createQuery("FROM Product u LEFT JOIN FETCH u.productHasColors WHERE u.id = :id ")
					.setParameter("id", id).list();
		ss.close();
		if (rs.isEmpty())
			return null;
		return (javaweb.Entity.Product) rs.get(0);
	}

}

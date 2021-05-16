package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service("Color")
public class Color implements javaweb.services.inter.Color {
	DBContext factory = new DBContext();

	@Override
	public javaweb.Entity.Color getByID(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createQuery("FROM Color u WHERE id=:id").setParameter("id", id).list();
		ss.close();
		if(rs==null)
			return null;
		return (javaweb.Entity.Color) rs.get(0);
	}

}

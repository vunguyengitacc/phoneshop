package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("District")
public class District implements javaweb.services.inter.District {

	DBContext factory = new DBContext();

	@Override
	public List<javaweb.Entity.District> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.District.class).list();
		ss.close();
		if(rs.size()==0)
			return null;
		return rs;
	}

	@Override
	public javaweb.Entity.District getByWardID(int wardId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.District rs = (javaweb.Entity.District) ss.createCriteria(javaweb.Entity.District.class)
				.add(Restrictions.eq("wards.id", wardId)).uniqueResult();
		ss.close();
		return rs;
	}

}

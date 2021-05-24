package javaweb.services.imple;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("Promotion")
public class Promotion implements javaweb.services.inter.Promotion {

	@Autowired
	DBContext factory;

	@Override
	public javaweb.Entity.Promotion getByID(String id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Promotion promo = (javaweb.Entity.Promotion) ss.createCriteria(javaweb.Entity.Promotion.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		ss.close();
		return promo;
	}

	@Override
	public boolean postNew(String id, BigDecimal value, Date expiredDate, int type) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Promotion newItem = (javaweb.Entity.Promotion) ss.createCriteria(javaweb.Entity.Promotion.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		if (newItem != null)
			return false;
		BigDecimal validateValue = new BigDecimal(100);
		if (value.compareTo(BigDecimal.ZERO) <= 0 || value.compareTo(validateValue) >= 0)
			return false;
		Date validateDate = new Date();
		if (expiredDate.before(validateDate))
			return false;
		newItem = new javaweb.Entity.Promotion(id, value.setScale(2), expiredDate, type);
		ss.save(newItem);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean put(String id, BigDecimal value, Date expiredDate, int type) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Promotion rs = (javaweb.Entity.Promotion) ss.createCriteria(javaweb.Entity.Promotion.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		if (rs == null)
			return false;
		BigDecimal validateValue = new BigDecimal(100);
		if (value.compareTo(BigDecimal.ZERO) <= 0 || value.compareTo(validateValue) >= 0)
			return false;
		Date validateDate = new Date();
		if (expiredDate.before(validateDate))
			return false;
		rs.setExpiredDate(expiredDate);
		rs.setValue(value);
		rs.setType(type);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Promotion> getAllFetch(List<String> lstField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Criteria query = ss.createCriteria(javaweb.Entity.Promotion.class);
		if(lstField!=null&&lstField.size()!=0)
			lstField.stream().forEach((item) -> query.setFetchMode(item, FetchMode.JOIN));
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<javaweb.Entity.Promotion> rs = query.list();
		ss.close();
		return rs;
	}
	
	
	@Override
	public javaweb.Entity.Promotion getByIDFetch(String id ,List<String> lstField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Criteria query = ss.createCriteria(javaweb.Entity.Promotion.class).add(Restrictions.eq("id", id));
		if(lstField!=null&&lstField.size()!=0)
			lstField.stream().forEach((item) -> query.setFetchMode(item, FetchMode.JOIN));
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		javaweb.Entity.Promotion rs = (javaweb.Entity.Promotion) query.uniqueResult();
		ss.close();
		return rs;
	}

}

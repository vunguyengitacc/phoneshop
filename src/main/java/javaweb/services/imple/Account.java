package javaweb.services.imple;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("Account")
public class Account implements javaweb.services.inter.Account {

	DBContext factory = new DBContext();

	@Override
	public javaweb.Entity.Account getByUsernameAndPass(String username, String password, boolean isLazy) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs;
		if (isLazy == true)
			rs = ss.createQuery("FROM Account  WHERE username =:name AND password =:password")
					.setParameter("name", username).setParameter("password", password).list();
		else
			rs = ss.createQuery(
					"FROM Account u LEFT JOIN FETCH u.comments WHERE username =:name AND password =:password")
					.setParameter("name", username).setParameter("password", password).list();
		ss.close();
		if (rs.size() == 0)
			return null;
		return (javaweb.Entity.Account) rs.get(0);
	}

	@Override
	public javaweb.Entity.Account getByUsername(String username, boolean isLazy) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs;
		if (isLazy == true)
			rs = ss.createQuery("FROM Account WHERE username=:name").setParameter("name", username).list();
		else
			rs = ss.createQuery("FROM Account u LEFT JOIN FETCH u.comments WHERE username=:name")
					.setParameter("name", username).list();
		ss.close();
		if (rs.size() == 0)
			return null;
		return (javaweb.Entity.Account) rs.get(0);
	}

	@Override
	public boolean setAccountInfor(String username, String name, String email, String phone, int gender) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();
		if (rs == null)
			return false;
		if (name != "" && name != rs.getName())
			rs.setName(name);
		if (email != "" && email != rs.getEmail())
			rs.setEmail(email);
		if (phone != "" && email != rs.getPhone())
			rs.setPhone(phone);
		if (gender != rs.getGender())
			rs.setGender(gender);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean setNewPass(String username, String newPass) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();

		if (rs == null) {
			ss.close();
			return false;
		}
		rs.setPassword(newPass);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Account> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs = ss.createCriteria(javaweb.Entity.Account.class).list();
		ss.close();
		if (rs.size() == 0)
			return null;
		return rs;
	}

	@Override
	public javaweb.Entity.Account getByUsernameFetch(String username, String fetchField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("deprecation")
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).setFetchMode(fetchField, FetchMode.EAGER).uniqueResult();
		ss.close();
		return rs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Account> getAllFetch(String fetchField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings({ "rawtypes", "deprecation" })
		List rs = ss.createCriteria(javaweb.Entity.Account.class).setFetchMode(fetchField, FetchMode.EAGER).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		ss.close();
		if (rs.size() == 0)
			return null;
		return rs;
	}

	@Override
	public boolean setNewStatus(String username) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();
		if(rs==null)
			return false;
		if(rs.getStatus()==1)
			rs.setStatus(0);
		else
			rs.setStatus(1);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

}

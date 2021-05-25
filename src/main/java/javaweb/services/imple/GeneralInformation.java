package javaweb.services.imple;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service("GeneralInformation")
public class GeneralInformation implements javaweb.services.inter.GeneralInformation {

	DBContext factory = new DBContext();

	@SuppressWarnings("unchecked")
	@Override
	public javaweb.Entity.GeneralInformation getInfor() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List<javaweb.Entity.GeneralInformation> rs = ss.createCriteria(javaweb.Entity.GeneralInformation.class).list();
		rs = rs.parallelStream().sorted((a, b) -> b.getCreatedDate().compareTo(a.getCreatedDate()))
				.collect(Collectors.toList());
		return rs.size() != 0 ? rs.get(0) : null;
	}

	@Override
	public boolean posttInfor(String email, String phone, String address) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.GeneralInformation editItem = new javaweb.Entity.GeneralInformation();
		editItem.setAddress(address);
		editItem.setCreatedDate(new Date());
		editItem.setEmail(email);
		if(phone.length()!=10) {
			ss.close();
			return false;
		}
		editItem.setPhone(phone);
		ss.save(editItem);
		ss.getTransaction().commit();
		ss.close();
		return true;
		
	}

}

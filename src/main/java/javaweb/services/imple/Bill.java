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

import javaweb.Entity.Account;
import javaweb.Entity.Commune;
import javaweb.services.inter.ProductHasColorHasBill;
import javaweb.services.inter.Promotion;

@Service("Bill")
public class Bill implements javaweb.services.inter.Bill {

	@Autowired
	Promotion promotion;
	@Autowired
	javaweb.services.inter.Commune commnue;
	@Autowired
	ProductHasColorHasBill detail;
	DBContext factory = new DBContext();

	@Override
	public int postBill(Account acc, int comm, BigDecimal totalValue, int promo) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill newBill = new javaweb.Entity.Bill();
		newBill.setAccount(acc);
		Commune commTemp = commnue.getById(comm);
		if (commTemp == null) {
			ss.close();
			return -1;
		}
		newBill.setCommune(commTemp);
		newBill.setCreateDate(new Date());
		newBill.setStatus(1);// 0 la da duoc xu ly ; 1 la dang cho xu ly; 2 la da bi cancel
		newBill.setTotalValue(totalValue);
		javaweb.Entity.Promotion promoTemp = promotion.getByID(promo);
		if (promoTemp != null)
			newBill.setPromotion(promoTemp);
		ss.save(newBill);
		int idBill = newBill.getId();
		ss.getTransaction().commit();
		ss.close();

		return idBill;
	}

	@Override
	public javaweb.Entity.Bill getByID(int billID) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill rs = (javaweb.Entity.Bill) ss.createCriteria(javaweb.Entity.Bill.class)
				.add(Restrictions.eq("id", billID)).uniqueResult();
		ss.close();
		return rs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Bill> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs = ss.createCriteria(javaweb.Entity.Bill.class).list();
		if (rs.size() == 0)
			return null;
		return rs;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<javaweb.Entity.Bill> getAllFetch() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Bill.class).setFetchMode("commune", FetchMode.JOIN)
				.setFetchMode("commune.ward", FetchMode.JOIN).setFetchMode("commune.ward.district", FetchMode.JOIN)
				.setFetchMode("productHasColorHasBills", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		if (rs.size() == 0)
			return null;
		return rs;

	}

}

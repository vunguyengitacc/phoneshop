package javaweb.services.imple;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.Account;
import javaweb.Entity.Commune;
import javaweb.Entity.ProductHasColorHasBill;
import javaweb.controller.session.Cart;
import javaweb.services.inter.Promotion;

@Service("Bill")
public class Bill implements javaweb.services.inter.Bill {

	@Autowired
	Promotion promotion;
	@Autowired
	javaweb.services.inter.Commune commnue; 
	DBContext factory = new DBContext();
	@Override
	public boolean createBill(Account acc, int comm, BigDecimal totalValue, int promo, Cart cart) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill newBill = new javaweb.Entity.Bill();
		newBill.setAccount(acc);
		Commune commTemp = commnue.getById(comm);
		if(commTemp==null) {
			ss.close();
			return false;
		}
		newBill.setCommune(commTemp);
		newBill.setCreateDate(new Date());
		newBill.setStatus(1);//0 la da duoc xu ly ; 1 la dang cho xu ly; 2 la da bi cancel
		newBill.setTotalValue(totalValue);
		javaweb.Entity.Promotion promoTemp = promotion.getByID(promo);
		if(promoTemp!=null)
			newBill.setPromotion(promoTemp);
		cart.getLstItem().forEach((item)->{
			ProductHasColorHasBill itemx = new ProductHasColorHasBill();
			itemx.setAmount(item.amount);
			itemx.getProductHasColor().setColor(item.color);
			itemx.getProductHasColor().setProduct(item.pro);
			itemx.setBill(newBill);
			newBill.addProductHasColorHasBills(itemx);
		});
		ss.save(newBill);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

}

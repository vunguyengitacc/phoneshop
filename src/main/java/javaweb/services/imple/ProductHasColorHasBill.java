package javaweb.services.imple;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.ProductHasColor;
import javaweb.Entity.ProductHasColorHasBillId;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Color;
import javaweb.services.inter.Product;

@Service("ProductHasColorHasBill")
public class ProductHasColorHasBill implements javaweb.services.inter.ProductHasColorHasBill {

	@Autowired
	Color color;
	@Autowired
	Product pro;
	@Autowired
	Bill bill;
	@Autowired
	javaweb.services.inter.ProductHasColor pro_color;
	DBContext factory = new DBContext();

	@Override
	public boolean postNew(int colorId, int productId, int billId, int amount) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasColorHasBill newItem = new javaweb.Entity.ProductHasColorHasBill();
		javaweb.Entity.ProductHasColor proHasColTemp = pro_color.getByIDColorAndProduct(productId, colorId);
		javaweb.Entity.Bill billTemp = bill.getByID(billId);
		if (proHasColTemp == null || billTemp == null)
			return false;
		ProductHasColorHasBillId newId = new ProductHasColorHasBillId();
		newId.setBillId(billId);
		newId.setProductHasColorColorId(colorId);
		newId.setProductHasColorProductId(productId);
		newItem.setAmount(amount);
		newItem.setBill(billTemp);
		newItem.setId(newId);
		proHasColTemp.setAmount(proHasColTemp.getAmount() - amount);
		ss.update(proHasColTemp);
		ss.save(newItem);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean deleteByBillId(int billId) {
		Session ss = factory.getSession();
		ss.beginTransaction();

		List<String> lstField = new ArrayList<String>(
				List.of("productHasColorHasBills", "productHasColorHasBills.color", "productHasColorHasBills.product"));
		javaweb.Entity.Bill billRs = bill.getByIdAdvance(billId, lstField);
		if (billRs == null)
			return false;
		billRs.getProductHasColorHasBills().forEach((item) -> {
			ProductHasColor temp = item.getProductHasColor();
			if (temp != null) {
				temp.setAmount(temp.getAmount() + item.getAmount());
				ss.saveOrUpdate(temp);
			}
			javaweb.Entity.ProductHasColorHasBill deleteItem = new javaweb.Entity.ProductHasColorHasBill();
			deleteItem.setId(item.getId());
			ss.delete(deleteItem);
			ss.getTransaction().commit();
		});
		ss.close();
		return true;
	}

}

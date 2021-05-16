package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service("ProductHasColor")
public class ProductHasColor implements javaweb.services.inter.ProductHasColor {

	DBContext factory = new DBContext();

	@Override
	public int getAmount(int idProduct, int idColor) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List<javaweb.Entity.ProductHasColor> rs = ss.createQuery("FROM ProductHasColor WHERE id.productId =:param1 AND id.colorId =:param2 ")
				.setParameter("param1", idProduct).setParameter("param2", idColor).list();
		ss.close();
		if(rs!=null)
			return rs.get(0).getAmount();
		return 0;
	}

}

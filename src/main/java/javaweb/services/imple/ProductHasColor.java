package javaweb.services.imple;

import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.ProductHasColorId;
import javaweb.services.inter.Color;
import javaweb.services.inter.Product;

@Service("ProductHasColor")
public class ProductHasColor implements javaweb.services.inter.ProductHasColor {

	DBContext factory = new DBContext();
	@Autowired
	Color col;
	@Autowired
	Product pro;

	@Override
	public int getAmount(int idProduct, int idColor) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasColor rs = (javaweb.Entity.ProductHasColor) ss
				.createCriteria(javaweb.Entity.ProductHasColor.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("color.id", idColor)).uniqueResult();
		ss.close();
		if (rs != null)
			return rs.getAmount();
		return 0;
	}

	@Override
	public javaweb.Entity.ProductHasColor getByIDColorAndProduct(int idProduct, int idColor) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasColor rs = (javaweb.Entity.ProductHasColor) ss
				.createCriteria(javaweb.Entity.ProductHasColor.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("color.id", idColor)).uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public boolean postNew(int idProduct, int idColor, int amount) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasColor rs = (javaweb.Entity.ProductHasColor) ss
				.createCriteria(javaweb.Entity.ProductHasColor.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("color.id", idColor)).uniqueResult();
		if (rs != null)
			return false;
		rs = new javaweb.Entity.ProductHasColor();
		javaweb.Entity.Color colItem = col.getByID(idColor);
		javaweb.Entity.Product proItem = pro.getByID(idProduct, false);
		if(colItem==null||proItem==null)
			return false;
		rs.setId(new ProductHasColorId());
		rs.getId().setColorId(idColor);
		rs.getId().setProductId(idProduct);
		rs.setColor(colItem);
		rs.setProduct(proItem);
		rs.setAmount(amount);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean put(int idProduct, int idColor, int amount) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasColor rs = (javaweb.Entity.ProductHasColor) ss
				.createCriteria(javaweb.Entity.ProductHasColor.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("color.id", idColor)).uniqueResult();
		if (rs == null)
			return false;
		rs.setAmount(amount);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean deleteOne(int idProduct, int idColor) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasColor rs = (javaweb.Entity.ProductHasColor) ss
				.createCriteria(javaweb.Entity.ProductHasColor.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("color.id", idColor)).setFetchMode("productHasColorHasBills", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).uniqueResult();
		if (rs == null)
			return false;
		if (rs.getProductHasColorHasBills().size() != 0)
			return false;
		ss.delete(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean deleteMany(int idProduct) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings({ "unchecked" })
		List<javaweb.Entity.ProductHasColor> rs = ss.createCriteria(javaweb.Entity.ProductHasColor.class)
				.add(Restrictions.eq("product.id", idProduct)).setFetchMode("productHasColorHasBills", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		if (rs.size() == 0)
			return true;
		if (rs.stream().filter((item) -> item.getProductHasColorHasBills().size() > 0).collect(Collectors.toList())
				.size() != 0)
			return false;
		rs.forEach((item)->ss.delete(item));;
		ss.getTransaction().commit();
		ss.flush();
		ss.close();
		return true;
	}

}

package javaweb.services.imple;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.Trademark;
import javaweb.services.inter.Color;

@Service("Product")
public class Product implements javaweb.services.inter.Product {

	DBContext factory = new DBContext();
	@Autowired
	Color col;
	@Autowired
	TradeMark trade;

	@Override
	public List<javaweb.Entity.Product> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs = ss.createQuery("FROM Product u JOIN FETCH u.trademark").list();
		ss.close();
		return rs;
	}

	@Override
	public List<javaweb.Entity.Product> getByTradeMark(String tradeMark) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createQuery("FROM Product u JOIN FETCH u.trademark WHERE u.trademark.name =:ID")
				.setParameter("ID", tradeMark).list();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.Product getByID(int id, boolean isLazy) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Product rs;
		if (isLazy == false)
			rs = (javaweb.Entity.Product) ss.createCriteria(javaweb.Entity.Product.class).add(Restrictions.eq("id", id))
					.setFetchMode("productHasColors", FetchMode.JOIN)
					.setFetchMode("productHasColors.color", FetchMode.JOIN).setFetchMode("trademark", FetchMode.JOIN)
					.setFetchMode("comments", FetchMode.JOIN).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
					.uniqueResult();
		else
			rs = (javaweb.Entity.Product) ss.createCriteria(javaweb.Entity.Product.class).add(Restrictions.eq("id", id))
					.uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public int postNew(String name, BigDecimal originalPrice, BigDecimal price, BigDecimal promotionPrice, String image,
			String description, int ram, int rom, BigDecimal screenSize, String frontCamera, String backCamera,
			int batteryCapacity, String os, String cpu, String gpu, String sim, int idTrade) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Product newPro = new javaweb.Entity.Product();
		if (name != "")
			newPro.setName(name);
		BigDecimal validatePrice = BigDecimal.ZERO;
		if (originalPrice.compareTo(validatePrice) < 0 || price.compareTo(validatePrice) < 0
				|| promotionPrice.compareTo(validatePrice) < 0)
			return -1;
		else if (originalPrice.compareTo(price) > 0 || price.compareTo(promotionPrice) < 0)
			return -1;
		newPro.setOriginalPrice(originalPrice);
		newPro.setPrice(price);
		newPro.setPromotionPrice(promotionPrice);
		if (image == "/resources/" || image == "")
			newPro.setImage("/resources/default.png");
		else
			newPro.setImage(image);
		newPro.setDescription(description);
		newPro.setRam(ram);
		newPro.setRom(rom);
		if (screenSize.compareTo(validatePrice) < 0)
			return -1;
		newPro.setScreenSize(screenSize);
		newPro.setFrontCamera(frontCamera);
		newPro.setBackCamera(backCamera);
		newPro.setOs(os);
		newPro.setCpu(cpu);
		newPro.setGpu(gpu);
		newPro.setSim(sim);
		if (batteryCapacity < 0)
			return -1;
		newPro.setBatteryCapacity(batteryCapacity);
		Trademark tempItem = new Trademark();
		tempItem.setId(idTrade);
		newPro.setTrademark(tempItem);
		ss.save(newPro);
		int newId = newPro.getId();
		ss.getTransaction().commit();
		ss.close();
		return newId;
	}

	@Override
	public boolean putByID(int id, String name, BigDecimal originalPrice, BigDecimal price, BigDecimal promotionPrice,
			String image, String description, int ram, int rom, BigDecimal screenSize, String frontCamera,
			String backCamera, int batteryCapacity, String os, String cpu, String gpu, String sim, int idTrade) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Product updatedPro = (javaweb.Entity.Product) ss.createCriteria(javaweb.Entity.Product.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		if (updatedPro == null)
			return false;
		if (name != "")
			updatedPro.setName(name);
		BigDecimal validatePrice = BigDecimal.ZERO;
		if (originalPrice.compareTo(validatePrice) > 0 && price.compareTo(validatePrice) > 0
				&& promotionPrice.compareTo(validatePrice) >= 0 && originalPrice.compareTo(price) < 0
				&& price.compareTo(promotionPrice) > 0) {
			updatedPro.setOriginalPrice(originalPrice);
			updatedPro.setPrice(price);
			updatedPro.setPromotionPrice(promotionPrice);
		} else
			return false;
		if (!image.equalsIgnoreCase("/resources/nochange"))
			updatedPro.setImage(image);
		updatedPro.setDescription(description);
		updatedPro.setRam(ram);
		updatedPro.setRom(rom);
		if (screenSize.compareTo(validatePrice) < 0)
			return false;
		updatedPro.setScreenSize(screenSize);
		updatedPro.setFrontCamera(frontCamera);
		updatedPro.setBackCamera(backCamera);
		updatedPro.setOs(os);
		updatedPro.setCpu(cpu);
		updatedPro.setGpu(gpu);
		updatedPro.setSim(sim);
		if (batteryCapacity < 0)
			return false;
		updatedPro.setBatteryCapacity(batteryCapacity);
		Trademark tempItem = new Trademark();
		tempItem.setId(idTrade);
		updatedPro.setTrademark(tempItem);
		ss.save(updatedPro);
		ss.getTransaction().commit();
		ss.close();
		return true;

	}

	@Override
	public boolean deleteByID(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Product deletedPro = (javaweb.Entity.Product) ss.createCriteria(javaweb.Entity.Product.class)
				.add(Restrictions.eq("id", id)).setFetchMode("ratings", FetchMode.JOIN)
				.setFetchMode("comments", FetchMode.JOIN).setFetchMode("productHasColors", FetchMode.JOIN)
				.setFetchMode("productHasColors.productHasColorHasBills", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).uniqueResult();
		if (deletedPro == null)
			return false;
		if (deletedPro.getRatings().size() > 0)
			return false;
		if (deletedPro.getComments().size() > 0)
			return false;
		if (deletedPro.getProductHasColors().stream().filter((item) -> item.getProductHasColorHasBills().size() != 0)
				.collect(Collectors.toList()).size() != 0)
			return false;
		ss.delete(deletedPro);
		ss.getTransaction().commit();
		ss.flush();
		ss.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Product> getAllFetch(List<String> lstField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Criteria query = ss.createCriteria(javaweb.Entity.Product.class);
		lstField.forEach((item) -> query.setFetchMode(item, FetchMode.JOIN));
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<javaweb.Entity.Product> rs = query.list();
		ss.close();
		return rs;
	}

}

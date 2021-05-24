package javaweb.controller.session;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import javaweb.Entity.Promotion;

@JsonInclude(Include.NON_EMPTY)
public class Cart {

	public Cart(List<CartItem> lstItem, BigDecimal totalValue, Promotion promo) {
		super();
		this.lstItem = lstItem;
		this.totalValue = totalValue.setScale(2);
		this.promo = promo;
		this.loadPromoValue();
	}

	private List<CartItem> lstItem;
	private BigDecimal totalValue;
	private BigDecimal promoValue;
	private Promotion promo;

	public Cart() {
		super();
		this.lstItem = new ArrayList<CartItem>();
		this.totalValue = new BigDecimal("0.00");
		this.promo = new Promotion();
		this.promo.setValue(BigDecimal.ZERO.setScale(2));
		this.loadPromoValue();
	}

	public Cart(CartItem item, BigDecimal value) {
		super();
		this.lstItem = new ArrayList<CartItem>();
		this.lstItem.add(item);
		this.totalValue = new BigDecimal("0.00");
		this.totalValue = this.totalValue.add(value).setScale(2);
		this.promo = new Promotion();
		this.promo.setValue(BigDecimal.ZERO.setScale(2));
		this.loadPromoValue();
	}

	public List<CartItem> getLstItem() {
		return lstItem;
	}

	public void setLstItem(List<CartItem> lstItem) {
		this.lstItem = lstItem;
		this.totalValue = lstItem.stream().map(item -> item.getValue())
				.reduce(BigDecimal.ZERO.setScale(2), BigDecimal::add).setScale(2);
	}

	public BigDecimal getTotalValue() {
		return totalValue;
	}

	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue.setScale(2);
	}

	public void addLstItem(CartItem newItem, BigDecimal newValue) {
		this.getLstItem().add(newItem);
		this.totalValue = this.totalValue.add(newValue).setScale(2);
		this.loadPromoValue();
	}

	public void removeItem(CartItem newItem) {
		this.lstItem.remove(newItem);
		this.totalValue = this.totalValue.subtract(newItem.getValue()).setScale(2);
		this.loadPromoValue();
	}

	public Promotion getPromo() {
		return promo;
	}

	public void setPromo(Promotion promo) {
		this.promo = promo;
		this.loadPromoValue();
	}

	public BigDecimal getPromoValue() {
		return promoValue;
	}

	public void setPromoValue(BigDecimal promoValue) {
		this.promoValue = promoValue;
	}

	//phương thức để tự động tạo tổng giá trị cho giỏ hàng
	public void loadPromoValue() {
		if (this.promo == null || this.getPromo().getValue() == BigDecimal.ZERO)
			this.promoValue = this.totalValue.setScale(2);
		else {
			BigDecimal NUMBER100 = new BigDecimal("100.00");
			this.promoValue = this.totalValue.multiply(NUMBER100.subtract(this.getPromo().getValue()));
			this.promoValue = this.promoValue.divide(NUMBER100).setScale(2);
		}

	}
}

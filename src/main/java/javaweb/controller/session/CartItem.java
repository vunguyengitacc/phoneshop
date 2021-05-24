package javaweb.controller.session;

import java.math.BigDecimal;

import javaweb.Entity.Color;
import javaweb.Entity.Product;

public class CartItem {
	public Product pro;
	public Color color;
	public int amount;
	public BigDecimal value;

	public Product getPro() {
		return pro;
	}

	public void setPro(Product pro) {
		this.pro = pro;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = new BigDecimal(value);
	}

	public void addAmount(int newAmount) {
		this.amount += newAmount;
	}

	public void refreshValue() {
		BigDecimal amountDecimal = new BigDecimal(this.amount);
		BigDecimal priceToCalc = this.getPro().getPromotionPrice();
		if(priceToCalc.compareTo(new BigDecimal(0))==0)
			priceToCalc = this.getPro().getPrice();
		this.setValue(priceToCalc.multiply(amountDecimal).toString());
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

}

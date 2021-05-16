package javaweb.controller.session;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_EMPTY)
public class Cart {
	

	public List<CartItem> lstItem;
	public BigDecimal totalValue;
	
	public Cart() {
		super();
		this.lstItem = new ArrayList<CartItem>();
		this.totalValue = new BigDecimal("0.00");
	}
	
	public Cart(CartItem item, BigDecimal value) {
		super();
		this.lstItem = new ArrayList<CartItem>();
		this.lstItem.add(item);
		this.totalValue = new BigDecimal("0.00");
		this.totalValue=this.totalValue.add(value);
	}
	public List<CartItem> getLstItem() {
		return lstItem;
	}
	public void setLstItem(List<CartItem> lstItem) {
		this.lstItem = lstItem;
	}
	public BigDecimal getTotalValue() {
		return totalValue;
	}
	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue;
	}
	
	public void addLstItem(CartItem newItem, BigDecimal newValue) {
		System.out.println(newValue.toString());
		this.getLstItem().add(newItem);
		this.totalValue = this.totalValue.add(newValue);
		System.out.println(this.totalValue.toString());
	}
	
	public void removeItem(CartItem newItem) {
		this.lstItem.remove(newItem);
		this.totalValue = this.totalValue.subtract(newItem.getValue());
	}
}

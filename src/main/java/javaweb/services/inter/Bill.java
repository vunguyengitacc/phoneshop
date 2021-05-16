package javaweb.services.inter;

import java.math.BigDecimal;

import javaweb.Entity.Account;
import javaweb.controller.session.Cart;

public interface Bill {
	public boolean createBill(Account acc, int comm, BigDecimal totalValue, int promo, Cart cart);
}

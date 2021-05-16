package javaweb.controller.Home;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javaweb.controller.session.Cart;
import javaweb.controller.session.CartItem;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Color;
import javaweb.services.inter.Comment;
import javaweb.services.inter.Product;
import javaweb.services.inter.ProductHasColor;
import javaweb.services.inter.Rating;
import javaweb.services.inter.TradeMark;

@Controller
@RestController
@RequestMapping("/trang-chu/api")
public class RestHomeController {

	@Autowired
	Product pro;
	@Autowired
	TradeMark trade;
	@Autowired
	Comment cmt;
	@Autowired
	Rating rate;
	@Autowired
	Color color;
	@Autowired
	Account acc;
	
	@PutMapping("/gio-hang/cap-nhat-gio-hang")
	@ResponseBody
	public String updateCart(HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("soLuong") int amount, @RequestParam("idMau") int idColor,
			@RequestParam("thayDoiSoLuong") int newAmount) {

		CartItem item = new CartItem();
		Cart lst = (Cart) session.getAttribute("cart");
		ProductHasColor detail = new javaweb.services.imple.ProductHasColor();
		item.setColor(color.getByID(idColor));
		item.setPro(pro.getByID(id, true));
		int maxAmount = detail.getAmount(item.getPro().getId(), item.getColor().getId());
		if (maxAmount < amount || maxAmount < newAmount)
			return "{ \"status \" : 2 }";// status 2 tra ve voi y nghia them khong thanh cong
		// amount: khi nguoi dung muon them 1 so luong san pham vao gio hang(cong don
		// vao)
		// newAmount: khi nguoi dung muon cap nhat lai so luong san pham trong gio
		// hang(thay moi hoan toan)
		if (newAmount == 0)
			item.setAmount(amount);
		else
			item.setAmount(newAmount);
		BigDecimal amountDecimal = new BigDecimal(item.getAmount());
		// neu gia khuyen mai =0 thi set bang gia thi truong
		if (item.getPro().getPromotionPrice().compareTo(new BigDecimal(0)) == 0) {
			String value = item.getPro().getPrice().multiply(amountDecimal).toString();
			item.setValue(value);
		} else {
			String value = item.getPro().getPromotionPrice().multiply(amountDecimal).toString();
			item.setValue(value);
		}
		String newItemValue = null;// tra ve gia tri moi cho vat pham trong gio hang trong truong hop can cap nhat
		if (lst == null) {
			lst = new Cart(item, item.getValue());
		} else {
			List<CartItem> stLst = lst.getLstItem().stream().filter(
					x -> x.getPro().getId() == item.getPro().getId() && x.getColor().getId() == item.getColor().getId())
					.collect(Collectors.toList());
			if (stLst.size() > 0) {
				CartItem stItem = stLst.get(0);
				lst.removeItem(stItem);
				if (newAmount != 0)
					stItem.setAmount(newAmount);
				else
					stItem.addAmount(item.getAmount());
				stItem.refreshValue();
				newItemValue = stItem.getValue().toString();
				lst.addLstItem(stItem, stItem.getValue());
			} else
				lst.addLstItem(item, item.getValue());
		}
		session.setAttribute("cart", lst);
		return "{\"totalItem\": " + lst.getLstItem().size() + ", \"totalValue\": " + lst.getTotalValue()
				+ ", \"newItemValue\": " + newItemValue + ", \"status \" : 1 }";
	}

	@DeleteMapping("/gio-hang/xoa-item-gio-hang")
	@ResponseBody
	public String deleteItemCart(HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("idMau") int idColor) {

		CartItem item = new CartItem();
		Cart lst = (Cart) session.getAttribute("cart");
		item.setColor(color.getByID(idColor));
		item.setPro(pro.getByID(id, true));
		int result = 0;
		if (lst == null) {
			result = 2;
		} else {
			List<CartItem> stLst = lst.getLstItem().stream().filter(
					x -> x.getPro().getId() == item.getPro().getId() && x.getColor().getId() == item.getColor().getId())
					.collect(Collectors.toList());
			if (stLst.size() > 0) {
				CartItem stItem = stLst.get(0);
				lst.removeItem(stItem);
				result = 1;
			} else
				result = 2;
		}
		session.setAttribute("cart", lst);
		return "{\"totalValue\": " + lst.getTotalValue() + ", \"resultDelete\": " + result + ", \"totalItem\": "
				+ lst.getLstItem().size() + "}";
	}

	@PutMapping("/rating")
	@ResponseBody
	public String updateRating(Model model, HttpSession session, @RequestParam("id") int idProduct,
			@RequestParam("diem") int value) {

		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (rate.setRating(userSs.getAccInfor().getUsername(), idProduct, value) == false)
			return "{ \"status\": 2}";// them khong thanh cong
		userSs.setAccInfor(acc.getByUsername(userSs.getAccInfor().getUsername(), false));
		session.setAttribute("UserSession", userSs);//cap nhat lai account trong session
		return "{ \"status\": 1}";// them thanh cong
	}

	@PutMapping("/tai-khoan/cap-nhat-thong-tin")
	@ResponseBody
	public String updateAccountDetail(Model model, HttpSession session,
			@RequestParam("tenHienThi") String name, @RequestParam("email") String email,
			@RequestParam("gioiTinh") int gender, @RequestParam("soDienThoai") String phone) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if(name==""&&email==""&&phone=="")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if(acc.setAccountInfor(userSs.getAccInfor().getUsername(), name, email, phone, gender)==true) {
			userSs.setAccInfor(acc.getByUsername(userSs.getAccInfor().getUsername(), false));
			session.setAttribute("UserSession", userSs);//cap nhat lai account trong session
			return "{ \"status\": 1}";// cap nhat thanh cong
		}
		else
			return "{ \"status\": 2}";// cap nhat khong thanh cong 
	}
	
	@PutMapping("/tai-khoan/doi-mat-khau")
	@ResponseBody
	public String updateAccountPassword(Model model, HttpSession session,
			@RequestParam("matKhauMoi") String newPass
			) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if(newPass=="")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if(acc.setNewPass(userSs.getAccInfor().getUsername(), newPass)==true) {
			session.invalidate();//cap nhat thanh cong can dang nhap lai
			return "{ \"status\": 1}";// cap nhat thanh cong
		}
		else
			return "{ \"status\": 2}";// cap nhat khong thanh cong 
	}

}

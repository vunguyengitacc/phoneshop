package javaweb.controller.Home;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaweb.controller.session.Cart;
import javaweb.controller.session.CartItem;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Color;
import javaweb.services.inter.Comment;
import javaweb.services.inter.Commune;
import javaweb.services.inter.Product;
import javaweb.services.inter.ProductHasColor;
import javaweb.services.inter.Promotion;
import javaweb.services.inter.Rating;
import javaweb.services.inter.TradeMark;
import javaweb.services.inter.Ward;

@Controller
@RestController
@RequestMapping(value = "/trang-chu/api", produces = "text/plain;charset=UTF-8")
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
	@Autowired
	Promotion promo;
	@Autowired
	Ward ward;
	@Autowired
	Commune commune;

	@PutMapping("/gio-hang")
	@ResponseBody
	public String updateCart(HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("soLuong") int amount, @RequestParam("idMau") int idColor,
			@RequestParam("thayDoiSoLuong") int newAmount) {
		// amount: khi người dùng muốn thêm sản phẩm với mục đích cộng dồn vào giỏ hàng
		// nếu đã tồn tại
		// newAmount: thay giá trị số lượng bằng một giá trị newAmount mới
		CartItem item = new CartItem();
		Cart lst = (Cart) session.getAttribute("cart");
		ProductHasColor detail = new javaweb.services.imple.ProductHasColor();
		item.setColor(color.getByID(idColor));
		item.setPro(pro.getByID(id, true));
		int maxAmount = detail.getAmount(item.getPro().getId(), item.getColor().getId());// lấy số lượng sản phẩm
		if (maxAmount < amount || maxAmount < newAmount)
			return "{ \"status \" : 2 }";// status 2: không đủ hàng
		if (newAmount == 0)// do chỉ chấp nhận 1 trong 2 giá trị amount hoặc newAmount và ưu tiên amount
			item.setAmount(amount);
		else
			item.setAmount(newAmount);
		BigDecimal amountDecimal = new BigDecimal(item.getAmount());
		if (item.getPro().getPromotionPrice().compareTo(BigDecimal.ZERO) == 0) {
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
		return "{\"totalItem\": " + lst.getLstItem().size() + ", \"totalValue\": " + lst.getTotalValue().setScale(2)
				+ ", \"newItemValue\": " + newItemValue + ", \"status \" : 1, \"promoValue\": "
				+ lst.getPromoValue().setScale(2) + "}";
	}

	@DeleteMapping("/gio-hang/item")
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
		return "{\"totalValue\": " + lst.getTotalValue().setScale(2) + ", \"resultDelete\": " + result
				+ ", \"totalItem\": " + lst.getLstItem().size() + ", \"promoValue\": " + lst.getPromoValue().setScale(2)
				+ "}";
	}

	@PutMapping("/rating")
	@ResponseBody
	public String updateRating(Model model, HttpSession session, @RequestParam("id") int idProduct,
			@RequestParam("diem") int value) {

		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "{ \"status\": 4}";// tai khoan bi khoa trong luc dang dang nhap
		}
		if (rate.putRating(userSs.getAccInfor().getUsername(), idProduct, value) == false)
			return "{ \"status\": 2}";// them khong thanh cong
		userSs.setAccInfor(acc.getByUsername(userSs.getAccInfor().getUsername(), false));
		session.setAttribute("UserSession", userSs);// cap nhat lai account trong session
		return "{ \"status\": 1}";// them thanh cong
	}

	@PutMapping("/tai-khoan/cap-nhat-thong-tin")
	@ResponseBody
	public String updateAccountDetail(Model model, HttpSession session, @RequestParam("tenHienThi") String name,
			@RequestParam("email") String email, @RequestParam("gioiTinh") int gender,
			@RequestParam("soDienThoai") String phone) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chưa đăng nhập
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "{ \"status\": 4}";// tài khoản bị admin khoá trong lúc đăng nhập
		}
		javaweb.Entity.Account testEmail = acc.findByEmail(email);
		if (testEmail != null && testEmail.getUsername().equals(userSs.getAccInfor().getUsername()))
			return "{ \"status\": 2}";// cập nhật thất bại
		if (name == "" && email == "" && phone == "")
			return "{ \"status\": 2}";// cập nhật thất bại
		if (acc.putAccountInfor(userSs.getAccInfor().getUsername(), name, email, phone, gender) == true) {
			userSs.setAccInfor(acc.getByUsername(userSs.getAccInfor().getUsername(), false));
			session.setAttribute("UserSession", userSs);// cập nhật lại account trong session
			return "{ \"status\": 1}";// cập nhật thành công
		} else
			return "{ \"status\": 2}";
	}

	@PutMapping("/tai-khoan/doi-mat-khau")
	@ResponseBody
	public String updateAccountPassword(Model model, HttpSession session, @RequestParam("matKhauMoi") String newPass, @RequestParam("matKhauCu") String oldPass) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "{ \"status\": 4}";// tai khoan bi khoa trong luc dang dang nhap
		}
		if (newPass == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if(!userSs.getAccInfor().getPassword().equals(oldPass))
			return "{ \"status\": 5}";// Sai mat khau
		if (acc.putNewPass(userSs.getAccInfor().getUsername(), newPass) == true) {
			session.invalidate();// cap nhat thanh cong can dang nhap lai
			return "{ \"status\": 1}";// cap nhat thanh cong
		} else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@SuppressWarnings("deprecation")
	@PutMapping("/gio-hang/ma-khuyen-mai")
	public String updatePromotionOfCart(Model model, HttpSession session, @RequestParam("idKhuyenMai") String id) {
		Cart lst = (Cart) session.getAttribute("cart");
		List<String> lstField = new ArrayList<String>(List.of("bills", "bills.account"));
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		javaweb.Entity.Promotion rs = promo.getByIDFetch(id, lstField);
		if (rs == null && id != "")
			return "{ \"status\": 4}";// ma khong ton tai
		if (id == "") {
			lst.setPromo(rs);
			session.setAttribute("cart", lst);
			return "{\"totalValue\": " + lst.getTotalValue().setScale(2) + ", \"status\": 0, \"totalItem\": "
					+ lst.getLstItem().size() + ", \"promoValue\": " + lst.getPromoValue().setScale(2) + "}"; // xoa ma
																												// khoi
																												// gio
																												// hang
		}
		if (rs.getType() == 1 && rs.getBills().stream()
				.filter((item) -> item.getAccount().getUsername().compareTo(userSs.getAccInfor().getUsername()) == 0)
				.collect(Collectors.toList()).size() != 0)// check mã dạng dùng theo mỗi user 1 lần
			return "{ \"status\": 2}";// ma da dung;
		Date validateDate = new Date();
		if (rs.getType() == 2 && rs.getBills().stream()
				.filter((item) -> item.getCreateDate().compareTo(validateDate) == 0
						&& item.getAccount().getUsername().compareTo(userSs.getAccInfor().getUsername()) == 0)
				.collect(Collectors.toList()).size() != 0)// check mã dạng dùng theo ngày
			return "{ \"status\": 2}";// ma da dung;
		if (rs.getType() == 3 && rs.getBills().stream()
				.filter((item) -> item.getCreateDate().getTime() - validateDate.getTime() < 7 * 1000 * 60 * 60 * 24
						&& item.getAccount().getUsername().compareTo(userSs.getAccInfor().getUsername()) == 0)
				.collect(Collectors.toList()).size() != 0)// check mã dạng dùng theo tuần
			return "{ \"status\": 2}";// ma da dung;
		if (rs.getType() == 4 && rs.getBills().stream()
				.filter((item) -> item.getCreateDate().getYear() == validateDate.getYear()
						&& item.getCreateDate().getMonth() == validateDate.getMonth()
						&& item.getAccount().getUsername().compareTo(userSs.getAccInfor().getUsername()) == 0)
				.collect(Collectors.toList()).size() != 0)// check mã dạng dùng theo tháng
			return "{ \"status\": 2}";// ma da dung;
		lst.setPromo(rs);
		session.setAttribute("cart", lst);
		return "{\"totalValue\": " + lst.getTotalValue().setScale(2) + ", \"status\": 1, \"totalItem\": "
				+ lst.getLstItem().size() + ", \"promoValue\": " + lst.getPromoValue().setScale(2) + "}";
	}

	@GetMapping(value = "/huyen")
	@ResponseBody
	public String loadWard(@RequestParam("idTinh") int districtID) {
		List<javaweb.Entity.Ward> lstRs = ward.getByDistrictID(districtID);
		if (lstRs != null) {
			try {
				ObjectMapper mapper = new ObjectMapper();
				String resp = mapper.writeValueAsString(lstRs).toString();
				return resp;
			} catch (Exception e) {
				e.printStackTrace();
				return "{ \"message\": \"failed\"}";
			}
		}
		return "{ \"message\": \"null\"}";
	}

	@GetMapping(value = "/xa")
	@ResponseBody
	public String loadCommune(@RequestParam("idHuyen") int wardID) {
		List<javaweb.Entity.Commune> lstRs = commune.getByWardID(wardID);
		if (lstRs != null) {
			try {
				ObjectMapper mapper = new ObjectMapper();
				String resp = mapper.writeValueAsString(lstRs).toString();
				return resp;
			} catch (Exception e) {
				e.printStackTrace();
				return "{ \"message\": \"failed\"}";
			}
		}
		return "{ \"message\": \"null\"}";
	}
}

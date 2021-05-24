package javaweb.controller.Admin;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javaweb.Entity.Trademark;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Color;
import javaweb.services.inter.Product;
import javaweb.services.inter.ProductHasColorHasBill;
import javaweb.services.inter.Promotion;
import javaweb.services.inter.TradeMark;

@RestController
@RequestMapping(value = "admin/api", produces = "text/plain;charset=UTF-8")
public class RestAdminController {
	@Autowired
	Account acc;
	@Autowired
	Color col;
	@Autowired
	TradeMark trade;
	@Autowired
	Product pro;
	@Autowired
	javaweb.services.inter.ProductHasColor pro_col;
	@Autowired
	Promotion promo;
	@Autowired
	Bill bill;
	@Autowired
	ProductHasColorHasBill pro_col_bill;

	@PutMapping("/tai-khoan/khoa")
	@ResponseBody
	public String updateAccountStatus(Model model, HttpSession session, @RequestParam("username") String username) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (username == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if (acc.putNewStatus(username) == true)
			return "{ \"status\": 1}";// cap nhat thanh cong
		else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@PostMapping(value = "/san-pham/mau")
	@ResponseBody
	public String addColor(Model model, HttpSession session, @RequestParam("tenMauMoi") String newColorName,
			@RequestParam("idSanPham") int idProduct) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (newColorName == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		javaweb.Entity.Color newCol = col.postNew(newColorName);
		boolean rsPro_Col = pro_col.postNew(idProduct, newCol.getId(), 0);
		if (newCol != null && rsPro_Col) {
			ObjectMapper mapper = new ObjectMapper();
			try {
				String rs = mapper.writeValueAsString(newCol);
				return rs;// Cập nhật thành công
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				return "{ \"status\": 1}";// cap nhat thanh cong
			}
		} else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@PostMapping(value = "/thuong-hieu")
	@ResponseBody
	public String addTrademark(Model model, HttpSession session,
			@RequestParam("tenThuongHieuMoi") String newTradeName) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (newTradeName == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		Trademark newTrade = trade.postNew(newTradeName);
		if (newTrade != null) {
			ObjectMapper mapper = new ObjectMapper();
			try {
				String rs = mapper.writeValueAsString(newTrade);
				return rs;// cap nhat thanh cong
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				return "{ \"status\": 1}";// cap nhat thanh cong
			}
		} else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}





	@DeleteMapping("/san-pham")
	@ResponseBody
	public String deleteProduct(Model model, HttpSession session, @RequestParam("idSanPham") int id) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		try {
			if (pro_col.deleteMany(id) == true) {
				if (pro.deleteByID(id) == true) {
					return "{ \"status\": 1}";// cap nhat thanh cong
				} else
					return "{ \"status\": 2}";//cập nhật thất bại 
			} else
				return "{ \"status\": 2}";//cập nhật thất bại
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 4}";// lỗi
		}

	}

	@PostMapping("/ma-khuyen-mai")
	@ResponseBody
	public String addPromotion(Model model, HttpSession session, @RequestParam("idKhuyenMai") String id,
			@RequestParam("ngayHetHan") String expriedDate, @RequestParam("giaTri") String value,
			@RequestParam("loai") int type) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (id == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		try {
			boolean rs = promo.postNew(id.toUpperCase(), new BigDecimal(value),
					new SimpleDateFormat("yyyy-MM-dd").parse(expriedDate), type);
			;
			if (rs) {
				return "{ \"status\": 1}";// cap nhat thanh cong
			} else
				return "{ \"status\": 2}";// cap nhat khong thanh cong
		} catch (Exception e) {
			return "{ \"status\": 4}";// loi khac(sai dinh dang input url, loi truy van db,...)
		}
	}

	@PutMapping("/ma-khuyen-mai")
	@ResponseBody
	public String updatePromotion(Model model, HttpSession session, @RequestParam("idKhuyenMai") String id,
			@RequestParam("ngayHetHan") String expriedDate, @RequestParam("giaTri") String value,
			@RequestParam("loai") int type) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (id == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		try {
			boolean rs = promo.put(id, new BigDecimal(value), new SimpleDateFormat("yyyy-MM-dd").parse(expriedDate),
					type);
			if (rs) {
				return "{ \"status\": 1}";// cap nhat thanh cong
			} else
				return "{ \"status\": 2}";// cap nhat khong thanh cong
		} catch (Exception e) {
			return "{ \"status\": 4}";// loi khac(sai dinh dang input url, loi truy van db,...)
		}
	}

	@PutMapping("/hoa-don")
	@ResponseBody
	public String updateBill(Model model, HttpSession session, @RequestParam("idHoaDon") int id) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chưa đăng nhập
		try {
			boolean rs = bill.putStatusByID(id);
			if (rs)
				return "{ \"status\": 1}";// thành công
			else
				return "{ \"status\": 2}";// thất bại
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 4}";// Lỗi truy vấn
		}

	}

	@DeleteMapping("/hoa-don")
	@ResponseBody
	public String deleteBill(Model model, HttpSession session, @RequestParam("idHoaDon") int id) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		try {
			boolean rsBillDetail = pro_col_bill.deleteByBillId(id);
			boolean rsBill = bill.deleteByID(id);
			if (rsBillDetail && rsBill)
				return "{ \"status\": 1}";// thành công
			else
				return "{ \"status\": 2}";// thất bại
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 4}";// Lỗi truy vấn
		}

	}

}

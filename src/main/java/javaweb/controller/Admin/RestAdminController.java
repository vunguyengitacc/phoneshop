package javaweb.controller.Admin;

import java.math.BigDecimal;

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
import javaweb.services.inter.Color;
import javaweb.services.inter.Product;
import javaweb.services.inter.TradeMark;

@RestController
@RequestMapping("admin/api")
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

	@PutMapping("/tai-khoan/khoa")
	@ResponseBody
	public String updateAccountStatus(Model model, HttpSession session, @RequestParam("username") String username) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (username == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if (acc.setNewStatus(username) == true)
			return "{ \"status\": 1}";// cap nhat thanh cong
		else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@PostMapping("/san-pham/mau")
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
				return rs;// cap nhat thanh cong
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				return "{ \"status\": 1}";// cap nhat thanh cong
			}
		} else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@PostMapping("/thuong-hieu")
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

	@PostMapping("/san-pham")
	@ResponseBody
	public String addNewProduct(Model model, HttpSession session, @RequestParam("idSanPham") String id,
			@RequestParam("tenSanPham") String name, @RequestParam("giaGoc") String originalPrice,
			@RequestParam("giaBan") String price, @RequestParam("giaKhuyenMai") String promotionPrice,
			@RequestParam("idThuongHieu") int idTrade, @RequestParam("ram") String ram, @RequestParam("rom") String rom,
			@RequestParam("kichCoManHinh") BigDecimal screenSize, @RequestParam("camTruoc") String frontCam,
			@RequestParam("camSau") String backCam, @RequestParam("heDieuHanh") String os,
			@RequestParam("cpu") String cpu, @RequestParam("gpu") String gpu, @RequestParam("pin") String pin,
			@RequestParam("sim") String sim, @RequestParam("moTa") String description) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		try {
			int rsPro = pro.postNew(name, new BigDecimal(originalPrice).abs(), new BigDecimal(price).abs(),
					new BigDecimal(promotionPrice).abs(), "", description, Math.abs(Integer.parseInt(ram)),
					Math.abs(Integer.parseInt(rom)), screenSize, frontCam, backCam, Math.abs(Integer.parseInt(pin)), os,
					cpu, gpu, sim, idTrade);
			if (rsPro != -1) {
				return "{ \"status\": 1}";// cap nhat thanh cong
			} else
				return "{ \"status\": 2}";// cap nhat khong thanh cong
		} catch (Exception e) {
			return "{ \"status\": 4}";// loi nhap sai dinh dang
		}

	}

	@PutMapping("/san-pham")
	@ResponseBody
	public String updateProduct(Model model, HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("tenSanPham") String name, @RequestParam("giaGoc") String originalPrice,
			@RequestParam("giaBan") String price, @RequestParam("giaKhuyenMai") String promotionPrice,
			@RequestParam("soLuongMau") String amountColor, @RequestParam("idMau") int idColor,
			@RequestParam("idThuongHieu") int idTrade, @RequestParam("ram") String ram, @RequestParam("rom") String rom,
			@RequestParam("kichCoManHinh") BigDecimal screenSize, @RequestParam("camTruoc") String frontCam,
			@RequestParam("camSau") String backCam, @RequestParam("heDieuHanh") String os,
			@RequestParam("cpu") String cpu, @RequestParam("gpu") String gpu, @RequestParam("pin") String pin,
			@RequestParam("sim") String sim, @RequestParam("moTa") String description) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		try {
			boolean rsProduct = pro.putByID(id, name, new BigDecimal(originalPrice).abs(), new BigDecimal(price).abs(),
					new BigDecimal(promotionPrice).abs(), "", description, Math.abs(Integer.parseInt(ram)),
					Math.abs(Integer.parseInt(rom)), screenSize, frontCam, backCam, Math.abs(Integer.parseInt(pin)), os,
					cpu, gpu, sim, idTrade);
			boolean rsColor = pro_col.put(id, idColor, Math.abs(Integer.parseInt(amountColor)));
			if (rsProduct || rsColor) {
				return "{ \"status\": 1}";// cap nhat thanh cong
			} else
				return "{ \"status\": 2}";// cap nhat khong thanh cong
		} catch (Exception e) {
			return "{ \"status\": 4}";// loi nhap sai dinh dang
		}

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
					return "{ \"status\": 2}";// cap nhat khong thanh cong
			} else
				return "{ \"status\": 2}";// cap nhat khong thanh cong
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		}

	}
}

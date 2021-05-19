package javaweb.controller.Admin;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Color;
import javaweb.services.inter.Product;
import javaweb.services.inter.TradeMark;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	Account acc;
	@Autowired
	Product pro;
	@Autowired
	TradeMark trade;
	@Autowired
	Color col;
	@Autowired
	Bill bill;

	public boolean checkAdminSession(HttpSession session) {
		UserSession userSS = (UserSession) session.getAttribute("UserSession");
		if (userSS == null)
			return false;
		if (userSS.getAccInfor().getType() != 0)
			return false;
		return true;
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-tai-khoan")
	public String lstAccountPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAll();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		List<javaweb.Entity.Account> lstAcc = acc.getAllFetch("bills");
		lstAcc = lstAcc.stream().filter((item) -> item.getType() != 0).collect(Collectors.toList());
		model.addAttribute("lstAccount", lstAcc);
		return "admin/ListAccountManager";
	}

	@GetMapping("/log-out")
	public String logoutHandler(HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		session.invalidate();
		return "redirect:/trang-chu/";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-san-pham")
	public String lstProductPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		model.addAttribute("lstProduct", pro.getAll());
		List<javaweb.Entity.Bill> lstOrder = bill.getAll();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		return "admin/ListProductManager";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-san-pham/chi-tiet-san-pham")
	public String productDetails(Model model, HttpSession session, @RequestParam("idSanPham") int idProduct) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAll();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		javaweb.Entity.Product rs = pro.getByID(idProduct, false);
		model.addAttribute("productDetail", rs);
		if (rs != null)
			model.addAttribute("lstTrademark", trade.getAll().stream()
					.filter((item) -> item.getId() != rs.getTrademark().getId()).collect(Collectors.toList()));
		else
			model.addAttribute("lstTrademark", trade.getAll());
		return "admin/ProductManager";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-hoa-don")
	public String lstOrderPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAll();
		model.addAttribute("lstOrder", bill.getAllFetch());
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		return "admin/ListOrderManager";
	}

}

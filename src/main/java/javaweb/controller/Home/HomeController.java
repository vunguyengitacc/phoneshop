package javaweb.controller.Home;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javaweb.controller.HandlerVN;
import javaweb.controller.session.Cart;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Color;
import javaweb.services.inter.Comment;
import javaweb.services.inter.Product;
import javaweb.services.inter.Rating;
import javaweb.services.inter.TradeMark;

@Controller
@RequestMapping(value = "/trang-chu")
public class HomeController {

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
	Bill bill;
	@Autowired
	Account acc;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model, HttpSession session) {

		Cart lst = (Cart) session.getAttribute("cart");// lay session
		if (lst == null)
			lst = new Cart();// neu khong ton tai -> session chua duoc tao field cart
		List<javaweb.Entity.Product> lstPro = pro.getAll();
		int size = lstPro.size();
		lstPro.subList(0, size > 4 ? 4 : size);
		model.addAttribute("lstPro", lstPro);// tra ve list san pham (4 san pham hang dau)
		model.addAttribute("lstTradeMark", trade.getAll());// tra ve danh sach thuong hieu
		session.setAttribute("cart", lst);// them cart vua thao tac vao session
		return "home/Home";
	}

	@RequestMapping(value = "/san-pham", method = RequestMethod.GET)
	public String productPage(Model model, @RequestParam("trang") int pageID,
			@RequestParam("thuongHieu") String tradeMark, @RequestParam("timKiem") String findString,
			HttpSession session) {
		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		List<javaweb.Entity.Product> lst;
		if (tradeMark == "") {
			lst = pro.getAll();
		} else {
			lst = pro.getByTradeMark(tradeMark);
		}
		if (findString != "") {

			findString = HandlerVN.removeAccent(findString).toLowerCase();// chuyen doi chuoi tim kiem ve dang chu khong
																			// dau va dua tat ca ve chu thuong
			StringTokenizer strTokens = new StringTokenizer(findString);// tach chuoi thanh cac token
			StringBuilder reGex = new StringBuilder(".*(");// tao reGex
			while (strTokens.hasMoreElements()) {
				reGex.append(strTokens.nextToken() + "|");// append cac token voi reGex de co dang:
															// ".*(something1|something1|"
			}
			int indexRm = reGex.lastIndexOf("|");
			if (indexRm != -1)// tru di truong hop khong co str token nao duoc append vao reGex
				reGex = reGex.deleteCharAt(reGex.lastIndexOf("|"));// xoa ki tu | cuoi -> ".*(something1|something1"
			reGex.append(").*");// append vao de tao thanh reGex hoan chinh co dang:
								// ".*(something1|something1).*"
			final String finalString = reGex.toString();
			lst = lst.stream().filter(x -> HandlerVN.removeAccent(x.getName()).toLowerCase().matches(finalString))
					.collect(Collectors.toList());// dua list cart vao stream de filter ra phan tu trong truong hop phan
													// tu da ton tai
		}
		int count = lst.size();
		if (count >= pageID * 9)
			lst.subList((pageID - 1) * 9, pageID * 9);// lay phan tu can hien thi tai trang x
		else
			lst.subList(count - 9 > 0 ? count - 9 : 0, count);// truong hop khong du lay cho 1 trang thi lay tat ca san
																// pham con lai
		model.addAttribute("count", count);
		if (count / 9 + 1 < pageID)
			pageID = count / 9 + 1;// tra ve trang cuoi cung trong truong hop req yeu cau so trang vuot ngoai gioi
									// han
		model.addAttribute("lstPro", lst);
		model.addAttribute("lstTradeMark", trade.getAll());
		model.addAttribute("pageCount", count / 9 + 1);
		model.addAttribute("currentPage", pageID);
		session.setAttribute("cart", lstInSS);
		return "home/Shop";
	}

	@RequestMapping(value = "/san-pham/{ten-san-pham}")
	public String productDetailsPage(Model model, @RequestParam(value = "id") int id, HttpSession session) {

		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		model.addAttribute("lstTradeMark", trade.getAll());
		model.addAttribute("pro", pro.getByID(id, false));
		model.addAttribute("lstComment", cmt.getByIDProduct(id));
		UserSession userSS = (UserSession) session.getAttribute("UserSession");
		if (userSS != null)
			model.addAttribute("ratingUser", rate.getByProductIDAndAccount(userSS.getAccInfor().getUsername(), id));
		double totalRating = 0;
		try {
			totalRating = rate.getByProductID(id).stream().mapToDouble(javaweb.Entity.Rating::getRate).average()
					.getAsDouble();
		} catch (NoSuchElementException e) {
			totalRating = 0;
		}
		model.addAttribute("ratingProduct", totalRating);
		session.setAttribute("cart", lstInSS);
		return "home/ProductDetail";
	}

	@RequestMapping("/gio-hang")
	public String cartPage(Model model, HttpSession session) {

		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		model.addAttribute("lstTradeMark", trade.getAll());
		session.setAttribute("cart", lstInSS);
		return "home/CartDetail";
	}

	@PostMapping("/{ten-san-pham}/binh-luan")
	public String postCommentPage(Model model, HttpSession session, @RequestParam("id") int idProduct,
			@RequestParam("contentCmt") String contentCmt) {

		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "redirect:/trang-chu/";
		if (contentCmt == "")
			return "redirect:/trang-chu/san-pham/" + pro.getByID(idProduct, true).getName() + "?id=" + idProduct;
		if (cmt.postComment(userSs.getAccInfor().getUsername(), idProduct, contentCmt) == false)
			return "redirect:/trang-chu/";
		return "redirect:/trang-chu/san-pham/" + pro.getByID(idProduct, true).getName() + "?id=" + idProduct;
	}

	@GetMapping("/trang-ca-nhan")
	public String profilePage(Model model, HttpSession session) {
		UserSession userSS = (UserSession) session.getAttribute("UserSession");
		if (userSS == null)
			return "redirect:/trang-chu/";
		return "home/Profile";
	}

	@GetMapping("/gio-hang/thanh-toan")
	public String checkOutPage(Model model, HttpSession session) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		if (userSs == null)
			return "redirect:/trang-chu/";
		session.setAttribute("cart", lstInSS);
		return "home/CheckOut";
	}

	@GetMapping("gio-hang/thanh-toan/ket-qua")
	public String resultCheckOut(Model model, HttpSession session, @RequestParam("maDiaChi") int comm,
			@RequestParam("maGiamGia") int promo) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (userSs == null)
			return "redirect:/trang-chu/";
		if (lstInSS == null || lstInSS.getLstItem().size() == 0) {
			model.addAttribute("resultCode", 2);// 2: khong ton tai mat hang nao trong gio hang
			return "home/Result";
		}
		if(bill.createBill(acc.getByUsername(userSs.getAccInfor().getUsername(), true), comm, lstInSS.getTotalValue(),
				promo, lstInSS)==false)
			model.addAttribute("resultCode", 3);//them that bai
		else
			model.addAttribute("resultCode", 1);//them thanh cong
		return "home/Result";
	}
}

package javaweb.controller.Home;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;

import javaweb.Entity.Trademark;
import javaweb.controller.HandlerVN;
import javaweb.controller.session.Cart;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Color;
import javaweb.services.inter.Comment;
import javaweb.services.inter.District;
import javaweb.services.inter.GeneralInformation;
import javaweb.services.inter.Product;
import javaweb.services.inter.ProductHasColorHasBill;
import javaweb.services.inter.Promotion;
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
	@Autowired
	ProductHasColorHasBill pro_bill;
	@Autowired
	District distr;
	@Autowired
	Promotion promo;
	@Autowired
	GeneralInformation infor;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model, HttpSession session) {

		Cart lst = (Cart) session.getAttribute("cart");// lay session
		if (lst == null)
			lst = new Cart();// neu khong ton tai -> session chua duoc tao field cart
		List<String> lstField = new ArrayList<String>(
				List.of("productHasColors", "productHasColors.productHasColorHasBills", "trademark"));
		List<javaweb.Entity.Product> lstPro = pro.getAllFetch(lstField);
		lstPro.sort((a, b) -> b.getProductHasColors().stream().map((item) -> item.getProductHasColorHasBills().size())
				.reduce(0, Integer::sum).compareTo(a.getProductHasColors().stream()
						.map((item) -> item.getProductHasColorHasBills().size()).reduce(0, Integer::sum)));// xếp theo
																											// số lượt
																											// mua cao
																											// nhất
		lstPro = lstPro.stream().limit(4).collect(Collectors.toList());
		model.addAttribute("lstPro", lstPro);
		session.setAttribute("cart", lst);// thêm giỏ hàng vào session
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/Home";
	}

	@RequestMapping(value = "/lien-he", method = RequestMethod.GET)
	public String contactPage(Model model, HttpSession session) {

		Cart lst = (Cart) session.getAttribute("cart");// lay session
		if (lst == null)
			lst = new Cart();// neu khong ton tai -> session chua duoc tao field cart
		session.setAttribute("cart", lst);// thêm giỏ hàng vào session
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/Contact";
	}

	@RequestMapping(value = "/san-pham", method = RequestMethod.GET)
	public String productPage(Model model, @RequestParam("trang") int pageID, @RequestParam("sapXep") int sortType,
			@RequestParam("thuongHieu") String tradeMark, @RequestParam("timKiem") String findString,
			HttpSession session) {
		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		List<String> lstField = new ArrayList<String>(
				List.of("trademark", "productHasColors", "productHasColors.productHasColorHasBills"));
		List<javaweb.Entity.Product> lst = pro.getAllFetch(lstField);
		if (tradeMark != "") {
			try {
				lst = lst.stream().filter((item) -> item.getTrademark().getName().equalsIgnoreCase(tradeMark))
						.collect(Collectors.toList());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (findString != "") {

			findString = HandlerVN.removeAccent(findString).toLowerCase();// chuyen doi chuoi tim kiem ve dang chu khong
																			// dau va dua tat ca ve chu thuong
			StringTokenizer strTokens = new StringTokenizer(findString);// tach chuoi thanh cac token
			StringBuilder reGex = new StringBuilder(".*(");// tao biểu thức
			while (strTokens.hasMoreElements()) {
				reGex.append(strTokens.nextToken() + "|");// append cac token voi regex de co dang:
															// ".*(something1|something1|"
			}
			int indexRm = reGex.lastIndexOf("|");
			if (indexRm != -1)// tru di truong hop khong co str token nao duoc append vao regex
				reGex = reGex.deleteCharAt(reGex.lastIndexOf("|"));// xoa ki tu | cuoi -> ".*(something1|something1"
			reGex.append(").*");// append vao de tao thanh regex hoan chinh co dang:
								// ".*(something1|something1).*"
			final String finalString = reGex.toString();
			lst = lst.stream().filter(x -> HandlerVN.removeAccent(x.getName()).toLowerCase().matches(finalString))
					.collect(Collectors.toList());// dua list cart vao stream de filter ra phan tu trong truong hop phan
													// tu da ton tai
		}
		int count = lst.size();
		if (sortType == 1)
			lst.sort((a, b) -> b.getCreatedDate().compareTo(a.getCreatedDate()));// xếp theo ngày tạo mới nhất
		else if (sortType == 2)
			lst.sort((a, b) -> a.getPrice().compareTo(b.getPrice()));// xếp theo giá nhỏ nhất
		else if (sortType == 3)
			lst.sort((a, b) -> b.getPrice().compareTo(a.getPrice()));// xếp theo giá lớn nhất
		else if (sortType == 4)
			lst.sort((a, b) -> b.getProductHasColors().stream().map((item) -> item.getProductHasColorHasBills().size())
					.reduce(0, Integer::sum).compareTo(a.getProductHasColors().stream()
							.map((item) -> item.getProductHasColorHasBills().size()).reduce(0, Integer::sum)));// xếp
																												// theo
																												// lượt
																												// mua
		lst = lst.stream().skip((pageID - 1) * 16).limit(16).collect(Collectors.toList());// lay phan tu can hien thi
																							// tai
																							// trang x
		model.addAttribute("count", count);
		if (count / 16 + 1 < pageID)
			pageID = count % 16 == 0 ? count / 16 : count / 16 + 1;// tra ve trang cuoi cung trong truong hop req yeu
																	// cau so trang vuot ngoai gioi
		// han
		model.addAttribute("lstPro", lst);
		List<Trademark> lstTrademark = trade.getAll().parallelStream().filter((item) -> item.getProducts().size() > 0)
				.collect(Collectors.toList());
		lstTrademark.forEach((item) -> item.loadAmount());
		model.addAttribute("lstTradeMark", lstTrademark);
		model.addAttribute("pageCount", count % 16 == 0 ? count / 16 : count / 16 + 1);
		model.addAttribute("currentPage", pageID);
		session.setAttribute("cart", lstInSS);
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/Shop";
	}

	@RequestMapping(value = "/san-pham/{ten-san-pham}")
	public String productDetailsPage(Model model, @RequestParam(value = "id") int id, HttpSession session) {

		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		List<Trademark> lstTrademark = trade.getAll().parallelStream().filter((item) -> item.getProducts().size() > 0)
				.collect(Collectors.toList());
		lstTrademark.forEach((item) -> item.loadAmount());
		model.addAttribute("lstTradeMark", lstTrademark);
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
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/ProductDetail";
	}

	@RequestMapping("/gio-hang")
	public String cartPage(Model model, HttpSession session) {

		Cart lstInSS = (Cart) session.getAttribute("cart");
		if (lstInSS == null)
			lstInSS = new Cart();
		model.addAttribute("lstTradeMark", trade.getAll());
		session.setAttribute("cart", lstInSS);
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/CartDetail";
	}

	@PostMapping("/{ten-san-pham}/binh-luan")
	public String postCommentPage(Model model, HttpSession session, @RequestParam("id") int idProduct,
			@RequestParam("contentCmt") String contentCmt) {

		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "redirect:/trang-chu/";
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "redirect:/trang-chu/";
		}
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
		if (userSS.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "redirect:/trang-chu/";
		}
		HashMap<String, String> lstInput = new HashMap<String, String>();
		lstInput.put("account.username", userSS.getAccInfor().getUsername());
		List<String> lstField = new ArrayList<String>(List.of("account", "promotion"));
		List<javaweb.Entity.Bill> lstBills = bill.getAllAdvance(lstInput, lstField);
		model.addAttribute("lstBills", lstBills.stream()
				.sorted((a, b) -> b.getCreateDate().compareTo(a.getCreateDate())).collect(Collectors.toList()));
		model.addAttribute("shopInfor", infor.getInfor());
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
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "redirect:/trang-chu/";
		}
		List<javaweb.Entity.District> lstDistrict = distr.getAll();
		model.addAttribute("lstDistrict", lstDistrict);
		session.setAttribute("cart", lstInSS);
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/CheckOut";
	}

	@GetMapping("gio-hang/thanh-toan/ket-qua")
	public String resultCheckOut(Model model, HttpSession session, @RequestParam("maDiaChi") int comm,
			@RequestParam("maGiamGia") String promo) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		Cart lstInSS = (Cart) session.getAttribute("cart");
		session.setAttribute("cart", new Cart());
		if (userSs == null)
			return "redirect:/trang-chu/";
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "redirect:/trang-chu/";
		}
		if (lstInSS == null || lstInSS.getLstItem().size() == 0) {
			model.addAttribute("resultCode", 2);// 2: khong ton tai mat hang nao trong gio hang
			model.addAttribute("shopInfor", infor.getInfor());
			return "home/Result";
		}
		int idRS = bill.postBill(acc.getByUsername(userSs.getAccInfor().getUsername(), true), comm,
				lstInSS.getPromoValue(), promo);
		if (idRS == -1) {
			model.addAttribute("resultCode", 3);// them that bai
			System.out.println("BUG LỖI");
		} else {
			model.addAttribute("resultCode", 1);// them thanh cong
			// Them chi tiet hoa don
			lstInSS.getLstItem().forEach((item) -> {
				if (pro_bill.postNew(item.getColor().getId(), item.getPro().getId(), idRS, item.getAmount()) == false)
					System.out.println("BUG: Error");
			});
		}
		model.addAttribute("shopInfor", infor.getInfor());
		return "home/Result";
	}

	@GetMapping("/ma-giam-gia")
	public String promotionPage(Model model, HttpSession session, @RequestParam("trang") int pageID,
			@RequestParam("sapXep") int type) {
		Cart lstInSS = (Cart) session.getAttribute("cart");// lay session
		if (lstInSS == null)
			lstInSS = new Cart();// neu khong ton tai -> session chua duoc tao field cart
		List<javaweb.Entity.Promotion> lst = promo.getAllFetch(null);
		int count = lst.size();
		if (type == 1)
			lst.sort((a, b) -> b.getCreatedDate().compareTo(a.getCreatedDate()));// xếp theo ngày tạo
		else if (type == 2)
			lst.sort((a, b) -> b.getValue().compareTo(a.getValue()));// xếp theo giá trị
		lst = lst.stream().skip((pageID - 1) * 8).limit(8).collect(Collectors.toList());// lay phan tu can hien thi
																						// tai
																						// trang x
		model.addAttribute("count", count);
		if (count / 8 + 1 < pageID)
			pageID = count % 8 == 0 ? count / 8 : count / 8 + 1;// tra ve trang cuoi cung trong truong hop req yeu
																// cau so trang vuot ngoai gioi
		model.addAttribute("lstPromotion", lst);
		model.addAttribute("lstTradeMark", trade.getAll());
		model.addAttribute("pageCount", count % 8 == 0 ? count / 8 : count / 8 + 1);
		model.addAttribute("currentPage", pageID);
		model.addAttribute("shopInfor", infor.getInfor());
		session.setAttribute("cart", lstInSS);
		return "home/Promotion";
	}

	@PostMapping("/trang-ca-nhan/cap-nhat-anh")
	public String updateAvatar(Model model, HttpSession session, @RequestParam("avatar") MultipartFile file) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "redirect:/trang-chu/";
		try {
			String filename = null;
			filename = file.getOriginalFilename();
			String realPath = session.getServletContext().getRealPath("/WEB-INF/webImages/user/");
			File repository = new File(realPath);
			if (!repository.exists())
				repository.mkdirs();
			byte[] content = file.getBytes();
			BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(realPath + filename));
			writer.write(content);
			writer.flush();
			writer.close();
			acc.putNewAvatar(userSs.getAccInfor().getUsername(), "/resources/user/" + filename);
			userSs.setAccInfor(acc.getByUsername(userSs.getAccInfor().getUsername(), true));
			session.setAttribute("UserSession", userSs);
		} catch (Exception e) {
			System.out.println("BUG: ERROR");
			model.addAttribute("message", "Lỗi hệ thống! chưa thể cập nhật được");
		}
		return "redirect:/trang-chu/trang-ca-nhan";
	}

}

package javaweb.controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;

@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	Account acc;
	
	@GetMapping("/main")
	public String mainPage(Model model, HttpSession session) {
		UserSession userSS = (UserSession) session.getAttribute("UserSession");
		if(userSS==null)
			return "redirect:/trang-chu/";
		if(userSS.getAccInfor().getType()!=1)
			return "redirect:/trang-chu/";
		model.addAttribute("lstAccount", acc.getAll());
		return "Admin/main";
	}
	
	@GetMapping("/log-out")
	public String logoutHandler(HttpSession session) {
		UserSession userSS = (UserSession) session.getAttribute("UserSession");
		if(userSS==null)
			return "redirect:/trang-chu/";
		if(userSS.getAccInfor().getType()!=1)
			return "redirect:/trang-chu/";
		session.invalidate();
		return "redirect:/trang-chu/";
	}
}

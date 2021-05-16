package javaweb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;

@Controller
@RequestMapping("/dang-nhap")
public class LoginController {

	@RequestMapping("/")
	public String login(Model model, @RequestParam("username") String username,  @RequestParam("password") String password, HttpSession session) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if(userSs == null)
			userSs = new UserSession();
		Account acc = new javaweb.services.imple.Account();
		userSs.setAccInfor(acc.getByUsernameAndPass(username, password, false));
		session.setAttribute("UserSession", userSs);
		session.setMaxInactiveInterval(60*1);
		return "redirect:/trang-chu/";
	}
}

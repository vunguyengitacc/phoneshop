package javaweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javaweb.services.imple.Account;

@Controller
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public String homePage(Model model,@RequestParam("username") String username) {
		javaweb.services.inter.Account acc = new Account();
		model.addAttribute("lst", acc.checkByUsername(username));
		return "home/Home";
	}
}
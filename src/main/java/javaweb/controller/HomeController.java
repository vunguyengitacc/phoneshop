package javaweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javaweb.services.imple.Account;
import javaweb.services.inter.Product;

@Controller
public class HomeController {

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String checkPage(Model model,@RequestParam("username") String username) {
		javaweb.services.inter.Account acc = new Account();
		model.addAttribute("lst", acc.checkByUsername(username));
		return "home/Home";
	}
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public String homePage(Model model) {
		return "home/index";
	}
	
	@RequestMapping(value = "/san-pham", method = RequestMethod.GET)
	public String productPage(Model model) {
		Product pro = new javaweb.services.imple.Product();
		model.addAttribute("count", pro.getAll().size());
		return "home/products";
	}
}
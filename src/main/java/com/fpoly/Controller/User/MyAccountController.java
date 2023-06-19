package com.fpoly.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Orders;
import com.fpoly.Entity.Users;
import com.fpoly.Service.OrderService;
import com.fpoly.Service.UserService;
import com.fpoly.Untils.Hash;
import com.fpoly.Untils.Session;

@Controller
public class MyAccountController {
	@Autowired
	OrderService odsv;
	
	@Autowired
	Session session;
	
	@Autowired
	UserService ussv;
	
	@Autowired
	Hash hashpass;
	
	@GetMapping("my-account")
	public String viewMyAccount(Model model, @ModelAttribute("accountUser") Users us) {
		Users user = session.get("user");
		model.addAttribute("listOrder", odsv.findByusername(user.getId()));
		model.addAttribute("accountUser", user);
		return "User/MyAccount";
	}
	
	@GetMapping("cancellated")
	public String cancelOrder(@RequestParam("ordid") Integer id) {
		Orders ord = odsv.findById(id);
		ord.setStatus(2);
		odsv.update(ord);
		return "redirect:/my-account";
	}
	@GetMapping("invoice")
	public String viewMyAccount(Model model, @RequestParam("id") Integer id) {
		model.addAttribute("ord", odsv.findById(id));
		return "User/invoice";
	}
	
	@PostMapping("changePass")
	public String changePass(@RequestParam("password") String password, @RequestParam("newpass") String newpass, @RequestParam("cfpass") String cfpass) {
		Users us = session.get("user");
		if(hashpass.verify(password, us.getPassword())) {
			if(newpass.equals(cfpass)) {
				us.setPassword(newpass);
				ussv.update(us);
			}
		}
		return "redirect:/my-account";
	}
	@PostMapping("update-account")
	public String updateAccount(@ModelAttribute("accountUser") Users us) {
		ussv.update(us);
		return "redirect:/my-account";
	}
}

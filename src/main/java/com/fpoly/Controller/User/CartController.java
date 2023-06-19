package com.fpoly.Controller.User;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpoly.Entity.Products;
import com.fpoly.Service.Cart;
import com.fpoly.Untils.Session;

@Controller

public class CartController {
	@Autowired
	Cart order;
	
	@Autowired
	Session session;
	
	
	@GetMapping("cart")
	public String views(Model model) {
		Products item = (Products) session.get("order");
		session.set("order", item);
		model.addAttribute("amount",order.getAmount());
		model.addAttribute("size", order.getCount());
		model.addAttribute("listCart",order.getProducts());
		return "User/shopCart";
	}
}

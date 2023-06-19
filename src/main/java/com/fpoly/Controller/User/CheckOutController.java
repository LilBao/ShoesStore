package com.fpoly.Controller.User;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fpoly.Entity.OrderDetails;
import com.fpoly.Entity.Orders;
import com.fpoly.Entity.Products;
import com.fpoly.Entity.Users;
import com.fpoly.Service.Cart;
import com.fpoly.Service.OrderDetailService;
import com.fpoly.Service.OrderService;
import com.fpoly.Service.ProductService;
import com.fpoly.Service.UserService;
import com.fpoly.Untils.Session;

@Controller
public class CheckOutController {
	@Autowired
	Cart cart;
	
	@Autowired
	Session session;
	
	@Autowired
	OrderService ordsv;

	@Autowired
	OrderDetailService ordtsv;
	
	@Autowired
	ProductService prdsv;
	
	@Autowired
	UserService ussv;
	
	
	@GetMapping("/checkout")
	public String viewCheckout(Model model,@ModelAttribute("orders") Orders orders) {
		Products item = (Products) session.get("order");
		Users us = session.get("user");
		session.set("order", item);
		session.set("user", us);
		model.addAttribute("us",us);
		model.addAttribute("amount",cart.getAmount());
		model.addAttribute("size", cart.getCount());
		model.addAttribute("listCart",cart.getProducts());
		return "User/checkout";
	}

	@PostMapping("/checkout/confirm")
	public String checkout(@ModelAttribute("orders") Orders orders) {
		Users us = session.get("user");		
		Integer orderid = 0;
		orders.setTotalprice(cart.getAmount());
		Products product = null;
		if (us != null) {
			orders.setUsers(us);			
			ordsv.add(orders);
			orderid = ordsv.getLastId();			
		} else {
			ordsv.add(orders);
			orderid = ordsv.getLastId();
		}
		for (Products prod : cart.getProducts().values()) {
			OrderDetails ordt = new OrderDetails();
			ordt.setOrders(ordsv.findById(orderid));
			ordt.setProducts(prod);
			ordt.setColor(prod.getPrdDetail().get(0).getColor());
			ordt.setQuantity(prod.getQuantity());
			ordt.setPrice(prod.getQuantity()*prod.getPrice());
			ordt.setSize(prod.getPrdDetail().get(0).getSize()[0]);
			ordt.setImg(prod.getPrdDetail().get(0).getImg()[0]);
			ordtsv.add(ordt);
			//modify quantity product
			product= prdsv.findById(prod.getId());
			product.setQuantity(product.getQuantity()-prod.getQuantity());
			prdsv.update(product);
			
		}
		cart.clear();
		return "redirect:/invoice?id="+orderid;
	}
	


}

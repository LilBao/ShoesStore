package com.fpoly.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.Entity.Users;
import com.fpoly.Repository.FavoriteDAO;
import com.fpoly.Service.Cart;
import com.fpoly.Service.ProductService;
import com.fpoly.Untils.Session;

@Controller
@RequestMapping("home")
public class HomeController {
	@Autowired
	ProductService prdsv;
	@Autowired
	Cart cart;
	@Autowired
	FavoriteDAO fdao;
	@Autowired
	Session session;
	@GetMapping("")
	public String viewHome(Model model) {
		Users us  = session.get("user");
		if(us!=null) {
		session.set("user", us);
		model.addAttribute("sizeWishList", fdao.getCountFavorites(us.getId()));
		model.addAttribute("usid",us.getId());
		}
		model.addAttribute("size", cart.getCount());
		model.addAttribute("listFeature", prdsv.findAll());
		model.addAttribute("listRecent", prdsv.findListNewProduct());
		return "User/homeShop";
	}
}

package com.fpoly.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpoly.Entity.Users;
import com.fpoly.Repository.FavoriteDAO;
import com.fpoly.Untils.Session;

@Controller
public class FavoriteController {
	@Autowired
	FavoriteDAO fdao;
	@Autowired
	Session session;
	@GetMapping("wishlist")
	public String viewWishlist(Model model) {
		Users us = session.get("user");
		if(us==null) {
			return "redirect:/login";
		}
		session.set("user", us);
		model.addAttribute("sizeWishList", fdao.getCountFavorites(us.getId()));
		model.addAttribute("usid",us.getId());		
		model.addAttribute("wishList",fdao.listByUserid(us.getId()));
		return "User/wishList";
	}
}

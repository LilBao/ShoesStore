package com.fpoly.Controller.User;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Favorites;
import com.fpoly.Entity.Users;
import com.fpoly.Repository.FavoriteDAO;
import com.fpoly.Repository.ProductDAO;
import com.fpoly.Repository.UserDAO;
import com.fpoly.Service.Cart;
import com.fpoly.Untils.Session;

@Controller
@RequestMapping("api")
public class APIController {
	@Autowired
	Session session;

	@Autowired
	Cart cart;
	
	@Autowired
	FavoriteDAO fdao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	UserDAO usdao;

	@Autowired
	HttpServletRequest req;

	// Ajax Cart
	@GetMapping("cart/add")
	public String addToCart(Model model, @RequestParam("id") Integer id, @RequestParam("color") String color,
			@RequestParam("size") String size,@RequestParam("quantity") Integer quantity) {
		session.set("cartQuantity", cart.getCount());
		cart.add(id, color, size, quantity);
		return "redirect:/cart";
	}

	@GetMapping("cart/update")
	public String updateCart(@RequestParam("id") Integer id,@RequestParam("quantity") Integer quantity ) {
		cart.update(id, quantity);
		return "redirect:/cart";
	}

	@GetMapping("cart/remove")
	public String removeCart(@RequestParam("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart";
	}

	@GetMapping("cart/removeAll")
	public String removeAllCart() {
		cart.clear();
		return "redirect:/cart";
	}
	// End cart
	//Ajax wish lish
	@GetMapping("wishlist/add")
	public String addToWishList(@RequestParam("prdid") Integer prdid, @RequestParam("usid") Integer userid) {
		Favorites favorites = new Favorites();
		Users us = usdao.getReferenceById(userid);
		if(fdao.checkExis(userid, prdid)==null) {
		favorites.setProducts(pdao.findByID(prdid));
		favorites.setUsers(us);
		fdao.save(favorites);
		}
		return "redirect:/wishlist";
	}
	
	@GetMapping("wishlist/remove")
	public String addToWishList(@RequestParam("id") Integer id) {
		fdao.deleteById(id);
		return "redirect:/wishlist";
	}

}

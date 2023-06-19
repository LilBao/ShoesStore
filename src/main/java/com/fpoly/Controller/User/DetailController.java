package com.fpoly.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Products;
import com.fpoly.Entity.Users;
import com.fpoly.Repository.FavoriteDAO;
import com.fpoly.Service.Cart;
import com.fpoly.Service.ProductDetailService;
import com.fpoly.Service.ProductService;
import com.fpoly.Untils.Session;

@Controller
public class DetailController {
	@Autowired
	ProductService prdsv;
	@Autowired
	HttpServletRequest req;
	@Autowired
	Cart cart;
	@Autowired
	Session session;
	@Autowired
	FavoriteDAO fdao;
	
	@Autowired
	ProductDetailService prddtsv;
	
	@GetMapping("product")
	public String prdDetail(Model model, @RequestParam("id") Integer id) {
		Products prd = prdsv.findById(id);
		String color = req.getParameter("color");
		String orColor =prd.getPrdDetail().get(0).getColor();
		
		model.addAttribute("quantity",listSize(prd.getQuantity()));
		model.addAttribute("color",color);
		model.addAttribute("prd",prd);
		model.addAttribute("listColor",prddtsv.findIdPrd(id));
		model.addAttribute("listImgSize",prddtsv.findFirstPrd(id, color == null ? orColor : color).get(0));
		
		//Related Products
		Users us  = session.get("user");
		if(us!=null) {
		session.set("user", us);
		model.addAttribute("sizeWishList", fdao.getCountFavorites(us.getId()));
		model.addAttribute("usid",us.getId());
		}
		model.addAttribute("listRelated", prdsv.findListRelated(prd.getCategory().getId(),prd.getId()));
		return "User/Product_Detail";
	}
	
	public List<Integer> listSize(Integer quantity) {
		List<Integer> listSize = new ArrayList<>();
		for (int  i=1; i<=quantity;i++ ) {
			listSize.add(i);
		}
		return listSize;
	}
	
}

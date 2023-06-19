package com.fpoly.Controller.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Products;
import com.fpoly.Service.ProductService;

@Controller
public class ProductListController {
	@Autowired
	ProductService prdsv;
	@Autowired
	HttpServletRequest req;

	@ModelAttribute("listColor")
	public Map<String, String> listColor() {
		Map<String, String> colors = new HashMap<>();
		colors.put("Red", "Red");
		colors.put("Yellow", "Yellow");
		colors.put("Blue", "Blue");
		colors.put("Green", "Green");
		colors.put("Black", "Black");
		colors.put("White", "White");
		colors.put("Pink", "Pink");
		colors.put("Purpur", "Purpur");
		colors.put("Violet", "Violet");
		colors.put("Gray", "Gray");
		return colors;
	}
	
	@GetMapping("product-list")
	public String viewShop(Model model,@RequestParam("page") Optional<Integer> page
			, @RequestParam("sortField") Optional<String> sortField) {
		int pageSize = 20;
		String color = req.getParameter("color") == null ? "" : req.getParameter("color");
		String category = req.getParameter("category") == null ? "" : req.getParameter("category");
		Float min = req.getParameter("min") == null ? Float.MIN_VALUE : Float.valueOf(req.getParameter("min"));
		Float max = req.getParameter("max") == null ? Float.MAX_VALUE : Float.valueOf(req.getParameter("max"));
		String brand = req.getParameter("brand") == null ? "" : req.getParameter("brand");
		String sortDir = req.getParameter("sortDir") == null ? "desc" : req.getParameter("sortDir");
		
		Page<Products> listPage = prdsv.ListByCategory("%"+category+"%","%"+color+"%",min,max,"%"+brand+"%",page.orElse(0), pageSize, sortField.orElse("id"), sortDir);
		List<Products> list = listPage.getContent();
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("color", color);
		model.addAttribute("min", min);
		model.addAttribute("max", max);
		model.addAttribute("brand", brand);
		model.addAttribute("currentPage", page.orElse(0));
		model.addAttribute("totalItems", listPage.getTotalElements());
		model.addAttribute("totalPages", listPage.getTotalPages());
		model.addAttribute("sortField", sortField.orElse("id"));
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		return "User/product-list";
	}
}

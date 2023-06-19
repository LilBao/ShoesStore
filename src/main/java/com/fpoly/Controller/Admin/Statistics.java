package com.fpoly.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.Service.ProductService;

@Controller
@RequestMapping("index/statistic")
public class Statistics {
	@Autowired
	ProductService prdsv;
	
	
	@GetMapping("inventory")
	public String getInventory(Model model) {
		model.addAttribute("list",prdsv.getInventory());
		return "Admin/ReportInventory";
	}
	
	@GetMapping("favorite")
	public String getListFavorite(Model model) {
		model.addAttribute("list",prdsv.getFavorite());
		return "Admin/favorite";
	}
	@GetMapping("best-selling")
	public String getListBestSelling(Model model) {
		model.addAttribute("list",prdsv.getBestSelling());
		return "Admin/bestselling";
	}
}

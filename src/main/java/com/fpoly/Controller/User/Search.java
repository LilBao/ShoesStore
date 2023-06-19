package com.fpoly.Controller.User;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Repository.ProductDAO;
@Controller
public class Search {
	@Autowired
	ProductDAO pdao;
	
	@GetMapping("search-result")
	public String searchView(Model model, @RequestParam("keyword") Optional<String> keyword) {
		model.addAttribute("list", pdao.findByNameLike(keyword.orElse(" ")+"%"));
		return "User/search-result";
	}
}

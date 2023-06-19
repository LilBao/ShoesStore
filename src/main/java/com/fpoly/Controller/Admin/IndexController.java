package com.fpoly.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpoly.Repository.OrderDAO;

@Controller
public class IndexController {
	@Autowired
	OrderDAO ordtdao;
	
	@GetMapping("index")
	public String viewIndex(Model model) {
		model.addAttribute("pro",ordtdao.getPendingRequest());
		model.addAttribute("earningMonth",ordtdao.getEarningMonth());
		model.addAttribute("earningAnual",ordtdao.getEarningAnnual());
		return "Admin/index";
	}
}

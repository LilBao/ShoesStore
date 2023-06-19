package com.fpoly.Controller.Admin;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Category;
import com.fpoly.Service.CategoryService;

@Controller
@RequestMapping("index/category")
public class CategoryController {
	@Autowired
	CategoryService ctgrs;
	@Autowired
	HttpServletRequest req;
	@GetMapping()
	public String view(Model model,@ModelAttribute("category") Category cate,
			@RequestParam("page") Optional<Integer> pageNo, @RequestParam("sortField") Optional<String> sortField) {
		int pageSize = 5;
		String sortDir = req.getParameter("sortDir") == null ? "desc" : req.getParameter("sortDir");
		Page<Category> listPage = ctgrs.findPaginated(pageNo.orElse(0), pageSize, sortField.orElse("id"), sortDir);
		List<Category> listCate = listPage.getContent();
		
		model.addAttribute("currentPage", pageNo.orElse(0));
		model.addAttribute("totalItems", listPage.getTotalElements());
		model.addAttribute("totalPages", listPage.getTotalPages());
	    model.addAttribute("sortField", sortField.orElse("id"));
	    model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");	
		model.addAttribute("list",listCate);
		return "Admin/tblLoaihang";
	}
	@PostMapping("create")
	public String createCate(Model model,@ModelAttribute("category") Category cate) {
		ctgrs.add(cate);
		return "redirect:/index/category";
	}
	
	@PostMapping("update")
	public String updateCate(@ModelAttribute("category") Category cate) {
		ctgrs.update(cate);
		return "redirect:/index/category/edit/"+cate.getId();
	}
	
	@GetMapping("delete/{id}")
	public String deleteCate(@PathVariable("id") String id) {
		ctgrs.delete(id);
		return "redirect:/index/category";
	}
	
	@GetMapping("edit/{id}")
	public String editCate(Model model,@ModelAttribute("category")Category cate,@PathVariable("id") String id) {
		model.addAttribute("category", ctgrs.findById(id));
		model.addAttribute("list",ctgrs.findAll());
		return "Admin/tblLoaihang";
	}
	
	@GetMapping("new")
	public String editCate() {
		return "redirect:/index/category";
	}
	
}

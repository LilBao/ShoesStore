package com.fpoly.Controller.Admin;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Users;
import com.fpoly.Repository.UserDAO;
import com.fpoly.Service.UserService;

@Controller
@RequestMapping("index/user")
public class UserManagerController {
	@Autowired
	UserService userservice;

	@Autowired
	UserDAO dao;
	
	@Autowired
	HttpServletRequest req;

	@GetMapping()
	public String view(Model model, @ModelAttribute("user") Users us, @RequestParam("page") Optional<Integer> page,
			@RequestParam("sortField") Optional<String> sortField) {
		int pageSize = 10;
		String sortDir = req.getParameter("sortDir") == null ? "desc" : req.getParameter("sortDir");
		Page<Users> listPage = userservice.findPaginated(page.orElse(0), pageSize, sortField.orElse("id"), sortDir);
		List<Users> list = listPage.getContent();
		model.addAttribute("list",list);
		model.addAttribute("currentPage", page.orElse(0));
		model.addAttribute("totalItems", listPage.getTotalElements());
		model.addAttribute("totalPages", listPage.getTotalPages());
	    model.addAttribute("sortField", sortField.orElse("id"));
	    model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		return "Admin/tblUser";
	}

	@PostMapping("save")
	public String updateUser(@ModelAttribute("user") Users us) {
		userservice.update(us);
		return "redirect:/index/user/edit/" + us.getId();
	}

	@GetMapping("edit/{id}")
	public String deleteUser(Model model, @PathVariable("id") Integer id, @ModelAttribute("user") Users us) {
		model.addAttribute("user", userservice.findById(id));
		return "Admin/editUser";
	}

	@GetMapping("remove/{id}")
	public String deleteUser(@PathVariable("id") Integer id) {
		userservice.delete(id);
		return "redirect:/index/user";
	}

	@GetMapping("sort")
	public String sort(Model model, @RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("id"));
		model.addAttribute("users", dao.findAll(sort));
		return "foward:/index/user/sort";
	}
}

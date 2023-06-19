package com.fpoly.Controller.Admin;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Users;
import com.fpoly.Repository.UserDAO;
import com.fpoly.Service.UserService;
import com.fpoly.Untils.Cookies;
import com.fpoly.Untils.Hash;

@Controller

public class Admin_ChangeProfile {

	@Autowired
	Cookies cookie;

	@Autowired
	UserService userService;

	@Autowired
	Hash hashPass;

	@Autowired
	UserDAO dao;

	private Integer idUser;
	private String password;

	@GetMapping("/index/changepassword")
	public String changePass() {

		return "Admin/changePassword";
	}

	@GetMapping("/index/editaccount")
	public String accountDetail(Model model, @ModelAttribute("admin") Users us) {
		String username = cookie.get("user");

		if (username != null) {
			// set username trong findUser để lấy ra user
			us = userService.findByUserName(username); // để tính bảo mật nên trên profile k hiển thị mật khẩu

			idUser = us.getId();
			password = us.getPassword();
			model.addAttribute("admin", us);
		}

		return "Admin/editAccount";
	}

	@PostMapping("/index/editaccount/save")
	public String saveProfile(Model model,@Valid @ModelAttribute("admin") Users us, BindingResult result) {
		if(us!=null) {
			us.setId(idUser);
			us.setPassword(password);
			userService.update(us);
			model.addAttribute("message",true);
		}else {
			model.addAttribute("message",false);
		}
		return "Admin/editAccount";
	}

	@PostMapping("/index/editaccount/savePass")
	public String saveProfilePass(Model model,
			@RequestParam("password") String password,
			@RequestParam("passwordNew") String passwordNew,
			@RequestParam("passwordConfirm") String passwordConfirm) {
		String username = cookie.get("user");
		Users us = userService.findByUserName(username);	
		//Boolean success = false;
		if (us != null) {
			Boolean checkPass = hashPass.verify(password, us.getPassword());
			if (checkPass == true && passwordNew.equals(passwordConfirm)) {
				us.setPassword(hashPass.HashPass(passwordConfirm));
				dao.save(us);
				model.addAttribute("message",true);
			}else{				
				model.addAttribute("message",false);
			}
		}

		return "Admin/changePassword";
	}

}

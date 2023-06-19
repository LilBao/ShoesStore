package com.fpoly.Controller.User;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.MailInfo;
import com.fpoly.Entity.Users;
import com.fpoly.Service.UserService;
import com.fpoly.Untils.Cookies;
import com.fpoly.Untils.Hash;
import com.fpoly.Untils.MailService;
import com.fpoly.Untils.Session;

@Controller
public class Login {
	@Autowired
	UserService userService;

	@Autowired
	Cookies cookie;

	@Autowired
	Session session;

	@Autowired
	Hash hashpass;

	@Autowired
	HttpServletRequest req;

	@Autowired
	MailService mailsv;

	@GetMapping("login")
	public String view(@ModelAttribute("user") Users us, @ModelAttribute("userLogin") Users usLogin) {
		return "User/SignIn_Up";
	}

	@GetMapping("logout")
	public String view(@ModelAttribute("userLogin") Users usLogin) {
		session.remove("user");
		return "redirect:/login";
	}

	@PostMapping("login/signUp")
	public String SignUp(@ModelAttribute("user") Users us, @RequestParam("cfpassword") String cfpass) {
		if (us.getPassword().equals(cfpass)) {
			userService.add(us);
			sendCode(us);
		}
		return "redirect:/login";
	}

	@PostMapping("login/signIn")
	public String SignIn(@ModelAttribute("userLogin") Users usLogin) {
		Users us = userService.findByUserName(usLogin.getUsername());
		if (us != null) {
			boolean check = hashpass.verify(usLogin.getPassword(), us.getPassword());
			var remember = req.getParameter("remember");
			int hours = remember == null ? 0 : 24;
			if (check == true && us.getActivated() == 0) {
				cookie.add("username", usLogin.getUsername(), hours);
				cookie.add("password", usLogin.getPassword(), hours);
				session.set("user", us);
				return "redirect:/home";
			} else {
				return "redirect:/login";
			}
		}
		return "redirect:/login";
	}

	@GetMapping("/login/signUp/account-verification")
	public String viewVirify(Model model,@RequestParam("email") String email) {
		model.addAttribute("email",email);
		Users us = userService.findByEmail(email);
		String verify = req.getParameter("vrf1") + req.getParameter("vrf2") + req.getParameter("vrf3")
				+ req.getParameter("vrf4") + req.getParameter("vrf5");
		if (us.getToken().equalsIgnoreCase(verify)) {
			us.setActivated(0);
			userService.update(us);
			return "redirect:/login";
		}
		return "User/Verify";
	}

	@GetMapping("verification")
	public String verify(Model model, @RequestParam("email") String email) {
		Users us = userService.findByEmail(email);
		String verify = req.getParameter("vrf1") + req.getParameter("vrf2") + req.getParameter("vrf3")
				+ req.getParameter("vrf4") + req.getParameter("vrf5");
		if (us.getToken().equalsIgnoreCase(verify)) {
			us.setActivated(0);
			userService.update(us);
			return "redirect:/login";
		}
		return "redirect:/account-verification?email=" + email;
	}

	public void sendCode(Users us) {
		MailInfo mail = new MailInfo();
		mail.setFrom("baonvps24728@fpt.edu.vn");
		mail.setTo(us.getEmail());
		mail.setSubject("Xác nhận tài khoản " + us.getUsername() + " từ store");
		String verificationLink = req.getRequestURL().toString() + "/account-verification?email=" + us.getEmail();
		mail.setBody("Đây là mã xác nhận của bạn " + us.getToken() + ". Truy cập vào đường link sau để nhập mã: <a href=\"" + verificationLink + "\">" + verificationLink + "</a>");
		// Gửi mail
		mailsv.queue(mail);
	}
}

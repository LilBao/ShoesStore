package com.fpoly.Controller.Admin;


import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.MailInfo;
import com.fpoly.Entity.OrderDetails;
import com.fpoly.Entity.Orders;
import com.fpoly.Entity.Products;
import com.fpoly.Service.OrderService;
import com.fpoly.Service.ProductService;
import com.fpoly.Untils.MailService;

@Controller
public class OrderController {
	@Autowired
	OrderService odsv;
	@Autowired
	ProductService prdsv;
	@Autowired
	HttpServletRequest req;

	@Autowired
	MailService mailsv;

	@GetMapping("index/order")
	public String viewOrder(Model model,@RequestParam("status") Integer status,@RequestParam("page") Optional<Integer> page,@RequestParam("sortField") Optional<String> sortField) {
		int pageSize = 10;
		String sortDir =req.getParameter("sortDir") == null ? "desc" : req.getParameter("sortDir");
		Page<Orders> listPage = odsv.listOrders(status,page.orElse(0),pageSize,sortField.orElse("id"),sortDir);
		List<Orders> list = listPage.getContent();
		model.addAttribute("status", status);
		model.addAttribute("listOrder", list);
		model.addAttribute("currentPage", page.orElse(0));
		model.addAttribute("totalItems", listPage.getTotalElements());
		model.addAttribute("totalPages", listPage.getTotalPages());
		model.addAttribute("sortField", sortField.orElse("id"));
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		return "Admin/tblOrder";
	}

	@GetMapping("order/pending")
	public String pending(@RequestParam("id") Integer id) throws MessagingException {
		Orders order = odsv.findById(id);
		order.setStatus(1);
		odsv.update(order);
		send(order);
		return "redirect:/index/order?status=0";
	}

	@GetMapping("order/cancellate")
	public String removal(@RequestParam("id") Integer id) throws MessagingException {
		Orders order = odsv.findById(id);
		for (OrderDetails orderdt : order.getOrderdt()) {
			Products prod = prdsv.findById(orderdt.getProducts().getId());
			prod.setQuantity(prod.getQuantity() + orderdt.getQuantity());
			prdsv.update(prod);
		}
		odsv.delete(id);
		cancell(order);
		return "redirect:/index/order?status=2";
	}
	@GetMapping("index/order/invoice")
	public String invoice(Model model,@RequestParam("id") Integer id) {
		model.addAttribute("ord", odsv.findById(id));
		return "Admin/AdminInvoice";
	}

	public void send(Orders order) {
		MailInfo mail = new MailInfo();
		mail.setFrom("baonvps24728@fpt.edu.vn");
		mail.setTo(order.getEmail());
		mail.setSubject("Xác nhận đơn hàng " + order.getId() + " từ store");
		mail.setBody("Đơn hàng của bạn đã được xác nhận");
		//Gửi mail
		mailsv.queue(mail);
	}
	
	public void cancell(Orders order) throws MessagingException {
		MailInfo mail = new MailInfo();
		mail.setFrom("baonvps24728@fpt.edu.vn");
		mail.setTo(order.getEmail());
		mail.setSubject("Đơn hàng " + order.getId() + " từ store đã được hủy");
		mail.setBody("Đơn hàng của bạn đã bị hủy");
		//Gửi mail
		mailsv.queue(mail);
	}

}

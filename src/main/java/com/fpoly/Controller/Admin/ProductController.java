package com.fpoly.Controller.Admin;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.Entity.ProductDetail;
import com.fpoly.Entity.Products;
import com.fpoly.Service.CategoryService;
import com.fpoly.Service.ProductDetailService;
import com.fpoly.Service.ProductService;
import com.fpoly.Untils.UploadFile;

@Controller
@RequestMapping("index/product")
public class ProductController {
	@Autowired
	ProductService prdsv;

	@Autowired
	CategoryService ctsv;

	@Autowired
	ProductDetailService prddtsv;

	@Autowired
	UploadFile handleFile;

	@Autowired
	HttpServletRequest req;

	// Thêm danh sách các size
	@ModelAttribute("listSize")
	public List<Integer> listSize() {
		List<Integer> sizes = new ArrayList<>();
		for (int i = 16; i <= 48; i++) {
			sizes.add(i);
		}
		return sizes;
	}

	// Thêm danh sách các màu
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

	// Hiện lên table các sản phẩm
	@GetMapping()
	public String view(Model model, @RequestParam("page") Optional<Integer> page,
			@RequestParam("sortField") Optional<String> sortField) {
		int pageSize = 8;
		String sortDir = req.getParameter("sortDir") == null ? "desc" : req.getParameter("sortDir");

		Page<Products> listPage = prdsv.findPaginated(page.orElse(0), pageSize, sortField.orElse("id"), sortDir);
		List<Products> list = listPage.getContent();

		model.addAttribute("list", list);
		model.addAttribute("currentPage", page.orElse(0));
		model.addAttribute("totalItems", listPage.getTotalElements());
		model.addAttribute("totalPages", listPage.getTotalPages());
		model.addAttribute("sortField", sortField.orElse("id"));
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

		return "Admin/tblSanPham";
	}

	// Hiện thông tin cơ bản của sản phẩm
	@GetMapping("edit/{id}")
	public String editPrd(Model model, @PathVariable("id") Integer id) {
		model.addAttribute("listCate", ctsv.findAll());
		model.addAttribute("product", prdsv.findById(id));
		return "Admin/updatePrd";
	}

	// Xóa Thông tin cơ bản của sản phẩm theo id
	@GetMapping("delete/{id}")
	public String deletePrd(@PathVariable("id") Integer id) {
		prdsv.delete(id);
		return "redirect:/index/product";
	}

	// Hiện view để nhập thông tin cơ bản của sản phẩm mới
	@GetMapping("basic")
	public String basicView(Model model, @ModelAttribute("product") Products product) {
		model.addAttribute("listCate", ctsv.findAll());
		return "Admin/editSanPham";
	}

	// Thực hiện lưu sản phẩm mới
	@PostMapping("basic/save")
	public String basicCreatePrd(@ModelAttribute("product") Products product) {
		prdsv.add(product);
		return "redirect:/index/product/basic";
	}

	// Hiện view của thông tin chi tiết của sản phẩm
	@GetMapping("advance")
	public String advanceView(Model model, @ModelAttribute("productDetail") ProductDetail productdt) {
		model.addAttribute("listPrd", prdsv.findAll());
		return "Admin/editSanPhamAdvance";
	}

	// lưu thông tin chi tiết của sản phẩm
	@PostMapping("advance/save")
	public String advanceSave(Model model, @ModelAttribute(value = "productDetail") ProductDetail productdt,
			@RequestPart("images") MultipartFile[] multipleFile) {
		handleFile.handleUploadFile(multipleFile);
		String[] images = handleFile.convert(multipleFile);
		productdt.setImg(images);
		prddtsv.add(productdt);
		return "redirect:/index/product/advance";
	}

	@PostMapping("information/saveBasic")
	public String ifSaveBasic(@ModelAttribute("product") Products product) {
		prdsv.add(product);
		return "redirect:/index/product/edit/" + product.getId();
	}

	// Hiện table danh sách các thông tin chi tiết của 1 sản phẩm
	@GetMapping("editDetail/{prdid}")
	public String editDetail(Model model, @PathVariable("prdid") Integer id,
			@RequestParam("page") Optional<Integer> page, @RequestParam("sortField") Optional<String> sortField) {
		int pageSize = 5;
		String sortDir = req.getParameter("sortDir") == null ? "desc" : req.getParameter("sortDir");
		Page<ProductDetail> listPage = prddtsv.findPaginated(id, page.orElse(0), pageSize, sortField.orElse("id"), sortDir);
		List<ProductDetail> list = listPage.getContent();
		
		model.addAttribute("currentPage", page.orElse(0));
		model.addAttribute("totalItems", listPage.getTotalElements());
		model.addAttribute("totalPages", listPage.getTotalPages());
		model.addAttribute("sortField", sortField.orElse("id"));
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		model.addAttribute("id", id);
		model.addAttribute("list",list);
		return "Admin/inforProduct";
	}

	// Hiện lên view để xem thông tin chi tiết
	@GetMapping("update-detail/{id}")
	public String updateDetail(Model model, @ModelAttribute("productDetail") ProductDetail productdt,
			@PathVariable("id") Integer id) {
		ProductDetail prd = prddtsv.findById(id);
		model.addAttribute("listPrd", prdsv.findAll());
		model.addAttribute("productDetail", prd);
		model.addAttribute("listImages", prd.getImg());
		model.addAttribute("imgStr", Arrays.toString(prd.getImg()));
		model.addAttribute("prdid", prd.getProducts().getId());
		return "Admin/updatePrdDetail";
	}

	// Lưu thông tin chi tiết mới của sản phẩm
	@PostMapping("information/saveDetail")
	public String saveUpdateDetail(@ModelAttribute("productDetail") ProductDetail productdt,
			@RequestParam("imgStr") String images, @RequestPart("image") MultipartFile[] multipleFile) {
		handleFile.handleUploadFile(multipleFile);
		String[] oldImg;
		if (images == null) {
			oldImg = new String[0];
		} else {
			oldImg = images.substring(1, images.length() - 1).split(", ");
		} // Loại bỏ ký tự [ và ]
		String[] newImg = handleFile.convert(multipleFile);
		String[] listImg = new String[oldImg.length + newImg.length];
		System.arraycopy(oldImg, 0, listImg, 0, oldImg.length);
		System.arraycopy(newImg, 0, listImg, oldImg.length, newImg.length);
		productdt.setImg(listImg);
		prddtsv.add(productdt);
		return "redirect:/index/product/update-detail/" + productdt.getId();
	}

	// Xóa thông tin của sản phẩm chi tiết
	@GetMapping("deleteDetail/{id}")
	public String deletePrdDetail(@PathVariable("id") Integer id) {
		ProductDetail prd = prddtsv.findById(id);
		prddtsv.delete(id);
		return "redirect:/index/product/editDetail/" + prd.getProducts().getId();
	}

	// Xóa toàn bộ danh sách hình
	@GetMapping("cleanImg/{id}")
	public String cleanImg(@PathVariable("id") Integer id) {
		ProductDetail prd = prddtsv.findById(id);
		prd.setImg(null);
		prddtsv.update(prd);
		return "redirect:/index/product/update-detail/" + prd.getId();
	}

}

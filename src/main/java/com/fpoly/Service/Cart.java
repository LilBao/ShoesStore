package com.fpoly.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.fpoly.Entity.ProductDetail;
import com.fpoly.Entity.Products;

@SessionScope
@Service
public class Cart {
	@Autowired
	ProductService productService;
	@Autowired
	ProductDetailService prddtsv;

	Map<Integer, Products> cart = new HashMap<Integer, Products>();
	AtomicInteger counter = new AtomicInteger(1);

	public void add(Integer id, String color, String size, Integer quantity) {
		List<ProductDetail> proDetail = prddtsv.findFirstPrd(id, color);
		String[] sizes = { size };
		proDetail.get(0).setSize(sizes);

		Products prod = productService.findById(id);
		prod.setPrdDetail(proDetail);
		prod = prod.orderProducts(quantity);

		boolean allMatch = false;
		if (cart.containsValue(prod)) {
			for (Map.Entry<Integer, Products> entry : cart.entrySet()) {
				if (entry.getValue().getPrdDetail().get(0).getId() == id
						&& entry.getValue().getPrdDetail().get(0).getSize()[0].equals(size)) {
					int oldQuantity = cart.get(entry.getKey()).getQuantity();
					cart.get(entry.getKey()).setQuantity(oldQuantity + 1);
					allMatch = true;
					break;
				}
			}
		} else if (allMatch == false && size != null) {
			cart.put(counter.getAndIncrement(), prod);
		}
	}

	public void update(Integer id, int qty) {
		Products prodCart = cart.get(id);
		Products prod = productService.findById(cart.get(id).getId());
		Products inventory = prod.orderProducts(qty - prodCart.getQuantity());
		if (qty > 0) {
			if (inventory != null) {
				prodCart.setQuantity(qty);
			}
		} else {
			cart.remove(id);
		}
	}

	public void remove(Integer id) {
		Products prod = cart.get(id);
		prod.setQuantity(0 - prod.getQuantity());
		cart.remove(id);
	}

	public void clear() {
		for (Products prod : cart.values()) {
			prod.orderProducts(0 - prod.getQuantity());
		}
		cart.clear();
	}

	public Map<Integer, Products> getProducts() {
		return cart;
	}

	public int getCount() {
		int count = 0;
		for (Products prd : cart.values()) {
			count += prd.getQuantity();
		}
		return count;
	}

	public float getAmount() {
		float amount = 0;
		for (Products prd : cart.values()) {
			amount += prd.getQuantity() * prd.getPrice();

		}
		return amount;
	}
}

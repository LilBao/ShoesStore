package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.OrderDetails;
import com.fpoly.Repository.OrderDetailDAO;
@Service
public class OrderDetailService implements DAO<OrderDetails,Integer>{
	@Autowired
	OrderDetailDAO dao;
	
	@Override
	public List<OrderDetails> findAll() {
		return null;
	}

	@Override
	public void add(OrderDetails entity) {
		dao.save(entity);
	}

	@Override
	public void update(OrderDetails ordt) {
		dao.save(ordt);
	}

	@Override
	public void delete(Integer Key) {

	}

	@Override
	public OrderDetails findById(Integer key) {
		return dao.getReferenceById(key);
	}
	
	public List<OrderDetails> findByOrderId(Integer key){
		return dao.FindByOrderid(key);
	}

	@Override
	public Page<OrderDetails> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

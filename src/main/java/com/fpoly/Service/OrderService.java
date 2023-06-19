package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.Orders;
import com.fpoly.Repository.OrderDAO;

@Service
public class OrderService implements DAO<Orders,Integer>{
	@Autowired
	OrderDAO dao;
	@Override
	public void add(Orders entity) {
		entity.setStatus(0);
		dao.save(entity);
	}

	@Override
	public void update(Orders entity) {
		dao.save(entity);	
	}

	@Override
	public void delete(Integer Key) {
		dao.deleteById(Key);
	}

	@Override
	public Orders findById(Integer key) {
		return dao.getReferenceById(key);
	}

	@Override
	public List<Orders> findAll() {
		return dao.findAll();
	}
	
	public Integer getLastId() {
		return dao.getLastOrderId();
	}
	
	public Page<Orders> listOrders(Integer status,int pageNo, int pageSize, String sortField, String sortDirection){
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
		Pageable pageable = PageRequest.of(pageNo, pageSize, sort);
		return dao.listOrders(status,pageable);
	};
	
	public List<Orders> findByusername(Integer id) {
		return dao.findByusername(id);
	}

	@Override
	public Page<Orders> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

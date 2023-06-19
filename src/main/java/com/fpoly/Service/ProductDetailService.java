package com.fpoly.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.ProductDetail;
import com.fpoly.Repository.ProductDetailDAO;

@Service
public class ProductDetailService implements DAO<ProductDetail,Integer>{
	
	@Autowired
	ProductDetailDAO dao;
	
	@Override
	@Transactional
	public void add(ProductDetail entity) {
		dao.save(entity);
	}

	@Override
	public void update(ProductDetail entity) {
		dao.save(entity);
	}

	@Override
	public void delete(Integer Key) {
		dao.deleteById(Key);
	}

	@Override
	public ProductDetail findById(Integer key) {
		return dao.findByID(key);
	}

	@Override
	public List<ProductDetail> findAll() {
		return dao.findAll();
	}
	
	public List<ProductDetail> findIdPrd(Integer id) {
		return dao.findByPrdID(id);
	}

	public List<ProductDetail> findFirstPrd(Integer id,String color) {
		return dao.getImgSizeByColor(id,color);
	}

	@Override
	public Page<ProductDetail> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		return null;
	}
	
	public Page<ProductDetail> findPaginated(int id,int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
		Pageable pagenable = PageRequest.of(pageNo, pageSize, sort);
		return dao.findByPrdIDPage(id,pagenable);
	}
	
	
	
}

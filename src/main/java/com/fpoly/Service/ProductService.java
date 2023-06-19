package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.fpoly.Entity.Products;
import com.fpoly.Repository.ProductDAO;
@Service
public class ProductService implements DAO<Products,Integer>{
	@Autowired
	ProductDAO dao;
	
	@Override
	public Products findById(Integer key) {
		return dao.findByID(key);
	}


	@Override
	public List<Products> findAll() {
		return dao.findAll();
	}

	@Override
	public void add(Products entity) {
		dao.save(entity);
	}

	@Override
	public void update(Products entity) {
		dao.save(entity);
	}

	@Override
	public void delete(Integer Key) {
		dao.deleteById(Key);
	}
	
	public List<Object[]> getInventory(){
		return dao.getInventory();
	}
	
	public List<Products> findListRelated(String id,Integer prdid) {
		return dao.findListRelated(id,prdid);
	}
	
	public List<Products> findListNewProduct() {
		return dao.findListNewProduct();
	}
	
	public List<Object[]> getFavorite(){
		return dao.getFavorite();
	}
	
	public List<Object[]> getBestSelling(){
		return dao.getBestSelling();
	}


	@Override
	public Page<Products> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
		Pageable pagenable = PageRequest.of(pageNo, pageSize,sort);
		return dao.findAll(pagenable);
	}
	
	public Page<Products> ListByCategory(String id,String color,Float min,Float max,String brand,int pageNo, int pageSize, String sortField, String sortDirection){
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.DESC.name()) ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
		Pageable pagenable = PageRequest.of(pageNo, pageSize,sort);
		return dao.ListByCategory(id,color,min,max,brand,pagenable);
	}
}

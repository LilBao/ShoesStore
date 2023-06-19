package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.Category;
import com.fpoly.Repository.CategoryDAO;

@Service
public class CategoryService implements DAO<Category,String>{
	@Autowired
	CategoryDAO dao;
	
	@Override
	public void add(Category entity) {
		dao.save(entity);
	}

	@Override
	public void update(Category entity) {
		dao.save(entity);
	}

	@Override
	public void delete(String Key) {
		dao.deleteById(Key);
	}

	@Override
	public Category findById(String key) {
		return dao.getReferenceById(key);
	}

	@Override
	public List<Category> findAll() {
		return dao.findAll();
	}

	@Override
	public Page<Category> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() : Sort.by(sortField).descending();
		Pageable pagneable =PageRequest.of(pageNo, pageSize,sort);
		return dao.findAll(pagneable);
	}

}

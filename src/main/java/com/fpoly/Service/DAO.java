package com.fpoly.Service;

import java.util.List;

import org.springframework.data.domain.Page;


public interface DAO<E,K>{
	public void add(E entity);

	public void update(E value);

	public void delete(K Key);

	public E findById(K key);
	
	public List<E> findAll();
	
	public Page<E> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}

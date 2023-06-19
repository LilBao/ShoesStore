package com.fpoly.Service;

import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.Users;
import com.fpoly.Repository.UserDAO;
import com.fpoly.Untils.Hash;
@Service
public class UserService implements DAO<Users, Integer>{
	@Autowired
	UserDAO dao;
	
	@Autowired
	Hash hashpass;
	Random random = new Random();
	@Override
	@Transactional
	public void add(Users us) {
		us.setPassword(hashpass.HashPass(us.getPassword()));
		us.setActivated(1);
		us.setAdmin(2);
		int randomNumber = random.nextInt(100000);
        String formattedNumber = String.format("%05d", randomNumber);
        us.setToken(formattedNumber);
		dao.save(us);
	        
	}

	@Override
	@Transactional
	public void update(Users value) {
		dao.save(value);
	}

	@Override
	@Transactional
	public void delete(Integer id) {
		dao.deleteById(id);
	}

	@Override
	@Transactional
	public List<Users> findAll() {
		return dao.findAll();
	}

	@Override
	@Transactional
	public Users findById(Integer key) {
		Users us= dao.getReferenceById(key);
		return us;
	}

	
	public Users findByUserName(String us) {
		return dao.findUsername(us);
	}

	@Override
	public Page<Users> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
		Pageable pagebale = PageRequest.of(pageNo, pageSize, sort);
		return dao.findAll(pagebale);
	}
	
	public Users findByEmail(String email) {
		return dao.findByEmails(email);
	}
}

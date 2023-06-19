package com.fpoly.Entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Table(name="Categories")
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Category {	
	@Id
	private String id;
	private String name;
	
	@OneToMany(mappedBy = "category")
	List<Products> products;
}

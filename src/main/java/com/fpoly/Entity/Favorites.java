package com.fpoly.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Table(name = "favorite", uniqueConstraints = { @UniqueConstraint(columnNames = { "userid", "productid" }) })
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Favorites {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "productid")
	Products products;
	@ManyToOne
	@JoinColumn(name = "userid")
	Users users;
	private String reviews;

}

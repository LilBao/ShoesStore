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

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="ordersdetails",uniqueConstraints= {@UniqueConstraint(columnNames = {"orderid","productid"})})
public class OrderDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne 
	@JoinColumn(name="orderid")
	Orders orders;
	
	@ManyToOne
	@JoinColumn(name="productid",nullable = true)
	Products products;
	
	private Float price;
	private int quantity;
	private String size;
	private String color ;
	private String img;
}

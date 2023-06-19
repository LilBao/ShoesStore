package com.fpoly.Entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "orders")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "usernameid",nullable = true)
	Users users;
	@Temporal(TemporalType.DATE)
	private Date createdate = new Date();
	private float totalprice;
	private int status;
	private String fullname;
	private String email;
	private String phone;
	private String address;
	@OneToMany(mappedBy = "orders",cascade = CascadeType.ALL)
	List<OrderDetails> orderdt;
}

	package com.fpoly.Entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.web.context.annotation.SessionScope;

import ch.qos.logback.core.subst.Token.Type;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="users")
@SessionScope
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private int activated;
	private int admin;
	private String phone;
	private String address;
	private String token;
	private Date createdate = new Date();
	
	@OneToMany(mappedBy="users")
	List<Favorites> favorites;
	
	@OneToMany(mappedBy="users",cascade = CascadeType.ALL)
	List<Orders> orders;
}

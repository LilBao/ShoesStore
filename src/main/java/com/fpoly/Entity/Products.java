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

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "products")
@Entity
public class Products implements Cloneable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private Float price;
	@Temporal(TemporalType.DATE)
	private Date createdate = new Date();
	private String brand;
	private Integer quantity;
	private String description;
	@ManyToOne
	@JoinColumn(name="categoryid")
	Category category;
	
	@OneToMany(mappedBy ="products")
	List<Favorites> favorites;
	
	@OneToMany(mappedBy ="products")
	List<ProductDetail> prdDetail;
	
	@OneToMany(mappedBy="products",cascade = CascadeType.ALL)
	List<OrderDetails> orderdetail;
	
	
	public Products orderProducts(int quantity) {
		Products prod =null;
		if(quantity<=this.quantity) {
			try {
				prod =(Products) this.clone();
				prod.setQuantity(quantity);
				this.quantity-=quantity;
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
		}
		return prod;
	}
	
	
}

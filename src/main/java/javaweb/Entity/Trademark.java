package javaweb.Entity;
// Generated Apr 27, 2021, 11:12:42 AM by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Trademark generated by hbm2java
 */
@Entity
@Table(name = "trademark", catalog = "mydb")
public class Trademark implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private Set<Product> products = new HashSet<Product>(0);

	public Trademark() {
	}

	public Trademark(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Trademark(int id, String name, Set<Product> products) {
		this.id = id;
		this.name = name;
		this.products = products;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "NAME", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "trademark")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}

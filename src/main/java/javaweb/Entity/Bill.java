package javaweb.Entity;
// Generated Apr 27, 2021, 11:12:42 AM by Hibernate Tools 5.1.10.Final

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Bill generated by hbm2java
 */
@Entity
@Table(name = "bill", catalog = "mydb")
public class Bill implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private Account account;
	private Commune commune;
	private Promotion promotion;
	private BigDecimal totalValue;
	private int status;
	private Date createDate;
	private Set<ProductHasColorHasBill> productHasColorHasBills = new HashSet<ProductHasColorHasBill>(0);

	public Bill() {
	}

	public Bill(int id, Account account, Commune commune, BigDecimal totalValue, byte status) {
		this.id = id;
		this.account = account;
		this.commune = commune;
		this.totalValue = totalValue;
		this.status = status;
	}

	public Bill(int id, Account account, Commune commune, Promotion promotion, BigDecimal totalValue, byte status,
			Date createDate, Set<ProductHasColorHasBill> productHasColorHasBills) {
		this.id = id;
		this.account = account;
		this.commune = commune;
		this.promotion = promotion;
		this.totalValue = totalValue;
		this.status = status;
		this.createDate = createDate;
		this.productHasColorHasBills = productHasColorHasBills;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACCOUNT_USERNAME", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COMMUNE_ID", nullable = false)
	public Commune getCommune() {
		return this.commune;
	}

	public void setCommune(Commune commune) {
		this.commune = commune;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROMOTION_ID")
	public Promotion getPromotion() {
		return this.promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	@Column(name = "TOTAL_VALUE", nullable = false, precision = 20)
	public BigDecimal getTotalValue() {
		return this.totalValue;
	}

	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue;
	}

	@Column(name = "STATUS", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bill")
	public Set<ProductHasColorHasBill> getProductHasColorHasBills() {
		return this.productHasColorHasBills;
	}

	public void setProductHasColorHasBills(Set<ProductHasColorHasBill> productHasColorHasBills) {
		this.productHasColorHasBills = productHasColorHasBills;
	}
	
	public void addProductHasColorHasBills(ProductHasColorHasBill productHasColorHasBills) {
		this.productHasColorHasBills.add(productHasColorHasBills);
	}

}

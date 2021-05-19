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
 * Account generated by hbm2java
 */
@Entity
@Table(name = "account", catalog = "mydb")
public class Account implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String email;
	private String phone;
	private int type;
	private int status;
	private String name;
	private int gender;
	private Set<Rating> ratings = new HashSet<Rating>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<Bill> bills = new HashSet<Bill>(0);

	public Account() {
	}

	public Account(String username, String password, String phone, int type, byte status) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.type = type;
		this.status = status;
	}

	public Account(String username, String password, String email, String phone, int type, byte status, String name,
			Byte gender, Set<Rating> ratings, Set<Comment> comments, Set<Bill> bills) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.type = type;
		this.status = status;
		this.name = name;
		this.gender = gender;
		this.ratings = ratings;
		this.comments = comments;
		this.bills = bills;
	}

	@Id

	@Column(name = "USERNAME", unique = true, nullable = false, length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "PASSWORD", nullable = false, length = 20)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "EMAIL", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "PHONE", nullable = false, length = 10)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "TYPE", nullable = false)
	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Column(name = "STATUS", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "NAME", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "GENDER")
	public int getGender() {
		return this.gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Bill> getBills() {
		return this.bills;
	}

	public void setBills(Set<Bill> bills) {
		this.bills = bills;
	}

}

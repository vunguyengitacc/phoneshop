package javaweb.Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "general_information", catalog = "mydb")
public class GeneralInformation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public GeneralInformation() {
		this.address = this.email = this.phone = "updating";
		this.createdDate = new Date();
	}
	public GeneralInformation(String email, String phone, String address) {
		super();
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.createdDate = new Date();
	}
	public GeneralInformation(String email, String phone, String address,Date createdDate) {
		super();
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.createdDate = createdDate;
	}
	private String email;
	private String phone;
	private String address;
	private Date createdDate;
	
	@Column(name = "EMAIL", length = 100, nullable = false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name = "PHONE", length = 10, nullable = false)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name = "ADDRESS", length = 200, nullable = false)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE", length = 19)
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
}

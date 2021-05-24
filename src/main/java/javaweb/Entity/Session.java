package javaweb.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "session", catalog = "mydb")
public class Session implements java.io.Serializable {

	public Session(String id, int isSave, int isValidate) {
		super();
		this.id = id;
		this.createDate = new Date();
		this.isSave = isSave;
		this.isValidate = isValidate;
	}

	public Session() {
		super();
		this.createDate = new Date();
	}

	public Session(String id, int isSave) {
		super();
		this.id = id;
		this.createDate = new Date();
		this.isSave = isSave;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private Date createDate;
	private int isSave;
	private int isValidate;

	@Id
	@Column(name = "ID", nullable = false)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE", length = 19)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "IS_SAVE", nullable = true)
	public int getIsSave() {
		return isSave;
	}

	public void setIsSave(int isSave) {
		this.isSave = isSave;
	}

	@Column(name = "IS_VALIDATE", nullable = true)
	public int getIsValidate() {
		return isValidate;
	}

	public void setIsValidate(int isValidate) {
		this.isValidate = isValidate;
	}

}

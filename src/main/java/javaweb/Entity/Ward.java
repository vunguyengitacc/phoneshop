package javaweb.Entity;
// Generated Apr 27, 2021, 11:12:42 AM by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Ward generated by hbm2java
 */
@Entity
@Table(name = "ward", catalog = "mydb")
public class Ward implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private District district;
	private String name;
	private Set<Commune> communes = new HashSet<Commune>(0);

	public Ward() {
	}

	public Ward(int id, District district, String name) {
		this.id = id;
		this.district = district;
		this.name = name;
	}

	public Ward(int id, District district, String name, Set<Commune> communes) {
		this.id = id;
		this.district = district;
		this.name = name;
		this.communes = communes;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DISTRICT_ID", nullable = false)
	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	@Column(name = "NAME", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ward")
	public Set<Commune> getCommunes() {
		return this.communes;
	}

	public void setCommunes(Set<Commune> communes) {
		this.communes = communes;
	}

}

package javaweb.services.inter;

public interface GeneralInformation {
	public javaweb.Entity.GeneralInformation getInfor();
	
	public boolean posttInfor(String email, String phone, String address);
}

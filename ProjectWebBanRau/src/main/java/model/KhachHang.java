package model;

public class KhachHang {
	private String username;
	private String password;
	private String tenkh;
	private String sdt;
	private String email;
	private String address;
	private String rolename;
	
	public KhachHang(String username, String password, String tenkh, String sdt, String email,
			String address) {
		this.username = username;
		this.password = password;
		this.tenkh = tenkh;
		this.sdt = sdt;
		this.email = email;
		this.address = address;
	}
	public String getRolename() {
		return rolename;
	}
	public String getUsername() {
		return username;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getPassword() {
		return password;
	}

	public String getTenkh() {
		return tenkh;
	}


	public String getSdt() {
		return sdt;
	}


	public String getEmail() {
		return email;
	}

	
	public String getAddress() {
		return address;
	}

}

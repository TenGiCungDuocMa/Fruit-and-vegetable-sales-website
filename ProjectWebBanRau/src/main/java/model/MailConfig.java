package model;

public class MailConfig {
	public static final String HOST_NAME = "smtp.gmail.com"; // dia chi server mail smtp

	// Cổng được server gửi mail sử dụng,
	// trong đó SMTP Port mặc định của Google là 465 (cho SSL) và 587 (cho TSL).
	public static final int SSL_PORT = 465; // Port for SSL

	public static final int TSL_PORT = 587; // Port for TLS/STARTTLS

	// mail gui
	public static final String APP_EMAIL = "21130536@st.hcmuaf.edu.vn";

	// mat khau ung dung cua mail gui
	public static final String APP_PASSWORD = "udif bera nhna lddz";
	
}

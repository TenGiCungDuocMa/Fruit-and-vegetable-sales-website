package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectBySQLServer {
	private final static String  driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private Connection con;
	private static final String url="jdbc:sqlserver://localhost:1433;databaseName=EX2";
	public ConnectBySQLServer() throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		con = DriverManager.getConnection(url,"raucuconnect","NGHECACU");
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		new ConnectBySQLServer();
	}
}

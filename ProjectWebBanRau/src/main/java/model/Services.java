package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class Services {
	private Connection connect;
	private PreparedStatement repa;
	private ResultSet res;

	public Services() {
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			connect = DriverManager.getConnection("jdbc:ucanaccess://D:\\GitHub\\web_project\\ProjectWebBanRau\\src\\main\\java\\database\\Data_WebRauCu.mdb");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	/**
	 * lấy ra danh sách các loại sản phẩm trong database
	 * 
	 * @param typeProduct là loại sản phẩm cần lấy ra
	 * @return danh sách sản phẩm có loại là typeProduct
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Product> loadData(String typeProduct) {
		List<Product> result = new ArrayList<Product>();
		try {
			String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where ct.LoaiSP=?";
			repa = connect.prepareStatement(statementSQL);
			repa.setString(1, typeProduct);
			res = repa.executeQuery();
			while (res.next()) {
				String stringPrice = res.getString("Gia");
				long price = Long.parseLong(stringPrice.substring(0, stringPrice.lastIndexOf(".")));
				result.add(new Product(res.getString("MaSP"), res.getString("TenSP"), res.getString("TenFileSP"),
						res.getString("LoaiSP"), price , res.getString("DonViTinh"),res.getString("Mota"),res.getString("ThuongHieu"),res.getInt("Soluong")));
			}
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return result;
	}

	/**
	 * Kiểm tra username có tồn tại trong csdl không
	 * 
	 * @param username
	 * @return true nếu user đã tồn tại / false nếu user chưa tồn tại
	 */
	public boolean checkUser(String username) {
		boolean result = false;
		try {
			String statement = "select USERNAME" + " from KHACHHANG" + " where USERNAME=?";
			repa = connect.prepareStatement(statement);
			repa.setString(1, username);
			res = repa.executeQuery();
			result = res.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * thêm khách hàng vào csdl
	 * 
	 * @param username
	 * @param password
	 * @param ten
	 * @param sdt
	 * @param email
	 * @return true nếu thêm thành công / false nếu thêm thất bại
	 */
	public boolean addUser(String username, String password, String ten, String sdt, String email) {
		int n = -1;
		if (!this.checkUser(username)) {
			try {
				String statement = "insert into KHACHHANG(USERNAME,PASSWORD,TENKH,SDT,EMAIL) " + "values(?,?,?,?,?)";
				repa = connect.prepareStatement(statement);
				repa.setString(1, username);
				repa.setString(2, password);
				repa.setString(3, ten);
				repa.setString(4, sdt);
				repa.setString(5, email);
				n = repa.executeUpdate(); // n là số dòng bị ảnh hưởng bởi câu lệnh trong SQL
				repa.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return (n > 0) ? true : false;
	}

	public Product findProduct(String idProduct) {
		Product result = null;
		try {
			String statement = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where ct.MaSP=?";
			repa = connect.prepareStatement(statement);
			repa.setString(1, idProduct);
			res = repa.executeQuery();
			if (res.next()) {
				String stringPrice = res.getString("Gia");
				long price = Long.parseLong(stringPrice.substring(0, stringPrice.lastIndexOf(".")));
				result = new Product(res.getString("MaSP"), res.getString("TenSP"), res.getString("TenFileSP"),
						res.getString("LoaiSP"), price , res.getString("DonViTinh"),res.getString("Mota"),res.getString("ThuongHieu"),res.getInt("Soluong"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<String> listBrandName(String typeProduct){
		List<String> result = new ArrayList<String>();
		try {
			String statementSQL = "select distinct sp.ThuongHieu " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where ct.LoaiSP=?";
			repa = connect.prepareStatement(statementSQL);
			repa.setString(1, typeProduct);
			res = repa.executeQuery();
			while (res.next()) {
				result.add(res.getString("ThuongHieu"));
			}
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return result;
	}
	public static void main(String[] args) {
		
		System.out.println(new Services().listBrandName("CAC LOAI HOA"));
	}
}

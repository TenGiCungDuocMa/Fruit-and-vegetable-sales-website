package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Services {
	private Connection connect;
	private PreparedStatement repa;
	private ResultSet res;

	public Services() {
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			connect = DriverManager.getConnection(
					"jdbc:ucanaccess://D:\\GitHub\\web_project\\ProjectWebBanRau\\src\\main\\java\\database\\Data_WebRauCu.mdb");
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
	 * @param typeProduct   là loại sản phẩm cần lấy ra
	 * @param listBrandname là danh sách thương hiệu của sản phẩm
	 * @return danh sách sản phẩm có loại là typeProduct
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Product> loadData(String typeProduct, String[] listBrandname) {
		List<Product> result = null;
		try {
			if (listBrandname != null) {
				String brandName = "";
				for (int i = 0; i < listBrandname.length; i++) {
					brandName += "?,";
				}
				brandName = brandName.substring(0, brandName.lastIndexOf(","));
				String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
						+ " where ct.LoaiSP=? and sp.ThuongHieu IN( " + brandName + ")";
				repa = connect.prepareStatement(statementSQL);
				repa.setString(1, typeProduct);
				for (int i = 0, j = 2; i < listBrandname.length; i++, j++) {
					repa.setString(j, listBrandname[i]);
				}

			} else {
				String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
						+ " where ct.LoaiSP=?";
				repa = connect.prepareStatement(statementSQL);
				repa.setString(1, typeProduct);
			}
			res = repa.executeQuery();
			result = addProduct(res);
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * sắp xếp danh sách sản phẩm theo tên
	 * 
	 * @param listToSort   danh sách sản phẩm cần sắp xếp
	 * @param priceOrName  true thì sắp xếp theo tên / false thì sắp xếp theo giá
	 * @param in_De_crease true là sắp xếp tăng dần/ false thì sắp xếp giảm dần
	 * @return danh sách sản phẩm đã sắp xếp
	 */
	public List<Product> sortByNameOrPrice(List<Product> listToSort, boolean priceOrName, boolean in_De_crease) {
		if (priceOrName) { // true thì sắp xếp theo tên
			if (in_De_crease) { // true là sắp xếp tăng dần
				Collections.sort(listToSort, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o1.getNameProduct().compareTo(o2.getNameProduct());
					}

				});
			} else { // false thì sắp xếp giảm dần
				Collections.sort(listToSort, new Comparator<Product>() {

					@Override
					public int compare(Product o1, Product o2) {
						return o2.getNameProduct().compareTo(o1.getNameProduct());
					}

				});
			}
		} else { // false thì sắp xếp theo giá
			if (in_De_crease) { // true là sắp xếp tăng dần
				Collections.sort(listToSort, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return (o1.getPrice() > o2.getPrice()) ? 1 : -1;
					}

				});
			} else

			{ // false thì sắp xếp giảm dần
				Collections.sort(listToSort, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return (o2.getPrice() > o1.getPrice()) ? 1 : -1;
					}

				});
			}
		}
		return listToSort;
	}

	/**
	 * thêm sản phẩm từ ResultSet đã query vào 1 list product
	 * 
	 * @param resulset
	 * @return
	 */
	private List<Product> addProduct(ResultSet resulset) {
		List<Product> result = new ArrayList<Product>();
		try {
			while (resulset.next()) {
				String stringPrice = resulset.getString("Gia");
				long price = Long.parseLong(stringPrice.substring(0, stringPrice.lastIndexOf(".")));
				result.add(new Product(resulset.getString("MaSP"), resulset.getString("TenSP"),
						resulset.getString("TenFileSP"), resulset.getString("LoaiSP"), price,
						resulset.getString("DonViTinh"), resulset.getString("Mota"), resulset.getString("ThuongHieu"),
						resulset.getInt("Soluong")));
			}
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
	 * kiểm tra password của user
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public KhachHang checkPassword(String username, String password) {
		KhachHang result = null;
		try {
			String statement = "select *" + " from KHACHHANG where USERNAME=? and PASSWORD=?";
			repa = connect.prepareStatement(statement);
			repa.setString(1, username);
			repa.setString(2, password);
			res = repa.executeQuery();
			if (res.next()) {
				result = new KhachHang(res.getString("USERNAME"), res.getString("PASSWORD"), res.getString("TENKH"),
						res.getString("SDT"), res.getString("EMAIL"), res.getString("ADDRESS"));
				result.setRolename(res.getString("ROLE_NAME"));
			}
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
	 * @param address
	 * @return true nếu thêm thành công / false nếu thêm thất bại
	 */
	public boolean addUser(String username, String password, String ten, String sdt, String email, String address) {
		int n = -1, m = -1;
		if (!this.checkUser(username)) {
			try {
				String statement1 = "insert into KHACHHANG(USERNAME,PASSWORD,TENKH,SDT,EMAIL,ADDRESS) "
						+ "values(?,?,?,?,?,?)";
				String statement2 = "insert into KHACHHANG_ROLES(USERNAME,ROLE_NAME) " + "values(?,?)";
				repa = connect.prepareStatement(statement1);
				repa.setString(1, username);
				repa.setString(2, password);
				repa.setString(3, ten);
				repa.setString(4, sdt);
				repa.setString(5, email);
				repa.setString(6, address);
				n = repa.executeUpdate(); // n là số dòng bị ảnh hưởng bởi câu lệnh trong SQL
				repa.close();
				repa = connect.prepareStatement(statement2);
				repa.setString(1, username);
				repa.setString(2, "client");
				m = repa.executeUpdate(); // m là số dòng bị ảnh hưởng bởi câu lệnh trong SQL
				repa.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return (n > 0) && (m > 0);
	}

	/**
	 * Tìm kiếm sản phẩm có id là tham số đầu vào
	 * 
	 * @param idProduct mã sản phẩm cần tìm
	 * @return sản phẩm có mã sản phẩm là idProduct
	 */
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
						res.getString("LoaiSP"), price, res.getString("DonViTinh"), res.getString("Mota"),
						res.getString("ThuongHieu"), res.getInt("Soluong"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * lấy ra danh sách các thương hiệu của loại sản phẩm
	 * 
	 * @param typeProduct loại sản phẩm
	 * @return danh sách sản phẩm của loại sản phẩm
	 */
	public List<String> listBrandName(String typeProduct) {
		List<String> result = new ArrayList<String>();
		try {
			String statementSQL = "select distinct sp.ThuongHieu "
					+ " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP" + " where ct.LoaiSP=?";
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

	/**
	 * Lọc ra danh sách sản phẩm theo loại sản phẩm, giá
	 * 
	 * @param typeProduct loại sản phẩm cần lọc
	 * @param fromPrice   giá lọc nhỏ
	 * @param toPrice     giá lọc lớn
	 * @return danh sách sản phẩm đã lọc
	 */
	public List<Product> filterByPrice(String typeProduct, int fromPrice, int toPrice) {
		List<Product> result = null;
		try {
			String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where (ct.Gia between ? and ?) and (ct.LoaiSP=?)";
			repa = connect.prepareStatement(statementSQL);
			repa.setInt(1, fromPrice);
			repa.setInt(2, toPrice);
			repa.setString(3, typeProduct);
			res = repa.executeQuery();
			result = addProduct(res);
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Lọc ra danh sách sản phẩm theo loại sản phẩm, thương hiệu, mức giá
	 * 
	 * @param typeProduct   loại sản phẩm cần lọc
	 * @param listBrandName danh sách các thương hiệu cần lọc
	 * @param fromPrice     giá lọc nhỏ nhất
	 * @param toPrice       giá lọc lớn nhất
	 * @return danh sách sản phẩm đã lọc ra
	 */
	public List<Product> filterByPriceAndBrandName(String typeProduct, String[] listBrandName, int fromPrice,
			int toPrice) {
		List<Product> result = null;
		try {
			String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where (ct.Gia between ? and ?) and (ct.LoaiSP=?) and (sp.ThuongHieu IN (?))";
			repa = connect.prepareStatement(statementSQL);
			repa.setInt(1, fromPrice);
			repa.setInt(2, toPrice);
			repa.setString(3, typeProduct);
			String brandName = "";
			for (String s : listBrandName) {
				brandName += s + ",";
			}
			brandName = brandName.substring(0, brandName.lastIndexOf(","));
			repa.setString(4, brandName);
			res = repa.executeQuery();
			result = addProduct(res);
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * tìm kiếm tất cả sản phẩm theo tên
	 * 
	 * @param nameProduct tên sản phẩm cần tìm
	 * @return danh sách các sản phẩm có tên nameProduct
	 */
	public List<Product> searchProduct(String nameProduct) {
		List<Product> result = null;
		try {
			String stament = "select * from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where sp.TenSP like ?";
			repa = connect.prepareStatement(stament);
			repa.setString(1, "%" + nameProduct + "%");
			res = repa.executeQuery();
			result = addProduct(res);
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * lấy ra tên role của user
	 * 
	 * @param username
	 * @return
	 */
	public String getRoleUser(String username) {
		String result = "";
		try {
			String comment = "select * from KHACHHANG_ROLES where USERNAME=?";
			repa = connect.prepareStatement(comment);
			repa.setString(1, username);
			res = repa.executeQuery();
			if (res.next()) {
				result = res.getString("ROLE_NAME");
			}
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * lấy tất cả user trong database
	 * 
	 * @return
	 */
	public List<KhachHang> getAllUser() {
		List<KhachHang> resultList = new ArrayList<KhachHang>();
		try {
			String statement = "select * from KHACHHANG kh inner join KHACHHANG_ROLES khr on kh.USERNAME=khr.USERNAME";
			repa = connect.prepareStatement(statement);
			res = repa.executeQuery();
			while (res.next()) {
				KhachHang kh = new KhachHang(res.getString("USERNAME"), res.getString("PASSWORD"),
						res.getString("TENKH"), res.getString("SDT"), res.getString("EMAIL"), res.getString("ADDRESS"));
				kh.setRolename(res.getString("ROLE_NAME"));
				resultList.add(kh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return resultList;
	}
	/**
	 * xóa người dùng có username là giá trị param
	 * @param username
	 * @return
	 */
	public boolean removeUser(String username) {
		int n = -1, m = -1;
		try {
			String statement1 = "DELETE FROM KHACHHANG WHERE USERNAME=?";
			repa = connect.prepareStatement(statement1);
			repa.setString(1, username);
			n = repa.executeUpdate();
			repa.close();
			String statement2 = "DELETE FROM KHACHHANG_ROLES WHERE USERNAME=?";
			repa = connect.prepareStatement(statement2);
			repa.setString(1, username);
			m = repa.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n > 0 && m > 0;
	}
}

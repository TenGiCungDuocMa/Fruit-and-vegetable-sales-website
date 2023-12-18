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
	 * @param typeProduct là loại sản phẩm cần lấy ra
	 * @param brandname   là thương hiệu của sản phẩm
	 * @return danh sách sản phẩm có loại là typeProduct
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Product> loadData(String typeProduct, String brandname) {
		List<Product> result = null;
		try {
			if (brandname != "") {
				String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
						+ " where ct.LoaiSP=? and sp.ThuongHieu=?";
				repa = connect.prepareStatement(statementSQL);
				repa.setString(1, typeProduct);
				repa.setString(2, brandname);
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
			} else { // false thì sắp xếp giảm dần
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
	
	/**
	 * Tìm kiếm sản phẩm có id là tham số đầu vào
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
	 * @param typeProduct loại sản phẩm cần lọc
	 * @param fromPrice giá lọc nhỏ
	 * @param toPrice giá lọc lớn
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
	 * @param typeProduct loại sản phẩm cần lọc
	 * @param BrandName thương hiệu cần lọc
	 * @param fromPrice giá lọc nhỏ nhất
	 * @param toPrice giá lọc lớn nhất
	 * @return danh sách sản phẩm đã lọc ra
	 */
	public List<Product> filterByPriceAndBrandName(String typeProduct,String BrandName, int fromPrice, int toPrice) {
		List<Product> result = null;
		try {
			String statementSQL = "select * " + " from CTSANPHAM ct inner join SANPHAM sp on ct.MaSP= sp.MaSP"
					+ " where (ct.Gia between ? and ?) and (ct.LoaiSP=?) and (sp.ThuongHieu=?)";
			repa = connect.prepareStatement(statementSQL);
			repa.setInt(1, fromPrice);
			repa.setInt(2, toPrice);
			repa.setString(3, typeProduct);
			repa.setString(4, BrandName);
			res = repa.executeQuery();
			result = addProduct(res);
			res.close();
			repa.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}

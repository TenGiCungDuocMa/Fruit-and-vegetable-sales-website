package model;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Cart {
	private Map<Product, Integer> productInCart; // key là sản phẩm, value là số lượng sản phẩm
	private String username;

	public Cart() {
		this.productInCart = new LinkedHashMap<Product, Integer>();
		this.username = "";
	}

	public void setProductInCart(Map<Product, Integer> productInCart) {
		this.productInCart = productInCart;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void putElementInMap(Product p, int num) {
		this.productInCart.put(p, num);
	}

	// them san pham vao map
	public Iterator<Entry<Product, Integer>> getProductInCart() {
		return productInCart.entrySet().iterator();
	}

	/**
	 * Tinh tong tien trong gio hang
	 * 
	 * @return
	 */
	public long totalMoney() {
		long res = 0;
		for (Map.Entry<Product, Integer> entry : this.productInCart.entrySet()) {
			res += entry.getKey().getPrice() * entry.getValue();
		}
		return res;
	}

}

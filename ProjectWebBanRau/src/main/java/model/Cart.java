package model;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Cart {
	private Map<String, Integer> productInCart; //key là id của sản phẩm, value là số lượng sản phẩm 
	private String noteToSellers;

	public Cart() {
		this.productInCart = new LinkedHashMap<String, Integer>();
		this.noteToSellers = "";
	}

	public String getNoteToSellers() {
		return noteToSellers;
	}

	public void setNoteToSellers(String noteToSellers) {
		this.noteToSellers = noteToSellers;
	}

	public Iterator<Entry<String, Integer>> getProductInCart() {
		return productInCart.entrySet().iterator();
	}

	/**
	 * Thêm sản phẩm p vào danh sách sản phẩm với số lượng quantity
	 * 
	 * @param p
	 * @param quantity
	 */
	public void addProduct(String p, Integer quantity) {
		if (productInCart.containsKey(p)) {
			Integer oldValue = this.productInCart.get(p);
			this.productInCart.replace(p, oldValue + quantity);
		} else {
			this.productInCart.put(p, quantity);
		}
	}

	/**
	 * Xóa sản phẩm p khỏi danh sách
	 * 
	 * @param p
	 * @return 
	 */
	public void removeProduct(String p) {
		this.productInCart.remove(p);
	}

	public void setProductInCart(Map<String, Integer> productInCart) {
		this.productInCart = productInCart;
	}

	
}

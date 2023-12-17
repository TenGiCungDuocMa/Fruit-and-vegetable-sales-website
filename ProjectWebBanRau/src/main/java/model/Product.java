package model;

public class Product {
	private String maSP;
	private String nameProduct;
	private String nameFile;
	private String typeProduct;
	private long price;
	private String unit;
	private String description;
	private String brandName;
	private int quantity;

	public Product(String maSP, String nameProduct, String nameFile, String typeProduct, long price, String unit,
			String description, String brandName, int quantity) {

		this.maSP = maSP;
		this.nameProduct = nameProduct;
		this.nameFile = nameFile;
		this.typeProduct = typeProduct;
		this.price = price;
		this.unit = unit;
		this.description = description;
		this.brandName = brandName;
		this.quantity = quantity;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public String getNameFile() {
		return nameFile;
	}

	public void setNameFile(String nameFile) {
		this.nameFile = nameFile;
	}

	public String getTypeProduct() {
		return typeProduct;
	}

	public void setTypeProduct(String typeProduct) {
		this.typeProduct = typeProduct;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

}

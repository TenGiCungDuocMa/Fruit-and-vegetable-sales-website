package model;

import java.util.List;

public class testmodel {
	public static void main(String[] args) {
		Services sv = new Services();
		List<Product> a = sv.loadData("RAU CU QUA", "");
		List<Product> b = sv.filterByPriceAndBrandName("CAC LOAI HOA","Nông Lâm Vegetable", 0, 200000);
		List<Product> c = sv.sortByNameOrPrice(b, true, true);
		c.forEach(n->System.out.println(n.getNameProduct()));
	}
}

package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.Services;

import java.io.IOException;
import java.sql.Array;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class ClassifyProduct
 */
public class ClassifyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ClassifyProduct() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String[]> listPara = request.getParameterMap();

		Services sv = (Services) request.getSession().getAttribute("service");
		if(sv == null) {
			sv = new Services();
			request.getSession().setAttribute("service", sv);
		}
		String typeProduct = request.getParameter("typeProduct");

		List<String> listBrandName = sv.listBrandName(typeProduct);
		List<Product> listProduct = sv.loadData(typeProduct, null);

		if (listPara.containsKey("priceLevel") && listPara.containsKey("nameBrand")) {
			String[] listParaPrice = listPara.get("priceLevel");
			int[] minmaxPrice = min_maxPrice(listParaPrice);
			String[] listParaBrand = listPara.get("nameBrand");
			listProduct = sv.filterByPriceAndBrandName(typeProduct, listParaBrand, minmaxPrice[0], minmaxPrice[1]);
		}

		if (!listPara.containsKey("priceLevel") && listPara.containsKey("nameBrand")) {
			String[] listParaBrand = listPara.get("nameBrand");
			listProduct = sv.loadData(typeProduct, listParaBrand);
		}

		if (listPara.containsKey("priceLevel") && !listPara.containsKey("nameBrand")) {
			String[] listParaPrice = listPara.get("priceLevel");
			int[] minmaxPrice = min_maxPrice(listParaPrice);
			listProduct = sv.filterByPrice(typeProduct, minmaxPrice[0], minmaxPrice[1]);
		}

		if (listPara.containsKey("sortby")) {
			String sortby = request.getParameter("sortby");
			String sortto = request.getParameter("sortto");
			if (sortby.equals("name")) {
				switch (sortto) {
				case "AZ": {
					listProduct = sv.sortByNameOrPrice(listProduct, true, true);
					break;
				}
				case "ZA": {
					listProduct = sv.sortByNameOrPrice(listProduct, true, false);
					break;
				}
				case "newPro": {
					Collections.reverse(listProduct);
					break;
				}
				}
			} else if (sortby.equals("price")) {
				switch (sortto) {
				case "AZ": {
					listProduct = sv.sortByNameOrPrice(listProduct, false, true);
					break;
				}
				case "ZA": {
					listProduct = sv.sortByNameOrPrice(listProduct, false, false);
					break;
				}
				}
			}
		}

		String typeName = "";
		switch (typeProduct) {
		case "TRAI CAY SACH": {
			typeName = "Trái cây sạch";
			break;
		}
		case "RAU CU QUA": {
			typeName = "Rau củ quả";
			break;
		}
		case "CAC LOAI HOA": {
			typeName = "Các loại hoa";
			break;
		}
		case "DO AN VAT": {
			typeName = "Đồ ăn vặt";
			break;
		}
		case "CHE BIEN SAN": {
			typeName = "Chế biến sẵn";
			break;
		}
		case "DAC SAN VUNG": {
			typeName = "Đặc sản vùng";
			break;
		}
		case "DO UONG": {
			typeName = "Các loại đồ uống";
			break;
		}
		case "GIA VI NGU COC": {
			typeName = "Gia vị ngũ cốc";
			break;
		}
		case "MY PHAM": {
			typeName = "Mỹ phẩm";
			break;
		}
		case "THIT CA": {
			typeName = "Thịt cá";
			break;
		}
		}
		request.setAttribute("typeName", typeName);
		request.setAttribute("typePro", typeProduct);
		request.setAttribute("listPro", listProduct);
		request.setAttribute("listBrand", listBrandName);
		getServletContext().getRequestDispatcher("/ShowListProduct.jsp").forward(request, response);

	}

	private int[] min_maxPrice(String[] list) {
		int[] res = new int[2];
		int minPrice = 99999999;
		int maxPrice = -99999999;
		for (String priceString : list) {
			switch (priceString) {
			case "Under100k": {
				minPrice = minPrice > 0 ? 0 : minPrice;
				maxPrice = maxPrice < 100000 ? 100000 : maxPrice;
				break;
			}
			case "From100kTo200k": {
				minPrice = minPrice > 100000 ? 100000 : minPrice;
				maxPrice = maxPrice < 200000 ? 200000 : maxPrice;
				break;
			}
			case "From200kTo300k": {
				minPrice = minPrice > 200000 ? 200000 : minPrice;
				maxPrice = maxPrice < 300000 ? 300000 : maxPrice;
				break;
			}
			case "From300kTo500k": {
				minPrice = minPrice > 300000 ? 300000 : minPrice;
				maxPrice = maxPrice < 500000 ? 500000 : maxPrice;
				break;
			}
			case "over500k": {
				minPrice = minPrice > 500000 ? 500000 : minPrice;
				maxPrice = Integer.MAX_VALUE;
				break;
			}
			}
		}
		res[0] = minPrice;
		res[1] = maxPrice;
		return res;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.Services;

import java.io.IOException;
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
		List<Product> listProduct;
		List<String> listBrandName;		
		String typeProduct = request.getParameter("typeProduct");
		Services sv = (Services) request.getSession().getAttribute("service");
		listProduct = sv.loadData(typeProduct,"");
		listBrandName = sv.listBrandName(typeProduct);
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
		case "4": {
			typeName = "Đồ ăn vặt";
			break;
		}
		case "5": {
			typeName = "Chế biến sẵn";
			break;
		}
		case "6": {
			typeName = "Đặc sản vùng";
			break;
		}
		case "DO UONG": {
			typeName = "Các loại đồ uống";
			break;
		}
		case "8": {
			typeName = "Gia vị ngũ cốc";
			break;
		}
		case "9": {
			typeName = "Mỹ phẩm";
			break;
		}
		case "10": {
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

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
		String typeProduct = request.getParameter("typeProduct");
		String typeId = request.getParameter("typeID");
		Services sv = (Services) request.getSession().getAttribute("service");
		List<Product> listProduct = sv.loadData(typeProduct);
		String typeName = "";
		switch (typeId) {
		case "1": {
			typeName = "Trái cây sạch";
			break;
		}
		case "2": {
			typeName = "Rau củ quả";
			break;
		}
		case "3": {
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
		case "7": {
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
		request.setAttribute("listPro", listProduct);
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

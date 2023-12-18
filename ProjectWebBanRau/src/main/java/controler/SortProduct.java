package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.Services;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class SortProduct
 */
public class SortProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Services sv = (Services) request.getSession().getAttribute("service");
		Map<String, String[]> listpara = request.getParameterMap();
		String typeProduct = "";
		List<Product> listProduct = null;
		
		if(listpara.containsKey("typeProduct")) {
			typeProduct = request.getParameter("typeProduct");
		}
		if(listpara.containsKey("byname")) {
			String byname = request.getParameter("byname");
			switch(byname) {
			case "AZ":{
				listProduct = sv.sortByNameOrPrice(sv.loadData(typeProduct, ""), true, true);
				break;
			}
			case "ZA":{
				listProduct = sv.sortByNameOrPrice(sv.loadData(typeProduct, ""), true, false);
				break;
			}
			case "newPro":{
				listProduct = sv.loadData(typeProduct, "");
				Collections.reverse(listProduct);
				break;
			}
			}
		}
		if(listpara.containsKey("byprice")) {
			String byname = request.getParameter("byprice");
			switch(byname) {
			case "AZ":{
				listProduct = sv.sortByNameOrPrice(sv.loadData(typeProduct, ""), false, true);
				break;
			}
			case "ZA":{
				listProduct = sv.sortByNameOrPrice(sv.loadData(typeProduct, ""), false, false);
				break;
			}
			}
		}
		request.setAttribute("typeName", typeProduct);
		request.setAttribute("typePro", typeProduct);
		request.setAttribute("listPro", listProduct);
		request.setAttribute("listBrand", sv.listBrandName(typeProduct));
		getServletContext().getRequestDispatcher("/ShowFilterListProduct.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

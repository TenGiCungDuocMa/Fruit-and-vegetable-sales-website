package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;
import model.Services;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

/**
 * Servlet implementation class Move_it_to_cart
 */
public class Move_it_to_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Move_it_to_cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Services sv = (Services) request.getSession().getAttribute("service");
		Cart cart = (Cart) request.getSession().getAttribute("cart");

		Map<String, String[]> listPara = request.getParameterMap();

		if (listPara.containsKey("Quantity") && listPara.containsKey("product_id")) {
			String quantity = request.getParameter("Quantity");
			String product_id = request.getParameter("product_id");
			cart.addProduct(product_id, Integer.parseInt(quantity));
		}

		if (listPara.containsKey("removeProduct")) {
			String rp = request.getParameter("removeProduct");
			cart.removeProduct(rp);
		}

		Iterator<Entry<String, Integer>> iter1 = cart.getProductInCart();
		request.setAttribute("listPro", iter1);
		
		Iterator<Entry<String, Integer>> iter2 = cart.getProductInCart();
		long totalMoney = 0;
		while (iter2.hasNext()) {
			Entry<String, Integer> i = iter2.next();
			totalMoney += sv.findProduct(i.getKey()).getPrice() * i.getValue();
		}
		request.setAttribute("totalMoney", totalMoney);

		getServletContext().getRequestDispatcher("/ShopingCart.jsp").forward(request, response);
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

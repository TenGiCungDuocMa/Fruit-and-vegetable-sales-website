package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.KhachHang;
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
		if (sv == null) {
			sv = new Services();
			request.getSession().setAttribute("service", sv);
		}
		Map<String, String[]> listPara = request.getParameterMap();
		KhachHang user = (KhachHang) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("ok", 3);
			getServletContext().getRequestDispatcher("/SignIn.jsp").forward(request, response);
			return;
		}
		if (listPara.containsKey("removeProduct")) {
			String pid = request.getParameter("removeProduct");
			sv.removeProductInCart(user.getUsername(), pid);
		}
		if (listPara.containsKey("Quantity") && listPara.containsKey("product_id")) {
			String quantity = request.getParameter("Quantity");
			String product_id = request.getParameter("product_id");
			sv.addToCart(user.getUsername(), product_id, Integer.parseInt(quantity));
		}

		Cart cart = sv.getProductFromCart(user.getUsername());
		Iterator<Entry<Product, Integer>> iter = cart.getProductInCart();
		long totalMoney = cart.totalMoney();
		
		if (listPara.containsKey("addCart")) {
			String pay = request.getParameter("addCart");
			if (pay.equals("Thanh toán")) {
				request.setAttribute("listPro", iter);
				request.setAttribute("totalMoney", totalMoney);
				getServletContext().getRequestDispatcher("/Checkout.jsp").forward(request, response);
				return;
			}
		}
		request.setAttribute("listPro", iter);
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

package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.KhachHang;
import model.Services;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Servlet implementation class LoginServlet
 */
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignInServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String[]> listpara = request.getParameterMap();
		if (listpara.containsKey("logout")) {
			request.getSession().invalidate();
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			String username = request.getParameter("nameUser");
			String password = request.getParameter("password");
			Services sv = (Services) request.getSession().getAttribute("service");
			boolean checked = sv.checkUser(username);
			if (checked) {
				KhachHang kh = sv.checkPassword(username, password);
				if (kh != null) {
					kh.setRolename(sv.getRoleUser(username));
					request.getSession().setMaxInactiveInterval(60); //set timeout of session
					request.getSession().setAttribute("user", kh);
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				} else {
					request.setAttribute("ok", 1);
					getServletContext().getRequestDispatcher("/SignIn.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("ok", 0);
				getServletContext().getRequestDispatcher("/SignIn.jsp").forward(request, response);
			}
		}
	}

}

package controler;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Services;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpServlet() {
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
		String username = request.getParameter("nameUser");
		String password = request.getParameter("password");
		String repass = request.getParameter("repassword");
		String name = request.getParameter("tenkh");
		String sdt = request.getParameter("sdt");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		Services sv = (Services) session.getAttribute("service");
		if(sv == null) {
			sv = new Services();
			request.getSession().setAttribute("service", sv);
		}
		if (sv.checkUser(username)) {
			request.setAttribute("ok", 0);
			getServletContext().getRequestDispatcher("/SignUp.jsp").forward(request, response);
		} else if (!password.equals(repass)) {
			request.setAttribute("ok", 1);
			getServletContext().getRequestDispatcher("/SignUp.jsp").forward(request, response);
		} else {
			boolean ok = sv.addUser(username, password, name, sdt, email, address);
			if (ok) {
				request.setAttribute("ok", 2);
				getServletContext().getRequestDispatcher("/SignIn.jsp").forward(request, response);
			}
		}
	}

}

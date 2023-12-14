package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Services;

import java.io.IOException;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/signup")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("nameUser");
		String password = request.getParameter("password");
		String repass = request.getParameter("repassword");
		String name = request.getParameter("tenkh");
		String sdt = request.getParameter("sdt");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		Services sv = (Services) session.getAttribute("service");
		System.out.println(sv.getInstance().toString());
//		if(!sv.checkUser(username)) {
//			response.getWriter().println("<script>alert('Tài khoản đã tồn tại!') </script>");
//			return;
//		}
//		if (!password.equals(repass)) {
//			response.getWriter().println("<script>alert('Mật khẩu không trùng khớp!') </script>");
//			return;
//		}
//		
//		sv.addUser(username, password, name, sdt, email);
		getServletContext().getRequestDispatcher("/SignIn.jsp").forward(request, response);
	}

}

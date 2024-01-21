package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Services;

import java.io.IOException;

/**
 * Servlet implementation class ChangePasswordServlet
 */
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Services sv = (Services) request.getSession().getAttribute("service");
		if (sv == null) {
			sv = new Services();
			request.getSession().setAttribute("service", sv);
		}
		String uname = request.getParameter("uname");
		String newpass = request.getParameter("newpass");
		String renewpass = request.getParameter("renewpass");
		if(newpass.equals(renewpass)) {
			boolean ok = sv.changepassword(uname, newpass);
			if(ok) {
				request.setAttribute("ok", 4);
				getServletContext().getRequestDispatcher("/SignIn.jsp").forward(request, response);

			} 
		}else {
			request.setAttribute("ok", 0);
			request.setAttribute("uname", uname);
			getServletContext().getRequestDispatcher("/ChangePassword.jsp").forward(request, response);
		}
	}

}

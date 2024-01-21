package controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Services;

import java.io.IOException;
import java.util.Map;
import java.util.Random;

/**
 * Servlet implementation class recoverPassword
 */
public class recoverPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public recoverPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Services sv = (Services) request.getSession().getAttribute("service");
		if (sv == null) {
			sv = new Services();
			request.getSession().setAttribute("service", sv);
		}
		Map<String, String[]> listpara = request.getParameterMap();
		if (listpara.containsKey("nameUser") && listpara.containsKey("emailConfirm")) {
			String username = request.getParameter("nameUser");
			String email = request.getParameter("emailConfirm");
			boolean checked = sv.checkUser(username);
			if (checked) {
				// random mã xác nhận ngẫu nhiên có 6 chữ số và lưu giá trị cho biến
				// verificationCode
				int codenum = new Random().nextInt(100000, 999999);
				sv.saveVerificationCode(username, codenum);
				sv.sendMail(email, String.valueOf(codenum));
				request.setAttribute("mail", email);
				request.setAttribute("uname", username);
				getServletContext().getRequestDispatcher("/Verification.jsp").forward(request, response);

			} else {
				request.setAttribute("ok", 0);
				getServletContext().getRequestDispatcher("/ForgetPassword.jsp").forward(request, response);

			}
		}
		if (listpara.containsKey("numcode") && listpara.containsKey("uname")) {
			String uname = request.getParameter("uname");
			int numcode = Integer.parseInt(request.getParameter("numcode"));
			int vercode = sv.getVerificationCode(uname);
			if (vercode == numcode) {
				request.setAttribute("uname", uname);
				getServletContext().getRequestDispatcher("/ChangePassword.jsp").forward(request, response);

			}else {
				String email = request.getParameter("emailConfirm");
				request.setAttribute("uname", uname);
				request.setAttribute("ok", 0);
				request.setAttribute("mail", email);
				getServletContext().getRequestDispatcher("/Verification.jsp").forward(request, response);

			}
		}
	}

}

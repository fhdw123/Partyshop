package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.SqlConnection;
import classes.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/bestellen")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String act = request.getParameter("act");
			if(act.equals("order"))
			{
				HttpSession session=request.getSession(false);
				request.setAttribute("cart", session.getAttribute("cart"));
				User u = (User) session.getAttribute("user");
				request.setAttribute("user", u);
				
				String nextJSP = "/bestellen.jsp";
	        	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
	        	dispatcher.forward(request,response);  
			}
			
		}
		catch(Exception e)
		{
			
		}
	}

}

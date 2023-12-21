package com.login.verify;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.usersetup.UserSetup;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	LoginValidationDao lv=new LoginValidationDao();

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside doget");
		PrintWriter out=response.getWriter();
		try
		{
		LoginValidationDao log=new LoginValidationDao();	
		AdminAndUser au=new AdminAndUser();	
		au.setAdminId(request.getParameter("adminId"));
		au.setAdminPassword(request.getParameter("adminPassword"));
		int i=log.valid(au);
		if(i>0)
		{
			
			response.sendRedirect("HomePage.html");
		}
		else
		{
			UserSetup us=new UserSetup();
			us.setUserId(request.getParameter("adminId"));
			us.setUserPassword(request.getParameter("adminPassword"));
			int j=log.userValid(us);
			if(j>1)
			{
				request.setAttribute("CorptId", j);
				RequestDispatcher view=request.getRequestDispatcher("FrontOfficeHomepage.jsp");
				view.forward(request, response);
			}
			
			else
			{
				response.sendRedirect("LoginError.jsp");
			}
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
}
}

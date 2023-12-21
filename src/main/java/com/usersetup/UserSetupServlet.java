package com.usersetup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSetupServlet
 */
@WebServlet("/UserSetupServlet")
public class UserSetupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	UserSetupDao usd=new UserSetupDao();
    public UserSetupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		System.out.println(action);
		switch(action)
		{
		case "add":
			insert(request,response);
		    break;
		case "modify":
			modify(request,response);
			break;
		case "delete":
			delete(request,response);
		    break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserSetup us=new UserSetup();
		us.setCorporateId(Integer.parseInt(request.getParameter("corporateId")));
		us.setUserId(request.getParameter("loginId"));
		us.setUserPassword(request.getParameter("password"));
		us.setDepartment(request.getParameter("DepartmentName"));
		us.setAddress(request.getParameter("Address"));
		us.setPhoneNumber(Long.parseLong(request.getParameter("phoneNumber")));
		us.setDeleteStatus(0);
		us.setNewUser(0);
		int i=usd.add(us);
		if(i>0){
			response.sendRedirect("UserPage/AddUser-success.jsp");
				}  
		 else{ response.sendRedirect("UserPage/AddUser-error.jsp");
	}
	}
	protected void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserSetup us=new UserSetup();
		us.setUserId(request.getParameter("userid"));
		us.setDepartment(request.getParameter("department"));
		us.setAddress(request.getParameter("Address"));
		us.setPhoneNumber(Long.parseLong(request.getParameter("PhoneNumber")));
		int i=usd.modify(us);
		if(i>0)
		{
			response.sendRedirect("UserPage/ModifyUser-success.jsp");
		}
		else {
			response.sendRedirect("UserPage/ModifyUser-error.jsp");
		}
	}
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId=request.getParameter("Userid");
		int i=usd.delete(userId);
		  if(i>0){
			  response.sendRedirect("UserPage/Deleteuser-success.jsp");
		  }else
		  { response.sendRedirect("UserPage/DeleteUser-error.jsp"); }
		}
}

package com.corporate;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CorporateServlet
 */
@WebServlet("/CorporateServlet")
public class CorporateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	CorporateDao corpt=new CorporateDao();
    public CorporateServlet() {
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
		Corporate co=new Corporate();
		co.setCorporateName(request.getParameter("CorporateName"));
		co.setAddress(request.getParameter("Address"));
		co.setPhoneNumber(Long.parseLong(request.getParameter("PhoneNumber")));
		co.setDeleteStatus(0);
		int i=corpt.add(co);
		if(i>0){
			response.sendRedirect("CorporatePage/addCorporate-success.jsp");
				}  
		 else{ response.sendRedirect("CorporatePage/addCorporate-error.jsp");
	}
	}
	
	protected void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Corporate co=new Corporate();
		co.setCorporateId(Integer.parseInt(request.getParameter("id")));
		co.setAddress(request.getParameter("Address"));
		co.setPhoneNumber(Long.parseLong(request.getParameter("PhoneNumber")));
		int i=corpt.modify(co);
		if(i>0)
		{
			response.sendRedirect("CorporatePage/Modify_success.jsp");
		}
		else {
			response.sendRedirect("CorporatePage/Modify_error.jsp");
		}
		
	}
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("CorporateId"));
		 
		  int i=corpt.delete(id);
		  if(i>0){
			  response.sendRedirect("CorporatePage/Delete_success.jsp");
		  }else
		  { response.sendRedirect("CorporatePage/adduser-error.jsp"); }
		}
	
}

package com.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	AccountDao accdao=new AccountDao();
    public AccountServlet() {
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
			add(request,response);
		    break;
		case "close":
			close(request,response);
		    break;
		}
	}

	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Account acc=new Account();
		acc.setCorporateId(Integer.parseInt(request.getParameter("corporateId")));
		acc.setAccNumber(Long.parseLong(request.getParameter("accountNumber")));
		acc.setAccName(request.getParameter("accountName"));
		acc.setCurrency(request.getParameter("currency"));
		acc.setBranch(request.getParameter("branch"));
		acc.setAvBalance(Double.parseDouble(request.getParameter("availableBalance")));
		acc.setStatus("status");
		int i=accdao.add(acc);
		if(i>0)
		{
			response.sendRedirect("AccountPage/AddAccount-success.jsp");
		}
		else
		{
			response.sendRedirect("AccountPage/AddAccount-error.jsp");
		}
		
		
	}
	protected void close(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long Accnum=Long.parseLong(request.getParameter("AccountNumber"));
		int i=accdao.close(Accnum);
		if(i>0){
			  response.sendRedirect("AccountPage/CloseAccount-success.jsp");
		  }
		else
		  { 
			response.sendRedirect("AccountPage/CloseAccount-error.jsp"); 
			}
		
	}

}

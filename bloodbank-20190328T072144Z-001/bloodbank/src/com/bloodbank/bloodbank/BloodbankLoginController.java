package com.bloodbank.bloodbank;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BloodbankLoginController")
public class BloodbankLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String login_id = req.getParameter("login_id");
		String password = req.getParameter("password");
		int id = new BloodbankDao().loginBloodbank(login_id, password);
		if (id != 0) {
			HttpSession hs = req.getSession();
			hs.setAttribute("bloodbank_id", id);
			resp.sendRedirect("bloodbankhome.jsp");
		} else {
			
			resp.sendRedirect("login.jsp");
	    	
		}

	}
}

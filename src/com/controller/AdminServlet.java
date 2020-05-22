package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Contact;
import com.beans.Movie;
import com.service.AdminService;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		if(id==null) {
			request.setAttribute("msg", "");
			request.setAttribute("username", "");
			request.getRequestDispatcher("adminpages/login.jsp").forward(request, response);
		}
		else {
			doPost(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		List<Movie>list=new ArrayList();
		AdminService adminService =new AdminService();
	
		if(id.equals("login")) {
			//read validate and then send to homepage.jsp
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			if(username.equals("aryak")&&password.equals("123")) {
				request.getRequestDispatcher("adminpages/mainpage.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "INVLID CREDENTIALS!!");
				request.setAttribute("username", "");
				request.getRequestDispatcher("adminpages/login.jsp").forward(request, response);

			}
		}
		if(id.equals("createMovie")) {
			String movie_name=request.getParameter("movie_name");
			String path=request.getParameter("path");
			int category_id=Integer.parseInt(request.getParameter("category"));
			String movie_type=request.getParameter("type");
			String movie_release_date=request.getParameter("release_date");
			String description=request.getParameter("description");
			Movie m=new Movie();
			m.setCategory_id(category_id);
			m.setDescription(description);
			m.setMovie_release_date(movie_release_date);
			m.setMovie_type(movie_type);
			m.setMovie_name(movie_name);
			
			try {
				System.out.println("Came in servlet");
				adminService.insertMovie(m,path);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				list=adminService.fetchMovies();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("adminpages/display.jsp").forward(request, response);

			
		}
		
		/*
		if(id.equals("fetchMovies")) {
			try {
				System.out.println("Came in get image block of servlet");
				List<Movie>list=new ArrayList();
				list=adminService.fetchMovies();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
		if(id.equals("checkmessages")) {
			List<Contact>listContact=new ArrayList();
		    try {
				listContact=adminService.getAllContacts();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("listContact", listContact);
			
			request.getRequestDispatcher("adminpages/admin-messages.jsp").forward(request, response);
		}
	}

}

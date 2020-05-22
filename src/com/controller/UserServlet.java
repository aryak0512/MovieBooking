package com.controller;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*; 
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Customer;
import com.beans.Movie;
import com.beans.Theatre;
import com.service.UserService;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		UserService userService =new UserService();
		List<Movie>list=new ArrayList();
		if(id==null) {
			try {
				list=userService.fetchMovies();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.setAttribute("msg","");
			request.getRequestDispatcher("userpages/user-home.jsp").forward(request,response);
		}
		else {
			doPost(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		UserService userService =new UserService();
		List<Movie>list=new ArrayList();
		
		if(id.equals("viewmoviedetails")) {
			String Mid=request.getParameter("mid");
			int mid=Integer.parseInt(Mid);
			try {
				list=userService.getMovieDetails(mid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("userpages/user-viewdetails.jsp").forward(request,response);
			
		}
		if(id.equals("booktickets")) {
			String Mid=request.getParameter("mid");
			int mid=Integer.parseInt(Mid);
			try {
				list=userService.getMovieDetails(mid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("mid", mid);
			request.setAttribute("list", list);
			request.getRequestDispatcher("userpages/user-booktickets.jsp").forward(request,response);
			
		}
		
		if(id.equals("selectseats")) {
			
			int mid=Integer.parseInt(request.getParameter("mid"));
			String fname=request.getParameter("fname");
			String lname=request.getParameter("lname");
			String email=request.getParameter("email");
			String location=request.getParameter("locality");
			String phone=request.getParameter("phone");
			System.out.println(phone);
            int cust_id = 0;
			Customer c=new Customer();
			c.setName(fname+" "+lname);
			c.setLocation(location);
			c.setEmail(email);
			c.setMobile(phone);
			c.setMovie_id(mid);
			try {
				userService.insertCustomerData(c);
				
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				cust_id=userService.getCustomerId(fname+" "+lname);
				
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}	
			
			List movieData=new ArrayList();
			try {
				movieData=userService.getMovieDetails(mid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			List theatreData=new ArrayList();
			try {
				theatreData=userService.getTheatreData(location);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("cust_id", cust_id);
			request.setAttribute("mid", mid);
			request.setAttribute("movieData", movieData);
			request.setAttribute("theatreData", theatreData);
			request.setAttribute("msg", "");
			request.getRequestDispatcher("userpages/user-selectTheatre.jsp").forward(request,response);
			
		}
		
		if(id.equals("book_seats")) {
			int mid=Integer.parseInt(request.getParameter("mid"));
			int cid=Integer.parseInt(request.getParameter("cust_id"));
			List<Theatre>theatreData=new ArrayList();
			int tid=Integer.parseInt(request.getParameter("theatre"));
			try {
				theatreData=userService.getTheatreData(tid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("theatreData",theatreData);
			request.setAttribute("cid",cid);
			request.setAttribute("mid",mid);
			request.setAttribute("tid",tid);
			request.setAttribute("msg","");
			request.getRequestDispatcher("userpages/user-seatmap.jsp").forward(request,response);
		}
		
		if(id.equals("seats_confirm")) {
			
			String[] seats = null;
			int cid=Integer.parseInt(request.getParameter("cid"));
			int mid=Integer.parseInt(request.getParameter("mid"));
			int tid=Integer.parseInt(request.getParameter("tid"));
			List<Theatre>theatreData=new ArrayList();
			
			try {
				theatreData=userService.getTheatreData(tid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				seats=request.getParameterValues("seat");
				
				for(String seat:seats) {
					userService.insertSeat(cid,seat);
				}
				
			}
			catch(Exception e) {
				request.setAttribute("theatreData",theatreData);
				request.setAttribute("cid",cid);
				request.setAttribute("mid",mid);
				request.setAttribute("tid",tid);
				request.setAttribute("msg", "PLEASE SELECT ATLEAST ONE SEAT.");
				request.getRequestDispatcher("userpages/user-seatmap.jsp").forward(request,response);
			}
			
			String date=request.getParameter("date");
			String time=request.getParameter("time");
			try {
				userService.insertTheatre(cid,tid);
	
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//bill logic
			int platinum=0;
			int gold=0;
			int silver=0;
			int no_of_seats=seats.length;
			for(String s:seats) {
				
				if(s.substring(0,1).equals("P")) {
					platinum++;
					continue;
				}
				else if(s.substring(0,1).equals("G")) {
					gold++;
					continue;
				}
				else if(s.substring(0,1).equals("S")) {
					silver++;
					continue;
				}
			}
		    double bill=platinum*450+350*gold+250*silver;
			System.out.println(bill);
			List<Movie>movieData=new ArrayList();			
			List<Theatre>theatreData1=new ArrayList();
			List<Customer>custData=new ArrayList();
			
			String email = null;
			 try {
				 movieData=userService.getMovieDetails(mid);
				 theatreData=userService.getTheatreData(tid);
				 custData=userService.getCustomerData(cid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	 
			for(Customer c:custData) {
				email=c.getEmail();
			}
			
			
			
			String email_content=userService.createMessage(custData,theatreData,movieData,seats,time,date,bill);
			userService.sendEmail(email,email_content);
			
			request.setAttribute("date",date);
			request.setAttribute("time",time);
			request.setAttribute("bill",bill);
			request.setAttribute("custData",custData);
			request.setAttribute("theatreData",theatreData);
			request.setAttribute("movieData",movieData);
			request.setAttribute("seats",seats);
			request.getRequestDispatcher("userpages/user-overview.jsp").forward(request,response);
			
		}
		
		if(id.equals("filledcontactform")) {
        	
        	String name=request.getParameter("name");
        	String email=request.getParameter("email");
        	String message=request.getParameter("message");
        	
        	
        	
        	try {
				userService.insertContact(name,email,message);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
        	request.setAttribute("msg","Thanks. Response recorded.");
        	try {
				list=userService.fetchMovies();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list", list);
        	request.getRequestDispatcher("userpages/user-home.jsp").forward(request, response);
        }
		
	
	}

}

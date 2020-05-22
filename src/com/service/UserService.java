package com.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;  

import com.beans.Customer;
import com.beans.Movie;
import com.beans.Theatre;
import com.model.DBConfig;

public class UserService {
	DBConfig db=new DBConfig();
	private Properties emailProperties;
	private Session mailSession;
	private MimeMessage emailMessage;
	public List<Movie> fetchMovies() throws ClassNotFoundException, SQLException, IOException {
		return db.fetchMovies();
		
	}

	public List<Movie> getMovieDetails(int mid) throws ClassNotFoundException, SQLException, IOException {
		return db.getMovieDetails(mid);
	}

	public List getTheatreData(String location) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getTheatreData(location);
	}

	public void insertCustomerData(Customer c) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.insertCustomerData(c);
		
	}

	public int getCustomerId(String string) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getCustomerId(string);
	}

	public List<Theatre> getTheatreData(int tid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getTheatreData(tid);
	}

	public List<Customer> getCustomerData(int cid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getCustomerData(cid);
	}

	public void insertTheatre(int cid,int tid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.insertTheatre(cid,tid);
		
	}

	public void sendEmail(String email, String email_content) {
		Properties props = new Properties();
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
	      
		
		String to= email;

	      // Sender's email ID needs to be mentioned
	      String user = "aryaksbookmyshow@gmail.com";
          String pass="bookmyshow";
	      
	      Session session = Session.getInstance(props,new javax.mail.Authenticator() {
	    	  protected PasswordAuthentication getPasswordAuthentication() {
	    		  return new  PasswordAuthentication(user,pass);
	    	  }
	      });
	      
	      try {
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);
	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(user));
	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	         // Set Subject: header field
	         message.setSubject("BOOKING CONFIRMATION");
	         // Now set the actual message
	         message.setContent(email_content, "text/html");
	         // Send message
	         Transport.send(message);
	         System.out.println("Sent message successfully....");
	      } catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	   }

	public void insertContact(String name, String email, String message) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.insertContact(name,email,message);
		
	}

	public void insertSeat(int cid, String seat) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.insertSeat(cid,seat);
		
	}

	public String createMessage(List<Customer> custData, List<Theatre> theatreData, List<Movie> movieData,
			String[] seats, String show_time, String show_date, double bill) {
		// TODO Auto-generated method stub
		
		String cust_name = "";
		String theatre_name ="";
		String theatre_address = "";
		String 	theatre_contact = "";
		String movie_name = "";
		for(Movie m:movieData) {
			movie_name=m.getMovie_name();
		}
		String seat_set="";
		for(String s:seats) {
			seat_set=seat_set+s+", ";
		}
		for(Customer c:custData) {
			cust_name=c.getName();
		}
		for(Theatre t:theatreData) {
			theatre_name=t.getName();
			theatre_address=t.getAddress();
			theatre_contact=t.getContact();	
		}
		String message ="<b>Hi, "+cust_name+"</b><br>";
		
		message += "Greetings from <font color=red>Aryak's BookMyShow!</font><br>";
        message += "<p>This is a confirmation email for your movie booking.</p>";
        message += "Your Movie: "+"<b><font color=red>"+movie_name+"</font></b><br><br>";
        message += "<u><b>THEATRE DETAILS:</b></u><br>";
        message += "Venue name: "+"<b><font color=black>"+theatre_name+"</font></b><br>";
        message += "Venue address: "+"<b><font color=black>"+theatre_address+"</font></b><br>";
        message += "Venue contact: "+"<b><font color=black>"+theatre_contact+"</font></b><br>";
        message += "Your seats: "+"<b><font color=black>"+seat_set+"</font></b><br>"; 
        message += "Show Date: "+"<b><font color=black>"+show_date+"</font></b><br>";
        message += "Show timing: "+"<b><font color=black>"+show_time+"</font></b><br>";
        message += "Total amount payable: "+"<b><font color=black>Rs. "+bill+"</font></b><br><br>";
        message += "<font color=red><b>NOTE:</b></font> The above amount is to be paid only in cash at the respective venue.<br>";
        message += "We hope you have a great time!!<br><br>";
        message += "Regards,<br> <font color=red>Aryak's BookMyShow</font>";
        
        return message;
	}
		

	

}

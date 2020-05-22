package com.model;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.beans.Contact;
import com.beans.Customer;
import com.beans.Movie;
import com.beans.Theatre;


public class DBConfig {
	//Step 1 : declare all variables 
		String url="jdbc:mysql://localhost:3306/bookmyshow";
		String username="root";
		String password="";
		String driver="com.mysql.jdbc.Driver";
		Connection conn;
		
		//Step 2
		private void dbConnect() throws ClassNotFoundException, SQLException{
			//Load the driver
			Class.forName(driver);
			//establish the connection
			conn = DriverManager.getConnection(url, username, password);
		}



		public List<Movie> fetchMovies() throws ClassNotFoundException, SQLException, IOException {
			dbConnect();
			
			String sql="select * from movies";
			 //Step 3: creating the statement
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 //step 4: executing the statement
			 ResultSet rst = pstmt.executeQuery();
			 List<Movie>list=new ArrayList();
			 while(rst.next()){
				 int movie_id=rst.getInt("id");
				 String movie_name=rst.getString("name");
				 int category_id=rst.getInt("category_id");
				 String description=rst.getString("description");
				 //getting poster in string form 
				 Blob blobImage = rst.getBlob("poster");
				 InputStream inputStream = blobImage.getBinaryStream();
				 ByteArrayOutputStream outputStream =new ByteArrayOutputStream();
				 byte[]buffer=new byte[4096];
				 int bytesRead=-1;
				 while((bytesRead=inputStream.read(buffer))!=-1) {
					 outputStream.write(buffer,0,bytesRead);
				 }
				 
				 byte[]imageBytes=outputStream.toByteArray();
				 
				 String poster =Base64.getEncoder().encodeToString(imageBytes);
				 String movie_type=rst.getString("type");
				 String movie_release_date=rst.getString("released");
				 
				 Movie m=new Movie();
				 m.setMovie_id(movie_id);
				 m.setMovie_name(movie_name);
				 m.setCategory_id(category_id);
				 m.setDescription(description);
				 m.setPoster(poster);
				 m.setMovie_type(movie_type);
				 m.setMovie_release_date(movie_release_date);
				 list.add(m);
				 
			 }
			 rst.close();
			 pstmt.close();
			 return list;
		}

		public void insertMovie(Movie m, String path) throws SQLException, IOException, ClassNotFoundException {
			// TODO Auto-generated method stub
			// TODO Auto-generated method stub
			dbConnect();			
			File file =new File(path);
			FileInputStream fileInputStream =new FileInputStream(file);
			String sql="insert into movies(name,category_id,description,poster,type,released,photo)values(?,?,?,?,?,?,?)";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m.getMovie_name());
			pstmt.setInt(2,m.getCategory_id());
			pstmt.setString(3,m.getDescription());
			pstmt.setString(7,file.getName());
			pstmt.setBinaryStream(4,fileInputStream,fileInputStream.available());
			pstmt.setString(5,m.getMovie_type());
			pstmt.setString(6,m.getMovie_release_date());
			pstmt.executeUpdate();	 
		}



		public List<Movie> getMovieDetails(int mid) throws ClassNotFoundException, SQLException, IOException {
			dbConnect();
			
			String sql="select * from movies where id=?";
			 //Step 3: creating the statement
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 //step 4: executing the statement
			 pstmt.setInt(1, mid);
			 ResultSet rst = pstmt.executeQuery();
			 List<Movie>list=new ArrayList();
			 while(rst.next()){
				 int movie_id=rst.getInt("id");
				 String movie_name=rst.getString("name");
				 int category_id=rst.getInt("category_id");;
				 String description=rst.getString("description");
				 //getting poster in string form 
				 Blob blobImage = rst.getBlob("poster");
				 InputStream inputStream = blobImage.getBinaryStream();
				 ByteArrayOutputStream outputStream =new ByteArrayOutputStream();
				 byte[]buffer=new byte[4096];
				 int bytesRead=-1;
				 while((bytesRead=inputStream.read(buffer))!=-1) {
					 outputStream.write(buffer,0,bytesRead);
				 }
				 
				 byte[]imageBytes=outputStream.toByteArray();
				 
				 String poster =Base64.getEncoder().encodeToString(imageBytes);
				 String movie_type=rst.getString("type");
				 String movie_release_date=rst.getString("released");
				 
				 Movie m=new Movie();
				 m.setMovie_id(movie_id);
				 m.setMovie_name(movie_name);
				 m.setCategory_id(category_id);
				 m.setDescription(description);
				 m.setPoster(poster);
				 m.setMovie_type(movie_type);
				 m.setMovie_release_date(movie_release_date);
				 list.add(m);
				 
			 }
			 rst.close();
			 pstmt.close();
			 return list;
			
		}



		public List getTheatreData(String location) throws SQLException, ClassNotFoundException {
			dbConnect();
			
			String sql="select * from theatres where location='"+location+"'";
			 //Step 3: creating the statement
			 
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 //step 4: executing the statement
			 ResultSet rst = pstmt.executeQuery();
			 List <Theatre>theatreData=new ArrayList();
			 while(rst.next()){
				 int id=rst.getInt("id");
				 String name=rst.getString("name");
				 String address=rst.getString("address");
				 String contact=rst.getString("contact"); 
				 Theatre t=new Theatre();
				 t.setId(id);
				 t.setName(name);
				 t.setLocation(location);
				 t.setAddress(address);
				 t.setContact(contact);
				 theatreData.add(t);
				 
			 }
			 rst.close();
			 pstmt.close();
			 for(Theatre r:theatreData) {
				 System.out.println(r);
			 }
			 return theatreData;
			
		}



		public void insertCustomerData(Customer c) throws ClassNotFoundException, SQLException {
			dbConnect();			
			int cust_id = 0;
			String sql="insert into customer(name,location,movie_id,mobile,email)values(?,?,?,?,?)";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,c.getName());
			pstmt.setString(2,c.getLocation());
			pstmt.setInt(3,c.getMovie_id());
			pstmt.setString(4,c.getMobile());
			pstmt.setString(5, c.getEmail());
			pstmt.executeUpdate();
		
			
		}



		public int getCustomerId(String string) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			dbConnect();
			int cust_id=0;
			String sql="select id from customer where name=?";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,string);
			ResultSet rst = pstmt.executeQuery();
			while(rst.next()){
			   cust_id=rst.getInt("id");
			}
			return cust_id ;
		}



		public List<Theatre> getTheatreData(int tid) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			dbConnect();
			List <Theatre> theatreData=new ArrayList();
			String sql="select * from theatres where id=?";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,tid);
			ResultSet rst = pstmt.executeQuery();
			while(rst.next()){
			   String name=rst.getString("name");
			   String address=rst.getString("address");
			   String contact=rst.getString("contact");
			   Theatre t=new Theatre();
			   t.setAddress(address);
			   t.setName(name);
			   t.setContact(contact);
			   theatreData.add(t);
			}
			rst.close();
			return theatreData;
		}



		public List<Customer> getCustomerData(int cid) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			dbConnect();
			List <Customer> custData=new ArrayList();
			String sql="select * from customer where id=?";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cid);
			ResultSet rst = pstmt.executeQuery();
			while(rst.next()){
				String name=rst.getString("name");
				String location=rst.getString("location");
				String email=rst.getString("email");
				Customer c=new Customer();
				c.setEmail(email);
				c.setLocation(location);
				c.setName(name);
				custData.add(c);
			
			}
			return custData;
		}



		public void insertTheatre(int cid,int tid) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			dbConnect();			
			
			String sql="update customer set tid=? where id=?";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,tid);
			pstmt.setInt(2,cid);
			pstmt.executeUpdate();
		}



		public void insertContact(String name, String email, String message) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			dbConnect();			
			
			String sql="insert into contact(name,email,comment) values(?,?,?)";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			pstmt.setString(3,message);
			pstmt.executeUpdate();
		}

		public List<Contact> getAllContacts() throws SQLException, ClassNotFoundException {
			 dbConnect();
			 String sql="select * from contact";
			 //Step 3: creating the statement
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 //step 4: executing the statement
			 ResultSet rst = pstmt.executeQuery();
			 List<Contact> list = new ArrayList<>();
			 while(rst.next()){
				 int id = rst.getInt("id");
				 String name = rst.getString("name");
				 String email = rst.getString("email");
				
				 String comment = rst.getString("comment");
				 Contact c = new Contact();
				 c.setId(id);
				 c.setName(name);
				 c.setEmail(email);
				 
				 c.setComment(comment);
				 list.add(c);
				 
			 }
			 rst.close();
			 pstmt.close();
			 return list;
		}



		public void insertSeat(int cid, String seat) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			dbConnect();			
			
			String sql="insert into seats(cust_id,seat) values(?,?)";
			//Step 3: creating the statement
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cid);
			pstmt.setString(2,seat);
			
			pstmt.executeUpdate();
		}
		
		
		
		
		

}

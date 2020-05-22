package com.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.beans.Contact;
import com.beans.Movie;
import com.model.DBConfig;

public class AdminService {
    DBConfig db=new DBConfig();

	public List<Movie> fetchMovies() throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		return db.fetchMovies();
	}

	public void insertMovie(Movie m, String path) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		db.insertMovie(m,path);
		
	}

	public List<Contact> getAllContacts() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getAllContacts();
	}

}

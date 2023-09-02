package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection con; 
	 
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			
			String query = "insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
			PreparedStatement ps = this.con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassWord());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.executeUpdate();
			flag = true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	
	//get user email and password
	public User getUserByEmailAndPassword(String email,String password) {
		User user = null;
		try {
			
			String query = "Select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassWord(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				user.setAbout(rs.getString("about"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean  flag = false;
		try {
			String query = "update user set name=?, email=?, password=?, gender=?, about=?,profile=? where id = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassWord());	
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.setString(6,user.getProfile());
			ps.setInt(7, user.getId());
			int n = ps.executeUpdate();
			
			if(n!=0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}

}

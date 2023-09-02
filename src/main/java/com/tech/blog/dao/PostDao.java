package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	private Connection con;
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<Category>();
		
		try {
			String query = "Select * from catagories";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category category = new Category(cid, name, description);
				list.add(category);
			}
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean flag = false; 
		
		try {
			String query = "Insert into posts (p_title,p_content,p_code,p_pic,c_id,user_id) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, post.getP_titile());
			ps.setString(2, post.getP_content());
			ps.setString(3, post.getP_code());
			ps.setString(4, post.getP_pic());
			ps.setInt(5, post.getC_id());
			ps.setInt(6, post.getUser_id());
			
			int n = ps.executeUpdate();
			if(n!= 0)
				return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	public List<Post>getAllPostDetails(){
		List<Post> list = new ArrayList<Post>();
		try {
			String query = "Select * from posts order by pid";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			 int postId = rs.getInt("pid");
			 String postTitle= rs.getString("p_title");
			 String postContent = rs.getString("p_content");
			 String postCode = rs.getString("p_code");
			 String postPic  =rs.getString("p_pic");
			 Timestamp postDate = rs.getTimestamp("p_date");
			 int postCategoryId = rs.getInt("c_id");
			 int userId = rs.getInt("user_id");
			 Post p = new Post(postId, postTitle, postContent, postCode, postPic, postDate, postCategoryId, userId);
			 list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public List<Post>getPostByCatId(int catId){
		List<Post> list = new ArrayList<Post>();
		try {
			String query = "Select * from posts where c_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, catId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			 int postId = rs.getInt("pid");
			 String postTitle= rs.getString("p_title");
			 String postContent = rs.getString("p_content");
			 String postCode = rs.getString("p_code");
			 String postPic  =rs.getString("p_pic");
			 Timestamp postDate = rs.getTimestamp("p_date");
//			 int postCategoryId = rs.getInt("c_id");
			 int userId = rs.getInt("user_id");
			 Post p = new Post(postId, postTitle, postContent, postCode, postPic, postDate, catId, userId);
			 list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Post getPostByPostId(int pid) {
		Post post = null;
		try {
			String query = "SELECT * FROM POSTS WHERE pid=?";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
//				int postId = rs.getInt("pid");
				 String postTitle= rs.getString("p_title");
				 String postContent = rs.getString("p_content");
				 String postCode = rs.getString("p_code");
				 String postPic  =rs.getString("p_pic");
				 Timestamp postDate = rs.getTimestamp("p_date");
				 int postCategoryId = rs.getInt("c_id");
				 int userId = rs.getInt("user_id");
				 post = new Post(pid, postTitle, postContent, postCode, postPic, postDate,postCategoryId,userId);
			}
			
			
		} catch (Exception e) {
			
		}
		return post;
		
	}
}

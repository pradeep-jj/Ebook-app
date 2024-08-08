package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.user;
public class UserDAOImpl implements UserDAO   {
	private Connection conn;
	
	public UserDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean userRegister(user us) {
		boolean f = false;
		// TODO Auto-generated method stub
		try {
			String sql="insert into user(name,email,phno,adress,city,state,pincode,password) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getAdress());
			ps.setString(5, us.getCity());
			ps.setString(6, us.getState());
			ps.setString(7, us.getPincode());
			ps.setString(8, us.getPassword());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
				System.out.println("Query updated");
			}else {
				System.out.println("Qurry not updated");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public user login(String email, String password) {
		// TODO Auto-generated method stub
		user us=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new user();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setAdress(rs.getString(5));
				us.setCity(rs.getString(6));
				us.setState(rs.getString(7));
				us.setPincode(rs.getString(8));
				us.setPassword(rs.getString(9));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return us;
	}
	
	public user getUserById(int id) {
		// TODO Auto-generated method stub
		user us=null;
		try {
			String sql="select * from user where userid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new user();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setAdress(rs.getString(5));
				us.setCity(rs.getString(6));
				us.setState(rs.getString(7));
				us.setPincode(rs.getString(8));
				us.setPassword(rs.getString(9));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return us;
	}

	
	
	
	public boolean checkEmail(String email) {
		boolean f=true;
		try {
			String sql="select * from user where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				f=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean userUpdateProfile(user us) {
		boolean f = false;
		// TODO Auto-generated method stub
		try {
			String sql="update user set name=?,email=?,phno=?,adress=?,city=?,state=?,pincode=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getAdress());
			ps.setString(5, us.getCity());
			ps.setString(6, us.getState());
			ps.setString(7, us.getPincode());
			ps.setInt(8, us.getId());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<user> getAllUser(){
		List<user> list=new ArrayList<user>();
		user us=null;
		try {
			String sql="select * from user";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new user();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setAdress(rs.getString(5));
				us.setCity(rs.getString(6));
				us.setState(rs.getString(7));
				us.setPincode(rs.getString(8));
				us.setPassword(rs.getString(9));
				list.add(us);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public boolean checkEmailForForgot(String email) {
		boolean f = false;
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}

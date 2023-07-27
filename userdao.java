/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;
import java.sql.*;
import com.techblog.entities.*;
/**
 *
 * @author Lenovo
 */
public class userdao {
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }
    public void save(User user){
        try{
        var q="insert into user2(username,email,password,gender) values(?,?,?,?)";
        PreparedStatement ptsmt=this.con.prepareStatement(q);
        ptsmt.setString(1,user.getUsername());
        ptsmt.setString(2,user.getEmail());
        ptsmt.setString(3,user.getPassword());
        ptsmt.setString(4,user.getGender());
        ptsmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public User getemailandpassword(String email,String password){
        User user=null;
        try{
            String q="select * from user2 where password=? or email=?  ";
            PreparedStatement ptsmt=con.prepareStatement(q);
            ptsmt.setString(1, password);
            ptsmt.setString(2, email);
            ResultSet set=ptsmt.executeQuery();
            if(set.next()){
                user=new User();
                user.setId((int)set.getInt("id"));
                user.setEmail((String)set.getString("email"));
                user.setUsername(( String)set.getString("username"));
                user.setPassword((String)set.getString("password"));
                user.setGender((String)set.getString("gender"));
                System.out.println("dds");
                return user;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return user;
    }
    public boolean updatedetails(User user){
        
        try{
            String q=" update user2 set username=? , email=? , password=? where id=?";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1,user.getUsername());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setInt(4,user.getId());
            pstmt.executeUpdate();
            System.out.println("true");
            return true;
            
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
}

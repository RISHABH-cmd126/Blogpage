/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;
import java.sql.*;
/**
 *
 * @author Lenovo
 */
public class checkdata {
    private Connection con;
    String name,email;

    public checkdata(Connection con, String name, String email) {
        this.con = con;
        this.name = name;
        this.email = email;
    }
    public checkdata(Connection con) {
        this.con=con;
    }
    public int check(){
        try{
            String q="select * from user2";
            PreparedStatement stmt=con.prepareStatement(q);
            String n,e;
           ResultSet set=stmt.executeQuery();
           while(set.next()){
               n=set.getString("username");
               e=set.getString("email");
               if(name.equals(n)&&email.equals(e)){
                   System.out.println("true");
                   return 1; 
               }
               if(name.equals(n)){
                   System.out.println("true2");
                   return 2; 
               }
               if(email.equals(e)){
                   System.out.println("true3");
                   return 3; 
               }
               System.out.println("sddf");
               
           }
          
            
            
        }catch(Exception e){
            System.out.println(e);
        }
        
        return 0;
    }
}

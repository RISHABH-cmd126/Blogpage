/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.helper;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Lenovo
 */
public class connectionprovider {
    public static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return con;
    }
    
}

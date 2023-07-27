/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;
import java.sql.*;
/**
 *
 * @author Lenovo
 */
public class like {
    private Connection con;

    public like(Connection con) {
        this.con = con;
    }
    public boolean insert(int pid,int uid){
        boolean f=false;
        try{
            String q= "insert into likesystem(pid,uid) values(?,?)";
            PreparedStatement ptmst=con.prepareStatement(q);
            ptmst.setInt(1, pid);
            ptmst.setInt(2,uid);
            ptmst.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public int count(int pid){
        int count=0;
        try{
            String q= "select count(*) from likesystem where pid="+pid;
            PreparedStatement ptmst=con.prepareStatement(q);
          
            ResultSet set=ptmst.executeQuery();
            if(set.next()){
                count=set.getInt("count(*)");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    public boolean isliked(int pid,int uid){
        boolean f=false;
        try{
            String q="select * from likesystem where pid=? and uid=?";
            PreparedStatement ptsmt=con.prepareStatement(q);
            ptsmt.setInt(1, pid);
            ptsmt.setInt(2, uid);
            ResultSet set=ptsmt.executeQuery();
            if(set.next()){
                f=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean dislike(int pid,int uid){
        boolean f=false;
        try{
            PreparedStatement ptsmt=con.prepareStatement("delete from likesystem where pid=? and uid=?");
           ptsmt.setInt(1, pid);
            ptsmt.setInt(2, uid);
            ptsmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
}

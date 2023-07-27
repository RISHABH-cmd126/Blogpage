/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import com.techblog.entities.post;
import com.techblog.entities.category;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Lenovo
 */
public class postdao {

    private Connection con;

    public postdao() {
    }

    public postdao(Connection con) {
        this.con = con;
    }

    public List<category> getAllCategory() {
        List<category> list = new ArrayList();
        try {
            String q = "select * from categories";
            Statement stmt = this.con.createStatement();
            ResultSet set = stmt.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("id");
                String name = set.getString("name");
                String description = set.getString("description");
                category c = new category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean addpost(post p) {
        boolean f = false;
        try {
            String q = "insert into post(ptitle,pcontent,pcode,ppic,catid,user_id) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getPpic());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUser_id());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public List<post> getallpost() {
        List<post> list1 = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery("select * from post order by pid desc");
            while (set.next()) {
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                int catid = set.getInt("catid");
                int userid = set.getInt("user_id");
                post p = new post(pid, ptitle, pcontent, ppic, pcode, catid, userid);
                list1.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;
    }

    public List<post> getcidpost(int cid) {
        List<post> list1 = new ArrayList<>();
        try {
            PreparedStatement stmt = con.prepareStatement("select * from post where catid=" + cid);

            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                int catid = set.getInt("catid");
                int userid = set.getInt("user_id");
                post p = new post(pid, ptitle, pcontent, ppic, pcode, catid, userid);
                list1.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;
    }

    public post getpidpost(int pid) {
        post p = null;
        try {
            PreparedStatement stmt = con.prepareStatement("select * from post where pid=" + pid);

            ResultSet set = stmt.executeQuery();
            while (set.next()) {

                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                int catid = set.getInt("catid");
                int userid = set.getInt("user_id");
                p = new post(ptitle, pcontent, ppic, pcode, catid, userid);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    public String getname(int id) {
        String s = null;
        String q="select username from user2 where id= "+id;
        try{
        PreparedStatement ptsmt=con.prepareStatement(q);
        ResultSet set=ptsmt.executeQuery();
        if(set.next()){
            s=set.getString("username");
        }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return s;
    }

}
